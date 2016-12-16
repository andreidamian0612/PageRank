function R = Power(nume, d, eps)
	fid = fopen(nume,'r');
	nr=1;
	N=fscanf(fid,'%d',1);
	A=zeros(N);
	for i=1:N
		a=fscanf(fid,'%d',1);
		b=fscanf(fid,'%d',1);
		c=fscanf(fid,'%d',b);
		for x=1:b
			A(a,c(x))=1;
			if(a==c(x))
				A(a,c(x))=0;
				b--;
				end

		end
		k(i)=b;

	end	
	one=ones(N,1);
	K=eye(N);
	for i=1:N	
	K(i,i)=1/k(i);
	end
	M=(K * A)';
	R=(ones(N,1));
	R(:,1)=1/N;
	
	R(:,2)=d * M * R(:,1) + ((1-d)/N)*one;
	t=2;
	while( norm(R(:,t) - R(:,t-1)) > eps)
		R(:,t+1) = d *M *R(:,t) + ((1-d)/N);
		t++;
		end
E=ones(N,N);
R=(d*M + ((1-d)/N)*E)*R;%aplic formula din enunt
R=R(:,end);

end
