Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A766B48AC7
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Sep 2025 12:59:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A1DFC3F956;
	Mon,  8 Sep 2025 10:59:17 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 888C2C3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Sep 2025 10:59:15 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-45dcff2f313so25307515e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Sep 2025 03:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757329155; x=1757933955;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uf/M2p3yJHaMrS3IqSkuhZTHc2x/xMcbIpQDOhQMCBY=;
 b=f2KYj7cXH8eJJG93gisQ1fSkNXu60EbQYAhq1Smxfq7raMDu/jcB/BEL0E2Yi9fRoX
 LLVuFPSk5P0bK29O4mQK7Lf5/Dcy2ptuK/nZ/WcYjsj8sLsJsG4IWPnwmo7ZVEBD6FYp
 0T23NJUbKiT0lzDPNrdR4a/JppikOMJdD3DFg0Gp9MgH1hCq5rzelq8xzOQCsCdAUAC2
 2oq2ESEynPLNUdz+zRwGx27KzriG/18BvtubaGJ3FRizLQAZrEmNZPbMA3YLfqKTfnO2
 tICMBsBnx8Udxpkc5MvdTYs9pbfiTie9rSNLQCIwm2yGG62KbqhNs+drD2N6m5dD9i9k
 QkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757329155; x=1757933955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uf/M2p3yJHaMrS3IqSkuhZTHc2x/xMcbIpQDOhQMCBY=;
 b=UVTj1qDUbMb0GvwaaaaY00TE+yXmEtllPWncACf64Izf6H90oogJVrtWjSaGG2NvdM
 KypsnMpv623jkXBwDrxRu3lGtx1Tk/YSvwoN2yhURQzF9R4bEoPoPb6BvzID1IxvN8wY
 +QDMmZDBDkIUV8gVxguDzhZEJ4MJCf+KqWq2Jk+GyHxmVTJao86t+GYKmjvAHfI86etF
 sdGCJPr4ypbr5pQByxkn8iTw33hj05Xqssj+bqsT+PwRymBuG6ja+6cnpbWbDSFKMW58
 hCmlCGBEqpx+mh7EjcDMnZrBHbNECnJX7TaAboIX1OxTUorizOjallgn1sVcF2aWZA5q
 3RvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUd84JCkTZJ0Gb8Z0uhOLf3UGu7Vx6/XiTT5UmFjnShBpu3BkTBl8kVLJ20o0CjAfTGZ/FZQDFgX43oA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy6o9Ub85O+hbnYWjdR3Ttlpi+MMdgZ76xVxWFeCtohVCKGUwOs
 c8Ql0bMhQLoP5PBRf2zxMS3n7uSU+ZKFzW/aaOujNAka6NmdaxGuQ205
X-Gm-Gg: ASbGnct67f9wqATwxTII1UWE5gU1TfEIEh8jaM9pnnENtLd4WIJM/dxjhVc0GDrS6+U
 8a5zbdXloIgN/xnoHNn4UaU/6pJK9bD+apeJqllfhjPve35i21n+IL+1Jr2JwkqXW2Edl/cv2kh
 KOKxcwQdl2F4ZzoXaZ1cLywaXwg13/mNyyYLZxaHp9OvQxGgaBll+KRi7W+gimPo4AkHKcZlbXT
 EEFwseiv3TZg4oZpMydRrI/IztvWJqFCCyt33qdRFm8mEq1GDcSv7gadtvXXOAI4xaeEv31/bTm
 hT6mEsMwGud78IEZlaNA9azQsWoLBo6Q+pmDs+KbjMv1o5GDSEr3DPKWzX20jZ6yy3TvZGfYSU8
 lm99wkXp89QA9OTGU5OKt6zzPBGZ1CSh/KLnxmcjmJyQeggT7xLxRTYHIQRt/wpjJnyUp
X-Google-Smtp-Source: AGHT+IHblMi4stag0oLrxcrHSFQ7OdUQZDLXbmXDrAdQ2fS9UVrhh42Zym0Zb20SR1y+8nRSsXcmEg==
X-Received: by 2002:a05:600c:1d24:b0:456:fdd:6030 with SMTP id
 5b1f17b1804b1-45dea83f76bmr8307965e9.19.1757329154791; 
 Mon, 08 Sep 2025 03:59:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:393b:4605:1f6c:eea1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45ddfe0b654sm91063195e9.3.2025.09.08.03.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:59:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Mon,  8 Sep 2025 11:59:01 +0100
Message-ID: <20250908105901.3198975-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac:
	dwmac-renesas-gbeth: Add support for RZ/T2H SoC
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the Renesas GBETH stmmac glue driver to support the RZ/T2H SoC,
where the GMAC is connected through a MIIC PCS. Introduce a new
`has_pcs` flag in `struct renesas_gbeth_of_data` to indicate when PCS
handling is required.

When enabled, the driver parses the `pcs-handle` phandle, creates a PCS
instance with `miic_create()`, and wires it into phylink. Proper cleanup
is done with `miic_destroy()`. New init/exit/select hooks are added to
`plat_stmmacenet_data` for PCS integration.

Update Kconfig to select `PCS_RZN1_MIIC` when building the Renesas GBETH
driver so the PCS support is always available.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Dropped passing STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag in stmmac_flags
  as it is always set for all the SoCs.
- Updated Kconfig to include RZ/T2H and RZ/N2H.

v1->v2:
- No changes.
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig   | 12 +++--
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 51 +++++++++++++++++++
 2 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 67fa879b1e52..91d9a14362bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -133,15 +133,17 @@ config DWMAC_QCOM_ETHQOS
 	  stmmac device driver.
 
 config DWMAC_RENESAS_GBETH
-	tristate "Renesas RZ/V2H(P) GBETH support"
+	tristate "Renesas RZ/V2H(P) GBETH and RZ/T2H, RZ/N2H GMAC support"
 	default ARCH_RENESAS
 	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
+	select PCS_RZN1_MIIC
 	help
-	  Support for Gigabit Ethernet Interface (GBETH) on Renesas
-	  RZ/V2H(P) SoCs.
+	  Support for Gigabit Ethernet Interface (GBETH)/ Ethernet MAC (GMAC)
+	  on Renesas SoCs.
 
-	  This selects the Renesas RZ/V2H(P) Soc specific glue layer support
-	  for the stmmac device driver.
+	  This selects Renesas SoC glue layer support for the stmmac device
+	  driver. This driver is used for the RZ/V2H(P) family, RZ/T2H and
+	  RZ/N2H SoCs.
 
 config DWMAC_ROCKCHIP
 	tristate "Rockchip dwmac support"
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index 50be944ee37b..bc7bb975803c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pcs-rzn1-miic.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/types.h>
@@ -33,6 +34,7 @@
  *                handled by the glue driver or core driver.
  * @set_clk_tx_rate: Flag to indicate if Tx clock is fixed or
  *                   set_clk_tx_rate is needed.
+ * @has_pcs: Flag to indicate if the MAC has a PCS
  */
 struct renesas_gbeth_of_data {
 	const char * const *clks;
@@ -40,6 +42,7 @@ struct renesas_gbeth_of_data {
 	u32 stmmac_flags;
 	bool handle_reset;
 	bool set_clk_tx_rate;
+	bool has_pcs;
 };
 
 struct renesas_gbeth {
@@ -53,6 +56,41 @@ static const char *const renesas_gbeth_clks[] = {
 	"tx", "tx-180", "rx", "rx-180",
 };
 
+static const char *const renesas_gmac_clks[] = {
+	"tx",
+};
+
+static int renesas_gmac_pcs_init(struct stmmac_priv *priv)
+{
+	struct device_node *np = priv->device->of_node;
+	struct device_node *pcs_node;
+	struct phylink_pcs *pcs;
+
+	pcs_node = of_parse_phandle(np, "pcs-handle", 0);
+	if (pcs_node) {
+		pcs = miic_create(priv->device, pcs_node);
+		of_node_put(pcs_node);
+		if (IS_ERR(pcs))
+			return PTR_ERR(pcs);
+
+		priv->hw->phylink_pcs = pcs;
+	}
+
+	return 0;
+}
+
+static void renesas_gmac_pcs_exit(struct stmmac_priv *priv)
+{
+	if (priv->hw->phylink_pcs)
+		miic_destroy(priv->hw->phylink_pcs);
+}
+
+static struct phylink_pcs *renesas_gmac_select_pcs(struct stmmac_priv *priv,
+						   phy_interface_t interface)
+{
+	return priv->hw->phylink_pcs;
+}
+
 static int renesas_gbeth_init(struct platform_device *pdev, void *priv)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -150,6 +188,11 @@ static int renesas_gbeth_probe(struct platform_device *pdev)
 	plat_dat->exit = renesas_gbeth_exit;
 	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
 			   gbeth->of_data->stmmac_flags;
+	if (of_data->has_pcs) {
+		plat_dat->pcs_init = renesas_gmac_pcs_init;
+		plat_dat->pcs_exit = renesas_gmac_pcs_exit;
+		plat_dat->select_pcs = renesas_gmac_select_pcs;
+	}
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
@@ -163,7 +206,15 @@ static const struct renesas_gbeth_of_data renesas_gbeth_of_data = {
 			STMMAC_FLAG_SPH_DISABLE,
 };
 
+static const struct renesas_gbeth_of_data renesas_gmac_of_data = {
+	.clks = renesas_gmac_clks,
+	.num_clks = ARRAY_SIZE(renesas_gmac_clks),
+	.stmmac_flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY,
+	.has_pcs = true,
+};
+
 static const struct of_device_id renesas_gbeth_match[] = {
+	{ .compatible = "renesas,r9a09g077-gbeth", .data = &renesas_gmac_of_data },
 	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
 	{ /* Sentinel */ }
 };
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
