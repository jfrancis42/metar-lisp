# metar-lisp
A Common Lisp client for pulling METAR data from the AVWX REST API.

This library pulls METAR and TAF data from the AVWX public REST
API. The owner of this site (not me) makes this data freely available,
but welcomes (voluntary) donations if you use this data for profit (or
even if you don't). Documentation on this service is available from:

https://avwx.rest/documentation

Use of the API is about as simple as it can get. There are two calls
supported by this package, metar and taf, both of which require an
ICAO airport identifier as the only parameter. Both supply all
possible parameters to the AVWX API (see their docs for details) in
order to return the maximum amount of possible data:

````
CL-USER> (metar:metar "KSEA")
((:*ALTIMETER . "2997") (:*CLOUD-*LIST ("OVC" "045")) (:*DEWPOINT . "15")
 (:*FLIGHT-*RULES . "VFR")
 (:*INFO (:*CITY . "Seattle") (:*COUNTRY . "USA") (:*ELEVATION . "132")
  (:+IATA+ . "SEA") (:+ICAO+ . "KSEA") (:*LATITUDE . "47.44988889")
  (:*LONGITUDE . "-122.3117778")
  (:*NAME . "Seattle-Tacoma International Airport") (:*PRIORITY . "0")
  (:*STATE . "WA"))
 (:*OTHER-*LIST "FU")
 (:*RAW-*REPORT
  . "KSEA 061553Z 18003KT 6SM FU OVC045 19/15 A2997 RMK AO2 SLP153 FU OVC045 T01940150")
 (:*REMARKS . "RMK AO2 SLP153 FU OVC045 T01940150")
 (:*REMARKS-*INFO (:*DEW-*DECIMAL . "15.0") (:*TEMP-*DECIMAL . "19.4"))
 (:*RUNWAY-*VIS-*LIST)
 (:*SPEECH
  . "Winds one eight zero at 3kt. Visibility six miles. Temperature one nine degrees Celsius. Dew point one five degrees Celsius. Altimeter two nine point nine seven. Smoke. Overcast layer at 4500ft")
 (:*STATION . "KSEA")
 (:*SUMMARY
  . "Winds S-180 at 03kt, Vis 6sm, Temp 19C, Dew 15C, Alt 29.97inHg, Smoke, Overcast layer at 4500ft")
 (:*TEMPERATURE . "19") (:*TIME . "061553Z")
 (:*TRANSLATIONS (:*ALTIMETER . "29.97inHg (1015hPa)")
  (:*CLOUDS . "Overcast layer at 4500ft - Reported AGL")
  (:*DEWPOINT . "15C (59F)") (:*OTHER . "Smoke") (:*TEMPERATURE . "19C (66F)")
  (:*VISIBILITY . "6sm (9.7km)") (:*WIND . "S-180 at 03kt"))
 (:*UNITS (:*ALTIMETER . "inHg") (:*ALTITUDE . "ft") (:*TEMPERATURE . "C")
  (:*VISIBILITY . "sm") (:*WIND-*SPEED . "kt"))
 (:*VISIBILITY . "6") (:*WIND-*DIRECTION . "180") (:*WIND-*GUST . "")
 (:*WIND-*SPEED . "03") (:*WIND-*VARIABLE-*DIR))
CL-USER> 
````

````
CL-USER> (metar:taf "KSEA")
((:*FORECAST
  ((:*ALTIMETER . "") (:*CLOUD-*LIST ("OVC" "045")) (:*END-*TIME . "0718")
   (:*FLIGHT-*RULES . "VFR") (:*ICING-*LIST) (:*OTHER-*LIST)
   (:*PROBABILITY . "") (:*RAW-*LINE . "0615/0718 18005KT P6SM OVC045")
   (:*START-*TIME . "0615")
   (:*SUMMARY
    . "Winds S-180 at 05kt, Vis greater than 6sm, Overcast layer at 4500ft")
   (:*TURB-*LIST) (:*TYPE . "BASE") (:*VISIBILITY . "P6")
   (:*WIND-*DIRECTION . "180") (:*WIND-*GUST . "") (:*WIND-*SHEAR . "")
   (:*WIND-*SPEED . "05"))
  ((:*ALTIMETER . "") (:*CLOUD-*LIST) (:*END-*TIME . "0617")
   (:*FLIGHT-*RULES . "VFR") (:*ICING-*LIST) (:*OTHER-*LIST "FU")
   (:*PROBABILITY . "") (:*RAW-*LINE . "TEMPO 0615/0617 6SM FU")
   (:*START-*TIME . "0615") (:*SUMMARY . "Vis 6sm, Smoke, Sky clear")
   (:*TURB-*LIST) (:*TYPE . "TEMPO") (:*VISIBILITY . "6")
   (:*WIND-*DIRECTION . "") (:*WIND-*GUST . "") (:*WIND-*SHEAR . "")
   (:*WIND-*SPEED . ""))
  ((:*ALTIMETER . "") (:*CLOUD-*LIST ("SCT" "060") ("BKN" "250"))
   (:*END-*TIME . "0705") (:*FLIGHT-*RULES . "VFR") (:*ICING-*LIST)
   (:*OTHER-*LIST) (:*PROBABILITY . "")
   (:*RAW-*LINE . "FM062000 25006KT P6SM SCT060 BKN250")
   (:*START-*TIME . "0620")
   (:*SUMMARY
    . "Winds WSW-250 at 06kt, Vis greater than 6sm, Scattered clouds at 6000ft, Broken layer at 25000ft")
   (:*TURB-*LIST) (:*TYPE . "FROM") (:*VISIBILITY . "P6")
   (:*WIND-*DIRECTION . "250") (:*WIND-*GUST . "") (:*WIND-*SHEAR . "")
   (:*WIND-*SPEED . "06"))
  ((:*ALTIMETER . "") (:*CLOUD-*LIST ("SCT" "120") ("OVC" "250"))
   (:*END-*TIME . "0713") (:*FLIGHT-*RULES . "VFR") (:*ICING-*LIST)
   (:*OTHER-*LIST) (:*PROBABILITY . "")
   (:*RAW-*LINE . "FM070500 20005KT P6SM SCT120 OVC250")
   (:*START-*TIME . "0705")
   (:*SUMMARY
    . "Winds S-200 at 05kt, Vis greater than 6sm, Scattered clouds at 12000ft, Overcast layer at 25000ft")
   (:*TURB-*LIST) (:*TYPE . "FROM") (:*VISIBILITY . "P6")
   (:*WIND-*DIRECTION . "200") (:*WIND-*GUST . "") (:*WIND-*SHEAR . "")
   (:*WIND-*SPEED . "05"))
  ((:*ALTIMETER . "") (:*CLOUD-*LIST ("OVC" "007")) (:*END-*TIME . "0718")
   (:*FLIGHT-*RULES . "IFR") (:*ICING-*LIST) (:*OTHER-*LIST)
   (:*PROBABILITY . "") (:*RAW-*LINE . "FM071300 18004KT P6SM OVC007")
   (:*START-*TIME . "0713")
   (:*SUMMARY
    . "Winds S-180 at 04kt, Vis greater than 6sm, Overcast layer at 700ft")
   (:*TURB-*LIST) (:*TYPE . "FROM") (:*VISIBILITY . "P6")
   (:*WIND-*DIRECTION . "180") (:*WIND-*GUST . "") (:*WIND-*SHEAR . "")
   (:*WIND-*SPEED . "04")))
 (:*INFO (:*CITY . "Seattle") (:*COUNTRY . "USA") (:*ELEVATION . "132")
  (:+IATA+ . "SEA") (:+ICAO+ . "KSEA") (:*LATITUDE . "47.44988889")
  (:*LONGITUDE . "-122.3117778")
  (:*NAME . "Seattle-Tacoma International Airport") (:*PRIORITY . "0")
  (:*STATE . "WA"))
 (:*MAX-*TEMP . "") (:*MIN-*TEMP . "")
 (:*RAW-*REPORT
  . "KSEA 061528Z 0615/0718 18005KT P6SM OVC045 TEMPO 0615/0617 6SM FU FM062000 25006KT P6SM SCT060 BKN250 FM070500 20005KT P6SM SCT120 OVC250 FM071300 18004KT P6SM OVC007")
 (:*REMARKS . "") (:*STATION . "KSEA") (:*TIME . "061528Z")
 (:*TRANSLATIONS
  (:*FORECAST
   ((:*ALTIMETER . "") (:*CLOUDS . "Overcast layer at 4500ft - Reported AGL")
    (:*ICING . "") (:*OTHER . "") (:*TURBULANCE . "")
    (:*VISIBILITY . "Greater than 6sm ( >9999m )") (:*WIND . "S-180 at 05kt")
    (:*WIND-*SHEAR . ""))
   ((:*ALTIMETER . "") (:*CLOUDS . "Sky clear") (:*ICING . "")
    (:*OTHER . "Smoke") (:*TURBULANCE . "") (:*VISIBILITY . "6sm (9.7km)")
    (:*WIND . "") (:*WIND-*SHEAR . ""))
   ((:*ALTIMETER . "")
    (:*CLOUDS
     . "Scattered clouds at 6000ft, Broken layer at 25000ft - Reported AGL")
    (:*ICING . "") (:*OTHER . "") (:*TURBULANCE . "")
    (:*VISIBILITY . "Greater than 6sm ( >9999m )") (:*WIND . "WSW-250 at 06kt")
    (:*WIND-*SHEAR . ""))
   ((:*ALTIMETER . "")
    (:*CLOUDS
     . "Scattered clouds at 12000ft, Overcast layer at 25000ft - Reported AGL")
    (:*ICING . "") (:*OTHER . "") (:*TURBULANCE . "")
    (:*VISIBILITY . "Greater than 6sm ( >9999m )") (:*WIND . "S-200 at 05kt")
    (:*WIND-*SHEAR . ""))
   ((:*ALTIMETER . "") (:*CLOUDS . "Overcast layer at 700ft - Reported AGL")
    (:*ICING . "") (:*OTHER . "") (:*TURBULANCE . "")
    (:*VISIBILITY . "Greater than 6sm ( >9999m )") (:*WIND . "S-180 at 04kt")
    (:*WIND-*SHEAR . "")))
  (:*MAX-*TEMP . "") (:*MIN-*TEMP . ""))
 (:*UNITS (:*ALTIMETER . "inHg") (:*ALTITUDE . "ft") (:*TEMPERATURE . "C")
  (:*VISIBILITY . "sm") (:*WIND-*SPEED . "kt")))
CL-USER>
````

The returned options are explained int he AVWX documentation page
(link above), and can be easily referenced as an alist:

````
CL-USER> (cdr (assoc :*altimeter (metar:metar "KSEA")))
"2997"
CL-USER> (cdr (assoc :*temperature (metar:metar "KSEA")))
"19"
CL-USER> (cdr (assoc :*raw-*report (metar:metar "KSEA")))
"KSEA 061553Z 18003KT 6SM FU OVC045 19/15 A2997 RMK AO2 SLP153 FU OVC045 T01940150"
CL-USER> 
````
