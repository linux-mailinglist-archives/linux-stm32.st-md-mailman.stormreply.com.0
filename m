Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC269E012D
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Dec 2024 13:01:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6D2AC6DD9E;
	Mon,  2 Dec 2024 12:01:20 +0000 (UTC)
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC56AC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2024 12:01:12 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 18A7A1C00A0; Mon,  2 Dec 2024 13:01:12 +0100 (CET)
Date: Mon, 2 Dec 2024 13:01:11 +0100
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <Z02hh/K7okT4fvOc@duo.ucw.cz>
References: <20241112103803.1654174-1-sashal@kernel.org>
 <20241112103803.1654174-4-sashal@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241112103803.1654174-4-sashal@kernel.org>
Cc: Luo Yifan <luoyifan@cmss.chinamobile.com>, alsa-devel@alsa-project.org,
 mcoquelin.stm32@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH AUTOSEL 5.10 4/6] ASoC: stm: Prevent
 potential division by zero in stm32_sai_mclk_round_rate()
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
Content-Type: multipart/mixed; boundary="===============8828523062886757704=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8828523062886757704==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3fawmNHJI3c1oRFq"
Content-Disposition: inline


--3fawmNHJI3c1oRFq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [ Upstream commit 63c1c87993e0e5bb11bced3d8224446a2bc62338 ]
>=20
> This patch checks if div is less than or equal to zero (div <=3D 0). If
> div is zero or negative, the function returns -EINVAL, ensuring the
> division operation (*prate / div) is safe to perform.

Well, previous version propagated error code, now it is eaten. Is
stm32_sai_get_clk_div returning 0?

BR,
								Pavel

> Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
> Link: https://patch.msgid.link/20241106014654.206860-1-luoyifan@cmss.chin=
amobile.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  sound/soc/stm/stm32_sai_sub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
> index 3aa1cf2624020..3a7f0102b4c5c 100644
> --- a/sound/soc/stm/stm32_sai_sub.c
> +++ b/sound/soc/stm/stm32_sai_sub.c
> @@ -380,8 +380,8 @@ static long stm32_sai_mclk_round_rate(struct clk_hw *=
hw, unsigned long rate,
>  	int div;
> =20
>  	div =3D stm32_sai_get_clk_div(sai, *prate, rate);
> -	if (div < 0)
> -		return div;
> +	if (div <=3D 0)
> +		return -EINVAL;
> =20
>  	mclk->freq =3D *prate / div;
> =20

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--3fawmNHJI3c1oRFq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZ02hhwAKCRAw5/Bqldv6
8hAkAKC0b/Oh8ldKHa90Tlm10HU7ITeWowCgxMxATUX7/rKamYpZAx5Mk1HHjC8=
=I7ba
-----END PGP SIGNATURE-----

--3fawmNHJI3c1oRFq--

--===============8828523062886757704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8828523062886757704==--
