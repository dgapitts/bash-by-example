## example_008_bash_awk_sum_stddev

TLDR:
```
awk '{x+=$0;y+=$0^2}END{print "avg:" x/NR " stddev:" sqrt(y/NR-(x/NR)^2)}'
```

this is a continuation of `example_002_bash_random_and_awk_95th_percentile` and I've added two more common formulas
* Average
* Standard Deviation (stddev)

> In statistics, the standard deviation is a measure of the amount of variation or dispersion of a set of values.[1] A low standard deviation indicates that the values tend to be close to the mean (also called the expected value) of the set, while a high standard deviation indicates that the values are spread out over a wider range. https://en.wikipedia.org/wiki/Standard_deviation

Here is my demo, based a list of 30K random number 


```
~/projects/bash-by-example/example_002_bash_random_and_awk_95th_percentile $ head random.log
6378
5183
979
8984
1941
7901
9674
9724
386
5742
~/projects/bash-by-example/example_002_bash_random_and_awk_95th_percentile $ cat random.log|wc -l
   30000
~/projects/bash-by-example/example_002_bash_random_and_awk_95th_percentile $ cat random.log | awk '{print $1}'|awk '{x+=$0;y+=$0^2}END{print "avg:" x/NR " stddev:" sqrt(y/NR-(x/NR)^2)}'
avg:4698.48 stddev:2935.82
```

^^ this shows how the formula works in awk, although for a uniform distribution the stddev doesn't make as much sense as for a normal distribution, maybe I can add another datatset in the future.


Ref: https://stackoverflow.com/questions/18786073/compute-average-and-standard-deviation-with-awk (this is based off the current 2nd most popular answer, I don't get why it isn't the first choice)

