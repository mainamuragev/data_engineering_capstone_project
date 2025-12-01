

with source_data as (
    select
        activity_id,
        chv_id,
        activity_date,
        activity_type,
        household_id,
        patient_id,
        is_deleted,
        created_at,
        updated_at
    from "defaultdb"."marts"."fct_chv_activity"
    where is_deleted = false
      and chv_id is not null
      and activity_date is not null
),

with_report_month as (
    select
        chv_id,
        
    case
        when activity_date is null then null
        when extract(day from activity_date) >= 26
            then date_trunc('month', activity_date + interval '1 month')
        else date_trunc('month', activity_date)
    end
 as report_month,
        activity_type,
        household_id,
        patient_id
    from source_data
),

aggregated as (
    select
        chv_id,
        report_month,
        count(*) as total_activities,
        count(distinct household_id) as unique_households_visited,
        count(distinct patient_id) as unique_patients_served,
        sum(case when activity_type = 'pregnancy_visit' then 1 else 0 end) as pregnancy_visits,
        sum(case when activity_type = 'child_assessment' then 1 else 0 end) as child_assessments,
        sum(case when activity_type = 'family_planning' then 1 else 0 end) as family_planning_visits
    from with_report_month
    group by chv_id, report_month
)

select *
from aggregated