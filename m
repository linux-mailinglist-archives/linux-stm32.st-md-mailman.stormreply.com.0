Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ED083273
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2019 15:16:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1129DC35E01;
	Tue,  6 Aug 2019 13:16:28 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 231CAC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2019 13:16:26 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0CC85C21B9;
 Tue,  6 Aug 2019 13:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1565097385; bh=Ab5jp3GsMXQWmVrZFrMXWKrOoJ32+iutiBB3NdSCy7U=;
 h=From:To:Cc:Subject:Date:From;
 b=PV/WBimuik8cDyALtkSnshvQukdpJgHBFPGuylY9CPMMZYPNIPKYj/PrY6y3KdbIn
 7+zJqksQXOsuQCb7qd30AAFIjyPTOK8A2wFol/Qb0prJBfKAeSfuaJ6agtDlyP7Qaf
 4H4k4GCqDRJf+Bw56ms3NoSOZ5TG/s8zTSwFxrEy9GBfeKJxXFk8z5U0nNa5SR+S7d
 jy8Rq/Ceum+0OgckWOgGJySMNMQ6CV1YcgE7gMdcS92NuHsg+JGzB3Jsejny0LyDYc
 /q8Zg4poIBGoFrKAzfLZxEP/nj87pFzhQ0wkzQLTIiJQVaBIjm9GTunXvv17P0l6d6
 b875KXfyAsAFQ==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id DE4CBA0057;
 Tue,  6 Aug 2019 13:16:22 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Tue,  6 Aug 2019 15:16:15 +0200
Message-Id: <cover.1565097294.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 0/3] net: stmmac: Fixes for -net
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

Couple of fixes for -net. More info in commit log.

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
  net: stmmac: xgmac: Fix XGMAC selftests
  net: stmmac: Fix issues when number of Queues >= 4
  net: stmmac: tc: Do not return a fragment entry

 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  4 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  7 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 87 +++++++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c    |  2 +-
 4 files changed, 88 insertions(+), 12 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
