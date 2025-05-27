Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C61AC596D
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 19:56:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95D9EC36B1E;
	Tue, 27 May 2025 17:56:35 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84382C36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 17:56:34 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-6f8aa9e6ffdso32413336d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 10:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748368593; x=1748973393;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CPM8Cvieqz5nNvWINKg7DvU/92uvEyS4n24d/iV9dr0=;
 b=FSXsVB7ZwWrmPr2fVLSg/fGDgyR3X+/+Mv6bJ4M6YghgFU+bubnB8PTC3LTPHVj21s
 bGPl5MtIxsnDip8v/skP2ty2wkwmUu9+1vQvoLwCXOy70/H23nZuwr6rCNqnnPYBixQ/
 gVCe5gP57tFJGaCRQhd7k8S4YcJlLnQDMkDZ1ca07SRYQBsu+3WUOlqypBTc5vfgMCEI
 F3FMRh3GBIC2uItKK6phi/rDAGoDSAda/9UnsVMH0TQm/+JOgeawVJJndry4ZN7fSgAb
 MmShZmiARLmdudvJcei6kmdD9ksEPE0dJb3AD8TCCLVewZcMV/njJ8xAiacdPebs6G9F
 uFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748368593; x=1748973393;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CPM8Cvieqz5nNvWINKg7DvU/92uvEyS4n24d/iV9dr0=;
 b=MNCMy5bl7Z+7LG8Uze1vthqHV0Esq/sTcWD0PnzUobCHihO9V3fkI0uhGg4p40SHc7
 c5BS5cidKPYYEBQm3auKvefZkfiPai3WA3rVzq4vykFOaXUFmzq8k7oMO98yt1Inx86q
 blJZ7YPLkv/0J5Sfv5HJGWoQwlzUwSG1/diQPMmv9wteBzEiWtGYZUt09csWDPAvxJ67
 hlBnHiGw1SoJysNJltjABO/fu95v1Ianay8a1rdVXOPPi8mb9Qo9FFLwOrW+m5CuTRLG
 +8Axlun3T3OL7wnW+q2vPrf1RAEKpj8+UwbkMObPBoHMjLwEt3ysxkhre3wsIc1QYOqA
 VEoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT8ftZWGoCs8eiNOTnIjvfEVvXkCFii/TtrqcLGDlyO4XS0L3Fpv6RqD/8uJnQM/ERdEKWHSu1ceyHmQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy8CWlQ9MRTkHP0CHruYXdavXeeJqhYR3XMfolr0cAfpgY/zIWv
 FBlYVAb+42w5WXXrZGmojqwcRalfU2n9Jo8H0swkf/a9Kj4OK7925JSH5UjwddmgHng=
X-Gm-Gg: ASbGncu+lgjQnziPJfp93YWAsShesswn6FPzYlQArNPIz0Qpw+Bybq2YepSqZNuRkh3
 MvHGhsQwqYi7pytWfqMxurYueMvHHVXaTPe+f4DMxmWkeLZC2QTZPpClvc6gv7p+lRBC3Jl+6YG
 cnNHchOzIpuWBwVikUbzwHQyqR4zHkKyGz9ctUEoilANle4kmIbV6xPPx1HedFg5CJkr7rXJ0lZ
 Ry4lg5+2C2iK7EH8CPHucMUSCBjp9VXwEyhc5XLOC7H1mH0bMaTD5pw7KPuyUDB+py3JgRDs2aa
 CUF9NRyfA0Iy5kpYSF8VVulWBtDC2LQ+YZ9ReC+0DACDI8QDZ5zQvGU92bMPRU40J4NbT7Jqau3
 1yw0H9iNidZ14Ij2FHoUaWcoAuKTYeA==
X-Google-Smtp-Source: AGHT+IGb7ZAkz0DXl6pr3hb3Rtl1mnfnjPXpzgihCk3W+jtxghNllqAVA4MuKf6P/Nz/db42HhLmew==
X-Received: by 2002:a05:6e02:1b05:b0:3dc:7563:c3d7 with SMTP id
 e9e14a558f8ab-3dc9b6a1250mr157952185ab.12.1748368582436; 
 Tue, 27 May 2025 10:56:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net.
 [97.118.146.220]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3dc82e014f4sm38082275ab.40.2025.05.27.10.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 10:56:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: netdev@vger.kernel.org
Date: Tue, 27 May 2025 11:55:55 -0600
Message-Id: <20250527175558.2738342-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527175558.2738342-1-james.hilliard1@gmail.com>
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Cc: Huacai Chen <chenhuacai@kernel.org>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Yanteng Si <si.yanteng@linux.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 Yinggang Gu <guyinggang@loongson.cn>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 James Hilliard <james.hilliard1@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH v2 2/3] net: stmmac: dwmac-sun8i: Allow
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

The Allwinner H616 ships with two different copackaged phy variants,
in order to determine the phy being used we need to read an efuse and
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
