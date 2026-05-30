Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJyVL17tGmpl9wgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 30 May 2026 15:59:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6698760D12A
	for <lists+linux-stm32@lfdr.de>; Sat, 30 May 2026 15:59:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CA0CC36B3E;
	Sat, 30 May 2026 13:59:57 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE915C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 May 2026 13:59:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5D17743BE8;
 Sat, 30 May 2026 13:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B8D1F00893;
 Sat, 30 May 2026 13:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780149594;
 bh=EAA8Cng1tHiDU71Bsnv2nxNHGPA4F8O7/bGrv/TxoZk=;
 h=From:Subject:Date:To:Cc;
 b=ouUSjMcxP/WdDHjzVwSe7/7fquFllZ3T/M9TzeCFtsaHT2/kqwyEnNXAnkjMLLdOC
 MZWVPhCAb84+ys3Xx2DKlMbbfkwNOIu/47XLsThWBXS9pGjPf2x8RMCLg1gwiUd/di
 7SUakavt7Tp94UXcGP8U5s9z17KjwuuSVlqOCK+ihwDvUeGxhGRTwAikYRUjciynvb
 fFfMlaqyYuZP6fJjC7aVNRog+qd3sM5dEclOTM23ZVjvnzSDUwVT2SBiYyL1BjFbak
 SNfcnfAP6xIhbf/56hOgM/rIf9ai2ICy4tcFxy+kW3jdQrbxorCAA5es5TYbew/ZSv
 nmVZQSw2+wpnw==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:05 +0200
Message-Id: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MwQqDQAwFf0VyNpCm2kJ/RTxY92lzcLdkRQTx3
 108DszMQRluyPSpDnJsli3FAo+6ovE3xBlsoTCp6Evap3DwhWPiJTn46xaK4chYeRxUQgvVdyN
 U8r9jsv1ed/15Xjs3gQ9qAAAA
X-Change-ID: 20260530-drm-no-more-bridge-reset-ca20d5e22740
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9737; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5mdpzx6AnIdXlXtHiMk6gtXCaV0Ggi5q17pXlWPT+Uk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb01r+u3jJBcsVzl6eIHvJglnRfPCFSKp/sWLitVe3
 V+atu5ox1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIXRxjwzp9nkOtcyMmtdgd
 a91d0aoc6u5wjM0qR8ZrjsJq7c9muTsb0i1v2+YtftNc7l9/fTYrY8O2eRzqvy5sn3mhruGz9Oy
 CfVVqOiEps4XcVVd6rDiRNvOQW0oEl2zaers8zblFe8+e0wAA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Cc: imx@lists.linux.dev, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Frank Li <Frank.Li@nxp.com>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-rockchip@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sandy Huang <hjc@rock-chips.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Liu Ying <victor.liu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 Inki Dae <inki.dae@samsung.com>, linux-mediatek@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Phong LE <ple@baylibre.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andy Yan <andy.yan@rock-chips.com>, Jyri Sarha <jyri.sarha@iki.fi>
Subject: [Linux-stm32] [PATCH 00/76] drm/bridge: Convert all reset users to
	create_state
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:imx@lists.linux.dev,m:heiko@sntech.de,m:geert+renesas@glider.be,m:tomi.valkeinen@ideasonboard.com,m:Frank.Li@nxp.com,m:dri-devel@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:paul@crapouillou.net,m:biju.das.jz@bp.renesas.com,m:laurent.pinchart@ideasonboard.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:m.szyprowski@samsung.com,m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:linux-rockchip@lists.infradead.org,m:khilman@baylibre.com,m:mcanal@igalia.com,m:magnus.damm@gmail.com,m:martin.blumenstingl@googlemail.com,m:hjc@rock-chips.com,m:jagan@amarulasolutions.com,m:jbrunet@baylibre.com,m:chunkuang.hu@kernel.org,m:kernel@pengu
 tronix.de,m:victor.liu@nxp.com,m:s.hauer@pengutronix.de,m:mripard@kernel.org,m:inki.dae@samsung.com,m:linux-mediatek@lists.infradead.org,m:tomi.valkeinen+renesas@ideasonboard.com,m:matthias.bgg@gmail.com,m:linux-amlogic@lists.infradead.org,m:michal.simek@amd.com,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:mcoquelin.stm32@gmail.com,m:lumag@kernel.org,m:yannick.fertre@foss.st.com,m:dave.stevenson@raspberrypi.com,m:dianders@chromium.org,m:linux-kernel@vger.kernel.org,m:ple@baylibre.com,m:kieran.bingham+renesas@ideasonboard.com,m:zhengxingda@iscas.ac.cn,m:p.zabel@pengutronix.de,m:kernel-list@raspberrypi.com,m:andy.yan@rock-chips.com,m:jyri.sarha@iki.fi,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[mripard@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,sntech.de,glider.be,ideasonboard.com,nxp.com,lists.freedesktop.org,vger.kernel.org,crapouillou.net,bp.renesas.com,gmail.com,st-md-mailman.stormreply.com,samsung.com,lists.infradead.org,baylibre.com,igalia.com,googlemail.com,rock-chips.com,amarulasolutions.com,kernel.org,pengutronix.de,amd.com,collabora.com,foss.st.com,raspberrypi.com,chromium.org,iscas.ac.cn,iki.fi];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[60];
	NEURAL_HAM(-0.00)[-0.553];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 6698760D12A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi, 

All the bridges use reset to create a blank state only and don't use it
to reset the hardware at all. This is what the new atomic_create_state
is exactly supposed to be doing, so we can convert all existing bridge
users to it, and remove the reset hook and helpers.

Let me know what you think,
Maxime 

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (76):
      drm/atomic-state-helper: Rename __drm_atomic_helper_bridge_reset()
      drm/atomic-state-helper: Reorder __drm_atomic_helper_bridge_state_init() arguments
      drm/atomic-state-helper: Drop memset from __drm_atomic_helper_bridge_state_init()
      drm/bridge: Add new atomic_create_state callback
      drm/atomic-state-helper: Add drm_atomic_helper_bridge_create_state()
      drm/bridge: adv7511: Switch to atomic_create_state
      drm/bridge: analogix_dp: Switch to atomic_create_state
      drm/bridge: anx7625: Switch to atomic_create_state
      drm/bridge: chipone-icn6211: Switch to atomic_create_state
      drm/bridge: display-connector: Switch to atomic_create_state
      drm/bridge: fsl-ldb: Switch to atomic_create_state
      drm/bridge: imx8mp-hdmi-pvi: Switch to atomic_create_state
      drm/bridge: imx8qm-ldb: Switch to atomic_create_state
      drm/bridge: imx8qxp-ldb: Switch to atomic_create_state
      drm/bridge: imx8qxp-pixel-combiner: Switch to atomic_create_state
      drm/bridge: imx8qxp-pixel-link: Switch to atomic_create_state
      drm/bridge: imx8qxp-pxl2dpi: Switch to atomic_create_state
      drm/bridge: inno-hdmi: Switch to atomic_create_state
      drm/bridge: ite-it6263: Switch to atomic_create_state
      drm/bridge: ite-it6505: Switch to atomic_create_state
      drm/bridge: ite-it66121: Switch to atomic_create_state
      drm/bridge: lontium-lt9211: Switch to atomic_create_state
      drm/bridge: lontium-lt9611: Switch to atomic_create_state
      drm/bridge: lvds-codec: Switch to atomic_create_state
      drm/bridge: nwl-dsi: Switch to atomic_create_state
      drm/bridge: panel: Switch to atomic_create_state
      drm/bridge: parade-ps8640: Switch to atomic_create_state
      drm/bridge: samsung-dsim: Switch to atomic_create_state
      drm/bridge: sii902x: Switch to atomic_create_state
      drm/bridge: ssd2825: Switch to atomic_create_state
      drm/bridge: dw-dp: Switch to atomic_create_state
      drm/bridge: dw-hdmi-qp: Switch to atomic_create_state
      drm/bridge: dw-hdmi: Switch to atomic_create_state
      drm/bridge: dw-mipi-dsi: Switch to atomic_create_state
      drm/bridge: dw-mipi-dsi2: Switch to atomic_create_state
      drm/bridge: tc358762: Switch to atomic_create_state
      drm/bridge: tc358767: Switch to atomic_create_state
      drm/bridge: tc358768: Switch to atomic_create_state
      drm/bridge: tc358775: Switch to atomic_create_state
      drm/bridge: ti-dlpc3433: Switch to atomic_create_state
      drm/bridge: ti-sn65dsi83: Switch to atomic_create_state
      drm/bridge: ti-sn65dsi86: Switch to atomic_create_state
      drm/bridge: ti-tdp158: Switch to atomic_create_state
      drm/bridge: ti-tfp410: Switch to atomic_create_state
      drm/imx: parallel-display: Switch to atomic_create_state
      drm/ingenic: Switch to atomic_create_state
      drm/mediatek: dp: Switch to atomic_create_state
      drm/mediatek: dpi: Switch to atomic_create_state
      drm/mediatek: dsi: Switch to atomic_create_state
      drm/mediatek: hdmi: Switch to atomic_create_state
      drm/mediatek: hdmi_v2: Switch to atomic_create_state
      drm/meson: encoder_cvbs: Switch to atomic_create_state
      drm/meson: encoder_dsi: Switch to atomic_create_state
      drm/meson: encoder_hdmi: Switch to atomic_create_state
      drm/msm: dp: Switch to atomic_create_state
      drm/msm: hdmi: Switch to atomic_create_state
      drm/omap: hdmi4: Switch to atomic_create_state
      drm/omap: hdmi5: Switch to atomic_create_state
      drm/renesas: rcar-du: lvds: Switch to atomic_create_state
      drm/renesas: rcar-du: mipi_dsi: Switch to atomic_create_state
      drm/renesas: rz-du: mipi_dsi: Switch to atomic_create_state
      drm/rockchip: cdn-dp: Switch to atomic_create_state
      drm/rockchip: rk3066_hdmi: Switch to atomic_create_state
      drm/rockchip: lvds: Switch to atomic_create_state
      drm/stm: lvds: Switch to atomic_create_state
      drm/tests: bridge: Switch to atomic_create_state
      drm/tidss: encoder: Switch to atomic_create_state
      drm/tidss: oldi: Switch to atomic_create_state
      drm/vc4: dsi: Switch to atomic_create_state
      drm/verisilicon: Switch to atomic_create_state
      drm/xlnx: zynqmp_dp: Switch to atomic_create_state
      drm/atomic-state-helper: Remove drm_atomic_helper_bridge_reset()
      drm/bridge: cdns-dsi: Use __drm_atomic_helper_bridge_state_init()
      drm/bridge: cdns-dsi: Switch to atomic_create_state
      drm/bridge: cdns-mhdp8546: Switch to atomic_create_state
      drm/bridge: Remove atomic_reset support

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c       |  2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c          |  2 +-
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c     |  9 +++---
 .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  8 +++---
 drivers/gpu/drm/bridge/chipone-icn6211.c           |  2 +-
 drivers/gpu/drm/bridge/display-connector.c         |  2 +-
 drivers/gpu/drm/bridge/fsl-ldb.c                   |  2 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c       |  2 +-
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c            |  2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |  2 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    |  2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c    |  2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c       |  2 +-
 drivers/gpu/drm/bridge/inno-hdmi.c                 |  2 +-
 drivers/gpu/drm/bridge/ite-it6263.c                |  2 +-
 drivers/gpu/drm/bridge/ite-it6505.c                |  2 +-
 drivers/gpu/drm/bridge/ite-it66121.c               |  2 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c            |  2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  2 +-
 drivers/gpu/drm/bridge/lvds-codec.c                |  2 +-
 drivers/gpu/drm/bridge/nwl-dsi.c                   |  2 +-
 drivers/gpu/drm/bridge/panel.c                     |  2 +-
 drivers/gpu/drm/bridge/parade-ps8640.c             |  2 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |  2 +-
 drivers/gpu/drm/bridge/sii902x.c                   |  2 +-
 drivers/gpu/drm/bridge/ssd2825.c                   |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |  2 +-
 drivers/gpu/drm/bridge/tc358762.c                  |  2 +-
 drivers/gpu/drm/bridge/tc358767.c                  |  4 +--
 drivers/gpu/drm/bridge/tc358768.c                  |  2 +-
 drivers/gpu/drm/bridge/tc358775.c                  |  2 +-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |  2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  2 +-
 drivers/gpu/drm/bridge/ti-tdp158.c                 |  2 +-
 drivers/gpu/drm/bridge/ti-tfp410.c                 |  2 +-
 drivers/gpu/drm/drm_atomic_state_helper.c          | 33 ++++++++++++----------
 drivers/gpu/drm/drm_bridge.c                       |  4 +--
 drivers/gpu/drm/imx/ipuv3/parallel-display.c       |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |  2 +-
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |  2 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c          |  2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |  2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  4 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c                |  2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c                |  2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |  2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |  2 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c     |  2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c             |  2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             |  2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |  2 +-
 drivers/gpu/drm/stm/lvds.c                         |  2 +-
 drivers/gpu/drm/tests/drm_bridge_test.c            |  2 +-
 drivers/gpu/drm/tidss/tidss_encoder.c              |  2 +-
 drivers/gpu/drm/tidss/tidss_oldi.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |  2 +-
 drivers/gpu/drm/verisilicon/vs_bridge.c            |  4 +--
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  2 +-
 include/drm/drm_atomic_state_helper.h              |  6 ++--
 include/drm/drm_bridge.h                           | 33 ++++++++--------------
 72 files changed, 111 insertions(+), 120 deletions(-)
---
base-commit: 21fcb222f0d1e1c9f5b04c09e9fb3408e13a0264
change-id: 20260530-drm-no-more-bridge-reset-ca20d5e22740

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
