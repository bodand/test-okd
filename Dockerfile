# A hivatalos Python 3.12 Alpine image használata
FROM docker.io/python:3.12-alpine

# Munkakönyvtár beállítása
WORKDIR /app

# (Ide jöhet majd a pip install -r requirements.txt lépés)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# A te kódod bemásolása
COPY . /app

# ========================================================
# OKD / OPENSHIFT SPECIFIKUS JOGOSULTSÁG BEÁLLÍTÁS
# ========================================================
# Mivel az OKD random UID-vel futtatja a konténert (nem rootként), 
# az ismeretlen felhasználónak a "root" (0) csoport tagjaként 
# kell tudnia olvasni/írni a munkakönyvtárat.
RUN chgrp -R 0 /app && \
    chmod -R g=u /app

# Biztonságos alapértelmezett nem-root felhasználó beállítása
# (Az OKD ezt futásidőben úgyis felülírja egy random UID-vel, 
# de a sima Docker teszteléshez ez egy jó gyakorlat)
USER 1001

# Alapértelmezett futtatási parancs (cseréld a sajátodra)
EXPOSE 5000
CMD ["python", "app.py"]

