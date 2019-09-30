Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6009C1CD7
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Sep 2019 10:19:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 509B0C36B24;
	Mon, 30 Sep 2019 08:19:30 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9D86C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 08:19:28 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 50C11C0371;
 Mon, 30 Sep 2019 08:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1569831567; bh=X6ZuF3t+/sYHmhk5OVSm+g3RjPonhti5heRvhuw4Vho=;
 h=From:To:Cc:Subject:Date:From;
 b=l+/KdG0pKWvbdymwv42EIOi+8FdJw3GGE65tEJc16tl4r9V70l1fb2pIJAWbN8v3I
 5jmyrl7IyHq4kLMFISbiioBWYFz/Th5n4O5YQaWUtIYSS+Kc6lzfFc4RqD5k3/+3ZR
 sj5FtRrsyQ6erUwuVWVrA8JlpgvYDIz1LiopCs+shzQ8gmr7h+vn8pxQWNrGTYdxSH
 e6oU/H+IlaVIilAKZEiHSprmoHIt0LUxTU4IcmpnmRc8ne2g+xeXCrkokwhbGEi+3v
 4BueV+lMcmQwHCTkmiaOklfqdRDx+eM+qFdgsZyd0hUCg6oohEaEmEWgxhrMXrLt5J
 0Jkp6ttf5gvRA==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id B4E7AA0057;
 Mon, 30 Sep 2019 08:19:21 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Mon, 30 Sep 2019 10:19:04 +0200
Message-Id: <cover.1569831228.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net 0/9] net: stmmac: Fixes for -net
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

Misc fixes for -net tree. More info in commit logs.

v2 is just a rebase of v1 against -net and we added a new patch (09/09) to
fix RSS feature.

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
  net: stmmac: xgmac: Not all Unicast addresses may be available
  net: stmmac: xgmac: Detect Hash Table size dinamically
  net: stmmac: selftests: Always use max DMA size in Jumbo Test
  net: stmmac: dwmac4: Always update the MAC Hash Filter
  net: stmmac: Correctly take timestamp for PTPv2
  net: stmmac: Do not stop PHY if WoL is enabled
  net: stmmac: xgmac: Disable the Timestamp interrupt by default
  net: stmmac: xgmac: Fix RSS not writing all Keys to HW
  net: stmmac: xgmac: Fix RSS writing wrong keys

 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c     | 13 +++++++------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h        |  3 ++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c   |  9 +++++----
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 19 +++++++++++++------
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c    |  4 ----
 6 files changed, 28 insertions(+), 21 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
