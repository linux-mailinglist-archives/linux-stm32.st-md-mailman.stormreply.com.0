Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F068A0888
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Apr 2024 08:36:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFF70C6C83C;
	Thu, 11 Apr 2024 06:36:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B4D9C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Apr 2024 06:36:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 07A6061F4D;
 Thu, 11 Apr 2024 06:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D261C433C7;
 Thu, 11 Apr 2024 06:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712817380;
 bh=N+fjYrC1p/JcTL+qhfdZbXsjzDIX8vxqPTYbZPrnCQg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=E5wcyx9nERJq65xe1mhmfAecCHZFGwm1UobT29TuZ7f6V46z8wOKe86uJbqntraVw
 9z+i1M4I37TtComxsxwO6ct8jGB/Va2N2VgXp56X5tuJGJr38e+7Ii8l1uGzgun6tf
 BMfcMzMhXMldPgF4iTLJ6K7hf8J8MMA5Zocqyb6Eh9p4xBwCgm0vyJw6k79d6Y/Iaj
 fvTlzXL2QFDEi19XBnxaqjnIp3/pqdLb8dGl6m0dVyOG0IAcFXgbgfaF+vq5ZcFEkS
 wHpyKuXzWRsCjCTO5MgLIT+7fTEvObXceJZxVTu4IzTs+stpyO43Ycjz+j/kXXi9r7
 uoEvcsUDcdAEw==
Message-ID: <7498985788263268d4acfcd1589a5994.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240409171241.274600-4-gabriel.fernandez@foss.st.com>
References: <20240409171241.274600-1-gabriel.fernandez@foss.st.com>
 <20240409171241.274600-4-gabriel.fernandez@foss.st.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Date: Wed, 10 Apr 2024 23:36:18 -0700
User-Agent: alot/0.10
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v10 3/4] clk: stm32: introduce clocks for
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

Quoting gabriel.fernandez@foss.st.com (2024-04-09 10:12:40)
> diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
> new file mode 100644
> index 000000000000..23876e7d9863
> --- /dev/null
> +++ b/drivers/clk/stm32/clk-stm32mp25.c
> @@ -0,0 +1,1876 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
> + * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicroelectronics.
> + */
> +
> +#include <linux/clk.h>

Use clk-provider.h not clk.h

> +#include <linux/of_address.h>

Doubt this is the right include. Drop?

> +#include <linux/platform_device.h>
> +
> +#include "clk-stm32-core.h"
> +#include "reset-stm32.h"
> +#include "stm32mp25_rcc.h"
> +
> +#include <dt-bindings/clock/st,stm32mp25-rcc.h>
[...]
> +       .clock_data     = &stm32mp25_clock_data,
> +       .reset_data     = &stm32mp25_reset_data,
> +};
> +
> +static const struct of_device_id stm32mp25_match_data[] = {
> +       { .compatible = "st,stm32mp25-rcc", .data = &stm32mp25_data, },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, stm32mp25_match_data);
> +
> +static int stm32mp25_rcc_clocks_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       void __iomem *base;
> +
> +       base = devm_platform_ioremap_resource(pdev, 0);
> +       if (WARN_ON(IS_ERR(base)))

Drop WARN_ON

> +               return PTR_ERR(base);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
