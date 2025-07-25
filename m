Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 120ADB11CED
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 12:57:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB04DC30883;
	Fri, 25 Jul 2025 10:56:59 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEEF3C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 10:56:58 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bpPpz1MQQz6HJRn;
 Fri, 25 Jul 2025 18:52:59 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id A06C61400DC;
 Fri, 25 Jul 2025 18:56:57 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 25 Jul
 2025 12:56:56 +0200
Date: Fri, 25 Jul 2025 11:56:55 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: =?ISO-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Message-ID: <20250725115655.00002304@huawei.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-12-7b7a4f3dc8a0@foss.st.com>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-12-7b7a4f3dc8a0@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)
Cc: Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Gabriel
 Fernandez <gabriel.fernandez@foss.st.com>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob
 Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, Conor
 Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Le Goffic <legoffic.clement@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Julius Werner <jwerner@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 12/19] perf: stm32: introduce DDRPERFM
	driver
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, 22 Jul 2025 16:03:29 +0200
Cl=E9ment Le Goffic <clement.legoffic@foss.st.com> wrote:

> Introduce the driver for the DDR Performance Monitor available on
> STM32MPU SoC.
> =

> On STM32MP2 platforms, the DDRPERFM allows to monitor up to 8 DDR events
> that come from the DDR Controller such as read or write events.
> =

> On STM32MP1 platforms, the DDRPERFM cannot monitor any event on any
> counter, there is a notion of set of events.
> Events from different sets cannot be monitored at the same time.
> The first chosen event selects the set.
> The set is coded in the first two bytes of the config value which is on 4
> bytes.
> =

> On STM32MP25x series, the DDRPERFM clock is shared with the DDR controller
> and may be secured by bootloaders.
> Access controllers allow to check access to a resource. Use the access
> controller defined in the devicetree to know about the access to the
> DDRPERFM clock.
> =

> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
Hi Cl=E9ment,

Minor comments inline.,

Thanks,

Jonathan

> --- /dev/null
> +++ b/drivers/perf/stm32_ddr_pmu.c
> @@ -0,0 +1,896 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025, STMicroelectronics - All Rights Reserved
> + * Author: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com> for STMicr=
oelectronics.
> + */
> +
> +#include <linux/bus/stm32_firewall_device.h>
> +#include <linux/clk.h>
> +#include <linux/hrtimer.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
Why?  =

Looks like of.h is needed so you should include that directly.

Check all your headers.  mod_devicetable.h should be here
for instance.

> +#include <linux/perf_event.h>
> +#include <linux/reset.h>

> +
> +static void stm32_ddr_pmu_event_del(struct perf_event *event, int flags)
> +{
> +	struct stm32_ddr_pmu *pmu =3D to_stm32_ddr_pmu(event->pmu);
> +	struct stm32_ddr_cnt *counter =3D event->pmu_private;
> +	bool events =3D true;
> +
> +	stm32_ddr_pmu_event_stop(event, PERF_EF_UPDATE);
> +
> +	stm32_ddr_pmu_free_counter(pmu, counter);
> +
> +	for (int i =3D 0; i < pmu->cfg->counters_nb; i++)
> +		events =3D !list_empty(&pmu->counters[i]);
What is this trying to do?  It seems to be only setting
	events =3D !list_empty(&pmu->counters[pmu->cfg_counters_nb - 1]);

If so just check that but my guess it you care if there is anything
in any of them lists.

> +
> +	/* If there is activity nothing to do */
> +	if (events)
> +		return;
> +
> +	hrtimer_cancel(&pmu->hrtimer);
> +	stm32_ddr_stop_counters(pmu);
> +
> +	pmu->selected_set =3D -1;
> +
> +	clk_disable(pmu->clk);
> +}


> +static int stm32_ddr_pmu_get_memory_type(struct stm32_ddr_pmu *pmu)
> +{
> +	struct platform_device *pdev =3D to_platform_device(pmu->dev);
> +	struct device_node *memchan;
> +
> +	memchan =3D of_parse_phandle(pdev->dev.of_node, "memory-channel", 0);
> +	if (!memchan)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "Missing device-tree property 'memory-channel'\n");
> +
> +	if (of_device_is_compatible(memchan, "jedec,lpddr4-channel"))

Random thought, feel free to ignore.
I wonder if it's worth using an of_device_id match table here?


> +		pmu->dram_type =3D STM32_DDR_PMU_LPDDR4;
> +	else if (of_device_is_compatible(memchan, "jedec,lpddr3-channel"))
> +		pmu->dram_type =3D STM32_DDR_PMU_LPDDR3;
> +	else if (of_device_is_compatible(memchan, "jedec,ddr4-channel"))
> +		pmu->dram_type =3D STM32_DDR_PMU_DDR4;
> +	else if (of_device_is_compatible(memchan, "jedec,ddr3-channel"))
> +		pmu->dram_type =3D STM32_DDR_PMU_DDR3;
> +	else
> +		return dev_err_probe(&pdev->dev, -EINVAL, "Unsupported memory channel =
type\n");
> +
> +	if (pmu->dram_type =3D=3D STM32_DDR_PMU_LPDDR3)
> +		dev_warn(&pdev->dev,
> +			 "LPDDR3 supported by DDRPERFM but not supported by DDRCTRL/DDRPHY\n"=
);
> +
> +	return 0;
> +}

> +static struct attribute *stm32_ddr_pmu_events_attrs_mp[] =3D {
> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_rd, PERF_OP_IS_RD),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_wr, PERF_OP_IS_WR),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_activate, PERF_OP_IS_ACTIVATE),
> +	STM32_DDR_PMU_EVENT_ATTR(ctl_idle, CTL_IDLE),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_hpr_req_with_no_credit, PERF_HPR_REQ_WITH=
_NO_CREDIT),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_lpr_req_with_no_credit, PERF_LPR_REQ_WITH=
_NO_CREDIT),
> +	STM32_DDR_PMU_EVENT_ATTR(cactive_ddrc, CACTIVE_DDRC),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_enter_powerdown, PERF_OP_IS_ENTER_P=
OWERDOWN),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_refresh, PERF_OP_IS_REFRESH),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_selfresh_mode, PERF_SELFRESH_MODE),
> +	STM32_DDR_PMU_EVENT_ATTR(dfi_lp_req, DFI_LP_REQ),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_hpr_xact_when_critical, PERF_HPR_XACT_WHE=
N_CRITICAL),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_lpr_xact_when_critical, PERF_LPR_XACT_WHE=
N_CRITICAL),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_wr_xact_when_critical, PERF_WR_XACT_WHEN_=
CRITICAL),
> +	STM32_DDR_PMU_EVENT_ATTR(dfi_lp_req_cpy, DFI_LP_REQ),  /* Suffixed '_cp=
y' to allow the
> +								* choice between sets 2 and 3
> +								*/
> +	STM32_DDR_PMU_EVENT_ATTR(time_cnt, TIME_CNT),
> +	NULL,

No trailing comma for a terminating entry like this.  You got the other cas=
es
so I guess this one just got missed.

> +};

> +static int stm32_ddr_pmu_device_probe(struct platform_device *pdev)
> +{
> +	struct stm32_firewall firewall;
> +	struct stm32_ddr_pmu *pmu;
> +	struct reset_control *rst;
> +	struct resource *res;
> +	int ret;
> +
> +	pmu =3D devm_kzalloc(&pdev->dev, struct_size(pmu, counters, MP2_CNT_NB)=
, GFP_KERNEL);
> +	if (!pmu)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, pmu);
> +	pmu->dev =3D &pdev->dev;
> +
> +	pmu->cfg =3D device_get_match_data(pmu->dev);
> +
> +	pmu->membase =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(pmu->membase))
> +		return PTR_ERR(pmu->membase);
> +
> +	if (of_property_present(pmu->dev->of_node, "access-controllers")) {
> +		ret =3D stm32_firewall_get_firewall(pmu->dev->of_node, &firewall, 1);

Jiri is busy driving dev_fwnode() thorugh to get rid of all the directly re=
ferences
to of_node.  Probably better to use that here from the start.


> +		if (ret)
> +			return dev_err_probe(pmu->dev, ret, "Failed to get firewall\n");
> +		ret =3D stm32_firewall_grant_access_by_id(&firewall, firewall.firewall=
_id);
> +		if (ret)
> +			return dev_err_probe(pmu->dev, ret, "Failed to grant access\n");
> +	}
> +
> +	pmu->clk =3D devm_clk_get_optional_enabled(pmu->dev, NULL);
> +	if (IS_ERR(pmu->clk))
> +		return dev_err_probe(pmu->dev, PTR_ERR(pmu->clk), "Failed to get prepa=
re clock\n");

Comment doesn't match code. This is going to enabled, not just prepared.

> +
> +	rst =3D devm_reset_control_get_optional_exclusive(pmu->dev, NULL);
> +	if (IS_ERR(rst))
> +		return dev_err_probe(pmu->dev, PTR_ERR(rst), "Failed to get reset\n");

> +}


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
