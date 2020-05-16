Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EC41D63AD
	for <lists+linux-stm32@lfdr.de>; Sat, 16 May 2020 20:51:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56C75C36B20;
	Sat, 16 May 2020 18:51:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A4D6C36B16
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 May 2020 18:51:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04GIlKQa019731; Sat, 16 May 2020 20:51:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=98PF3Cew3LuM6AYgQh1W40dQPXP7atthK4LeCf/+19E=;
 b=f1ExUjU3NRU+4fQ/2OWAUPkl6B9gIPBoQr51OjScurx0Td7hqEuOgkcBiZjcyYlchX0V
 YtDzQrw29iM1ZdJhOgjAh3GYzz8Ad/AQvyAY8JMIpB3E21MQHZrjstaGLVrEryURAdSX
 wfRWPo5/eFdyzorJIxLJqQQJWM1Oy6lAmcQI5FcqxOhrqtOYoQGN7GxH481DUoeKl1+4
 P6d6sbsHPJJNNiCfzE4mijWxTvuZaKGXbZXYM5XZR5rM6NdxV2Q/LakdoTjX/JB4HJeE
 5yjW2mCZuRPFf0c2qw3edsPaIi8LP6R68O++OfwhLUH4bAz64yyjSktkiISm7IlmzqKO 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3125a8uv1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 May 2020 20:51:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 29BED10002A;
 Sat, 16 May 2020 20:51:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC7A02BBAE6;
 Sat, 16 May 2020 20:51:26 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 16 May
 2020 20:51:26 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Sat, 16 May 2020 20:51:26 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Fabrice GASNIER
 <fabrice.gasnier@st.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Thread-Topic: [Linux-stm32] [PATCH v7 5/6] clocksource: Add Low Power STM32
 timers driver
Thread-Index: AQHWIq5ye17eyc+P4UqbHd8uXquVx6ipMz+AgAHL3IA=
Date: Sat, 16 May 2020 18:51:26 +0000
Message-ID: <a9c2c278-9b45-972e-c015-8235f8fe9731@st.com>
References: <20200420121620.2099-1-benjamin.gaignard@st.com>
 <20200420121620.2099-6-benjamin.gaignard@st.com>
 <bbac5aa5-1c95-456e-3141-006d4fa86095@st.com>
 <103c5558-4dc9-63c9-4994-5c8f97646eee@linaro.org>
In-Reply-To: <103c5558-4dc9-63c9-4994-5c8f97646eee@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <BDD34949A5A120498BAFB2CEE1F28DE1@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-16_11:2020-05-15,
 2020-05-16 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pascal
 PAILLET-LME <p.paillet@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v7 5/6] clocksource: Add Low Power STM32
 timers driver
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



On 5/15/20 5:25 PM, Daniel Lezcano wrote:
> Hi Benjamin,
>
> On 05/05/2020 09:26, Benjamin GAIGNARD wrote:
>>
>> On 4/20/20 2:16 PM, Benjamin Gaignard wrote:
>>> From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>>>
>>> Implement clock event driver using low power STM32 timers.
>>> Low power timer counters running even when CPUs are stopped.
>>> It could be used as clock event broadcaster to wake up CPUs but not like
>>> a clocksource because each it rise an interrupt the counter restart from 0.
>>>
>>> Low power timers have a 16 bits counter and a prescaler which allow to
>>> divide the clock per power of 2 to up 128 to target a 32KHz rate.
>> Gentle ping to reviewers on this driver part of the series.
>> The bindings and the MFD have been reviewed so I hope I can progress
>> on the driver part too.
> [ ... ]
>
> sorry for the delay.
>
> How do you want these patches to be merged?
>
> Shall I pick patch 6/7 ?
If Lee agrees I think the best is to get all the patches in mfd tree because
of the dependencies between them.

Benjamin
>
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
