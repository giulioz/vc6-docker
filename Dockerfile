FROM ubuntu:jammy

RUN dpkg --add-architecture i386 && apt update && apt install -y wine wine32 wget p7zip-full

RUN mkdir -p /opt/vc && cd /opt/vc && \
  wget -O vc.7z https://winworldpc.com/download/c39228e2-80ba-715d-2411-c3a4c2a90f70/from/c39ac2af-c381-c2bf-1b25-11c3a4e284a2 && \
  7z x vc.7z && \
  mkdir -p /opt/vc/setup && cd /opt/vc/setup && \
  7z x '../Microsoft Visual C++ 6.0 Standard.iso' && \
  rm ../*.iso ../*.txt ../*.7z && \
  mv VC98/* .. && \
  cp -r COMMON/MSDEV98/BIN/* ../BIN

RUN \
  mv /opt/vc/CRT/SRC/ALGRITHM /opt/vc/CRT/SRC/ALGORITHM && \
  mv /opt/vc/CRT/SRC/FCTIONAL /opt/vc/CRT/SRC/FUNCTIONAL && \
  mv /opt/vc/CRT/SRC/MAKEFILE /opt/vc/CRT/SRC/EXT_MKF && \
  mv /opt/vc/CRT/SRC/MAKEFILE.INC /opt/vc/CRT/SRC/EXT_MKF.INC && \
  mv /opt/vc/CRT/SRC/MAKEFILE.SUB /opt/vc/CRT/SRC/EXT_MKF.SUB && \
  mv /opt/vc/CRT/SRC/STDXCEPT /opt/vc/CRT/SRC/STDEXCEPT && \
  mv /opt/vc/CRT/SRC/STREAMBF /opt/vc/CRT/SRC/STREAMBUF && \
  mv /opt/vc/CRT/SRC/STRSTREM /opt/vc/CRT/SRC/STRSTREAM && \
  mv /opt/vc/CRT/SRC/XCEPTION /opt/vc/CRT/SRC/EXCEPTION && \
  mv /opt/vc/INCLUDE/ALGRITHM /opt/vc/INCLUDE/ALGORITHM && \
  mv /opt/vc/INCLUDE/FCTIONAL /opt/vc/INCLUDE/FUNCTIONAL && \
  mv /opt/vc/INCLUDE/STDXCEPT /opt/vc/INCLUDE/STDEXCEPT && \
  mv /opt/vc/INCLUDE/STREAMBF /opt/vc/INCLUDE/STREAMBUF && \
  mv /opt/vc/INCLUDE/STRSTREM /opt/vc/INCLUDE/STRSTREAM && \
  mv /opt/vc/INCLUDE/XCEPTION /opt/vc/INCLUDE/EXCEPTION && \
  mv /opt/vc/INCLUDE/EVNCPTSI.C /opt/vc/INCLUDE/EVENTCPTS_I.C && \
  mv /opt/vc/INCLUDE/EVNTCPTS.H /opt/vc/INCLUDE/EVENTCPTS.H && \
  mv /opt/vc/INCLUDE/MTSEVNTS.H /opt/vc/INCLUDE/MTSEVENTS.H && \
  mv /opt/vc/INCLUDE/MTSEVT_I.C /opt/vc/INCLUDE/MTSEVENTS_I.C && \
  mv /opt/vc/INCLUDE/MTXADM_I.C /opt/vc/INCLUDE/MTXADMIN_I.C && \
  mv /opt/vc/INCLUDE/OLEDBSPC.HH /opt/vc/INCLUDE/OLEDB11SPEC.HH && \
  mv /opt/vc/INCLUDE/SDKPRBLD.MAK /opt/vc/INCLUDE/SDKPROPBLD.MAK && \
  mv /opt/vc/INCLUDE/SCRDDT_I.C /opt/vc/INCLUDE/SCARDDAT_I.C && \
  mv /opt/vc/INCLUDE/SCRMGR_I.C /opt/vc/INCLUDE/SCARDMGR_I.C && \
  mv /opt/vc/INCLUDE/SCRSRV_I.C /opt/vc/INCLUDE/SCARDSRV_I.C && \
  mv /opt/vc/INCLUDE/SSPSDL_I.C /opt/vc/INCLUDE/SSPSID_I.C

RUN wine winver

COPY setup.bat /opt/vc/setup.bat
WORKDIR /opt/vc
CMD wine cmd /k setup.bat
