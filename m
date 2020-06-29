Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E25C420CD55
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2020 10:34:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1B57C36B0D;
	Mon, 29 Jun 2020 08:34:02 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 945C0C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2020 08:34:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h5so15611927wrc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2020 01:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=m1iLBqzd5JET/4+7q0bkqySBB/VEXvt/QPf9pQZxD4I=;
 b=ioALFefxtWjpUGVv9aHBdWR6XYQ5mUGOiLyBKcCwX93YpoWp3xtVYvb6n6RB2S8Ckz
 u3QFELzJpaqBiFOqrnUVJ2Wq7mtXuxbjmoKGKF4tV6Wn0jSwpXHOXITn+H14U5jKSdGf
 DiIL0Vq9MDiO8em2RGk+86Hl1UFagXnZvgL9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=m1iLBqzd5JET/4+7q0bkqySBB/VEXvt/QPf9pQZxD4I=;
 b=XmolXiXl6DpQU9nR1Pk3k2IMwT9wyjv3XVgEAPST83rrDBF7IDIK8wwH7jDgStaAjj
 +lEiIuEFRT+aaO/L0fcbC6oo5DDGcjjuudNL3NSdaHnY95QPlUm3yUAGM0WquLEXZAr/
 mbb/1z6nc1g/XkgtNfFoExW1eyvVh3UqdYN+9z6Bf66P8TxChJKNF87w5dVp6nCBalk6
 RMrtB/qHJZnbeRYmrxaMOQdDoO4MeQKVgc2rkhNGkfCh4cngOr2dwCCo5jAm9nC/yYYM
 mlwudkRpVLf3XycnVHYJJQzYajiK4qZoTXrQ2hA3MD5JiDB7ivgc33qlswklSFFfaAj4
 EC4Q==
X-Gm-Message-State: AOAM5338rx8ODshx1NsoXVRtg7Q1llz5b9S4CDfk2zirl5iGDFhODE4t
 Y8TV8WiL0ZsaQIvJbLKqtHgwLw==
X-Google-Smtp-Source: ABdhPJxoly9GEBebPkgfgZdpyDBicJrcaP5lLqpFp2lEkUI/aykgWwPjNusQB+uOOnfme7Z0sEXChg==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr15246966wrp.234.1593419641020; 
 Mon, 29 Jun 2020 01:34:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y20sm4657035wmi.8.2020.06.29.01.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 01:34:00 -0700 (PDT)
Date: Mon, 29 Jun 2020 10:33:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Antonio Borneo <antonio.borneo@st.com>
Message-ID: <20200629083358.GK3278063@phenom.ffwll.local>
Mail-Followup-To: Antonio Borneo <antonio.borneo@st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20200626204252.44565-1-antonio.borneo@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626204252.44565-1-antonio.borneo@st.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] drm/connector: fix minor typos in comments
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

On Fri, Jun 26, 2020 at 10:42:52PM +0200, Antonio Borneo wrote:
> Some of these comments are part of the Linux GPU Driver Developer's
> Guide.
> Fix some minor typo in the comments and remove a repeated 'the'.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>

Queued up for 5.9 in drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_connector.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index d877ddc6dc57..cb62fb8e594e 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -38,7 +38,7 @@
>   * DOC: overview
>   *
>   * In DRM connectors are the general abstraction for display sinks, and include
> - * als fixed panels or anything else that can display pixels in some form. As
> + * also fixed panels or anything else that can display pixels in some form. As
>   * opposed to all other KMS objects representing hardware (like CRTC, encoder or
>   * plane abstractions) connectors can be hotplugged and unplugged at runtime.
>   * Hence they are reference-counted using drm_connector_get() and
> @@ -129,7 +129,7 @@ EXPORT_SYMBOL(drm_get_connector_type_name);
>  
>  /**
>   * drm_connector_get_cmdline_mode - reads the user's cmdline mode
> - * @connector: connector to quwery
> + * @connector: connector to query
>   *
>   * The kernel supports per-connector configuration of its consoles through
>   * use of the video= parameter. This function parses that option and
> @@ -991,7 +991,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>   * 	DP MST sinks), or high-res integrated panels (like dual-link DSI) which
>   * 	are not gen-locked. Note that for tiled panels which are genlocked, like
>   * 	dual-link LVDS or dual-link DSI, the driver should try to not expose the
> - * 	tiling and virtualize both &drm_crtc and &drm_plane if needed. Drivers
> + * 	tiling and virtualise both &drm_crtc and &drm_plane if needed. Drivers
>   * 	should update this value using drm_connector_set_tile_property().
>   * 	Userspace cannot change this property.
>   * link-status:
> @@ -1131,7 +1131,7 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>   *
>   *	It will even need to do colorspace conversion and get all layers
>   *	to one common colorspace for blending. It can use either GL, Media
> - *	or display engine to get this done based on the capabilties of the
> + *	or display engine to get this done based on the capabilities of the
>   *	associated hardware.
>   *
>   *	Driver expects metadata to be put in &struct hdr_output_metadata
> @@ -1614,7 +1614,7 @@ EXPORT_SYMBOL(drm_mode_create_scaling_mode_property);
>   * variable refresh rate capability for a connector.
>   *
>   * Returns:
> - * Zero on success, negative errono on failure.
> + * Zero on success, negative errno on failure.
>   */
>  int drm_connector_attach_vrr_capable_property(
>  	struct drm_connector *connector)
> @@ -1759,7 +1759,7 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
>   * HDMI connectors.
>   *
>   * Returns:
> - * Zero on success, negative errono on failure.
> + * Zero on success, negative errno on failure.
>   */
>  int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector)
>  {
> @@ -1788,7 +1788,7 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
>   * DP connectors.
>   *
>   * Returns:
> - * Zero on success, negative errono on failure.
> + * Zero on success, negative errno on failure.
>   */
>  int drm_mode_create_dp_colorspace_property(struct drm_connector *connector)
>  {
> @@ -1840,7 +1840,7 @@ EXPORT_SYMBOL(drm_mode_create_content_type_property);
>   * drm_mode_create_suggested_offset_properties - create suggests offset properties
>   * @dev: DRM device
>   *
> - * Create the the suggested x/y offset property for connectors.
> + * Create the suggested x/y offset property for connectors.
>   */
>  int drm_mode_create_suggested_offset_properties(struct drm_device *dev)
>  {
> @@ -1963,7 +1963,7 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
>  		size = EDID_LENGTH * (1 + edid->extensions);
>  
>  	/* Set the display info, using edid if available, otherwise
> -	 * reseting the values to defaults. This duplicates the work
> +	 * resetting the values to defaults. This duplicates the work
>  	 * done in drm_add_edid_modes, but that function is not
>  	 * consistently called before this one in all drivers and the
>  	 * computation is cheap enough that it seems better to
> @@ -2076,7 +2076,7 @@ void drm_connector_set_vrr_capable_property(
>  EXPORT_SYMBOL(drm_connector_set_vrr_capable_property);
>  
>  /**
> - * drm_connector_set_panel_orientation - sets the connecter's panel_orientation
> + * drm_connector_set_panel_orientation - sets the connector's panel_orientation
>   * @connector: connector for which to set the panel-orientation property.
>   * @panel_orientation: drm_panel_orientation value to set
>   *
> @@ -2131,7 +2131,7 @@ EXPORT_SYMBOL(drm_connector_set_panel_orientation);
>  
>  /**
>   * drm_connector_set_panel_orientation_with_quirk -
> - *	set the connecter's panel_orientation after checking for quirks
> + *	set the connector's panel_orientation after checking for quirks
>   * @connector: connector for which to init the panel-orientation property.
>   * @panel_orientation: drm_panel_orientation value to set
>   * @width: width in pixels of the panel, used for panel quirk detection
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
