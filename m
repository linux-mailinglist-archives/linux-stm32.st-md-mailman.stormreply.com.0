Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60478600AE6
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Oct 2022 11:35:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08464C63325;
	Mon, 17 Oct 2022 09:35:31 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F386C03FDA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 09:35:29 +0000 (UTC)
Received: by mail-vk1-f172.google.com with SMTP id b81so5065244vkf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 02:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E/piL+Cl5bNZ+cdgdtRq8tdPhqA168X72rjKGIcj1h4=;
 b=frJwpnQ1m5aYZphVeeBe7Gk3obDQDvbUlm04wfHh9QiSL/PMF9tB/Oqsh+0kEGhfNO
 IO0xDniqeVyzfdD+JQ/zRq4D21vh7ik7Um8ee3cn8CBCOToSaQ1ZGpd/a2Gve9yyVF34
 ITfWo51grHozApCr0PrB6Bwe0SOYlzp6onCsTl/dTI9MCc6vgY4Nu541uAo++YYBs5A4
 a0vKPtblJ4z5wLnNbmGOx+MINPdJQQEqi1diMlwjfz7XnWKZTtJr/JKwgIM6sTm2WKvz
 GFI/MxIIypmMB3ZgmlItW4/UaPbdgeUgb5Ga5LgkDThgRnOzk/BQFLxn/5jf7fmdM9uK
 /Naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E/piL+Cl5bNZ+cdgdtRq8tdPhqA168X72rjKGIcj1h4=;
 b=cYXPIvLgMlBe2WrrR9Qin57kxsKDvxKxnodbHAL78vL6tjqpopgIReVwInAv25dSXc
 +9vNv5j/ZnuUNH6b6+Wh0FMTCL6N5nHqeiiVeuXpMY4t+ejEuTZ7ZNYS3FevwDHcRtzL
 RnYwyJHDhLc2SvP4FojwPN6uKJlJBzgYHZCE4R7ieHNRmkjG6dXPs32GS+OTwVmI9zzr
 8KEsHUS5RGUPFvYG7Z//ytJRQVO3BsVNpZyQ+p5jXOWZTTccB5Z2hIx2N+WGVK0wySyj
 onMRO9cgDf6kyHMIzgZaBUhXMUSrgS1kgHQAZ20YXAmUcgrcDjWuDY06byDAeWJEw1RM
 3XPQ==
X-Gm-Message-State: ACrzQf0cJJjleL/R3Cy6hf7uT0fe5evKNnYDQlEw8PKNTGu9YhiQYiAu
 YqcJg8/3WHusu7f6lzo7bazhIgQzhg5/IgYiHNsdLw==
X-Google-Smtp-Source: AMsMyM6Q6nrL8lOCi83NdWMY6wKW/FytxI2676zCB6+Z2xX8cVC67C12vEdkRnmssQAcscBm4uxHwhyfQkZ6/acn8wI=
X-Received: by 2002:a1f:4843:0:b0:3ae:c4a3:d653 with SMTP id
 v64-20020a1f4843000000b003aec4a3d653mr3536302vka.1.1665999328063; Mon, 17 Oct
 2022 02:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-2-andriy.shevchenko@linux.intel.com>
 <CACRpkdbdzFR-a_xh8EjLMAshTeesOYhD3-_Bkc=vi7iK72ZKtA@mail.gmail.com>
In-Reply-To: <CACRpkdbdzFR-a_xh8EjLMAshTeesOYhD3-_Bkc=vi7iK72ZKtA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 17 Oct 2022 11:35:16 +0200
Message-ID: <CAMRc=MexjuQw+hUDDfCVxiBEJ573jNb3Ko9SyOU-xJ03wOe8cQ@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Kent Gibson <warthog618@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomasz Figa <tomasz.figa@gmail.com>,
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
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 01/36] gpiolib: tegra186: Add missed
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

On Mon, Oct 17, 2022 at 10:52 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>
> > Do not imply that some of the generic headers may be always included.
> > Instead, include explicitly what we are direct user of.
> >
> > While at it, sort headers alphabetically.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

Andy: are you going to send it together with the corresponding pinctrl
changes in a separate PR?

Bart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
