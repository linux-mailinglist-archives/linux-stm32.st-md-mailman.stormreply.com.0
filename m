Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D82E719461
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Jun 2023 09:35:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA479C6A614;
	Thu,  1 Jun 2023 07:35:44 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0860DC65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jun 2023 07:35:43 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1q4coj-0002fR-SK; Thu, 01 Jun 2023 09:33:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q4coG-004Iid-J4; Thu, 01 Jun 2023 09:33:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1q4coF-00A54n-3w; Thu, 01 Jun 2023 09:33:23 +0200
Date: Thu, 1 Jun 2023 09:33:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <20230601073322.ww25ajaurktqsryr@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Khalil Blaiech <kblaiech@nvidia.com>, Jochen Friedrich <jochen@scram.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Jean Delvare <jdelvare@suse.com>, linux-tegra@vger.kernel.org,
 ye xingchen <ye.xingchen@zte.com.cn>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-omap@vger.kernel.org, Allison Randal <allison@lohutok.net>,
 Scott Branden <sbranden@broadcom.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Jeffery <andrew@aj.id.au>, Masami Hiramatsu <mhiramat@kernel.org>,
 kernel@pengutronix.de, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-i2c@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 Stefan Wahren <stefan.wahren@i2se.com>, chrome-platform@lists.linux.dev,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Peter Korsgaard <peter.korsgaard@barco.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Chris Pringle <chris.pringle@phabrix.com>, Andi Shyti <andi.shyti@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-rpi-kernel@lists.infradead.org, Nick Hawkins <nick.hawkins@hpe.com>,
 linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jim Cromie <jim.cromie@gmail.com>,
 Hector Martin <marcan@marcan.st>, Wolfram Sang <wsa@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Thor Thayer <thor.thayer@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>,
 Jean-Marie Verdun <verdun@hpe.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Elie Morisse <syniurge@gmail.com>,
 Stefan Roese <sr@denx.de>, Krzysztof Adamski <krzysztof.adamski@nokia.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Peter Korsgaard <peter@korsgaard.com>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-aspeed@lists.ozlabs.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Wei Chen <harperchen1110@gmail.com>,
 Nancy Yuen <yuenn@google.com>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Robert Richter <rric@kernel.org>, Asmaa Mnebhi <asmaa@nvidia.com>,
 Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Benson Leung <bleung@chromium.org>, Qii Wang <qii.wang@mediatek.com>,
 Avi Fishman <avifishman70@gmail.com>, linux-mips@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>,
 Julia Lawall <Julia.Lawall@inria.fr>, Laxman Dewangan <ldewangan@nvidia.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>, asahi@lists.linux.dev,
 Shawn Guo <shawnguo@kernel.org>, Peter Rosin <peda@axentia.se>,
 Baruch Siach <baruch@tkos.co.il>, Vignesh R <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, Tali Perry <tali.perry1@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Chris Brandt <chris.brandt@renesas.com>,
 linux-mediatek@lists.infradead.org, Jan Dabros <jsd@semihalf.com>,
 linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-renesas-soc@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kamal Dasu <kdasu.kdev@gmail.com>, openbmc@lists.ozlabs.org,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andy Gross <agross@kernel.org>,
 Sven Peter <sven@svenpeter.dev>, Hans de Goede <hdegoede@redhat.com>,
 George Cherian <gcherian@marvell.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, Patrick Venture <venture@google.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Michael Shych <michaelsh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [Linux-stm32] [PATCH 00/89] i2c: Convert to platform remove
 callback returning void
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
Content-Type: multipart/mixed; boundary="===============2317956652354490763=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2317956652354490763==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t3p72aozx6nadzgj"
Content-Disposition: inline


--t3p72aozx6nadzgj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Dropped Phil Edworthy from recipents as his email address has problems]

Hello,

On Mon, May 08, 2023 at 10:51:37PM +0200, Uwe Kleine-K=F6nig wrote:
> this series convers the drivers below drivers/i2c to the .remove_new()
> callback of struct platform_driver(). The motivation is to make the
> remove callback less prone for errors and wrong assumptions. See commit
> 5c5a7680e67b ("platform: Provide a remove callback that returns no
> value") for a more detailed rationale.
>=20
> All but one driver already returned zero unconditionally in their
> .remove() callback, so converting them to .remove_new() is trivial.
> i2c-davinci has two patches in this series, first the error path is
> improved to not return an error code, then it's converted as the others
> drivers are.
>=20
> The two davinci patches are also the only interdependency in this
> series. I was unsure if I should split the series in two, the busses and
> the mux changes; if convenient these can be applied independent of each
> other.

I wonder how this series will go in. My expectation was that Wolfram
picks up the whole series via his tree?!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t3p72aozx6nadzgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR4ScIACgkQj4D7WH0S
/k5tFwgAlOnFyNSd/y+RTxXNPFfhdLDFrGmy0vVlKgNWr54rj45mpn2vKbWNVNMh
uHJkfu86+59kw2Z0mV0P0MetDeJReqHGuXrjQe87Pkus+gNIQ6yV0pH5TFAVpTxR
eD04UBlV5+o939pFIOX+jBdeGDvPcSeECFfwxplSVVvUU6jJ6g0LiCDNdn6eNxHD
g2Dnl8SpsU1t5iM62pyjZlBoscqvjfFiBCGdT80CmYeMPJM5UnBEdJOmpybfa8Ce
scJdDvHFUP2jh1LC+0RQ43raxUyZon0Lie6tT6IbAoOXUiTqpcZ6NOhyobMzOcHq
FIkEZoeC8nKcmthV7foaEY5TgzmK+w==
=LLVA
-----END PGP SIGNATURE-----

--t3p72aozx6nadzgj--

--===============2317956652354490763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2317956652354490763==--
