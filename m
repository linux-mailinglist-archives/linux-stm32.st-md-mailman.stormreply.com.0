Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB3FAC43B8
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 20:30:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23EEEC36B0F;
	Mon, 26 May 2025 18:30:17 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F5AEC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 18:30:15 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-85b3f92c8dfso68974439f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 11:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748284214; x=1748889014;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=95DMf2o/6QqJigi08+dNX9nTEaleJKhH1r+O8T2YuA4=;
 b=ZDBhsWjaoRkGOO2b/k9Bj+12kLC1BJO/a13cOY+4rbjj+wYZ1cubrfDQg5TyLXxHQt
 Bs51skIIwiVK6sifWrJkbfTR/AwUQJHpD221BZ0nKcpejhMMPylMPXdazFqvY59Itl3U
 wJSAKmb/ty8B1weFyuWjHTpdw03nGeFoDa0LmxMZEe2YZcf6Sf3p0VDOjVWrRLMzoEVi
 PCN9VvBXxGE8wFPQBCDD1mbhilrUdQW1+KzoPAbVepiavib2YQEMmK4oA9ltvyKYgJfx
 MNoY9Nj9M/K19+MAlaKhITbTGKMi27/fJXGi8e8GXBItMioHlqHsVIMk4y0V/8FeoimB
 7C7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748284214; x=1748889014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=95DMf2o/6QqJigi08+dNX9nTEaleJKhH1r+O8T2YuA4=;
 b=ap66lAt7uDoEhdL7h6oApboEBrKqUUzabcx0kzL13yZtNEBKBDk81zvnHISS0+qHfO
 gR6sUGkjPfc5OjGuLo1p4Y77J4yqSbfJJmtAkW5Ngfxjt5c3dQGKetskKAjBPrMXQ9Sp
 E1wMpMeIDxACEYFvSWYK0hstTMhXLbCqf3wbn0muoVVvEZtt1hGilbHzk5vJ/yrTwCfO
 9LeH0eY1TisddomYUmPiFNbsIprh7Yweqt5xeNjI9MqHDrrctuqc1DI9kUvnNLjGHTZH
 TRPozXaW1UK3tbTF+3KT9mYDRDHtnLqdLJ1tDTq2H0dhERnOzvo/cNzAGUbDAb1Duflb
 GDPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk1zI5RQ2HbrrGPkT/4gVVrZqu5HIzJgHYHMUkskDTTvk2tX9agLZ8Gn8BBGc5ucqtlZ62nz/RAy2h7Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwoTSoo/+dNo0VkVGg4b8nf0GbIAZH+k0u10IiITtV/b+Rgdm5z
 VR2I9UUdOrQcjbzOsLaGeA6UCfkD1wu1DZK6u/wIkUlBbdcB8Brkhm+q
X-Gm-Gg: ASbGncsGq+ZLg8PBOTv2U2HIf0CSy+jE25962Nx/5OIldrQfENpxBdCxdfmaPsRIKPK
 ZiRkV5jnxEHVm1wpVWNnt2W3Wra59Iy3YZKLlQXQXVJJA8AzMZKZ6liJx6jFJMIUxFKNbmByRYa
 DYU6U6dALU+fNreGFmHmUJW0gOsKz2TP6KW0GmlL8N5R/UNokSpvghYHNedzcFuvJLb3B4GeObh
 hCC2r2TWJNURXWVHyzi62VTChLu8s47XmNfbOKwskI/5ajqdAGwfonIgv6Aruf3GLPrPd6bvVzB
 84stcjnUgWXFhBja7wvu1BnHEImWXuzbwh6NOB2HpYsSCFBMHMTb+qCVQRXyATe1Tdd9qLXOncn
 B1tustLWDW9YWRz3IWK9LGN8OXyBY1w==
X-Google-Smtp-Source: AGHT+IFDdvdL5g5ovSs/1gRBNnLk8GUjN90DAUSZdCdx+omEcVNlJWEAmQHeKYZ7rWqPkDPPkFePrg==
X-Received: by 2002:a05:6602:750c:b0:867:6680:cfd with SMTP id
 ca18e2360f4ac-86cbb7b82a4mr997010839f.1.1748284214365; 
 Mon, 26 May 2025 11:30:14 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net.
 [97.118.146.220]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-86a235bff69sm477028639f.8.2025.05.26.11.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 11:30:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: netdev@vger.kernel.org
Date: Mon, 26 May 2025 12:29:35 -0600
Message-Id: <20250526182939.2593553-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526182939.2593553-1-james.hilliard1@gmail.com>
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Yanteng Si <si.yanteng@linux.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Feiyang Chen <chenfeiyang@loongson.cn>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 James Hilliard <james.hilliard1@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH v1 2/3] net: stmmac: dwmac-sun8i: Allow
	runtime AC200/AC300 phy selection
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

The Allwinner H616 ships with two different on-die phy variants, in
order to determine the phy being used we need to read an efuse and
then select the appropriate PHY based on the AC300 bit.

By defining an emac node without a phy-handle we can override the
default PHY selection logic in stmmac by passing a specific phy_node
selected based on the ac200 and ac300 names in a phys list.

This allows us to have a device tree that defines both PHY variants
even though only one will actually end up being used at runtime
based on the ac300 nvmem efuse bit.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 6c7e8655a7eb..50d37876fabf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -11,6 +11,7 @@
 #include <linux/mdio-mux.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
@@ -280,6 +281,8 @@ static const struct emac_variant emac_variant_h6 = {
 #define SYSCON_ETCS_EXT_GMII	0x1
 #define SYSCON_ETCS_INT_GMII	0x2
 
+#define AC300_KEY		BIT(8) /* 1: AC300 PHY, 0: AC200 PHY */
+
 /* sun8i_dwmac_dma_reset() - reset the EMAC
  * Called from stmmac via stmmac_dma_ops->reset
  */
@@ -1149,6 +1152,35 @@ static struct regmap *sun8i_dwmac_get_syscon_from_dev(struct device_node *node)
 	return regmap;
 }
 
+/* H616 SoCs can contain either an AC200 PHY (needs i2c init) or an AC300
+ * PHY (no i2c). The silicon variant is flagged by the AC300_KEY efuse.
+ */
+static int sun8i_dwmac_get_ac300_phy(struct device *dev,
+				     struct plat_stmmacenet_data *plat_dat)
+{
+	u16 val;
+
+	/* If the nvmem cell is absent, use normal phy selection. */
+	if (nvmem_cell_read_u16(dev, "ac300", &val))
+		return 0;
+
+	const char *phy_name = (val & AC300_KEY) ? "ac300" : "ac200";
+	int index = of_property_match_string(dev->of_node, "phy-names",
+					     phy_name);
+	if (index < 0) {
+		dev_err(dev, "PHY name not found in device tree\n");
+		return -EINVAL;
+	}
+
+	plat_dat->phy_node = of_parse_phandle(dev->of_node, "phys", index);
+	if (!plat_dat->phy_node) {
+		dev_err(dev, "Failed to get PHY node from phys property\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int sun8i_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -1222,6 +1254,10 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
+	ret = sun8i_dwmac_get_ac300_phy(dev, plat_dat);
+	if (ret)
+		return ret;
+
 	/* platform data specifying hardware features and callbacks.
 	 * hardware features were copied from Allwinner drivers.
 	 */
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
