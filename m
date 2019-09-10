Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C22AEF28
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2019 18:07:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA752C35E01;
	Tue, 10 Sep 2019 16:07:51 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80F91C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 16:05:41 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t16so21239647wra.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 09:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bmUQUZCrkmmER7Gwmy8S0BUpeyPHQQl8phfWONZCLwc=;
 b=rjQLp1SQr9CFzSv+cqoe7o9cqn+LoOLnCw6J0BFN4Tni+fdgPvLVAYatxfC2z7ESKE
 BkdyYaUVrSd0CbHPE9a2dbSSVQVUsvKQxYRxHecNPFgTP4QkJ/K/Zr187OXzDGRIHw9l
 nAoWLQTucRc9SGEzkSPX+SEchIPHWGYhKIMisx13n4yV6i7po9MtQZkAsqrwfecG8eWn
 FFLnuPUd8pih/wPmIQbuZ5tVnoItuRaDfRIIy9/J9gaUJrpELIBFZM8YUm5ONa65jXRd
 Iw0q8S78n+M9kLbl6kjHW0INM+Z2JrzvoxpR65RTBW5R0pDJuamPDJ27N1/rYFEc/LKc
 1xCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bmUQUZCrkmmER7Gwmy8S0BUpeyPHQQl8phfWONZCLwc=;
 b=bEuvzv2p5a97ZH9bTOLPTzNXSl9XXG7mamF5KiXWTE5JrUO/FUxzPiiPS8xDJwXIQg
 hXcvnAF0PFBzla/f9QJyOfGwCqF2rzsFuP/TDx3llwtrjOBRjYaN1OCpMbsZkyNmi0v2
 0XmQgU4gMiQ0qFOY3gEphtfqeKvbXPEoPH40KKOfSATa79z1dGxQiKKnw3JCc80lpTZV
 FNHMc6T48CtOEY66Dz7H9dMWO3JNEL9AWfI4U4FCFnf6R8wPKiSGIkiSa1s4MmeLb8oI
 c/Nz3hAZunQcc5hbcVm4z1KcEXdDEE65+fnemwhRJsatOuSNZTcGcN6Lv3uwccZpCmkB
 YTXQ==
X-Gm-Message-State: APjAAAUWA98GV0Bc8RlYb1INLell6w5HxLQJVeTYbue6kj5M5TovqF8Y
 G5mg+cekmpr+Ng/LM3LFCKYHNWluuWzj56Nl4wCTVA==
X-Google-Smtp-Source: APXvYqwHpOAzxh0Vj814CN8tokkTqoSrdFGwVy5mHO7nLon/MoZecZG1w1hZQ/4dXw5R04KRe3J/iX/8TD1h6uS2EUA=
X-Received: by 2002:a05:6000:49:: with SMTP id k9mr7049475wrx.21.1568131540932; 
 Tue, 10 Sep 2019 09:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
In-Reply-To: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 10 Sep 2019 09:05:30 -0700
Message-ID: <CALAqxLWLStTqGx5DAvUKOYupdgK-doOxRF5Z_Us=L5vnFaa=7w@mail.gmail.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
X-Mailman-Approved-At: Tue, 10 Sep 2019 16:07:51 +0000
Cc: tmaimon77@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
 nsekhar@ti.com, guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-samsung-soc@vger.kernel.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Kevin Hilman <khilman@baylibre.com>, ludovic.desroches@microchip.com,
 linux-imx@nxp.com,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 uclinux-h8-devel@lists.sourceforge.jp, Marc Zyngier <marc.zyngier@arm.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org,
 =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
 Thomas Gleixner <tglx@linutronix.de>, sbranden@broadcom.com,
 lkml <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>,
 Paul Burton <paul.burton@mips.com>, kernel@pengutronix.de,
 Mark Rutland <mark.rutland@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, jhogan@kernel.org,
 palmer@sifive.com, eric@anholt.net, Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, zhang.lyra@gmail.com,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jon Hunter <jonathanh@nvidia.com>,
 bgolaszewski@baylibre.com, Kukjin Kim <kgene@kernel.org>,
 linux-arm-msm@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, baohua@kernel.org,
 kaloz@openwrt.org, Stephen Boyd <sboyd@kernel.org>, wahrenst@gmx.net,
 mcoquelin.stm32@gmail.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-tegra@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, benjaminfair@google.com,
 shc_work@mail.ru, Krzysztof Kozlowski <krzk@kernel.org>, yuenn@google.com,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 orsonzhai@gmail.com, linux-snps-arc@lists.infradead.org, rjui@broadcom.com,
 vz@mleia.com, john@phrozen.org, tali.perry1@gmail.com, avifishman70@gmail.com,
 venture@google.com, lftan@altera.com, linux-oxnas@groups.io,
 Shawn Guo <shawnguo@kernel.org>, afaerber@suse.de,
 Baruch Siach <baruch@tkos.co.il>, maxime.ripard@bootlin.com,
 Liviu Dudau <liviu.dudau@arm.com>, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, openbmc@lists.ozlabs.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>, slemieux.tyco@gmail.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, aou@eecs.berkeley.edu,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Baolin Wang <baolin.wang@linaro.org>, vgupta@synopsys.com,
 nicolas.ferre@microchip.com, linux@prisktech.co.nz,
 nios2-dev@lists.rocketboards.org
Subject: Re: [Linux-stm32] [PATCH 0/7] add support for
	clocksource/clockevent DT selection
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

On Tue, Sep 10, 2019 at 6:47 AM Claudiu Beznea
<claudiu.beznea@microchip.com> wrote:
>
> This series adds support to permit the selection of clocksource/clockevent
> via DT.

Sorry about this, but could you try to include more of a rational for
*why* this would be useful in your cover-letter/commit messages?

I'm not sure I understand the limitation that requires such an option
to be added to the dts.

thanks
-john
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
