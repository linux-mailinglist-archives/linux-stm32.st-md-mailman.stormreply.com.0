Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F73816381
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 00:52:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7C3EC6DD6F;
	Sun, 17 Dec 2023 23:52:25 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70B1DC6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Dec 2023 23:52:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 071F3CE0B2A;
 Sun, 17 Dec 2023 23:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3E9C433C8;
 Sun, 17 Dec 2023 23:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702857140;
 bh=6ao4QwwxsmhGEWfg70Ew5Z3bfAgkkiWmUHeBKXMWP5A=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Lcjc/JkGziIa2RuVNBajY3AdoGjPMQzGHrloj/z82rGm5VgIW2UQ26gGUe7/6l8zP
 hx/rGKwEQ08lUDQNm1ogKrdw5xNJkdsp0MnsqSSfGMH7X/eHqCt0rlpGP7M2jPInIe
 sa4WwNTbybCwMo+98RfVWEeSYoo5FKXqncxHVP+VNcd4kMykiLgpI9YKWsspjGb05b
 RHBNIhwV1umhWMt8BYvgbKr017ldpwB5jYtwWq8u4951MYML8J0TXJWWXkKVdyg4XY
 Z/Pkkoc7slZiPaI8DfvaHReY0ryORFLPPQQ2MktBKxh5xjX0MuqvE3Rv+4L7E0343I
 CaYdFKJ2OKoeQ==
Message-ID: <e8124f2cad7afbb4e9fbd777dda992f4.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231208143700.354785-5-gabriel.fernandez@foss.st.com>
References: <20231208143700.354785-1-gabriel.fernandez@foss.st.com>
 <20231208143700.354785-5-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Sun, 17 Dec 2023 15:52:17 -0800
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v6 4/5] clk: stm32: introduce clocks for
	STM32MP257 platform
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

Quoting gabriel.fernandez@foss.st.com (2023-12-08 06:36:59)
> diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
> new file mode 100644
> index 000000000000..36321fd6142e
> --- /dev/null
> +++ b/drivers/clk/stm32/clk-stm32mp25.c
> @@ -0,0 +1,1125 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
> + * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>

Is this include used?

> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>

Is this include used?

> +
> +#include "clk-stm32-core.h"
> +#include "reset-stm32.h"
> +
> +#include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +#include <dt-bindings/reset/st,stm32mp25-rcc.h>
> +
> +#include "stm32mp25_rcc.h"
> +
> +static const char * const adc12_src[] = {
> +       "ck_flexgen_46", "ck_icn_ls_mcu"

Can we please migrate to struct clk_parent_data?

> +};
> +
> +static const char * const adc3_src[] = {
> +       "ck_flexgen_47", "ck_icn_ls_mcu", "ck_flexgen_46"
> +};
> +
> +static const char * const usb2phy1_src[] = {
> +       "ck_flexgen_57", "hse_div2_ck"
> +};
[...]
> +       GATE_TIM4,
> +       GATE_TIM5,
> +       GATE_TIM6,
> +       GATE_TIM7,
> +       GATE_TIM8,
> +       GATE_UART4,
> +       GATE_UART5,
> +       GATE_UART7,
> +       GATE_UART8,
> +       GATE_UART9,
> +       GATE_USART1,
> +       GATE_USART2,
> +       GATE_USART3,
> +       GATE_USART6,
> +       GATE_USB2,
> +       GATE_USB2PHY1,
> +       GATE_USB2PHY2,
> +       GATE_USB3DR,
> +       GATE_USB3PCIEPHY,
> +       GATE_USBTC,
> +       GATE_VDEC,
> +       GATE_VENC,
> +       GATE_VREF,
> +       GATE_WWDG1,
> +       GATE_WWDG2,
> +       GATE_NB
> +};
> +
> +#define GATE_CFG(id, _offset, _bit_idx, _offset_clr)\
> +       [id] = {\

Please move these slashes out and align them.

> +               .offset         = (_offset),\
> +               .bit_idx        = (_bit_idx),\
> +               .set_clr        = (_offset_clr),\
> +       }
> +
> +static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
> +       GATE_CFG(GATE_ADC12,            RCC_ADC12CFGR,          1,      0),
> +       GATE_CFG(GATE_ADC3,             RCC_ADC3CFGR,           1,      0),
> +       GATE_CFG(GATE_ADF1,             RCC_ADF1CFGR,           1,      0),
> +       GATE_CFG(GATE_CCI,              RCC_CCICFGR,            1,      0),
> +       GATE_CFG(GATE_CRC,              RCC_CRCCFGR,            1,      0),
> +       GATE_CFG(GATE_CRYP1,            RCC_CRYP1CFGR,          1,      0),
[....]
> +
> +static struct clk_stm32_clock_data stm32mp25_clock_data = {
> +       .gate_cpt       = stm32mp25_cpt_gate,
> +       .gates          = stm32mp25_gates,
> +       .muxes          = stm32mp25_muxes,
> +};
> +
> +static struct clk_stm32_reset_data stm32mp25_reset_data = {
> +       .reset_lines    = stm32mp25_reset_cfg,
> +       .nr_lines       = ARRAY_SIZE(stm32mp25_reset_cfg),
> +};
> +
> +static struct stm32_rcc_match_data stm32mp25_data = {

const

> +       .tab_clocks     = stm32mp25_clock_cfg,
> +       .num_clocks     = ARRAY_SIZE(stm32mp25_clock_cfg),
> +       .maxbinding     = STM32MP25_LAST_CLK,
> +       .clock_data     = &stm32mp25_clock_data,
> +       .reset_data     = &stm32mp25_reset_data,
> +};
> +
> +static const struct of_device_id stm32mp25_match_data[] = {
> +       {
> +               .compatible = "st,stm32mp25-rcc",
> +               .data = &stm32mp25_data,
> +       },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, stm32mp25_match_data);
> +
> +static int stm32mp25_rcc_init(struct device *dev)

Please inline this function in the one call site.

> +{
> +       void __iomem *base;
> +       int ret;
> +
> +       base = of_iomap(dev_of_node(dev), 0);

Use platform device APIs instead of OF specific ones.

> +       if (!base) {
> +               dev_err(dev, "%pOFn: unable to map resource", dev_of_node(dev));

Missing newline.

> +               ret = -ENOMEM;
> +               goto out;
> +       }
> +
> +       ret = stm32_rcc_init(dev, stm32mp25_match_data, base);
> +
> +out:
> +       if (ret) {
> +               if (base)
> +                       iounmap(base);
> +
> +               of_node_put(dev_of_node(dev));

When did we get the node?

> +       }
> +
> +       return ret;
> +}
> +
> +static int get_clock_deps(struct device *dev)
> +{
> +       static const char * const clock_deps_name[] = {
> +               "hsi", "hse", "msi", "lsi", "lse",
> +       };
> +       size_t deps_size = sizeof(struct clk *) * ARRAY_SIZE(clock_deps_name);
> +       struct clk **clk_deps;
> +       int i;
> +
> +       clk_deps = devm_kzalloc(dev, deps_size, GFP_KERNEL);
> +       if (!clk_deps)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < ARRAY_SIZE(clock_deps_name); i++) {
> +               struct clk *clk;
> +
> +               clk = of_clk_get_by_name(dev_of_node(dev), clock_deps_name[i]);
> +
> +               if (IS_ERR(clk)) {
> +                       if (PTR_ERR(clk) != -EINVAL && PTR_ERR(clk) != -ENOENT)
> +                               return PTR_ERR(clk);
> +               } else {
> +                       /* Device gets a reference count on the clock */
> +                       clk_deps[i] = devm_clk_get(dev, __clk_get_name(clk));

Is something using this clk_deps array?

> +                       clk_put(clk);
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int stm32mp25_rcc_clocks_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       int ret = get_clock_deps(dev);
> +
> +       if (!ret)
> +               ret = stm32mp25_rcc_init(dev);
> +
> +       return ret;
> +}
> +
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
