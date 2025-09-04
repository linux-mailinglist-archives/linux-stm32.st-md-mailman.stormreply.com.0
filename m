Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E76FB4477E
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 22:39:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9A49C3FAD7;
	Thu,  4 Sep 2025 20:39:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23ED9C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 20:39:58 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45cb5e1adf7so11169665e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Sep 2025 13:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757018397; x=1757623197;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3HWs5BM/Zczfcib8xW5oddFZsmYZHDcxWDdtx5r08Kk=;
 b=dda8ZecP6ZH47K6dHO8FAMuYyW43XbEPoe/WysY4Kl78+4DDJJv/AECGc0B7N7r+2h
 ltig5nAKP9+5I9je/7e1n5Ye6QGopY/s567LHaC+Ip6Vv0sxrsFBhJzH8k5+jpFdmU/M
 uWsPD3vpyK0BoSUiyXWlg9tEnBXuIdy0JkkWiD8Ju5zpBjz2c+j2lxeQJD6ebTOFshSI
 Z/wcL2Oa7CnS8pQIXgPNWgjjoMNSBjeVNh7F3505IkGASaHPu4z6Iza6nY2dO3TZnfwc
 QA8g5pP93fHMjCRlQhipuycV3c+Q4hKgqzRJcwui/kUhT2Eb6nOq+WQuckJxu3rPzvU9
 4x4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757018397; x=1757623197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3HWs5BM/Zczfcib8xW5oddFZsmYZHDcxWDdtx5r08Kk=;
 b=ur+gnERVzupftZNuEUbMvIoyghB4EgGikIRnBKFXcgMCEyNBo8mhbHYirCzzZklNpn
 konTOBC4WRhGOG+dlzarF8xdjXGnBAbMrJnz0HihJW0y4A42d//n73MHPw4luBignC+b
 qQoxo5AYoS75Jq0hQe8XA/prj+A+3LsLb0/1JXJzuqTJGuHj9FrDGa0p//qROh1Jefp6
 nndmtNfHUwwQohQt4qUZKjGdB3BHlCA4E9DWLSwkkfoZJ5+vNe3fZo830LuJ5f9YRcB9
 hP3SaA10hcGiSJ5r+9o7OXK4TWeW2sHKozodNTyZAtw5t8xrtAZKKWRNhmZOYlkJ/QzC
 otgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc33dRDm6qjlCBy7BJmcPq0c84gFM0wff3Fkdy6ihRKHvVydjpXKw2K7oEAC9TGBSZ1cOr1roHnXUZ/Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwRycJHOUt/zDJ5VJJu6HTGhihrAGiU5Av0K+3jKXYjp5qSH+mv
 nHAreL4gvuTZaKtJ2OSBvk55V9JhQT0GJ7tMVLpbYJBEEaRj7eqc5kVI
X-Gm-Gg: ASbGncubl/WkzX4lxkBgzNb+5vqggC8jWeR0+IvxIXF5C23Gr1nvmwyUfmgcMUWMBc3
 w59xBlf+wqBIuyiQD+bUe6OtCZEymW/ibipxRWF7E+3b5pCcLWW55ncfu+bXQk9orzuMsoggmA4
 Oawm9eU8a6rudLXnFA9bJ8uMCwkvKsxTGXIhB0YYT/RAQ0en100r9JQZm0jIe4KnMXjqXF/sF1z
 Z/qOfnbrHUuzT6Xw/5wnJQXrSGOJSydS2MT3InCjO0yBgPCoHEJ5OlmUKennkswhL2BwgOc5Mxv
 JxHkIZt9/cVaLLuAqyw2lNT0/4IJdZ5Y/flGkxW07Xbhy+TQPBh3a0XMy1Tj/bi6015ECtSnFp2
 6ag9NSTJvm+oAg2PmNSKQ7nRN9Hy9tOSD0qW/uYdRBVRWbq8YD+oEHXJrOg==
X-Google-Smtp-Source: AGHT+IHL1oc02XZbGobYDQotXvvBze1vwYgK+kccWNcOGisk96waxJM71NYowbvY/REwkkmrpI/Nag==
X-Received: by 2002:a05:600c:a04:b0:45b:7d24:beac with SMTP id
 5b1f17b1804b1-45b8553335amr189504555e9.10.1757018397490; 
 Thu, 04 Sep 2025 13:39:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f306c93sm385528165e9.14.2025.09.04.13.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 13:39:56 -0700 (PDT)
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
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Thu,  4 Sep 2025 21:39:49 +0100
Message-ID: <20250904203949.292066-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac:
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
v1->v2:
- Switched using "renesas,r9a09g077-gbeth" compatible string for RZ/T2H
  instead of "renesas,rzt2h-gbeth".
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
index 022e595a9e1b..129543c37a5e 100644
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
@@ -163,7 +206,16 @@ static const struct renesas_gbeth_of_data renesas_gbeth_of_data = {
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
