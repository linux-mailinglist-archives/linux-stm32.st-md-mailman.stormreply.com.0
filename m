Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 423BCAEE21
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2019 17:08:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3FB3C35E01;
	Tue, 10 Sep 2019 15:08:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF7CAC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2019 15:08:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91E1F1000;
 Tue, 10 Sep 2019 08:08:50 -0700 (PDT)
Received: from e107533-lin.cambridge.arm.com (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC2483F71F;
 Tue, 10 Sep 2019 08:08:35 -0700 (PDT)
Date: Tue, 10 Sep 2019 16:08:26 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Claudiu.Beznea@microchip.com
Message-ID: <20190910150826.GA18308@e107533-lin.cambridge.arm.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
 <20190910143231.GB14966@e107533-lin.cambridge.arm.com>
 <ab43b209-78fa-0cab-b8ea-acd4c550e689@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab43b209-78fa-0cab-b8ea-acd4c550e689@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: tmaimon77@gmail.com, linus.walleij@linaro.org, nsekhar@ti.com,
 guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 khilman@baylibre.com, Ludovic.Desroches@microchip.com, linux-imx@nxp.com,
 u.kleine-koenig@pengutronix.de, uclinux-h8-devel@lists.sourceforge.jp,
 marc.zyngier@arm.com, s.hauer@pengutronix.de, linux-unisoc@lists.infradead.org,
 khalasa@piap.pl, tglx@linutronix.de, sbranden@broadcom.com,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com,
 kernel@pengutronix.de, mark.rutland@arm.com, alexandre.belloni@bootlin.com,
 jhogan@kernel.org, palmer@sifive.com, eric@anholt.net,
 thierry.reding@gmail.com, manivannan.sadhasivam@linaro.org,
 ysato@users.sourceforge.jp, zhang.lyra@gmail.com, daniel.lezcano@linaro.org,
 jonathanh@nvidia.com, bgolaszewski@baylibre.com, kgene@kernel.org,
 linux-arm-msm@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 f.fainelli@gmail.com, john.stultz@linaro.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, baohua@kernel.org, kaloz@openwrt.org,
 sboyd@kernel.org, wahrenst@gmx.net, mcoquelin.stm32@gmail.com,
 narmstrong@baylibre.com, linux-tegra@vger.kernel.org, festevam@gmail.com,
 lorenzo.pieralisi@arm.com, benjaminfair@google.com, shc_work@mail.ru,
 krzk@kernel.org, yuenn@google.com, wens@csie.org,
 bcm-kernel-feedback-list@broadcom.com, orsonzhai@gmail.com,
 linux-snps-arc@lists.infradead.org, rjui@broadcom.com, vz@mleia.com,
 john@phrozen.org, tali.perry1@gmail.com, avifishman70@gmail.com,
 venture@google.com, lftan@altera.com, linux-oxnas@groups.io,
 shawnguo@kernel.org, afaerber@suse.de, baruch@tkos.co.il,
 maxime.ripard@bootlin.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux@armlinux.org.uk, agross@kernel.org, slemieux.tyco@gmail.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ssantosh@kernel.org,
 matthias.bgg@gmail.com, monstr@monstr.eu, baolin.wang@linaro.org,
 vgupta@synopsys.com, Nicolas.Ferre@microchip.com, linux@prisktech.co.nz,
 nios2-dev@lists.rocketboards.org
Subject: Re: [Linux-stm32] [PATCH 4/7] dt-bindings: chosen: Add clocksource
 and clockevent selection
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

On Tue, Sep 10, 2019 at 02:51:50PM +0000, Claudiu.Beznea@microchip.com wrote:
> 
> 
> On 10.09.2019 17:32, Sudeep Holla wrote:
> > External E-Mail
> > 
> > 
> > On Tue, Sep 10, 2019 at 04:47:13PM +0300, Claudiu Beznea wrote:
> >> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >>
> >> Some timer drivers may behave either as clocksource or clockevent
> >> or both. Until now, in case of platforms with multiple hardware
> >> resources of the same type, the drivers were chosing the first
> >> registered hardware resource as clocksource/clockevent and the
> >> next one as clockevent/clocksource. Other were using different
> >> compatibles (one for each functionality, although its about the
> >> same hardware). Add DT bindings to be able to choose the
> >> functionality of a timer.
> >>
> > 
> > Is the piece of hardware not capable of serving as both clocksource
> > and clockevent or is it just the platform choice ?
> 
> In my case, the hardware is not capable of serving at the same time
> a clocksource device and a clockevent device.
> 
> First, I published v1 for a hardware device having this behavior at
> [1] requesting 1st probed hardware device to work as clocksource and
> the 2nd one to work as clockevent. The discussion at [1] ended up with
> the idea of having a mechanism to specify which hardware device behaves
> as clocksource and which one behaves as clockevent.
>

In that case, why can't we identify capability that with the compatibles
for this timer IP ?

IOW, I don't like the proposal as it's hardware limitation.

--
Regards,
Sudeep
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
