Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8154C4AC4A3
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 17:01:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44121C5AB61;
	Mon,  7 Feb 2022 16:01:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23B66C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 16:00:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D7F961757;
 Wed,  2 Feb 2022 16:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E46C004E1;
 Wed,  2 Feb 2022 16:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643820900;
 bh=+Mw3UqSA9RW9lVv7cMeO4kcmAotMs1Y2FfPXU4FBX0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MLDcYJAZvsv0XjxsuicWh3967mYmwunkokbmM+LwLId1hMsSp9rl1N3omNdCRHynH
 BXyvlTGymC3VchPCaetwp6qPoimzewJphziaYPKVoMe7RBiYK7aBEwXg79ysMnq1by
 4YIxFZe1wIiKqNoQvUoR+Lea7Qga6Ai4DA7mAkmFJkafEfDSvyXEflnnfVunelFB8M
 W8UnHi+FVqr2zmpCDBRw1TJkIwsiRYJXog7IVacvNlpd0zDWp/ctF/3gRU+/maemd7
 kEmmGNuEx7RUhG2h0KO2KEeV4FC6natUldJrgVB9m5DQj8W9NPGFCLTFy3Tr4s1KDy
 YkX+82ZIKJoxA==
Date: Wed, 2 Feb 2022 09:54:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <Yfq3XwozrxYaFhgD@dev-arch.archlinux-ax161>
References: <20211215214843.20703-1-yannick.fertre@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215214843.20703-1-yannick.fertre@foss.st.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/5] drm/stm: ltdc: add support of ycbcr
	pixel formats
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Yannick,

On Wed, Dec 15, 2021 at 10:48:43PM +0100, Yannick Fertre wrote:
> This patch adds the following YCbCr input pixel formats on the latest
> LTDC hardware version:
> 
> 1 plane  (co-planar)  : YUYV, YVYU, UYVY, VYUY
> 2 planes (semi-planar): NV12, NV21
> 3 planes (full-planar): YU12=I420=DRM YUV420, YV12=DRM YVU420
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>

<snip>

> +static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fmt)
> +{
> +	struct ltdc_device *ldev = plane_to_ltdc(plane);
> +	struct drm_plane_state *state = plane->state;
> +	u32 lofs = plane->index * LAY_OFS;
> +	u32 val;
> +
> +	switch (drm_pix_fmt) {
> +	case DRM_FORMAT_YUYV:
> +		val = (YCM_I << 4) | LxPCR_YF | LxPCR_CBF;
> +		break;
> +	case DRM_FORMAT_YVYU:
> +		val = (YCM_I << 4) | LxPCR_YF;
> +		break;
> +	case DRM_FORMAT_UYVY:
> +		val = (YCM_I << 4) | LxPCR_CBF;
> +		break;
> +	case DRM_FORMAT_VYUY:
> +		val = (YCM_I << 4);
> +		break;
> +	case DRM_FORMAT_NV12:
> +		val = (YCM_SP << 4) | LxPCR_CBF;
> +		break;
> +	case DRM_FORMAT_NV21:
> +		val = (YCM_SP << 4);
> +		break;
> +	case DRM_FORMAT_YUV420:
> +	case DRM_FORMAT_YVU420:
> +		val = (YCM_FP << 4);
> +		break;
> +	default:
> +		/* RGB or not a YCbCr supported format */
> +		break;
> +	}
> +
> +	/* Enable limited range */
> +	if (state->color_range == DRM_COLOR_YCBCR_LIMITED_RANGE)
> +		val |= LxPCR_YREN;
> +
> +	/* enable ycbcr conversion */
> +	val |= LxPCR_YCEN;
> +
> +	regmap_write(ldev->regmap, LTDC_L1PCR + lofs, val);
> +}

This patch as commit 484e72d3146b ("drm/stm: ltdc: add support of ycbcr
pixel formats") in -next introduced the following clang warning:

drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
        default:
        ^~~~~~~
drivers/gpu/drm/stm/ltdc.c:635:2: note: uninitialized use occurs here
        val |= LxPCR_YCEN;
        ^~~
drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' to silence this warning
        u32 val;
               ^
                = 0
1 warning generated.

Would it be okay to just return in the default case (maybe with a
message about an unsupported format?) or should there be another fix?

Cheers,
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
