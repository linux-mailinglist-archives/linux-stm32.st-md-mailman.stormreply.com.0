Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CA1B3F179
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Sep 2025 02:13:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 803C7C3FACD;
	Tue,  2 Sep 2025 00:13:12 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13DB7C32E92
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Sep 2025 00:13:11 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45b8b7ac427so9532305e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Sep 2025 17:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756771990; x=1757376790;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yYNmQYHvpUW9ygwaADrHIo+U++1cqaaqBXRIk4cWf5E=;
 b=Q3J4ofUOy3IYu1KeBgQSmJWuThEOTlh2hPpLB8POZKvE8d/3iWhET0msm25PLxX3ME
 Nw6BE17gAvcCvReSStvBRYBd5vXQRr97o3Y8oE+ibH6Pz5gwHK+FepcfH6/vh76SFvJY
 f/YhZEBevPYmrsY1V9UP/BR1F9FdpEo/zrugNZbjyNchzCHhJzVYntDUnE2wb6DEAHRT
 tnRp75KiUN7EkzV7zZiEkbUunbZjJtCYMPdNlTAvUf5f9bjdt8e6uNHALjC8IoZDKZhT
 GwWn7PFXzzlNPgDIKUQzEfxiCZjQNy/jb17dINP7OiTT0AhNSayXdyhrefgOtBm3gULc
 k5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756771990; x=1757376790;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yYNmQYHvpUW9ygwaADrHIo+U++1cqaaqBXRIk4cWf5E=;
 b=IxjES66vTkgdYHFAYbXi1InmHlBMZorqecoC0p49XtkPRqlBdHooT+RyjIKvzsoSsS
 rh7bcrTzYTB+vclAZQ7JnK4kSFLbOH9ZGOAO8Vpf2RxAs2ifNu3HaANaUBRN04DQBP/g
 cpLaLU5+BrNrDgku/E5XiKo6/QVIUTqhSqHnF6tQntjgZTSvGjU5fhICnpW0gojdYhnm
 0XSAy3yFce2ds/ggEegC0LaLp6s1SUqxgyUP+83wxahYerHaFvkD3m8GaSeRHTmgIpu5
 HLxwfv06cTRTyktL9xXbH8/2Jg+Ny4sQAkn3p25XoJadrBGPs6xuj/3cPpDqYeNDDLus
 YhsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0V8UPlHOXBExWgcJBVsvO5ZMQWxmg7J1z/XuvhY+S86sZ3JnpXSWVyMcrsoeDOuZi2ru5ngyX3WWnpQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywc0ULRnOoBB40Z2dHrvdDYTx5rwgT5DEuoUIwtnyundLevwpwp
 0cwSZXr3xUJ+Px57f96xVCcSdk1iUlcdV39RzrJvSNpvmSf0tOttkSEz
X-Gm-Gg: ASbGncsVEel484fpZsyavReLprlVrdBFcTAqWUZGJfVqVAWcVtF+ZhlX+TA6w7hCRJu
 dzw84SoOAiZhrzIHsbKJ9kPU+/Z9DOIDJm0i0J/4mSPxU56ijDSRHXzHQ8QebRGcbHForrvukeI
 oIuQ+Pw4pkmURom02uulH+1UmxaGOXETuPyi3vjYTtXxEnur09RRp8q+gUeQ8ZDwZOXIZbcs7NG
 D8PWz9IEcJ3t7ZCfA3vC2Mr6dP6ZXod3GYRYFYSx/h8d5y53LZYgyUS1bDnMeFuNHstdW34HMgM
 1HLD7qoWoIBSAK5LbJH6wc3TooyLLIPI8pPutykLPJaGLNsswSCezKlaJCdVjXtJW1yKtJKowmW
 w5jA/LnanUKRCcX+fhwbeSiF+xIPqZ1DdrUTI4N+FXcH4LQ==
X-Google-Smtp-Source: AGHT+IFGGuLbjih6Gj+w7x0wLgIFZo1ltt4HE5wOWmB54nwG1DjvGnz2BT6uviOKTC8YNommrrKJIQ==
X-Received: by 2002:a05:600c:4fcd:b0:45b:7185:9e5 with SMTP id
 5b1f17b1804b1-45b85525cddmr83857055e9.5.1756771990377; 
 Mon, 01 Sep 2025 17:13:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d92d51982bsm2138153f8f.21.2025.09.01.17.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 17:13:09 -0700 (PDT)
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
 Russell King <linux@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Date: Tue,  2 Sep 2025 01:13:02 +0100
Message-ID: <20250902001302.3823418-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/4] net: stmmac:
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
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 67fa879b1e52..a01c83b109f9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -136,6 +136,7 @@ config DWMAC_RENESAS_GBETH
 	tristate "Renesas RZ/V2H(P) GBETH support"
 	default ARCH_RENESAS
 	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
+	select PCS_RZN1_MIIC
 	help
 	  Support for Gigabit Ethernet Interface (GBETH) on Renesas
 	  RZ/V2H(P) SoCs.
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index 022e595a9e1b..ad89f7b8f279 100644
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
@@ -149,6 +187,11 @@ static int renesas_gbeth_probe(struct platform_device *pdev)
 	plat_dat->init = renesas_gbeth_init;
 	plat_dat->exit = renesas_gbeth_exit;
 	plat_dat->flags |= gbeth->of_data->stmmac_flags;
+	if (of_data->has_pcs) {
+		plat_dat->pcs_init = renesas_gmac_pcs_init;
+		plat_dat->pcs_exit = renesas_gmac_pcs_exit;
+		plat_dat->select_pcs = renesas_gmac_select_pcs;
+	}
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
@@ -163,8 +206,17 @@ static const struct renesas_gbeth_of_data renesas_gbeth_of_data = {
 			STMMAC_FLAG_SPH_DISABLE,
 };
 
+static const struct renesas_gbeth_of_data renesas_gmac_of_data = {
+	.clks = renesas_gmac_clks,
+	.num_clks = ARRAY_SIZE(renesas_gmac_clks),
+	.stmmac_flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+			STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP,
+	.has_pcs = true,
+};
+
 static const struct of_device_id renesas_gbeth_match[] = {
 	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
+	{ .compatible = "renesas,rzt2h-gbeth", .data = &renesas_gmac_of_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, renesas_gbeth_match);
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
