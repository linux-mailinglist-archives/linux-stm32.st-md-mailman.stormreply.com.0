Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C29B13710D
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2020 16:24:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BEABC36B11;
	Fri, 10 Jan 2020 15:24:01 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (sv2-smtprelay2.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27C64C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2020 15:23:59 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 746F140614;
 Fri, 10 Jan 2020 15:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1578669837; bh=J4+ntHbWrqFDN3ykef1qvG1EDza6rRkVc0EblLQVWPE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=KY5gMXxQulNzPxL5YMgmY4Ty5ZaSYheKGArANQX/m7+c9/OGiOCumvYhJQRJohMz8
 J8F08kGd5NqX5HPACSH++pbwo0VQrcSWPdIENRIQa7NS37Z6DznunJ3e+UZ857aU+e
 z5dKfRc5HEXkwndRe7GyEDMj7ZyQKlr9b1QgfkKZiN9PjpCSSG/3M9nyz1qAeVMTwH
 QgdFVuJjiI18hGnDaAXRZuTacIUB7ujkAfMD4O9r+873d9Nbmu5IShyWxkYRaymEO7
 Dx2yJT96ymwNWZ3M9MQwHLrMJNkOUMs93UEGiEdJngiGaueNPMkDZwXKfIKf2NH06g
 JGr10rTdRqZrw==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 450BFA0066;
 Fri, 10 Jan 2020 15:23:56 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Fri, 10 Jan 2020 16:23:52 +0100
Message-Id: <42050d75f00900b715a277bbc1d9abf437f6ea68.1578669661.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1578669661.git.Jose.Abreu@synopsys.com>
References: <cover.1578669661.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1578669661.git.Jose.Abreu@synopsys.com>
References: <cover.1578669661.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/2] net: stmmac: selftests: Update status
	when disabling RSS
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

We are disabling RSS on HW but not updating the internal private status
to the 'disabled' state. This is needed for next tc commit that will
check if RSS is disabled before trying to apply filters.

Fixes: 4647e021193d ("net: stmmac: selftests: Add selftest for L3/L4 Filters")
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
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c   | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index 13227909287c..36a4c43a799a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -1323,16 +1323,19 @@ static int __stmmac_test_l3filt(struct stmmac_priv *priv, u32 dst, u32 src,
 	struct stmmac_packet_attrs attr = { };
 	struct flow_dissector *dissector;
 	struct flow_cls_offload *cls;
+	int ret, old_enable = 0;
 	struct flow_rule *rule;
-	int ret;
 
 	if (!tc_can_offload(priv->dev))
 		return -EOPNOTSUPP;
 	if (!priv->dma_cap.l3l4fnum)
 		return -EOPNOTSUPP;
-	if (priv->rss.enable)
+	if (priv->rss.enable) {
+		old_enable = priv->rss.enable;
+		priv->rss.enable = false;
 		stmmac_rss_configure(priv, priv->hw, NULL,
 				     priv->plat->rx_queues_to_use);
+	}
 
 	dissector = kzalloc(sizeof(*dissector), GFP_KERNEL);
 	if (!dissector) {
@@ -1399,7 +1402,8 @@ static int __stmmac_test_l3filt(struct stmmac_priv *priv, u32 dst, u32 src,
 cleanup_dissector:
 	kfree(dissector);
 cleanup_rss:
-	if (priv->rss.enable) {
+	if (old_enable) {
+		priv->rss.enable = old_enable;
 		stmmac_rss_configure(priv, priv->hw, &priv->rss,
 				     priv->plat->rx_queues_to_use);
 	}
@@ -1444,16 +1448,19 @@ static int __stmmac_test_l4filt(struct stmmac_priv *priv, u32 dst, u32 src,
 	struct stmmac_packet_attrs attr = { };
 	struct flow_dissector *dissector;
 	struct flow_cls_offload *cls;
+	int ret, old_enable = 0;
 	struct flow_rule *rule;
-	int ret;
 
 	if (!tc_can_offload(priv->dev))
 		return -EOPNOTSUPP;
 	if (!priv->dma_cap.l3l4fnum)
 		return -EOPNOTSUPP;
-	if (priv->rss.enable)
+	if (priv->rss.enable) {
+		old_enable = priv->rss.enable;
+		priv->rss.enable = false;
 		stmmac_rss_configure(priv, priv->hw, NULL,
 				     priv->plat->rx_queues_to_use);
+	}
 
 	dissector = kzalloc(sizeof(*dissector), GFP_KERNEL);
 	if (!dissector) {
@@ -1525,7 +1532,8 @@ static int __stmmac_test_l4filt(struct stmmac_priv *priv, u32 dst, u32 src,
 cleanup_dissector:
 	kfree(dissector);
 cleanup_rss:
-	if (priv->rss.enable) {
+	if (old_enable) {
+		priv->rss.enable = old_enable;
 		stmmac_rss_configure(priv, priv->hw, &priv->rss,
 				     priv->plat->rx_queues_to_use);
 	}
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
