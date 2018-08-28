
# Data

## EvoLang_Scores_9_to_12.csv:

-  conference: Which conference the paper was submitted to
-  gender: Gender of first author
-  Score.Mean: Mean raw score given by reviewers (scaled between 0 and 1, hierh = better paper)
-  student: The student status of the first author at submission.
 
## "../data/EvoLang_ReadingScores_E8_to_E12.csv"

This has the ease of reading score, but only for papers where the text could be extracted.  The columns are as follows:
 
-  "conference": conference
-  "gender": gender of first author
-  "student": student status (note that there are multiple types of non-student for E12, which you might want to collapse)
-  "format": Abstract or Paper
-  "Score.mean": The average reviewer score, as a scaled rank (within year)

The following columns are from the ["textatistic" package](http://www.erinhengel.com/software/textatistic/), which was used in [Hengel (2016)](https://pdfs.semanticscholar.org/8725/e3959d7ede205b464ac0359a21005efcbf9e.pdf).

Because of the rough text extraction, it's not guaranteed that all of these measures will be sensible.

-  "char_count"         
-   "word_count"         
-  "sybl_count"         
-  "notdalechall_count" 
-  "polysyblword_count" 
-  "flesch_score"       
-  "fleschkincaid_score"
-  "gunningfog_score"   
-  "smog_score"         
-  "dalechall_score"    

