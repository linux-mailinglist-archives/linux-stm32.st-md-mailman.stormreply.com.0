Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 38gDKRzSVGoyfQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 13:55:08 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF674A968
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 13:55:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=redhat.com header.s=mimecast20190719 header.b=cbSfvxuk;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=redhat.com (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0072EC87EB6;
	Mon, 13 Jul 2026 11:55:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37E31C7A83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783943702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iNPubKjBMqN3gTmvYDkvcmawrm5Mwj72gRd4ijQR7wo=;
 b=cbSfvxukz7Nb57tO1lmwcJMKtF6sG5Y1Qft7U7E319IHFozMVJ0U8+l8WeTLG9XY4lAp0N
 fpNfPzbfVRq+uoF5UsDkWGChX2tqiTv0aX5pJIJqlpgZEggIQBVHaY1bV43a65bMej5q3M
 5/8R4JtRD2o01BIjbtAXoEE9A40LcuM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-316-vNmpurXYNa6bs7uAyrgySw-1; Mon,
 13 Jul 2026 07:54:57 -0400
X-MC-Unique: vNmpurXYNa6bs7uAyrgySw-1
X-Mimecast-MFC-AGG-ID: vNmpurXYNa6bs7uAyrgySw_1783943689
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 265081955D98; Mon, 13 Jul 2026 11:54:49 +0000 (UTC)
Received: from [192.168.1.153] (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 464E41800586; Mon, 13 Jul 2026 11:54:35 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 13 Jul 2026 13:53:08 +0200
MIME-Version: 1.0
Message-Id: <20260713-drm_refcount_wiring-v2-5-d3bb61f4bd4d@redhat.com>
References: <20260713-drm_refcount_wiring-v2-0-d3bb61f4bd4d@redhat.com>
In-Reply-To: <20260713-drm_refcount_wiring-v2-0-d3bb61f4bd4d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Linus Walleij <linusw@kernel.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Jingoo Han <jingoohan1@gmail.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Alison Wang <alison.wang@nxp.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783943594; l=10544;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=dzpeOF7sIt4/OTXPktgi6VTN8JiIFkFsUfT9qr3ZGsc=;
 b=GTZrudD6UEdPrnwfxKbrh6LYnSu+4moS+csq9PLxmamwmOpey3SHrVdp4Cw1NF18XT2asYUWL
 /5o3jUmUMIMBF0G2HX7WJZ5BCOeYsD6p9xLxNE+1MBRYjLSN1ZCU0L1
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: whSoRbgW4J_HfIBlomTtt59XfMG3kY5WOrVcz4aeFwU_1783943689
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, Albert Esteve <aesteve@redhat.com>,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 5/5] drm: release panel reference after
 panel bridge creation
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[aesteve@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,intel.com,ideasonboard.com,kwiboo.se,bootlin.com,samsung.com,amarulasolutions.com,oss.nxp.com,pengutronix.de,nxp.com,crapouillou.net,denx.de,agner.ch,glider.be,bp.renesas.com,rock-chips.com,sntech.de,foss.st.com,sholland.org,iki.fi,sys-base.io,nvidia.com];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:laurentiu.palcu@oss.nxp.com,m:l.stach@pengutronix.de,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:paul@crapouillou.net,m:linusw@kernel.org,m:marex@denx.de,m:stefan@agner.ch,m:tomi.valkeinen@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:yannick.fertre@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:philippe.cornu@foss.
 st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@kernel.org,m:samuel@sholland.org,m:jyri.sarha@iki.fi,m:jingoohan1@gmail.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:alison.wang@nxp.com,m:paulk@sys-base.io,m:alain.volmat@foss.st.com,m:rgallaispou@gmail.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:imx@lists.linux.dev,m:aesteve@redhat.com,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[68];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EBF674A968

Update a second batch of drivers calling of_drm_find_panel() or
drm_of_find_panel_or_bridge() to release the lookup reference after
wrapping the panel in a bridge.

Also handle the cases where a panel is found but cannot be used,
dropping the reference immediately in those paths.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/gpu/drm/imx/dcss/dcss-kms.c               |  3 +++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c         |  4 +++-
 drivers/gpu/drm/mcde/mcde_drv.c                   |  1 +
 drivers/gpu/drm/mcde/mcde_dsi.c                   |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                 |  1 +
 drivers/gpu/drm/omapdrm/dss/output.c              |  1 +
 drivers/gpu/drm/pl111/pl111_drv.c                 |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c       |  1 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  1 +
 drivers/gpu/drm/rockchip/rockchip_lvds.c          |  1 +
 drivers/gpu/drm/rockchip/rockchip_rgb.c           |  1 +
 drivers/gpu/drm/stm/ltdc.c                        |  1 +
 drivers/gpu/drm/sun4i/sun4i_tcon.c                |  2 ++
 drivers/gpu/drm/tidss/tidss_kms.c                 | 16 +++++++++++-----
 drivers/gpu/drm/tve200/tve200_drv.c               |  1 +
 16 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 50bd7f36d36dd..01e0c10b6ea1a 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -77,6 +77,9 @@ static int dcss_kms_bridge_connector_init(struct dcss_kms_dev *kms)
 	if (ret)
 		return ret;
 
+	if (panel)
+		drm_panel_put(panel);
+
 	if (!bridge) {
 		dev_err(ddev->dev, "No bridge found %d.\n", ret);
 		return -ENODEV;
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 42c86f195c66b..1887e01d29701 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1297,9 +1297,11 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 			goto err_drvdata;
 		}
 
-		if (panel)
+		if (panel) {
 			bridge = devm_drm_panel_bridge_add_typed(dev, panel,
 								 DRM_MODE_CONNECTOR_DPI);
+			drm_panel_put(panel);
+		}
 
 		ib = drmm_encoder_alloc(drm, struct ingenic_drm_bridge, encoder,
 					NULL, DRM_MODE_ENCODER_DPI, NULL);
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5f2c462bad7e1..53275b575f0cb 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -153,6 +153,7 @@ static int mcde_modeset_init(struct drm_device *drm)
 		if (panel) {
 			bridge = drm_panel_bridge_add_typed(panel,
 					DRM_MODE_CONNECTOR_DPI);
+			drm_panel_put(panel);
 			if (IS_ERR(bridge)) {
 				dev_err(drm->dev,
 					"Could not connect panel bridge\n");
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 47d45897ed069..d9a454f226f79 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1124,6 +1124,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 	if (panel) {
 		bridge = drm_panel_bridge_add_typed(panel,
 						    DRM_MODE_CONNECTOR_DSI);
+		drm_panel_put(panel);
 		if (IS_ERR(bridge)) {
 			dev_err(dev, "error adding panel bridge\n");
 			return PTR_ERR(bridge);
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 0b756da2fec22..bfcdc0c237ee1 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -128,6 +128,7 @@ static int mxsfb_attach_bridge(struct mxsfb_drm_private *mxsfb)
 	if (panel) {
 		bridge = devm_drm_panel_bridge_add_typed(drm->dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
+		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return PTR_ERR(bridge);
 	}
diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
index ca891aba38209..6e9bc605ee22f 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -43,6 +43,7 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 		struct drm_bridge *bridge;
 
 		bridge = drm_panel_bridge_add(out->panel);
+		drm_panel_put(out->panel);
 		if (IS_ERR(bridge)) {
 			dev_err(out->dev,
 				"unable to create panel bridge (%ld)\n",
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index ac7b1d12a0f59..8ec659b3c08eb 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -145,6 +145,7 @@ static int pl111_modeset_init(struct drm_device *dev)
 	if (panel) {
 		bridge = drm_panel_bridge_add_typed(panel,
 						    DRM_MODE_CONNECTOR_Unknown);
+		drm_panel_put(panel);
 		if (IS_ERR(bridge)) {
 			ret = PTR_ERR(bridge);
 			goto finish;
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
index db2088529b480..d8e7e9877ba86 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
@@ -69,6 +69,7 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 
 		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
+		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return PTR_ERR(no_free_ptr(bridge));
 
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index 154410745a74b..cc2996f044721 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -791,6 +791,7 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 	if (lvds->panel) {
 		lvds->next_bridge = devm_drm_panel_bridge_add(lvds->dev,
 							      lvds->panel);
+		drm_panel_put(lvds->panel);
 		if (IS_ERR_OR_NULL(lvds->next_bridge)) {
 			ret = -EINVAL;
 			goto done;
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index f50d166b764f5..3d0999e4fcfdf 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -90,6 +90,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 
 		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
+		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return PTR_ERR(no_free_ptr(bridge));
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 7a0c4fa29f2f0..f754445d2631b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -605,6 +605,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 
 	if (lvds->panel) {
 		lvds->bridge = drm_panel_bridge_add_typed(lvds->panel, DRM_MODE_CONNECTOR_LVDS);
+		drm_panel_put(lvds->panel);
 		if (IS_ERR(lvds->bridge)) {
 			ret = PTR_ERR(lvds->bridge);
 			goto err_free_encoder;
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index add3123e5ce70..ea66c70013787 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -139,6 +139,7 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 	if (panel) {
 		bridge = drm_panel_bridge_add_typed(panel,
 						    DRM_MODE_CONNECTOR_LVDS);
+		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return ERR_CAST(bridge);
 	}
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 95fcfa48d8be3..daf198edb42f5 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1982,6 +1982,7 @@ int ltdc_load(struct drm_device *ddev)
 
 		if (panel) {
 			bridge = drmm_panel_bridge_add(ddev, panel);
+			drm_panel_put(panel);
 			if (IS_ERR(bridge)) {
 				drm_err(ddev, "panel-bridge endpoint %d\n", i);
 				ret = PTR_ERR(bridge);
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c8291da..d4c1723c5e3d8 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1326,6 +1326,8 @@ static int sun4i_tcon_probe(struct platform_device *pdev)
 		ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
 		if (ret == -EPROBE_DEFER)
 			return ret;
+		if (panel)
+			drm_panel_put(panel);
 	}
 
 	return component_add(&pdev->dev, &sun4i_tcon_ops);
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 1512ee2574b66..70c14c3be10d5 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -162,6 +162,7 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 
 		if (panel) {
 			u32 conn_type;
+			int ret;
 
 			dev_dbg(dev, "Setting up panel for port %d\n", i);
 
@@ -176,7 +177,8 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 				break;
 			default:
 				WARN_ON(1);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto put_panel;
 			}
 
 			if (panel->connector_type != conn_type) {
@@ -184,16 +186,20 @@ static int tidss_dispc_modeset_init(struct tidss_device *tidss)
 					"%s: Panel %s has incompatible connector type for vp%d (%d != %d)\n",
 					 __func__, dev_name(panel->dev), i,
 					 panel->connector_type, conn_type);
-				return -EINVAL;
+				ret = -EINVAL;
+				goto put_panel;
 			}
 
 			bridge = devm_drm_panel_bridge_add(dev, panel);
-			if (IS_ERR(bridge)) {
+			ret = PTR_ERR_OR_ZERO(bridge);
+			if (ret)
 				dev_err(dev,
 					"failed to set up panel bridge for port %d\n",
 					i);
-				return PTR_ERR(bridge);
-			}
+put_panel:
+			drm_panel_put(panel);
+			if (ret)
+				return ret;
 		}
 
 		pipes[num_pipes].hw_videoport = i;
diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 562f3f11812a3..f858c58ccb994 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -84,6 +84,7 @@ static int tve200_modeset_init(struct drm_device *dev)
 	if (panel) {
 		bridge = drm_panel_bridge_add_typed(panel,
 						    DRM_MODE_CONNECTOR_Unknown);
+		drm_panel_put(panel);
 		if (IS_ERR(bridge)) {
 			ret = PTR_ERR(bridge);
 			goto out_bridge;

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
