Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A30513FBF
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Apr 2022 02:46:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E28CCC6047D;
	Fri, 29 Apr 2022 00:46:13 +0000 (UTC)
Received: from mail-m121145.qiye.163.com (mail-m121145.qiye.163.com
 [115.236.121.145])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFAEEC60467
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Apr 2022 00:46:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [58.22.7.114])
 by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 74245800280;
 Fri, 29 Apr 2022 08:46:09 +0800 (CST)
From: Jianqun Xu <jay.xu@rock-chips.com>
To: kuba@kernel.org, davem@davemloft.net, joabreu@synopsys.com,
 alexandre.torgue@st.com, peppe.cavallaro@st.com
Date: Fri, 29 Apr 2022 08:46:05 +0800
Message-Id: <20220429004605.1010751-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428010927.526310-1-jay.xu@rock-chips.com>
References: <20220428010927.526310-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWRlDH0NWS0tMTU1PHx
 hDQx5NVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRg6GRw5ED02EBEfIxgJN0of
 TjoKCwhVSlVKTU5KSkJISkxLSk5CVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
 WU5DVUlJVUxVSkpPWVdZCAFZQUlCSE83Bg++
X-HM-Tid: 0a8072c84756b03akuuu74245800280
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Jianqun Xu <jay.xu@rock-chips.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2] ethernet: stmmac: support driver work for
	DTs without child queue node
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

The driver use the value of property 'snps,rx-queues-to-use' to loop
same numbers child nodes as queues, such as:

    gmac {
        rx-queues-config {
            snps,rx-queues-to-use = <1>;
            queue0 {
                // nothing need here.
	    };
	};
    };

Since a patch for dtc from rockchip will delete all node without any
properties or child node, the queue0 node will be deleted, that caused
the driver fail to probe:

    rk_gmac-dwmac: probe of ffa80000.ethernet failed with error -22

This patch try to support driver work well for DTs without setting for
the child queue nodes and then have none child queue nodes.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
v2:
 - change subject and update commit comment, sugguested by Kicinski

 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 2d8c095f3856..4f01a41c485c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -279,7 +279,7 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 
 		queue++;
 	}
-	if (queue != plat->tx_queues_to_use) {
+	if (queue != plat->tx_queues_to_use && of_get_child_count(tx_node)) {
 		ret = -EINVAL;
 		dev_err(&pdev->dev, "Not all TX queues were configured\n");
 		goto out;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
