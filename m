Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC45DC977C8
	for <lists+linux-stm32@lfdr.de>; Mon, 01 Dec 2025 14:08:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8550AC628D3;
	Mon,  1 Dec 2025 13:08:25 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D5C1C628D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Dec 2025 13:08:24 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b762de65c07so52276766b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Dec 2025 05:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764594504; x=1765199304;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LgBCaTCV//Rn+e5Ee17YCnaLfz3jOXD1AdP/EJu9El8=;
 b=S62lAr9npiMpXCbVHONY1MP8zYJg+I0USL1dTRQZvzAfHiIp7rlPoctYnaJ5pJm40K
 ixLgAv/qzWxS+IT9ufH0ETICgVyjY3r0zJHZ/INh96ZVzbYhGdPs46SqpEfgGsiyikIb
 iTBJD+jeNq/Frtlw5X8E37vaSaFmGn07iVd6FUyCUOCsj8CJtIV0StrSIbCHG417K5yO
 6Gtpf7ES+xEquIgKk4s3tR4H79b5KCc4++ARsHC6VgOA0xcnyR8tYesoo4gXZysY8w1B
 VzANu8+Ee9DdMJ7B/gWWZku6eO6xfSd3wVoLiwDZkBnbwcLV+ZoGjgtFsBNQp5v6jOs8
 XgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764594504; x=1765199304;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LgBCaTCV//Rn+e5Ee17YCnaLfz3jOXD1AdP/EJu9El8=;
 b=Svp/hywhZmjSHr7JSuSuZ2KprCVbPvczLPszEetGE3sc4TDoikVJ/jOO9Xa3UKd/MY
 ohCOKIydWO/npHimU02bM76A6Hm34qxREnABdoYX7s2iXh3jdLtaQWSycsJkTpyUlG+b
 JXbwfydNvGgrlKyJETg9gPt9lp/Scp6XBUZ8xSr3eLWZNobaNQWPCisFbQhZPpNvvO3R
 Nons2WC2tipcv7hKTDnhsPn6Q7yGMeJiAg3xdwoKvsO90HiwtV/IcD5MaYwsQSKYejyc
 aQ6QqBBbpy/Z7yFQlwgz55lU3vlNZWfNROvt76+Rf1wwMxSCJWTpthXApVys2BEepUKq
 b4rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhRNnDtBcLQN0JhqneFVSnyG2ys/0r8dmJF3ts5wEQe13sSXyT8yKmy4xn3Gfwh2bz6Jytmd0KqFNm0g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwzT9kExXlbPgVv90Fb2mnBEVjEzgrVIK5UlK+IyST9PbMNACTl
 K6ysiKt6WCihSeQMSrgRFAApyRW61rSLcPRqr9B1ZZfzkdpmyRFcnXI0vuT6hBTkKu0=
X-Gm-Gg: ASbGncvO3JVRGPguQph2kQDlVBdlc5ytzs7uojmmavT1qK+6/QaHLBEG/m+5o2yLrmP
 fiGe9E6rUwQOx3lnHvbodDSvmEhizbTABZe4sAJf1z9O6flRTsf4cDL7TWrLSesp3aKkOfpyAmh
 vWwfkFEYT7YbI8A/fHMXj9fB6ryRLCoVcMdwgr87OVhwz4VcrXnc0w522+Ikm2AnqgTgRs7qUfg
 m+LgL7QiuhhkTZhmam0WrsJ8rXOZkJh37KzAI2hH9HpKcrsd0rq43HuZMycoKTDM0Hu9/LXimVV
 wTHQyKuryXZU5Suq6u9rk6JOr38XApobPTRV27XimTkm9noJYs2JYPtS/kNDU/in2sq01prwqyj
 S0Ca3mj0n33PKZKo9KTm0likUvxCwlOF0fcfXVqOhjKzFddB7QZpCWwJ3UCbLjj6GFu5zrKCpdF
 i0RUCyh3wtdfgFKbrm
X-Google-Smtp-Source: AGHT+IHy1zdsI4FJOvPH+ImtRkIFvBBnlJmdvObrk1mNXIvYLiipKTmpgEyhKmFkKGd/qTfSabPc2w==
X-Received: by 2002:a17:907:2d12:b0:b4b:dd7e:65f2 with SMTP id
 a640c23a62f3a-b76c546d9d3mr3021007766b.5.1764594503849; 
 Mon, 01 Dec 2025 05:08:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-b76f519e23esm1251235666b.23.2025.12.01.05.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 05:08:23 -0800 (PST)
Date: Mon, 1 Dec 2025 16:08:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Message-ID: <6275e666a7ef78bd4c758d3f7f6fb6f30407393e.1764592300.git.dan.carpenter@linaro.org>
References: <cover.1764592300.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1764592300.git.dan.carpenter@linaro.org>
Cc: s32@nxp.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, linaro-s32@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/4] net: stmmac: s32: use the syscon
 interface PHY_INTF_SEL_RGMII
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

On the s32 chipset the GMAC_0_CTRL_STS register is in GPR region.
Originally, accessing this register was done in a sort of ad-hoc way,
but we want to use the syscon interface to do it.

This is a little bit uglier because we to maintain backwards compatibility
to the old device trees so we have to support both ways to access this
register.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index 5a485ee98fa7..20de761b7d28 100644
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
+		regmap_write(gmac->sts_regmap, gmac->sts_offset, PHY_INTF_SEL_RGMII);
 
 	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
 
@@ -125,10 +132,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 
 	/* PHY interface mode control reg */
-	gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
-	if (IS_ERR(gmac->ctrl_sts))
-		return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
-				     "S32CC config region is missing\n");
+	gmac->sts_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+					"phy-sel", 1, &gmac->sts_offset);
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
