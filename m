Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 349099E03A9
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Dec 2024 14:37:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A002DC78002;
	Mon,  2 Dec 2024 13:37:32 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6635AC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2024 10:32:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 21149A409EA;
 Mon,  2 Dec 2024 10:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FD1C4CED1;
 Mon,  2 Dec 2024 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733135544;
 bh=YNX+vtim4wPZJIk1OfZDjYYPEiiBQR0VOr9a8vWD2QI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I63s1N3zfrfrbvkEfMtGs435oMJwprLnFVwyqZGSUHQWnx0D/JaOjCQ2O+6PPA9C9
 EwC7O5rtJBaZR4eUArUUJ/+7q1n2WALsdEnRHSGva1EHwPg7yiSmpFoYO3Ep7q43/S
 lUQBDtk2TfOpunkcn61IIS95BWSHPFP58kc8MuLbJNZYRAgmEKwpADKq16qXNLIze5
 CtluBevWFNMxVf4Hitg8FJ3kRLoWWrRY5L5fXdTdSu3u51+1OR1L4CxpTFWeaAiVkW
 AuRFHNnIWMVJMQpstRhHlGboHN8bBbyOJ23v/riDQPRs9jYYkeDjbHimeZy/UcUKtf
 2vaNkplqCFosQ==
Date: Mon, 2 Dec 2024 11:32:21 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <20241202-nickel-rottweiler-of-hail-c9ec8b@houat>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
 <tzcjzgp7xalhhezcv5hfa7cjscxg44phqcw2ap54lesly4gk6o@6dtco2d3jahj>
MIME-Version: 1.0
In-Reply-To: <tzcjzgp7xalhhezcv5hfa7cjscxg44phqcw2ap54lesly4gk6o@6dtco2d3jahj>
X-Mailman-Approved-At: Mon, 02 Dec 2024 13:37:31 +0000
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
Content-Type: multipart/mixed; boundary="===============0276640768848206056=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


--===============0276640768848206056==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ivbwnrarbwqca5xp"
Content-Disposition: inline


--ivbwnrarbwqca5xp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
MIME-Version: 1.0

On Tue, Nov 26, 2024 at 02:30:53PM +0100, Sean Nyekjaer wrote:
> Hi Maxime,
>=20
> On Tue, Nov 26, 2024 at 08:36:01AM +0100, Sean Nyekjaer wrote:
> > Hi Maxime,
> >=20
>=20
> [...]
>=20
> > >=20
> > > We probably need some kunit tests here too.
> >=20
> > Good idea, will be my first :)
> >=20
>=20
> Would something like this work?
>=20
> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers=
/gpu/drm/tests/drm_hdmi_state_helper_test.c
> index 294773342e71..26e4ff02df85 100644
> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
> @@ -1364,6 +1364,7 @@ static void drm_test_check_output_bpc_format_displa=
y_rgb_only(struct kunit *test
>  	struct drm_connector_state *conn_state;
>  	struct drm_display_info *info;
>  	struct drm_display_mode *preferred;
> +	enum drm_mode_status mode_status;
>  	unsigned long long rate;
>  	struct drm_connector *conn;
>  	struct drm_device *drm;
> @@ -1408,6 +1409,9 @@ static void drm_test_check_output_bpc_format_displa=
y_rgb_only(struct kunit *test
>  	rate =3D drm_hdmi_compute_mode_clock(preferred, 12, HDMI_COLORSPACE_YUV=
422);
>  	KUNIT_ASSERT_LT(test, rate, info->max_tmds_clock * 1000);
> =20
> +	mode_status =3D drm_mode_check_pixel_clock(preferred, rate);
> +	KUNIT_ASSERT_EQ(test, mode_status, MODE_OK);
> +

Not really. You need to test that function, and ideally only that
function, with a bunch of random inputs, including the error conditions.

Maxime

--ivbwnrarbwqca5xp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ02MtAAKCRAnX84Zoj2+
dsuWAX0eSysvVggNKHnyuBE+8Rz7YOBscN6mBZYUgtssEAyp5cpCoqjzQx8yMf5Z
kDz+dB8Bf2t8VtXvAAOtTW5epqM0PuPE2F67EoJN+5eQBc95ywPDx51OucBNqL3Y
Ja65ubL3mg==
=gqfV
-----END PGP SIGNATURE-----

--ivbwnrarbwqca5xp--

--===============0276640768848206056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0276640768848206056==--
