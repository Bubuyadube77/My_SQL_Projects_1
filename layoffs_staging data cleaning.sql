-- Data cleaning
select*
from layoffs;

-- 1. Remove Duplicates
-- 2. Standardise Data
-- 3. Null or Blank Values
-- 4. Remove columns which are no necessary

create table layoffs_staging
like layoffs;

select *
from layoffs_staging;

insert layoffs_staging
select *
from layoffs;


select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging;

With duplicate_cte as
(
select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging
)
select*
from duplicate_cte
where row_num > 1;

CREATE TABLE `layoffs_staging3` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

Select*
from layoffs_staging3;

insert into layoffs_staging3
select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging;

delete
from layoffs_staging3
where row_num > 1;

Select*
from layoffs_staging3;

-- Standardising data

select distinct(company)
from layoffs_staging3;

select company, (trim(company))
from layoffs_staging3;

update layoffs_staging3
set company = trim(company);

select distinct industry
from layoffs_staging3
order by 1;

select *
from layoffs_staging3
where industry like 'crypto%';

update layoffs_staging3
set industry = 'Crypto'
where industry like 'crypto%';

select distinct country
from layoffs_staging3
order by 1;

update layoffs_staging3
set country = 'United States'
where country like 'United States%';

select `date`,
STR_TO_DATE (`date`, '%m/%d/%Y')
from layoffs_staging3;

update layoffs_staging3
set `date` = STR_TO_DATE (`date`, '%m/%d/%Y');

select `date`
from layoffs_staging3;

alter table layoffs_staging3
modify column `date` date;

select *
from layoffs_staging3
where total_laid_off is null
and percentage_laid_off is null;

update layoffs_staging3
set industry = null
where industry = '';

select distinct industry
from layoffs_staging3;

select *
from layoffs_staging3 t1
join layoffs_staging3 t2
	on t1.company = t2.company
    and t1.location = t2.location
where t1.industry is null
and t2.industry is not null;

update layoffs_staging3 t1
join layoffs_staging3 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null
and t2.industry is not null;


select*
from layoffs_staging3
where industry is null
or industry = '';


select*
from layoffs_staging3
where company like 'Ball%';

select *
from layoffs_staging3
where total_laid_off is null
and percentage_laid_off is null;

alter table layoffs_staging3
drop column row_num;

delete
from layoffs_staging3
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging3;

select *
from layoffs_staging3
where percentage_laid_off = 1;
