capture log close
capture log using "Empirical.log", replace

cd "C:\Users\lmc10\Downloads"

reg approve djia num_tweets shutdown post_shutdown daysofsd dayspostsd, r
reg approve djia num_tweets shutdown daysofsd, r
reg approve djia num_tweets post_shutdown dayspostsd, r
reg disapprove djia num_tweets shutdown daysofsd, r
reg disapprove djia num_tweets post_shutdown dayspostsd, r

graph twoway scatter approve dayspostsd, title("Approval Rating After Shutdown")
graph display

graph twoway (lfit approve dayspostsd if post_shutdown==1) (scatter approve dayspostsd if post_shutdown==1), title("Approval Rating With Fitted Regression")

graph twoway (lfit approve daysofsd if shutdown==1) (scatter approve daysofsd if shutdown==1), title("Approval Rating With Fitted Regression")

graph twoway (lfit approve dayspostsd if post_shutdown==0 & shutdown==0) (scatter approve dayspostsd if post_shutdown==0 & shutdown==0), title("Approval Rating With Fitted Regression")

graph twoway line approve start, tlabel(20181117 20181221)

scatter approve shutdown, yline(39.956174)
