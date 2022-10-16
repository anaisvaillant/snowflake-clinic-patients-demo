select * 
from {{ metrics.calculate(
    metric('patient_encounters'),
    grain='month',
    start_date='2022-01-01'
)}}