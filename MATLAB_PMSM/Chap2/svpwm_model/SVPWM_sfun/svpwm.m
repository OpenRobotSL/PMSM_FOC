%u（1）为参考电压的幅值；u（2）为参考电压的角度；u（3）为PWM的采样周期；
%Ta相当于书中的T4，Tb相当于书中的T6

	function [sf]=svpwm(u)
    %===初始化====
    sa=0;
    sb=0;
    sc=0;
    ts=0.0002;
    vdc=700; 
    peak_phase_max = vdc/sqrt(3);
	x=u(2);   
	y=u(3);
	mag=(u(1)/peak_phase_max) * ts;
    
	%===扇区I====
	if (x>=0) && (x<pi/3)
		ta = mag * sin(pi/3-x);
		tb = mag * sin(x);
		t0 =(ts-ta-tb);		
		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
		v1=[0 1 1 1 1 1 0];
		v2=[0 0 1 1 1 0 0];
		v3=[0 0 0 1 0 0 0];		
		for j=1:7
			if(y<t1(j))
				break
			end
        end	
		sa=v1(j);
		sb=v2(j);
		sc=v3(j);
    end

	%===扇区II====
	if (x>=pi/3) && (x<2*pi/3)
		adv= x-pi/3;		
		tb = mag * sin(pi/3-adv);
		ta = mag * sin(adv);
		t0 =(ts-ta-tb);
		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
		v1=[0 0 1 1 1 0 0];
		v2=[0 1 1 1 1 1 0];
		v3=[0 0 0 1 0 0 0];
	for j=1:7
	    if(y<t1(j))
	        break
	    end
    end
	sa=v1(j);
	sb=v2(j);
	sc=v3(j); 
    end
    
	%===扇区III====

	if (x>=2*pi/3) && (x<pi)
		adv=x-2*pi/3;
		ta = mag * sin(pi/3-adv);
		tb = mag * sin(adv);
		t0 =(ts-ta-tb);
		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
		v1=[0 0 0 1 0 0 0];
		v2=[0 1 1 1 1 1 0];
		v3=[0 0 1 1 1 0 0];	
	for j=1:7
	    if(y<t1(j))
	        break
	    end
    end
	sa=v1(j);
	sb=v2(j);
	sc=v3(j); 
end

	%%===扇区IV====

	if (x>=-pi) && (x<-2*pi/3)
        adv = x  + pi;
		tb= mag * sin(pi/3 - adv);
		ta = mag * sin(adv);
		t0 =(ts-ta-tb);
		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
	v1=[0 0 0 1 0 0 0];
	v2=[0 0 1 1 1 0 0];
	v3=[0 1 1 1 1 1 0];
	for j=1:7
	    if(y<t1(j))
	        break
	    end
    end
	sa=v1(j);
	sb=v2(j);
	sc=v3(j);  
end
	
	% %===扇区V====

	if (x>=-2*pi/3) && (x<-pi/3)
		adv = x+2*pi/3;
		ta = mag * sin(pi/3-adv);
		tb = mag * sin(adv);
		t0 =(ts-ta-tb);
		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
		v1=[0 0 1 1 1 0 0];
		v2=[0 0 0 1 0 0 0];
		v3=[0 1 1 1 1 1 0];
	for j=1:7
	    if(y<t1(j))
	        break
	    end
    end
	sa=v1(j);
	sb=v2(j);
	sc=v3(j); 
end

	%%===扇区VI====

	if (x>=-pi/3) && (x<0)
		adv = x+pi/3;		
		tb = mag * sin(pi/3-adv);
		ta = mag * sin(adv);
		t0 =(ts-ta-tb);
		t1=[t0/4 ta/2 tb/2 t0/2 tb/2 ta/2 t0/4];
		t1=cumsum(t1);
		v1=[0 1 1 1 1 1 0];
		v2=[0 0 0 1 0 0 0];
		v3=[0 0 1 1 1 0 0];	
	for j=1:7
	    if(y<t1(j))
	        break
	    end
	end
	sa=v1(j);
	sb=v2(j);
	sc=v3(j);  
    end	
    sf=[sa, sb, sc];
 end