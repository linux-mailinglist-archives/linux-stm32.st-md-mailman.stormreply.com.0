Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70492701E2
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jul 2019 16:07:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C2C8CD5B4B;
	Mon, 22 Jul 2019 14:07:38 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48BC1CD5B49
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 14:07:37 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3898AC0A8A;
 Mon, 22 Jul 2019 14:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1563804455; bh=BVlhWoqq+b4gRXVHPwK2xuuFu+7zzbfOmcgyb6hD5ZE=;
 h=From:To:Cc:Subject:Date:From;
 b=cQAe7pMXq0a4EkIE0Ckv3jsIe2JYiHGXRgR9ieE9Nk7ZgiWp21hyvh8cKGjZDiodl
 Y0fPYbcLuTDHviZZycurnrsUZUSR5TXD69qvZ1cj0XboiyiQJIR3vjp99+dGVMzdNQ
 oQ+HfXNtB0Jpdq0IupJcjtFDtLvZ1IdQOuB/t83zfoclaO7j53AQPHXW7PVV0GTwvn
 so9PJfGHt7hOwDxZo8yUT2vPChXAdmHuEoYKSfEXcBYJUEkaH/D9q/qdbKnYpDexnk
 w8z3fQNWaCDCX41+7l8hTMPzLw0f7VzuCTwSb6CF+RkwwA3K1fqlez2mgrKc8viSMO
 +gcerTiSg7sLQ==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id F1887A0057;
 Mon, 22 Jul 2019 14:07:31 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Mon, 22 Jul 2019 16:07:21 +0200
Message-Id: <f9b8245ef4fbaca463a6084166c7f72793cb799b.1563804016.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Ondrej Jirman <megi@xff.cz>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: Do not cut down 1G modes
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

Some glue logic drivers support 1G without having GMAC/GMAC4/XGMAC.

Let's allow this speed by default.

Reported-by: Ondrej Jirman <megi@xff.cz>
Tested-by: Ondrej Jirman <megi@xff.cz>
Fixes: 5b0d7d7da64b ("net: stmmac: Add the missing speeds that XGMAC supports")
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
Cc: Ondrej Jirman <megi@xff.cz>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 207c3755bcc5..b0d5e5346597 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -814,20 +814,15 @@ static void stmmac_validate(struct phylink_config *config,
 	phylink_set(mac_supported, 10baseT_Full);
 	phylink_set(mac_supported, 100baseT_Half);
 	phylink_set(mac_supported, 100baseT_Full);
+	phylink_set(mac_supported, 1000baseT_Half);
+	phylink_set(mac_supported, 1000baseT_Full);
+	phylink_set(mac_supported, 1000baseKX_Full);
 
 	phylink_set(mac_supported, Autoneg);
 	phylink_set(mac_supported, Pause);
 	phylink_set(mac_supported, Asym_Pause);
 	phylink_set_port_modes(mac_supported);
 
-	if (priv->plat->has_gmac ||
-	    priv->plat->has_gmac4 ||
-	    priv->plat->has_xgmac) {
-		phylink_set(mac_supported, 1000baseT_Half);
-		phylink_set(mac_supported, 1000baseT_Full);
-		phylink_set(mac_supported, 1000baseKX_Full);
-	}
-
 	/* Cut down 1G if asked to */
 	if ((max_speed > 0) && (max_speed < 1000)) {
 		phylink_set(mask, 1000baseT_Full);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
