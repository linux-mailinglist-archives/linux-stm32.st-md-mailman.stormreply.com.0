Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 348C5A50A3
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2019 10:02:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0D91C24023;
	Mon,  2 Sep 2019 08:02:20 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc2-smtprelay2.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A133C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2019 08:02:19 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 73872C0429;
 Mon,  2 Sep 2019 08:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1567411337; bh=S9lXifIRV5LjZ5ja6p24Sciaey7X+yvmq/cydA1irIk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=BLwBVfN7hA1rp7Sxty/6goc9/Ku1UoJEkeGGpccfIziQrgzYBHtZb5eLrN3fPOV2d
 gjrdPJ/4Pz1dkK4ryh3C5K3xxBhUGgqpCjHXeUO/07QJ1wDfpApUsisYkeLoENxRsg
 kWz3hLOXzAa507rcYcy0vXmsdn7lHn3hXpMAyP6wBtgPuVaAbYzmNoKiVV4p9saGQl
 NLcyfoyv0SWkH4LOvLTCnDpENGAWh5xKkL218lZt7WwTia88RBq6+tHPiwoyOvuj3v
 DgjQXrBknSLjFVvZ4tfA4a5BOnkHrhl3oxZGTwNkJ2FatZWLwoMW8QQGKRLvbt+7s8
 6MSgG7wp7jPPw==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 12ECDA0064;
 Mon,  2 Sep 2019 08:02:15 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Mon,  2 Sep 2019 10:01:43 +0200
Message-Id: <04cd49b1c7529a464fe0b03a88b275ce85b1ca3d.1567410970.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567410970.git.joabreu@synopsys.com>
References: <cover.1567410970.git.joabreu@synopsys.com>
In-Reply-To: <cover.1567410970.git.joabreu@synopsys.com>
References: <cover.1567410970.git.joabreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 01/13] net: stmmac: selftests: Return
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
index ecc8602c6799..d3234338a0ca 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -318,7 +318,7 @@ static int __stmmac_test_loopback(struct stmmac_priv *priv,
 		attr->timeout = STMMAC_LB_TIMEOUT;
 
 	wait_for_completion_timeout(&tpriv->comp, attr->timeout);
-	ret = !tpriv->ok;
+	ret = tpriv->ok ? 0 : -ETIMEDOUT;
 
 cleanup:
 	if (!attr->dont_wait)
@@ -480,7 +480,7 @@ static int stmmac_test_hfilt(struct stmmac_priv *priv)
 
 	/* Shall NOT receive packet */
 	ret = __stmmac_test_loopback(priv, &attr);
-	ret = !ret;
+	ret = ret ? 0 : -EINVAL;
 
 cleanup:
 	dev_mc_del(priv->dev, gd_addr);
@@ -512,7 +512,7 @@ static int stmmac_test_pfilt(struct stmmac_priv *priv)
 
 	/* Shall NOT receive packet */
 	ret = __stmmac_test_loopback(priv, &attr);
-	ret = !ret;
+	ret = ret ? 0 : -EINVAL;
 
 cleanup:
 	dev_uc_del(priv->dev, gd_addr);
@@ -562,7 +562,7 @@ static int stmmac_test_mcfilt(struct stmmac_priv *priv)
 
 	/* Shall NOT receive packet */
 	ret = __stmmac_test_loopback(priv, &attr);
-	ret = !ret;
+	ret = ret ? 0 : -EINVAL;
 
 cleanup:
 	dev_uc_del(priv->dev, uc_addr);
@@ -600,7 +600,7 @@ static int stmmac_test_ucfilt(struct stmmac_priv *priv)
 
 	/* Shall NOT receive packet */
 	ret = __stmmac_test_loopback(priv, &attr);
-	ret = !ret;
+	ret = ret ? 0 : -EINVAL;
 
 cleanup:
 	dev_mc_del(priv->dev, mc_addr);
@@ -699,7 +699,7 @@ static int stmmac_test_flowctrl(struct stmmac_priv *priv)
 	}
 
 	wait_for_completion_timeout(&tpriv->comp, STMMAC_LB_TIMEOUT);
-	ret = !tpriv->ok;
+	ret = tpriv->ok ? 0 : -ETIMEDOUT;
 
 cleanup:
 	dev_mc_del(priv->dev, paddr);
@@ -833,11 +833,11 @@ static int stmmac_test_vlanfilt(struct stmmac_priv *priv)
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
@@ -909,11 +909,11 @@ static int stmmac_test_dvlanfilt(struct stmmac_priv *priv)
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
@@ -998,7 +998,7 @@ static int stmmac_test_rxp(struct stmmac_priv *priv)
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
