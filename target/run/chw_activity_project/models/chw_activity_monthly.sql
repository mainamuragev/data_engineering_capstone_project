
      
        delete from "defaultdb"."marts"."chw_activity_monthly" as DBT_INTERNAL_DEST
        where (chv_id, report_month) in (
            select distinct chv_id, report_month
            from "chw_activity_monthly__dbt_tmp161717346264" as DBT_INTERNAL_SOURCE
        );

    

    insert into "defaultdb"."marts"."chw_activity_monthly" ("chv_id", "report_month", "total_activities", "unique_households_visited", "unique_patients_served", "pregnancy_visits", "child_assessments", "family_planning_visits")
    (
        select "chv_id", "report_month", "total_activities", "unique_households_visited", "unique_patients_served", "pregnancy_visits", "child_assessments", "family_planning_visits"
        from "chw_activity_monthly__dbt_tmp161717346264"
    )
  