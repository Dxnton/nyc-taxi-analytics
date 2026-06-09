WITH raw_downloads AS (
    SELECT * FROM {{ source('pypi', 'file_downloads') }}
    WHERE DATE(timestamp) >= DATE_SUB(CURRENT_DATE(), INTERVAL 365 DAY)
    AND details.installer.name IS NOT NULL
    AND details.python IS NOT NULL
)

SELECT
    timestamp,
    file.project AS package_name,
    file.version AS package_version,
    details.installer.name AS installer,
    details.python AS python_version,
    country_code
FROM raw_downloads