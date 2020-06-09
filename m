Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A5A1F42E9
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jun 2020 19:48:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F8D7C36B23;
	Tue,  9 Jun 2020 17:48:48 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA807C36B2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2020 17:48:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id B100A2A3B92
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Date: Tue,  9 Jun 2020 20:49:59 +0300
Message-Id: <20200609174959.955926-12-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609174959.955926-1-adrian.ratiu@collabora.com>
References: <20200609174959.955926-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Heiko Stuebner <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yannick FERTRE <yannick.fertre@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-imx@nxp.com,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v9 11/11] Documentation: gpu: todo: Add
	dw-mipi-dsi consolidation plan
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

This documents the longer-term plan to cleanup the dw-mipi-dsi bridge
based drivers after the regmap refactor and i.MX6 driver have landed.

The goal is to get the entire bridge logic in one place and continue
the refactorings under the drm/bridge tree.

Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 Documentation/gpu/todo.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 658b52f7ffc6c..2b142980a4b16 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -548,6 +548,31 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
 Contact: Harry Wentland, Alex Deucher
 
+Reorganize dw-mipi-dsi bridge-based host-controller drivers
+-----------------------------------------------------------
+
+The Synopsys DW MIPI DSI bridge is used by a number of SoC platform drivers
+(STM, Rockchip, i.MX) which don't cleanly encapsulate their bridge logic which
+gets split between the Synopsys bridge (drm/bridge/synopsys/dw-mipi-dsi.c) and
+platform drivers like drm/imx/dw_mipi_dsi-imx6.c by passing around the bridge
+configuration regmap, creating new bridges / daisy chaining in platform drivers,
+duplicating encoder creation, having too much encoder logic instead of using the
+simple encoder interface and so on.
+
+The goal of this rework is to make the dw-mipi-dsi driver a better encapsulated
+bridge by moving all bridge-related logic under drm/bridge, including the SoC
+bindings which chain to the core Synopsys code under drm/bridge/dw-mipi-dsi/
+from which they can be further consolidated and cleaned up.
+
+If this goal proves to be impossible then drm_bridge might not be the correct
+abstraction for these host controllers and unifying their logic into a helper
+library encapsulating a drm_encoder might be more desirable, in other words to
+move away from drm_bridge entirely.
+
+Contact: Adrian Ratiu, Daniel Vetter, Laurent Pinchart
+
+Level: Intermediate
+
 Bootsplash
 ==========
 
-- 
2.27.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
