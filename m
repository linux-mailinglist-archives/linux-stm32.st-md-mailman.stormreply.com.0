Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6E218B155
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2020 11:28:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F008C36B0D;
	Thu, 19 Mar 2020 10:28:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 358BBC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2020 10:28:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02JAR7eY032209; Thu, 19 Mar 2020 11:28:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=a8IUIDV/simADAYkwM+Njnv3lTBx4k59GizTkWNN6Ss=;
 b=bkBlNCmUITsQYwAIxDnXxiof6dfStcMQbxGYnOstUEFFI+V/ja+pfnndlQ3ZN8hLH0B3
 b+QUBAtxCj5IBu9RWXHrpB26PYPUXuwmSsNqlJ0vJPFIMC3aTdGOm8K0qDGsC+pmPEtG
 +bHO3dOG9podOt62m+JmVlBu4y/NdkbfPyzjTPxFmIj9dc5ff3ShkYAqCHLc90RrWQ98
 EKW3VeunwewQVQWDDkyE+/ZLYcZPzfQdsyVdZX7tZQRwedRHYkD6IElxfdceTVH/iu/k
 EfgP2ECx8WZiBoSrWIexJtYkgZw1zVGEexLxS/quRrB1UkYUrakRbQwdSYfSmosiKuIb YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95us066-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 11:28:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 996FB100034;
 Thu, 19 Mar 2020 11:28:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 80D312A5810;
 Thu, 19 Mar 2020 11:28:23 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 19 Mar
 2020 11:28:23 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Thu, 19 Mar 2020 11:28:23 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Lee Jones <lee.jones@linaro.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>
Thread-Topic: [PATCH v4 2/3] mfd: stm32: Add defines to be used for clkevent
 purpose
Thread-Index: AQHV5ZiQaom2ANb1fkS0EaDa85E9JagjxuwAgCwKSQCAAAURAA==
Date: Thu, 19 Mar 2020 10:28:23 +0000
Message-ID: <b21ac320-080d-3995-1c63-ca5c187224c6@st.com>
References: <20200217134546.14562-1-benjamin.gaignard@st.com>
 <20200217134546.14562-3-benjamin.gaignard@st.com>
 <e9f7eaac-5b61-1662-2ae1-924d126e6a97@linaro.org>
 <20200319101014.GA5477@dell>
In-Reply-To: <20200319101014.GA5477@dell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <85765BABAB3113468E684283C64674E7@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_02:2020-03-18,
 2020-03-19 signatures=0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4 2/3] mfd: stm32: Add defines to be used
 for clkevent purpose
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



On 3/19/20 11:10 AM, Lee Jones wrote:
> On Thu, 20 Feb 2020, Daniel Lezcano wrote:
>> On 17/02/2020 14:45, Benjamin Gaignard wrote:
>>> Add defines to be able to enable/clear irq and configure one shot mode.
>>>
>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>> Are you fine if I pick this patch with the series?
> Nothing heard from you since I Acked this.
>
> Are you still planning on taking this patch?
>
> If so, can you also take patch 1 please?
I will send a v5.
Daniel could you wait until that to merge all the patches (even if this 
one won't change) ?

Benjamin
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
