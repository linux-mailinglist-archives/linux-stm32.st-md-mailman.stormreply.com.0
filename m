Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D06938B0309
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Apr 2024 09:21:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8459DC6DD6D;
	Wed, 24 Apr 2024 07:21:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD956C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 07:21:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 98DF061890;
 Wed, 24 Apr 2024 07:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B32EC113CE;
 Wed, 24 Apr 2024 07:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713943280;
 bh=gejzVuWBbs/WERJ9LaTFGpunGqbTm4721u2pjEmC5BU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gKTHYL64JeM+ohgmxJAKPd2RuwHo3HmQplRv1+DpcgSWHMoiUiOsftam/VHAIIIkJ
 G38mdmJFVDjIIdXL3mtsrFLetGYqsFcbCWSTJS3mEI20HJRlGkDIc9WKcTk2gmcOyW
 zks617G6u9CE/v6dwUq6DSTMfkb782ZgDhcVZPgR00b5yOMCs4Dbry0C5zLwjGVl+A
 odlPGnfynIi93X34NgtJNYd8OYF1FGQ13zG/o8LuFVSh3mDdVHmRh8nPqYMrOSdaXK
 n/cpKRz9K+39tqwO1nq8t+3QYMxNlA2jcy32rRfjllGuWp7J8n6LLrsckq7y/iQxmG
 f38oAyu+xW1qg==
Date: Wed, 24 Apr 2024 09:21:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <20240424-famous-fascinating-hyena-8fb3a7@houat>
References: <20240322104732.2327060-1-sean@geanix.com>
MIME-Version: 1.0
In-Reply-To: <20240322104732.2327060-1-sean@geanix.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: dsi: relax mode_valid clock
	tolerance
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
Content-Type: multipart/mixed; boundary="===============3364560120020418878=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3364560120020418878==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="v3qz7kftr5irttdu"
Content-Disposition: inline


--v3qz7kftr5irttdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry, my previous review didn't go through.

On Fri, Mar 22, 2024 at 11:47:31AM +0100, Sean Nyekjaer wrote:
> When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh
> to reguire the requested and the actual px clock to be within
> 50Hz. A typical LVDS display requires the px clock to be within +-10%.
>=20
> In case for HDMI .5% tolerance is required.
>=20
> Fixes: e01356d18273 ("drm/stm: dsi: provide the implementation of mode_va=
lid()")
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/=
dw_mipi_dsi-stm.c
> index d5f8c923d7bc..97936b0ef702 100644
> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> @@ -322,8 +322,6 @@ dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned =
int lane_mbps,
>  	return 0;
>  }
> =20
> -#define CLK_TOLERANCE_HZ 50
> -
>  static enum drm_mode_status
>  dw_mipi_dsi_stm_mode_valid(void *priv_data,
>  			   const struct drm_display_mode *mode,
> @@ -375,9 +373,10 @@ dw_mipi_dsi_stm_mode_valid(void *priv_data,
>  		/*
>  		 * Filter modes according to the clock value, particularly useful for
>  		 * hdmi modes that require precise pixel clocks.
> +		 * Check that px_clock is within .5% tolerance.
>  		 */
> -		if (px_clock_hz < target_px_clock_hz - CLK_TOLERANCE_HZ ||
> -		    px_clock_hz > target_px_clock_hz + CLK_TOLERANCE_HZ)
> +		if (px_clock_hz < mult_frac(target_px_clock_hz, 995, 1000) ||
> +		    px_clock_hz > mult_frac(target_px_clock_hz, 1005, 1000))
>  			return MODE_CLOCK_RANGE;

I wonder if it's not something that should be made into a helper. We
have a couple of drivers doing it already, so it might be worth creating
a function that checks for a given struct clk pointer and pixel clock if
it's within parameters.

Maxime

--v3qz7kftr5irttdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZiiy6AAKCRAnX84Zoj2+
dhSPAX4unsLgg7n5/O2rJ1Xlrd/571ia5c4LJJUra+mfWA8IhYeQMu4sWwT4uRjd
Dgb0KZUBgLBnBIhAxuWQ3eNhMQrD/r7T0Mjb7b77bERge1rc14SEDTgD9BpPn8mG
jmgHEANigw==
=h0FU
-----END PGP SIGNATURE-----

--v3qz7kftr5irttdu--

--===============3364560120020418878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3364560120020418878==--
