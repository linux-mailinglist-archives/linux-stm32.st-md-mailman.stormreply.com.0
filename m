Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B7DE9EF4
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Oct 2019 16:29:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B2DEC36B0F;
	Wed, 30 Oct 2019 15:29:07 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 720D7C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 15:29:04 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 32231C0DE4;
 Wed, 30 Oct 2019 15:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1572449343; bh=66e/bYyhcGrAFctAHp4076TE/JEaWIo4me4coBNTLE4=;
 h=From:To:Cc:Subject:Date:From;
 b=UisusYJw9jOvIsXZkfJxzPB8s+FfMXeBNTap3qWNDjaLtsNIAJo3ZDActVJ3vMkg/
 so418MsACo0KkbTR3ZntPXQF9s1g8LrZ+tWzFSWxmJqJ1qJ26AM5hqtgJR20LaQAKW
 dVekW/7G5jUlyAVeIi+xEGsty4fYBzi3Zs423KPVO4bugjqj45dSH8V5YhAI52lAN6
 EtN1OntgLkWJBn3zOop8FBT0QkGuYsNvoi1JwweQoBlp1p+F8ZWfKtfXK2NIXNVEgO
 sYJDAMgmfZ+QSEi15Iu9kV0C2woDau+Pt94hGEpdFPB3jxiUQLYSzL+TyL2YthpRN7
 ZOXfxvQLH8tOg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 51946A0057;
 Wed, 30 Oct 2019 15:28:56 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Wed, 30 Oct 2019 16:28:47 +0100
Message-Id: <cover.1572449009.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: Improvements for
	-next
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

Misc improvements for stmmac.

Patch 1/3, adds the support for Split Header feature in GMAC4+ cores. This
was already available for XGMAC and now with this change it is supported in
all relevant cores.

Patch 2/3, adds the support for C45 MDIO callbacks in XGMAC cores.

Patch 3/3, removes the speed dependency in TC CBS callbacks because XGMAC3
supports CBS feature at speeds up to 10Gbps

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

Jose Abreu (3):
  net: stmmac: gmac4+: Add Split Header support
  net: stmmac: xgmac: Add C45 PHY support in the MDIO callbacks
  net: stmmac: tc: Remove the speed dependency

 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  7 ++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c | 21 ++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   | 19 +++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h   |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c  | 47 ++++++++++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    |  2 -
 7 files changed, 89 insertions(+), 9 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
