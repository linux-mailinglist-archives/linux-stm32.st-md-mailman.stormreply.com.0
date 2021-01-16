Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F542F8DB4
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Jan 2021 17:52:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45528C57190;
	Sat, 16 Jan 2021 16:52:05 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C33FC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Jan 2021 16:52:03 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DJ3xF737wz1qs3T;
 Sat, 16 Jan 2021 17:52:01 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DJ3xF5zb0z1qqkg;
 Sat, 16 Jan 2021 17:52:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Wo3tq_RcjmrA; Sat, 16 Jan 2021 17:52:00 +0100 (CET)
X-Auth-Info: 7PAuz8GJZ2oBWNNFuOY1vaIzw4Q+JRgd/G+8z7waxIo=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 16 Jan 2021 17:52:00 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Date: Sat, 16 Jan 2021 17:51:43 +0100
Message-Id: <20210116165143.40680-1-marex@denx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@st.com>
Subject: [Linux-stm32] [PATCH V3] drm/stm: Fix bus_flags handling
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

The drm_display_mode_to_videomode() does not populate DISPLAY_FLAGS_DE_LOW
or DISPLAY_FLAGS_PIXDATA_NEGEDGE flags in struct videomode. Therefore, no
matter what polarity the next bridge or display might require, these flags
are never set, and thus the LTDC GCR_DEPOL and GCR_PCPOL bits are never set,
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
---
V2: Check if ldev->bridge->timings is non-NULL before accessing it
V3: get bus_flags from connector (from Yannick)
    - Display controller could support several connectors (not connected at
      the same time). ie: stm32mp15c-DK2 board have 2 connectors (HDMI + DSI).
      Driver check which connector is connected to get the bus flag.
---
 drivers/gpu/drm/stm/ltdc.c | 28 ++++++++++++++++++++++++++--
 drivers/gpu/drm/stm/ltdc.h |  2 ++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 7812094f93d6..b9cd2dc114cd 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -525,13 +525,25 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
 	struct drm_device *ddev = crtc->dev;
+	struct drm_connector_list_iter iter;
+	struct drm_connector *connector;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct videomode vm;
+	u32 bus_flags = 0;
 	u32 hsync, vsync, accum_hbp, accum_vbp, accum_act_w, accum_act_h;
 	u32 total_width, total_height;
 	u32 val;
 	int ret;
 
+	/* Get the connector which is connected */
+	drm_connector_list_iter_begin(ddev, &iter);
+	drm_for_each_connector_iter(connector, &iter)
+		if(connector->status == connector_status_connected)
+			break;
+	drm_connector_list_iter_end(&iter);
+
+	bus_flags = connector->display_info.bus_flags;
+
 	if (!pm_runtime_active(ddev->dev)) {
 		ret = pm_runtime_get_sync(ddev->dev);
 		if (ret) {
@@ -567,10 +579,10 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	if (vm.flags & DISPLAY_FLAGS_VSYNC_HIGH)
 		val |= GCR_VSPOL;
 
-	if (vm.flags & DISPLAY_FLAGS_DE_LOW)
+	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
 		val |= GCR_DEPOL;
 
-	if (vm.flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
 		val |= GCR_PCPOL;
 
 	reg_update_bits(ldev->regs, LTDC_GCR,
@@ -1078,6 +1090,8 @@ static const struct drm_encoder_helper_funcs ltdc_encoder_helper_funcs = {
 
 static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
 {
+	struct ltdc_device *ldev = ddev->dev_private;
+	struct drm_connector_list_iter iter;
 	struct drm_encoder *encoder;
 	int ret;
 
@@ -1099,6 +1113,16 @@ static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
 		return -EINVAL;
 	}
 
+	ldev->bridge = bridge;
+
+	/*
+	 * Get hold of the connector. This is a bit of a hack, until the bridge
+	 * API gives us bus flags and formats.
+	 */
+	drm_connector_list_iter_begin(ddev, &iter);
+	ldev->connector = drm_connector_list_iter_next(&iter);
+	drm_connector_list_iter_end(&iter);
+
 	DRM_DEBUG_DRIVER("Bridge encoder:%d created\n", encoder->base.id);
 
 	return 0;
diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
index f153b908c70e..d0d2c81de29a 100644
--- a/drivers/gpu/drm/stm/ltdc.h
+++ b/drivers/gpu/drm/stm/ltdc.h
@@ -38,6 +38,8 @@ struct ltdc_device {
 	u32 irq_status;
 	struct fps_info plane_fpsi[LTDC_MAX_LAYER];
 	struct drm_atomic_state *suspend_state;
+	struct drm_bridge *bridge;
+	struct drm_connector *connector;
 };
 
 int ltdc_load(struct drm_device *ddev);
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
