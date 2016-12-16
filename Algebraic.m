function R = Algebraic(nume, d)
	fid = fopen(nume,'r');%deschid fisierul
	nr=1;
	N=fscanf(fid,'%d',1);%citesc primul numar
	A=zeros(j);
	for i=1:N
		a=fscanf(fid,'%d',1);%citesc numarul nodului
		b=fscanf(fid,'%d',1);%citesc numarul de linkuri ale nodului
		c=fscanf(fid,'%d',b);%citesc linkurile
		for x=1:b
			A(a,c(x))=1;
			if(a==c(x))
				A(a,c(x))=0;
				b--;
				end

		end
		k(i)=b;%construiesc matricea de adiacenta

	end	
	one=ones(N,1);
	K=eye(N);
	for i=1:N
		K(i,i)=1/k(i);%inversa matricei k(matrice diagonala)
	end
	
	I=eye(N);
	M=(K * A)';
	X=(I-d*M);
	[q,r]=gram_schmidt(X);	
	for i=1:N
		INV(:,i)=SST(r,q'(:,i));%calculez inversa cu GS
		end
	R=INV * ((1-d)/N)*one;

end
