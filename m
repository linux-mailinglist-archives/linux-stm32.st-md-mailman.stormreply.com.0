Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE91512B40
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Apr 2022 08:03:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41EFAC6046D;
	Thu, 28 Apr 2022 06:03:27 +0000 (UTC)
Received: from mail-m121145.qiye.163.com (mail-m121145.qiye.163.com
 [115.236.121.145])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98237C5F1FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Apr 2022 00:59:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [58.22.7.114])
 by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 830FE800324;
 Thu, 28 Apr 2022 08:59:30 +0800 (CST)
From: Jianqun Xu <jay.xu@rock-chips.com>
To: peppe.cavallaro@st.com,
	alexandre.torgue@st.com,
	joabreu@synopsys.com
Date: Thu, 28 Apr 2022 08:59:28 +0800
Message-Id: <20220428005928.525921-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWRlMGEJWSUgdGktITx
 hKThlIVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MyI6Cyo5FT04OhM1ES41CkM3
 IzEwFBlVSlVKTU5KSktMTkxKSktDVTMWGhIXVREaAlUDDjsJFBgQVhgTEgsIVRgUFkVZV1kSC1lB
 WU5DVUlJVUxVSkpPWVdZCAFZQUlKS0w3Bg++
X-HM-Tid: 0a806dae2479b03akuuu830fe800324
X-Mailman-Approved-At: Thu, 28 Apr 2022 06:03:26 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, Jianqun Xu <jay.xu@rock-chips.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ethernet: stmmac: fix for none child queue
	node for tx node
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

In case of nothing to be set for tx node result in no child queue node
for the tx node, this patch init the queue to tx_queues_to_use instead
of 0 to support dt file set no queue node for tx node.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 2d8c095f3856..dfe2375bc3c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -235,7 +235,7 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 	else
 		plat->tx_sched_algorithm = MTL_TX_ALGORITHM_SP;
 
-	queue = 0;
+	queue = plat->tx_queues_to_use;
 
 	/* Processing individual TX queue config */
 	for_each_child_of_node(tx_node, q_node) {
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
