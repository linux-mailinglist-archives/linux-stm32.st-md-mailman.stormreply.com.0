Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 742575FAC4B
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Oct 2022 08:12:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38521C65056;
	Tue, 11 Oct 2022 06:12:06 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 547A1C6411C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 00:02:02 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id g28so12039934pfk.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Oct 2022 17:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HDvDPLCLAPPvF5TVvL+FWbJtEqmbYVODvwDkJg3SqIo=;
 b=BMj8f33/fyuY4YUgfzIsC8MB079NtlG/lc5y1lSPpCGAsz+jvSYZCTpuRzKVZGf2GY
 nZi6ZRgOudbzROz6pHhHElsWmoKQQy847SVQHPP6Lzs+V2eA/brEnXLuDstKnq7MW7Ih
 TzHZfV7XKs3PD0GAaAkJAXCvXBlxf5lB+KS3lhnFICm9Tq4yaQhhQQax921FRXOWW/if
 /toe/pDvQON4HdgY5CGmbYgif/tTyjDjkjRdKQFAulnURnCwp8NMFdEBa3NYmPI0A+fB
 fhamlfjudZxMTaB+1mSMxDuObe1ocZe7cQbErJKQBTAEur2a0QkUbRoT5VJEglEdMX1y
 d2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HDvDPLCLAPPvF5TVvL+FWbJtEqmbYVODvwDkJg3SqIo=;
 b=Q47jyOmMfJpKRmGpijOHUMEN8O76VaojXyVoKA6dy6eUqz8GS4QCV1wn9lzvfx2AKz
 PUBV2iyLUoC0xi4pfrouRWU18NvvoCPcewCnU2sjjw0vOWixDUfjoI5r3u8FHTSFs7d8
 kELHvIi9dEQuG4YmJ0qq5itNrC0hPOBTDa7PzDakx2dAOTzx4PJN1fQ/OJT1ZxNj3ojx
 G0bYyn/INa6XcHg5ghhlkVSSgf7Kl8HUHXn9JYsS/06sOjr0osV0xO6FusL4dBcqgoyL
 D7zgDxYt5i8Qelmm7FK93U14f3kuH4lzEx5y3TjV0sYsJ/XSYW1y0a1UIK3ba0hnouv4
 /ZKQ==
X-Gm-Message-State: ACrzQf3wJiiYKN2dlVuaZSb0Cg39ckYEj6c3mAo0270Y8WmcoWZxPw39
 CmtUQPxgYVygs6TSra3NCY4=
X-Google-Smtp-Source: AMsMyM7Y6pAnL5W1EJS9G7oSUu8S6FVrr9k2c5r6QKOELR9o0pNGH3yk7s3YJUqb5vMyZxDtzUjxCg==
X-Received: by 2002:a63:4949:0:b0:442:b733:2fae with SMTP id
 y9-20020a634949000000b00442b7332faemr18227721pgk.424.1665446520354; 
 Mon, 10 Oct 2022 17:02:00 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
 by smtp.gmail.com with ESMTPSA id
 v29-20020aa799dd000000b0056258a3606csm7454081pfi.215.2022.10.10.17.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 17:01:59 -0700 (PDT)
Date: Tue, 11 Oct 2022 08:01:27 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <Y0SyVwjDl7NGfTPn@sol>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Tue, 11 Oct 2022 06:12:03 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
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
 Claudiu Beznea <claudiu.beznea@microchip.com>, alsa-devel@alsa-project.org,
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
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
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
Subject: Re: [Linux-stm32] [PATCH v2 02/36] gpiolib: cdev: Add missed
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

On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:
> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
> 
> While at it, sort headers alphabetically.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index f8041d4898d1..60a60e2d60c5 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -10,8 +10,9 @@
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/file.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/gpio.h>
> +#include <linux/hte.h>

Ok with the hte re-order.

But moving the gpio subsystem header after the gpio/driver is not
alphabetical ('.' precedes '/') and it read better and made more sense
to me the way it was.

>  #include <linux/interrupt.h>
>  #include <linux/irqreturn.h>
>  #include <linux/kernel.h>
> @@ -20,11 +21,12 @@
>  #include <linux/mutex.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/poll.h>
> +#include <linux/seq_file.h>

I wasn't aware that we use anything from seq_file.
What am I missing?

Cheers,
Kent.

>  #include <linux/spinlock.h>
>  #include <linux/timekeeping.h>
>  #include <linux/uaccess.h>
>  #include <linux/workqueue.h>
> -#include <linux/hte.h>
> +
>  #include <uapi/linux/gpio.h>
>  
>  #include "gpiolib.h"
> -- 
> 2.35.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
