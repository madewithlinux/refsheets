# CSCE 441 Refsheet

# Geometry

## Vector
* angle between vectors $a$ and $b$: 
	$\theta = \cos^{-1}\frac{a\dot b}{|a||b|}$
* dot product (scalar product):
	$a \dot b = a_xb_x + a_yb_y + a_zb_z$
	`a . b = a_xb_x + a_yb_y + a_zb_z`
	* represented here with period
	* properties:
		* `a . a = |a|^2`
		* `a . b = b . a` comutativity
		* `a . (b+c) = a . b + a . c` distributive
		* etc...
* cross product (vector product): 
	$a \times b = [ +(a_y b_z - a_z b_y)i
					-(a_x b_z - a_z b_x)j
					+(a_x b_y - a_y b_x)k ]$

## Matrix
* multiplying any matrix by the identity matrix yields the original matrix
	```
	  A + B = B + A
	  A + ( B + C ) = ( A + B ) + C
	  b ( A + B ) = b A + b B
	  ( b + d ) A = b A + d A
	  b ( d A ) = ( bd ) A = d ( b A )
	```
* transpose: swap rows and columns
* product of $A$ and $B$:
	* matrixes are indexed like `matrix(row, column)` (just like matlab)
	* defined iff (number of colums in $A$) == (number of rows in $B$). 
		That is, `size(A) == [m n] && size(B) == [n p]`
	* for result matrix `C`, each element defined as:
		`C(i,j) = A(i,1)*B(1,j) + A(i,2)*B(2,j) + ... + A(i,n)*B(n,j)`
	* properties:
		```
		 ( AB ) C = A ( BC )
		 A ( B + C ) = AB + AC
		 ( A + B ) C = AC + BC
		 A ( k B ) = k ( AB ) = ( k A ) B
		```
* determinant of A is sometimes written |A|