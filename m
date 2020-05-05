Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDD41C4F05
	for <lists+linux-stm32@lfdr.de>; Tue,  5 May 2020 09:26:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1051BC36B2A;
	Tue,  5 May 2020 07:26:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DB77C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2020 07:26:26 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0457NAh7027822; Tue, 5 May 2020 09:26:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=xyHT4pivjkfkJP6JJYCxQea414UJ6Q9EA83DPptpv2A=;
 b=ItLPr1+vBSx99e94L9i5u0LECo0+F6wakE7f32CpSDDouvsXhc4CmExGL1qcc3M9peND
 QKwEIgTXIXjsjHJby9KPZHllI+xf1zAe2WMBjVNu2pwjUWtFwcaIw2B/R2J7QaYnEfYU
 3ygBzKUJJRzo+PhzXqFV2qFMViRSzAcpeqq6yg0QUW98CP6LDcM/opp9vE2HDIE0xdu3
 Z5TelRn3WMf5/OT8pYp/5yjkeoZwIyS3op6gQD2GCniFBO+C6CCuJ+O6c8UIe0e12oZ6
 f9ftFIRVay6VKRHsgnEy3mFaXhJyiohLkPMJNF0pfi8BV0n6mthjRjeMWvAHvVxcu1tl EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30rxb1xfdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 09:26:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E909410002A;
 Tue,  5 May 2020 09:26:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CF708222CFE;
 Tue,  5 May 2020 09:26:10 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 May
 2020 09:26:10 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Tue, 5 May 2020 09:26:09 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Fabrice GASNIER <fabrice.gasnier@st.com>, "lee.jones@linaro.org"
 <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Thread-Topic: [Linux-stm32] [PATCH v7 5/6] clocksource: Add Low Power STM32
 timers driver
Thread-Index: AQHWIq5ye17eyc+P4UqbHd8uXquVxw==
Date: Tue, 5 May 2020 07:26:09 +0000
Message-ID: <bbac5aa5-1c95-456e-3141-006d4fa86095@st.com>
References: <20200420121620.2099-1-benjamin.gaignard@st.com>
 <20200420121620.2099-6-benjamin.gaignard@st.com>
In-Reply-To: <20200420121620.2099-6-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <76F48F8B499BE849BFCBC6C161C5B8A3@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_04:2020-05-04,
 2020-05-05 signatures=0
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



On 4/20/20 2:16 PM, Benjamin Gaignard wrote:
> From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>
> Implement clock event driver using low power STM32 timers.
> Low power timer counters running even when CPUs are stopped.
> It could be used as clock event broadcaster to wake up CPUs but not like
> a clocksource because each it rise an interrupt the counter restart from 0.
>
> Low power timers have a 16 bits counter and a prescaler which allow to
> divide the clock per power of 2 to up 128 to target a 32KHz rate.
Gentle ping to reviewers on this driver part of the series.
The bindings and the MFD have been reviewed so I hope I can progress
on the driver part too.

Thanks.
Benjamin
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Signed-off-by: Pascal Paillet <p.paillet@st.com>
> ---
>   drivers/clocksource/Kconfig          |   4 +
>   drivers/clocksource/Makefile         |   1 +
>   drivers/clocksource/timer-stm32-lp.c | 221 +++++++++++++++++++++++++++++++++++
>   3 files changed, 226 insertions(+)
>   create mode 100644 drivers/clocksource/timer-stm32-lp.c
>
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index f2142e6bbea3..22b8d8f1eb40 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -292,6 +292,10 @@ config CLKSRC_STM32
>   	select CLKSRC_MMIO
>   	select TIMER_OF
>   
> +config CLKSRC_STM32_LP
> +	bool "Low power clocksource for STM32 SoCs"
> +	depends on MFD_STM32_LPTIMER || COMPILE_TEST
> +
>   config CLKSRC_MPS2
>   	bool "Clocksource for MPS2 SoCs" if COMPILE_TEST
>   	depends on GENERIC_SCHED_CLOCK
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index 641ba5383ab5..69f744135cb5 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_BCM_KONA_TIMER)	+= bcm_kona_timer.o
>   obj-$(CONFIG_CADENCE_TTC_TIMER)	+= timer-cadence-ttc.o
>   obj-$(CONFIG_CLKSRC_EFM32)	+= timer-efm32.o
>   obj-$(CONFIG_CLKSRC_STM32)	+= timer-stm32.o
> +obj-$(CONFIG_CLKSRC_STM32_LP)	+= timer-stm32-lp.o
>   obj-$(CONFIG_CLKSRC_EXYNOS_MCT)	+= exynos_mct.o
>   obj-$(CONFIG_CLKSRC_LPC32XX)	+= timer-lpc32xx.o
>   obj-$(CONFIG_CLKSRC_MPS2)	+= mps2-timer.o
> diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
> new file mode 100644
> index 000000000000..0f06b8a337aa
> --- /dev/null
> +++ b/drivers/clocksource/timer-stm32-lp.c
> @@ -0,0 +1,221 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
> + * Authors: Benjamin Gaignard <benjamin.gaignard@st.com> for STMicroelectronics.
> + *	    Pascal Paillet <p.paillet@st.com> for STMicroelectronics.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clockchips.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/stm32-lptimer.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
> +
> +#define CFGR_PSC_OFFSET		9
> +#define STM32_LP_RATING		1000
> +#define STM32_TARGET_CLKRATE	(32000 * HZ)
> +#define STM32_LP_MAX_PSC	7
> +
> +struct stm32_lp_private {
> +	struct regmap *reg;
> +	struct clock_event_device clkevt;
> +	unsigned long period;
> +	struct device *dev;
> +};
> +
> +static struct stm32_lp_private*
> +to_priv(struct clock_event_device *clkevt)
> +{
> +	return container_of(clkevt, struct stm32_lp_private, clkevt);
> +}
> +
> +static int stm32_clkevent_lp_shutdown(struct clock_event_device *clkevt)
> +{
> +	struct stm32_lp_private *priv = to_priv(clkevt);
> +
> +	regmap_write(priv->reg, STM32_LPTIM_CR, 0);
> +	regmap_write(priv->reg, STM32_LPTIM_IER, 0);
> +	/* clear pending flags */
> +	regmap_write(priv->reg, STM32_LPTIM_ICR, STM32_LPTIM_ARRMCF);
> +
> +	return 0;
> +}
> +
> +static int stm32_clkevent_lp_set_timer(unsigned long evt,
> +				       struct clock_event_device *clkevt,
> +				       int is_periodic)
> +{
> +	struct stm32_lp_private *priv = to_priv(clkevt);
> +
> +	/* disable LPTIMER to be able to write into IER register*/
> +	regmap_write(priv->reg, STM32_LPTIM_CR, 0);
> +	/* enable ARR interrupt */
> +	regmap_write(priv->reg, STM32_LPTIM_IER, STM32_LPTIM_ARRMIE);
> +	/* enable LPTIMER to be able to write into ARR register */
> +	regmap_write(priv->reg, STM32_LPTIM_CR, STM32_LPTIM_ENABLE);
> +	/* set next event counter */
> +	regmap_write(priv->reg, STM32_LPTIM_ARR, evt);
> +
> +	/* start counter */
> +	if (is_periodic)
> +		regmap_write(priv->reg, STM32_LPTIM_CR,
> +			     STM32_LPTIM_CNTSTRT | STM32_LPTIM_ENABLE);
> +	else
> +		regmap_write(priv->reg, STM32_LPTIM_CR,
> +			     STM32_LPTIM_SNGSTRT | STM32_LPTIM_ENABLE);
> +
> +	return 0;
> +}
> +
> +static int stm32_clkevent_lp_set_next_event(unsigned long evt,
> +					    struct clock_event_device *clkevt)
> +{
> +	return stm32_clkevent_lp_set_timer(evt, clkevt,
> +					   clockevent_state_periodic(clkevt));
> +}
> +
> +static int stm32_clkevent_lp_set_periodic(struct clock_event_device *clkevt)
> +{
> +	struct stm32_lp_private *priv = to_priv(clkevt);
> +
> +	return stm32_clkevent_lp_set_timer(priv->period, clkevt, true);
> +}
> +
> +static int stm32_clkevent_lp_set_oneshot(struct clock_event_device *clkevt)
> +{
> +	struct stm32_lp_private *priv = to_priv(clkevt);
> +
> +	return stm32_clkevent_lp_set_timer(priv->period, clkevt, false);
> +}
> +
> +static irqreturn_t stm32_clkevent_lp_irq_handler(int irq, void *dev_id)
> +{
> +	struct clock_event_device *clkevt = (struct clock_event_device *)dev_id;
> +	struct stm32_lp_private *priv = to_priv(clkevt);
> +
> +	regmap_write(priv->reg, STM32_LPTIM_ICR, STM32_LPTIM_ARRMCF);
> +
> +	if (clkevt->event_handler)
> +		clkevt->event_handler(clkevt);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void stm32_clkevent_lp_set_prescaler(struct stm32_lp_private *priv,
> +					    unsigned long *rate)
> +{
> +	int i;
> +
> +	for (i = 0; i <= STM32_LP_MAX_PSC; i++) {
> +		if (DIV_ROUND_CLOSEST(*rate, 1 << i) < STM32_TARGET_CLKRATE)
> +			break;
> +	}
> +
> +	regmap_write(priv->reg, STM32_LPTIM_CFGR, i << CFGR_PSC_OFFSET);
> +
> +	/* Adjust rate and period given the prescaler value */
> +	*rate = DIV_ROUND_CLOSEST(*rate, (1 << i));
> +	priv->period = DIV_ROUND_UP(*rate, HZ);
> +}
> +
> +static void stm32_clkevent_lp_init(struct stm32_lp_private *priv,
> +				  struct device_node *np, unsigned long rate)
> +{
> +	priv->clkevt.name = np->full_name;
> +	priv->clkevt.cpumask = cpu_possible_mask;
> +	priv->clkevt.features = CLOCK_EVT_FEAT_PERIODIC |
> +				CLOCK_EVT_FEAT_ONESHOT;
> +	priv->clkevt.set_state_shutdown = stm32_clkevent_lp_shutdown;
> +	priv->clkevt.set_state_periodic = stm32_clkevent_lp_set_periodic;
> +	priv->clkevt.set_state_oneshot = stm32_clkevent_lp_set_oneshot;
> +	priv->clkevt.set_next_event = stm32_clkevent_lp_set_next_event;
> +	priv->clkevt.rating = STM32_LP_RATING;
> +
> +	clockevents_config_and_register(&priv->clkevt, rate, 0x1,
> +					STM32_LPTIM_MAX_ARR);
> +}
> +
> +static int stm32_clkevent_lp_probe(struct platform_device *pdev)
> +{
> +	struct stm32_lptimer *ddata = dev_get_drvdata(pdev->dev.parent);
> +	struct stm32_lp_private *priv;
> +	unsigned long rate;
> +	int ret, irq;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->reg = ddata->regmap;
> +	ret = clk_prepare_enable(ddata->clk);
> +	if (ret)
> +		return -EINVAL;
> +
> +	rate = clk_get_rate(ddata->clk);
> +	if (!rate) {
> +		ret = -EINVAL;
> +		goto out_clk_disable;
> +	}
> +
> +	irq = platform_get_irq(to_platform_device(pdev->dev.parent), 0);
> +	if (irq <= 0) {
> +		ret = irq;
> +		goto out_clk_disable;
> +	}
> +
> +	if (of_property_read_bool(pdev->dev.parent->of_node, "wakeup-source")) {
> +		ret = device_init_wakeup(&pdev->dev, true);
> +		if (ret)
> +			goto out_clk_disable;
> +
> +		ret = dev_pm_set_wake_irq(&pdev->dev, irq);
> +		if (ret)
> +			goto out_clk_disable;
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev, irq, stm32_clkevent_lp_irq_handler,
> +			       IRQF_TIMER, pdev->name, &priv->clkevt);
> +	if (ret)
> +		goto out_clk_disable;
> +
> +	stm32_clkevent_lp_set_prescaler(priv, &rate);
> +
> +	stm32_clkevent_lp_init(priv, pdev->dev.parent->of_node, rate);
> +
> +	priv->dev = &pdev->dev;
> +
> +	return 0;
> +
> +out_clk_disable:
> +	clk_disable_unprepare(ddata->clk);
> +	return ret;
> +}
> +
> +static int stm32_clkevent_lp_remove(struct platform_device *pdev)
> +{
> +	return -EBUSY; /* cannot unregister clockevent */
> +}
> +
> +static const struct of_device_id stm32_clkevent_lp_of_match[] = {
> +	{ .compatible = "st,stm32-lptimer-timer", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, stm32_clkevent_lp_of_match);
> +
> +static struct platform_driver stm32_clkevent_lp_driver = {
> +	.probe	= stm32_clkevent_lp_probe,
> +	.remove = stm32_clkevent_lp_remove,
> +	.driver	= {
> +		.name = "stm32-lptimer-timer",
> +		.of_match_table = of_match_ptr(stm32_clkevent_lp_of_match),
> +	},
> +};
> +module_platform_driver(stm32_clkevent_lp_driver);
> +
> +MODULE_ALIAS("platform:stm32-lptimer-timer");
> +MODULE_DESCRIPTION("STMicroelectronics STM32 clockevent low power driver");
> +MODULE_LICENSE("GPL v2");
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
