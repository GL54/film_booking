
-record(sequence,{name, 
                  value}).

-record(users,{uuid,
               email,
               password,
               address,
               role,
               user_name}).

-record(films,{name,
               time,
               seat_category,
               price,
               available_seats,
               theater_name
               date,
               }).

-record(seats,{
              id,
              status
              })
