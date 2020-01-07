Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B06D1323F4
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 11:42:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50FF9C36B0B;
	Tue,  7 Jan 2020 10:42:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95DACC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 10:42:46 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1iomJn-0005TW-KM; Tue, 07 Jan 2020 11:42:35 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1iomJm-0004iE-4c; Tue, 07 Jan 2020 11:42:34 +0100
Date: Tue, 7 Jan 2020 11:42:34 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200107104234.wq74fska3szrg4ii@pengutronix.de>
References: <20191230172113.17222-1-krzk@kernel.org>
 <20191230172113.17222-2-krzk@kernel.org>
 <20200107072645.ko247bwhh3ibdu73@pengutronix.de>
 <20200107082539.GA31827@pi3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107082539.GA31827@pi3>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 kernel@pengutronix.de, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] pwm: Enable compile testing for some
	of drivers
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Krzysztof,

On Tue, Jan 07, 2020 at 09:25:39AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Jan 07, 2020 at 08:26:45AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Mon, Dec 30, 2019 at 06:21:13PM +0100, Krzysztof Kozlowski wrote:
> > > Some of the PWM drivers can be compile tested to increase build
> > > coverage.
> > > =

> > > The Meson PWM driver requires COMMON_CLK dependency.
> > =

> > I'm surprised that there are not more that need this. Is HAVE_CLK not
> > enough?
> =

> Nope. E.g. for alpha architecture, HAVE_CLK is not set and without
> COMMON_CLK:
> =

> drivers/pwm/pwm-meson.o: In function `meson_pwm_init_channels':
> (.text+0x244): undefined reference to `devm_clk_register'

I see. devm_clk_register() only exists in include/linux/clk-provider.h.

> I guess other solution would be to add stubs for few clk functions...
> =

> > Also HAS_IOMEM is a typical requirement, but I tested with an ARCH=3Dum
> > config (which does't have HAS_IOMEM) and they all compile fine.
> =

> Because of !HAS_IOMEM, since some time ARCH=3Dum does not support
> COMPILE_TEST. Therefore HAS_IOMEM dependency is not needed for compile
> testing (and for regular build it is selected by ARCH).

Hehe, I didn't notice because for testing I just dropped the "depends on
..." lines in Kconfig instead of adding "|| COMPILE_TEST" :-) Still they
compile fine on UML.

Ah, since bc083a64b6c0 ("init/Kconfig: make COMPILE_TEST depend on
!UML") =3D=3D v4.8-rc1~52^2~83 COMPILE_TEST cannot be enabled on UML, but
later 1bcbfbfdeb00 ("um: add dummy ioremap and iounmap functions")
=3D=3D v4.13-rc1~8^2~6 UM got a dummy implementation. So maybe we could
revert bc083a64b6c0 today? (And if not, a comment about why near the
"depends on !UML" in init/Kconfig would be great.)

Orthogonal to that, I wonder if depending on HAS_IOMEM is right even
though the compile testers won't notice it missing. Or should HAS_IOMEM
be dropped?

> > > @@ -318,7 +319,7 @@ config PWM_MEDIATEK
> > >  =

> > >  config PWM_MXS
> > >  	tristate "Freescale MXS PWM support"
> > > -	depends on ARCH_MXS && OF
> > > +	depends on (ARCH_MXS && OF) || COMPILE_TEST
> > >  	select STMP_DEVICE
> > >  	help
> > >  	  Generic PWM framework driver for Freescale MXS.
> > > @@ -328,7 +329,8 @@ config PWM_MXS
> > >  =

> > >  config PWM_OMAP_DMTIMER
> > >  	tristate "OMAP Dual-Mode Timer PWM support"
> > > -	depends on OF && ARCH_OMAP && OMAP_DM_TIMER
> > > +	depends on (ARCH_OMAP && OMAP_DM_TIMER) || COMPILE_TEST
> > > +	depends on OF
> > =

> > I'm surprised that OF isn't required for PWM_MXS but is is for
> > PWM_OMAP_DMTIMER. pwm-mxs compiles without CONFIG_OF, didn't test
> > pwm-omap-dmtimer.
> =

> Since some time !OF has all necessary stubs so OF is actually needed
> only for binding, not compiling.

That doesn't explain why you handle PWM_MXS and PWM_OMAP_DMTIMER
differently though.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
