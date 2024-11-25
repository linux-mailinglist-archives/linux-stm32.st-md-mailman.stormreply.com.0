Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E754B9D9359
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 09:34:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FF98C78023;
	Tue, 26 Nov 2024 08:34:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D45D4C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2024 16:01:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F0D335C59CB;
 Mon, 25 Nov 2024 16:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3F0C4CECE;
 Mon, 25 Nov 2024 16:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732550459;
 bh=e8G0lW8ogmFnCkbf2xG8A2bDIU0/6g5brVU3VCxn4pI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BTXAXBwjhY/HJi/6PiReBk/XD60n4+dRiLQDWeRuAyfeiuKnNmqheHpR0ZSmbzgZ7
 YxKNbpxOYg9NSgQF7keI83FZKEzB2vI5gJ1TQKHU3TI7Yjh7otMEEFLAOGf7KjBFv3
 /TB4P+rbIPEoDj/F/E9FH2/SFgWnIolBMdF6kCyl5S7eKQ3499lALGhJAqIbp3K+PX
 7idtOc4jU0njV8sdmH+10anm/HP18wjyhafgbp1Pg5IfoaIeFfDDN7fYhdUbuRuRV7
 gmQXVBNZwc7DHgPtrBVs2esgTF4A+4zaaJZ+2gRgKTHlbXQCc59U/8MXdJNmxuGvVT
 PXfMDBruc0IXQ==
Date: Mon, 25 Nov 2024 17:00:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
MIME-Version: 1.0
In-Reply-To: <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:34:44 +0000
Cc: Simona Vetter <simona@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dri-devel@lists.freedesktop.org,
 Samuel Holland <samuel@sholland.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] drm/modes: introduce
 drm_mode_validate_mode() helper function
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
Content-Type: multipart/mixed; boundary="===============4903496336603036063=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============4903496336603036063==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7iaeslrnyclrukm7"
Content-Disposition: inline


--7iaeslrnyclrukm7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
MIME-Version: 1.0

Hi Sean,

On Mon, Nov 25, 2024 at 02:49:26PM +0100, Sean Nyekjaer wrote:
> Check if the required pixel clock is in within .5% range of the
> desired pixel clock.
> This will match the requirement for HDMI where a .5% tolerance is allowed.
>=20
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  drivers/gpu/drm/drm_modes.c | 34 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_modes.h     |  2 ++
>  2 files changed, 36 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf80502efde6e4=
d977b297f5d5359 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(const stru=
ct drm_display_mode *mode1,
>  }
>  EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
> =20
> +/**
> + * drm_mode_validate_mode
> + * @mode: mode to check
> + * @rounded_rate: output pixel clock
> + *
> + * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
> + * CVT spec reuses that tolerance in its examples, so it looks to be a
> + * good default tolerance for the EDID-based modes. Define it to 5 per
> + * mille to avoid floating point operations.
> + *
> + * Returns:
> + * The mode status
> + */
> +enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mod=
e *mode,
> +					    unsigned long long rounded_rate)
> +{
> +	enum drm_mode_status status;
> +	unsigned long long rate =3D mode->clock * 1000;
> +	unsigned long long lowest, highest;
> +
> +	lowest =3D rate * (1000 - 5);
> +	do_div(lowest, 1000);
> +	if (rounded_rate < lowest)
> +		return MODE_CLOCK_LOW;
> +
> +	highest =3D rate * (1000 + 5);
> +	do_div(highest, 1000);
> +	if (rounded_rate > highest)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +EXPORT_SYMBOL(drm_mode_validate_mode);

Thanks a lot for doing that!

I wonder about the naming though (and prototype). I doesn't really
validates a mode, but rather makes sure that a given rate is a good
approximation of a pixel clock. So maybe something like
drm_mode_check_pixel_clock?

We probably need some kunit tests here too.

Maxime

--7iaeslrnyclrukm7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0SfMwAKCRAnX84Zoj2+
dp/LAX9KInEW+AE031WPvNsZu9uS0+xLFqEfIThuSCuXbnCM2H3Nz9ARAE+st+tg
1gd7pvABgIRkWDpLPaiGD3xvUJX3GM3Ebv50pWcCZHCWEhySv4P6zkew6y8w3RWs
hqB4Vy/oAA==
=kJ1A
-----END PGP SIGNATURE-----

--7iaeslrnyclrukm7--

--===============4903496336603036063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4903496336603036063==--
