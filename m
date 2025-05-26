Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C4FAC3FAB
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 14:54:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55654C36B2B;
	Mon, 26 May 2025 12:54:08 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2A67C78F71
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 00:30:29 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3dc6dbb3d58so14845405ab.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 May 2025 17:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748219429; x=1748824229;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hE9h/M7uKcWqMcsxjrPkg3JJriS4MccIRahSsbbNqE8=;
 b=i5vj3lNDX+4TNn70dVVtuLx57T7SmTO4KmHg6azIny+N4orhm6/cn0g7xHwUKb7U+P
 pF0TSvuuf3TKp+ukW9asqpO3URBOUeSWA98jQoug0EtsuJzSP7+CTjfq3iBaRelFXX6N
 wswvbrBlZMjh2UPDVjA6tgxYmwX5lWf2/1EjFpmUF1cT/MonZ2TkvX6YMHKwGx4uI6Pr
 8eMBOaTMBA+5yICe8OSE3SxgoEtfbQtAXwh0BZKr14sRve+6BFXdn4Ze21mxG/VVVYV1
 fypc0CHC47HQuvV23rLrrO63deKe3bGCkWc4kgkDNMF5erIgPwtQG0+W0rhZKnNWqGot
 4Hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748219429; x=1748824229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hE9h/M7uKcWqMcsxjrPkg3JJriS4MccIRahSsbbNqE8=;
 b=wlewPzgHwY6t/BrLtINa4jdS6FQpZpFCO2FUVa5XMlQttlRwYiDEcLOtmjlIL9ChlT
 Nr654ba/wttfj/tMYiUMG9TEvfCfNdZD6te3hI8fUoFy4K+weMi+Zh+F8fphhhY9fk2W
 eZmKm50A7yDqvsJdkR3CEoYH4L94WiWDhKZ9G3aI/+VzhhxosLuDzIunXkANs8WwGxWQ
 kPnicFBIbhYPk7MzJwqI3Eww6UQazGM4EibyWA6qLxFp1tuTMwyTCc9Wi5IDZzHiqqf4
 vcgnVMNskmRSWq+RGN1MledHTSptoHz1Bod0dT2uo0EGbKcI/ykqyTq9meeRgUn1/ItI
 bONA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdoCn0wE4JLVjpjp5g1RalMqWSTepfZqBX8bmvly4UbQU1ktDqRhDasZvs86FMeDfrwDQFQ8/O3cnfYg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyp04dTarCA8n/yIC1PKAr7nzjbc3fcK49EyTW+S0bJ+eJ10+lq
 t+wNoO2AHmzRUjlTqzonAeMCqZ4EuNjy7h9yz8fpH9xYvI0yZwB5R9/BF13K/B/PhYM=
X-Gm-Gg: ASbGncuemFn7yiAXF5UYWHMfUi0r2+zwR3vfZJnHP5SyB0nIUg65phL0Lw4WktYLlpF
 lkQroFDH/z9ERzfLj8UdCLmCD+3pavweRT12B4tYuvm2bWm3mciv2dXCyt/xqOYLqyQaqhJn3RY
 J4fynOpuwg4kMKyq3TmTOvTCXfR4zgWqkuFvXaYn9qzO8plFRLjHPovXrzQB4PmcXR1GKXxUvUH
 qi1QzJtr1cnBYQFpwAXgxYO3G2MVOv4A6fxm+NiIei9Y5GK3F6C18j2ETMZi2c2ShFzkl6FSgZV
 d4hYHE3ju3vN/PtvKkp5bboGy2ENgCC/I2WvGkoaqrcAOBYWcnNWqHcfnRzPCBvdAu/GbGOJefl
 5f8MtoOqprfrMApLrQZgSbdFlQUuOVw==
X-Google-Smtp-Source: AGHT+IHeprWN0OT6Xq1C608Ko9smpP11pwLwlFe3T1+FZlCl5LSrUPerfPVKNYI6owNKSrybdMvlyA==
X-Received: by 2002:a05:6e02:2193:b0:3dc:8b57:b759 with SMTP id
 e9e14a558f8ab-3dc9b7517a5mr74670715ab.21.1748219428699; 
 Sun, 25 May 2025 17:30:28 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-220.hlrn.qwest.net.
 [97.118.146.220]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3dc85ef07dcsm25532785ab.36.2025.05.25.17.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 May 2025 17:30:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: netdev@vger.kernel.org
Date: Sun, 25 May 2025 18:29:22 -0600
Message-Id: <20250526002924.2567843-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526002924.2567843-1-james.hilliard1@gmail.com>
References: <20250526002924.2567843-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 May 2025 12:54:05 +0000
Cc: Huacai Chen <chenhuacai@kernel.org>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Yanteng Si <si.yanteng@linux.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 Yinggang Gu <guyinggang@loongson.cn>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Feiyang Chen <chenfeiyang@loongson.cn>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Hilliard <james.hilliard1@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [RFC PATCH 2/2] net: stmmac: dwmac-sun8i: Allow
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
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 6c7e8655a7eb..e275f4caa684 100644
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
 
+#define AC300_KEY		BIT(8)
+
 /* sun8i_dwmac_dma_reset() - reset the EMAC
  * Called from stmmac via stmmac_dma_ops->reset
  */
@@ -1159,6 +1162,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	struct net_device *ndev;
 	struct regmap *regmap;
 	int ret;
+	u16 val;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
 	if (ret)
@@ -1222,6 +1226,21 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
+	if (!nvmem_cell_read_u16(dev, "ac300", &val)) {
+		const char *phy_name = (val & AC300_KEY) ? "ac300" : "ac200";
+		int index = of_property_match_string(dev->of_node, "phy-names", phy_name);
+		if (index < 0) {
+			dev_err(dev, "PHY name not found in device tree\n");
+			return -EINVAL;
+		}
+
+		plat_dat->phy_node = of_parse_phandle(dev->of_node, "phys", index);
+		if (!plat_dat->phy_node) {
+			dev_err(dev, "Failed to get PHY node from phys property\n");
+			return -EINVAL;
+		}
+	}
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
