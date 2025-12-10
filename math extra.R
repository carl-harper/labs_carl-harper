A<- matrix(c(1:9), nrow = 3, ncol = 3)
B<- matrix(c(1:9), nrow = 3, ncol = 3, byrow = TRUE)

A
B
A+B=C

D <- matrix(c(1:4) * 4, nrow = 2, ncol = 2)

A+B+D

2*A

c(1,2) * A

A*B
#element wise multiplication of two matrixes, doesn't work with different number of lengths


A <- matrix(c(1,2,3,4), nrow = 2, ncol = 2)
B <- matrix(c(0,1,0,1), nrow = 2, ncol = 2)


A * B
#multiplication order matters, can decided whether you can multiply or not and how you do it if same number it can affect your product

#linear comibantion

#spanning set matrix

#spanning set: a collection of vectors, typically the rows or columns of that matrix, 
#that can be used to generate all other vectors within that matrix's row space or column space through linear combinations

#invertibility of the matrix

#A^-1 A multiplied by inverse is the identity matrix

#All columns of A are linearly independent

#determinant condition important!