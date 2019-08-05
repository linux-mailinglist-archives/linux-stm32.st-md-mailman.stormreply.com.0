Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE72822C0
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2019 18:45:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B88AC10CAF;
	Mon,  5 Aug 2019 16:45:36 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (unknown [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D4A5C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2019 16:45:33 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C6296C01D4;
 Mon,  5 Aug 2019 16:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1565023530; bh=0qzfDib/TkS1Pnuz9bteOYFmisi1Lcw2FF4Y8DcAjZ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=eGqmVbSVDPu8ckUX66NOA/imFFRXZXoJigFiVbXz/MrszQONEBxo0MeUC/gRixpnO
 /I904RsggX/COfA8K0jazy2QwyGYdFsAVNbLU5zpiiDbrVDxx9jRxWTpvWDDOe9s/0
 X3dt9eI/kbpzu92yODMdped6BXQAejKgy2jGNPEAE1Q/poFrx84I9EVL0rrstvd9p0
 pPNd6D1ozP65mDouL+Wo+9QtVYT0GpGnPhzMjMYJ+IkyYphpi1lSK7ylU9GJEf/Rxt
 HlKvazufyE/jmMBv4XzCv+aU6Stq8lLGckeDd6P3lYycBCUI/pQIron4BKxcrWya8Z
 rK7l07GN5EgPQ==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 90193A00AC;
 Mon,  5 Aug 2019 16:45:28 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Mon,  5 Aug 2019 18:44:53 +0200
Message-Id: <5b217c7b110eb32183fd81c81b516d42228ac406.1565022597.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1565022597.git.joabreu@synopsys.com>
References: <cover.1565022597.git.joabreu@synopsys.com>
In-Reply-To: <cover.1565022597.git.joabreu@synopsys.com>
References: <cover.1565022597.git.joabreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 26/26] net: stmmac: selftests: Return
	proper error code to userspace
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

We can do better than just return 1 to userspace. Lets return a proper
Linux error code.

Signed-off-by: Jose Abreu <joabreu@synopsys.com>
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
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index a0da35b2b4c2..d40f6a109633 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -316,7 +316,7 @@ static int __stmmac_test_loopback(struct stmmac_priv *priv,
 		attr->timeout = STMMAC_LB_TIMEOUT;
 
 	wait_for_completion_timeout(&tpriv->comp, attr->timeout);
-	ret = !tpriv->ok;
+	ret = tpriv->ok ? 0 : -ETIMEDOUT;
 
 cleanup:
 	dev_remove_pack(&tpriv->pt);
@@ -477,7 +477,7 @@ static int stmmac_test_hfilt(struct stmmac_priv *priv)
 
 	/* Shall NOT receive packet */
 	ret = __stmmac_test_loopback(priv, &attr);
-	ret = !ret;
+	ret = ret ? 0 : -EINVAL;
 
 cleanup:
 	dev_mc_del(priv->dev, gd_addr);
@@ -509,7 +509,7 @@ static int stmmac_test_pfilt(struct stmmac_priv *priv)
 
 	/* Shall NOT receive packet */
 	ret = __stmmac_test_loopback(priv, &attr);
-	ret = !ret;
+	ret = ret ? 0 : -EINVAL;
 
 cleanup:
 	dev_uc_del(priv->dev, gd_addr);
@@ -559,7 +559,7 @@ static int stmmac_test_mcfilt(struct stmmac_priv *priv)
 
 	/* Shall NOT receive packet */
 	ret = __stmmac_test_loopback(priv, &attr);
-	ret = !ret;
+	ret = ret ? 0 : -EINVAL;
 
 cleanup:
 	dev_uc_del(priv->dev, uc_addr);
@@ -597,7 +597,7 @@ static int stmmac_test_ucfilt(struct stmmac_priv *priv)
 
 	/* Shall NOT receive packet */
 	ret = __stmmac_test_loopback(priv, &attr);
-	ret = !ret;
+	ret = ret ? 0 : -EINVAL;
 
 cleanup:
 	dev_mc_del(priv->dev, mc_addr);
@@ -696,7 +696,7 @@ static int stmmac_test_flowctrl(struct stmmac_priv *priv)
 	}
 
 	wait_for_completion_timeout(&tpriv->comp, STMMAC_LB_TIMEOUT);
-	ret = !tpriv->ok;
+	ret = tpriv->ok ? 0 : -ETIMEDOUT;
 
 cleanup:
 	dev_mc_del(priv->dev, paddr);
@@ -830,11 +830,11 @@ static int stmmac_test_vlanfilt(struct stmmac_priv *priv)
 			goto vlan_del;
 
 		wait_for_completion_timeout(&tpriv->comp, STMMAC_LB_TIMEOUT);
-		ret = !tpriv->ok;
+		ret = tpriv->ok ? 0 : -ETIMEDOUT;
 		if (ret && !i) {
 			goto vlan_del;
 		} else if (!ret && i) {
-			ret = -1;
+			ret = -EINVAL;
 			goto vlan_del;
 		} else {
 			ret = 0;
@@ -906,11 +906,11 @@ static int stmmac_test_dvlanfilt(struct stmmac_priv *priv)
 			goto vlan_del;
 
 		wait_for_completion_timeout(&tpriv->comp, STMMAC_LB_TIMEOUT);
-		ret = !tpriv->ok;
+		ret = tpriv->ok ? 0 : -ETIMEDOUT;
 		if (ret && !i) {
 			goto vlan_del;
 		} else if (!ret && i) {
-			ret = -1;
+			ret = -EINVAL;
 			goto vlan_del;
 		} else {
 			ret = 0;
@@ -995,7 +995,7 @@ static int stmmac_test_rxp(struct stmmac_priv *priv)
 	attr.src = addr;
 
 	ret = __stmmac_test_loopback(priv, &attr);
-	ret = !ret; /* Shall NOT receive packet */
+	ret = ret ? 0 : -EINVAL; /* Shall NOT receive packet */
 
 	cls_u32.command = TC_CLSU32_DELETE_KNODE;
 	stmmac_tc_setup_cls_u32(priv, priv, &cls_u32);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
