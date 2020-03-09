Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F138E17E133
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Mar 2020 14:30:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A78CDC36B0B;
	Mon,  9 Mar 2020 13:30:38 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FB49C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2020 13:30:34 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 568B040217;
 Mon,  9 Mar 2020 13:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583760633; bh=97U/sdHYXIUwOOXmojGePjGjAgvZEazHf2GWd8NdtTA=;
 h=From:To:Cc:Subject:Date:From;
 b=azbGtfZaswH7QBuBAURz58oiW7DrrvpSItJTvgWGtGxGnFzgj7VGRVQNK8haQiKTc
 07McFHwpGbWJ+Pt4uRJMauf4jAMRmiEjekuKx/StMXiSD/zl6Aye1B+YIa9svNlVwI
 Zym7ZCfXuQVLIf4YWFxSuIFwuyFXjhoKtoNCekcmHYpREXOcC0Hvb0ogO7lmraoWhU
 i4o0Al70y6P4siHk6mMBdn7ea9I8G+Ljx8NdP6wr7a+HsLAp83nJo4hWFaoi5ZvkzP
 Z1V61c+JxACn4nzZwW3bsm7ZLC0pTwlKLqzfF2pTgXnLzEhrQC2hGlqd3cGQL24T9w
 3v3F8X89Hhjrg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 7AC59A005C;
 Mon,  9 Mar 2020 13:30:29 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Mon,  9 Mar 2020 14:30:22 +0100
Message-Id: <4e5d8d273498a1c1c6b8f983e5dd7590c6dfd26a.1583760590.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: selftests: Fix L3/L4
	Filtering test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Since commit 319a1d19471e, stmmac only support basic HW stats type for
action. Set this field in the L3/L4 Filtering test so that it correctly
setups the filter instead of returning EOPNOTSUPP.

Fixes: 319a1d19471e ("flow_offload: check for basic action hw stats type")
Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index 586a657be984..07dbe4f5456e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -1387,6 +1387,7 @@ static int __stmmac_test_l3filt(struct stmmac_priv *priv, u32 dst, u32 src,
 	cls->rule = rule;
 
 	rule->action.entries[0].id = FLOW_ACTION_DROP;
+	rule->action.entries[0].hw_stats_type = FLOW_ACTION_HW_STATS_TYPE_ANY;
 	rule->action.num_entries = 1;
 
 	attr.dst = priv->dev->dev_addr;
@@ -1515,6 +1516,7 @@ static int __stmmac_test_l4filt(struct stmmac_priv *priv, u32 dst, u32 src,
 	cls->rule = rule;
 
 	rule->action.entries[0].id = FLOW_ACTION_DROP;
+	rule->action.entries[0].hw_stats_type = FLOW_ACTION_HW_STATS_TYPE_ANY;
 	rule->action.num_entries = 1;
 
 	attr.dst = priv->dev->dev_addr;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
