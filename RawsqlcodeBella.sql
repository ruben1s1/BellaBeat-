--SELECT * 
--FROM DBO.Activity
SELECT *
FROM bellabeat..Sleep
WHERE ID = '1503960366'
--reformating activity table orginal table to
SELECT 
ceiling(TotalDistance) as TotalDistance 
from BellaBeat..Activity
WHERE ID = '1503960366'

SELECT ID, 
Cast(SUM(TotalDistance) as decimal (10,1)) as TotalDistance, 
CAST(SUM(VeryActiveDistance)as decimal (10,0)) as TotalVeryActiveDistance, 
CAST(SUM(ModeratelyActiveDistance)as decimal (10,0)) as TotalModeratelyActiveDistance,
CAST(SUM(LightActiveDistance) as decimal (10,0)) as TotalLightActiveDistance,
CAST(SUM(SedentaryActiveDistance)as decimal (10,0)) as TotalSedentaryActiveDistance
From BellaBeat..Activity
Group BY id 
order By id asc
---CAST(SUM(Calories) as decimal (10,0)) as TotalCalories 
SELECT ID, 
Cast(SUM(TotalDistance) as decimal (10,1)) as TotalDistance
From BellaBeat..Activity
Group BY id 
order by id asc

--Average table for distance in Activity database

CREATE TABLE #AverageDistance 


--Average for Activity per ID 

SELECT DISTINCT ID,
CAST(AVG(Calories) as decimal (10,0)) as AVGCalories,
Cast(sum(TotalSteps) as decimal (10,0)) as TotalSteps, 
Cast(sum(TotalDistance) as decimal (10,1)) as TotalDistance, 
CAST(AVG(VeryActiveDistance)as decimal (10,1)) as VeryActiveDistance, 
CAST(AVG(ModeratelyActiveDistance)as decimal (10,1)) as ModeratelyActiveDistance,
CAST(AVG(LightActiveDistance) as decimal (10,1)) as LightActiveDistance,
CAST(AVG(SedentaryActiveDistance) as decimal (10,1)) as SedentaryActtiveDistance ,
CAST(AVG(VeryActiveMinutes)as decimal (10,1)) as VeryActiveMinutes ,
CAST(AVG(FairlyActiveMinutes) as decimal (10,1)) as ModeratelyActiveMinutes ,
CAST(AVG(LightlyActiveMinutes)  as decimal (10,1)) as LightActiveMinutes,
CAST(AVG(SedentaryMinutes) as decimal (10,1)) as SedentaryActiveMinutes
From BellaBeat..Activity
--WHERE ID = '1503960366'
Group BY id 
Order By AVGCalories DESC

---Analysis of Sleep Data 
-- Average of Total minutes asleep,TotalTimeinBed, Minutes Untill sleep by ID

 
 SELECT *
FROM bellabeat..Sleep
WHERE ID = '1503960366'
 
 
 SELECT Distinct 
 Id, 
CAST(AVG(totalMinutesAsleep) as decimal (10,0)) AS AverageMinutesAsleep , 
 CAST(AVG (totalTimeinBed)as decimal (10,0)) AS AverageTimeinBed,
 CAST(AVG(MinutesUntillAsleep)as decimal (10,0)) AS AverageMinutesUntillAsleep 
 From BellaBeat..Sleep 
 Group BY Id

 --
  SELECT Distinct 
 Id, date,    
SUM (totalTimeinBed) AS SumTimeinBed ,
SUM(totalMinutesAsleep) AS SumMinutesAsleep , 
SUM(MinutesUntillAsleep) AS SumMinutesUntillAsleep 
 From BellaBeat..Sleep 
 Group BY Id 
 order by id desc

 ---Activity analysis 
SELECT *
from BellaBeat..Activity

SELECT Distinct Id, 
sum(Calories) as TotalCalories,
Cast(sum(TotalSteps) as decimal (10,0)) as TotalSteps, 
Cast(sum(TotalDistance) as decimal (10,1)) as TotalDistance
from BellaBeat..Activity
Group By Id
Order by TotalCalories desc
--order by 2,4

SELECT Distinct Id, 
AVG(Calories) as AVGTotalCalories,
Cast(AVG(TotalSteps) as decimal (10,0)) as AVGTotalSteps, 
Cast(AVG(TotalDistance) as decimal (10,1)) as AVGTotalDistance
from BellaBeat..Activity
WHERE ID = '1503960366'
Group By Id

---Use only Very,Moderate and Lightly Active Distance 

Select Id, totaldistance, VeryActiveDistance,
(veryactivedistance/(nullif(TotalDistance,0)*100 
from BellaBeat..Activity

--Order by AVGTotalCalories desc
--Merging tables 

Select case 
from BellaBeat..Activity
when totaldistance = '0'
then null
else veryactivedistance/totaldistance
end as test 

Select *
from BellaBeat..Activity act
join BellaBeat..Sleep slp
on act.date= slp.date
and act.Id=slp.Id


Select act.Id, act.date, act.Calories, act.TotalDistance, act.TotalSteps, slp.TotalMinutesAsleep
from BellaBeat..Activity act
join BellaBeat..Sleep slp
on act.date= slp.date
and act.Id=slp.Id
order by act.Calories desc

SELECT DISTINCT ID,
CAST(sum(Calories) as decimal (10,0)) as SumCalories,
Cast(sum(TotalSteps) as decimal (10,0)) as TotalSteps, 
Cast(sum(TotalDistance) as decimal (10,1)) as TotalDistance, 
CAST(sum(VeryActiveDistance)as decimal (10,1)) as VeryActiveDistance, 
CAST(sum(ModeratelyActiveDistance)as decimal (10,1)) as ModeratelyActiveDistance,
CAST(sum(LightActiveDistance) as decimal (10,1)) as LightActiveDistance,
CAST(sum(SedentaryActiveDistance) as decimal (10,1)) as SedentaryActtiveDistance ,
CAST(sum(VeryActiveMinutes)as decimal (10,0)) as VeryActiveMinutes ,
CAST(sum(FairlyActiveMinutes) as decimal (10,0)) as ModeratelyActiveMinutes ,
CAST(sum(LightlyActiveMinutes)  as decimal (10,0)) as LightActiveMinutes,
CAST(sum(SedentaryMinutes) as decimal (10,0)) as SedentaryActiveMinutes
From BellaBeat..Activity
--WHERE ID = '1503960366'
Group BY id 

--Order By AVGCalories DESC

SELECT *
FROM bellabeat..Sleep

  SELECT Distinct 
 Id,    
CAST(SUM (totalTimeinBed)as decimal (10,0)) AS SumTimeinBed ,
CAST(SUM(totalMinutesAsleep) as decimal (10,0)) AS SumMinutesAsleep , 
CAST(SUM(MinutesUntillAsleep)as decimal (10,0)) AS SumMinutesUntillAsleep 
 From BellaBeat..Sleep 
 Group BY Id 
