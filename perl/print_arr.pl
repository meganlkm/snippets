#!/usr/bin/perl -w
use strict;

my $project_repo = 'myrepo';
my $prjtmp = '/tmp/' . $project_repo;

my @ugit = (
	  'mkdir -p ' . $prjtmp
	, 'cd '. $prjtmp
	, 'git init'
	, 'git remote add origin ' . $project_repo
	, 'cp app_files/gitignore .gitignore'
	, 'mv tmpdir/prd-config-' . $project_repo . '.php config.php'
	, 'git add .'
	, "git commit -m 'initial commit'"
	, 'git push origin master'
	, 'git remote add qtbase qtbase_repo'
	, 'git checkout -b qtbase'
	, 'git pull qtbase master'
	, 'git checkout master'
	, 'git merge qtbase'
	, 'git push origin master'
	, 'git branch -d qtbase'
);

# print to a file and execute it to merge repos
print join "\n", @ugit;
