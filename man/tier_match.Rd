% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tier_match.R
\name{tier_match}
\alias{tier_match}
\title{tier_match}
\usage{
tier_match(data1, data2, by = NULL, by.x = by, by.y = by,
  suffixes = c(".x", ".y"), check_merge = TRUE, unique_key_1, unique_key_2,
  tiers = list(), takeout = "both", match_type = "exact",
  amatch.args = list(method = "jw", p = 0.1, maxDist = 0.05, matchNA = FALSE),
  clean = clean_strings, clean.args = list(), score_settings = NULL,
  filter = NULL, filter.args = list(), evaluate = match_evaluate,
  evaluate.args = list())
}
\arguments{
\item{data1}{data.frame. First to-merge dataset.}

\item{data2}{data.frame. Second to-merge dataset.}

\item{suffixes}{see \code{merge}}

\item{check_merge}{logical. Checks that your unique_keys are indeed unique, and prevents merge from running if merge would result in data.frames larger than 5 million rows}

\item{unique_key_1}{character vector. Primary key of data1 that uniquely identifies each row (can be multiple fields)}

\item{unique_key_2}{character vector. Primary key of data2 that uniquely identifies each row (can be multiple fields)}

\item{tiers}{list(). tier is a list of lists, where each list holds the parameters for creating that tier. All arguments to tier_match listed after this argument can either be supplied directly to tier_match, or indirectly via tiers.}

\item{takeout}{string. Specifies whether to exclude matched observations from matching in subsequent tiers for 'data1', 'data2' or 'both'.
of matching. If}

\item{clean}{Function to clean strings prior to match. see \code{clean_strings}.}

\item{clean.args}{list. Arguments passed to clean.}

\item{score_settings}{list. score settings. See vingette matchscore}

\item{filter}{function or numeric. Filters a merged data1-data2 dataset. If a function, should take in
a data.frame (data1 and data2 merged by name1 and name2) and spit out a trimmed verion
of the data.frame (fewer rows). Think of this function as applying other conditions
to matches, other than a match by name. The first argument of filter should be the data.frame.
If numeric, will drop all observations with a matchscore lower than or equal to filter.}

\item{filter.args}{list. Arguments passed to filter, if a function}

\item{evaluate}{Function to evalute merge_plus output. see \code{evaluate_match}.}

\item{evaluate.args}{list. Arguments passed to function specified by evaluate}

\item{match_type.}{string. If 'exact', match is exact, if 'fuzzy', match is fuzzy.}

\item{amatch.args.}{additional arguments for amatch, to be used if match_type = 'fuzzy'. Suggested defaults provided. (see amatch, method='jw')}
}
\value{
list with matches, data1 and data2 minus matches, and match evaluation
}
\description{
Constructs a tier_match by running merge_plus with different parameters sequentially on the same data, removing matched observations after each tier
}
\examples{
data1 = data.frame(unique_key = 1, name = c("hello world"))
data2 = data.frame(unique_key = 1:3, name = c("hello world", "Hello World", "hello worlds"))
tier_match(data1, data2, by='name', unique_key_1='unique_key', unique_key_2='unique_key',
          tiers = list(a=list(clean='none'), b=list(), c=list(match_type='fuzzy')), takeout='data2')


}
\seealso{
merge_plus clean_strings
}
