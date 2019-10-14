# Double-blind reviewing and gender biases at EvoLang conferences: an update

Data and code for

Christine Cuskley, Seán G Roberts, Stephen Politzer-Ahles, Tessa Verhoef (2019) Double-blind reviewing and gender biases at EvoLang conferences: An update, _Journal of Language Evolution_, lzz007, Online [here](https://academic.oup.com/jole/advance-article-abstract/doi/10.1093/jole/lzz007/5586645) [DOI: https://doi.org/10.1093/jole/lzz007](https://doi.org/10.1093/jole/lzz007).

You can access the [preprint in this repository](https://raw.githubusercontent.com/seannyD/EvoLang12DoubleBlindData/master/CuskleyEtAl_2019_EvoLangGenderBias_Preprint.pdf).


# Data

## EvoLang_Scores_9_to_12.csv:

-  conference: Which conference the paper was submitted to
-  gender: Gender of first author
-  Score.Mean: Mean raw score given by reviewers (scaled between 0 and 1, hierh = better paper)
-  student: The student status of the first author at submission.
 
## ../data/EvoLang_ReadingScores_E8_to_E12.csv

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

## ../data/MatchedAuthors_E10_E11_E12.csv

This data includes 50 (first) authors who had submitted to each of the last 3 conferences (EvoLang 10, 11 and 12).  Because some authors submitted multiple papers per conference, we only analysed each author’s highest ranking paper in each conference. 

Each row represents a single author.

-  E10, E11, E12: Review rank for each conference. 
-  E10.format, E11.format, E12.format: The format of the submission for each conference.
-  gender: Gender of the author.
-  diff.E10.to.E11: Difference in review ranks between E10 and E11.
-  diff.E11.to.E12: Difference in review ranks between E11 and E12.
-  authorCode: Arbitrary author code.

