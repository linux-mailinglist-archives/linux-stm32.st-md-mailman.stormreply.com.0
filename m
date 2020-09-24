Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB08276B56
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Sep 2020 10:02:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9172DC3FADE;
	Thu, 24 Sep 2020 08:02:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B19CC3FAD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Sep 2020 08:02:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08O81uVe022453; Thu, 24 Sep 2020 10:02:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=bCUBFmWtTPnQyN/Hu8xkI73KOtRV/y37x8FA0MEEGc0=;
 b=llMOrdYoJzW79whZF/bf6pCncPh2n5rzm25bAt0PRELvjaNQqfoSaECwKw9Fjl0jc8jl
 aviNvJI1M3n9uGOLp0vdSWEa0uhOlYyfJLWDo36N6D5GG0+CIeJ/LrHEekDZEHAw+MEP
 5xsMxLaEgDifVPQL3zvw1Llrs1riSu1QNQn4xFJNL/ckd8BdT2pE1MB0K0WcDJB/AdBI
 gZr6Mr4Wzk+dHWDFL7gt2hI8kQpkgXdXeTyswpJu0GeAJbEyI3UcAasCQkGWj6GJpRDV
 IK5zojwBI5DDHERAQbf4NKyEXE1Dsq77qmHoIkVW2EVrXaf8tF3DKk+cWp6QSjdAS7ol tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33n8vf43f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 10:02:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BFD510002A;
 Thu, 24 Sep 2020 10:02:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DFE8A21FEB1;
 Thu, 24 Sep 2020 10:02:44 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.48) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Sep
 2020 10:02:43 +0200
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
References: <20200827072101.26588-1-arnaud.pouliquen@st.com>
 <20200827072101.26588-4-arnaud.pouliquen@st.com>
 <be888a4b-b931-521b-42c7-fd4e60afd945@pengutronix.de>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <c8fbe2df-a648-913a-d9f9-19e2202f1687@st.com>
Date: Thu, 24 Sep 2020 10:02:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <be888a4b-b931-521b-42c7-fd4e60afd945@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-24_05:2020-09-24,
 2020-09-24 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 3/3] ARM: dts: stm32: update stm32mp151
 for remote proc synchronisation support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Ahmad,

On 9/24/20 7:45 AM, Ahmad Fatoum wrote:
> Hello Arnaud,
> 
> On 8/27/20 9:21 AM, Arnaud Pouliquen wrote:
>> Two backup registers are used to store the Cortex-M4 state and the resource
>> table address.
>> Declare the tamp node and add associated properties in m4_rproc node
>> to allow Linux to attach to a firmware loaded by the first boot stages.
>>
>> Associated driver implementation is available in commit 9276536f455b3
>> ("remoteproc: stm32: Parse syscon that will manage M4 synchronisation").
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>  arch/arm/boot/dts/stm32mp151.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
>> index bfe29023fbd5..842ecffae73a 100644
>> --- a/arch/arm/boot/dts/stm32mp151.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp151.dtsi
>> @@ -1541,6 +1541,11 @@
>>  			status = "disabled";
>>  		};
>>  
>> +		tamp: tamp@5c00a000 {
>> +			compatible = "st,stm32-tamp", "syscon";
>> +			reg = <0x5c00a000 0x400>;
>> +		};
>> +
> 
> Just saw this now. I have a pending patch adding this node as well:
> https://lore.kernel.org/patchwork/patch/1306971/
> 
> For my use case, I need a "simple-mfd" compatible to allow child
> nodes to be probed.
> 
> Could you CC me when you send out your v2, so I can rebase?
> (Or if you don't mind, just add the "simple-mfd" into the compatible
> list yourself :-)

I prefer that you propose the "simple-mfd" compatibility. I do not master the
consequence of adding it...
I will add you in cc of my v2 , but as your patch could trig some discussions
I would suggest to send in advance a patchset including this patch and your patch
on top of, just add a reference to this series in the cover letter and explain
potential impact (or non impact) on the legacy.

Regards,
Arnaud
 
> 
> Cheers
> Ahmad
> 
>>  		/*
>>  		 * Break node order to solve dependency probe issue between
>>  		 * pinctrl and exti.
>> @@ -1717,6 +1722,8 @@
>>  			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
>>  			st,syscfg-tz = <&rcc 0x000 0x1>;
>>  			st,syscfg-pdds = <&pwr_mcu 0x0 0x1>;
>> +			st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
>> +			st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>>  			status = "disabled";
>>  		};
>>  	};
>>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
