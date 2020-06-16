Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 658071FAF75
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2020 13:44:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 267A3C36B11;
	Tue, 16 Jun 2020 11:44:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A473C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 11:44:20 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05GBZ0Wk012134; Tue, 16 Jun 2020 13:44:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=NneIqC9y5kxpsEMwdz4kWV76JLL/a0bbk4vzbiTymbc=;
 b=z43s9fBxwe8u1Z2wLMtNhnb0RgCk2+j4zVOjmfmdqMgo3IwbIS8GbmxYvcj//IJXntWk
 GdKCcRbNOz5K+anwkSwBrkQNbEzSByLg21e+rUUBJS0/3lFrpqBuQGWjtmL14FqZcwb1
 MpFcsh3ooNLRGAGLCINvnqiH0ZWA1LfwoJPAnvDdmxOBE+sPV2O1lT/aT7ycVzXDYFMt
 iWal/IIAk1jW1O1f/0yIOEQo+wZVP6Rz9BvEw9AMvxzfe6wfY/a6Hsl/ioxggnfxjyhS
 FkOokVv9rz7ncGceHH0TwkE3f0g+bnf5E2haGxSEGKDB3aFb1jryIzuHHaoTby2bQmgH bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mmjvy2ef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 13:44:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 13E23100034;
 Tue, 16 Jun 2020 13:44:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 024CB2C198C;
 Tue, 16 Jun 2020 13:44:02 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 16 Jun
 2020 13:44:01 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Tue, 16 Jun 2020 13:44:01 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Fabrice GASNIER <fabrice.gasnier@st.com>, "lee.jones@linaro.org"
 <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Thread-Topic: [RESEND v7 0/6] clockevent: add low power STM32 timer
Thread-Index: AQHWOaYlv9Zz94A0REiA+Z4Po30KbajbEgYA
Date: Tue, 16 Jun 2020 11:44:01 +0000
Message-ID: <50df6585-d9df-4cb3-5589-aab2c97cad51@st.com>
References: <20200603125439.23275-1-benjamin.gaignard@st.com>
In-Reply-To: <20200603125439.23275-1-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <A3A9FD8EF4B9F44C864F4556F63E33A2@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_04:2020-06-16,
 2020-06-16 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [RESEND v7 0/6] clockevent: add low power STM32
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



On 6/3/20 2:54 PM, Benjamin Gaignard wrote:
> This series add low power timer as boadcast clockevent device.
> Low power timer could runs even when CPUs are in idle mode and
> could wakeup them.
>
> Lee has acked the MFD part.
> Clocksource driver still need to be reviewed by maintainers.
> Add missing part of the bindings to describe interrupt.

Hi Lee,

I think everything has been reviewed and acked in this series.
May I have forgot something that prevent it to be merge ?

Benjamin

>
> version 7 resend:
> - with Daniel ack for driver patch
> - with Rob review for bindings patch
>
> version 7:
> - rebased on top of v5.7-rc2
>
> version 6:
> - simplify binding, DT and code to use only one interrupt
>
> version 5:
> - document interrupts and interrupt-names bindings
> - use a different wake up interrupt
> - add device-tree patch
> - make STM32MP157 select low power timer configuration flag
> - enable fast_io in regmap configuration
>
> version 4:
> - move defines in mfd/stm32-lptimer.h
> - change compatible and subnode names
> - document wakeup-source property
> - reword commit message
> - make driver Kconfig depends of MFD_STM32_LPTIMER
> - remove useless include
> - remove rate and clk fields from the private structure
> - to add comments about the registers sequence in stm32_clkevent_lp_set_timer
> - rework probe function and use devm_request_irq()
> - do not allow module to be removed
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
>
>
> Benjamin Gaignard (6):
>    dt-bindings: mfd: Document STM32 low power timer bindings
>    ARM: dts: stm32: Add timer subnodes on stm32mp15 SoCs
>    mfd: stm32: Add defines to be used for clkevent purpose
>    mfd: stm32: enable regmap fast_io for stm32-lptimer
>    clocksource: Add Low Power STM32 timers driver
>    ARM: mach-stm32: select low power timer for STM32MP157
>
>   .../devicetree/bindings/mfd/st,stm32-lptimer.yaml  |   5 +
>   arch/arm/boot/dts/stm32mp151.dtsi                  |  35 ++++
>   arch/arm/mach-stm32/Kconfig                        |   1 +
>   drivers/clocksource/Kconfig                        |   4 +
>   drivers/clocksource/Makefile                       |   1 +
>   drivers/clocksource/timer-stm32-lp.c               | 221 +++++++++++++++++++++
>   drivers/mfd/stm32-lptimer.c                        |   1 +
>   include/linux/mfd/stm32-lptimer.h                  |   5 +
>   8 files changed, 273 insertions(+)
>   create mode 100644 drivers/clocksource/timer-stm32-lp.c
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
