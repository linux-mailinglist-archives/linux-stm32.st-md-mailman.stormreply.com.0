Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C2385620E
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 12:47:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCD15C6410C;
	Thu, 15 Feb 2024 11:47:58 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66B3AC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 11:47:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raaCf-0007ES-Uk; Thu, 15 Feb 2024 12:46:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raaCW-000sHg-HB; Thu, 15 Feb 2024 12:46:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raaCW-005KD7-12;
 Thu, 15 Feb 2024 12:46:48 +0100
Date: Thu, 15 Feb 2024 12:46:48 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 James Clark <james.clark@arm.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, 
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>, 
 Vladimir Zapolskiy <vz@mleia.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Michael Walle <mwalle@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Hammer Hsieh <hammerh0314@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
 Sean Anderson <sean.anderson@seco.com>, Michal Simek <michal.simek@amd.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, Anjelique Melendez <quic_amelende@quicinc.com>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, Kees Cook <keescook@chromium.org>,
 Rob Herring <robh@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <frrn4vofjuskb67rxrgnwqrsqioonglp7nidoueumgw2hemhxq@6hrsnivgobuw>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rockchip@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, greybus-dev@lists.linaro.org,
 Douglas Anderson <dianders@chromium.org>, asahi@lists.linux.dev,
 kernel@pengutronix.de, linux-hardening@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 000/164] pwm: Improve lifetime tracking
	for pwm_chips
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
Content-Type: multipart/mixed; boundary="===============8059331904211172700=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8059331904211172700==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t4o747itgdnx5oup"
Content-Disposition: inline


--t4o747itgdnx5oup
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Feb 14, 2024 at 10:30:47AM +0100, Uwe Kleine-K=F6nig wrote:
> this is v6 of the series introducing better lifetime tracking for
> pwmchips that addresses (for now theoretic) lifetime issues of pwm
> chips. Addressing these is a necessary precondition to introduce chardev
> support for PWMs.
>=20
> Locking got more complicated due to non-sleeping chips, so I dropped
> the character device patch because it got still more incomplete now.
> Also I'm not yet entirely sure about patches #162 and #163 and I expect
> them to change before they can go in. My plan for the next merge window
> is to get the patches in up to #160. After that the addition of chardev
> support (including correct locking) can continue without having to touch
> the lowlevel driver. So the idea of this series is to get the driver
> adaptions out of the way as this requires some cross-tree coordination.
>=20
> The patches that touch files outside of drivers/pwm include:
>=20
>  - gpio: mvebu: Make use of devm_pwmchip_alloc() function
>    It already has an Ack by Linus Walleij.
>=20
>  - drm/bridge: ti-sn65dsi86: Make use of pwmchip_parent() accessor
>  - drm/bridge: ti-sn65dsi86: Make use of devm_pwmchip_alloc() function
>    The 2nd already has an Ack by Douglas Anderson which I tend to assume
>    good enough to merge this via my pwm tree, too. An Ack for the first
>    patch would be nice.
>=20
>  - leds: qcom-lpg: Make use of devm_pwmchip_alloc() function
>    Already has an Ack by Lee Jones.
>=20
>  - staging: greybus: pwm: Change prototype of helpers to prepare further =
changes
>  - staging: greybus: pwm: Make use of pwmchip_parent() accessor
>  - staging: greybus: pwm: Rely on pwm framework to pass a valid hwpwm
>  - staging: greybus: pwm: Drop unused gb_connection_set_data()
>  - staging: greybus: pwm: Rework how the number of PWM lines is determined
>  - staging: greybus: pwm: Make use of devm_pwmchip_alloc() function
>    The greybus patches already got an Ack by Greg Kroah-Hartman in an
>    earlier series, but I dropped it as the patches changed considerably.

After getting the needed acks, I pushed out this series in

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

up to patch #161.

(But don't let you stop looking at the changes, reviews are still
welcome.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t4o747itgdnx5oup
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXN+acACgkQj4D7WH0S
/k6nrwf9Huw1P/RTRggrOHnHFRGpBXi+TWvCPbsOC65CPiHeI7iVxtq/vUtQ4A6L
CNA0O2W96568TwCEnxxCI6Be+7t8/H/Xb+oTs0yb6hblYkDhxYrXz+wAtoCTWOM8
MI6xhfufB/JvOhgeX0iVMIx/TOc7gDY0wnFCS7bE15PPxMTjb1yF9Uo3az97CIld
AF8InyaA81p8dcTlhmHzMa59LEFqoPzmNoySKqTIII7UuHmQRXOqV1RuEmKxN9Ho
yRvisZgaqoinb8K7tXdw6G8HErBcN1aHM4OQBkZWI0ufVRNzQ8gT1sfoaRlsilOv
yc/xo9Wl8bLPEKrjcpb9Hv/C+LgzyQ==
=hkRd
-----END PGP SIGNATURE-----

--t4o747itgdnx5oup--

--===============8059331904211172700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8059331904211172700==--
