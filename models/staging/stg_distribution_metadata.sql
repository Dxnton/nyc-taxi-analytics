WITH raw_metadata AS (
    SELECT * FROM {{ source('pypi', 'distribution_metadata') }}
    WHERE name IS NOT NULL
    AND version IS NOT NULL
)

SELECT
    name AS package_name,
    version,
    upload_time,
    requires_python,
    home_page
FROM raw_metadata