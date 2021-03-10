--Query the PoKi database using SQL SELECT statements to answer the following questions.
----------------------------------------------------------------------------------------

--What grades are stored in the database?
SELECT *
	FROM Grade

--What emotions may be associated with a poem?
SELECT *
	FROM Emotion

--How many poems are in the database?
SELECT MAX(Id) NumberOfPoems
	FROM Poem

--Sort authors alphabetically by name. What are the names of the top 76 authors?
SELECT a.Name
	FROM Author a Where Id < 77
	ORDER BY Name 
	

--Starting with the above query, add the grade of each of the authors.
	
SELECT a.Name, g.Name
	FROM Author a 
	LEFT JOIN Grade g on a.GradeId = g.id
		where a.Id < 77
		ORDER BY a.Name 

--Starting with the above query, add the recorded gender of each of the authors.
SELECT a.Name, g.Name Grade, ge.Name Gender
	FROM Author a 
	LEFT JOIN Grade g on a.GradeId = g.id
	LEFT JOIN Gender ge on a.GenderId = ge.Id
		where a.Id < 77
		ORDER BY a.Name 

--What is the total number of words in all poems in the database?
SELECT SUM(WordCount) TotalWordCount
	FROM Poem

--Which poem has the fewest characters?
SELECT MIN(CharCount) FewestCharacters
	FROM Poem

--How many authors are in the third grade?
SELECT COUNT(g.Id) Total3rdGraders
	FROM Author a
	LEFT JOIN Grade g on a.GradeId = g.Id
		where g.Name = '3rd Grade'

--How many authors are in the first, second or third grades?
SELECT COUNT(g.Id) Total1st2nd3rdGraders
	FROM Author a
	LEFT JOIN Grade g on a.GradeId = g.Id
		where g.Name = '3rd Grade' or g.Name = '1st Grade' or g.Name = '2nd Grade'

--What is the total number of poems written by fourth graders?
SELECT COUNT(p.Id) Total4thGradePoems
	FROM Poem p
	LEFT JOIN Author a on p.AuthorId = a.Id
		where a.GradeId = 4

/*SELECT COUNT(a.Name)
	FROM Author a
	WHERE a.GradeId = 4*/
	
--How many poems are there per grade?
SELECT COUNT(p.Id) Total1stGradePoems
	FROM Poem p
	LEFT JOIN Author a on p.AuthorId = a.Id
		where a.GradeId = 1

		

SELECT COUNT(p.Id) Total2ndGradePoems
	FROM Poem p
	LEFT JOIN Author a on p.AuthorId = a.Id
		where a.GradeId = 2

		

SELECT COUNT(p.Id) Total3rdGradePoems
	FROM Poem p
	LEFT JOIN Author a on p.AuthorId = a.Id
		where a.GradeId = 3

		

SELECT COUNT(p.Id) Total4thGradePoems
	FROM Poem p
	LEFT JOIN Author a on p.AuthorId = a.Id
		where a.GradeId = 4


--How many authors are in each grade? (Order your results by grade starting with 1st Grade)


--What is the title of the poem that has the most words?
SELECT MAX(p.WordCount) MostWords
	FROM Poem p

--Which author(s) have the most poems? (Remember authors can have the same name.)
SELECT COUNT(p.AuthorId)
	FROM Poem p


--How many poems have an emotion of sadness?
SELECT 
--How many poems are not associated with any emotion?
--Which emotion is associated with the least number of poems?
--Which grade has the largest number of poems with an emotion of joy?
--Which gender has the least number of poems with an emotion of fear?