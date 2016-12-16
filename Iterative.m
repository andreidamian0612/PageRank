function R = Iterative(nume, d, eps)
	fid = fopen(nume,'r');
	nr=1;
	N=fscanf(fid,'%d',1);
	A=zeros(N);
	for i=1:N
		a=fscanf(fid,'%d',1);%citesc nr nodului
		b=fscanf(fid,'%d',1);%citesc nr de linkuri
		c=fscanf(fid,'%d',b);%citesk linkurile
		for x=1:b
			A(a,c(x))=1;
			if(a==c(x))
				A(a,c(x))=0;
				b--;%daca are link catre el insusi scad nr de linkuri
				end

		end
		k(i)=b;%construiesc matricea de adiacenta

	end	
	one=ones(N,1);
	K=eye(N);
	for i=1:N	
	K(i,i)=1/k(i);
	end
	M=(K * A)';
	R=(ones(N,1));
	R(:,1)=1/N;
	
	R(:,2)=d * M * R(:,1) + ((1-d)/N)*one;	%aplic algoritmul din enunt
	t=2;
	while( norm(R(:,t) - R(:,t-1)) > eps)
		R(:,t+1) = d *M *R(:,t) + ((1-d)/N);
		t++;
		end
R=R(:,end);

end
