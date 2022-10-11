Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 604D65FADFC
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Oct 2022 10:06:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FD88C640F2;
	Tue, 11 Oct 2022 08:06:23 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CEBCC63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 08:06:21 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id f14so8508252qvo.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 01:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jGyomjq7ozY4Q7akXL/Pfyv8X5Aj6pujM8b1a5l18ro=;
 b=KOtVn1MyCyveoDiOyhPS4b+kccEhBn5uycP8wq1nxcQaoVO7ujP/OY5Ywr26ZnhCam
 JtV49vXZAkHxc9fQhnFZ0yR5qa3H1k6BdicVcmNeApeNekWkjySS1eI7a345vma1iB5u
 m0hpdgw4rj+ZcUPoYHTwGBEZDDkn60NhzkSfKSFxnPmncP0SZs0DSM0BTPcBCa0Y7kT+
 OJDRY26vA+5llcDmHVjT/wbShwFCBj2+8IX1jMumA781Wi5bVtrpUwScLhBWATEJPXxO
 rA3UjsbwHJCPXoxP8zsPzOmD/iX/cV77mwqa0OtltmMedasLu6ChGyGJ30OpeSGXY/hO
 eF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jGyomjq7ozY4Q7akXL/Pfyv8X5Aj6pujM8b1a5l18ro=;
 b=6EigB0gQlTq99kvqPZD/mIxKeoC0XZNC03/Lg6nIEsveRFU+ozmoOfA3/meS1/O1Rl
 edgZf/2n4Lotr3+Wmeb3tW2E/JZ81+0rtrLS2J35hUp8NcY9YyKqTFteS7SVufPb/KZ9
 zyY+yjyUrOQ5DdeHIW/MGW0lBBvXxkfI/jrOcjaSV5yh9OT/xvfd93+TvLtcsN9XqyMo
 GiSZR02568nwzMhFIvqhyDi2JjMoXP66D4EXTFBgVvhRtRohkRzI/fvEr7OaVgmGQs5B
 Gv9mojoDr6ydtWHXWbzT9ABGul4dN9eZgFAOUdOSFBA1A/EtumFF4EZ9D4ejjRpHZeIr
 UtPQ==
X-Gm-Message-State: ACrzQf1Ej/Oq0YtUU+ccjGdRPQru8q3LSHW7QR9xaFNAx/Hd/vnQzCA+
 Tpr0WydLVwTEXA/KoQMUoQmDhiylxocGpMGT4ns=
X-Google-Smtp-Source: AMsMyM6bBfvn1Kn2m3jyePvTWTQZr99mPqgEF96ov5+b6DzzOQAB1TTkjSwFdYjW5mK99JzXiScvlDmHriUb73Md/f4=
X-Received: by 2002:a05:6214:29ee:b0:4b1:c1d2:6635 with SMTP id
 jv14-20020a05621429ee00b004b1c1d26635mr18081815qvb.82.1665475580262; Tue, 11
 Oct 2022 01:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
In-Reply-To: <Y0SyVwjDl7NGfTPn@sol>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Oct 2022 11:05:42 +0300
Message-ID: <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
To: Kent Gibson <warthog618@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
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
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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

On Tue, Oct 11, 2022 at 3:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:

...

> > -#include <linux/gpio.h>
> >  #include <linux/gpio/driver.h>
> > +#include <linux/gpio.h>
> > +#include <linux/hte.h>
>
> Ok with the hte re-order.
>
> But moving the gpio subsystem header after the gpio/driver is not
> alphabetical ('.' precedes '/') and it read better and made more sense
> to me the way it was.

I see, I guess this is vim sort vs shell sort. Strange, they should
follow the locale settings...

...

> > +#include <linux/seq_file.h>
>
> I wasn't aware that we use anything from seq_file.
> What am I missing?

I will recheck, because in v6.0 I don't see anything, but LKP was not
okay with something IIRC.




--
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
