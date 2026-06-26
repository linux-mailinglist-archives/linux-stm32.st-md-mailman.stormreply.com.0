Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LK13JpARQmq9zgkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 08:32:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEA66D659B
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 08:32:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=redhat.com header.s=mimecast20190719 header.b=XcYrOw8c;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=redhat.com (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFB2EC5F1F7;
	Mon, 29 Jun 2026 06:25:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09009C5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2026 12:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782475471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IoiLuEs0fQtrDpOnJCVPBtcdDOUnvxJak86sNNFtqns=;
 b=XcYrOw8c6rovGmK+WC9uHfzAvUEtxv8kFubOF/BXC7DNukmHAr5K+G6akc0EOBE907qsJt
 AYPoliBrMt5lc+Lu+nebx/kX4d6xF04ULkn6mgBQWGGluLP2B/Whcd2PqPAX4tMzD6GPA/
 5T5VQ8iRHk8JGdmdsnwQ+D1sCh+h5mY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-133-obkrNjJXOfaQH_y9u4g-bw-1; Fri,
 26 Jun 2026 08:04:29 -0400
X-MC-Unique: obkrNjJXOfaQH_y9u4g-bw-1
X-Mimecast-MFC-AGG-ID: obkrNjJXOfaQH_y9u4g-bw_1782475467
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E00D5195604C; Fri, 26 Jun 2026 12:04:25 +0000 (UTC)
Received: from [192.168.1.153] (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ABA2618005B0; Fri, 26 Jun 2026 12:04:06 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 14:03:24 +0200
MIME-Version: 1.0
Message-Id: <20260626-drm_refcount_wiring-v1-2-cca1a7b3bdef@redhat.com>
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
In-Reply-To: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782475410; l=2189;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=k0Fp+8sQr3zfg5u2HHCF4cWKSffOLMXWCbveTegHWXU=;
 b=KRKEPwGIFR+fYjRsq4WpccAKc6oAuWaZ3suxw8Sgu5kRbJ0u4ST8AVVBZZ+YsbxFZk3NnrCwV
 M9fcWkBozA3C3IvwVpPUaw76p6L3npppMomWLgUB+8td46HP2LrfqmC
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 8f25fidIB8HOKt9lbVYo4aHpNX9V1NmQ-vRiDwfOsSU_1782475467
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2026 06:25:43 +0000
Cc: imx@lists.linux.dev, Albert Esteve <aesteve@redhat.com>,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/5] drm/bridge/panel: hold a reference to the
 wrapped panel
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
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[66];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:laurentiu.palcu@oss.nxp.com,m:l.stach@pengutronix.de,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:paul@crapouillou.net,m:linusw@kernel.org,m:marex@denx.de,m:stefan@agner.ch,m:tomi.valkeinen@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:yannick.fertre@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:philippe.cornu@foss.
 st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@kernel.org,m:samuel@sholland.org,m:jyri.sarha@iki.fi,m:jingoohan1@gmail.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:alison.wang@nxp.com,m:paulk@sys-base.io,m:alain.volmat@foss.st.com,m:rgallaispou@gmail.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:imx@lists.linux.dev,m:aesteve@redhat.com,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[aesteve@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,intel.com,ideasonboard.com,kwiboo.se,bootlin.com,samsung.com,amarulasolutions.com,oss.nxp.com,pengutronix.de,nxp.com,crapouillou.net,denx.de,agner.ch,glider.be,bp.renesas.com,rock-chips.com,sntech.de,foss.st.com,sholland.org,iki.fi,sys-base.io,nvidia.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CEA66D659B

drm_panel_bridge_add_typed() stores a pointer to the drm_panel it
wraps, but never acquires a reference to it. If the panel device
goes away while a panel_bridge still exists, the dangling pointer can
be dereferenced through panel_bridge->panel.

Acquire a reference in drm_panel_bridge_add_typed() with drm_panel_get()
and release it in each teardown path.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/gpu/drm/bridge/panel.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 4978ec98a0828..6b98ad19508df 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -294,7 +294,7 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 		return (void *)panel_bridge;
 
 	panel_bridge->connector_type = connector_type;
-	panel_bridge->panel = panel;
+	panel_bridge->panel = drm_panel_get(panel);
 
 	panel_bridge->bridge.of_node = panel->dev->of_node;
 	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
@@ -316,6 +316,7 @@ EXPORT_SYMBOL(drm_panel_bridge_add_typed);
 void drm_panel_bridge_remove(struct drm_bridge *bridge)
 {
 	struct panel_bridge *panel_bridge;
+	struct drm_panel *panel;
 
 	if (!bridge)
 		return;
@@ -326,10 +327,12 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
 	}
 
 	panel_bridge = drm_bridge_to_panel_bridge(bridge);
+	panel = panel_bridge->panel;
 
 	drm_bridge_remove(bridge);
 	/* TODO remove this after reworking panel_bridge lifetime */
-	devm_drm_put_bridge(panel_bridge->panel->dev, bridge);
+	devm_drm_put_bridge(panel->dev, bridge);
+	drm_panel_put(panel);
 }
 EXPORT_SYMBOL(drm_panel_bridge_remove);
 
@@ -357,11 +360,14 @@ EXPORT_SYMBOL(drm_panel_bridge_set_orientation);
 static void devm_drm_panel_bridge_release(struct device *dev, void *res)
 {
 	struct drm_bridge *bridge = *(struct drm_bridge **)res;
+	struct panel_bridge *panel_bridge;
 
 	if (!bridge)
 		return;
 
+	panel_bridge = drm_bridge_to_panel_bridge(bridge);
 	drm_bridge_remove(bridge);
+	drm_panel_put(panel_bridge->panel);
 }
 
 /**

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
