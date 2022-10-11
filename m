Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A75E5FAACA
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Oct 2022 04:56:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23F09C6411E;
	Tue, 11 Oct 2022 02:56:43 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30E05C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 02:56:41 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id c20so2398701plc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Oct 2022 19:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eY6/yimYvoONiMO8pWSoqGtMa9qBuMUAo/bdP9lOba0=;
 b=St4FezU9O7eQJTgTbgQ3mlkvzUgcaFOmGoS6fdofTzsS1eKPT2mljImssPXI+Y1Rqc
 WAtcVBQFwcJWAI1Xn0kmEDfsOWpPTM1rwy9e0/jweWYZhcW3bSRihweGkMgkFrf49L/S
 ougV8x2YLvsuSHJVWbHPxAjymhZlrdBRSfbPMetPXI3d8528oLanaqszgIjsyWcJxCec
 RplspHGcXRVrZHhm3YLHBP2MThUZYt1l+u3w6nNEbK/gAalPObii9Y23LTB9h+xo5MZL
 Q2olX6pqHr7fnJjbkDUcbicgWKLEOHuxY/ZmaY8NhBASe9hAP1FfwULvv+vyB/p7aAJi
 dcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eY6/yimYvoONiMO8pWSoqGtMa9qBuMUAo/bdP9lOba0=;
 b=7VGpj91Vr3KRjKO+a3asa7SzT5F15VZLuCsOkZ6RfwKTar5yv3UEU1DdAGOo3Cd2b0
 imQFU7UxS5tnKLwXGQDmwLnOZ4pcqN82VIAY0tZbJOOz/s08LBdnTL56GWviFVGYtMw7
 n6YCAZmBP8qqu8VSlZYEG6LdA3I5FsnLaa2MVRBhbRXiqbHiv/0F26RVW3sLQbGS8S+u
 RQ5QVJehy3OhyBu8KMeSirLFnZeQyVkpLgKfdxn9PDY4wUz8kELGOabFZ11aKY8U+3QA
 tuFKGrXK7CZeM+QZ5LO7cPaZVKwPoIsO6CU3GTOVO2Zd0sX998P4iI7runLIjwh4AKrH
 CcNg==
X-Gm-Message-State: ACrzQf1OTC2ot/Kvl5fqlhGA6xXWJtA7sxGuzKZmce8JzrOrBzJ84rZf
 B0B3+xP03Ng7OvOeCsxbWqDlEg==
X-Google-Smtp-Source: AMsMyM5hXN0QiS8uqUcGpHD6JFZFALVhwI9j6zQ14TE/WoAuVWWVc4TcEEwMdmsILP6ZiXwLtzx0bQ==
X-Received: by 2002:a17:90a:ad82:b0:20c:feb2:bceb with SMTP id
 s2-20020a17090aad8200b0020cfeb2bcebmr15457131pjq.93.1665456999661; 
 Mon, 10 Oct 2022 19:56:39 -0700 (PDT)
Received: from localhost ([122.172.86.128]) by smtp.gmail.com with ESMTPSA id
 z17-20020aa79911000000b005623df48a39sm7942588pff.13.2022.10.10.19.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 19:56:39 -0700 (PDT)
Date: Tue, 11 Oct 2022 08:26:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20221011025636.glm7wxtg4oo6c2j2@vireshk-i7>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-23-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221010201453.77401-23-andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Kent Gibson <warthog618@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Phil Edworthy <phil.edworthy@renesas.com>, linux-samsung-soc@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, Tali Perry <tali.perry1@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-aspeed@lists.ozlabs.org,
 Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-arm-msm@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, soc@kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, Nancy Yuen <yuenn@google.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Chen-Yu Tsai <wenst@chromium.org>,
 Orson Zhai <orsonzhai@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Haojian Zhuang <haojian.zhuang@linaro.org>, linux-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Prathamesh Shete <pshete@nvidia.com>, Andy Gross <agross@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Billy Tsai <billy_tsai@aspeedtech.com>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 patches@opensource.cirrus.com, Sean Wang <sean.wang@kernel.org>,
 linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [Linux-stm32] [PATCH v2 22/36] pinctrl: spear: Add missed
	header(s)
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

On 10-10-22, 23:14, Andy Shevchenko wrote:
> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
> 
> While at it, sort headers alphabetically.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/spear/pinctrl-spear.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/spear/pinctrl-spear.c b/drivers/pinctrl/spear/pinctrl-spear.c
> index e0543c1ad641..18de2e70ea50 100644
> --- a/drivers/pinctrl/spear/pinctrl-spear.c
> +++ b/drivers/pinctrl/spear/pinctrl-spear.c
> @@ -19,11 +19,13 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_gpio.h>
> +#include <linux/platform_device.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
> +
>  #include <linux/pinctrl/machine.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinmux.h>
> -#include <linux/platform_device.h>
> -#include <linux/slab.h>
>  
>  #include "pinctrl-spear.h"

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
