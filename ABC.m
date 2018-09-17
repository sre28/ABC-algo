%Co-efficient generation for ABC
for i=1:N
	m= randi([3000,8000],[1,Order])/5000-1;
	m(Order)=0;
	summer=0;
	for lo=1:Order-1
		summer=summer+m(lo);
	end
	m(Order)=0.5-summer;
	for j=1:Order
		x(i,j)=m(j);
	end

	%Evaluation row-wise followed by column-wise
	for i=1:N
		for i1=1:Breadth %image
			for i2=1:Length %image
				for k=1:4
					if(i2 - k >= 0)
					I3(i1,i2,i)=I3(i1,i2,i)+x(i,k)*double(I(i1,(i2-k)+1));
					end
				end
			end
		end
	end
end

for i=1:N
	for i1=1:Breadth %image
		for i2=1:Length %image
			for k=1:4
				if(i2 - k >= 0)
				I4(i1,i2,i)=I4(i1,i2,i)+v(i,k)*double(I(i1,(i2-k)+1));
				end
			end
		end
	end
end


for i=1:N
	for i2=1:Length %image
		for i1=1:Breadth %image
			for k=1:4
				if(i1 - k >= 0)
				I1(i1,i2,i)=I1(i1,i2,i)+x(i,k)*I3(i1-k+1,i2,i);
				end
			end
		end
    end
end

for i=1:N
	for i2=1:Length %image
		for i1=1:Breadth %image
			for k=1:4
				if(i1 - k >= 0)
				I2(i1,i2,i)=I2(i1,i2,i)+v(i,k)*I4(i1-k+1,i2,i);
				end
			end
		end
	end
end

for i=1:N
	for i1=1:Breadth
		for i2=1:Length
			mse1(i)=mse1(i)+(I1(i1,i2,i)-double(I(i1,i2)));
		end
	end
end

for i=1:N
	for i1=1:Breadth
		for i2=1:Length
			mse2(i)=mse2(i)+(I2(i1,i2,i)-double(I(i1,i2)));
		end
	end
end
