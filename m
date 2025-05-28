Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49512ACA923
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Jun 2025 07:56:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C584DC36B1E;
	Mon,  2 Jun 2025 05:56:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81E59C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 12:51:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 501C14A698;
 Wed, 28 May 2025 12:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A382FC4CEE7;
 Wed, 28 May 2025 12:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748436714;
 bh=SnUlBhjo9u7u7RSQrf1KxHe5OU8VLd3rhNPNiG04UYs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aEt+GYsqzE/+UQ/K7Hk/i0gSau9lkAT3hL2R69tTRbqACtYt9VtHrhU5qY0ibd3Xj
 EJQ3E8/eVuQ9CMfiomfFvchMrdqbskU2hRlkRmAtm4ZIk8qi0YifCqF9f6QQA6JgtE
 p9De0b1FMSRDj/IMgpOUzmtgoo7e4OSxEvq6HLAAHH/hJqFzgGBn4DqT7Lqat/SLZg
 i0LTZOqnq5R4P1I+l0r6kgNzamQPvGQG6wa2Lk1zJDGxHNf7he3hgN4ROBnp87OAo+
 yqhhzH8qztpN1ghO3+normZFf8fTYF/IPwFkOX9NyZx1nJKPkCY5jmDg9H6VKHkSff
 XClTH+H/YL33g==
Date: Wed, 28 May 2025 14:51:51 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <aDcG58lXUgtW7pRZ@lore-desk>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-16-76fe97899945@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20250528-pinctrl-const-desc-v1-16-76fe97899945@linaro.org>
X-Mailman-Approved-At: Mon, 02 Jun 2025 05:56:51 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tali Perry <tali.perry1@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-aspeed@lists.ozlabs.org, Emil Renner Berthing <kernel@esmil.dk>,
 linux-rtc@vger.kernel.org, Jesper Nilsson <jesper.nilsson@axis.com>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, Hal Feng <hal.feng@starfivetech.com>,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Ray Jui <rjui@broadcom.com>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Scott Branden <sbranden@broadcom.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com
Subject: Re: [Linux-stm32] [PATCH 16/17] pinctrl: Constify static
	'pinctrl_desc'
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
Content-Type: multipart/mixed; boundary="===============6269252260810087709=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============6269252260810087709==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Ro94xiBz0rUYauQ"
Content-Disposition: inline


--/Ro94xiBz0rUYauQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

For airoha bits:

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/pinctrl/berlin/berlin.c                    | 2 +-
>  drivers/pinctrl/cirrus/pinctrl-cs42l43.c           | 2 +-
>  drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2 +-
>  drivers/pinctrl/pinctrl-artpec6.c                  | 2 +-
>  drivers/pinctrl/pinctrl-bm1880.c                   | 2 +-
>  drivers/pinctrl/pinctrl-k210.c                     | 2 +-
>  drivers/pinctrl/pinctrl-lpc18xx.c                  | 2 +-
>  drivers/pinctrl/pinctrl-mlxbf3.c                   | 2 +-
>  drivers/pinctrl/pinctrl-tb10x.c                    | 2 +-
>  drivers/pinctrl/pinctrl-zynq.c                     | 2 +-
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 2 +-
>  11 files changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/ber=
lin.c
> index c372a2a24be4bb80b1f2475ef8512171c8e1326f..e5a35b803ce66d247c5e5ad78=
e6677570a1add60 100644
> --- a/drivers/pinctrl/berlin/berlin.c
> +++ b/drivers/pinctrl/berlin/berlin.c
> @@ -283,7 +283,7 @@ static int berlin_pinctrl_build_state(struct platform=
_device *pdev)
>  	return 0;
>  }
> =20
> -static struct pinctrl_desc berlin_pctrl_desc =3D {
> +static const struct pinctrl_desc berlin_pctrl_desc =3D {
>  	.name		=3D "berlin-pinctrl",
>  	.pctlops	=3D &berlin_pinctrl_ops,
>  	.pmxops		=3D &berlin_pinmux_ops,
> diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/c=
irrus/pinctrl-cs42l43.c
> index 628b60ccc2b07dc77e36da8919436fa348749e0c..a90beb986f5bb707c54552e13=
33802943a4b04bc 100644
> --- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> +++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> @@ -448,7 +448,7 @@ static const struct pinconf_ops cs42l43_pin_conf_ops =
=3D {
>  	.pin_config_group_set	=3D cs42l43_pin_config_group_set,
>  };
> =20
> -static struct pinctrl_desc cs42l43_pin_desc =3D {
> +static const struct pinctrl_desc cs42l43_pin_desc =3D {
>  	.name		=3D "cs42l43-pinctrl",
>  	.owner		=3D THIS_MODULE,
> =20
> diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/=
mediatek/pinctrl-airoha.c
> index b97b28ebb37a6ec092360f8ea404dd67e6c43eac..ccd2b512e8365b3a5af0bb223=
329f39119bc7078 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> @@ -2852,7 +2852,7 @@ static const struct pinctrl_ops airoha_pctlops =3D {
>  	.dt_free_map =3D pinconf_generic_dt_free_map,
>  };
> =20
> -static struct pinctrl_desc airoha_pinctrl_desc =3D {
> +static const struct pinctrl_desc airoha_pinctrl_desc =3D {
>  	.name =3D KBUILD_MODNAME,
>  	.owner =3D THIS_MODULE,
>  	.pctlops =3D &airoha_pctlops,
> diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-=
artpec6.c
> index 717f9592b28b51737e67aafc93664b1345511908..af67057128ff1e9e766b958fe=
ce9c71518c89081 100644
> --- a/drivers/pinctrl/pinctrl-artpec6.c
> +++ b/drivers/pinctrl/pinctrl-artpec6.c
> @@ -907,7 +907,7 @@ static const struct pinconf_ops artpec6_pconf_ops =3D=
 {
>  	.pin_config_group_set	=3D artpec6_pconf_group_set,
>  };
> =20
> -static struct pinctrl_desc artpec6_desc =3D {
> +static const struct pinctrl_desc artpec6_desc =3D {
>  	.name	 =3D "artpec6-pinctrl",
>  	.owner	 =3D THIS_MODULE,
>  	.pins	 =3D artpec6_pins,
> diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-b=
m1880.c
> index b0000fe5b31dfbcd6af6eaf0c01029f00cbd205b..387798fb09be51cabd5cb76e0=
d90a28b1d363050 100644
> --- a/drivers/pinctrl/pinctrl-bm1880.c
> +++ b/drivers/pinctrl/pinctrl-bm1880.c
> @@ -1298,7 +1298,7 @@ static const struct pinmux_ops bm1880_pinmux_ops =
=3D {
>  	.set_mux =3D bm1880_pinmux_set_mux,
>  };
> =20
> -static struct pinctrl_desc bm1880_desc =3D {
> +static const struct pinctrl_desc bm1880_desc =3D {
>  	.name =3D "bm1880_pinctrl",
>  	.pins =3D bm1880_pins,
>  	.npins =3D ARRAY_SIZE(bm1880_pins),
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k21=
0.c
> index eddb01796a83eb86c8c5bcf6788c999e8bf2926a..66c04120c29deccf53b21cbf8=
705f1d10c74ace5 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -879,7 +879,7 @@ static const struct pinctrl_ops k210_pinctrl_ops =3D {
>  	.dt_free_map =3D pinconf_generic_dt_free_map,
>  };
> =20
> -static struct pinctrl_desc k210_pinctrl_desc =3D {
> +static const struct pinctrl_desc k210_pinctrl_desc =3D {
>  	.name =3D "k210-pinctrl",
>  	.pins =3D k210_pins,
>  	.npins =3D K210_NPINS,
> diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-=
lpc18xx.c
> index 0f5a7bed2f81b731714e3b65908df23f2ffdfd63..5e0201768323521754e7ecd27=
e878a81925c18a6 100644
> --- a/drivers/pinctrl/pinctrl-lpc18xx.c
> +++ b/drivers/pinctrl/pinctrl-lpc18xx.c
> @@ -1257,7 +1257,7 @@ static const struct pinctrl_ops lpc18xx_pctl_ops =
=3D {
>  	.dt_free_map		=3D pinctrl_utils_free_map,
>  };
> =20
> -static struct pinctrl_desc lpc18xx_scu_desc =3D {
> +static const struct pinctrl_desc lpc18xx_scu_desc =3D {
>  	.name =3D "lpc18xx/43xx-scu",
>  	.pins =3D lpc18xx_pins,
>  	.npins =3D ARRAY_SIZE(lpc18xx_pins),
> diff --git a/drivers/pinctrl/pinctrl-mlxbf3.c b/drivers/pinctrl/pinctrl-m=
lxbf3.c
> index ffb5dda364dc81808cfd5a168ce3f1e9f119357d..fcd9d46de89fb3e5215784109=
ba31b171fd15448 100644
> --- a/drivers/pinctrl/pinctrl-mlxbf3.c
> +++ b/drivers/pinctrl/pinctrl-mlxbf3.c
> @@ -231,7 +231,7 @@ static const struct pinmux_ops mlxbf3_pmx_ops =3D {
>  	.gpio_request_enable =3D mlxbf3_gpio_request_enable,
>  };
> =20
> -static struct pinctrl_desc mlxbf3_pin_desc =3D {
> +static const struct pinctrl_desc mlxbf3_pin_desc =3D {
>  	.name =3D "pinctrl-mlxbf3",
>  	.pins =3D mlxbf3_pins,
>  	.npins =3D ARRAY_SIZE(mlxbf3_pins),
> diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb=
10x.c
> index d6bb8f58978df1577db24f96c2174f47962b5520..2d2e9f697ff99b4209dda8d55=
11f478a18b26a21 100644
> --- a/drivers/pinctrl/pinctrl-tb10x.c
> +++ b/drivers/pinctrl/pinctrl-tb10x.c
> @@ -735,7 +735,7 @@ static const struct pinmux_ops tb10x_pinmux_ops =3D {
>  	.set_mux =3D tb10x_pctl_set_mux,
>  };
> =20
> -static struct pinctrl_desc tb10x_pindesc =3D {
> +static const struct pinctrl_desc tb10x_pindesc =3D {
>  	.name =3D "TB10x",
>  	.pins =3D tb10x_pins,
>  	.npins =3D ARRAY_SIZE(tb10x_pins),
> diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zyn=
q.c
> index caa8a2ca3e681718fe213921deca8d130371b122..dcde86fed10db3e2dfebc19cb=
841ea7f63e74989 100644
> --- a/drivers/pinctrl/pinctrl-zynq.c
> +++ b/drivers/pinctrl/pinctrl-zynq.c
> @@ -1143,7 +1143,7 @@ static const struct pinconf_ops zynq_pinconf_ops =
=3D {
>  	.pin_config_group_set =3D zynq_pinconf_group_set,
>  };
> =20
> -static struct pinctrl_desc zynq_desc =3D {
> +static const struct pinctrl_desc zynq_desc =3D {
>  	.name =3D "zynq_pinctrl",
>  	.pins =3D zynq_pins,
>  	.npins =3D ARRAY_SIZE(zynq_pins),
> diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers=
/pinctrl/starfive/pinctrl-starfive-jh7100.c
> index 27f99183d994dccb92aac81ca42228bdb9225e87..aeaa0ded7c1e5ee7f9c5e4113=
bfd208fb844ba7d 100644
> --- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> +++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
> @@ -898,7 +898,7 @@ static const struct pinconf_ops starfive_pinconf_ops =
=3D {
>  	.is_generic =3D true,
>  };
> =20
> -static struct pinctrl_desc starfive_desc =3D {
> +static const struct pinctrl_desc starfive_desc =3D {
>  	.name =3D DRIVER_NAME,
>  	.pins =3D starfive_pins,
>  	.npins =3D ARRAY_SIZE(starfive_pins),
>=20
> --=20
> 2.45.2
>=20

--/Ro94xiBz0rUYauQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaDcG5wAKCRA6cBh0uS2t
rABgAQDChqlOupLj8dMgBJtw+ZYSz23faF0MajHN6Bznec2ZxQD/b4iuNIDVxDRu
w5SyOOU+1pIOKkH9BqiTR31e740csQc=
=S7ff
-----END PGP SIGNATURE-----

--/Ro94xiBz0rUYauQ--

--===============6269252260810087709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6269252260810087709==--
