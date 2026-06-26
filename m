Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wu0WNpARQmrDzgkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 08:32:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADBA6D65A7
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jun 2026 08:32:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=redhat.com header.s=mimecast20190719 header.b="D/iIUzHo";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=redhat.com (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80E9DC57A51;
	Mon, 29 Jun 2026 06:25:44 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14D7DC424DB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2026 12:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782475436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LfhkIZ+POWtPSh2+rwXD0iwa5BFBBS0Sxs/FAHKJy0U=;
 b=D/iIUzHod4xe4KNGcCj2Qp7yNnvMZg45GKylQn5AkpB+huIIVbfERx6M8J4UUy8/JmJq3F
 +OtUoHf9YYfyKPooY6iJGbIj2P843K7WRevlVXQmwZ1dTAVczqP+2QyJgxHqCLRHBgnnX9
 A+82KQjs9DafH/zTpIz4Hqf2OMyV0nk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-54-xWLmiDgrOviGl4k2RVffeg-1; Fri,
 26 Jun 2026 08:03:53 -0400
X-MC-Unique: xWLmiDgrOviGl4k2RVffeg-1
X-Mimecast-MFC-AGG-ID: xWLmiDgrOviGl4k2RVffeg_1782475431
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 95CC018004D4; Fri, 26 Jun 2026 12:03:49 +0000 (UTC)
Received: from [192.168.1.153] (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C2A7518005B1; Fri, 26 Jun 2026 12:03:30 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 14:03:22 +0200
Message-Id: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWwqAIBAAryL7naCVSV0lIsK22o801l4Q3T3pc
 2BmHojIhBEa8QDjSZGCT6AzAW4Z/IySxsSQq7xSRhdy5LVnnFw4/N5fxORnWaJBayzWqrSQyi0
 JdP/XtnvfD+CBweFlAAAA
X-Change-ID: 20260513-drm_refcount_wiring-4e5e757e9047
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782475410; l=4786;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=3BTWjIQGw6v603+MK6ywCULt+2ytc2OqbIhP38SSlXQ=;
 b=vLL8Ben9S7G7GBfAV5/dY7850AeH1O/rgqMk5FTgeHqnK1BhJ7ibVh3+QUe2vagwJMCyn90Tw
 qkWv9Fv/F5lBvW13X7zWOmhYBwLKK2ZIdvy06sPHln5E/gzS8WLH1Bj
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: z32BC_NeT7N2rCtssHGScxDNfYizoCVuwuAgATtNoUk_1782475431
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Mon, 29 Jun 2026 06:25:42 +0000
Cc: imx@lists.linux.dev, Albert Esteve <aesteve@redhat.com>,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/5] drm/panel: refcounting panel lookups and
	references
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[aesteve@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:laurentiu.palcu@oss.nxp.com,m:l.stach@pengutronix.de,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:paul@crapouillou.net,m:linusw@kernel.org,m:marex@denx.de,m:stefan@agner.ch,m:tomi.valkeinen@ideasonboard.com,m:laurent.pinchart+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:yannick.fertre@foss.st.com,m:raphael.gallais-pou@foss.st.com,m:philippe.cornu@foss.
 st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@kernel.org,m:samuel@sholland.org,m:jyri.sarha@iki.fi,m:jingoohan1@gmail.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:alison.wang@nxp.com,m:paulk@sys-base.io,m:alain.volmat@foss.st.com,m:rgallaispou@gmail.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:imx@lists.linux.dev,m:aesteve@redhat.com,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-tegra@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:jernejskrabec@gmail.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9ADBA6D65A7

The drm_panel subsystem provides kref-based reference counting [1]
(drm_panel_get/put) but almost nothing in the tree actually uses it.
This results in a systemic use-after-free pattern throughout the codebase.

This series aims to close all those issues.

Patches 1-2: fix the infrastructure. drm_panel_add/remove now keep
a counted reference for the list entry. drm_panel_bridge_add_typed()
now holds a counted reference for the lifetime of the panel_bridge.

Patch 3: change the semantics of of_drm_find_panel() and
find_panel_by_fwnode(). They now acquire a reference before returning,
under panel_lock. Callers are responsible for calling drm_panel_put()
when they no longer need the pointer.

Patches 4-5: update all in-tree callers of of_drm_find_panel() and
drm_of_find_panel_or_bridge() to release the reference at the
appropriate point. Two patterns are repeated in these fixes:

- Bridge-wrapping: the panel is passed to devm_drm_panel_bridge_add()
  or equivalent, which acquires its own reference. The caller (including
  devm_drm_of_get_bridge() and drmm_of_get_bridge()) releases its lookup
  reference immediately after.
- Store-and-use: the panel pointer is kept in a driver struct and
  used directly for the device lifetime. The reference is released in the
  remove/unbind path, or via devm_add_action_or_reset() where no explicit
  teardown function exists.

In order to catch all places in the tree that required releasing the
reference, the search was assisted by an AI model. Specifically, a
Coccinelle script was designed to address the trivial changes (not
included in the series). Although a few required manual fixes, with goto
labels or bracket additions. Additionally, the model helped to discern implicit
teardown paths that were addressed with devm_add_action_or_reset() calls.
Thus, these commits have the Assisted-by label following the project guidelines.

No functional change is intended for any driver. The reference
counting only affects object lifetime; panel operations are unaffected.

[1] https://lore.kernel.org/all/20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com/

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
Albert Esteve (5):
      drm/panel: have drm_panel_add/remove manage a list reference
      drm/bridge/panel: hold a reference to the wrapped panel
      drm/panel: make *find_panel*() return a counted reference
      drm/bridge: release panel reference on all lookup exit paths
      drm: release panel reference after panel bridge creation

 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  3 +++
 drivers/gpu/drm/bridge/panel.c                     | 18 ++++++++++++----
 drivers/gpu/drm/drm_panel.c                        | 24 +++++++++++++++++-----
 drivers/gpu/drm/exynos/exynos_dp.c                 | 10 +++++++++
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |  3 +++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          | 18 ++++++++++++++++
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |  3 +++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  4 +++-
 drivers/gpu/drm/logicvc/logicvc_interface.c        | 12 +++++++++++
 drivers/gpu/drm/mcde/mcde_drv.c                    |  1 +
 drivers/gpu/drm/mcde/mcde_dsi.c                    |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |  1 +
 drivers/gpu/drm/omapdrm/dss/output.c               |  1 +
 drivers/gpu/drm/pl111/pl111_drv.c                  |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c  |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |  1 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   |  1 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 11 ++++++++++
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |  1 +
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |  1 +
 drivers/gpu/drm/sti/sti_dvo.c                      |  3 +++
 drivers/gpu/drm/stm/ltdc.c                         |  1 +
 drivers/gpu/drm/stm/lvds.c                         |  3 +++
 drivers/gpu/drm/sun4i/sun4i_lvds.c                 | 13 ++++++++++++
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  | 13 ++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |  2 ++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |  2 ++
 drivers/gpu/drm/tegra/dsi.c                        |  1 +
 drivers/gpu/drm/tegra/output.c                     |  3 +++
 drivers/gpu/drm/tidss/tidss_kms.c                  | 16 ++++++++++-----
 drivers/gpu/drm/tve200/tve200_drv.c                |  1 +
 31 files changed, 159 insertions(+), 15 deletions(-)
---
base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
change-id: 20260513-drm_refcount_wiring-4e5e757e9047

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
