Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 616A2124426
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 11:17:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BCEDC36B12;
	Wed, 18 Dec 2019 10:17:57 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (us03-smtprelay2.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 588DFC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 10:17:55 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1E8F9C0104;
 Wed, 18 Dec 2019 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576664273; bh=tK4WjKNsmZWt7T7XYmc4LxY6m+JF69CegqR/VxH5Bbw=;
 h=From:To:Cc:Subject:Date:From;
 b=NX5DsbG30dPMEQ56qJbLJPbYSWe28OoZWa4zXLs4H0pnl43FEo9hcuA9U678kZ96/
 Ra7rCM2hEcabN1L6RDc74ev04GxvM7j0LUZ55LmSu5JmkhCbuC9W0I7vmRQgnhciMo
 udr4igkFfeJS1c+T+h6Q8Tte+9AGKj2Z//rn2Ti5xceRmKRe+II3tglADR5jE2b/oA
 SdDL1XL0LZb3gFUAcHQMWkI9x0KQ3insIFHXmYmfZ4Flb5+uOlOAAM7l3p/WAtW2fJ
 fJbqVplkBTnQE4Y6NwUF5xaJDIq2ooggjeR6IPHY2FrbR3fmkUOW7zCP2EFvQ6n7l7
 mCuH0fB45MHNQ==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 40DA8A0066;
 Wed, 18 Dec 2019 10:17:50 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Wed, 18 Dec 2019 11:17:34 +0100
Message-Id: <cover.1576664155.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v3 0/9] net: stmmac: Fixes for -net
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

Fixes for stmmac.

1) Fixes the filtering selftests (again) for cases when the number of multicast
filters are not enough.

2) Fixes SPH feature for MTU > default.

3) Fixes the behavior of accepting invalid MTU values.

4) Fixes FCS stripping for multi-descriptor packets.

5) Fixes the change of RX buffer size in XGMAC.

6) Fixes RX buffer size alignment.

7) Fixes the 16KB buffer alignment.

8) Fixes the enabling of 16KB buffer size feature.

9) Always arm the TX coalesce timer so that missed interrupts do not cause
a TX queue timeout.

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

Jose Abreu (9):
  net: stmmac: selftests: Needs to check the number of Multicast regs
  net: stmmac: Determine earlier the size of RX buffer
  net: stmmac: Do not accept invalid MTU values
  net: stmmac: Only the last buffer has the FCS field
  net: stmmac: xgmac: Clear previous RX buffer size
  net: stmmac: RX buffer size must be 16 byte aligned
  net: stmmac: 16KB buffer must be 16 byte aligned
  net: stmmac: Enable 16KB buffer size
  net: stmmac: Always arm TX Timer at end of transmission start

 drivers/net/ethernet/stmicro/stmmac/common.h       |  5 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 53 +++++++++++++---------
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c |  4 ++
 5 files changed, 42 insertions(+), 25 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
