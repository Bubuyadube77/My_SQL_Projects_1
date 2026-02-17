-- Exploratory Data Analysis

select *
from layoffs_staging3;

select *
from layoffs_staging3
where percentage_laid_off = 1
order by funds_raised_millions desc;

select company, sum(total_laid_off)
from layoffs_staging3
group by company
order by 2 desc;

select industry, sum(total_laid_off)
from layoffs_staging3
group by industry
order by 2 desc;

select min(`date`), max(`date`)
from layoffs_staging3;

select country, sum(total_laid_off)
from layoffs_staging3
group by country
order by 2 desc;

select date, sum(total_laid_off)
from layoffs_staging3
group by date
order by 2 desc;

select year(date), sum(total_laid_off)
from layoffs_staging3
group by year(date)
order by 1 desc;

select stage, sum(total_laid_off)
from layoffs_staging3
group by stage
order by 2 desc;

select substring(`date`, 1, 7) as `Month`, sum(total_laid_off)
from layoffs_staging3
where substring(`date`, 1, 7)
group by `Month`
order by 1 asc;

with Rolling_Total as
(
select substring(`date`, 1, 7) as `Month`, sum(total_laid_off) as total_off
from layoffs_staging3
where substring(`date`, 1, 7)
group by `Month`
order by 1 asc
)
Select*, sum(total_off) over(order by `Month`) as rolling_total
from Rolling_Total;

select company, year(`date`), sum(total_laid_off)
from layoffs_staging3
group by company, year(`date`)
order by 3 desc;

With Company_Year (company, years, total_laid_off) As
(
select company, year(`date`), sum(total_laid_off)
from layoffs_staging3
group by company, year(`date`)
),
Company_Ranking_Years as
(
select*, dense_rank() over(partition by years order by total_laid_off desc) as Ranking
from Company_Year
where years is not null
)
select*
from Company_Ranking_Years
where Ranking <=5;