Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3732CD19E
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Oct 2019 13:17:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE14EC36B0B;
	Sun,  6 Oct 2019 11:17:31 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CC56C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Oct 2019 11:17:30 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 82F25C0374;
 Sun,  6 Oct 2019 11:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1570360648; bh=tnWdGo9LoSdCZ4UfDy75YwxsYXeRpsko+ph8h48XVjw=;
 h=From:To:Cc:Subject:Date:From;
 b=FQMSCljtVSk3DUGXIYL5Y/rZoAhum7g7BKll/VBVchW6bd4uyIiPqizHt5Tz/H0Ox
 gkpXLUo9yOl4ZJlVsKbO+O0+n8C/XtkvBvzSE8HtymuTGVAp1C1FuaTmtDq+wi5cHG
 vDrovkxteOrYGKCOsRVEl0ruoRp7k4Zy+Uhqk3qerYbcOsu0ibRLniLQd128jBzi4Q
 ZIhze5AsgYQDM34Omxb6g8KKyFBRKzOI8xIZX1fRLPAQtTeQVrRYVILsKAN04NNwui
 fqdWgJGVi6CJBbDeTdmPI5gEa44mT/VPKiim9ybgfazEZmTkg13y+a87ypFVWTdqoO
 oiKNxSpv2IMAA==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id DF023A005D;
 Sun,  6 Oct 2019 11:17:19 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Sun,  6 Oct 2019 13:17:11 +0200
Message-Id: <cover.1570360411.git.Jose.Abreu@synopsys.com>
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

Improvements for -next. More info in commit logs.

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
  net: stmmac: Fallback to VLAN Perfect filtering if HASH is not
    available
  net: stmmac: selftests: Add tests for VLAN Perfect Filtering
  net: stmmac: Implement L3/L4 Filters in GMAC4+

 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  21 ++++
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  | 118 ++++++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   |   1 +
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  17 ++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  18 ++--
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c | 114 +++++++++++++-------
 7 files changed, 245 insertions(+), 46 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
