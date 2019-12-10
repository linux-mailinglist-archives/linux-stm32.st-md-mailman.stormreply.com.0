Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 787B61190AB
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Dec 2019 20:34:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22159C36B24;
	Tue, 10 Dec 2019 19:34:14 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (us03-smtprelay2.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEC74C36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2019 19:34:09 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 34008C0990;
 Tue, 10 Dec 2019 19:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576006448; bh=pTLBDat5GXwXcAV+v7xD9330ZsqiJnxHPQ17KK1C5l0=;
 h=From:To:Cc:Subject:Date:From;
 b=D9WcEMo5eCjfxge950LRW2FuRYFLNYEyqJFO/VCMlrrUVx33XgnslNDLOX3JjX+5D
 lOR2LeqZg8bmM3/xNY1kZ+tgO24EeInuaxMgP5w8opFAEpffKl8fuIbLv/lb6iypeS
 ysj8vIET/5+hpfrlet/ryFEWQHMG/DEYxOiCQ9TArAFJB8+RIEblJnXkhGS3g0NSpg
 WBK9B+xhb6nb51rEvMa16ll5yRFJyh4ul+bC43Q/KDLlqLkLCXIP7hNGLOHkSgllqY
 7Lt3HuA1Pul+kGOpkCrVYEsYeTS8vcvSUyLV0/Rtq29EWmhhSksLwF7GVTmojElcZo
 bAGu/m1vNIHwg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 080D5A005C;
 Tue, 10 Dec 2019 19:34:04 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Tue, 10 Dec 2019 20:33:52 +0100
Message-Id: <cover.1576005975.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 0/8] net: stmmac: Fixes for -net
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

Jose Abreu (8):
  net: stmmac: selftests: Needs to check the number of Multicast regs
  net: stmmac: Determine earlier the size of RX buffer
  net: stmmac: Do not accept invalid MTU values
  net: stmmac: Only the last buffer has the FCS field
  net: stmmac: xgmac: Clear previous RX buffer size
  net: stmmac: RX buffer size must be 16 byte aligned
  net: stmmac: 16KB buffer must be 16 byte aligned
  net: stmmac: Enable 16KB buffer size

 drivers/net/ethernet/stmicro/stmmac/common.h       |  5 +--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c |  3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 45 ++++++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_selftests.c |  4 ++
 5 files changed, 38 insertions(+), 21 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
