Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 667FD55BA56
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jun 2022 16:13:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29827C5F1EE;
	Mon, 27 Jun 2022 14:13:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB1BCC5F1D5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 14:13:04 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RBmjOr028625;
 Mon, 27 Jun 2022 16:12:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=xxGaA6HB9qLSCLIv4FE0RVsiDZSbEeEygBYsaoTaVww=;
 b=JnJSg0agljXOQWZ0ymrrA0H363j1M8x29T7ac8cha0b0thb2ytH/ddmPvY+LPwh4hF8d
 aN/Ck5+Jf/Ai335d4Lb1ocss2wE01523kO0uK8NtNie381ksKJxrkhIs5VpEt6zGFzDD
 tXKTwQIHPWJ1rRhR2h0LF2SJQueeEtQ/VXPCGv7YNg/mKEQrtGCesSAM6AQTEh1Rxnku
 8UrwfUbELv7Yn30mSK2Kodi0CN/cKMNMt0p8+aq0A0eT8NPTrEAhEz0DL8WQlFX466Ke
 +ifCy/1TEXw3wElF7bXPxSZExYQwnh4pNiIF8/KTxo0/Xoy2kI3S9lIkvRwLxD7X06Rd wg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gwsq120pm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jun 2022 16:12:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A88C2100034;
 Mon, 27 Jun 2022 16:12:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A3A5A22177C;
 Mon, 27 Jun 2022 16:12:56 +0200 (CEST)
Received: from [10.48.1.86] (10.75.127.49) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 27 Jun
 2022 16:12:55 +0200
Message-ID: <e1e0d0b6-291d-54df-62ef-6c9b0d4b5ee3@foss.st.com>
Date: Mon, 27 Jun 2022 16:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220603134547.593790-1-yannick.fertre@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20220603134547.593790-1-yannick.fertre@foss.st.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: add support of horizontal
 & vertical mirroring
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 6/3/22 15:45, Yannick Fertre wrote:
> Support of vertical & horizontal mirroring features thanks to
> the plane rotation property.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 163 ++++++++++++++++++++++++-------------
>   drivers/gpu/drm/stm/ltdc.h |   1 +
>   2 files changed, 108 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 00a6bc1b1d7c..ff2075dd9474 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -180,6 +180,7 @@
>   #define LXCR_LEN	BIT(0)		/* Layer ENable */
>   #define LXCR_COLKEN	BIT(1)		/* Color Keying Enable */
>   #define LXCR_CLUTEN	BIT(4)		/* Color Look-Up Table ENable */
> +#define LXCR_HMEN	BIT(8)		/* Horizontal Mirroring ENable */
>   
>   #define LXWHPCR_WHSTPOS	GENMASK(11, 0)	/* Window Horizontal StarT POSition */
>   #define LXWHPCR_WHSPPOS	GENMASK(27, 16)	/* Window Horizontal StoP POSition */
> @@ -197,7 +198,7 @@
>   #define LXBFCR_BOR	GENMASK(18, 16) /* Blending ORder */
>   
>   #define LXCFBLR_CFBLL	GENMASK(12, 0)	/* Color Frame Buffer Line Length */
> -#define LXCFBLR_CFBP	GENMASK(28, 16)	/* Color Frame Buffer Pitch in bytes */
> +#define LXCFBLR_CFBP	GENMASK(31, 16) /* Color Frame Buffer Pitch in bytes */
>   
>   #define LXCFBLNR_CFBLN	GENMASK(10, 0)	/* Color Frame Buffer Line Number */
>   
> @@ -1237,7 +1238,8 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
>   	u32 y0 = newstate->crtc_y;
>   	u32 y1 = newstate->crtc_y + newstate->crtc_h - 1;
>   	u32 src_x, src_y, src_w, src_h;
> -	u32 val, pitch_in_bytes, line_length, line_number, paddr, ahbp, avbp, bpcr;
> +	u32 val, pitch_in_bytes, line_length, line_number, ahbp, avbp, bpcr;
> +	u32 paddr, paddr1, paddr2;
>   	enum ltdc_pix_fmt pf;
>   
>   	if (!newstate->crtc || !fb) {
> @@ -1289,13 +1291,6 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
>   	}
>   	regmap_write_bits(ldev->regmap, LTDC_L1PFCR + lofs, LXPFCR_PF, val);
>   
> -	/* Configures the color frame buffer pitch in bytes & line length */
> -	pitch_in_bytes = fb->pitches[0];
> -	line_length = fb->format->cpp[0] *
> -		      (x1 - x0 + 1) + (ldev->caps.bus_width >> 3) - 1;
> -	val = ((pitch_in_bytes << 16) | line_length);
> -	regmap_write_bits(ldev->regmap, LTDC_L1CFBLR + lofs, LXCFBLR_CFBLL | LXCFBLR_CFBP, val);
> -
>   	/* Specifies the constant alpha value */
>   	val = newstate->alpha >> 8;
>   	regmap_write_bits(ldev->regmap, LTDC_L1CACR + lofs, LXCACR_CONSTA, val);
> @@ -1319,76 +1314,115 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
>   				  LXBFCR_BF2 | LXBFCR_BF1, val);
>   	}
>   
> -	/* Configures the frame buffer line number */
> -	line_number = y1 - y0 + 1;
> -	regmap_write_bits(ldev->regmap, LTDC_L1CFBLNR + lofs, LXCFBLNR_CFBLN, line_number);
> -
>   	/* Sets the FB address */
>   	paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 0);
>   
> +	if (newstate->rotation & DRM_MODE_REFLECT_X)
> +		paddr += (fb->format->cpp[0] * (x1 - x0 + 1)) - 1;
> +
> +	if (newstate->rotation & DRM_MODE_REFLECT_Y)
> +		paddr += (fb->pitches[0] * (y1 - y0));
> +
>   	DRM_DEBUG_DRIVER("fb: phys 0x%08x", paddr);
>   	regmap_write(ldev->regmap, LTDC_L1CFBAR + lofs, paddr);
>   
> +	/* Configures the color frame buffer pitch in bytes & line length */
> +	line_length = fb->format->cpp[0] *
> +		      (x1 - x0 + 1) + (ldev->caps.bus_width >> 3) - 1;
> +
> +	if (newstate->rotation & DRM_MODE_REFLECT_Y)
> +		/* Compute negative value (signed on 16 bits) for the picth */
> +		pitch_in_bytes = 0x10000 - fb->pitches[0];
> +	else
> +		pitch_in_bytes = fb->pitches[0];
> +
> +	val = (pitch_in_bytes << 16) | line_length;
> +	regmap_write_bits(ldev->regmap, LTDC_L1CFBLR + lofs, LXCFBLR_CFBLL | LXCFBLR_CFBP, val);
> +
> +	/* Configures the frame buffer line number */
> +	line_number = y1 - y0 + 1;
> +	regmap_write_bits(ldev->regmap, LTDC_L1CFBLNR + lofs, LXCFBLNR_CFBLN, line_number);
> +
>   	if (ldev->caps.ycbcr_input) {
>   		if (fb->format->is_yuv) {
>   			switch (fb->format->format) {
>   			case DRM_FORMAT_NV12:
>   			case DRM_FORMAT_NV21:
> -			/* Configure the auxiliary frame buffer address 0 & 1 */
> -			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
> -			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr);
> -			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr + 1);
> +			/* Configure the auxiliary frame buffer address 0 */
> +			paddr1 = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
> +
> +			if (newstate->rotation & DRM_MODE_REFLECT_X)
> +				paddr1 += ((fb->format->cpp[1] * (x1 - x0 + 1)) >> 1) - 1;
>   
> -			/* Configure the buffer length */
> -			val = ((pitch_in_bytes << 16) | line_length);
> -			regmap_write(ldev->regmap, LTDC_L1AFBLR + lofs, val);
> +			if (newstate->rotation & DRM_MODE_REFLECT_Y)
> +				paddr1 += (fb->pitches[1] * (y1 - y0 - 1)) >> 1;
>   
> -			/* Configure the frame buffer line number */
> -			val = (line_number >> 1);
> -			regmap_write(ldev->regmap, LTDC_L1AFBLNR + lofs, val);
> +			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr1);
>   			break;
>   			case DRM_FORMAT_YUV420:
> -			/* Configure the auxiliary frame buffer address 0 */
> -			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
> -			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr);
> -
> -			/* Configure the auxiliary frame buffer address 1 */
> -			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 2);
> -			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr);
> +			/* Configure the auxiliary frame buffer address 0 & 1 */
> +			paddr1 = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
> +			paddr2 = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 2);
>   
> -			line_length = ((fb->format->cpp[0] * (x1 - x0 + 1)) >> 1) +
> -				      (ldev->caps.bus_width >> 3) - 1;
> +			if (newstate->rotation & DRM_MODE_REFLECT_X) {
> +				paddr1 += ((fb->format->cpp[1] * (x1 - x0 + 1)) >> 1) - 1;
> +				paddr2 += ((fb->format->cpp[2] * (x1 - x0 + 1)) >> 1) - 1;
> +			}
>   
> -			/* Configure the buffer length */
> -			val = (((pitch_in_bytes >> 1) << 16) | line_length);
> -			regmap_write(ldev->regmap, LTDC_L1AFBLR + lofs, val);
> +			if (newstate->rotation & DRM_MODE_REFLECT_Y) {
> +				paddr1 += (fb->pitches[1] * (y1 - y0 - 1)) >> 1;
> +				paddr2 += (fb->pitches[2] * (y1 - y0 - 1)) >> 1;
> +			}
>   
> -			/* Configure the frame buffer line number */
> -			val = (line_number >> 1);
> -			regmap_write(ldev->regmap, LTDC_L1AFBLNR + lofs, val);
> +			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr1);
> +			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr2);
>   			break;
>   			case DRM_FORMAT_YVU420:
> -			/* Configure the auxiliary frame buffer address 0 */
> -			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 2);
> -			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr);
> -
> -			/* Configure the auxiliary frame buffer address 1 */
> -			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
> -			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr);
> +			/* Configure the auxiliary frame buffer address 0 & 1 */
> +			paddr1 = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 2);
> +			paddr2 = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
>   
> -			line_length = ((fb->format->cpp[0] * (x1 - x0 + 1)) >> 1) +
> -				      (ldev->caps.bus_width >> 3) - 1;
> +			if (newstate->rotation & DRM_MODE_REFLECT_X) {
> +				paddr1 += ((fb->format->cpp[1] * (x1 - x0 + 1)) >> 1) - 1;
> +				paddr2 += ((fb->format->cpp[2] * (x1 - x0 + 1)) >> 1) - 1;
> +			}
>   
> -			/* Configure the buffer length */
> -			val = (((pitch_in_bytes >> 1) << 16) | line_length);
> -			regmap_write(ldev->regmap, LTDC_L1AFBLR + lofs, val);
> +			if (newstate->rotation & DRM_MODE_REFLECT_Y) {
> +				paddr1 += (fb->pitches[1] * (y1 - y0 - 1)) >> 1;
> +				paddr2 += (fb->pitches[2] * (y1 - y0 - 1)) >> 1;
> +			}
>   
> -			/* Configure the frame buffer line number */
> -			val = (line_number >> 1);
> -			regmap_write(ldev->regmap, LTDC_L1AFBLNR + lofs, val);
> +			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr1);
> +			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr2);
>   			break;
>   			}
>   
> +			/*
> +			 * Set the length and the number of lines of the auxiliary
> +			 * buffers if the framebuffer contains more than one plane.
> +			 */
> +			if (fb->format->num_planes > 1) {
> +				if (newstate->rotation & DRM_MODE_REFLECT_Y)
> +					/*
> +					 * Compute negative value (signed on 16 bits)
> +					 * for the picth
> +					 */
> +					pitch_in_bytes = 0x10000 - fb->pitches[1];
> +				else
> +					pitch_in_bytes = fb->pitches[1];
> +
> +				line_length = ((fb->format->cpp[1] * (x1 - x0 + 1)) >> 1) +
> +					      (ldev->caps.bus_width >> 3) - 1;
> +
> +				/* Configure the auxiliary buffer length */
> +				val = (pitch_in_bytes << 16) | line_length;
> +				regmap_write(ldev->regmap, LTDC_L1AFBLR + lofs, val);
> +
> +				/* Configure the auxiliary frame buffer line number */
> +				val = line_number >> 1;
> +				regmap_write(ldev->regmap, LTDC_L1AFBLNR + lofs, val);
> +			}
> +
>   			/* Configure YCbC conversion coefficient */
>   			ltdc_set_ycbcr_coeffs(plane);
>   
> @@ -1403,7 +1437,12 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
>   	/* Enable layer and CLUT if needed */
>   	val = fb->format->format == DRM_FORMAT_C8 ? LXCR_CLUTEN : 0;
>   	val |= LXCR_LEN;
> -	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_LEN | LXCR_CLUTEN, val);
> +
> +	/* Enable horizontal mirroring if requested */
> +	if (newstate->rotation & DRM_MODE_REFLECT_X)
> +		val |= LXCR_HMEN;
> +
> +	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_LEN | LXCR_CLUTEN | LXCR_HMEN, val);
>   
>   	/* Commit shadow registers = update plane at next vblank */
>   	if (ldev->caps.plane_reg_shadow)
> @@ -1432,8 +1471,8 @@ static void ltdc_plane_atomic_disable(struct drm_plane *plane,
>   	struct ltdc_device *ldev = plane_to_ltdc(plane);
>   	u32 lofs = plane->index * LAY_OFS;
>   
> -	/* disable layer */
> -	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_LEN, 0);
> +	/* Disable layer */
> +	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_LEN | LXCR_CLUTEN |  LXCR_HMEN, 0);
>   
>   	/* Commit shadow registers = update plane at next vblank */
>   	if (ldev->caps.plane_reg_shadow)
> @@ -1577,6 +1616,7 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>   {
>   	struct ltdc_device *ldev = ddev->dev_private;
>   	struct drm_plane *primary, *overlay;
> +	int supported_rotations = DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
>   	unsigned int i;
>   	int ret;
>   
> @@ -1591,6 +1631,10 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>   	else
>   		drm_plane_create_zpos_immutable_property(primary, 0);
>   
> +	if (ldev->caps.plane_rotation)
> +		drm_plane_create_rotation_property(primary, DRM_MODE_ROTATE_0,
> +						   supported_rotations);
> +
>   	/* Init CRTC according to its hardware features */
>   	if (ldev->caps.crc)
>   		ret = drm_crtc_init_with_planes(ddev, crtc, primary, NULL,
> @@ -1622,6 +1666,10 @@ static int ltdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc)
>   			drm_plane_create_zpos_property(overlay, i, 0, ldev->caps.nb_layers - 1);
>   		else
>   			drm_plane_create_zpos_immutable_property(overlay, i);
> +
> +		if (ldev->caps.plane_rotation)
> +			drm_plane_create_rotation_property(overlay, DRM_MODE_ROTATE_0,
> +							   supported_rotations);
>   	}
>   
>   	return 0;
> @@ -1752,6 +1800,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
>   		ldev->caps.plane_reg_shadow = false;
>   		ldev->caps.crc = false;
>   		ldev->caps.dynamic_zorder = false;
> +		ldev->caps.plane_rotation = false;
>   		break;
>   	case HWVER_20101:
>   		ldev->caps.layer_ofs = LAY_OFS_0;
> @@ -1768,6 +1817,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
>   		ldev->caps.plane_reg_shadow = false;
>   		ldev->caps.crc = false;
>   		ldev->caps.dynamic_zorder = false;
> +		ldev->caps.plane_rotation = false;
>   		break;
>   	case HWVER_40100:
>   		ldev->caps.layer_ofs = LAY_OFS_1;
> @@ -1784,6 +1834,7 @@ static int ltdc_get_caps(struct drm_device *ddev)
>   		ldev->caps.plane_reg_shadow = true;
>   		ldev->caps.crc = true;
>   		ldev->caps.dynamic_zorder = true;
> +		ldev->caps.plane_rotation = true;
>   		break;
>   	default:
>   		return -ENODEV;
> diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
> index 4855898bd4c0..15139980d8ea 100644
> --- a/drivers/gpu/drm/stm/ltdc.h
> +++ b/drivers/gpu/drm/stm/ltdc.h
> @@ -29,6 +29,7 @@ struct ltdc_caps {
>   	bool plane_reg_shadow;	/* plane shadow registers ability */
>   	bool crc;		/* cyclic redundancy check supported */
>   	bool dynamic_zorder;	/* dynamic z-order */
> +	bool plane_rotation;	/* plane rotation */
>   };
>   
>   #define LTDC_MAX_LAYER	4

Dear Yannick,
Many thanks for your patch,
Applied on drm-misc-next.
Have a good day
Philippe :-)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
