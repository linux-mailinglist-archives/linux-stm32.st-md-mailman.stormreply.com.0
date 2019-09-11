Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 644A4AF8A5
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Sep 2019 11:15:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24767C35E01;
	Wed, 11 Sep 2019 09:15:25 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F4DBC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Sep 2019 09:15:23 +0000 (UTC)
Received: from localhost (unknown [148.69.85.38])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1EE6D10000D;
 Wed, 11 Sep 2019 09:15:02 +0000 (UTC)
Date: Wed, 11 Sep 2019 11:14:58 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <20190911091458.GD21254@piout.net>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
 <81da473f-54d7-2a00-61ec-9351cdfcaaf3@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81da473f-54d7-2a00-61ec-9351cdfcaaf3@baylibre.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: tmaimon77@gmail.com, linus.walleij@linaro.org, nsekhar@ti.com,
 guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 khilman@baylibre.com, ludovic.desroches@microchip.com, linux-imx@nxp.com,
 u.kleine-koenig@pengutronix.de, uclinux-h8-devel@lists.sourceforge.jp,
 marc.zyngier@arm.com, s.hauer@pengutronix.de, linux-unisoc@lists.infradead.org,
 khalasa@piap.pl, tglx@linutronix.de, sbranden@broadcom.com,
 linux-kernel@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com,
 kernel@pengutronix.de, Claudiu Beznea <claudiu.beznea@microchip.com>,
 mark.rutland@arm.com, jhogan@kernel.org, palmer@sifive.com, eric@anholt.net,
 thierry.reding@gmail.com, manivannan.sadhasivam@linaro.org,
 ysato@users.sourceforge.jp, zhang.lyra@gmail.com, daniel.lezcano@linaro.org,
 jonathanh@nvidia.com, bgolaszewski@baylibre.com, kgene@kernel.org,
 linux-arm-msm@vger.kernel.org, sudeep.holla@arm.com, f.fainelli@gmail.com,
 john.stultz@linaro.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 baohua@kernel.org, kaloz@openwrt.org, sboyd@kernel.org, wahrenst@gmx.net,
 mcoquelin.stm32@gmail.com, linux-tegra@vger.kernel.org, festevam@gmail.com,
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
 vgupta@synopsys.com, nicolas.ferre@microchip.com, linux@prisktech.co.nz,
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

On 11/09/2019 09:34:27+0200, Neil Armstrong wrote:
> Hi,
> 
> On 10/09/2019 15:47, Claudiu Beznea wrote:
> > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > 
> > Some timer drivers may behave either as clocksource or clockevent
> > or both. Until now, in case of platforms with multiple hardware
> > resources of the same type, the drivers were chosing the first
> > registered hardware resource as clocksource/clockevent and the
> > next one as clockevent/clocksource. Other were using different
> > compatibles (one for each functionality, although its about the
> > same hardware). Add DT bindings to be able to choose the
> > functionality of a timer.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> > ---
> >  Documentation/devicetree/bindings/chosen.txt | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> > index 45e79172a646..aad3034cdbdf 100644
> > --- a/Documentation/devicetree/bindings/chosen.txt
> > +++ b/Documentation/devicetree/bindings/chosen.txt
> > @@ -135,3 +135,23 @@ e.g.
> >  		linux,initrd-end = <0x82800000>;
> >  	};
> >  };
> > +
> > +linux,clocksource and linux,clockevent
> > +--------------------------------------
> > +
> > +Those nodes have a timer property. This property is a phandle to the timer to be
> > +chosen as the clocksource or clockevent. This is only useful when the platform
> > +has multiple identical timers and it is not possible to let linux make the
> > +correct choice.
> > +
> > +/ {
> > +	chosen {
> > +		linux,clocksource {
> > +			timer = <&timer0>;
> > +		};
> > +
> > +		linux,clockevent {
> > +			timer = <&timer1>;
> > +		};
> > +	};
> > +};
> > 
> 
> Why not in aliases ?
> 
> aliases {
>     clocksource0 = &timer0;
>     clockevent0 = &timer1;
> };
> 
> since we can have multiple of each, we should not limit ourselves to 1 clkevent
> and 1 clksource.
> 
> In the aliases case, each driver would expose both capabilities, and the core would select
> what to enable.
> 

For extendability, you need nodes for that because at some point, you
may need to also be able to select the timer frequency. You can't do
that with an alias.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
