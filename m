Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7F37C2BC
	for <lists+linux-stm32@lfdr.de>; Wed, 12 May 2021 17:13:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 729EDC57B74;
	Wed, 12 May 2021 15:13:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F7E9C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 May 2021 15:13:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5013E61C27;
 Wed, 12 May 2021 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620832435;
 bh=M6wxldWro+LDiAbiNlw5P8o2FCKwC5wvXY9QUtYVyeU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p74zlJoKiW5FUS3ZCw3NiYIpa6dwk2FpJRyFy9Z2gDju0kwYxkghT4XUHrEp0MOXk
 Db6CXN8LqGAk5tOIOEE9o1WoPmGaX7hMPaRfXhfagCih1q02OIIDhO/0TepczEb9gh
 GcVaPG9qkiyFFiiSOQPyvpRRWuYQOQSsA0VsyMUQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Date: Wed, 12 May 2021 16:46:28 +0200
Message-Id: <20210512144828.945976888@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512144819.664462530@linuxfoundation.org>
References: <20210512144819.664462530@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Sasha Levin <sashal@kernel.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Antonio Borneo <antonio.borneo@st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@st.com>, stable@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [Linux-stm32] [PATCH 5.10 278/530] drm/stm: Fix bus_flags handling
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

From: Marek Vasut <marex@denx.de>

[ Upstream commit 99e360442f223dd40fc23ae07c7a263836fd27e6 ]

The drm_display_mode_to_videomode() does not populate DISPLAY_FLAGS_DE_LOW
or DISPLAY_FLAGS_PIXDATA_NEGEDGE flags in struct videomode. Therefore, no
matter what polarity the next bridge or display might require, these flags
are never set, and thus the LTDC GCR_DEPOL and GCR_PCPOL bits are never set
and the LTDC behaves as if both DISPLAY_FLAGS_PIXDATA_POSEDGE and
DISPLAY_FLAGS_DE_HIGH were always set.

The fix for this problem is taken almost verbatim from MXSFB driver. In
case there is a bridge attached to the LTDC, the bridge might have extra
polarity requirements, so extract bus_flags from the bridge and use them
for LTDC configuration. Otherwise, extract bus_flags from the connector,
which is the display.

Fixes: b759012c5fa7 ("drm/stm: Add STM32 LTDC driver")
Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Antonio Borneo <antonio.borneo@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Philippe Cornu <philippe.cornu@st.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: dri-devel@lists.freedesktop.org
Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>
Signed-off-by: Philippe Cornu <philippe.cornu@foss.st.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210127110756.125570-1-marex@denx.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/stm/ltdc.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 6e28f707092f..62488ac14923 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -525,13 +525,42 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
 	struct drm_device *ddev = crtc->dev;
+	struct drm_connector_list_iter iter;
+	struct drm_connector *connector = NULL;
+	struct drm_encoder *encoder = NULL;
+	struct drm_bridge *bridge = NULL;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct videomode vm;
 	u32 hsync, vsync, accum_hbp, accum_vbp, accum_act_w, accum_act_h;
 	u32 total_width, total_height;
+	u32 bus_flags = 0;
 	u32 val;
 	int ret;
 
+	/* get encoder from crtc */
+	drm_for_each_encoder(encoder, ddev)
+		if (encoder->crtc == crtc)
+			break;
+
+	if (encoder) {
+		/* get bridge from encoder */
+		list_for_each_entry(bridge, &encoder->bridge_chain, chain_node)
+			if (bridge->encoder == encoder)
+				break;
+
+		/* Get the connector from encoder */
+		drm_connector_list_iter_begin(ddev, &iter);
+		drm_for_each_connector_iter(connector, &iter)
+			if (connector->encoder == encoder)
+				break;
+		drm_connector_list_iter_end(&iter);
+	}
+
+	if (bridge && bridge->timings)
+		bus_flags = bridge->timings->input_bus_flags;
+	else if (connector)
+		bus_flags = connector->display_info.bus_flags;
+
 	if (!pm_runtime_active(ddev->dev)) {
 		ret = pm_runtime_get_sync(ddev->dev);
 		if (ret) {
@@ -567,10 +596,10 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	if (vm.flags & DISPLAY_FLAGS_VSYNC_HIGH)
 		val |= GCR_VSPOL;
 
-	if (vm.flags & DISPLAY_FLAGS_DE_LOW)
+	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
 		val |= GCR_DEPOL;
 
-	if (vm.flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
 		val |= GCR_PCPOL;
 
 	reg_update_bits(ldev->regs, LTDC_GCR,
-- 
2.30.2



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
