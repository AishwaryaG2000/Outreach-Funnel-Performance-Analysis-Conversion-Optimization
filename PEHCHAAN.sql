SELECT* FROM data;
SELECT* FROM DATES_1;

--TOTAL NUMBER OF CONTACTS
SELECT COUNT(*) FROM DATA; ------552

--TOTAL NUMBER OF COLLEGE SOCIETY
SELECT COUNT (DISTINCT PROFILE) FROM DATA;-----10

SELECT DISTINCT PROFILE FROM DATA;--"Stationary", "Small Business", "Online business", "Small business", "Restaurant" "Cafe", "School", "College Society"0, "placement cell", "Bakery "

--NUMBER OF LEADS FROM RESPECTIVE PROFILES
SELECT COUNT(*)
FROM DATA
WHERE PROFILE = 'Stationary';----43

SELECT COUNT(*)
FROM DATA
WHERE profile = 'Small Business';----197

SELECT COUNT(*)
FROM DATA
WHERE profile = 'Online business';---1

SELECT COUNT(*)
FROM DATA
WHERE profile = 'Small business';---40

SELECT COUNT(*)
FROM DATA
WHERE profile = 'Restaurant';----21
"Cafe", "School", "College Society", "placement cell", "Bakery "

SELECT COUNT(*)
FROM DATA
WHERE profile='Cafe';--2

SELECT COUNT(*)
FROM DATA
WHERE profile='School';---3

SELECT COUNT(*)
FROM DATA
WHERE profile='College Society';---232

SELECT COUNT(*)
FROM DATA
WHERE profile='placement cell';----1

SELECT COUNT(*)
FROM DATA
WHERE profile='Bakery';----12

SELECT NAMES, PROFILE FROM DATA
ORDER BY 2;

--MAXIMUM LEADS FROM COLLEGE SOCIETY, SMALL BUSINESS, STATIONARY, RESTRAUNTS

SELECT COUNT(INSTA_LINK)-----419
FROM DATA;

SELECT COUNT(linkedin_link)-----25
FROM DATA;

SELECT COUNT(OTHER_LINK)----90
FROM DATA;

SELECT DISTINCT CHANNEL_1 "Instagram"
FROM DATA;
"Facebook"
"LinkedIn"
"Email"
"Phone number"
"College website"

SELECT* FROM DATA;
SELECT COUNT(*)
FROM DATA
WHERE REPLIED_OR_NOT = 'YES';----33

SELECT* FROM DATA;
SELECT COUNT(*)
FROM DATA
WHERE REPLIED_OR_NOT = 'NO';----518

---RESPONSE RATE 
SELECT 
COUNT(*) FILTER (WHERE "replied_or_not" = 'YES') * 100.0 / COUNT(*) AS response_rate
FROM DATA;-------------------5.9782608695652174


----REPLIES BY CHANNEL

SELECT "channel_1", COUNT(*)
FROM DATA
WHERE "replied_or_not" = 'YES'
GROUP BY "channel_1"
ORDER BY COUNT(*) DESC;-----"Instagram"	32

SELECT "channel_2", COUNT(*)
FROM DATA
WHERE "replied_or_not" = 'YES'
GROUP BY "channel_2"
ORDER BY COUNT(*) DESC;-----------"Phone Number, 8", "Email: 4", "Website"	3, "Facebook"	3

----replies by profile
SELECT "profile", 
COUNT(*)
FROM DATA
WHERE "replied_or_not" = 'YES'
GROUP BY "profile"
ORDER BY COUNT(*) DESC;----"Small Business"	19
"Stationary"	7
"Small business"	3
"College Society"	2
"Online business"	1
"Restaurant"	1

-----CONTACT AVAIBALITY ANALYSIS
SELECT
COUNT(*) FILTER (WHERE email IS NOT NULL) AS email_available,
COUNT(*) FILTER (WHERE "insta_link" IS NOT NULL) AS insta_available,
COUNT(*) FILTER (WHERE "linkedin_link" IS NOT NULL) AS linkedin_available
FROM data;

----count of collaborations 

SELECT* FROM DATA;

SELECT COUNT(*)
FROM DATA
WHERE RESPONSE = 'YES';-------13


SELECT 
COUNT(*) FILTER (WHERE "response" = 'YES') * 100.0 / COUNT(*) filter (WHERE "replied_or_not"='YES') AS REPLIED
FROM DATA;---------------------39.3939393939393939

SELECT "profile", 
COUNT(*)
FROM DATA
WHERE "response" = 'YES'
GROUP BY "profile"
ORDER BY COUNT(*) DESC;----"Small Business"	10
"Restaurant"	1
"Small business"	1
"Stationary"	1


SELECT* FROM DATa; 

SELECT COUNT(*)
FROM DATES_1
WHERE RESPONSE_DATE IS NOT NULL;------34

-----AVERAGE RESPONSE TIME

SELECT 
names,
contact_date,
response_date,
response_date - contact_date AS diff_days
FROM dates_1
WHERE response_date - contact_date < 0;


truncate table dates_1;

select* from dates_1
where response_date is not nulL;

SELECT 
names,
response_date - contact_date AS response_days
FROM datES_1;

SELECT 
AVG(response_date - contact_date) AS AVERAGE_RESPONSE_DAYS-----5.0882352941176471
FROM DATES_1;


ALTER TABLE DATES_1
ADD COLUMN response_days= response_date - contact_date;

ALTER TABLE datES_1
ADD COLUMN response_days INTEGER;

UPDATE datES_1
SET response_days = response_date - contact_date;

SELECT* FROM DATES_1;

SELECT NAMES
FROM DATES_1
WHERE response_days>5.0882352941176471;

SELECT 
MIN(response_date - contact_date) AS QUICKEST_RESPONSE ----1 DAY
FROM DATES_1;

SELECT NAMES 
FROM DATES_1
WHERE response_days=1;-------Wrap it up

SELECT* FROM DATA
WHERE NAMES= 'Wrap it up';---Online business, CHANNEL = INSTA

SELECT 
MAX(response_date - contact_date) AS LATE_RESPONSE ----10 DAY
FROM DATES_1;

SELECT NAMES 
FROM DATES_1
WHERE response_days=10;---SoapyGramz
SELECT* FROM DATA
WHERE NAMES= 'SoapyGramz';----Small Business, CHANNEL= INSTA