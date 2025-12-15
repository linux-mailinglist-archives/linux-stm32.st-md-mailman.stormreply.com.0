Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B133CBE583
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Dec 2025 15:41:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDFD9C3F944;
	Mon, 15 Dec 2025 14:41:53 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77D44C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 14:41:52 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4775895d69cso14280105e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 06:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765809712; x=1766414512;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vYKorhS7YGhwUqCGDk14PflDiZGeXR2MSlBlFfYQc3I=;
 b=g6aJJ1TniHUTFXCaeNKUXqRW1+jORpi36gLQOFRKADRwRYbk/c6V+QV/THAM4iyNY3
 9Pmrt5z6L7WxWd7c7gzRNLihmsFZbIkzvrQHeT3hEgxayZF4arfvwvB5S1YlM/t5yM4l
 07ciVE+oJzt0O33WP0bKjPX8JRgmhIerGTJ5ge+X2v7budM7T/YovxzuOrpmqGVwTGkN
 x6I9PbxoAjKKLZ0/67ktDbYzXlKyWkNtNW6hRozI2optUCYbBZbsed1PHkDVIwg49yHL
 NuAqoQKRyA91OyepTayFxvSFImp1g2fpDdi0Jt3g7Rusovi/awlpJWfI79C+OaAwK+Tt
 zwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765809712; x=1766414512;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vYKorhS7YGhwUqCGDk14PflDiZGeXR2MSlBlFfYQc3I=;
 b=Hwaavb9Ib5WZwFgtxIxbDNeOBo7JL+sRbxyRp7h4B4zYTW8Darlw1/cFyuX1MOgOlp
 QM9k6AqFOsYXPMoNAlYn4LeapttY6jZS/b8Lf5eQ0rhbzEzXVchTcVk90WdB82dH1pv6
 6mHfdorvHbHvkhq6Jj5yHOZqo0XPXS8dBEDuF60vFNYYk4B4ulsMFcM5Gyx+etwNkp8k
 ull/fvnOehFhHr6AJhQWXYmH8vrkp8/2pkTrUOrMNYR3EdpO33po4zyzE4dpoNOP5fy3
 Vb2UIbetoHn1S1EX229oeNgFmaY6ENamkYOhH4kIgEIsd+g1+6N21nCBebzcoUkfhhtk
 gw1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNCVUYppugvWGa7pdJ4WQ1HwgNS0Q6iSSZ1icByi5gQk3bJfSFrliUsv3ei2HkH77/KQFAebrDcyYF5g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwnwX2xtGx0FxXkn+HBLuaIeAhPinbHmgi2pGVyiu5qsmfQMUuK
 gdenW2C5Jr19gFckLzAvleRwMqbGXf9reo8112dP5yiCfXB50dcrVjzAJvO/GmME5EQ=
X-Gm-Gg: AY/fxX4JvTrYxTivswamFYjwBTeqjfdB2Ei4wwEhCbl8jOqWQVs9i94FDTKOz3xPu67
 +/PROEEUwolyum2dlHfqVxpEZNATVFn39VXzmjZcdC04FUkCa5SNaYp/8fF3wrY58xhkrG+qPe2
 96UI5XArAeq/mqrfRO4xDDg/L9E3adxWP+yVN5vlVSQx5g7CCQb8IGPnhovM3eYfAefR7QunGaJ
 ufD3xkWdqfZr055dDD5i1TrXYmiFOaLsoRjTkJLRKfRYSEx6fL+OThAwli+eKskLe50wibAzPZg
 ls2hlEVBKW8+KxeB8DsWD3B1+7EThZv66O8sK4lfawTa19thMneR1o5xyL9iOxi3Y0GcGabwID4
 HlcrSpHkv2I6P2YlD7Qwsn4XWF3PUOoRUg/0P0v+SnzLbrr0OP65YQZtdqkO3JTdKgo+Fx+YbSO
 exXWXQUq6VDR9l4/+md5jmZgBVf9U=
X-Google-Smtp-Source: AGHT+IEW/XhvEhUWKukxpWXuAbDWYWTlu7iooVXodta81YuWRVJW/8nSpMCMutfNZkEu59rJRR8Kmw==
X-Received: by 2002:a05:600c:35c9:b0:479:3046:6bb3 with SMTP id
 5b1f17b1804b1-47a8f906f07mr122335555e9.23.1765809711699; 
 Mon, 15 Dec 2025 06:41:51 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f8d9a06sm187528625e9.10.2025.12.15.06.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 06:41:51 -0800 (PST)
Date: Mon, 15 Dec 2025 17:41:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Message-ID: <f7ee93f0a8c6d6b9de3f2b37da9e038bfa7f290a.1765806521.git.dan.carpenter@linaro.org>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1765806521.git.dan.carpenter@linaro.org>
Cc: imx@lists.linux.dev, s32@nxp.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linaro-s32@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/4] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
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

On the s32 chipsets the GMAC_0_CTRL_STS register is in GPR region.
Originally, accessing this register was done in a sort of ad-hoc way,
but we want to use the syscon interface to do it.

This is a little bit ugly because we have to maintain backwards
compatibility to the old device trees so we have to support both ways
to access this register.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/

 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index 5a485ee98fa7..2e6bb41f49e1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -11,12 +11,14 @@
 #include <linux/device.h>
 #include <linux/ethtool.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_mdio.h>
 #include <linux/of_address.h>
 #include <linux/phy.h>
 #include <linux/phylink.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/stmmac.h>
 
 #include "stmmac_platform.h"
@@ -32,6 +34,8 @@
 struct s32_priv_data {
 	void __iomem *ioaddr;
 	void __iomem *ctrl_sts;
+	struct regmap *sts_regmap;
+	unsigned int sts_offset;
 	struct device *dev;
 	phy_interface_t *intf_mode;
 	struct clk *tx_clk;
@@ -40,7 +44,10 @@ struct s32_priv_data {
 
 static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
 {
-	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
+	if (gmac->ctrl_sts)
+		writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
+	else
+		regmap_write(gmac->sts_regmap, gmac->sts_offset, S32_PHY_INTF_SEL_RGMII);
 
 	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
 
@@ -125,10 +132,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 
 	/* PHY interface mode control reg */
-	gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
-	if (IS_ERR(gmac->ctrl_sts))
-		return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
-				     "S32CC config region is missing\n");
+	gmac->sts_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+					"nxp,phy-sel", 1, &gmac->sts_offset);
+	if (gmac->sts_regmap == ERR_PTR(-EPROBE_DEFER))
+		return PTR_ERR(gmac->sts_regmap);
+	if (IS_ERR(gmac->sts_regmap)) {
+		gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
+		if (IS_ERR(gmac->ctrl_sts))
+			return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
+					     "S32CC config region is missing\n");
+	}
 
 	/* tx clock */
 	gmac->tx_clk = devm_clk_get(&pdev->dev, "tx");
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
