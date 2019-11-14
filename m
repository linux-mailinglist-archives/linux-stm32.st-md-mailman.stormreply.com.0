Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B60BDFC57F
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2019 12:42:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7406CC36B14;
	Thu, 14 Nov 2019 11:42:59 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (us03-smtprelay2.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 945AEC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 11:42:57 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B31B3C04BD;
 Thu, 14 Nov 2019 11:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573731776; bh=nFD3/7UDrmqDt39ByWh4NOJjLYV6uhpPSSb6thFP9SA=;
 h=From:To:Cc:Subject:Date:From;
 b=j3Txz1eiCEVZwtqPAZxICcTby6H+8uhU9/0QV34/RKf6En7Hc7upJEbNCKjl7CQO3
 X70QEx9M2MDkVH4KQyFmP+GTsF7ydu3zzad1TlINcDozXlay1s1+xSQnCr41zuvvGt
 R+6fAnoIcfwres4sjNOhFe4LpTryLi/HgXIYY/fJSDAiN8aef/WilcAeI9VphHUJnX
 dhBB6chc352cI1HewUuz4b1m42tfWeyeBWOBmgBmwgW3MW6tX31e1nxOGrcUI6cl/b
 Kd0mQTnKp/jSQsI8SUb2IbigM4tMtaR0E1oJq/hqGSMfh3VsFphh8sLwH+vQegx47W
 x1QiKeJ19FHsQ==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id BF405A0078;
 Thu, 14 Nov 2019 11:42:52 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Thu, 14 Nov 2019 12:42:44 +0100
Message-Id: <cover.1573731453.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net-next 0/7] net: stmmac: CPU Performance
	Improvements
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

CPU Performance improvements for stmmac. Please check bellow for results
before and after the series.

Patch 1/7, allows RX Interrupt on Completion to be disabled and only use the
RX HW Watchdog.

Patch 2/7, setups the default RX coalesce settings instead of using the
minimum value.

Patch 3/7 and 4/7, removes the uneeded computations for RX Flow Control
activation/de-activation, on some cases.

Patch 5/7, tunes-up the default coalesce settings.

Patch 6/7, re-works the TX coalesce timer activation logic.

Patch 7/7, removes the now uneeded TBU interrupt.

NetPerf UDP Results:
--------------------

Socket  Message  Elapsed      Messages                   CPU      Service
Size    Size     Time         Okay Errors   Throughput   Util     Demand
bytes   bytes    secs            #      #   10^6bits/sec % SS     us/KB
--- XGMAC@2.5G: Before
212992    1400   10.00     2100620      0     2351.7     36.69    5.112
212992           10.00     2100539            2351.6     26.18    3.648
--- XGMAC@2.5G: After
212992    1400   10.00     2108972      0     2361.5     21.73    3.015 
212992           10.00     2097038            2348.1     19.21    2.666

--- GMAC5@1G: Before
212992    1400   10.00      786000      0      880.2     34.71    12.923
212992           10.00      786000             880.2     23.42    8.719
--- GMAC5@1G: After
212992    1400   10.00      842648      0      943.7     14.12    4.903 
212992           10.00      842648             943.7     12.73    4.418


Perf TCP Results on RX Path:
----------------------------
--- XGMAC@2.5G: Before
22.51%  swapper          [stmmac]           [k] dwxgmac2_dma_interrupt
10.82%  swapper          [stmmac]           [k] dwxgmac2_host_mtl_irq_status
 5.21%  swapper          [stmmac]           [k] dwxgmac2_host_irq_status
 4.67%  swapper          [stmmac]           [k] dwxgmac3_safety_feat_irq_status
 3.63%  swapper          [kernel.kallsyms]  [k] stack_trace_consume_entry
 2.74%  iperf3           [kernel.kallsyms]  [k] copy_user_enhanced_fast_string
 2.52%  swapper          [kernel.kallsyms]  [k] update_stack_state
 1.94%  ksoftirqd/0      [stmmac]           [k] dwxgmac2_dma_interrupt
 1.45%  iperf3           [kernel.kallsyms]  [k] queued_spin_lock_slowpath
 1.26%  swapper          [kernel.kallsyms]  [k] create_object
--- XGMAC@2.5G: After
 7.43%  swapper          [kernel.kallsyms]   [k] stack_trace_consume_entry
 5.86%  swapper          [stmmac]            [k] dwxgmac2_dma_interrupt
 5.68%  swapper          [kernel.kallsyms]   [k] update_stack_state
 4.71%  iperf3           [kernel.kallsyms]   [k] copy_user_enhanced_fast_string
 2.88%  swapper          [kernel.kallsyms]   [k] create_object
 2.69%  swapper          [stmmac]            [k] dwxgmac2_host_mtl_irq_status
 2.61%  swapper          [stmmac]            [k] stmmac_napi_poll_rx
 2.52%  swapper          [kernel.kallsyms]   [k] unwind_next_frame.part.4
 1.48%  swapper          [kernel.kallsyms]   [k] unwind_get_return_address
 1.38%  swapper          [kernel.kallsyms]   [k] arch_stack_walk

--- GMAC5@1G: Before
31.29%  swapper          [stmmac]           [k] dwmac4_dma_interrupt
14.57%  swapper          [stmmac]           [k] dwmac4_irq_mtl_status
10.66%  swapper          [stmmac]           [k] dwmac4_irq_status
 1.97%  swapper          [kernel.kallsyms]  [k] stack_trace_consume_entry
 1.73%  iperf3           [kernel.kallsyms]  [k] copy_user_enhanced_fast_string
 1.59%  swapper          [kernel.kallsyms]  [k] update_stack_state
 1.15%  iperf3           [kernel.kallsyms]  [k] do_syscall_64
 1.01%  ksoftirqd/0      [stmmac]           [k] dwmac4_dma_interrupt
 0.89%  swapper          [kernel.kallsyms]  [k] __default_send_IPI_dest_field
 0.75%  swapper          [stmmac]           [k] stmmac_napi_poll_rx
--- GMAC5@1G: After
 6.70%  swapper          [kernel.kallsyms]   [k] stack_trace_consume_entry
 5.79%  swapper          [stmmac]            [k] dwmac4_dma_interrupt
 5.29%  swapper          [kernel.kallsyms]   [k] update_stack_state
 3.52%  iperf3           [kernel.kallsyms]   [k] copy_user_enhanced_fast_string
 2.83%  swapper          [stmmac]            [k] dwmac4_irq_mtl_status
 2.62%  swapper          [kernel.kallsyms]   [k] create_object
 2.46%  swapper          [stmmac]            [k] stmmac_napi_poll_rx
 2.32%  swapper          [kernel.kallsyms]   [k] unwind_next_frame.part.4
 2.19%  swapper          [stmmac]            [k] dwmac4_irq_status
 1.39%  swapper          [kernel.kallsyms]   [k] unwind_get_return_address

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

Jose Abreu (7):
  net: stmmac: Do not set RX IC bit if RX Coalesce is zero
  net: stmmac: Setup a default RX Coalesce value instead of the minimum
  net: stmmac: gmac4+: Remove uneeded computation for RFA/RFD
  net: stmmac: xgmac: Remove uneeded computation for RFA/RFD
  net: stmmac: Tune-up default coalesce settings
  net: stmmac: Rework TX Coalesce logic
  net: stmmac: xgmac: Do not enable TBU interrupt

 drivers/net/ethernet/stmicro/stmmac/common.h       |  5 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c   | 14 +---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 14 +---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 74 +++++++++++++++-------
 5 files changed, 59 insertions(+), 50 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
