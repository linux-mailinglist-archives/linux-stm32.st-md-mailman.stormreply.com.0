Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEFE9D9356
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 09:34:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46E24C71292;
	Tue, 26 Nov 2024 08:34:45 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC6DDC78F7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2024 13:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID;
 bh=Fxz5Fki1U5+hxMHiHWwSLT/o9JnSwind+K7SOw8JtPg=; b=SeTmP87Ulssn1N+zq4bzaecqeE
 a984bOYP2C3jRAFNWKGLoTtJNY/4+PoaZ2BfVzNKGNHz97YFRdA8epnhik12eWD8ImhEn0darPJsD
 tfb/Gx+nMFQjKwNiATZueHa55XOeFS2/gh44Hoya7GDzP5ZpK7ZrSUHL/cV2aJB96ZTL/hoMjUxC+
 vpKSEXzx4gGkOx3omj81UoWPf/eNR30qUeqU8W9JsgyNRMZoDB2NaYS2diNiztXNgbvP9sZSIN03b
 qqbm6aD8catHJy/wkvJ6pv3DghSMdyQr2NiW5AhTe+TTzWSYvX3dCNZP2CBn+VYpS2WAAB6qkAdUN
 bVUXNdDg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1tFZTB-000Ccj-GN; Mon, 25 Nov 2024 14:49:41 +0100
Received: from [185.17.218.86] (helo=zen.localdomain)
 by sslproxy08.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sean@geanix.com>) id 1tFZTA-000A3a-1j;
 Mon, 25 Nov 2024 14:49:40 +0100
From: Sean Nyekjaer <sean@geanix.com>
Date: Mon, 25 Nov 2024 14:49:27 +0100
MIME-Version: 1.0
Message-Id: <20241125-dsi-relax-v2-2-9113419f4a40@geanix.com>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
In-Reply-To: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27468/Mon Nov 25 10:36:56 2024)
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:34:44 +0000
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, Sean Nyekjaer <sean@geanix.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/3] drm/sun4i: use
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Use new helper function for HDMI mode validation

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 drivers/gpu/drm/sun4i/sun4i_rgb.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index dfb6acc42f02efc40f36914e2925510cd8056d0b..4f8100e32769cf31c25f5dd849a18f5b77376090 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -51,14 +51,6 @@ static int sun4i_rgb_get_modes(struct drm_connector *connector)
 	return drm_panel_get_modes(rgb->panel, connector);
 }
 
-/*
- * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
- * CVT spec reuses that tolerance in its examples, so it looks to be a
- * good default tolerance for the EDID-based modes. Define it to 5 per
- * mille to avoid floating point operations.
- */
-#define SUN4I_RGB_DOTCLOCK_TOLERANCE_PER_MILLE	5
-
 static enum drm_mode_status sun4i_rgb_mode_valid(struct drm_encoder *crtc,
 						 const struct drm_display_mode *mode)
 {
@@ -67,8 +59,8 @@ static enum drm_mode_status sun4i_rgb_mode_valid(struct drm_encoder *crtc,
 	u32 hsync = mode->hsync_end - mode->hsync_start;
 	u32 vsync = mode->vsync_end - mode->vsync_start;
 	unsigned long long rate = mode->clock * 1000;
-	unsigned long long lowest, highest;
 	unsigned long long rounded_rate;
+	int ret;
 
 	DRM_DEBUG_DRIVER("Validating modes...\n");
 
@@ -122,15 +114,9 @@ static enum drm_mode_status sun4i_rgb_mode_valid(struct drm_encoder *crtc,
 	tcon->dclk_max_div = 127;
 	rounded_rate = clk_round_rate(tcon->dclk, rate);
 
-	lowest = rate * (1000 - SUN4I_RGB_DOTCLOCK_TOLERANCE_PER_MILLE);
-	do_div(lowest, 1000);
-	if (rounded_rate < lowest)
-		return MODE_CLOCK_LOW;
-
-	highest = rate * (1000 + SUN4I_RGB_DOTCLOCK_TOLERANCE_PER_MILLE);
-	do_div(highest, 1000);
-	if (rounded_rate > highest)
-		return MODE_CLOCK_HIGH;
+	ret = drm_mode_validate_mode(mode, rounded_rate);
+	if (ret)
+		return ret;
 
 out:
 	DRM_DEBUG_DRIVER("Clock rate OK\n");

-- 
2.46.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
