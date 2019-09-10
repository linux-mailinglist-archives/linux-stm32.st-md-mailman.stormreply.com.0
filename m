Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C2CAF375
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Sep 2019 01:48:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F34BC35E01;
	Tue, 10 Sep 2019 23:48:47 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B70A5C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 23:48:45 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id x80so14919899lff.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 16:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nL38C4T4rzT0VSsEiKY7BmomDl3hFeY7088tc9RdLq8=;
 b=fNEGUezEn4ClsVHmX/nmNiF7ZG6JTfC2btDRxEWPcdmRk0a0FsvI5GS8qdYjx25FKp
 Z5Q4/CFu+iDSAX2rFterlnGQ1MW2Sk6gR3mfMsTu8vyvU/jGEM0Jc08W0Sq44lgp0xR9
 CuSR5RUBNAD9f/xSIv24vJgfP+XgU0l/RFI3nayQNe/1yYJJGrgKDIL8s6DHZhU39Dqr
 TBKpHqE1DkJvJTHx2NFHskH6dl7p95yi4sNbTImUxUlyGuSbemOLPHLEtIfXkNBw9d7/
 rUpU1+cMWUkAMn+hR7NDiGLEM6b9jVVLEIcpdiiAIbYGINkcClRodvCdYR9vR8oMDgr8
 5cAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nL38C4T4rzT0VSsEiKY7BmomDl3hFeY7088tc9RdLq8=;
 b=OnmQ4hR+xY9Y33pT0TXoL3NE1+sBZoKR4FdrQATGIrXGlgJmyHKU+qw6C+m9J6WUt2
 IsPRwZJsxZ3chnXmRjZzSLXw+EuatS/fzK4X6x85TuytztmpxYMZSiXfKGvQth8PooG3
 ptKfoWOAFhc9IdCXuavieMthRgCvuYuibGCBr7PIJxMKglPk604txDpcTTeHWSXhqp3d
 kI3b3c0wkkWgKxKt++LY90h8Hfped6Gg88gWsp5wNjp/M939CYEN1tGr8GoimguWFpUK
 6jKzm13G+U4AKXhEn8DIbzi90NYi0f8ToCQ7Lm/ow1XjTlV7SFw5j8/XojWn6oNt0Nz7
 /AEw==
X-Gm-Message-State: APjAAAVzHW8bkt5XitDolW3YFUgrRV+2blFn+1/ZPo78AbmoMdNlNHa/
 s8gng1pgmdbo40DxNg/uBOcweZ4GCwPV9dS9ZHZuXg==
X-Google-Smtp-Source: APXvYqxP4f7JH+QwULI+vOrlKcfc2e6lWO/TBU9/DTND7ll7mmRrx+NRPo2/Aht4Q5KFeqk+4RbtApAQjqBPq8BsL30=
X-Received: by 2002:ac2:530e:: with SMTP id c14mr21391170lfh.165.1568159324971; 
 Tue, 10 Sep 2019 16:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-8-git-send-email-claudiu.beznea@microchip.com>
In-Reply-To: <1568123236-767-8-git-send-email-claudiu.beznea@microchip.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Sep 2019 00:48:33 +0100
Message-ID: <CACRpkdYsCFUNAtarTQmaA2a3-HZjiVjxQ-Wr-7wJp9xrtQRKCg@mail.gmail.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Tomer Maimon <tmaimon77@gmail.com>, "Nori, Sekhar" <nsekhar@ti.com>,
 guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 Marc Zyngier <marc.zyngier@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-unisoc@lists.infradead.org, Krzysztof Halasa <khalasa@piap.pl>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Sascha Hauer <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 James Hogan <jhogan@kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
 Eric Anholt <eric@anholt.net>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Lyra Zhang <zhang.lyra@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jon Hunter <jonathanh@nvidia.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kukjin Kim <kgene@kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>, John Stultz <john.stultz@linaro.org>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Barry Song <baohua@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
 Stephen Boyd <sboyd@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-tegra@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Benjamin Fair <benjaminfair@google.com>, Alexander Shiyan <shc_work@mail.ru>,
 Krzysztof Kozlowski <krzk@kernel.org>, Nancy Yuen <yuenn@google.com>,
 Chen-Yu Tsai <wens@csie.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>,
 John Crispin <john@phrozen.org>, tali.perry1@gmail.com,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Ley Foon Tan <lftan@altera.com>, linux-oxnas@groups.io,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Baruch Siach <baruch@tkos.co.il>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Liviu Dudau <liviu.dudau@arm.com>, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, aou@eecs.berkeley.edu,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Baolin Wang <baolin.wang@linaro.org>, Vineet Gupta <vgupta@synopsys.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Tony Prisk <linux@prisktech.co.nz>,
 "moderated list:NIOS2 ARCHITECTURE" <nios2-dev@lists.rocketboards.org>
Subject: Re: [Linux-stm32] [PATCH 7/7] clocksource/drivers/integrator-ap:
	parse the chosen node
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

On Tue, Sep 10, 2019 at 2:50 PM Claudiu Beznea
<claudiu.beznea@microchip.com> wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> The driver currently uses aliases to know whether the timer is the
> clocksource or the clockevent.

OK maybe that wasn't the most elegant solution.

> Add the /chosen/linux,clocksource and
> /chosen/linux,clockevent parsing while keeping backward compatibility.

This is not how I would solve this today.

I would simply remove/comment out the IRQ from the timer
that cannot be used for clockevent from the device tree
(apparently it doesn't work anyway), and make the code only
pick a timer with a valid interrupt assigned as clock event,
while a timer without interrupt can be used for clock source.

This has the upside of not needing any special aliases or
chosen things.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
