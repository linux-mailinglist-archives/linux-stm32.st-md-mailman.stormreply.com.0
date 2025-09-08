Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA13B48AC6
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Sep 2025 12:59:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F01AFC3F95F;
	Mon,  8 Sep 2025 10:59:15 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83F6EC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Sep 2025 10:59:14 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3d3ff4a4d6fso2596828f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Sep 2025 03:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757329154; x=1757933954;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=peDufwHvetmPOFt3DEDwzaxtxNLiJvPrin9RtvRg8KU=;
 b=equaNnjIn/c/hdOvz56SV8KMP1WocuQGR7UaRSHIrvh85e64IC3e5ARRFSS7BUkEcg
 SjkwzzZPesdUeoCyFL2DiqeTWOKxaSXydegnV1DBl//XH1osv/uHw5236hXPLG1TSOrS
 rMIr/w5XYPqVsgL7uyhJQ73SqQcnRM/igUp6EXNm7zSYJnaPC4xYwa5FNr0QGiSwBHRG
 v+feK2kMfd6qmWlvf6l2PBKbXIaMCnJzjSEKEqQILGRrPJfW+1gRv/foSwSP1PYofkMw
 tXmfA4JL1YrE8HqfxVntro7qcmLiqNEW2w54++DWOIQ0M8OyxjGHTn7nndxuRJcRcG2s
 YKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757329154; x=1757933954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=peDufwHvetmPOFt3DEDwzaxtxNLiJvPrin9RtvRg8KU=;
 b=gJt/seChPzLNYIWEsxgeZ3Gh1K1P5Lh7ni1w8K9Z75bo7ex9kHpAXKhABIIiEP66P+
 uxCPaSX5SwYkg3YfUBvzHC3ou7hYFSUxbvm4+bG/oxlu+QESR6U3u7tcDPzg0qqOjyY9
 JaB2lejLPnGsqnGz7GMg+hanQJNcmh5jx6avvTgiVpjr1t2mNS0dmgQ+k4GAV+nI4akM
 8PisIw+8p7TA3Ky4j+5FKG1nfA0VRMYS9L7sUDkMii14czAMbYIjTOEwX51wzGS5J3Gt
 8DGmLThDXzlS0vB7Kczf+/dxjK0MbV9R0+Ts1bF4Tqf2VAekaDjRhXWZR/S7YUMhgK7v
 JrKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe0WlfP5oTxmIAuMnnb4ZFmrxkqCS745gliFJC5PzfSvib1ARI7VN5A68Vbw4CrqmWZlN291UFadcuQA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz1+XfsLVq1w9VQWahbO28ftj85Vpn5eCnCmSy/MtewEhDW7gca
 QCzVWn84A0+q0Z7YV/tG7R6Kd3UEWgQtrBpTMC6zO3edREyMi0WaYFUf
X-Gm-Gg: ASbGncvx+/a2zFUbzEkTIQ03MkWMFIhJ56nyA4ro8+L35isfdr6S3IAdqCnvge/8qAE
 6BM59D9ureUQ3OyQKXveoLdlsifHhxriGWrCGUJ0Ch1yCsYWyHCIc+HZV6TrsQBJPZvpBobJgKN
 T6xO0Kw+IlMtjY3xILtOPRikIMhh8x8+nBzEuqnMhbpZdEp0taI1CHjULFhQH27T6dco5O6Ucv+
 sp+U9TELLQxJoqyWW5DKuxRSAgf+aLAWPPzXwut+gEPisYR/2X71DVDv/GoEqOl9k47SfoummND
 fCMzoHdr5/q6BRYqwEjR0qZCXWNiYPKNg6rjeeSRSDLqvDhRea6s1Ng291vPbuwVwUwQh6R9GNk
 iXR8rXfvFJWI2QfxZ32RCOD/6l3QhzFNhMSwdN3611xSYGR4e7kqNR57pEQ==
X-Google-Smtp-Source: AGHT+IELTgxCxxMFlkSEsgovlmb0CJQVYUnnXHGxbgqoK5YwfTIppZeS9BA8X3YNorpanLJ1ufvAzA==
X-Received: by 2002:a05:6000:2c0e:b0:3d7:94bb:cb9d with SMTP id
 ffacd0b85a97d-3e636d8f2ecmr5327019f8f.3.1757329153628; 
 Mon, 08 Sep 2025 03:59:13 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:393b:4605:1f6c:eea1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45ddfe0b654sm91063195e9.3.2025.09.08.03.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:59:13 -0700 (PDT)
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
Date: Mon,  8 Sep 2025 11:59:00 +0100
Message-ID: <20250908105901.3198975-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Subject: [Linux-stm32] [PATCH net-next v3 2/3] net: stmmac:
	dwmac-renesas-gbeth: Use OF data for configuration
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

Prepare for adding RZ/T2H SoC support by making the driver configuration
selectable via OF match data. While the RZ/V2H(P) and RZ/T2H use the same
version of the Synopsys DesignWare MAC (version 5.20), the hardware is
synthesized with different options. To accommodate these differences,
introduce a struct holding per-SoC configuration such as clock list,
number of clocks, TX clock rate control, and STMMAC flags, and retrieve
it from the device tree match entry during probe.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Made sure STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is
  always set for all the SoCs.

v1->v2:
- No changes.
---
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 57 +++++++++++++++----
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index df4ca897a60c..50be944ee37b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -16,12 +16,34 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/types.h>
 
 #include "stmmac_platform.h"
 
+/**
+ * struct renesas_gbeth_of_data - OF data for Renesas GBETH
+ *
+ * @clks: Array of clock names
+ * @num_clks: Number of clocks
+ * @stmmac_flags: Flags for the stmmac driver
+ * @handle_reset: Flag to indicate if reset control is
+ *                handled by the glue driver or core driver.
+ * @set_clk_tx_rate: Flag to indicate if Tx clock is fixed or
+ *                   set_clk_tx_rate is needed.
+ */
+struct renesas_gbeth_of_data {
+	const char * const *clks;
+	u8 num_clks;
+	u32 stmmac_flags;
+	bool handle_reset;
+	bool set_clk_tx_rate;
+};
+
 struct renesas_gbeth {
+	const struct renesas_gbeth_of_data *of_data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct reset_control *rstc;
 	struct device *dev;
@@ -70,6 +92,7 @@ static void renesas_gbeth_exit(struct platform_device *pdev, void *priv)
 
 static int renesas_gbeth_probe(struct platform_device *pdev)
 {
+	const struct renesas_gbeth_of_data *of_data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -91,14 +114,17 @@ static int renesas_gbeth_probe(struct platform_device *pdev)
 	if (!gbeth)
 		return -ENOMEM;
 
-	plat_dat->num_clks = ARRAY_SIZE(renesas_gbeth_clks);
+	of_data = of_device_get_match_data(&pdev->dev);
+	gbeth->of_data = of_data;
+
+	plat_dat->num_clks = of_data->num_clks;
 	plat_dat->clks = devm_kcalloc(dev, plat_dat->num_clks,
 				      sizeof(*plat_dat->clks), GFP_KERNEL);
 	if (!plat_dat->clks)
 		return -ENOMEM;
 
 	for (i = 0; i < plat_dat->num_clks; i++)
-		plat_dat->clks[i].id = renesas_gbeth_clks[i];
+		plat_dat->clks[i].id = of_data->clks[i];
 
 	err = devm_clk_bulk_get(dev, plat_dat->num_clks, plat_dat->clks);
 	if (err < 0)
@@ -109,25 +135,36 @@ static int renesas_gbeth_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL,
 				     "error finding tx clock\n");
 
-	gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(gbeth->rstc))
-		return PTR_ERR(gbeth->rstc);
+	if (of_data->handle_reset) {
+		gbeth->rstc = devm_reset_control_get_exclusive(dev, NULL);
+		if (IS_ERR(gbeth->rstc))
+			return PTR_ERR(gbeth->rstc);
+	}
 
 	gbeth->dev = dev;
 	gbeth->plat_dat = plat_dat;
 	plat_dat->bsp_priv = gbeth;
-	plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
+	if (of_data->set_clk_tx_rate)
+		plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
 	plat_dat->init = renesas_gbeth_init;
 	plat_dat->exit = renesas_gbeth_exit;
-	plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
-			   STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
-			   STMMAC_FLAG_SPH_DISABLE;
+	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
+			   gbeth->of_data->stmmac_flags;
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
+static const struct renesas_gbeth_of_data renesas_gbeth_of_data = {
+	.clks = renesas_gbeth_clks,
+	.num_clks = ARRAY_SIZE(renesas_gbeth_clks),
+	.handle_reset = true,
+	.set_clk_tx_rate = true,
+	.stmmac_flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+			STMMAC_FLAG_SPH_DISABLE,
+};
+
 static const struct of_device_id renesas_gbeth_match[] = {
-	{ .compatible = "renesas,rzv2h-gbeth", },
+	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, renesas_gbeth_match);
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
