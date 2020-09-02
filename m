Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B2D25AE5F
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Sep 2020 17:07:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3B3DC36B26;
	Wed,  2 Sep 2020 15:07:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9931C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Sep 2020 15:07:36 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 633F820C56;
 Wed,  2 Sep 2020 15:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599059255;
 bh=vbd2YXuxT3Yz0bN8TyD3EQNRyFzd8vDK7+rMFiJqG1Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hy3og9qqM244W8aAlhguKZcUJLSzQTrmUOeMNNERCciEGkkxdYFb839A0Amltm6Mj
 DToDym2tHVkCaux31y2sDdPOW/2c6RQWYH1y+jH302VejAxbuUtX8HxkUbknwIoRp0
 Dlmrfv7ILBMVC71RjA7CHlhkFzZbIyt3ffLBQc1I=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Michal Simek <michal.simek@xilinx.com>, Sekhar Nori <nsekhar@ti.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Peter Rosin <peda@axentia.se>,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Wed,  2 Sep 2020 17:06:42 +0200
Message-Id: <20200902150643.14839-8-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902150643.14839-1-krzk@kernel.org>
References: <20200902150643.14839-1-krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [Linux-stm32] [PATCH 8/9] i2c: mux: gpmux: Simplify with
	dev_err_probe()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and the error value gets printed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/i2c/muxes/i2c-mux-gpmux.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpmux.c b/drivers/i2c/muxes/i2c-mux-gpmux.c
index f830535cff12..d3acd8d66c32 100644
--- a/drivers/i2c/muxes/i2c-mux-gpmux.c
+++ b/drivers/i2c/muxes/i2c-mux-gpmux.c
@@ -85,18 +85,14 @@ static int i2c_mux_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mux->control = devm_mux_control_get(dev, NULL);
-	if (IS_ERR(mux->control)) {
-		if (PTR_ERR(mux->control) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get control-mux\n");
-		return PTR_ERR(mux->control);
-	}
+	if (IS_ERR(mux->control))
+		return dev_err_probe(dev, PTR_ERR(mux->control),
+				     "failed to get control-mux\n");
 
 	parent = mux_parent_adapter(dev);
-	if (IS_ERR(parent)) {
-		if (PTR_ERR(parent) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get i2c-parent adapter\n");
-		return PTR_ERR(parent);
-	}
+	if (IS_ERR(parent))
+		return dev_err_probe(dev, PTR_ERR(parent),
+				     "failed to get i2c-parent adapter\n");
 
 	children = of_get_child_count(np);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
