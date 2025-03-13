
-- looking at countries with heighest infection rate compared to population

Select Location,population ,MAX(total_cases) as HighestInfectionCount,MAX((total_cases/population)*100)as PercentagePopulationInfected
From Covid19..CovidDeaths$
Where continent is not null
Group By Location,population
order by PercentagePopulationInfected desc,


-- countires with highest death count per population
--in desending order
--cast is for converting that value into an interger
-- breaking the data by continent

Select Location, MAX(cast(total_deaths as int)) as TotalDeathCount  
From Covid19..CovidDeaths$
Where continent is not null
Group By continent
order by  TotalDeathCount desc



--Global numbers across the whole world per day

Select date,SUM(new_cases) as totalCases,SUM(cast(total_deaths as int)) as totalDeaths, SUM(cast(new_deaths as int))/SUM
(new_cases)*100 as DeathPercentage
From Covid19..CovidDeaths$
where continent is not null
Group By date

--If you want to know overall acrosss the world 
Select SUM(new_cases) as totalCases,SUM(cast(total_deaths as int)) as totalDeaths, SUM(cast(new_deaths as int))/SUM
(new_cases)*100 as DeathPercentage
From Covid19..CovidDeaths$
where continent is not null

--If you want to know how many people survived
Select SUM(new_cases) as totalCases,SUM(cast(total_deaths as int)) as totalDeaths, SUM(cast(new_deaths as int))/SUM
(new_cases)*100 as DeathPercentage,  
SUM(cast(total_deaths as int))-SUM(new_cases) as Survived
From Covid19..CovidDeaths$
where continent is not null


