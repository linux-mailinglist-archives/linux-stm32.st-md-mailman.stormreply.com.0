Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF979B01403
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 09:05:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A41C2C32EBF;
	Fri, 11 Jul 2025 07:05:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2BFEC32EB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 07:05:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A98095C0C8A;
 Fri, 11 Jul 2025 07:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D676DC4CEED;
 Fri, 11 Jul 2025 07:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752217527;
 bh=Tm8gBt2rCLU6XAuJPmoqrUODd/ncKUQlIgBb8XS0mrM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NPudT0N+mxlarrk3a+ZdBPT0+i6l+ahSnKq8zT6TATF9ipiN09TgKZFu2CSWSVhGe
 Bu04DDZ1P6cZcV2fceK1CEKTt6UciKAtYRWlHk1h0HbZK9DUjjnZYrgCKX42YBE0fi
 8QWkYWV+CENcSRehs0EIQ6oOEM/fAxWkLaTkzS/RUf0JRFPO2Fd5NTS+wvuPaeOP/z
 ZdcuuHCdsYq95WYpI1SX1qlYkmIKTbFgKiYq7o6JJQVCrd93+rUvFmxcns2LylWjIM
 kFvdR8zWqLae7Kp5ubDC5r80MoDWjnFi2DJ3pqDClBk1E7U0soVVMmo1TZSzh9VqI3
 yGoPqB1xN9vdQ==
Date: Fri, 11 Jul 2025 09:05:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Message-ID: <20250711-adorable-winged-petrel-3a55df@houat>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-9-601b9ea384c3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250710-drm-clk-round-rate-v1-9-601b9ea384c3@redhat.com>
Cc: imx@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, freedreno@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 9/9] drm/sun4i/sun4i_tcon_dclk: convert
 from round_rate() to determine_rate()
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
Content-Type: multipart/mixed; boundary="===============2617135384329014280=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============2617135384329014280==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="zivgql4bvkmipb2l"
Content-Disposition: inline


--zivgql4bvkmipb2l
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 9/9] drm/sun4i/sun4i_tcon_dclk: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0

On Thu, Jul 10, 2025 at 01:43:10PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c b/drivers/gpu/drm/su=
n4i/sun4i_tcon_dclk.c
> index 03d7de1911cd654f395ea85ad914588c4351f391..9b85bf512d4c81d0a12e8cf72=
6d5d5440343519c 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
> @@ -67,8 +67,8 @@ static unsigned long sun4i_dclk_recalc_rate(struct clk_=
hw *hw,
>  	return parent_rate / val;
>  }
> =20
> -static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
> -				  unsigned long *parent_rate)
> +static int sun4i_dclk_determine_rate(struct clk_hw *hw,
> +				     struct clk_rate_request *req)
>  {
>  	struct sun4i_dclk *dclk =3D hw_to_dclk(hw);
>  	struct sun4i_tcon *tcon =3D dclk->tcon;
> @@ -77,7 +77,7 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, un=
signed long rate,
>  	int i;
> =20
>  	for (i =3D tcon->dclk_min_div; i <=3D tcon->dclk_max_div; i++) {
> -		u64 ideal =3D (u64)rate * i;
> +		u64 ideal =3D (u64) req->rate * i;

There shouldn't be any space after the cast.

Once fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--zivgql4bvkmipb2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaHC3tAAKCRAnX84Zoj2+
dobzAYCVVcAYpql/C3KJ0/eU3AQjFHauPT2cGsLWyUy+n9tXNFVQlKPXp/mq6Oxv
JCN1APUBfj/Ztn6ba5LNjzk128VAzJlXRG36IVPExTtZksSGPtrh4+2d1RJgpCFc
s5a30/t7DA==
=Ftr2
-----END PGP SIGNATURE-----

--zivgql4bvkmipb2l--

--===============2617135384329014280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2617135384329014280==--
