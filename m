Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21754945690
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 05:18:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2E5FC7129D;
	Fri,  2 Aug 2024 03:18:35 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com
 [192.19.144.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDB0AC712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 03:18:28 +0000 (UTC)
Received: from mail-lvn-it-01.lvn.broadcom.net
 (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 50B9FC0000FB;
 Thu,  1 Aug 2024 20:18:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 50B9FC0000FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1722568707;
 bh=krI7U8sRBmiw28CnfnkGSQgKpZPhoxDuv6WMnKEa0LE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FCC1inpqffmiJmEp+NcaB3ipvjKhCVumgwgPJvq/vrZtn81BYmSsmNdVL7E7sFesA
 /p6knY5qmUKRJx+mtz36ElVDV7YGRYS4N57Eg38Fa2TeyRt9idXAvjifCX23o8DGuk
 d4sKRRcISZU89ZJOQTxGXrgHx+wFJ/M/4Mdd2riI=
Received: from pcie-dev03.dhcp.broadcom.net (pcie-dev03.dhcp.broadcom.net
 [10.59.171.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 7733318041CAC7;
 Thu,  1 Aug 2024 20:18:24 -0700 (PDT)
From: jitendra.vegiraju@broadcom.com
To: netdev@vger.kernel.org
Date: Thu,  1 Aug 2024 20:18:21 -0700
Message-Id: <20240802031822.1862030-3-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, jitendra.vegiraju@broadcom.com,
 kuba@kernel.org, pabeni@redhat.com, hawk@kernel.org, richardcochran@gmail.com,
 ast@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com,
 linux-kernel@vger.kernel.org, horms@kernel.org, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v3 2/3] net: stmmac: Integrate
	dwxgmac4 into stmmac hwif handling
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

From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>

Integrate dwxgmac4 support into stmmac hardware interface handling.
A dwxgmac4 is an xgmac device and hence it inherits properties from
existing stmmac_hw table entry.
The quirks handling facility is used to update dma_ops field to
point to dwxgmac400_dma_ops when the user version field matches.

Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h |  4 +++
 drivers/net/ethernet/stmicro/stmmac/hwif.c   | 26 +++++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h   |  1 +
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index cd36ff4da68c..9bf278e11704 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -37,11 +37,15 @@
 #define DWXGMAC_CORE_2_10	0x21
 #define DWXGMAC_CORE_2_20	0x22
 #define DWXLGMAC_CORE_2_00	0x20
+#define DWXGMAC_CORE_4_00	0x40
 
 /* Device ID */
 #define DWXGMAC_ID		0x76
 #define DWXLGMAC_ID		0x27
 
+/* User Version */
+#define DWXGMAC_USER_VER_X22	0x22
+
 #define STMMAC_CHAN0	0	/* Always supported and default for all chips */
 
 /* TX and RX Descriptor Length, these need to be power of two.
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 29367105df54..713cb5aa2c3e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -36,6 +36,18 @@ static u32 stmmac_get_dev_id(struct stmmac_priv *priv, u32 id_reg)
 	return (reg & GENMASK(15, 8)) >> 8;
 }
 
+static u32 stmmac_get_user_version(struct stmmac_priv *priv, u32 id_reg)
+{
+	u32 reg = readl(priv->ioaddr + id_reg);
+
+	if (!reg) {
+		dev_info(priv->device, "User Version not available\n");
+		return 0x0;
+	}
+
+	return (reg & GENMASK(23, 16)) >> 16;
+}
+
 static void stmmac_dwmac_mode_quirk(struct stmmac_priv *priv)
 {
 	struct mac_device_info *mac = priv->hw;
@@ -82,6 +94,18 @@ static int stmmac_dwmac4_quirks(struct stmmac_priv *priv)
 	return 0;
 }
 
+static int stmmac_dwxgmac_quirks(struct stmmac_priv *priv)
+{
+	struct mac_device_info *mac = priv->hw;
+	u32 user_ver;
+
+	user_ver = stmmac_get_user_version(priv, GMAC4_VERSION);
+	if (priv->synopsys_id == DWXGMAC_CORE_4_00 &&
+	    user_ver == DWXGMAC_USER_VER_X22)
+		mac->dma = &dwxgmac400_dma_ops;
+	return 0;
+}
+
 static int stmmac_dwxlgmac_quirks(struct stmmac_priv *priv)
 {
 	priv->hw->xlgmac = true;
@@ -256,7 +280,7 @@ static const struct stmmac_hwif_entry {
 		.mmc = &dwxgmac_mmc_ops,
 		.est = &dwmac510_est_ops,
 		.setup = dwxgmac2_setup,
-		.quirks = NULL,
+		.quirks = stmmac_dwxgmac_quirks,
 	}, {
 		.gmac = false,
 		.gmac4 = false,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index e53c32362774..6213c496385c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -683,6 +683,7 @@ extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
 extern const struct stmmac_mmc_ops dwmac_mmc_ops;
 extern const struct stmmac_mmc_ops dwxgmac_mmc_ops;
 extern const struct stmmac_est_ops dwmac510_est_ops;
+extern const struct stmmac_dma_ops dwxgmac400_dma_ops;
 
 #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
 #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
