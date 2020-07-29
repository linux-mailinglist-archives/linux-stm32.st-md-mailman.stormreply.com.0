Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0969B232588
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jul 2020 21:42:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B99C8C36B29;
	Wed, 29 Jul 2020 19:42:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 405F1C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 19:42:46 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACB73206D4;
 Wed, 29 Jul 2020 19:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596051764;
 bh=gvBRTtVpHZ8XIvcKDGM0x4zcwd8P01/WaBAWg80jZBw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=q3rbrJ5UWU7IB86jpP3xYz3NzwStYMAInjwyCcx0oFkBNTOfQw5tV6Bu8sB9s/kMz
 0RhPokOz+E4HIx3nkCkZ7qMHzmdBHFPJx+ECVeL17Aa6IOZybPSnPYncV5IrRo5zpX
 A8m7Ojdd0nAIHQKdxmLVU+hRLZlJ5n/o+GCRrMDo=
MIME-Version: 1.0
In-Reply-To: <20200729160942.28867-2-krzk@kernel.org>
References: <20200729160942.28867-1-krzk@kernel.org>
 <20200729160942.28867-2-krzk@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, Simtec Linux Team <linux@simtec.co.uk>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Vincent Sanders <vince@simtec.co.uk>,
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-watchdog@vger.kernel.org,
 patches@opensource.cirrus.com
Date: Wed, 29 Jul 2020 12:42:43 -0700
Message-ID: <159605176358.1360974.7715120460121088439@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Lihua Yao <ylhuajnu@outlook.com>,
 Cedric Roux <sed@free.fr>, Sergio Prado <sergio.prado@e-labworks.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Linux-stm32] [PATCH 1/7] clk: samsung: s3c64xx: Declare
	s3c64xx_clk_init() in shared header
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

Quoting Krzysztof Kozlowski (2020-07-29 09:09:36)
> diff --git a/include/linux/clk/samsung.h b/include/linux/clk/samsung.h
> new file mode 100644
> index 000000000000..b6b253c46c22
> --- /dev/null
> +++ b/include/linux/clk/samsung.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2020 Krzysztof Kozlowski <krzk@kernel.org>
> + */
> +
> +#ifndef __LINUX_CLK_SAMSUNG_H_
> +#define __LINUX_CLK_SAMSUNG_H_
> +
> +#ifdef CONFIG_ARCH_S3C64XX
> +void __init s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,

Don't use __init in header files. It doesn't do anything.

> +                            unsigned long xusbxti_f, bool s3c6400,
> +                            void __iomem *base);
> +#else
> +static inline void __init s3c64xx_clk_init(struct device_node *np,

Forward declare struct device_node;

> +                                          unsigned long xtal_f,
> +                                          unsigned long xusbxti_f,
> +                                          bool s3c6400,
> +                                          void __iomem *base) { }

Include <linux/compiler.h> (or compiler_types.h) for __iomem define
please.

> +#endif /* CONFIG_ARCH_S3C64XX */
> +
> +#endif /* __LINUX_CLK_SAMSUNG_H_ */
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
