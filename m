Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 855A1945C48
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 12:47:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DA27C712A1;
	Fri,  2 Aug 2024 10:47:18 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74EE9C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 10:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JaWuG7+rQO/Ul/PPdHoPd+nkstTVgqxf0FWXUBMchWg=; b=zu1U9C5AvRf8kOWTzgVz1jrNcB
 bszhfBEMbW61kQkHBEqO9ykD4YxnC0kKU8bKKb/SNvEDGbad19x0nU6yekQFgZ1U4M/XEKrtjlEc6
 RgqawJ5sogJdfu0mV7o6MIW+XOaJNK7Qq0cRRLyvpHG+9fX0Wc38qWfGSCEjSVa6qjRUozdCc/fsw
 MnDe38qlPFSEz2J3cfdeViSzGBRE231pKgW1lCMH7txi5Y6qsmxytqYgGqEEo8IRRQYFkf7BfAcK1
 HFMZaFQZEgbIRcg4LJlfCzK6B9g5NJtFY3o0oHEAhk/DOs201HjV9eM7qGQ2iQFCV8/AOOKhM4ZJs
 q4um9k9w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58552 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1sZpnr-0006E1-1f;
 Fri, 02 Aug 2024 11:46:31 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1sZpnw-000eGw-2F; Fri, 02 Aug 2024 11:46:36 +0100
In-Reply-To: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sZpnw-000eGw-2F@rmk-PC.armlinux.org.uk>
Date: Fri, 02 Aug 2024 11:46:36 +0100
Cc: Vinod Koul <vkoul@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next 02/14] net: stmmac: replace ioaddr
 with stmmac_priv for pcs_set_ane() method
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

Pass the stmmac_priv structure into the pcs_set_ane() MAC method rather
than having callers dereferencing this structure for the IO address.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c    | 6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c       | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/hwif.h              | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 092b053dd8da..ddf86ca1a093 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -638,7 +638,7 @@ static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 
 static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
 {
-	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, 0, 0);
+	stmmac_pcs_ctrl_ane(priv, enable, 0, 0);
 }
 
 /* On interface toggle MAC registers gets reset.
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index d413d76a8936..a673cfe9c016 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -398,10 +398,10 @@ static void dwmac1000_set_eee_timer(struct mac_device_info *hw, int ls, int tw)
 	writel(value, ioaddr + LPI_TIMER_CTRL);
 }
 
-static void dwmac1000_ctrl_ane(void __iomem *ioaddr, bool ane, bool srgmi_ral,
-			       bool loopback)
+static void dwmac1000_ctrl_ane(struct stmmac_priv *priv, bool ane,
+			       bool srgmi_ral, bool loopback)
 {
-	dwmac_ctrl_ane(ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
+	dwmac_ctrl_ane(priv->ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
 }
 
 static void dwmac1000_get_adv_lp(void __iomem *ioaddr, struct rgmii_adv *adv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index f98741d2607e..0c3aac304193 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -752,10 +752,10 @@ static void dwmac4_flow_ctrl(struct mac_device_info *hw, unsigned int duplex,
 	}
 }
 
-static void dwmac4_ctrl_ane(void __iomem *ioaddr, bool ane, bool srgmi_ral,
+static void dwmac4_ctrl_ane(struct stmmac_priv *priv, bool ane, bool srgmi_ral,
 			    bool loopback)
 {
-	dwmac_ctrl_ane(ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
+	dwmac_ctrl_ane(priv->ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
 }
 
 static void dwmac4_get_adv_lp(void __iomem *ioaddr, struct rgmii_adv *adv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index e53c32362774..74d7b2394591 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -368,7 +368,7 @@ struct stmmac_ops {
 		      struct stmmac_extra_stats *x, u32 rx_queues,
 		      u32 tx_queues);
 	/* PCS calls */
-	void (*pcs_ctrl_ane)(void __iomem *ioaddr, bool ane, bool srgmi_ral,
+	void (*pcs_ctrl_ane)(struct stmmac_priv *priv, bool ane, bool srgmi_ral,
 			     bool loopback);
 	void (*pcs_get_adv_lp)(void __iomem *ioaddr, struct rgmii_adv *adv);
 	/* Safety Features */
@@ -482,7 +482,7 @@ struct stmmac_ops {
 #define stmmac_mac_debug(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, debug, __priv, __args)
 #define stmmac_pcs_ctrl_ane(__priv, __args...) \
-	stmmac_do_void_callback(__priv, mac, pcs_ctrl_ane, __args)
+	stmmac_do_void_callback(__priv, mac, pcs_ctrl_ane, __priv, __args)
 #define stmmac_pcs_get_adv_lp(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, pcs_get_adv_lp, __args)
 #define stmmac_safety_feat_config(__priv, __args...) \
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
