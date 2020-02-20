Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69451165C12
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2020 11:45:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E976C36B0B;
	Thu, 20 Feb 2020 10:45:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DACAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2020 10:45:27 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KAi29q028248; Thu, 20 Feb 2020 11:45:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=SDLZfN1PVeIeP/oOuE8HENlAFs0IpyTU/Nnjdty9yds=;
 b=IixsFQVL+jgkNMKo+P9LaxgTZZfri46T2GD8br/B8mN71/ZLgHHRSDxp3oG9oT4MLdtA
 +XH/1212Z4GtB+72p6qxZjDzpuyIg9EnpmZnzVh0/azD80xba8VdBaX7MN0rRBwZqtjd
 LRSEmA/AUiaX/eAHPp3glPVR9jufAp6bSvOcQ/Z7g7wJ3Ljar/eo7wVzUbZAABjEBSPV
 mwRxFr4MhFfcYDyXtUVxReOqHj6WHWs4JBlLHdMXhqxntgfDWYobvr464d9ctcpfTFK+
 SX/c8e9Pqp0c7Ytu68FJhHxxyuena0DiZijktOBIDOAMx3vM6aiz38k5YncJ5nMAKAtl kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y8ub1gdap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Feb 2020 11:45:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E1B910002A;
 Thu, 20 Feb 2020 11:45:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CCACC2AAEB9;
 Thu, 20 Feb 2020 11:45:06 +0100 (CET)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 20 Feb
 2020 11:45:06 +0100
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Thu, 20 Feb 2020 11:45:05 +0100
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, "lee.jones@linaro.org"
 <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, Fabrice GASNIER
 <fabrice.gasnier@st.com>
Thread-Topic: [PATCH v4 3/3] clocksource: Add Low Power STM32 timers driver
Thread-Index: AQHV59mpsik/WRqXdUuknFgx3rC1tqgj1SiA
Date: Thu, 20 Feb 2020 10:45:05 +0000
Message-ID: <9cc4af9e-27d0-96c3-b3f1-20c88f89b70a@st.com>
References: <20200217134546.14562-1-benjamin.gaignard@st.com>
 <20200217134546.14562-4-benjamin.gaignard@st.com>
 <687ab83c-6381-57aa-3bc1-3628e27644b5@linaro.org>
In-Reply-To: <687ab83c-6381-57aa-3bc1-3628e27644b5@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <875F2F9A967A304E9315302279A4D65A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_02:2020-02-19,
 2020-02-20 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pascal PAILLET-LME <p.paillet@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4 3/3] clocksource: Add Low Power STM32
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



On 2/20/20 11:36 AM, Daniel Lezcano wrote:
> On 17/02/2020 14:45, Benjamin Gaignard wrote:
>> From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>>
>> Implement clock event driver using low power STM32 timers.
>> Low power timer counters running even when CPUs are stopped.
>> It could be used as clock event broadcaster to wake up CPUs but not like
>> a clocksource because each it rise an interrupt the counter restart from 0.
>>
>> Low power timers have a 16 bits counter and a prescaler which allow to
>> divide the clock per power of 2 to up 128 to target a 32KHz rate.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>> Signed-off-by: Pascal Paillet <p.paillet@st.com>
>> ---
>> version 4:
>> - move defines in mfd/stm32-lptimer.h
>> - change compatiblename
>> - reword commit message
>> - make driver Kconfig depends of MFD_STM32_LPTIMER
>> - remove useless include
>> - remove rate and clk fields from the private structure
>> - to add comments about the registers sequence in stm32_clkevent_lp_set_timer
>> - rework probe function and use devm_request_irq()
>> - do not allow module to be removed
>> - make sure that wakeup interrupt is set
>>
>>   drivers/clocksource/Kconfig          |   7 ++
>>   drivers/clocksource/Makefile         |   1 +
>>   drivers/clocksource/timer-stm32-lp.c | 213 +++++++++++++++++++++++++++++++++++
>>   3 files changed, 221 insertions(+)
>>   create mode 100644 drivers/clocksource/timer-stm32-lp.c
>>
>> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
>> index cc909e465823..9fc2b513db6f 100644
>> --- a/drivers/clocksource/Kconfig
>> +++ b/drivers/clocksource/Kconfig
>> @@ -292,6 +292,13 @@ config CLKSRC_STM32
>>   	select CLKSRC_MMIO
>>   	select TIMER_OF
>>   
>> +config CLKSRC_STM32_LP
>> +	bool "Low power clocksource for STM32 SoCs"
>> +	depends on MFD_STM32_LPTIMER || COMPILE_TEST
>> +	help
>> +	  This option enables support for STM32 low power clockevent available
>> +	  on STM32 SoCs
>> +
>>   config CLKSRC_MPS2
>>   	bool "Clocksource for MPS2 SoCs" if COMPILE_TEST
>>   	depends on GENERIC_SCHED_CLOCK
>> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
>> index 713686faa549..c00fffbd4769 100644
>> --- a/drivers/clocksource/Makefile
>> +++ b/drivers/clocksource/Makefile
>> @@ -44,6 +44,7 @@ obj-$(CONFIG_BCM_KONA_TIMER)	+= bcm_kona_timer.o
>>   obj-$(CONFIG_CADENCE_TTC_TIMER)	+= timer-cadence-ttc.o
>>   obj-$(CONFIG_CLKSRC_EFM32)	+= timer-efm32.o
>>   obj-$(CONFIG_CLKSRC_STM32)	+= timer-stm32.o
>> +obj-$(CONFIG_CLKSRC_STM32_LP)	+= timer-stm32-lp.o
>>   obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+= exynos_mct.o
>>   obj-$(CONFIG_CLKSRC_LPC32XX)	+= timer-lpc32xx.o
>>   obj-$(CONFIG_CLKSRC_MPS2)	+= mps2-timer.o
>> diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
>> new file mode 100644
>> index 000000000000..50eecdb88216
>> --- /dev/null
>> +++ b/drivers/clocksource/timer-stm32-lp.c
>> @@ -0,0 +1,213 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
>> + * Authors: Benjamin Gaignard <benjamin.gaignard@st.com> for STMicroelectronics.
>> + *	    Pascal Paillet <p.paillet@st.com> for STMicroelectronics.
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/clockchips.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/mfd/stm32-lptimer.h>
>> +#include <linux/module.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_wakeirq.h>
>> +
>> +#define CFGR_PSC_OFFSET		9
>> +#define STM32_LP_RATING		400
>> +#define STM32_TARGET_CLKRATE	(32000 * HZ)
>> +#define STM32_LP_MAX_PSC	7
>> +
>> +struct stm32_lp_private {
>> +	struct regmap *reg;
>> +	struct clock_event_device clkevt;
>> +	unsigned long period;
>> +};
>> +
>> +static struct stm32_lp_private*
>> +to_priv(struct clock_event_device *clkevt)
>> +{
>> +	return container_of(clkevt, struct stm32_lp_private, clkevt);
>> +}
>> +
>> +static int stm32_clkevent_lp_shutdown(struct clock_event_device *clkevt)
>> +{
>> +	struct stm32_lp_private *priv = to_priv(clkevt);
>> +
>> +	regmap_write(priv->reg, STM32_LPTIM_CR, 0);
>> +	regmap_write(priv->reg, STM32_LPTIM_IER, 0);
>> +	/* clear pending flags */
>> +	regmap_write(priv->reg, STM32_LPTIM_ICR, STM32_LPTIM_ARRMCF);
>> +
>> +	return 0;
>> +}
>> +
>> +static int stm32_clkevent_lp_set_timer(unsigned long evt,
>> +				       struct clock_event_device *clkevt,
>> +				       int is_periodic)
>> +{
>> +	struct stm32_lp_private *priv = to_priv(clkevt);
>> +
>> +	/* disable LPTIMER to be able to write into IER register*/
>> +	regmap_write(priv->reg, STM32_LPTIM_CR, 0);
>> +	/* enable ARR interrupt */
>> +	regmap_write(priv->reg, STM32_LPTIM_IER, STM32_LPTIM_ARRMIE);
>> +	/* enable LPTIMER to be able to write into ARR register */
>> +	regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
>> +	/* set next event counter */
>> +	regmap_write(priv->reg, STM32_LPTIM_ARR, evt);
>> +
>> +	/* start counter */
>> +	if (is_periodic)
>> +		regmap_write(priv->reg, STM32_LPTIM_CR,
>> +			     STM32_LPTIM_CNTSTRT | STM32_LPTIM_ENABLE);
>> +	else
>> +		regmap_write(priv->reg, STM32_LPTIM_CR,
>> +			     STM32_LPTIM_SNGSTRT | STM32_LPTIM_ENABLE);
> The regmap config in stm32-lptimer is not defined with the fast_io flag
> (on purpose or not?) that means we can potentially deadlock here as the
> lock is a mutex.
>
> Isn't it detected with the lock validation scheme?
It wasn't a problem with other parts of the mfd and I don't notice 
issues so I guess it is ok.
>
>> +	return 0;
>> +}
>> +static int stm32_clkevent_lp_remove(struct platform_device *pdev)
>> +{
>> +	return -EBUSY; /* cannot unregister clockevent */
>> +}
> Won't be the mfd into an inconsistent state here? The other subsystems
> will be removed but this one will prevent to unload the module leading
> to a situation where the mfd is partially removed but still there
> without a possible recovery, no?
We can't enable the timer part of the mfd at the same time than the 
other features.
It has be exclusive and that exclude the problem you describe above.

>
>> +static const struct of_device_id stm32_clkevent_lp_of_match[] = {
>> +	{ .compatible = "st,stm32-lptimer-timer", },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, stm32_clkevent_lp_of_match);
>> +
>> +static struct platform_driver stm32_clkevent_lp_driver = {
>> +	.probe	= stm32_clkevent_lp_probe,
>> +	.remove = stm32_clkevent_lp_remove,
>> +	.driver	= {
>> +		.name = "stm32-lptimer-timer",
>> +		.of_match_table = of_match_ptr(stm32_clkevent_lp_of_match),
>> +	},
>> +};
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
