Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD666FB72
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jul 2019 10:39:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33B57CC2697;
	Mon, 22 Jul 2019 08:39:55 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc2-smtprelay2.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08E29CC2698
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jul 2019 08:39:54 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EA265C1227;
 Mon, 22 Jul 2019 08:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1563784792; bh=gAQ84Z8uQYEqLwe3t0dAiOmw/qC87vcNk5Wf+7zF7eY=;
 h=From:To:Cc:Subject:Date:From;
 b=Tw0NjjLDtWP8eBnJ6Xt4QyVdruzgB9/y/J+RuQynTViyqlcHCEiVQDEA0qu2HSXEv
 YacB3+0odjiXogl/oj8vkMpzHN0Xb17sALqOGPbxvQT0NzMugg5Fq2pFUkgi0E+1C9
 ZUz3L4pKY8S7S/OuTysc5hdUycHpUFRg/T4DhZ+52yfym8VeZkes4+4sFikIrnNiya
 bee1H9EZhI8BiNJK2rnUAE+hoOwo9EhJHsxANi6lp9rJLsRJEOMjwhWzvh2BVu0aGR
 jwUq7yfvUijBi+RnXZfY6hMJ1r/LXxCeoLwsw7sUY+eVGGNY5WCZ+m843HTrUcIr2o
 0m3X94RXrr7yA==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 9FD1AA0057;
 Mon, 22 Jul 2019 08:39:44 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Mon, 22 Jul 2019 10:39:29 +0200
Message-Id: <cover.1563784666.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 0/2] net: stmmac: Two fixes
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

Two fixes targeting -net.

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
  net: stmmac: RX Descriptors need to be clean before setting buffers
  net: stmmac: Use kcalloc() instead of kmalloc_array()

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
