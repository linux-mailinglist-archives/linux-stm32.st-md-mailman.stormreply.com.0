Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E949696037E
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 09:44:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49481C7802D;
	Tue, 27 Aug 2024 07:44:41 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5334C78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 07:44:35 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WtKGy6L3Hz1HFm4;
 Tue, 27 Aug 2024 15:41:14 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 60CF5140154;
 Tue, 27 Aug 2024 15:44:33 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Aug
 2024 15:44:32 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <woojung.huh@microchip.com>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <linus.walleij@linaro.org>,
 <alsi@bang-olufsen.dk>, <justin.chen@broadcom.com>,
 <sebastian.hesselbarth@gmail.com>, <alexandre.torgue@foss.st.com>,
 <joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <hkallweit1@gmail.com>,
 <linux@armlinux.org.uk>, <ansuelsmth@gmail.com>,
 <UNGLinuxDriver@microchip.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-stm32@st-md-mailman.stormreply.com>, <krzk@kernel.org>,
 <jic23@kernel.org>
Date: Tue, 27 Aug 2024 15:52:16 +0800
Message-ID: <20240827075219.3793198-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827075219.3793198-1-ruanjinjie@huawei.com>
References: <20240827075219.3793198-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Cc: ruanjinjie@huawei.com
Subject: [Linux-stm32] [PATCH -next 4/7] net: mdio: mux-mmioreg: Simplified
	with scoped function and dev_err_probe()
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

Avoids the need for manual cleanup of_node_put() in early exits
from the loop by using for_each_available_child_of_node_scoped().

And use the dev_err_probe() helper to simplify error handling during probe.
This also handle scenario, when EDEFER is returned and useless error
is printed.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/net/mdio/mdio-mux-mmioreg.c | 51 ++++++++++++-----------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/net/mdio/mdio-mux-mmioreg.c b/drivers/net/mdio/mdio-mux-mmioreg.c
index de08419d0c98..08c484ccdcbe 100644
--- a/drivers/net/mdio/mdio-mux-mmioreg.c
+++ b/drivers/net/mdio/mdio-mux-mmioreg.c
@@ -96,7 +96,7 @@ static int mdio_mux_mmioreg_switch_fn(int current_child, int desired_child,
 
 static int mdio_mux_mmioreg_probe(struct platform_device *pdev)
 {
-	struct device_node *np2, *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node;
 	struct mdio_mux_mmioreg_state *s;
 	struct resource res;
 	const __be32 *iprop;
@@ -109,52 +109,43 @@ static int mdio_mux_mmioreg_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ret = of_address_to_resource(np, 0, &res);
-	if (ret) {
-		dev_err(&pdev->dev, "could not obtain memory map for node %pOF\n",
-			np);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "could not obtain memory map for node %pOF\n", np);
 	s->phys = res.start;
 
 	s->iosize = resource_size(&res);
 	if (s->iosize != sizeof(uint8_t) &&
 	    s->iosize != sizeof(uint16_t) &&
 	    s->iosize != sizeof(uint32_t)) {
-		dev_err(&pdev->dev, "only 8/16/32-bit registers are supported\n");
-		return -EINVAL;
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "only 8/16/32-bit registers are supported\n");
 	}
 
 	iprop = of_get_property(np, "mux-mask", &len);
-	if (!iprop || len != sizeof(uint32_t)) {
-		dev_err(&pdev->dev, "missing or invalid mux-mask property\n");
-		return -ENODEV;
-	}
-	if (be32_to_cpup(iprop) >= BIT(s->iosize * 8)) {
-		dev_err(&pdev->dev, "only 8/16/32-bit registers are supported\n");
-		return -EINVAL;
-	}
+	if (!iprop || len != sizeof(uint32_t))
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "missing or invalid mux-mask property\n");
+	if (be32_to_cpup(iprop) >= BIT(s->iosize * 8))
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "only 8/16/32-bit registers are supported\n");
 	s->mask = be32_to_cpup(iprop);
 
 	/*
 	 * Verify that the 'reg' property of each child MDIO bus does not
 	 * set any bits outside of the 'mask'.
 	 */
-	for_each_available_child_of_node(np, np2) {
+	for_each_available_child_of_node_scoped(np, np2) {
 		u64 reg;
 
-		if (of_property_read_reg(np2, 0, &reg, NULL)) {
-			dev_err(&pdev->dev, "mdio-mux child node %pOF is "
-				"missing a 'reg' property\n", np2);
-			of_node_put(np2);
-			return -ENODEV;
-		}
-		if ((u32)reg & ~s->mask) {
-			dev_err(&pdev->dev, "mdio-mux child node %pOF has "
-				"a 'reg' value with unmasked bits\n",
-				np2);
-			of_node_put(np2);
-			return -ENODEV;
-		}
+		if (of_property_read_reg(np2, 0, &reg, NULL))
+			return dev_err_probe(&pdev->dev, -ENODEV,
+					     "mdio-mux child node %pOF is missing a 'reg' property\n",
+					     np2);
+		if ((u32)reg & ~s->mask)
+			return dev_err_probe(&pdev->dev, -ENODEV,
+					     "mdio-mux child node %pOF has a 'reg' value with unmasked bits\n",
+					     np2);
 	}
 
 	ret = mdio_mux_init(&pdev->dev, pdev->dev.of_node,
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
