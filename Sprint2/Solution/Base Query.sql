use STM_SRC
go
--Main query
select top 1000 st.departure_time, st.stop_sequence, s.stop_name, s.stop_code, t.wheelchair_accessible, r.route_long_name, r.route_short_name, t.trip_headsign, t.service_id
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