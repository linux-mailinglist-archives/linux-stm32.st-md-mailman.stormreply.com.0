Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BD8965582
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 05:06:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4C75C71287;
	Fri, 30 Aug 2024 03:06:06 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F837C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 03:06:05 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Ww2zK5w8kzLqyk;
 Fri, 30 Aug 2024 11:03:41 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 80A3118007C;
 Fri, 30 Aug 2024 11:05:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 30 Aug
 2024 11:05:45 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <woojung.huh@microchip.com>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <linus.walleij@linaro.org>,
 <alsi@bang-olufsen.dk>, <justin.chen@broadcom.com>,
 <sebastian.hesselbarth@gmail.com>, <alexandre.torgue@foss.st.com>,
 <joabreu@synopsys.com>, <mcoquelin.stm32@gmail.com>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <hkallweit1@gmail.com>,
 <linux@armlinux.org.uk>, <UNGLinuxDriver@microchip.com>,
 <netdev@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-stm32@st-md-mailman.stormreply.com>, <krzk@kernel.org>,
 <jic23@kernel.org>
Date: Fri, 30 Aug 2024 11:13:25 +0800
Message-ID: <20240830031325.2406672-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830031325.2406672-1-ruanjinjie@huawei.com>
References: <20240830031325.2406672-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)
Cc: ruanjinjie@huawei.com
Subject: [Linux-stm32] [PATCH net-next v4 8/8] net: bcmasp: Simplify with
	scoped for each OF child loop
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

Use scoped for_each_available_child_of_node_scoped() when
iterating over device nodes to make code a bit simpler.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Justin Chen <justin.chen@broadcom.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v4:
- Add Reviewed-by.
v3:
- Sort the variables, longest first, shortest last.
- Add Reviewed-by.
v2:
- Split into 2 patches.
---
 drivers/net/ethernet/broadcom/asp2/bcmasp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
index 20c6529ec135..297c2682a9cf 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
@@ -1300,9 +1300,9 @@ static void bcmasp_remove_intfs(struct bcmasp_priv *priv)
 
 static int bcmasp_probe(struct platform_device *pdev)
 {
-	struct device_node *ports_node, *intf_node;
 	const struct bcmasp_plat_data *pdata;
 	struct device *dev = &pdev->dev;
+	struct device_node *ports_node;
 	struct bcmasp_priv *priv;
 	struct bcmasp_intf *intf;
 	int ret = 0, count = 0;
@@ -1374,12 +1374,11 @@ static int bcmasp_probe(struct platform_device *pdev)
 	}
 
 	i = 0;
-	for_each_available_child_of_node(ports_node, intf_node) {
+	for_each_available_child_of_node_scoped(ports_node, intf_node) {
 		intf = bcmasp_interface_create(priv, intf_node, i);
 		if (!intf) {
 			dev_err(dev, "Cannot create eth interface %d\n", i);
 			bcmasp_remove_intfs(priv);
-			of_node_put(intf_node);
 			ret = -ENOMEM;
 			goto of_put_exit;
 		}
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
