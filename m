Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0499444E1D1
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 07:17:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1AFBC5EC71;
	Fri, 12 Nov 2021 06:17:58 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08327C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 06:17:56 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id q126so7200022pgq.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 22:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wad9gm8CW+7Vaw+M+Mr+ioYMu34NOVqzp5WCaNgwVbY=;
 b=XBsjNUuyVhMdEj6T7LniJnG0Zs5LA+VbgnGBfQb2/yEIovOQ26QS75TvmwcUxYYj8o
 XUZCGeL55EbUVuh9CaFpgRh4eh21p04ASs/2EMfKq1Id1lCT/03sAdEofOeXLGSZNbCK
 T5+569KWt5KyguW/Cg9aGjBEp2scHHKq1mMzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wad9gm8CW+7Vaw+M+Mr+ioYMu34NOVqzp5WCaNgwVbY=;
 b=ZgQ5LJ1z2/IwDEwCZmRF3A4myRDlFzy2aSkXzSbd/YzXzDruHdR6SbYGxq0SLgtp4G
 qtIjxNAxYcNS98iZNXwgDaA+0KUZbUKd4NTAyrHqWuTXY1w8CndtoxljwdzUuSPLgvHy
 4APLXBSGDBeGnheUBPQms+trtJnMo0dVeGeUSXkJ5t3S/+zU1lcvviI7ceDE4U5tT+4/
 b/j6DQHrAhF/gxBT3NQWCeU/dcFBaoCngdPSLzuCaRDN49hceHf+E5oSt/UEXfoFRVzY
 4NboZDm6XwWd1QnIHLYUOPW/GoBG6SWMwjTx7k6waGcHrHFONWwTAim7qj/VshIq7Cxu
 Mrzw==
X-Gm-Message-State: AOAM531skSAPQDvMx2q02zoBFM2nVhK8cLW6xMBRlYiadSQINQLJgS1F
 4gwjjaCqC422eQM3PchIZ+qLKg==
X-Google-Smtp-Source: ABdhPJzccvCuuKTMzT5Xf+4TNMKBG21tNmi42SFsyLthwZSXilj5YfBBc68olJ3IKJ1pgUcov4iMLA==
X-Received: by 2002:a05:6a00:158a:b0:49f:be86:c78f with SMTP id
 u10-20020a056a00158a00b0049fbe86c78fmr12004616pfk.56.1636697875509; 
 Thu, 11 Nov 2021 22:17:55 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:de19:8cdf:97cf:a6b1])
 by smtp.gmail.com with ESMTPSA id p3sm4727856pfb.205.2021.11.11.22.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 22:17:55 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Heiko Stubner <heiko@sntech.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Date: Fri, 12 Nov 2021 11:47:41 +0530
Message-Id: <20211112061741.120898-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Linux-stm32] [PATCH] drm/bridge: dw-mipi-dsi: Switch to atomic
	operations
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

Replace atomic version of the enable/disable operations to
continue the transition to the atomic API.

Also added default drm atomic operations for duplicate, destroy
and reset state API's in order to have smooth transition on
atomic API's.

Tested on Engicam i.Core STM32MP1 SoM.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index e44e18a0112a..ff0db96dfcd5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -871,7 +871,8 @@ static void dw_mipi_dsi_clear_err(struct dw_mipi_dsi *dsi)
 	dsi_write(dsi, DSI_INT_MSK1, 0);
 }
 
-static void dw_mipi_dsi_bridge_post_disable(struct drm_bridge *bridge)
+static void dw_mipi_dsi_bridge_post_atomic_disable(struct drm_bridge *bridge,
+						   struct drm_bridge_state *old_bridge_state)
 {
 	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
 	const struct dw_mipi_dsi_phy_ops *phy_ops = dsi->plat_data->phy_ops;
@@ -978,7 +979,8 @@ static void dw_mipi_dsi_bridge_mode_set(struct drm_bridge *bridge,
 		dw_mipi_dsi_mode_set(dsi->slave, adjusted_mode);
 }
 
-static void dw_mipi_dsi_bridge_enable(struct drm_bridge *bridge)
+static void dw_mipi_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
+					     struct drm_bridge_state *old_bridge_state)
 {
 	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
 
@@ -1032,11 +1034,14 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
-	.mode_set     = dw_mipi_dsi_bridge_mode_set,
-	.enable	      = dw_mipi_dsi_bridge_enable,
-	.post_disable = dw_mipi_dsi_bridge_post_disable,
-	.mode_valid   = dw_mipi_dsi_bridge_mode_valid,
-	.attach	      = dw_mipi_dsi_bridge_attach,
+	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_enable		= dw_mipi_dsi_bridge_atomic_enable,
+	.atomic_post_disable	= dw_mipi_dsi_bridge_post_atomic_disable,
+	.mode_set		= dw_mipi_dsi_bridge_mode_set,
+	.mode_valid		= dw_mipi_dsi_bridge_mode_valid,
+	.attach			= dw_mipi_dsi_bridge_attach,
 };
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
