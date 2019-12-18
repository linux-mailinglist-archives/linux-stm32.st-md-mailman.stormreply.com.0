Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0212124470
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 11:24:54 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B2F3C36B0C;
	Wed, 18 Dec 2019 10:24:54 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08CECC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 10:24:53 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 49A79C0D6B;
 Wed, 18 Dec 2019 10:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576664691; bh=veMgZV+L88MP2+NDYHlOUNPQ+DcuCryOxZrBeX5GTZQ=;
 h=From:To:Cc:Subject:Date:From;
 b=cCeosH2hAAuqc21s5yQbK6PoC7n2tHYD6gR2iv6ld7RpEyxKC9oKW9/o+y0qCswn1
 pml1I0Qaf278BcCs0G9VwujMiJ/tlEeKlixJuCG+X+9ksRIR0lQxLgbMLyWOkHh9CS
 VkyESB+65Cg/+zo636HV6ENBSvKpxn+sQdVHNDuBta/d7uth19BHRnimJgIUJKfnVM
 LCGuBXsUgbmBOM+OyRU8YdPPKAzwWP70atrsBivDFsyDGm5Mq6nmF0/ArrODaYTSyt
 Llp1Q4cXsfY6ELfsWnv4ba9HiE9smHaMDNlW2FxLURDcgReo7WohUk2L0L3L/SHnsd
 fna3QKvjIeLJQ==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 183D8A0066;
 Wed, 18 Dec 2019 10:24:49 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Wed, 18 Dec 2019 11:24:42 +0100
Message-Id: <cover.1576664538.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 0/3] net: stmmac: Improvements for
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

1) Adds more information regarding HW Caps in the DebugFS file.

2) Allows interrupts to be independently enabled or disabled so that we don't
have to schedule both TX and RX NAPIs.

3) Stops using a magic number in coalesce timer re-arm.

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-kernel@vger.kernel.org
---

Jose Abreu (3):
  net: stmmac: Print more information in DebugFS DMA Capabilities file
  net: stmmac: Let TX and RX interrupts be independently
    enabled/disabled
  net: stmmac: Always use TX coalesce timer value when rescheduling

 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  | 24 +++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h   | 11 ++-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   | 47 ++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h    |  6 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c    | 22 +++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  2 +
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 24 +++++-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  6 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 88 ++++++++++++++++------
 10 files changed, 180 insertions(+), 51 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
