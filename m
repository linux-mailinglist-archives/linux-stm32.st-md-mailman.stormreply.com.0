Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D008125744
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 23:55:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFC2FC36B0C;
	Wed, 18 Dec 2019 22:55:13 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED9EBC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 22:55:11 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 24FFE404CE;
 Wed, 18 Dec 2019 22:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576709710; bh=NmmAeVmnmq3Fk3aycE9gni+itLeoZyRuQ/a6zLOcV60=;
 h=From:To:Cc:Subject:Date:From;
 b=Wvu0gldDwPpxJWUQXxfo2aRX/YGR+qOXDA2VVvDJ8+Vts8IjZvT57pEk78sSboFLx
 6Hem0NrYrW39UYOyTbYNkbyLkl1D6zFaMHnG182kS2r4PN3/UHS9HV7npOXXZWTUuA
 bn77A0Pm8uCQ/fceXsvabo2pgyJzreB3EzjDlW+nPrSgHfGr4kdPV4ICm/ePZLUIVb
 6QmUAS4y3I46NwUMAZCIljYcrnG6nRp+D2wbnx3QxNEVnEpW6J0x1Wx1nRInIRaSZY
 VuMsmlO1cnOqRSev+2JAVlqoq2y9jH+eIjX+WKF2OGir2O5al8XMgrx+RUNfw+Upso
 luGV7g1tnmsTg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id B5A83A0060;
 Wed, 18 Dec 2019 22:55:05 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Wed, 18 Dec 2019 23:55:01 +0100
Message-Id: <b8ffd4685fac31a39ef5ba91485e685b21ead753.1576709577.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: tc: Fix TAPRIO division
	operation
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

For ARCHs that don't support 64 bits division we need to use the
helpers.

Fixes: b60189e0392f ("net: stmmac: Integrate EST with TAPRIO scheduler API")
Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

---
Completely untested as my setup is offline due to power-outrage. Carefull
review needed.
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
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 8ff8f9b9bb22..6c4686b77516 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -599,6 +599,7 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 	struct timespec64 time;
 	bool fpe = false;
 	int i, ret = 0;
+	u64 ctr;
 
 	if (!priv->dma_cap.estsel)
 		return -EOPNOTSUPP;
@@ -694,8 +695,9 @@ static int tc_setup_taprio(struct stmmac_priv *priv,
 	priv->plat->est->btr[0] = (u32)time.tv_nsec;
 	priv->plat->est->btr[1] = (u32)time.tv_sec;
 
-	priv->plat->est->ctr[0] = (u32)(qopt->cycle_time % NSEC_PER_SEC);
-	priv->plat->est->ctr[1] = (u32)(qopt->cycle_time / NSEC_PER_SEC);
+	ctr = qopt->cycle_time;
+	priv->plat->est->ctr[0] = do_div(ctr, NSEC_PER_SEC);
+	priv->plat->est->ctr[1] = (u32)ctr;
 
 	if (fpe && !priv->dma_cap.fpesel)
 		return -EOPNOTSUPP;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
