# Student Performance Analysis

## Project Overview

This project analyzes student performance using the UCI Student Performance dataset. The goal is to explore how final grades vary across factors such as study time, previous class failures, absences, gender, and school.

The project uses Excel, MySQL, and Python to inspect the data, perform analysis, visualize patterns, and communicate findings through a dashboard.

## Objectives

* Inspect the dataset and check data quality.
* Analyze final grades across selected student characteristics.
* Use SQL queries to summarize and compare groups.
* Use Python and visualizations to explore patterns.
* Present key results in an Excel dashboard.
## Dataset

* **Source:** UCI Machine Learning Repository
* **Dataset:** Student Performance
* **File used:** `student-mat.csv`
* **Records analyzed:** 395 students
* **Columns:** 33

The dataset contains student demographic information, family and school-related attributes, study habits, absences, previous failures, and grades from three academic periods.

Dataset link: https://archive.ics.uci.edu/dataset/320/student%2Bperformance

## Tools and Technologies

* **Microsoft Excel:** Data inspection, analysis, charts, and dashboard creation.
* **MySQL:** Data querying, filtering, grouping, aggregation, and comparisons.
* **Python:** Data inspection, analysis, and visualization.
* **Pandas:** Data loading and analysis.
* **Matplotlib:** Chart creation.
* **Jupyter Notebook:** Running and documenting Python analysis.
## Methodology

### 1. Data Inspection

* Loaded the Student Performance dataset containing 395 records and 33 columns.
* Checked column names, data types, missing values, duplicate records, and value ranges.
* Found no missing values in the analyzed dataset.

### 2. Excel Analysis

* Organized the dataset into a structured Excel table.
* Created a performance category using the final grade (G3), classifying grades of 10 or above as satisfactory.
* Calculated summary statistics and compared average final grades across selected groups.
* Created charts and an Excel dashboard to present the results.

### 3. SQL Analysis

* Imported the dataset into a MySQL database.
* Used filtering, grouping, aggregate functions, conditional aggregation, and subqueries.
* Compared student performance across schools, gender, study-time categories, previous failures, absence groups, and other selected characteristics.

### 4. Python Analysis

* Used Pandas to load and inspect the dataset.
* Calculated summary statistics and grouped average final grades.
* Used Matplotlib to create visualizations for previous failures, study time, absence groups, and schools.

### 5. Reporting

* Compared the findings across Excel, SQL, and Python.
* Summarized the major patterns and documented the limitations of the analysis.
## Key Findings

### 1. Overall Performance

* The average final grade (G3) was approximately **10.42 out of 20**.
* **265 out of 395 students** (about 67.1%) achieved a final grade of 10 or above.
* The average number of absences was approximately 5.71.

### 2. Previous Class Failures

Students with more previous class failures tended to have lower average final grades.

| Previous Failures | Average G3 |
| ----------------: | ---------: |
|                 0 |      11.25 |
|                 1 |       8.12 |
|                 2 |       6.24 |
|                 3 |       5.69 |

This was one of the clearest patterns observed in the analysis.

### 3. Study Time

* Study-time category 3 had the highest average final grade, approximately 11.40.
* Category 4 had an average of approximately 11.26.
* The relationship was not perfectly increasing across every category.

The study-time values are coded categories, not exact hours for individual students.

### 4. Absences

* Students with 6–10 absences had the highest average final grade, approximately 11.40.
* Students with 0–5 absences averaged approximately 10.17.
* Students with more than 10 absences averaged approximately 10.15.

Therefore, the relationship between absence groups and grades was not simply linear.

### 5. School Comparison

* GP students had an average final grade of approximately 10.49.
* MS students had an average final grade of approximately 9.85.

The difference is descriptive and does not establish why the averages differ.
## Limitations

* This analysis describes patterns in the available dataset and does not establish cause-and-effect relationships.
* Some categories contain relatively few students, so their averages should be interpreted cautiously.
* Study time is recorded using coded categories rather than exact hours.
* The dataset represents students from two Portuguese schools, so the findings may not generalize to all students or education systems.
* Final grades may be related to earlier-period grades (G1 and G2), so those relationships require careful interpretation.

## Conclusion

This project demonstrates a complete introductory data-analysis workflow using Excel, MySQL, and Python. The analysis identified differences in average final grades across several student groups, with previous class failures showing a particularly clear association with final performance.

The dashboard and visualizations summarize the results, while the documented limitations help ensure that the findings are interpreted responsibly.

## Dataset Citation

Cortez, P. (2008). *Student Performance* [Dataset]. UCI Machine Learning Repository. https://doi.org/10.24432/C5TG7T

## Author

Student project completed for data analytics learning and portfolio development.

## Dataset Source and Attribution

This project uses the Student Performance dataset from the UCI Machine Learning Repository.

- **Creator:** Paulo Cortez
- **Source:** https://archive.ics.uci.edu/dataset/320/student+performance
- **Citation:** Cortez, P. (2008). *Student Performance* [Dataset]. UCI Machine Learning Repository. https://doi.org/10.24432/C5TG7T
- **Dataset licence:** Creative Commons Attribution 4.0 International (CC BY 4.0).

The analysis in this project focuses on the Mathematics dataset (`student-mat.csv`). The findings are descriptive and do not establish causation.