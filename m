Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD1F914E6E
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 15:28:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8181EC7128F;
	Mon, 24 Jun 2024 13:28:38 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2239C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 13:28:36 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52cd87277d8so2670025e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719235716; x=1719840516;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L+/PkaXmRsVYIqKGZx4UeA9J6j62ytdn83yxhqwCP6o=;
 b=Zqz5tjyg59ggXNbHUDiKTr3dL4RRE/rpp3TEpt3vVFlV70lE9BdMFxXLClZiE9vyXj
 QbbvH4mU72dqutRkavgmKPwvVRXjcWKiWphJO0hrEM7ZQxHIIRGzzzhWHzVszgSv+Ky0
 XTz9YQ4PyRcThIOvBCqvf3xg6M450xbB1O0Bu5yWM00aGBysgl33bWiD9FQRAdXdQ/1k
 r+sQ+L0C50hO2H6sVbhzcn0vTifYUdAkU9Hkt8/2WlnBMhOsfmlfocVaVA/bKP5nmIWd
 pCKoN7RCdTtkYeM7ln/ReGQrNZus8A0I21+nzsnZs1VfTmpAtcTqfDqVH5Kcq0haDlf5
 KV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719235716; x=1719840516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L+/PkaXmRsVYIqKGZx4UeA9J6j62ytdn83yxhqwCP6o=;
 b=Kp8mJA9VVExxqL1wqlQFS/P4y3Sq0jNWnvQWn8BJcrH5snTDnAVVLVDgKLkV/Kd7gb
 Cw5JkxCw+Frsu5nJZNokKBsj7dCISiBXthz0lmhWOLPdXI6yuQQchUn8nmFjdLAPznVn
 1LkkdzS4cUM/ndPe4GsvjNtpZJK9T7kyWZLkGQDIEBK6EYRAdXKCwxavlCL6NcKgx1K8
 78i2UDIJXH75L+dZ8LjA/j/OT6RqfY+5ic9/EbU+UPzDg1jqPRoW5b3rnDZI2HmiDX2+
 wEniae2ELbAkM8nyKwhillCee1ewHHAdUPeiiQbAwRPqi6Pj7yvBe80T0fme5wcAUy+h
 rzkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE9oxp3KDAp+DC8ExR1pgNtF2y7gTsQG8NGeYmTJUry9EhhdA7sZpxqaSHLPLh4UP1Yuxgin5FA8rS3Bv+YH2Gx3lrsxlKWuDr/1XS4ukMaiczgvDI+LjX
X-Gm-Message-State: AOJu0YzOMCINl+/ELuugtESObHmB/M/CigL6R/l2ZrExBPWIdrRMKIvg
 CJ53wzMAtt8eZoqscHSroqxyzLcxPgJC7rlDuNO/8K7k+KXllOnX
X-Google-Smtp-Source: AGHT+IH809R8vF6zTQILCWIugVLXjGsYzjDJo9A/xeg6IqGYA6QXLn9MgMKJTyre4EaY/xpUaBI5NA==
X-Received: by 2002:a05:6512:1154:b0:52c:9d38:9df1 with SMTP id
 2adb3069b0e04-52ce183263dmr3351699e87.10.1719235715596; 
 Mon, 24 Jun 2024 06:28:35 -0700 (PDT)
Received: from localhost ([213.79.110.82]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b4bc2sm982966e87.27.2024.06.24.06.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 06:28:35 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Halaney <ahalaney@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 24 Jun 2024 16:26:28 +0300
Message-ID: <20240624132802.14238-3-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next v2 11/17] net: stmmac: Introduce
	internal PCS config register getter
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

The optional PCS module CSRs are mainly represented in the framework of
the address spaces [0x00c0:0x00db] on DW GMAC and [0x00e0:0x00f7] on DW
QoS Eth. The spaces mapping is identical in both IP-cores. But the link
state retrieved from the PHY or from another MAC (in MAC2MAC
setup) is mapped over the SGMII/RGMII/SMII Control and Status register in
a non-compatible way. In particular the DW GMAC register have the link
state mapped at the [15:0] field, and the DW QoS Eth register have it
mapped at the [31:16] field. Other than that the fields semantics is
identical - it's the TX_CONFIG_REG[15:0] register (see SGMII specification
for details) with a bit re-ordered fields and extended with some
SMII-specific flags:
tx_config_reg[0]:   LNKMOD
tx_config_reg[1:2]: LNKSPEED
tx_config_reg[3]:   LNKSTS
tx_config_reg[4]:   JABTO (Jabber Timeout, SMII-specific)
tx_config_reg[5]:   FALSCARDET (False Carrier Detected, SMII-specific)

In order to provide a fully generic internal STMMAC PCS module, let's
introduce the MAC-specific callback returning the link state detected by
the internal PCS.

Note the callback name has been chosen to be referring to the
TX_CONFIG_REG data described in the IP-core databooks and in the SGMII
specification.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h     |  1 +
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c    | 11 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h        |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c   | 13 +++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.h          |  3 +++
 5 files changed, 29 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 4296ddda8aaa..f3a95d27298c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -86,6 +86,7 @@ enum power_event {
 #define GMAC_RGSMIIIS		0x000000d8	/* RGMII/SMII status */
 
 /* SGMII/RGMII status register */
+#define GMAC_RGSMIIIS_CONFIG_REG	GENMASK(15, 0)
 #define GMAC_RGSMIIIS_LNKMODE		BIT(0)
 #define GMAC_RGSMIIIS_SPEED		GENMASK(2, 1)
 #define GMAC_RGSMIIIS_SPEED_SHIFT	1
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index e525b92955b4..1e50cc573407 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -365,6 +365,16 @@ static void dwmac1000_set_eee_timer(struct mac_device_info *hw, int ls, int tw)
 	writel(value, ioaddr + LPI_TIMER_CTRL);
 }
 
+static u16 dwmac1000_pcs_get_config_reg(struct mac_device_info *hw)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 val;
+
+	val = readl(ioaddr + GMAC_RGSMIIIS);
+
+	return FIELD_GET(GMAC_RGSMIIIS_CONFIG_REG, val);
+}
+
 static void dwmac1000_ctrl_ane(void __iomem *pcsaddr, bool ane, bool srgmi_ral,
 			       bool loopback)
 {
@@ -568,6 +578,7 @@ const struct stmmac_ops dwmac1000_ops = {
 	.set_eee_timer = dwmac1000_set_eee_timer,
 	.set_eee_pls = dwmac1000_set_eee_pls,
 	.debug = dwmac1000_debug,
+	.pcs_get_config_reg = dwmac1000_pcs_get_config_reg,
 	.pcs_ctrl_ane = dwmac1000_ctrl_ane,
 	.set_mac_loopback = dwmac1000_set_mac_loopback,
 };
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
index d3c5306f1c41..bb2997191f08 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
@@ -567,6 +567,7 @@ static inline u32 mtl_low_credx_base_addr(const struct dwmac4_addrs *addrs,
 #define GMAC_PHYIF_CTRLSTATUS_TC		BIT(0)
 #define GMAC_PHYIF_CTRLSTATUS_LUD		BIT(1)
 #define GMAC_PHYIF_CTRLSTATUS_SMIDRXS		BIT(4)
+#define GMAC_PHYIF_CTRLSTATUS_CONFIG_REG	GENMASK(31, 16)
 #define GMAC_PHYIF_CTRLSTATUS_LNKMOD		BIT(16)
 #define GMAC_PHYIF_CTRLSTATUS_SPEED		GENMASK(18, 17)
 #define GMAC_PHYIF_CTRLSTATUS_SPEED_SHIFT	17
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index e51c95732bad..b7db076b4214 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -456,6 +456,16 @@ static void dwmac4_set_eee_timer(struct mac_device_info *hw, int ls, int tw)
 	writel(value, ioaddr + GMAC4_LPI_TIMER_CTRL);
 }
 
+static u16 dwmac4_pcs_get_config_reg(struct mac_device_info *hw)
+{
+	void __iomem *ioaddr = hw->pcsr;
+	u32 val;
+
+	val = readl(ioaddr + GMAC_PHYIF_CONTROL_STATUS);
+
+	return FIELD_GET(GMAC_PHYIF_CTRLSTATUS_CONFIG_REG, val);
+}
+
 static void dwmac4_write_single_vlan(struct net_device *dev, u16 vid)
 {
 	void __iomem *ioaddr = (void __iomem *)dev->base_addr;
@@ -1274,6 +1284,7 @@ const struct stmmac_ops dwmac4_ops = {
 	.set_eee_pls = dwmac4_set_eee_pls,
 	.pcs_ctrl_ane = dwmac4_ctrl_ane,
 	.debug = dwmac4_debug,
+	.pcs_get_config_reg = dwmac4_pcs_get_config_reg,
 	.set_filter = dwmac4_set_filter,
 	.set_mac_loopback = dwmac4_set_mac_loopback,
 	.update_vlan_hash = dwmac4_update_vlan_hash,
@@ -1318,6 +1329,7 @@ const struct stmmac_ops dwmac410_ops = {
 	.set_eee_pls = dwmac4_set_eee_pls,
 	.pcs_ctrl_ane = dwmac4_ctrl_ane,
 	.debug = dwmac4_debug,
+	.pcs_get_config_reg = dwmac4_pcs_get_config_reg,
 	.set_filter = dwmac4_set_filter,
 	.flex_pps_config = dwmac5_flex_pps_config,
 	.set_mac_loopback = dwmac4_set_mac_loopback,
@@ -1366,6 +1378,7 @@ const struct stmmac_ops dwmac510_ops = {
 	.set_eee_pls = dwmac4_set_eee_pls,
 	.pcs_ctrl_ane = dwmac4_ctrl_ane,
 	.debug = dwmac4_debug,
+	.pcs_get_config_reg = dwmac4_pcs_get_config_reg,
 	.set_filter = dwmac4_set_filter,
 	.safety_feat_config = dwmac5_safety_feat_config,
 	.safety_feat_irq_status = dwmac5_safety_feat_irq_status,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index ba930a87b71a..00995a0c9813 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -376,6 +376,7 @@ struct stmmac_ops {
 		      struct stmmac_extra_stats *x, u32 rx_queues,
 		      u32 tx_queues);
 	/* PCS calls */
+	u16 (*pcs_get_config_reg)(struct mac_device_info *hw);
 	void (*pcs_ctrl_ane)(void __iomem *pcsaddr, bool ane, bool srgmi_ral,
 			     bool loopback);
 	/* Safety Features */
@@ -492,6 +493,8 @@ struct stmmac_ops {
 	stmmac_do_void_callback(__priv, mac, set_eee_pls, __args)
 #define stmmac_mac_debug(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, debug, __priv, __args)
+#define stmmac_pcs_get_config_reg(__priv, __args...) \
+	stmmac_do_callback(__priv, mac, pcs_get_config_reg, __args)
 #define stmmac_pcs_ctrl_ane(__priv, __args...) \
 	stmmac_do_void_callback(__priv, mac, pcs_ctrl_ane, __args)
 #define stmmac_safety_feat_config(__priv, __args...) \
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
