Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AD11370D4
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2020 16:13:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6CCAC36B0B;
	Fri, 10 Jan 2020 15:13:44 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F265EC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2020 15:13:41 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1797940609;
 Fri, 10 Jan 2020 15:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1578669220; bh=YgRf2R2fEVbn4euNlEYstjVo6ED5nUtykY8bZiZZdok=;
 h=From:To:Cc:Subject:Date:From;
 b=cd1rfX6lviWpcYP4veI4RZBrG9EcMTAu7P5MwiZyolf322H4t/gHdEd58WSLkhS00
 M1gFVi/KQjKTNaT44jWkl+fYqYrYaGkJczYqiGhpZ7Gvbp9qKar2dmBD9XuwMphmJU
 aQFMReMV2YJgoP848ZMF8rosGTwKqlwNzDtCPIrLA8O3DvHwMJqF8v7WGjEh6gyhRD
 6NOKVJnW1txFWhjvUnpC6QY+1lQBtYhZLgHqWmB8JRi2jpwjjJDyLQFjFU7gciJIBH
 3qtE5cu+fc4op6QAI+ysf8Qm/ecc6lFamZazn2xTymG5qdh7e3DeRewUlfkGy01wL4
 K9ZsRZWaqcFwg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 20B43A0061;
 Fri, 10 Jan 2020 15:13:36 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Fri, 10 Jan 2020 16:13:33 +0100
Message-Id: <cover.1578669088.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: Frame Preemption
	fixes
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

Two single fixes for the -next tree for recently introduced Frame Preemption
feature.

1) and 2) fixes the disabling of Frame Preemption that was not being correctly
handled because of a missing return.

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

Jose Abreu (2):
  net: stmmac: xgmac: Fix missing return
  net: stmmac: gmac5+: Fix missing return

 drivers/net/ethernet/stmicro/stmmac/dwmac5.c        | 1 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
