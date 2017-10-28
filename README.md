This is an Multi-objectives Evolutionary Algorithms (MOEAs) based on NSGA-II. The final purpose is to solve the open source software release time and management problem

NSGA is a popular non-domination based genetic algorithm for multi-objective optimization.
	Original NSGA-II code can be found in 
	https://www.mathworks.com/matlabcentral/fileexchange/10429-nsga-ii--a-multi-objective-optimization-algorithm
	The function is nsga_2(pop,gen). The input arguments for the function are population size and number of generations. 
	For customization purposes the user is free to modify the objective function (function of several decision variables) by modifying an m file (evaluate_objective.m). 


Traditionally the optimized software release time problem reduces the multi-decision space into a single-objective optimization problem. Although these formulations simplify the problem and reduce the complexity involved, the solutions do not take care of every objective involved. 
We use non-domination based genetic algorithm to solve the open source software release time problem for two reason:
	1. To maximize reliability and to minimize cost should be done at the same time. 
	2. Evolutionary algorithm guarantee the quality of solutions.
Instead of finding a single optimal solution for our problem, we use genetic algorithm to find a set of optimal solutions. These solutions, as we know, are Pareto-optimal solutions. In a single set of a Pareto-optimal solution for a multi-objectives problem, every solution must be better than the other in the last one objective.

The objective we consider are
	1. Reliability 2. Cost 3. Test resource consumed

How to run:
>nsga_2(pop,gen)
the result should be in D:\MATLAB\NSGA_II

Trace record:
in evalute_objective.m
	f = evalute_objective(x,M,V)
	x: decision variable; M:number of obj. function; V: number of decision variable
	this algorithm aim to minimize the objective function, so if we want to maximize it, just multiply (-1)

in genetic_operator.m
	for i in range(N) % N = population in each generation
		90% probability: Crossover
			1. Select 2 parents
			2. Crossover for every decision variable V
			3. Calculate the objective function
		10% probability: Mutation
			based on polynomial mutation
in hypervolume.m
	measure the size of solution, which is covered by Pareto Front

in initialize_variable.m
	initialize objective function
	for i in range(N)
		j(i, V+1:K) = evaluate_objective(f(i:),M,V,range)

in nsga2.m
	nsga_2(population, generation) 
	%pop = how mane individual in a generation
	%gen = how many generation we want to crossover
	[M,V,min,max] = objective_description_functino()
	chromosome = initialize_variable(pop,M,V,min,max)
	%randomly generate the first generation, put the result into f[N,K] (K = M+V)
	chromosome = non-domination-sort
	for i in range(gen)
		1. Parent_chromosome
		2. Offspring_chromosome
	%end of generation
	Plot
