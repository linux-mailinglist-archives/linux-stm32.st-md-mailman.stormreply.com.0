Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3955A0AFF2
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 08:19:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FC30C7802B;
	Mon, 13 Jan 2025 07:19:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6071DC78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 09:26:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A7f4Bd027096;
 Fri, 10 Jan 2025 10:26:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=zdV4UWXKgph75hgkTGyDuBhw
 JbufNelcAzZjgqH/xQw=; b=zwaLhwGbJjzNxNZMFO3u6Wm/35qzaXcHk98f0i7g
 6lmYiqmM29hwgvsTjBaL/zCK5DL0ur+n9nHKmqwo9KtP0ZXOc9HZ19w+dWQJB6OB
 g0Vkg46sI3vLn47umotGpg40gxDD/x6ajvZe3ckNcQT8/mMUwETHPb4hPZBru+fc
 dKHq61wCnvLSiLZwwRwFb+md4mU9mifzVTr7f7gLkts8yrXha43a97GoHMvUxX9c
 atF3Y9AEOt4IJFq6phlpGjMetPxj3BnfZR+e6p6TfxiinZbCKfBp/VFKBKGEkWyG
 BkeubZflAD+w8skOw+dABuT4rLismRkyz2Axp/y+KcqpjQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 442mw0j9px-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2025 10:26:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BE0B540055;
 Fri, 10 Jan 2025 10:24:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D73228AB87;
 Fri, 10 Jan 2025 10:23:04 +0100 (CET)
Received: from [10.252.28.181] (10.252.28.181) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 10 Jan
 2025 10:23:03 +0100
Message-ID: <a2656121-8d46-4f35-ac79-a9e0c5cf1762@foss.st.com>
Date: Fri, 10 Jan 2025 10:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sean Nyekjaer <sean@geanix.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Raphael
 Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-3-9113419f4a40@geanix.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20241125-dsi-relax-v2-3-9113419f4a40@geanix.com>
X-Originating-IP: [10.252.28.181]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Mailman-Approved-At: Mon, 13 Jan 2025 07:19:29 +0000
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH v2 3/3] drm/stm: dsi: use
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
Content-Type: multipart/mixed; boundary="===============1803269647509483484=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1803269647509483484==
Content-Type: multipart/alternative;
	boundary="------------fm1QeVWYE62CKalF086024nC"
Content-Language: en-US

--------------fm1QeVWYE62CKalF086024nC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sean,

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>

Thanks for this patch,

Yannick

Le 25/11/2024 à 14:49, Sean Nyekjaer a écrit :
> When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh
> to reguire the requested and the actual px clock to be within
> 50Hz. A typical LVDS display requires the px clock to be within +-10%.
>
> In case for HDMI .5% tolerance is required.
>
> Signed-off-by: Sean Nyekjaer<sean@geanix.com>
> ---
>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> index b20123854c4ad7b3a2cc973a26fc10fd433e8d09..7b32abe0d4f582eea1fbbacad48c84199be3fa23 100644
> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> @@ -484,8 +484,6 @@ dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
>   	return 0;
>   }
>   
> -#define CLK_TOLERANCE_HZ 50
> -
>   static enum drm_mode_status
>   dw_mipi_dsi_stm_mode_valid(void *priv_data,
>   			   const struct drm_display_mode *mode,
> @@ -525,7 +523,7 @@ dw_mipi_dsi_stm_mode_valid(void *priv_data,
>   	}
>   
>   	if (!(mode_flags & MIPI_DSI_MODE_VIDEO_BURST)) {
> -		unsigned int px_clock_hz, target_px_clock_hz, lane_mbps;
> +		unsigned int px_clock_hz, lane_mbps;
>   		int dsi_short_packet_size_px, hfp, hsync, hbp, delay_to_lp;
>   		struct dw_mipi_dsi_dphy_timing dphy_timing;
>   
> @@ -533,14 +531,14 @@ dw_mipi_dsi_stm_mode_valid(void *priv_data,
>   		pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
>   
>   		px_clock_hz = DIV_ROUND_CLOSEST_ULL(1000ULL * pll_out_khz * lanes, bpp);
> -		target_px_clock_hz = mode->clock * 1000;
>   		/*
>   		 * Filter modes according to the clock value, particularly useful for
>   		 * hdmi modes that require precise pixel clocks.
>   		 */
> -		if (px_clock_hz < target_px_clock_hz - CLK_TOLERANCE_HZ ||
> -		    px_clock_hz > target_px_clock_hz + CLK_TOLERANCE_HZ)
> -			return MODE_CLOCK_RANGE;
> +
> +		ret = drm_mode_validate_mode(mode, px_clock_hz);
> +		if (ret)
> +			return ret;
>   
>   		/* sync packets are codes as DSI short packets (4 bytes) */
>   		dsi_short_packet_size_px = DIV_ROUND_UP(4 * BITS_PER_BYTE, bpp);
>
--------------fm1QeVWYE62CKalF086024nC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre class="moz-quote-pre" wrap="">Hi Sean,

<span style="white-space: normal">Tested-by: Yannick Fertre <a class="moz-txt-link-rfc2396E" href="mailto:yannick.fertre@foss.st.com">&lt;yannick.fertre@foss.st.com&gt;</a> </span></pre>
    <pre class="moz-quote-pre" wrap="">Thanks for this patch,

Yannick
</pre>
    <p></p>
    <div class="moz-cite-prefix">Le 25/11/2024 à 14:49, Sean Nyekjaer a
      écrit :<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241125-dsi-relax-v2-3-9113419f4a40@geanix.com">
      <pre class="moz-quote-pre" wrap="">When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh
to reguire the requested and the actual px clock to be within
50Hz. A typical LVDS display requires the px clock to be within +-10%.

In case for HDMI .5% tolerance is required.

Signed-off-by: Sean Nyekjaer <a class="moz-txt-link-rfc2396E" href="mailto:sean@geanix.com">&lt;sean@geanix.com&gt;</a>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index b20123854c4ad7b3a2cc973a26fc10fd433e8d09..7b32abe0d4f582eea1fbbacad48c84199be3fa23 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -484,8 +484,6 @@ dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
 	return 0;
 }
 
-#define CLK_TOLERANCE_HZ 50
-
 static enum drm_mode_status
 dw_mipi_dsi_stm_mode_valid(void *priv_data,
 			   const struct drm_display_mode *mode,
@@ -525,7 +523,7 @@ dw_mipi_dsi_stm_mode_valid(void *priv_data,
 	}
 
 	if (!(mode_flags &amp; MIPI_DSI_MODE_VIDEO_BURST)) {
-		unsigned int px_clock_hz, target_px_clock_hz, lane_mbps;
+		unsigned int px_clock_hz, lane_mbps;
 		int dsi_short_packet_size_px, hfp, hsync, hbp, delay_to_lp;
 		struct dw_mipi_dsi_dphy_timing dphy_timing;
 
@@ -533,14 +531,14 @@ dw_mipi_dsi_stm_mode_valid(void *priv_data,
 		pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
 
 		px_clock_hz = DIV_ROUND_CLOSEST_ULL(1000ULL * pll_out_khz * lanes, bpp);
-		target_px_clock_hz = mode-&gt;clock * 1000;
 		/*
 		 * Filter modes according to the clock value, particularly useful for
 		 * hdmi modes that require precise pixel clocks.
 		 */
-		if (px_clock_hz &lt; target_px_clock_hz - CLK_TOLERANCE_HZ ||
-		    px_clock_hz &gt; target_px_clock_hz + CLK_TOLERANCE_HZ)
-			return MODE_CLOCK_RANGE;
+
+		ret = drm_mode_validate_mode(mode, px_clock_hz);
+		if (ret)
+			return ret;
 
 		/* sync packets are codes as DSI short packets (4 bytes) */
 		dsi_short_packet_size_px = DIV_ROUND_UP(4 * BITS_PER_BYTE, bpp);

</pre>
    </blockquote>
  </body>
</html>

--------------fm1QeVWYE62CKalF086024nC--

--===============1803269647509483484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1803269647509483484==--
