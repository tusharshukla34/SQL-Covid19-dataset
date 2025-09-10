# before i start working on my data i will export a copy of it  
-- done

use covidresearch;
show tables;

describe countries;
select * from countries;
-- The countries table contain three column country_id as pri key, location and iso_code
-- ISO (International Organization for Standardization)
-- I have data of 20 different countries

describe vaccinations;
select * from vaccinations limit 20 offset 1100;
-- The vaccination_data table contains vaciination_id as pri key, country_id and date as foreign key,
-- total_vaccinations, people_vaccinated, people_fully_vaccinted, total_boosters, daily_vacciantion and daily_people_vaccinated
-- i have data of one year
-- vaccination_id            → Row number (just ID for each record).
-- country_id                → Which country this data belongs to.
-- date                      → The day of the record.
-- total_vaccinations        → Total doses given till that day.
-- people_vaccinated         → People who got at least 1 dose.
-- people_fully_vaccinated   → People who got all required doses.
-- total_boosters            → Booster doses given till that day.
-- daily_vaccinations        → Doses given on that day only.
-- daily_people_vaccinated   → New people who got their first dose that day.



describe vaccinations_metrics;
select * from vaccinations_metrics limit 10 offset 337;
-- The vaccination_metrics table contains metrics as pri key, vaccination_id as foreign key, total_vaccination_per_hundered,
-- people_vaccinated_per_hundered, people_fully_vaccinated_per_hundered, total_boosters_per_hundered, daily_vaccination_per_million,
-- daily_people_vacinated_per_hundered

# now i will update the table name and column name for convinence

# update table name
rename table vaccination_data to vaccinations;
rename table vaccination_metrics to vaccinations_metrics;

# update column name of table vaccinations
alter table vaccinations rename column total_vaccinations to total_doses;
alter table vaccinations rename column people_vaccinated to atleast_one_dose;
alter table vaccinations rename column people_fully_vaccinated to fully_vaccinated;
alter table vaccinations rename column total_boosters to  booster_doses;
alter table vaccinations rename column daily_vaccinations to daily_doses;
alter table vaccinations rename column daily_people_vaccinated to daily_first_dose;
select * from vaccinations;

# update column name of table vaccinations_metrics
alter table vaccinations_metrics rename column total_vaccinations_per_hundred to doses_per_100;
alter table vaccinations_metrics rename column people_vaccinated_per_hundred to one_dose_per_100;
alter table vaccinations_metrics rename column people_fully_vaccinated_per_hundred to fully_vaccinated_per_100;
alter table vaccinations_metrics rename column total_boosters_per_hundred to booster_per_100;
alter table vaccinations_metrics rename column daily_vaccinations_per_million to daily_doses_per_million;
alter table vaccinations_metrics rename column daily_people_vaccinated_per_hundred to daily_first_dose_per_100;
select * from vaccinations_metrics;