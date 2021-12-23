Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6BA47E2C3
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Dec 2021 12:57:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCF7CC5F1F7;
	Thu, 23 Dec 2021 11:57:05 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51B9FC5F1F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Dec 2021 11:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640260624; x=1671796624;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=l7/Ec1k8g+Fuqc+4+s0zclAcRcBVVg9oTnf/81Ddgz8=;
 b=DhlGuSHBN1p4wzm2Z2sV398PAAfHfmsX7OcssyodZBb0Lj7ZpOcdsOpe
 aC+J6XZ62GtLKb35HMxqjut7LE+hZwz6AgVs3XHv7Q6nyuTte9L3HdNaU
 qosEoB/zXj6JSJWxMc/Kyn6Iq0ublbEL4beVKj3FD+jG1gccYrsxDicln
 7BDhWXzAmjG6+fxP5tlUUi+/iwEsTO3YBvnvfwPj0rCRDEWK+b44POjBV
 VsjbwbS+8US4c67HKjzVl3rtEB3PmuKiA+AslejW6IxEGPJj3ZYkUDC5G
 sHY/JujqHV3xtusITmSR8PUUiZypftg3ztIOAPevUc6z0un1SHXPj3fA2 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="240615250"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="240615250"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:57:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="607735683"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by FMSMGA003.fm.intel.com with SMTP; 23 Dec 2021 03:56:55 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 23 Dec 2021 13:56:55 +0200
Date: Thu, 23 Dec 2021 13:56:55 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Message-ID: <YcRkB7uWyt4EbcZm@intel.com>
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
 <20211222090552.25972-2-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211222090552.25972-2-jose.exposito89@gmail.com>
X-Patchwork-Hint: comment
Cc: marex@denx.de, mcoquelin.stm32@gmail.com, s.hauer@pengutronix.de,
 tzimmermann@suse.de, kernel@pengutronix.de, airlied@linux.ie,
 contact@emersion.fr, intel-gfx@lists.freedesktop.org,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, yannick.fertre@foss.st.com, linux-imx@nxp.com,
 benjamin.gaignard@linaro.org, rodrigo.vivi@intel.com,
 dmitry.baryshkov@linaro.org, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32]
 =?iso-8859-1?q?=5BPATCH_v2_1/6=5D_drm/plane=3A_Make?=
 =?iso-8859-1?q?_format=5Fmod=5Fsupported_truly=A0optional?=
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, Dec 22, 2021 at 10:05:47AM +0100, Jos=E9 Exp=F3sito wrote:
> The documentation for "drm_plane_funcs.format_mod_supported" reads:
> =

>   This *optional* hook is used for the DRM to determine if the given
>   format/modifier combination is valid for the plane. This allows the
>   DRM to generate the correct format bitmask (which formats apply to
>   which modifier), and to validate modifiers at atomic_check time.
> =

>   *If not present*, then any modifier in the plane's modifier
>   list is allowed with any of the plane's formats.
> =

> However, where the function is not present, an invalid IN_FORMATS blob
> property with modifiers but no formats is exposed to user-space.
> =

> This breaks the latest Weston [1]. For testing purposes, I extracted the
> affected code to a standalone program [2].
> =

> Make "create_in_format_blob" behave as documented.
> =

> [1] https://gitlab.freedesktop.org/wayland/weston/-/blob/9.0/libweston/ba=
ckend-drm/kms.c#L431
> [2] https://github.com/JoseExposito/drm-sandbox/blob/main/in_formats.c
> =

> Signed-off-by: Jos=E9 Exp=F3sito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/drm_plane.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 82afb854141b..c1186b7215ee 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -202,17 +202,13 @@ static int create_in_format_blob(struct drm_device =
*dev, struct drm_plane *plane
>  =

>  	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
>  =

> -	/* If we can't determine support, just bail */
> -	if (!plane->funcs->format_mod_supported)
> -		goto done;
> -
>  	mod =3D modifiers_ptr(blob_data);
>  	for (i =3D 0; i < plane->modifier_count; i++) {
>  		for (j =3D 0; j < plane->format_count; j++) {
> -			if (plane->funcs->format_mod_supported(plane,
> +			if (!plane->funcs->format_mod_supported ||
> +			    plane->funcs->format_mod_supported(plane,
>  							       plane->format_types[j],
>  							       plane->modifiers[i])) {

So instead of skipping the whole loop you just skip doing anything
inside the loop? Can't see how that achieves anything at all.

https://patchwork.freedesktop.org/series/83018/
is what I had in mind earlier but no one reviewed it and =

the discussion veered off track IIRC.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
