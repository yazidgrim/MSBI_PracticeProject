use STM_SRC
go
--report Query
select HH, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10]
from
(select
	SUBSTRING(st.departure_time,1,2) as HH,
	SUBSTRING(st.departure_time,4,2) as MM,
	ROW_NUMBER() OVER (PARTITION BY SUBSTRING(st.departure_time,1,2) order by SUBSTRING(st.departure_time,1,2)) as RowNum
from 
	stop_times st 
	inner join stops s on s.stop_id = st.stop_id
	inner join trips t on t.trip_id = st.trip_id
	inner join routes r on t.route_id = r.route_id
where
	s.stop_code = '53009' and r.route_id = '45' and t.trip_headsign = '45-N' and t.service_id = '14U_S') a
PIVOT (MAX(MM) FOR RowNum in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10])) as pvt


--Main query
select top 1000 
	SUBSTRING(st.departure_time,1,2) as HH,
	SUBSTRING(st.departure_time,4,2) as MM, 
	CONVERT(int, st.stop_sequence) as sequence, 
	s.stop_name, 
	s.stop_code, 
	CONVERT(bit, t.wheelchair_accessible) as wheelchair, 
	r.route_long_name, 
	CONVERT(int, r.route_short_name) as route_number, 
	CASE SUBSTRING(t.trip_headsign, len(t.trip_headsign), 1)
		WHEN 'N' THEN 'North'
		WHEN 'S' THEN 'South'
		WHEN 'E' THEN 'East'
		WHEN 'O' THEN 'West'
		ELSE 'Unknown'
	END as direction,
	t.service_id
from 
	stop_times st 
	inner join stops s on s.stop_id = st.stop_id
	inner join trips t on t.trip_id = st.trip_id
	inner join routes r on t.route_id = r.route_id
where
	s.stop_code = '53009' and r.route_id = '45' and t.trip_headsign = '45-N' and t.service_id = '14U_S'
order by st.departure_time

--getting service ID from the date
select * from calendar_dates where date = '20140708'

--getting the list of stops for a bus line

select distinct t.route_id, t.trip_headsign, s.stop_name, s.stop_code, st.stop_sequence
from
	trips t
	inner join stop_times st on st.trip_id = t.trip_id
	inner join stops s on s.stop_id = st.stop_id
where t.trip_headsign = '45-N'
order by st.stop_sequence