Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F139D94F1
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 10:56:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B43BC78023;
	Tue, 26 Nov 2024 09:56:29 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C112C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 09:30:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D80E5C5D16;
 Tue, 26 Nov 2024 09:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0A3C4CECF;
 Tue, 26 Nov 2024 09:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732613410;
 bh=9Ay6+imSrXagOd8Xd0hPE8chBJ5GelgKMPvVGoiR2e8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WQdq2LZE9YTWOxAyv7FnmGEL6ltFHnouW2WMUelybvVewvAWZm15QH/lf4XnmpQIj
 rlQos5T4MqJKm0b4DQ+XG/dwzrlSHYISKPwh1eT8EYKMDTbHpep6jNgk2xbMKdFDiJ
 hn4GR7SeIgMtyW1i5NZi60c+PAJdj3CDW3nvknu4LQcgmMSBr9kw1YUcB0r0hL6u0b
 AfWWeTAU1kj3t137X4AI3F7clejrXfnU7TD+LNP9Sb/TNVQXlciE6FtXt9h8HzQmly
 XJFQtHV2onhmWl+5d/rCLPRImcGfpHpSC1OHCVSX9Yh2hwq7dtq9rUmpxlO9EKusN2
 dq3Ud11z9oHyg==
Date: Tue, 26 Nov 2024 10:30:07 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20241126-silver-skylark-of-expertise-bba576@houat>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
 <725aafb8-abfa-40c0-967a-62122206f736@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <725aafb8-abfa-40c0-967a-62122206f736@foss.st.com>
X-Mailman-Approved-At: Tue, 26 Nov 2024 09:56:28 +0000
Cc: Simona Vetter <simona@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dri-devel@lists.freedesktop.org,
 Samuel Holland <samuel@sholland.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Nyekjaer <sean@geanix.com>,
 David Airlie <airlied@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: multipart/mixed; boundary="===============8551226995088981856=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============8551226995088981856==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ivjgiyez6uyhrxcb"
Content-Disposition: inline


--ivjgiyez6uyhrxcb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
MIME-Version: 1.0

On Tue, Nov 26, 2024 at 09:47:17AM +0100, Raphael Gallais-Pou wrote:
>=20
> On 11/26/24 08:36, Sean Nyekjaer wrote:
> > Hi Maxime,
> >
> > On Mon, Nov 25, 2024 at 05:00:56PM +0100, Maxime Ripard wrote:
> >> Hi Sean,
> >>
> >> On Mon, Nov 25, 2024 at 02:49:26PM +0100, Sean Nyekjaer wrote:
> >>> Check if the required pixel clock is in within .5% range of the
> >>> desired pixel clock.
> >>> This will match the requirement for HDMI where a .5% tolerance is all=
owed.
> >>>
> >>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> >>> ---
> >>>  drivers/gpu/drm/drm_modes.c | 34 ++++++++++++++++++++++++++++++++++
> >>>  include/drm/drm_modes.h     |  2 ++
> >>>  2 files changed, 36 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> >>> index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf80502efd=
e6e4d977b297f5d5359 100644
> >>> --- a/drivers/gpu/drm/drm_modes.c
> >>> +++ b/drivers/gpu/drm/drm_modes.c
> >>> @@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(const =
struct drm_display_mode *mode1,
> >>>  }
> >>>  EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
> >>> =20
> >>> +/**
> >>> + * drm_mode_validate_mode
> >>> + * @mode: mode to check
> >>> + * @rounded_rate: output pixel clock
> >>> + *
> >>> + * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
> >>> + * CVT spec reuses that tolerance in its examples, so it looks to be=
 a
> >>> + * good default tolerance for the EDID-based modes. Define it to 5 p=
er
> >>> + * mille to avoid floating point operations.
> >>> + *
> >>> + * Returns:
> >>> + * The mode status
> >>> + */
> >>> +enum drm_mode_status drm_mode_validate_mode(const struct drm_display=
_mode *mode,
> >>> +					    unsigned long long rounded_rate)
> >>> +{
> >>> +	enum drm_mode_status status;
> >>> +	unsigned long long rate =3D mode->clock * 1000;
> >>> +	unsigned long long lowest, highest;
> >>> +
> >>> +	lowest =3D rate * (1000 - 5);
> >>> +	do_div(lowest, 1000);
> >>> +	if (rounded_rate < lowest)
> >>> +		return MODE_CLOCK_LOW;
> >>> +
> >>> +	highest =3D rate * (1000 + 5);
> >>> +	do_div(highest, 1000);
> >>> +	if (rounded_rate > highest)
> >>> +		return MODE_CLOCK_HIGH;
> >>> +
> >>> +	return MODE_OK;
> >>> +}
> >>> +EXPORT_SYMBOL(drm_mode_validate_mode);
> Hi Sean, Maxime,
> >> Thanks a lot for doing that!
> >>
> >> I wonder about the naming though (and prototype). I doesn't really
> >> validates a mode, but rather makes sure that a given rate is a good
> >> approximation of a pixel clock. So maybe something like
> >> drm_mode_check_pixel_clock?
> > Naming is hard :) I will use drm_mode_check_pixel_clock() for V2.
> >
> > Would it make sense to have the pixel clock requirement as a input
> > parameter? For HDMI it is 0.5% and in my case the LVDS panel 10%.
> >
> > enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mo=
de *mode,
> > 					    unsigned long long rounded_rate, unsigned tolerance)
> > ?
>=20
>=20
> IMO adding the tolerance as input parameter is a good idea.=A0 This
> would useful other than for HDMI pixel clock validation (and LVDS in
> your case).

It depends on the intent. If it's justified, why not. If it's to
workaround another issue, absolutely not. And so, generally speaking, I
don't think it's a good idea.

Maxime

--ivjgiyez6uyhrxcb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0WVGgAKCRAnX84Zoj2+
dt6vAYD/ha6rSzfdB8Hdtt8QyIin6959mZS2o1Kfzj2g79x6jBpKlT0JtMgi//O3
OUV40OgBfROD6tZDvz9F+STrxg9e7rBW0RrVft6ey02AdwVIWtaNpvVoJEMn/cnG
vhycHMk+wA==
=7JWg
-----END PGP SIGNATURE-----

--ivjgiyez6uyhrxcb--

--===============8551226995088981856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============8551226995088981856==--
