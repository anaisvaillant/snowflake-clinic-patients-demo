select * 
from {{ metrics.calculate(
    metric('patient_encounters'),
    grain='week'
)}}