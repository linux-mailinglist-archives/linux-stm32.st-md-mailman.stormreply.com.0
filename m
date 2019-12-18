Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F2F12449A
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 11:33:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 343FBC36B0C;
	Wed, 18 Dec 2019 10:33:24 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAA73C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 10:33:22 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EF7C9405C6;
 Wed, 18 Dec 2019 10:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576665201; bh=wj6sCtmNcy6nxZMnDQRmD3lTcMPEpv2f8Ae23zQUnfM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=Al6xwfkkTpgN6/CIyhzEPpgQjYPsmXRxyahxOokpKKehlePwbBQkQvqTYLOwkvsVI
 tLDow+F5u09U73gJqSMVOBlhZrRk5z/WkpFJTQ7TOCREUXwOAWxsUm65VtDn5D2Fn/
 b/0adpvs/op5hUURgh4Bd5iEdxvVHiFsd1uJVs9VBPI1dIuLeDF0qo/FEdSPSc2FrZ
 RuwIkGm6Sd9e8cOYqLdVq+ne1xbqEauoGCaNeX3PHuhgvn0QB/NXxGbZ9Glmx/IEtE
 hFgfey8rwVvgwz3O6eDPmaDQI1m9jn1iFqLqVQ2nVqTErWZU8uf83nvj/BDoDyrGtQ
 FllDaFBzkceVQ==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id BE22CA00B1;
 Wed, 18 Dec 2019 10:33:19 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Wed, 18 Dec 2019 11:33:11 +0100
Message-Id: <fd0742e12751ee0d2b54aba9464b4ff5387628aa.1576664870.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576664870.git.Jose.Abreu@synopsys.com>
References: <cover.1576664870.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1576664870.git.Jose.Abreu@synopsys.com>
References: <cover.1576664870.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Richard.Ong@synopsys.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Andre Guedes <andre.guedes@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 7/7] net: stmmac: mmc: Add Frame
	Preemption counters on GMAC5+ cores
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

This can be useful for debug. Add these counters on GMAC5+ cores just
like we did for XGMAC.

Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

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
 drivers/net/ethernet/stmicro/stmmac/mmc_core.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
index 252cf48c5816..a57b0fa815ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
@@ -119,6 +119,13 @@
 #define MMC_RX_ICMP_GD_OCTETS		0x180
 #define MMC_RX_ICMP_ERR_OCTETS		0x184
 
+#define MMC_TX_FPE_FRAG			0x1a8
+#define MMC_TX_HOLD_REQ			0x1ac
+#define MMC_RX_PKT_ASSEMBLY_ERR		0x1c8
+#define MMC_RX_PKT_SMD_ERR		0x1cc
+#define MMC_RX_PKT_ASSEMBLY_OK		0x1d0
+#define MMC_RX_FPE_FRAG			0x1d4
+
 /* XGMAC MMC Registers */
 #define MMC_XGMAC_TX_OCTET_GB		0x14
 #define MMC_XGMAC_TX_PKT_GB		0x1c
@@ -315,6 +322,15 @@ static void dwmac_mmc_read(void __iomem *mmcaddr, struct stmmac_counters *mmc)
 	mmc->mmc_rx_tcp_err_octets += readl(mmcaddr + MMC_RX_TCP_ERR_OCTETS);
 	mmc->mmc_rx_icmp_gd_octets += readl(mmcaddr + MMC_RX_ICMP_GD_OCTETS);
 	mmc->mmc_rx_icmp_err_octets += readl(mmcaddr + MMC_RX_ICMP_ERR_OCTETS);
+
+	mmc->mmc_tx_fpe_fragment_cntr += readl(mmcaddr + MMC_TX_FPE_FRAG);
+	mmc->mmc_tx_hold_req_cntr += readl(mmcaddr + MMC_TX_HOLD_REQ);
+	mmc->mmc_rx_packet_assembly_err_cntr +=
+		readl(mmcaddr + MMC_RX_PKT_ASSEMBLY_ERR);
+	mmc->mmc_rx_packet_smd_err_cntr += readl(mmcaddr + MMC_RX_PKT_SMD_ERR);
+	mmc->mmc_rx_packet_assembly_ok_cntr +=
+		readl(mmcaddr + MMC_RX_PKT_ASSEMBLY_OK);
+	mmc->mmc_rx_fpe_fragment_cntr += readl(mmcaddr + MMC_RX_FPE_FRAG);
 }
 
 const struct stmmac_mmc_ops dwmac_mmc_ops = {
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
