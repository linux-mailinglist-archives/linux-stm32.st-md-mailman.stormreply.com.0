Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEB8157163
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Feb 2020 10:03:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CB0EC36B0B;
	Mon, 10 Feb 2020 09:03:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C99B8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 09:03:04 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01A8mLPn001938; Mon, 10 Feb 2020 10:02:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=H3rjV2A7fROz9cnfk/NtpzzXf8VAhOt6rYAt5Ftt45U=;
 b=D5V7BBkvCc0kUybXL+upTzZgl75lCiYEW+mg1iyuSGZCPHhDqvHoOLqEIwWAHpsvx3JT
 lvYZvivPSRavo5I9BBLtWVpiBqbpSFtNLa5TUve6Sr8ggCN5Hcu6D7PowvHqmhZ9lZ9G
 vDepXpzaLOSvrHOH/kYlLUCn8WG1xVCKPykOH0L3Ry0LCAQuGllUluzwr9X0RWoA44rs
 aEhtdrV6O2OgcpZ2A3Sa0gKshHV458DIZuhKJqmGcCM1HKSo7z9m8vsTEc8PoCjFFGst
 Cyb1vC6w20bsewVzwgofcOqKYauilVE+Ms51/8SvoIYyPnd6sbaOSkqgAreHz5+QKCaa kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urgr6gv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 10:02:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EAD0010002A;
 Mon, 10 Feb 2020 10:02:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D059F2B793A;
 Mon, 10 Feb 2020 10:02:36 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 10 Feb
 2020 10:02:36 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Mon, 10 Feb 2020 10:02:36 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Pascal PAILLET-LME <p.paillet@st.com>, "linus.walleij@linaro.org"
 <linus.walleij@linaro.org>
Thread-Topic: [PATCH v3 0/2] clockevent: add low power STM32 timer
Thread-Index: AQHV1dN0ASRe/0fvOUqwQX9rlF1+nagUJUGA
Date: Mon, 10 Feb 2020 09:02:36 +0000
Message-ID: <7d062f5b-9272-c7db-7a9e-b908870dd8b4@st.com>
References: <20200128120702.26166-1-benjamin.gaignard@st.com>
In-Reply-To: <20200128120702.26166-1-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <5AF5E50E0266274A90729B9F125EDBE9@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_02:2020-02-07,
 2020-02-10 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 0/2] clockevent: add low power STM32
	timer
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


On 1/28/20 1:07 PM, Benjamin Gaignard wrote:
> This series add low power timer as boadcast clockevent device.
> Low power timer could runs even when CPUs are in idle mode and
> could wakeup them.

Gentle ping to reviewers.

Thanks,

Benjamin

>
> version 3:
> - fix timer set sequence
> - don't forget to free irq on remove function
> - use devm_kzalloc to simplify errors handling in probe function
>
> version 2:
> - stm32 clkevent driver is now a child of the stm32 lp timer node
> - add a probe function and adpat the driver to use regmap provide
>    by it parent
> - stop using timer_of helpers
> - document the bindings inside stm32 lptimer yaml
>
> Benjamin Gaignard (2):
>    dt-bindings: mfd: Document STM32 low power clkevent bindings
>    clocksource: Add Low Power STM32 timers driver
>
>   .../devicetree/bindings/mfd/st,stm32-lptimer.yaml  |  14 ++
>   drivers/clocksource/Kconfig                        |   4 +
>   drivers/clocksource/Makefile                       |   1 +
>   drivers/clocksource/timer-stm32-lp.c               | 248 +++++++++++++++++++++
>   4 files changed, 267 insertions(+)
>   create mode 100644 drivers/clocksource/timer-stm32-lp.c
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
