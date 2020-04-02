Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5CA19C354
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Apr 2020 15:57:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF4C6C36B0B;
	Thu,  2 Apr 2020 13:57:16 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0EC3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Apr 2020 13:57:15 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D0ABB43BB0;
 Thu,  2 Apr 2020 13:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585835834; bh=WxB9gfK7GgZCSSdeiOrOcAWKApS/sOPCGGGM63tiPEQ=;
 h=From:To:Cc:Subject:Date:From;
 b=SExtHH2/3uXBmmuJPIQIqhFRsoYdNajCJQ1pS2JGL7z5jnl3R/dZNe6/0He/izxdO
 v+zCqA/rU8SvFWnQcfbsO/vyzcNwleriVnxioC+RGwbza21xF1XC3U721RWJXkBWRm
 IL6AEBis1v/gyRaBVsEEDbXpLrSIz+thlhyyiAOGUpOsJVjK8/jKfIyn9op/WO66xq
 5lMNl0X/lQnw5BPXsRqTmMZ1m1pnlCITIQj4LxdU1hqqzXG58qRPKE++lvBQFIt46o
 C1GY4XqJ8Ku7z04idUbEWry9734w2OeXZlGEE8EZm6cQT3wpdQu4eb2XqR8HYfYjel
 mmSmWFe6x0Wjw==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 93E62A005B;
 Thu,  2 Apr 2020 13:57:11 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Thu,  2 Apr 2020 15:57:07 +0200
Message-Id: <daf6d10d679c24e9b33b758b249b9b70e5eb1f01.1585835790.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: xgmac: Fix VLAN register
	handling
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

Commit 907a076881f1, forgot that we need to clear old values of
XGMAC_VLAN_TAG register when we switch from VLAN perfect matching to
HASH matching.

Fix it.

Fixes: 907a076881f1 ("net: stmmac: xgmac: fix incorrect XGMAC_VLAN_TAG register writting")
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
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 0e4575f7bedb..ad4df9bddcf3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -577,8 +577,13 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 			value |= XGMAC_VLAN_EDVLP;
 			value |= XGMAC_VLAN_ESVL;
 			value |= XGMAC_VLAN_DOVLTC;
+		} else {
+			value &= ~XGMAC_VLAN_EDVLP;
+			value &= ~XGMAC_VLAN_ESVL;
+			value &= ~XGMAC_VLAN_DOVLTC;
 		}
 
+		value &= ~XGMAC_VLAN_VID;
 		writel(value, ioaddr + XGMAC_VLAN_TAG);
 	} else if (perfect_match) {
 		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
@@ -589,13 +594,19 @@ static void dwxgmac2_update_vlan_hash(struct mac_device_info *hw, u32 hash,
 
 		value = readl(ioaddr + XGMAC_VLAN_TAG);
 
+		value &= ~XGMAC_VLAN_VTHM;
 		value |= XGMAC_VLAN_ETV;
 		if (is_double) {
 			value |= XGMAC_VLAN_EDVLP;
 			value |= XGMAC_VLAN_ESVL;
 			value |= XGMAC_VLAN_DOVLTC;
+		} else {
+			value &= ~XGMAC_VLAN_EDVLP;
+			value &= ~XGMAC_VLAN_ESVL;
+			value &= ~XGMAC_VLAN_DOVLTC;
 		}
 
+		value &= ~XGMAC_VLAN_VID;
 		writel(value | perfect_match, ioaddr + XGMAC_VLAN_TAG);
 	} else {
 		u32 value = readl(ioaddr + XGMAC_PACKET_FILTER);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
