%Ex1.3
%search_two(Elem, List).
%looks for two occurences of Elem with any element in between
search_two(X, [X,_,X|_]).
search_two(X, [_|Xs]):- search_two(X,Xs).

%Ex.1.4
% search(Elem, List)
search(X, [X|_]).
search(X, [_|Xs]) :- search(X, Xs).
% search_anytwo(Elem,List)
% looks for any Elem that occurs two times, anywhere
search_anytwo(X, [X|Xs]):- search(X,Xs).
search_anytwo(X, [_|Xs]) :- search_anytwo(X,Xs).

%Ex2.2
size([], zero).
size([_|T], s(S)) :- size(T,S).

%Ex2.3
% sum(List,Sum)
sum([], 0).
sum([X|Xs], R) :- sum(Xs, S), R is S+X.

%Ex2.5
% max(List,Max)
% Max is the biggest element in List
% Suppose the list has at least one element
max([X|Xs],Max):- max(Xs,Max,X).
max([X|Xs], Max, TempMax):- TempMax > X, max(Xs, Max, TempMax).
max([X|Xs], Max, TempMax):- TempMax =< X, max(Xs, Max, X).
max([], Max, TempMax) :- Max is TempMax.

%Ex2.6
% max(List,Max,Min)
% Max is the biggest element in List
% Min is the smallest element in List
% Suppose the list has at least one element
max2([X|Xs], Max, Min):- max2(Xs,Max,Min, X, X).
max2([X|Xs], Max, Min, TempMin, TempMax) :- TempMax > X, 
					   TempMin > X,
					   max2(Xs, Max, Min, X, TempMax).
max2([X|Xs], Max, Min, TempMin, TempMax) :- TempMax > X, 
					   TempMin =< X, 
					   max2(Xs, Max, Min, TempMin, TempMax).
max2([X|Xs], Max, Min, TempMin, TempMax) :- TempMax =< X, 
					   max2(Xs, Max, Min, TempMin, X).
max2([], Max, Min, TempMin, TempMax) :- Max is TempMax, Min is TempMin.

%Ex3.2
% all_bigger(List1,List2)
% all elements in List1 are bigger than those in List2, 1 by 1
% example: all_bigger([10,20,30,40],[9,19,29,39]).
all_bigger([X1|Xs1],[X2|Xs2]) :- X1 > X2, all_bigger(Xs1, Xs2).
all_bigger([],[]).

%Ex3.3
% sublist(List1,List2)
% List1 should contain elements all also in List2
% example: sublist([1,2],[5,3,2,1]).
% search(Elem, List)
search(X, [X|_]).
search(X, [_|Xs]) :- search(X, Xs).
sublist([X|Xs],List2) :- search(X, List2), sublist(Xs, List2).
sublist([], List2).


%Ex4.2
% seqR(N,List)
% example: seqR(4,[4,3,2,1,0]).
seqR(0,[0]).
seqR(N,[N|T]):- N2 is N-1, seqR(N2,T).

%Ex4.3
% seqR2(N,List)
% example: seqR2(4,[0,1,2,3,4]).
last([], Elem, [Elem]).
last([X|Xs], Elem, [X|T]):- last(Xs, Elem, T).
seqR2(0,[0]).
seqR2(N,List):-last(L, N, List), N2 is N-1, seqR2(N2,L).

%Other Exercises
%inv(List1, List2)
inv([],[]).
inv([X|Xs],List):-last(L2,X,List), inv(Xs, L2).

%double(List1, List2)
double(List1, List2):-append(List1, List1, List2).

%times(Lis1, N, List2)
times(List1, N, List2) :- times(List1, N, List2, []).
times(List1, N, List2, TempList):- N > 0, N2 is N-1, append(List1, TempList, TempList1), times(List1, N2, List2, TempList1).
times(List1, 0, List2, TempList) :- List2 is TempList.

%proj(List1, List2)
proj([],[]).
proj([[H|_]|Xs], [X1|Xs1]):- H = X1, proj(Xs, Xs1). 