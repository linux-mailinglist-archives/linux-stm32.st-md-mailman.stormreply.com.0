Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E86813710C
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2020 16:24:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A1C5C36B0E;
	Fri, 10 Jan 2020 15:24:01 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ADB9C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2020 15:23:59 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8B25C40617;
 Fri, 10 Jan 2020 15:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1578669837; bh=Tzgqy5mfUlP11G5dMWBkE/G8KGSMMm7VMyafaqnQDXc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=cEIRMwFA8tzWI52Mf0b+XRxJ8m31NaIlnuS2buIgJzZFW6greSb7+tKbOa++vSBzc
 7QfhqR4Pnt2nzLdpGZzWCoNBcIZyOSGxG71vrVEk/Dsitals59/yLHGY6GYqRygRz3
 O2WHatELCgFuXJ5DSeSIX0WIj2EHiUlcVIrq/JJCcG+f/R2t3yPTbSqsXVkcJQl+R1
 niylholPlKGCga+uPJASd9SIPEpf3yLRSefr+MeJ0fp+sIlv2czdIdw1cVCc7w0zap
 4+gD2SpBFThWV73nKErJ19Ap6GL/dyqHQaEVa/nOpfcu4oeBBvedEMBEK9U6sB998Y
 0za0xDOu4nQXg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 4CF13A0067;
 Fri, 10 Jan 2020 15:23:56 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Fri, 10 Jan 2020 16:23:53 +0100
Message-Id: <9d6b1bbc1878c33a281ef1c8d3a8541bc181655a.1578669661.git.Jose.Abreu@synopsys.com>
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
Subject: [Linux-stm32] [PATCH net 2/2] net: stmmac: tc: Do not setup flower
	filtering if RSS is enabled
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

RSS, when enabled, will bypass the L3 and L4 filtering causing it not
to work. Add a check before trying to setup the filters.

Fixes: 425eabddaf0f ("net: stmmac: Implement L3/L4 Filters using TC Flower")
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
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 7d972e0fd2b0..9ffae12a2122 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -577,6 +577,10 @@ static int tc_setup_cls(struct stmmac_priv *priv,
 {
 	int ret = 0;
 
+	/* When RSS is enabled, the filtering will be bypassed */
+	if (priv->rss.enable)
+		return -EBUSY;
+
 	switch (cls->command) {
 	case FLOW_CLS_REPLACE:
 		ret = tc_add_flow(priv, cls);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
