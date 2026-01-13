Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 367E4D19554
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 15:13:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDFCAC8F283;
	Tue, 13 Jan 2026 14:13:38 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D05EC8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 14:13:37 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-47edffe5540so3017215e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 06:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768313617; x=1768918417;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TyN9CjZVHq/sRLIyiaBUmdg0t2143/50j9chMJQ/vMY=;
 b=QUwo/BsNKmnaC/rYMIK9GmgoFzl37ksfcFCo88yLk+I014q2165alfyY4sC5jpcQ7Y
 aofwj52YM4EmBzgCOwMyHgrrl9PUyZSa/WEnlGljl7Son2YbPIGTwRFRkxn5MSjgLDCU
 yXApnI5nLJgQtnhYHo9lPrb0vG8a6zXvL1y5frQd9gGUGc7Oq4pqtiJx9OfR3SgdWwch
 Fra2MfaVtXiHGJa3ZlWwXvRYm01/7+ng47SdH6QOUOG72ZPkF8rdkdEt1fIPw2unKGbk
 qQLsjarJyMhfk6ZSZTdP8BPRlnqbD7wv1Vu6UhAyh1SPV+QRFDtnVksSdnEqeGPL4iGb
 ZjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768313617; x=1768918417;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TyN9CjZVHq/sRLIyiaBUmdg0t2143/50j9chMJQ/vMY=;
 b=VYfCjskEYYXurOKYdsg41kEVqhvL6LcDaVg7XsuSmaJxfKRhLNoJ+cFIgK8OmhZLb0
 j2wx8rW3WyM/CKfVOy/JejJHNt5YOiQhU7CXkLov10aACIJ5h9uSv6vx27CKhvbgSXkE
 FRTWhqF/bH56tgjzOSvUc4Pbf6ee8MUbm+hHJykHs0C1J8LVm/DsW/59dbE9iu1L3MEE
 hItOTIoFUy3lr2i7bUSN+CsFRfe0FdKR8jByRsNbtL6d2HWTSqwKSQy1NJZXcynV5J5n
 57C9Aw6VXoD/L2tfHPdHv1BZ+gLNyXFDU0hHUII3MukeHzfatp+lAMKq9jLjmCRvMmda
 ptaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxb+0j96wvCL2M4ADSzGUYX/yPMaDwm65SSQaE8q2BCnmgToytLIC8UHWe1H1yUiLbmmaeVFVKIVyS3A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzn776FJFSTUloGVSiZc8lEJQ1Mj+i2W8DgfeTSuXfY3KAaMxPA
 7f0MOKvJ/eaDTGyMeb0/EN7hWSGagcGx1Rm8sAhN82mR0lDMRGyfFKu0SiBkj8I4uak=
X-Gm-Gg: AY/fxX67CrG8RiCcMzhdhL4z68l1diEOtqh+qfY2Q0AJL/QlT4fyImfV8qatnXZ7PF/
 ENXo6s8f84AyW6bTweaVEE0FXqNIsH8RXHYqS13JhXRfE3MDWbuodKI+EycEtPFc/Q63d82j6B4
 /aCscS2CcJSYyzt0MYQ/xzk+xUL+wUwxus9BXuaKn6ZaK6rrik1dUywfmXSag4SPMGrCkmRDE5I
 zpcp5wgFqkoaBxlTTs2FmciCAU4cM8pBkIZXpa1IHVHeHFgMX2cfHPR48jioMUdaf0vpYapTxEF
 ueZRstSebPXIC8KS/IrFiAlS7C2I2TPtO0fbabaLm8c//0WzTgcNbl+KH0ksqkLllzS5TMC2cQy
 +E1xcOheUAqT7AByaMowSkVK1O6zV+8iBrO7gySjNLRhcJ4hteaQ3zz6Si2NYuDYOOTXT5DURK0
 iBc/I2/nQ2HvNmm5rv
X-Google-Smtp-Source: AGHT+IEV6roObAcijlx4iVb9hdZfVlmXIQUK0U2XACejoOBJ5fxJJv4g1ZBGNz5KDAWxxOTyVwwC4Q==
X-Received: by 2002:a05:600c:45ce:b0:47d:264e:b371 with SMTP id
 5b1f17b1804b1-47d84b30d79mr233877785e9.18.1768313616542; 
 Tue, 13 Jan 2026 06:13:36 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47edb26792fsm33518525e9.14.2026.01.13.06.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 06:13:36 -0800 (PST)
Date: Tue, 13 Jan 2026 17:13:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Petrous <jan.petrous@oss.nxp.com>, Frank Li <Frank.li@nxp.com>
Message-ID: <30e6a67514e97e798905872e2907b5b005ff2292.1768311583.git.dan.carpenter@linaro.org>
References: <cover.1768311583.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1768311583.git.dan.carpenter@linaro.org>
Cc: imx@lists.linux.dev, s32@nxp.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linaro-s32@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/3] net: stmmac: s32: use a syscon for
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
v3: Unchanged
v2: Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/
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
