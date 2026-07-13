Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GcIBFvjRVGojfQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 13:54:32 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF90774A937
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2026 13:54:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=redhat.com header.s=mimecast20190719 header.b=Kllev8xJ;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=redhat.com (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2632C8F274;
	Mon, 13 Jul 2026 11:54:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57A4EC7A83C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2026 11:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783943669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Q5VowINj2yU54368FNGAMpi2UxsPxgNkM0hkGifsc8=;
 b=Kllev8xJRfFMNyHSR56peGGOgA+gVCUpAGPUYZaxCaBUGZShaH6QvT/1RPmdsYhYV4eoq0
 6WyYzTDc/xVPhR2dw2z/6RjVuYXFlOde3INEhY92aYTrBCe1xd5XqHfvDfy2a4unshUjtp
 /DBYPXKq5UkL6Pu9wDh7DNTGN5dtb6M=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-GtD5X-FANaS0mdA-0SGRaw-1; Mon,
 13 Jul 2026 07:54:23 -0400
X-MC-Unique: GtD5X-FANaS0mdA-0SGRaw-1
X-Mimecast-MFC-AGG-ID: GtD5X-FANaS0mdA-0SGRaw_1783943661
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 632B718052E3; Mon, 13 Jul 2026 11:54:21 +0000 (UTC)
Received: from [192.168.1.153] (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DA3051800598; Mon, 13 Jul 2026 11:54:06 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 13 Jul 2026 13:53:06 +0200
MIME-Version: 1.0
Message-Id: <20260713-drm_refcount_wiring-v2-3-d3bb61f4bd4d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783943594; l=14844;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=C9hytV/WNG6Ap25BpMyeNrBHlKSUexgcfqP7CuoqfAE=;
 b=jowyFI3R17ujw461VNkIiwW6hauoRj3AdxrjqhlBgzyDKDalUIhjlSK5NlYNqSQl+zN6S8L5y
 O+40NxFXujbCEz+BB2GSVuLeibMjiAy3q1F+c2/7pIPI7RXRfyAwe+H
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: -QiP2YI5GhPlP1MglcdISCnqcFbawyiu9oOwDreSkEw_1783943661
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, Albert Esteve <aesteve@redhat.com>,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/5] drm/panel: of_drm_find_panel() return
 a counted reference
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF90774A937

Callers of of_drm_find_panel() receive a pointer with no reference
held, creating a window where the panel device can be unregistered
and freed between the lookup and first use (e.g., drm_panel_prepare()).

Fix the lookup function by acquiring a reference with drm_panel_get()
before returning, under panel_lock. Callers are now responsible for
calling drm_panel_put() when they no longer need the pointer.

For bridge drivers that immediately wrap the panel in a panel_bridge
(which acquires its own reference), release the lookup reference right
after the bridge creation call.

For analogix-anx6345, which stores the panel for direct use, release
the reference in the i2c remove path.

For platform drivers using analogix_dp_core with a component lifecycle
(exynos_dp, rockchip analogix_dp), release the lookup reference in the
platform remove() function. The panel_bridge created during bind() holds
a separate reference that devm cleanup releases after remove() returns.

Also fix devm_drm_of_get_bridge() and drmm_of_get_bridge() in
bridge/panel.c itself: both call drm_of_find_panel_or_bridge() and
then pass the panel to devm/drmm_panel_bridge_add(), which acquires
its own reference via drm_panel_bridge_add_typed(). The lookup
reference was never released; add drm_panel_put() after each bridge
creation call.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  3 +++
 drivers/gpu/drm/bridge/panel.c                     |  8 ++++++--
 drivers/gpu/drm/drm_of.c                           |  3 ++-
 drivers/gpu/drm/drm_panel.c                        | 12 ++++++++----
 drivers/gpu/drm/exynos/exynos_dp.c                 | 10 ++++++++++
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |  3 +++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          | 18 ++++++++++++++++++
 drivers/gpu/drm/logicvc/logicvc_interface.c        | 12 ++++++++++++
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 11 +++++++++++
 drivers/gpu/drm/sti/sti_dvo.c                      |  3 +++
 drivers/gpu/drm/stm/lvds.c                         |  3 +++
 drivers/gpu/drm/sun4i/sun4i_lvds.c                 | 13 +++++++++++++
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  | 13 +++++++++++++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |  2 ++
 drivers/gpu/drm/tegra/dsi.c                        |  1 +
 drivers/gpu/drm/tegra/output.c                     |  3 +++
 16 files changed, 111 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index f3fe47b12edca..1fe11b075f860 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -756,6 +756,9 @@ static void anx6345_i2c_remove(struct i2c_client *client)
 {
 	struct anx6345 *anx6345 = i2c_get_clientdata(client);
 
+	if (anx6345->panel)
+		drm_panel_put(anx6345->panel);
+
 	drm_bridge_remove(&anx6345->bridge);
 
 	unregister_i2c_dummy_clients(anx6345);
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 6b98ad19508df..04b53ae698e5b 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -513,8 +513,10 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (panel)
+	if (panel) {
 		bridge = devm_drm_panel_bridge_add(dev, panel);
+		drm_panel_put(panel);
+	}
 
 	return bridge;
 }
@@ -547,8 +549,10 @@ struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (panel)
+	if (panel) {
 		bridge = drmm_panel_bridge_add(drm, panel);
+		drm_panel_put(panel);
+	}
 
 	return bridge;
 }
diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index d03ada82eac96..1873a84514a68 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -225,7 +225,8 @@ EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
  * @np: device tree node containing encoder output ports
  * @port: port in the device tree node
  * @endpoint: endpoint in the device tree node
- * @panel: pointer to hold returned drm_panel, must not be NULL
+ * @panel: pointer to hold returned drm_panel, must not be NULL. On success
+ *         the caller must call drm_panel_put() when done with the panel
  * @bridge: pointer to hold returned drm_bridge
  *
  * Given a DT node's port and endpoint number, find the connected node and
diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 545fe93dc28fe..72cf86253c0cd 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -458,14 +458,17 @@ EXPORT_SYMBOL(__devm_drm_panel_alloc);
 
 #ifdef CONFIG_OF
 /**
- * of_drm_find_panel - look up a panel using a device tree node
+ * of_drm_find_panel - look up and reference a panel by device tree node
  * @np: device tree node of the panel
  *
  * Searches the set of registered panels for one that matches the given device
- * tree node. If a matching panel is found, return a pointer to it.
+ * tree node. If a matching panel is found, the panel's reference count is
+ * incremented before returning a pointer to it. The caller must call
+ * drm_panel_put() when it no longer needs the panel pointer.
  *
- * Return: A pointer to the panel registered for the specified device tree
- * node or an ERR_PTR() if no panel matching the device tree node can be found.
+ * Return: A reference-counted pointer to the panel registered for the specified
+ * device tree node or an ERR_PTR() if no panel matching the device tree node
+ * can be found.
  *
  * Possible error codes returned by this function:
  *
@@ -484,6 +487,7 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 
 	list_for_each_entry(panel, &panel_list, list) {
 		if (panel->dev->of_node == np) {
+			drm_panel_get(panel);
 			mutex_unlock(&panel_lock);
 			return panel;
 		}
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index b805403281504..14f5b1b452506 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -193,6 +193,16 @@ static int exynos_dp_probe(struct platform_device *pdev)
 
 static void exynos_dp_remove(struct platform_device *pdev)
 {
+	struct exynos_dp_device *dp = platform_get_drvdata(pdev);
+
+	/*
+	 * Release the probe-time reference from of_drm_find_panel(). If bind
+	 * ran, the panel_bridge holds a second reference that devm cleanup
+	 * will release when the bridge is destroyed after remove() returns.
+	 */
+	if (dp->plat_data.panel)
+		drm_panel_put(dp->plat_data.panel);
+
 	component_del(&pdev->dev, &exynos_dp_ops);
 }
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 0dc36df6ada34..9d15a0035ea99 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -245,5 +245,8 @@ int exynos_dpi_remove(struct drm_encoder *encoder)
 
 	exynos_dpi_disable(&ctx->encoder);
 
+	if (ctx->panel)
+		drm_panel_put(ctx->panel);
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
index 84eff7519e322..ec71fbbb0eb89 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
@@ -109,6 +109,13 @@ static int fsl_dcu_attach_panel(struct fsl_dcu_drm_device *fsl_dev,
 	return ret;
 }
 
+static void fsl_dcu_panel_put_action(void *data)
+{
+	struct drm_panel *panel = data;
+
+	drm_panel_put(panel);
+}
+
 int fsl_dcu_create_outputs(struct fsl_dcu_drm_device *fsl_dev)
 {
 	struct device_node *panel_node;
@@ -124,6 +131,12 @@ int fsl_dcu_create_outputs(struct fsl_dcu_drm_device *fsl_dev)
 		if (IS_ERR(fsl_dev->connector.panel))
 			return PTR_ERR(fsl_dev->connector.panel);
 
+		ret = devm_add_action_or_reset(fsl_dev->dev,
+					       fsl_dcu_panel_put_action,
+					       fsl_dev->connector.panel);
+		if (ret)
+			return ret;
+
 		return fsl_dcu_attach_panel(fsl_dev, fsl_dev->connector.panel);
 	}
 
@@ -132,6 +145,11 @@ int fsl_dcu_create_outputs(struct fsl_dcu_drm_device *fsl_dev)
 		return ret;
 
 	if (panel) {
+		ret = devm_add_action_or_reset(fsl_dev->dev,
+					       fsl_dcu_panel_put_action, panel);
+		if (ret)
+			return ret;
+
 		fsl_dev->connector.panel = panel;
 		return fsl_dcu_attach_panel(fsl_dev, panel);
 	}
diff --git a/drivers/gpu/drm/logicvc/logicvc_interface.c b/drivers/gpu/drm/logicvc/logicvc_interface.c
index 689049d395c0d..81f760dc07f8d 100644
--- a/drivers/gpu/drm/logicvc/logicvc_interface.c
+++ b/drivers/gpu/drm/logicvc/logicvc_interface.c
@@ -28,6 +28,11 @@
 #define logicvc_interface_from_drm_connector(c) \
 	container_of(c, struct logicvc_interface, drm_connector)
 
+static void logicvc_panel_put_action(void *data)
+{
+	drm_panel_put(data);
+}
+
 static void logicvc_encoder_enable(struct drm_encoder *drm_encoder)
 {
 	struct logicvc_drm *logicvc = logicvc_drm(drm_encoder->dev);
@@ -160,6 +165,13 @@ int logicvc_interface_init(struct logicvc_drm *logicvc)
 	if (ret == -EPROBE_DEFER)
 		goto error_early;
 
+	if (interface->drm_panel) {
+		ret = devm_add_action_or_reset(dev, logicvc_panel_put_action,
+					       interface->drm_panel);
+		if (ret)
+			goto error_early;
+	}
+
 	ret = drm_encoder_init(drm_dev, &interface->drm_encoder,
 			       &logicvc_encoder_funcs, encoder_type, NULL);
 	if (ret) {
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 06072efd7fca3..4b2795a6caf8c 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -27,6 +27,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/bridge/analogix_dp.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -472,6 +473,16 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 
 static void rockchip_dp_remove(struct platform_device *pdev)
 {
+	struct rockchip_dp_device *dp = platform_get_drvdata(pdev);
+
+	/*
+	 * Release the probe-time reference from of_drm_find_panel(). If bind
+	 * ran, the panel_bridge holds a second reference that devm cleanup
+	 * will release when the bridge is destroyed after remove() returns.
+	 */
+	if (dp->plat_data.panel)
+		drm_panel_put(dp->plat_data.panel);
+
 	component_del(&pdev->dev, &rockchip_dp_component_ops);
 }
 
diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index 7484d3c3f4ed5..64a9da0362fb8 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -492,6 +492,9 @@ static void sti_dvo_unbind(struct device *dev,
 {
 	struct sti_dvo *dvo = dev_get_drvdata(dev);
 
+	if (dvo->panel)
+		drm_panel_put(dvo->panel);
+
 	drm_bridge_remove(&dvo->bridge);
 }
 
diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 50a878688e477..77735e26c56e3 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -1189,6 +1189,9 @@ static void lvds_remove(struct platform_device *pdev)
 {
 	struct stm_lvds *lvds = platform_get_drvdata(pdev);
 
+	if (lvds->panel)
+		drm_panel_put(lvds->panel);
+
 	lvds_pixel_clk_unregister(lvds);
 
 	drm_bridge_remove(&lvds->lvds_bridge);
diff --git a/drivers/gpu/drm/sun4i/sun4i_lvds.c b/drivers/gpu/drm/sun4i/sun4i_lvds.c
index 6716e895ae8a4..e1b342c922224 100644
--- a/drivers/gpu/drm/sun4i/sun4i_lvds.c
+++ b/drivers/gpu/drm/sun4i/sun4i_lvds.c
@@ -18,6 +18,11 @@
 #include "sun4i_tcon.h"
 #include "sun4i_lvds.h"
 
+static void sun4i_panel_put_action(void *data)
+{
+	drm_panel_put(data);
+}
+
 struct sun4i_lvds {
 	struct drm_connector	connector;
 	struct drm_encoder	encoder;
@@ -113,6 +118,14 @@ int sun4i_lvds_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 		return 0;
 	}
 
+	if (lvds->panel) {
+		ret = devm_add_action_or_reset(tcon->dev,
+					       sun4i_panel_put_action,
+					       lvds->panel);
+		if (ret)
+			return ret;
+	}
+
 	drm_encoder_helper_add(&lvds->encoder,
 			       &sun4i_lvds_enc_helper_funcs);
 	ret = drm_simple_encoder_init(drm, &lvds->encoder,
diff --git a/drivers/gpu/drm/sun4i/sun4i_rgb.c b/drivers/gpu/drm/sun4i/sun4i_rgb.c
index dfb6acc42f02e..0066bec5a9e5a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_rgb.c
+++ b/drivers/gpu/drm/sun4i/sun4i_rgb.c
@@ -43,6 +43,11 @@ drm_encoder_to_sun4i_rgb(struct drm_encoder *encoder)
 			    encoder);
 }
 
+static void sun4i_panel_put_action(void *data)
+{
+	drm_panel_put(data);
+}
+
 static int sun4i_rgb_get_modes(struct drm_connector *connector)
 {
 	struct sun4i_rgb *rgb =
@@ -205,6 +210,14 @@ int sun4i_rgb_init(struct drm_device *drm, struct sun4i_tcon *tcon)
 		return 0;
 	}
 
+	if (rgb->panel) {
+		ret = devm_add_action_or_reset(tcon->dev,
+					       sun4i_panel_put_action,
+					       rgb->panel);
+		if (ret)
+			return ret;
+	}
+
 	drm_encoder_helper_add(&rgb->encoder,
 			       &sun4i_rgb_enc_helper_funcs);
 	ret = drm_simple_encoder_init(drm, &rgb->encoder,
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index c35b70d83e53b..1e8bc12fb6d04 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -985,6 +985,8 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
 {
 	struct sun6i_dsi *dsi = host_to_sun6i_dsi(host);
 
+	if (dsi->panel)
+		drm_panel_put(dsi->panel);
 	dsi->panel = NULL;
 	dsi->device = NULL;
 
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 7f25c50621c94..57a016f47434d 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -1516,6 +1516,7 @@ static int tegra_dsi_host_detach(struct mipi_dsi_host *host,
 	struct tegra_output *output = &dsi->output;
 
 	if (output->panel && &device->dev == output->panel->dev) {
+		drm_panel_put(output->panel);
 		output->panel = NULL;
 
 		if (output->connector.dev)
diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 49e4f63a5550d..90db39dbdd332 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -195,6 +195,9 @@ int tegra_output_probe(struct tegra_output *output)
 
 void tegra_output_remove(struct tegra_output *output)
 {
+	if (output->panel)
+		drm_panel_put(output->panel);
+
 	if (output->hpd_gpio)
 		free_irq(output->hpd_irq, output);
 

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
