CREATE TABLE uber_data_analytics AS(
SELECT f."VendorID",
d."tpep_pickup_datetime",
d."tpep_dropoff_datetime",
p."passenger_count",
t."trip_distance",
ra."rate_code_name",
pi."pickup_latitude",
pi."pickup_longitude",
dr."dropoff_latitude",
dr."dropoff_longitude",
py."payment_type_name",
f."fare_amount",
f."extra",
f."mta_tax",
f."tip_amount",
f."tolls_amount",
f."improvement_surcharge",
f."total_amount"
FROM FACT_TABLE f
JOIN datetime_dim d           on  f.datetime_id = d.datetime_id
JOIN passenger_count_dim p    on  p.passenger_count_id = f.passenger_count_id
JOIN trip_distance_dim t      on  t.trip_distance_id = f.trip_distance_id
JOIN payment_type_dim py      on  py.payment_type_id = f.payment_type_id
JOIN dropoff_location_dim dr  on  dr.dropoff_location_id = f.dropoff_location_id
JOIN pickup_location_dim pi   on  pi.pickup_location_id = f.pickup_location_id
JOIN "Rate_code_dim" ra		  on  ra.rate_code_id = f.rate_code_id)
;
