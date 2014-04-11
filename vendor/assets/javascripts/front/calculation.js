
	function getAmortization(a,n,p,d) {
		var i=0;
		var sATline="";
		var oAmortizationTable='';
		
		/* Calculate amortization and write table to text area **/
		var payment = getPayment(a-d,n,p);
		
		$("#calc-angsuran").val(addCommas(Math.round(payment)));
		
		oAmortizationTable += '<table width="100%" class="table table-striped cal-table">';
		oAmortizationTable += "<tr id='amortization-title'>";
		oAmortizationTable += '<td align="center" width="5%">Month</td>';
		oAmortizationTable += '<td align="right" width="20%">Balance</td>';
		oAmortizationTable += '<td align="right" width="20%">Principal</td>';
		oAmortizationTable += '<td align="right" width="15%">Interest</td>';
		oAmortizationTable += '<td align="right" width="20%">Payment</td>';
		oAmortizationTable += '<td align="right" width="20%">Total</td>';
		oAmortizationTable += '</tr>';
		               
		var balance=a-d;
		var interest = 0.0;
		var principal=0.0;
		var total=0.0;
		for (i=1;i<=n;i++) {
			interest = balance*p/1200;
			total += payment;
			principal = payment-interest;
			balance -= principal;
			if(i%2==0) oAmortizationTable += "<tr class='amortization-even-row'>";
			else if(i%2!=0) oAmortizationTable += "<tr class='amortization-odd-row'>";
			oAmortizationTable += '<td align="center">'+ i.toString() +"</td>";
			oAmortizationTable += '<td align="right">'+ addCommas((Math.round(balance))) +"</td>";
			oAmortizationTable += '<td align="right">'+ addCommas((Math.round(principal))) +"</td>";
			oAmortizationTable += '<td align="right">'+ addCommas((Math.round(interest))) +"</td>";
			oAmortizationTable += '<td align="right"><font color="red">'+ addCommas((Math.round(payment))) +"</font></td>";
			oAmortizationTable += '<td align="right">'+ addCommas((Math.round(total))) +"</td>";
			oAmortizationTable += "</tr>";
		}
		oAmortizationTable+='</table>';
		return oAmortizationTable;
	}

	function getSpaces(n) {
		var i=0; 
		var sSpaces="";
		for (i=0;i<n;i++) {sSpaces += " ";}
		return sSpaces;
	}

	function getPayment(a,n,p) {
		/* Calculates the monthly payment from annual percentage
		   rate, term of loan in months and loan amount. **/
		var acc=0;
		var base = 1 + p/1200;
		for (i=1;i<=n;i++) 
			{ acc += Math.pow(base,-i); }
		return a/acc;
	}
	function addCommas(nStr)
	{
		nStr += '';
		x = nStr.split('.');
		x1 = x[0];
		x2 = x.length > 1 ? '.' + x[1] : '';
		var rgx = /(\d+)(\d{3})/;
		while(rgx.test(x1))
		{
			x1 = x1.replace(rgx, '$1' + ',' + '$2');
		}
		return x1 + x2;
	}
	function removeCommas(nStr)
	{
		nStr += '';
		x = nStr.split(',');
		y = "";
		ctr = x.length;
		for(i=0;i<ctr;i++)
		{
			y = y+x[i];
		}
		return y;
	}