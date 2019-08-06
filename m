Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 102028330A
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2019 15:43:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD9A4CFAC4F;
	Tue,  6 Aug 2019 13:43:01 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0333C35E08
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2019 13:42:58 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4AB4CC1F44;
 Tue,  6 Aug 2019 13:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1565098976; bh=Qk/O7+jqEXA/sN1ZdZlDe7BndmrQPcxi2oxVW6HYlAM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=CzP9PE2D13grvZdYjkWzaq66opbnCH86a3dAxb3DS1L16aRaRXLVNQ2qMNRwV6gLA
 zPK5V/LnyKv5/9kLaDIRHncZiTM0j5JaI17P1Ve07L8Q6YePeVYZ0mGw3VFdR42SG3
 TGhjrKgfex967fwrrW3MgkW2l061VlNeFhmqj0AAsUDFZZeDvhkVGcMR/dwuquLrix
 utNadJiH/37uL8OmKEuwA9RsemH3m9HCFQ3egsh25sM3tYgshV4IMOj5Gmvc2xo8uf
 F/6xu+82kpJXGu4ReeRc4C+lroh83e8m7hzr1wHezXWFbABaa+rehnI7hnaWW85rFM
 aMS7kXCDXTs1g==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id D0075A0064;
 Tue,  6 Aug 2019 13:42:54 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Tue,  6 Aug 2019 15:42:44 +0200
Message-Id: <880db02ffe390334c1b7c4eaa6d84706ed8d6b0f.1565098881.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1565098881.git.joabreu@synopsys.com>
References: <cover.1565098881.git.joabreu@synopsys.com>
In-Reply-To: <cover.1565098881.git.joabreu@synopsys.com>
References: <cover.1565098881.git.joabreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 03/10] net: stmmac: xgmac:
	Implement tx_queue_prio()
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

Implement the TX Queue Priority callback in XGMAC core.

Signed-off-by: Jose Abreu <joabreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h      |  4 ++++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 19 ++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 2fe6cd5a8ea0..95c9019567f4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -124,6 +124,10 @@
 #define XGMAC_MTL_RXQ_DMA_MAP1		0x00001034
 #define XGMAC_QxMDMACH(x)		GENMASK((x) * 8 + 3, (x) * 8)
 #define XGMAC_QxMDMACH_SHIFT(x)		((x) * 8)
+#define XGMAC_TC_PRTY_MAP0		0x00001040
+#define XGMAC_TC_PRTY_MAP1		0x00001044
+#define XGMAC_PSTC(x)			GENMASK((x) * 8 + 7, (x) * 8)
+#define XGMAC_PSTC_SHIFT(x)		((x) * 8)
 #define XGMAC_MTL_TXQ_OPMODE(x)		(0x00001100 + (0x80 * (x)))
 #define XGMAC_TQS			GENMASK(25, 16)
 #define XGMAC_TQS_SHIFT			16
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 44d728c5c4e4..03ccb3fe48ba 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -114,6 +114,23 @@ static void dwxgmac2_rx_queue_prio(struct mac_device_info *hw, u32 prio,
 	writel(value, ioaddr + reg);
 }
 
+static void dwxgmac2_tx_queue_prio(struct mac_device_info *hw, u32 prio,
+				   u32 queue)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 value, reg;
+
+	reg = (queue < 4) ? XGMAC_TC_PRTY_MAP0 : XGMAC_TC_PRTY_MAP1;
+	if (queue >= 4)
+		queue -= 4;
+
+	value = readl(ioaddr + reg);
+	value &= ~XGMAC_PSTC(queue);
+	value |= (prio << XGMAC_PSTC_SHIFT(queue)) & XGMAC_PSTC(queue);
+
+	writel(value, ioaddr + reg);
+}
+
 static void dwxgmac2_prog_mtl_rx_algorithms(struct mac_device_info *hw,
 					    u32 rx_alg)
 {
@@ -359,7 +376,7 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.rx_ipc = dwxgmac2_rx_ipc,
 	.rx_queue_enable = dwxgmac2_rx_queue_enable,
 	.rx_queue_prio = dwxgmac2_rx_queue_prio,
-	.tx_queue_prio = NULL,
+	.tx_queue_prio = dwxgmac2_tx_queue_prio,
 	.rx_queue_routing = NULL,
 	.prog_mtl_rx_algorithms = dwxgmac2_prog_mtl_rx_algorithms,
 	.prog_mtl_tx_algorithms = dwxgmac2_prog_mtl_tx_algorithms,
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
