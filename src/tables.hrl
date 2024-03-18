
-record(sequence,{name, 
                  value}).

-record(users,{uuid,
               email,
               password,
               address,
               role,
               user_name}).

-record(films,{film_uuid,
               name,
               time,
               seat_category,
               price,
               available_seats,
               theater_name
               date,
               }).

-record(booking,{id,
                 user_id,
                 ticket_count}).


-record(seats_count,{count}).

-record(seats, {id,
                theater_id,
                seat_category,
                status
              })
