function [R1 R2 R3] = PageRank(nume,d,eps)
	R1=Iterative(nume,d,eps);
	R2=Algebraic(nume,d);
	R3=Power(nume,d,eps);
	n=length(R2);
	input=fopen(nume,'r');
	a=fscanf(input,'%d',1);
	for i=1:a
	x=fscanf(input,'%d',1);
	y=fscanf(input,'%d',1);
	c=fscanf(input,'%d',y);
	end
	val1=fscanf(input,'%f',1);%citesc val1 si val2
	val2=fscanf(input,'%f',1);
	fclose(nume);

	output=strcat(nume,'.out');
	
	fid=fopen(output,'w');
	
	fprintf(fid,'%d',a);%afisez primul nr
	fprintf(fid,'\n');
	fprintf(fid,'\n');
	for i=1:length(R1)
		fprintf(fid,'%f',R1(i));%afisez R1
		fprintf(fid,'\n');
		end
		fprintf(fid,'\n');
	for i=1:length(R2)
		fprintf(fid,'%f',R2(i))%afisez R2
		fprintf(fid,'\n');
		end
		fprintf(fid,'\n');
	for i=1:length(R3)
		fprintf(fid,'%f',R3(i));%afisez R3
		fprintf(fid,'\n');
	end
	fprintf(fid,'\n');
	PR1=R2;
	for i=1:length(PR1)
		for j=i+1 : length(PR1)
			if(PR1(j)>PR1(i))
				aux=PR1(i);
				PR1(i)=PR1(j);%sortez vectorul PR1
				PR1(j)=aux;
			end
		end
	end


	for i=1:length(PR1)
		for j=1:length(PR1)
			if(PR1(i)==R2(j))
				fprintf(fid,'%d ',i);
				fprintf(fid,'%d ',j);
				F=Apartenenta(PR1(i),val1,val2);
				fprintf(fid,'%f',F);
				fprintf(fid,'\n');
				
			end
		end
	end
	fclose(fid);
end

