Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 958C346B50C
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Dec 2021 09:04:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B247C5F1E5;
	Tue,  7 Dec 2021 08:04:06 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D210C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 08:04:04 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1muVRw-0007zm-Lm; Tue, 07 Dec 2021 09:03:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1muVRh-003BVK-7H; Tue, 07 Dec 2021 09:03:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1muVRg-0004V5-7f; Tue, 07 Dec 2021 09:03:28 +0100
Date: Tue, 7 Dec 2021 09:03:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20211207080325.6hfokrrcs45iucx6@pengutronix.de>
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Baruch Siach <baruch@tkos.co.il>, Heiko Stuebner <heiko@sntech.de>,
 Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-rockchip@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Alexandru Ardelean <aardelean@deviqon.com>, Orson Zhai <orsonzhai@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Thierry Reding <treding@nvidia.com>, Jianqun Xu <jay.xu@rock-chips.com>,
 linux-pwm@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Gregory Fong <gregory.0xf0@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 linux-unisoc@lists.infradead.org, patches@opensource.cirrus.com,
 Kevin Hilman <khilman@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Keerthy <j-keerthy@ti.com>, Baolin Wang <baolin.wang7@gmail.com>,
 linux-power@fi.rohmeurope.com
Subject: Re: [Linux-stm32] [PATCH v1 1/3] gpio: Get rid of duplicate of_node
 assignment in the drivers
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
Content-Type: multipart/mixed; boundary="===============2943283831224744356=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2943283831224744356==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xelnb7q2ptte2x6e"
Content-Disposition: inline


--xelnb7q2ptte2x6e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andy,

you Cc: linux-pwm and the pwm maintainers in this series. I don't spot
anything pwm specific here (apart from touching gpio-mvebu which also
contains a PWM driver). Do I miss something?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xelnb7q2ptte2x6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGvFUoACgkQwfwUeK3K
7Ak2FAf/a3x5Co4mVUxKnXqmGwHXz7g+sVyT+Syp0AbNKmLSwV/jFmFT6Zy9u/ee
Tv34gVXuYPBNDch6VBo47qrv8omMZtiQvE6l0bU4pmjYU9kriMmE4l65BQqexZaM
bM0EDY+/6GNToLwCq7AXD6l/waEl7lwtO/KcLZHowCSWr7opyg23EoTgDCyxLUwv
ceSVjNXqAAd4NzyHf63suy2ID66QzItCoRNbOrOBtIi1Vo5RM0SgZbN8ODyXKIWu
sGCnBiaseRnCv31VkHPE/hsgFXIEwQbtMwohgWfD7YlrkmpOh3Bi29Em95cRuVIo
tZQmPFwDQcMgt/4UuHdm2lxVcYjgyQ==
=gmyE
-----END PGP SIGNATURE-----

--xelnb7q2ptte2x6e--

--===============2943283831224744356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2943283831224744356==--
