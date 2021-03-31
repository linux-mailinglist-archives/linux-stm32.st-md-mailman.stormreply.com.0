Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0D934CCD2
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Mar 2021 11:16:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDF1BC5719C;
	Mon, 29 Mar 2021 09:16:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A6F6C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 09:16:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12T98hNb031476; Mon, 29 Mar 2021 11:16:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=1fp/BXYLYqPxjXC4DncX+Os2t1/CmOZQmZcEUOGAWj4=;
 b=mDnUly/cLzf0OalgOT4c9qfTj1+9QktPJ6VOtCEBceg+6xGwZj6pKaRnARqAx4cTBtMA
 VlkTIKa4YOY9j5ej6UTaXp8UcWLVxix59NDkcWCLrQOUDLXSTky3L6/p0+RDYcAm3xUN
 5VmJgvmPnIb5VAziWBim2+Igr8DabjB+/U58EVtKECZEqrg398Aa7nVmu1LAeatKqwBl
 bLTMC8pmLxKajGOgNCBUzQLG0Wx/M0izURvpi+xhmk3rydQS7TKfE7VV6QOFd5mUoGdJ
 cx+EES2czIgYvvYs/hAkX3CYbtq3xW6mq6RHR8IKQaHQHWR7PR8yMUf7LUbUi1eYdGH3 bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37jvdmkn3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Mar 2021 11:16:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5DFC8100034;
 Mon, 29 Mar 2021 11:16:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28D85237AFC;
 Mon, 29 Mar 2021 11:16:04 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 29 Mar
 2021 11:16:03 +0200
To: Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, <wsa@kernel.org>, <robh+dt@kernel.org>
References: <1612515104-838-1-git-send-email-alain.volmat@foss.st.com>
 <1612515104-838-5-git-send-email-alain.volmat@foss.st.com>
 <59aec92b-9e5d-b9e9-0fee-d14d50281d4b@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <da959215-eb44-1dfb-61fb-0ce8354db7ce@foss.st.com>
Date: Mon, 29 Mar 2021 11:16:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <59aec92b-9e5d-b9e9-0fee-d14d50281d4b@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-29_05:2021-03-26,
 2021-03-29 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/5] ARM: dts: stm32: enable the analog
 filter for all I2C nodes in stm32mp151
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Alain

On 2/10/21 9:39 AM, Pierre Yves MORDRET wrote:
> Hello
> 
> Looks good to me
> 
> Reviewed-by: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
> 
> Thx
> Regards
> 
> 

Applied on stm32-next.

Thanks.
Alex

> On 2/5/21 9:51 AM, Alain Volmat wrote:
>> Enable the analog filter for all I2C nodes of the stm32mp151.
>>
>> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
>> ---
>>   arch/arm/boot/dts/stm32mp151.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
>> index 3c75abacb374..558fc8fb38b6 100644
>> --- a/arch/arm/boot/dts/stm32mp151.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
>> @@ -493,6 +493,7 @@
>>   			#size-cells = <0>;
>>   			st,syscfg-fmp = <&syscfg 0x4 0x1>;
>>   			wakeup-source;
>> +			i2c-analog-filter;
>>   			status = "disabled";
>>   		};
>>   
>> @@ -508,6 +509,7 @@
>>   			#size-cells = <0>;
>>   			st,syscfg-fmp = <&syscfg 0x4 0x2>;
>>   			wakeup-source;
>> +			i2c-analog-filter;
>>   			status = "disabled";
>>   		};
>>   
>> @@ -523,6 +525,7 @@
>>   			#size-cells = <0>;
>>   			st,syscfg-fmp = <&syscfg 0x4 0x4>;
>>   			wakeup-source;
>> +			i2c-analog-filter;
>>   			status = "disabled";
>>   		};
>>   
>> @@ -538,6 +541,7 @@
>>   			#size-cells = <0>;
>>   			st,syscfg-fmp = <&syscfg 0x4 0x10>;
>>   			wakeup-source;
>> +			i2c-analog-filter;
>>   			status = "disabled";
>>   		};
>>   
>> @@ -1533,6 +1537,7 @@
>>   			#size-cells = <0>;
>>   			st,syscfg-fmp = <&syscfg 0x4 0x8>;
>>   			wakeup-source;
>> +			i2c-analog-filter;
>>   			status = "disabled";
>>   		};
>>   
>> @@ -1570,6 +1575,7 @@
>>   			#size-cells = <0>;
>>   			st,syscfg-fmp = <&syscfg 0x4 0x20>;
>>   			wakeup-source;
>> +			i2c-analog-filter;
>>   			status = "disabled";
>>   		};
>>   
>>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
