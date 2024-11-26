Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9DD9D97E8
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 14:04:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 766C2C78F6C;
	Tue, 26 Nov 2024 13:04:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A386C78016
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 12:09:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 69D415C4BBE;
 Tue, 26 Nov 2024 12:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCB1C4CECF;
 Tue, 26 Nov 2024 12:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732622953;
 bh=IVaFBfK34WQcQgwisIpVv9lgOwfqn9UOyfA72WAKaeo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HnYWEvQ/zxS4VZ3hf1sfYqZ+X1xXtSp89d5itOmnHz9g7lZNXLZwqk1LfHkCSBJty
 Ws75UYikRO+C2mvCa9fNbOLT/HMNnLGyQzIFgY+4mLcjifHclxhFaLKjskt1jINajs
 zytQRdsmjTLrgNaUKmja2yDF4Y2VCaHCYjMcPWXTYKxFIiPzW9RSonub3z6dI0nqF1
 GfJe8zpsu8ptK5Kgf6aVWpu689PTz3yx5f/d9vC6S/2ymFN+d6hJEyfqk9/FvHAF6D
 J/uz1w0PWLTjbrQnN80zNwy8eDZdCcIb2rtJQ01c/b/zzUTqcIC6QTIlR2msQK7vN1
 KL/Re40ursfoA==
Date: Tue, 26 Nov 2024 13:09:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <20241126-observant-coyote-of-glee-3b94dd@houat>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
 <20241126-refreshing-slick-pig-baebab@houat>
 <zmrcuqiyz5gojhusysy7cytluedslqmfgzuslutqeg65iv7ju6@bggk7qbm6eas>
MIME-Version: 1.0
In-Reply-To: <zmrcuqiyz5gojhusysy7cytluedslqmfgzuslutqeg65iv7ju6@bggk7qbm6eas>
X-Mailman-Approved-At: Tue, 26 Nov 2024 13:04:30 +0000
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
Content-Type: multipart/mixed; boundary="===============3406201101152415623=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============3406201101152415623==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="bl5qc3dhl5qjushr"
Content-Disposition: inline


--bl5qc3dhl5qjushr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
MIME-Version: 1.0

On Tue, Nov 26, 2024 at 12:34:26PM +0100, Sean Nyekjaer wrote:
> Hi,
>=20
> On Tue, Nov 26, 2024 at 09:38:55AM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Tue, Nov 26, 2024 at 08:36:00AM +0100, Sean Nyekjaer wrote:
> > > On Mon, Nov 25, 2024 at 05:00:56PM +0100, Maxime Ripard wrote:
> > > > On Mon, Nov 25, 2024 at 02:49:26PM +0100, Sean Nyekjaer wrote:
> > > > > Check if the required pixel clock is in within .5% range of the
> > > > > desired pixel clock.
> > > > > This will match the requirement for HDMI where a .5% tolerance is=
 allowed.
> > > > >=20
> > > > > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_modes.c | 34 +++++++++++++++++++++++++++++++=
+++
> > > > >  include/drm/drm_modes.h     |  2 ++
> > > > >  2 files changed, 36 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_mo=
des.c
> > > > > index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf8050=
2efde6e4d977b297f5d5359 100644
> > > > > --- a/drivers/gpu/drm/drm_modes.c
> > > > > +++ b/drivers/gpu/drm/drm_modes.c
> > > > > @@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(co=
nst struct drm_display_mode *mode1,
> > > > >  }
> > > > >  EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
> > > > > =20
> > > > > +/**
> > > > > + * drm_mode_validate_mode
> > > > > + * @mode: mode to check
> > > > > + * @rounded_rate: output pixel clock
> > > > > + *
> > > > > + * VESA DMT defines a tolerance of 0.5% on the pixel clock, whil=
e the
> > > > > + * CVT spec reuses that tolerance in its examples, so it looks t=
o be a
> > > > > + * good default tolerance for the EDID-based modes. Define it to=
 5 per
> > > > > + * mille to avoid floating point operations.
> > > > > + *
> > > > > + * Returns:
> > > > > + * The mode status
> > > > > + */
> > > > > +enum drm_mode_status drm_mode_validate_mode(const struct drm_dis=
play_mode *mode,
> > > > > +					    unsigned long long rounded_rate)
> > > > > +{
> > > > > +	enum drm_mode_status status;
> > > > > +	unsigned long long rate =3D mode->clock * 1000;
> > > > > +	unsigned long long lowest, highest;
> > > > > +
> > > > > +	lowest =3D rate * (1000 - 5);
> > > > > +	do_div(lowest, 1000);
> > > > > +	if (rounded_rate < lowest)
> > > > > +		return MODE_CLOCK_LOW;
> > > > > +
> > > > > +	highest =3D rate * (1000 + 5);
> > > > > +	do_div(highest, 1000);
> > > > > +	if (rounded_rate > highest)
> > > > > +		return MODE_CLOCK_HIGH;
> > > > > +
> > > > > +	return MODE_OK;
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_mode_validate_mode);
> > > >=20
> > > > Thanks a lot for doing that!
> > > >=20
> > > > I wonder about the naming though (and prototype). I doesn't really
> > > > validates a mode, but rather makes sure that a given rate is a good
> > > > approximation of a pixel clock. So maybe something like
> > > > drm_mode_check_pixel_clock?
> > >=20
> > > Naming is hard :) I will use drm_mode_check_pixel_clock() for V2.
> > >=20
> > > Would it make sense to have the pixel clock requirement as a input
> > > parameter? For HDMI it is 0.5%
> >=20
> > This code was only used for panels so far. It reuses the same tolerance
> > than HDMI because we couldn't come up with anything better, but it
> > should totally apply to other things.
> >=20
> > > and in my case the LVDS panel 10%.
> >=20
> > 10% is a lot, and I'm not sure we'll want that. The framerate being
> > anywhere between 54 and 66 fps will trip a lot of applications too.
> >=20
> > Why do you need such a big tolerance?
>=20
> I don't need it, it was just from the datasheet for the LVDS panel :)

So you mean the panel accepts a pixel clock within +/- 10%?

That makes sense, but then we should also adjust the mode timings to
match so we still keep 60fps. There's much more to *that* than the
helpers you try to create though, so let's keep it aside for now.

Maxime

--bl5qc3dhl5qjushr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0W6YgAKCRAnX84Zoj2+
dpXoAYDLeWf70DH69fTHnomK56MfWzFnjFgfHOL2JNGDwN+jsyWwtUS3WtdF0/y2
pknqMxEBf1IBZxjfPUpqweJ/9xN8AsRg6qI+Acufa59QvrHl6wNmv7SdrD5RsgUt
B1PT5dMtYQ==
=sTTD
-----END PGP SIGNATURE-----

--bl5qc3dhl5qjushr--

--===============3406201101152415623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3406201101152415623==--
