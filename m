Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 112F4914E76
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 15:28:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA51AC78012;
	Mon, 24 Jun 2024 13:28:46 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3CA3C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 13:28:45 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52ce655ff5bso982628e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 06:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719235725; x=1719840525;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+SJ6K00RddygxsRAx5gvfJ+FOJjztoTh+Z/C1WD5C9E=;
 b=g/wqiEalUaSnWxKNnLMuO5KDcK2mRp13QVWr+/JFCdoiMFvcAxOW+0fCwkibJ8BOpX
 wfdDhuzDe/UBYDALCkEel7cnute36+xAQBd9nIOLjDsD783/wXdj7laTPbXinQ8epxQw
 tQAo/rWR4wDklX1L/1oH0KbEjNCqSfPY/TZZ0QcXdTi5HARst1wDXTIFJZbykXlYb8XL
 Dh3ds8QZoJcViXaiLgyftcevhcfQxLvEtdCV3Lm3W7IZ4GaQaBK65lNJrNR4zl6PRfKd
 U5eXLA2RniJMVIJm3OwKFs3YOqwg5CXFTZzYHMagZnVOC9pX9kuSUvaE2X/jXM2kD+/Y
 y/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719235725; x=1719840525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+SJ6K00RddygxsRAx5gvfJ+FOJjztoTh+Z/C1WD5C9E=;
 b=LKj7rz/m/tUA8rLCNsiZty+kjr1FppAjF5rg0kQvsApR4lVzGacs/R2nddz+/JkXpk
 ZiY9G020cTPFhfMAfkz0xHIZk6KpzGiUccnyWqNvufSKohZMdPPAEEH35zJzXBSnMosK
 gTnz9nacGa+LSntLvrtaf6vPx5eF/S73r+O5T7z+1nkU1brtQ+438DS9zXL5fNKDj4w0
 7NSU1d3xL/Ivnn0QgGG5JrDT6MWWT0xUElPxvWrLxv+EyzNUcqcLR3R5L/3YftbzoS9U
 cnkrCvueCZZ2/HjAZ7mVjSLKFUnPgW0JTeyzURJ+dfaUc5aywxDBvDY7spSX4n00guXa
 8neQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9aDAx/RTk2uKl8RtDmZp9pifTy0h4YPg8Bcl00M92vxrUViGGrAF49z/z+Y+9OlbahhrpjmBSgCqYm3BZHmI01NrSg+t4N3fT9o0E5cOwPiLvcWxFsbLq
X-Gm-Message-State: AOJu0YzGKtvuWhtHJ0fArZHU7NvCMeeICo3FqWayrhxDNV7xop2L+jJG
 z8fwOGiX6azuHyV8gmJP1vcpBd5wII6OYDIoKu6SkkSogiYNVWMG
X-Google-Smtp-Source: AGHT+IH0GO4PBGc5Gd3PGuDIANu9HTgigG+8VkYo1wUOWDrul73npApHt9lg7dmWYbZTxCAcThzWtg==
X-Received: by 2002:a2e:6a02:0:b0:2e1:2169:a5cc with SMTP id
 38308e7fff4ca-2ec5931d8c3mr36751081fa.15.1719235724924; 
 Mon, 24 Jun 2024 06:28:44 -0700 (PDT)
Received: from localhost ([213.79.110.82]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d602703sm9729211fa.4.2024.06.24.06.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 06:28:44 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Halaney <ahalaney@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 24 Jun 2024 16:26:32 +0300
Message-ID: <20240624132802.14238-7-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next v2 15/17] net: stmmac: Move
	internal PCS ISR to stmmac_pcs.c
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

Similarly to the PHYLINK PCS ops, the STMMAC PCS ISR can be now fully
implemented in the stmmac_pcs.c file. As before this change the resultant
method will be called from the DW GMAC and DW QoS Eth core interrupt
handlers.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Note the AN Complete and Link state changes now cause the PHYLINK PCS
state update.
---
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  9 +----
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  9 +----
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 33 +++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  | 31 ++---------------
 4 files changed, 38 insertions(+), 44 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 332018ecd624..2d77ffd16f0a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -296,14 +296,7 @@ static int dwmac1000_irq_status(struct mac_device_info *hw,
 			x->irq_rx_path_exit_lpi_mode_n++;
 	}
 
-	dwmac_pcs_isr(hw->priv->pcsaddr, intr_status, x);
-
-	if (intr_status & PCS_RGSMIIIS_IRQ) {
-		/* TODO Dummy-read to clear the IRQ status */
-		readl(ioaddr + GMAC_RGSMIIIS);
-		phylink_pcs_change(&hw->mac_pcs, false);
-		x->irq_rgmii_n++;
-	}
+	dwmac_pcs_isr(hw, intr_status, x);
 
 	return ret;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 1487f5cc5249..c58dc20eddeb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -860,14 +860,7 @@ static int dwmac4_irq_status(struct mac_device_info *hw,
 			x->irq_rx_path_exit_lpi_mode_n++;
 	}
 
-	dwmac_pcs_isr(hw->priv->pcsaddr, intr_status, x);
-
-	if (intr_status & PCS_RGSMIIIS_IRQ) {
-		/* TODO Dummy-read to clear the IRQ status */
-		readl(ioaddr + GMAC_PHYIF_CONTROL_STATUS);
-		phylink_pcs_change(&hw->mac_pcs, false);
-		x->irq_rgmii_n++;
-	}
+	dwmac_pcs_isr(hw, intr_status, x);
 
 	return ret;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 24b95d1fdb64..aac49f6472f0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -134,3 +134,36 @@ const struct phylink_pcs_ops dwmac_pcs_ops = {
 	.pcs_get_state = dwmac_pcs_get_state,
 
 };
+
+void dwmac_pcs_isr(struct mac_device_info *hw, unsigned int intr_status,
+		   struct stmmac_extra_stats *x)
+{
+	struct stmmac_priv *priv = hw->priv;
+	bool an_status = false, sr_status = false;
+
+	if (intr_status & PCS_ANE_IRQ) {
+		x->irq_pcs_ane_n++;
+		an_status = true;
+	}
+
+	if (intr_status & PCS_LINK_IRQ) {
+		x->irq_pcs_link_n++;
+		an_status = true;
+	}
+
+	if (intr_status & PCS_RGSMIIIS_IRQ) {
+		x->irq_rgmii_n++;
+		sr_status = true;
+	}
+
+	/* Read the AN and SGMII/RGMII/SMII status regs to clear IRQ */
+	if (an_status)
+		readl(priv->pcsaddr + PCS_AN_STATUS);
+
+	if (sr_status)
+		readl(priv->pcsaddr + PCS_SRGMII_CSR);
+
+	/* Any PCS event shall trigger the PHYLINK PCS state update */
+	if (an_status || sr_status)
+		phylink_pcs_change(&hw->mac_pcs, false);
+}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 2baebb92bea7..6e364285a4ef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -23,6 +23,7 @@
 #define PCS_ANE_LPA		0x0c		/* ANE link partener ability */
 #define PCS_ANE_EXP		0x10		/* ANE expansion */
 #define PCS_TBI_EXT		0x14		/* TBI extended status */
+#define PCS_SRGMII_CSR		0x18		/* SGMII/RGMII/SMII CSR */
 
 /* AN Configuration defines */
 #define PCS_AN_CTRL_RAN		BIT(9)		/* Restart Auto-Negotiation */
@@ -57,33 +58,7 @@
 #define PCS_CFG_JABTO		BIT(4)		/* Jabber Timeout (SMII only) */
 #define PCS_CFG_FALSCARDET	BIT(5)		/* False Carrier (SMII only) */
 
-/**
- * dwmac_pcs_isr - TBI, RTBI, or SGMII PHY ISR
- * @ioaddr: IO registers pointer
- * @intr_status: GMAC core interrupt status
- * @x: pointer to log these events as stats
- * Description: it is the ISR for PCS events: Auto-Negotiation Completed and
- * Link status.
- */
-static inline void dwmac_pcs_isr(void __iomem *pcsaddr,
-				 unsigned int intr_status,
-				 struct stmmac_extra_stats *x)
-{
-	u32 val = readl(pcsaddr + PCS_AN_STATUS);
-
-	if (intr_status & PCS_ANE_IRQ) {
-		x->irq_pcs_ane_n++;
-		if (val & PCS_AN_STATUS_ANC)
-			pr_info("stmmac_pcs: ANE process completed\n");
-	}
-
-	if (intr_status & PCS_LINK_IRQ) {
-		x->irq_pcs_link_n++;
-		if (val & PCS_AN_STATUS_LS)
-			pr_info("stmmac_pcs: Link Up\n");
-		else
-			pr_info("stmmac_pcs: Link Down\n");
-	}
-}
+void dwmac_pcs_isr(struct mac_device_info *hw, unsigned int intr_status,
+		   struct stmmac_extra_stats *x);
 
 #endif /* __STMMAC_PCS_H__ */
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
