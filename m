Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDEC7FB4C1
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Nov 2023 09:50:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1B10C6B469;
	Tue, 28 Nov 2023 08:50:09 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D71CC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 08:50:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A138C0011;
 Tue, 28 Nov 2023 08:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1701161408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qYJnE4Z1r7jKRPOrGAwXhHc797bbl+1US3cszB9aa9E=;
 b=Biez3ElIDFQtKoAoSEC77AQXzKbt7Ch1XeZiVYhh0NXtG9v9GlfxXJMHUGbOSfb77LUOcn
 3R+0msBidXWkzyP/oA03LjO59JoGEB8nwVxWQhzryO7/3lBgdfOGe+ccmpFTRzo+6Hyh/S
 GD+Y3ayQHKYfSpqkoEeBAFW7jASzaG7FBLQy3BcrLGsrxmfREYLffgYMaUk3magZpde8IY
 Jpkm3fVUL0fUT7BMlooYuZIqQDCRhLrK/p3fM+xSrJ+AkeIXExE94qMn2452ctDbzk7VWP
 2n/LDss+hsxqQFoi5sfx/ccHyQ5hgvuoH436OaEzpLi2b4pI+5FaKvrDAG795Q==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Date: Tue, 28 Nov 2023 10:45:37 +0100
Message-ID: <20231128094538.228039-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: dwmac-socfpga: Don't access
	SGMII adapter when not available
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

The SGMII adapter isn't present on all dwmac-socfpga implementations.
Make sure we don't try to configure it if we don't have this adapter.

Fixes: 5d1f3fe7d2d5 ("net: stmmac: dwmac-sogfpga: use the lynx pcs driver")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index ba2ce776bd4d..ae120792e1b6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -243,7 +243,8 @@ static void socfpga_sgmii_config(struct socfpga_dwmac *dwmac, bool enable)
 {
 	u16 val = enable ? SGMII_ADAPTER_ENABLE : SGMII_ADAPTER_DISABLE;
 
-	writew(val, dwmac->sgmii_adapter_base + SGMII_ADAPTER_CTRL_REG);
+	if (dwmac->sgmii_adapter_base)
+		writew(val, dwmac->sgmii_adapter_base + SGMII_ADAPTER_CTRL_REG);
 }
 
 static int socfpga_set_phy_mode_common(int phymode, u32 *val)
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
