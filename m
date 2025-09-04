Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E920BB4477D
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 22:39:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 975EDC3FAD1;
	Thu,  4 Sep 2025 20:39:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDBF9C3FACF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 20:39:56 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45b7722ea37so8005025e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Sep 2025 13:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757018396; x=1757623196;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MdIf5gVpTwGEVzWTa0+48WrGpkdmS6Z3zAuyAh9kXOw=;
 b=NwPd62nTeZuNxe6h+0GEr27SMQRljANW7+kALfXuFoN9D6cbg7h5XxNZsa2HHuFd5M
 eAq1ZMgpQ7Kiv2+0BwRL3zUfxMflWpt+E/Mk7LjSs96kvRvRkkK1/ZlyHIMaeLVXGHHb
 qZHnC5Soxzb0ACoK7v7JQVkC4gjJ0QGE7gKQSA3olU3SuVtTLvmrmKoAW+ZGBEhstj5j
 vJFetvHhEIor4oUdfKA6ndRONAKnZWQ9hEA5gLoqsbi0AIAOsmTVDSJ7aRIv0je1oCu/
 OxZb9N2lPF/j9MyA5oGywk/xc3G79AEioNVbpN3XsGUSIFcEIXs9zamVqcPEFeItvZgY
 7xuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757018396; x=1757623196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MdIf5gVpTwGEVzWTa0+48WrGpkdmS6Z3zAuyAh9kXOw=;
 b=T/CSfNdgRxiWnBElENZCCc5BAh9A4ePc8MuFyODkrvEhpwCsgQCan/oV/6sjah70RB
 yiAgvLfOyITS5u31rRcHRRYmOXcCK+35TthwYe8GHmlYdQweTRbfaOBtgrHk0kWsZNSf
 5wJh82Jy+kRdjeqO5GFcQow+kfUy4c4Lys2fWPpzNbtljr0hNo0EpAY6CIBfb+EvPzGW
 0tsWBu5EzwVMFJdxNUpb4XEhgPM+YXatjXYK9RyZhZagnJW8upaqQ3T8vJod2UiE2USG
 HQ06V76+ZSW0OkAgh85BjTVVsqyWiWhCicDFJwtfLo6tOCF54jLwiYoB2htlUuz9K1Of
 l4Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTx/UY/FU0kA5zdQTM3JsB5LXnbbjrj2Ga9q7yEKKti3dska/gsBLsrckEscLx0tinn4gQfEXH9oB+zQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyWLOZiunTCU4d3T0m3teUVE4Ev98GDll/JKy9uS5LjjFg7GEOL
 9XZNAPdvfb9tiiK5NHg7dSAjMGhhU2+dA/IJTKxAEovP43AtzqKfaPrd
X-Gm-Gg: ASbGncsI+3NZtF4uV/AyOTDtNmT7D9ru6plx1S10erJpGHc4L4p40RSTZ0dOdk7p+LE
 RvcDyRMF8p1NwwcsHzNo9EQiSV25kSkTYKN4srwN5EIQke8a3acEhTJdbZkjyzs8V0M0Bsh6Hso
 jHS5oiKabM+vonX7kOlzE5hdsfgCtfbJDtfy9MLlvWb9rXlqXDgn2cX0Wk3ZAPg5NB/iQUxysjB
 0oxOZPp8dgkx1e7EntnRnkkv3hXbeB5jxc9l+DWP2DfutdbuQ5DFKB+t9HiUjSvJhx1hOQnOxlH
 JroSzxPyFQUoSn+wCUlUXIZhe0rVcEI+2aJqW/zQ/fzkd4fzt4N7SO0dK+oqHWce5nI4e/gO9Om
 Fb0dQdl8iOiJPkQMr6KWj3t6n5Zsi1JKJ8A9gGUfj7LnJOM5TQymsqjpNKw==
X-Google-Smtp-Source: AGHT+IHRTq0c9/U3clgYS/p+MF96IzAw4NdSVmzLuPTx5EY7YzBTRKNNSm4tAMGAq21gTWaRf+ycWg==
X-Received: by 2002:a05:600c:350e:b0:45b:47e1:ef7b with SMTP id
 5b1f17b1804b1-45dd5b5f591mr9778465e9.17.1757018396031; 
 Thu, 04 Sep 2025 13:39:56 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f306c93sm385528165e9.14.2025.09.04.13.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 13:39:55 -0700 (PDT)
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
Date: Thu,  4 Sep 2025 21:39:48 +0100
Message-ID: <20250904203949.292066-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Subject: [Linux-stm32] [PATCH net-next v2 2/3] net: stmmac:
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
v1->v2:
- No changes
---
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 57 +++++++++++++++----
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index df4ca897a60c..022e595a9e1b 100644
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
+	plat_dat->flags |= gbeth->of_data->stmmac_flags;
 
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
+static const struct renesas_gbeth_of_data renesas_gbeth_of_data = {
+	.clks = renesas_gbeth_clks,
+	.num_clks = ARRAY_SIZE(renesas_gbeth_clks),
+	.handle_reset = true,
+	.set_clk_tx_rate = true,
+	.stmmac_flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+			STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
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
