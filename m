Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A0632B5CD
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 08:46:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73887C57B70;
	Wed,  3 Mar 2021 07:46:14 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D57F8C56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 07:46:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5ABFEAE85;
 Wed,  3 Mar 2021 07:46:12 +0000 (UTC)
To: Jagan Teki <jagan@amarulasolutions.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>
References: <20210302175700.28640-1-jagan@amarulasolutions.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f3b319f3-a590-59d9-34e6-ea9585e4b987@suse.de>
Date: Wed, 3 Mar 2021 08:46:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210302175700.28640-1-jagan@amarulasolutions.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amarula@amarulasolutions.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: Use simple encoder
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
Content-Type: multipart/mixed; boundary="===============9183757678982990467=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============9183757678982990467==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bl6v7NspN0i9e20DD9xHGMKbj2G05wY3M"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bl6v7NspN0i9e20DD9xHGMKbj2G05wY3M
Content-Type: multipart/mixed; boundary="9TvzBKred9dq2nu7AoCV2JSXFpzq1yehy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Message-ID: <f3b319f3-a590-59d9-34e6-ea9585e4b987@suse.de>
Subject: Re: [PATCH] drm/stm: ltdc: Use simple encoder
References: <20210302175700.28640-1-jagan@amarulasolutions.com>
In-Reply-To: <20210302175700.28640-1-jagan@amarulasolutions.com>

--9TvzBKred9dq2nu7AoCV2JSXFpzq1yehy
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 02.03.21 um 18:57 schrieb Jagan Teki:
> STM ltdc driver uses an empty implementation for its encoder.
> Replace the code with the generic simple encoder.
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/stm/ltdc.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 7812094f93d6..aeeb43524ca0 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -31,6 +31,7 @@
>   #include <drm/drm_of.h>
>   #include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>   #include <drm/drm_vblank.h>
>  =20
>   #include <video/videomode.h>
> @@ -1020,14 +1021,6 @@ static int ltdc_crtc_init(struct drm_device *dde=
v, struct drm_crtc *crtc)
>   	return ret;
>   }
>  =20
> -/*
> - * DRM_ENCODER
> - */
> -
> -static const struct drm_encoder_funcs ltdc_encoder_funcs =3D {
> -	.destroy =3D drm_encoder_cleanup,
> -};
> -
>   static void ltdc_encoder_disable(struct drm_encoder *encoder)
>   {
>   	struct drm_device *ddev =3D encoder->dev;
> @@ -1088,8 +1081,7 @@ static int ltdc_encoder_init(struct drm_device *d=
dev, struct drm_bridge *bridge)
>   	encoder->possible_crtcs =3D CRTC_MASK;
>   	encoder->possible_clones =3D 0;	/* No cloning support */
>  =20
> -	drm_encoder_init(ddev, encoder, &ltdc_encoder_funcs,
> -			 DRM_MODE_ENCODER_DPI, NULL);
> +	drm_simple_encoder_init(ddev, encoder, DRM_MODE_ENCODER_DPI);
>  =20
>   	drm_encoder_helper_add(encoder, &ltdc_encoder_helper_funcs);
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--9TvzBKred9dq2nu7AoCV2JSXFpzq1yehy--

--bl6v7NspN0i9e20DD9xHGMKbj2G05wY3M
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmA/PsMFAwAAAAAACgkQlh/E3EQov+Dr
UBAAuXXQEQ3csuHxGxgGgnNutgeRgkO2kZGVoMKdxgPNNBAaimSJkdJsITzIOJrXogBcTjal0j0t
cdYJUmcCp1Gx5eSF40LqYioc5kyCSRCiNZt4TZtm7IGjv9IyOPrIUXAXNAuvzSlIFJkqmv/HN1ji
6f5RH2HrN8JDSROD8ps4F7Y4JRfyItQ2uTMcgfkExn3jwEsprPFnSmJ34AadEVvxDB3l7xK04J+O
ooCQak7yvK6rmUvV+AwcDzh83wLVRdyMT40vGJEx40w2BBbdqCy+KvnnciA3RH1RfbmWwihf0EXb
W32BPvD49/0NcscEdigpBIul8vkPFSdv2rxU4SfZAawGpmTlp/0eJehnf10QwxPuBtY/OMaiXhjR
eXmP3I73XHjWfsC8cFX8ILJ5ctOLNczjvOwDf3+01G17i9cPCE6yoY1lmwdc4lSQdMO+xN5YFUNr
UChIgbDbnfZx/6WauXfIZmRwtlx5l1bv6bLz913QL4FxtEMra3bt4A71mV3l00rZ6JU+AjFfwcaB
S/vLAlhVP4Nk6e4YWT1KZNfdAN642+HYFiAs0CYTT49q0f0W5h45Wh10WZnXmtnCJsFCIOyGcaP9
r2Bfydaol9+YB7+N+WMh4HQhXPqdx2TDOxuHIzOoD64dTWo77IPKUR2KHmUq8N1Sa4ha0YitXq7c
F94=
=9Vnb
-----END PGP SIGNATURE-----

--bl6v7NspN0i9e20DD9xHGMKbj2G05wY3M--

--===============9183757678982990467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============9183757678982990467==--
