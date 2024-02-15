Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3848F856278
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 13:03:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDC72C6410C;
	Thu, 15 Feb 2024 12:03:01 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD781C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 12:03:00 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raaRB-0000Gm-6C; Thu, 15 Feb 2024 13:01:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raaR5-000sKN-Ds; Thu, 15 Feb 2024 13:01:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raaR5-005KpH-0o;
 Thu, 15 Feb 2024 13:01:51 +0100
Date: Thu, 15 Feb 2024 13:01:51 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <ws4ybgtvfxqz53vk3i67suipzyqpy5y5fqeee5uf3ua6ow222n@i4ktjuorq3nl>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
 <9577d6053a5a52536057dc8654ff567181c2da82.1707900770.git.u.kleine-koenig@pengutronix.de>
 <Zcy21tsntcK80hef@smile.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <Zcy21tsntcK80hef@smile.fi.intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Hector Martin <marcan@marcan.st>, Michael Walle <mwalle@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, James Clark <james.clark@arm.com>,
 Pavel Machek <pavel@ucw.cz>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Guenter Roeck <groeck@chromium.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-riscv@lists.infradead.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Michal Simek <michal.simek@amd.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-leds@vger.kernel.org,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pwm@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Kees Cook <keescook@chromium.org>, Rob Herring <robh@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, Sven Peter <sven@svenpeter.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Scott Branden <sbranden@broadcom.com>, linux-gpio@vger.kernel.org,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alexander Shiyan <shc_work@mail.ru>, Palmer Dabbelt <palmer@dabbelt.com>,
 asahi@lists.linux.dev, kernel@pengutronix.de,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Anjelique Melendez <quic_amelende@quicinc.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v6 003/164] pwm: Provide pwmchip_alloc()
 function and a devm variant of it
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
Content-Type: multipart/mixed; boundary="===============7194455970900045900=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============7194455970900045900==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eo4pepuhkmuwjzg5"
Content-Disposition: inline


--eo4pepuhkmuwjzg5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 02:49:26PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 14, 2024 at 10:30:50AM +0100, Uwe Kleine-K=F6nig wrote:
> > This function allocates a struct pwm_chip and driver data. Compared to
> > the status quo the split into pwm_chip and driver data is new, otherwise
> > it doesn't change anything relevant (yet).
> >=20
> > The intention is that after all drivers are switched to use this
> > allocation function, its possible to add a struct device to struct
> > pwm_chip to properly track the latter's lifetime without touching all
> > drivers again. Proper lifetime tracking is a necessary precondition to
> > introduce character device support for PWMs (that implements atomic
> > setting and doesn't suffer from the sysfs overhead of the /sys/class/pwm
> > userspace support).
> >=20
> > The new function pwmchip_priv() (obviously?) only works for chips
> > allocated with pwmchip_alloc().
>=20
> ...
>=20
> > +#define PWMCHIP_ALIGN ARCH_DMA_MINALIGN
> > +
> > +static void *pwmchip_priv(struct pwm_chip *chip)
> > +{
> > +	return (void *)chip + ALIGN(sizeof(*chip), PWMCHIP_ALIGN);
> > +}
>=20
> Why not use dma_get_cache_alignment() ?

Hmm, that function returns 1 if ARCH_HAS_DMA_MINALIGN isn't defined. The
idea of using ARCH_DMA_MINALIGN was to ensure that the priv data has the
same minimal alignment as kmalloc(). Took my inspriration from
https://lore.kernel.org/r/20240209-counter-align-fix-v2-1-5777ea0a2722@anal=
og.com
=2E The implementation of dma_get_cache_alignment suggests that not all
archs provide ARCH_DMA_MINALIGN? Also there is ARCH_KMALLOC_MINALIGN.
Hmm, don't know yet what to do here.

> > +/* This is the counterpart to pwmchip_alloc */
>=20
> pwmchip_alloc()

Ack.
=20
> > +EXPORT_SYMBOL_GPL(pwmchip_put);
>=20
> > +EXPORT_SYMBOL_GPL(pwmchip_alloc);
>=20
> > +EXPORT_SYMBOL_GPL(devm_pwmchip_alloc);
>=20
> Are these exported via namespace? If no, can they be from day 1?

I added that to my todo list for all pwm functions. Will address that
separately.

Thanks for your feedback
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--eo4pepuhkmuwjzg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXN/SUACgkQj4D7WH0S
/k7Wcgf+PH/0QpqNNV4Y2/FkmhtRuwoboRFbLUmPSdsZXmpktX2oCcZmzsdo7ECA
hWfFTUYhOspa5kHVcw+nxqCLWdGrQfQ4C0LtsPicyPjTXPVpP8W09vwdeatCiqVr
GxgvULwRl/HxZXMUXZhJ5ToJRT/yuN1CLjpyjnINyIczC+jZFclxgx43quAbXMIf
SCUAlxTR/Jm/mjCmH2N7Fftk64+hCNWB2gsjkaQsDUwtAelt3/J9u4h2He4NPzPi
GaEZ3tfrkKkBWoolaCIhY1LqXtT3nU+qiP5t/bPD00DRDM2XtKsjvAk526Lx/OAu
y+6AtGBx3n9HzXzyJ+bdew1oAMND9g==
=44B0
-----END PGP SIGNATURE-----

--eo4pepuhkmuwjzg5--

--===============7194455970900045900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7194455970900045900==--
