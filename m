Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEF13ED13B
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Aug 2021 11:48:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A35BEC57B7A;
	Mon, 16 Aug 2021 09:48:18 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27BDEC57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Aug 2021 06:19:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="215530677"
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="215530677"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2021 23:18:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; d="scan'208";a="678986694"
Received: from vijay.png.intel.com ([10.88.229.73])
 by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2021 23:18:54 -0700
From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, kuba@kernel.org, mcoquelin.stm32@gmail.com
Date: Mon, 16 Aug 2021 14:15:57 +0800
Message-Id: <cover.1629092894.git.vijayakannan.ayyathurai@intel.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 16 Aug 2021 09:48:14 +0000
Cc: weifeng.voon@intel.com, vee.khee.wong@intel.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, vijayakannan.ayyathurai@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 0/3] net: stmmac: Add ethtool
	per-queue statistic
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

Adding generic ethtool per-queue statistic framework to display the
statistics for each rx/tx queue. In future, users can avail it to add
more per-queue specific counters. Number of rx/tx queues displayed is
depending on the available rx/tx queues in that particular MAC config
and this number is limited up to the MTL_MAX_{RX|TX}_QUEUES defined
in the driver.

Ethtool per-queue statistic display will look like below, when users
start adding more counters.

Example - 1:
 q0_tx_statA:
 q0_tx_statB:
 q0_tx_statC:
 |
 q0_tx_statX:
 .
 .
 .
 qMAX_tx_statA:
 qMAX_tx_statB:
 qMAX_tx_statC:
 |
 qMAX_tx_statX:

 q0_rx_statA:
 q0_rx_statB:
 q0_rx_statC:
 |
 q0_rx_statX:
 .
 .
 .
 qMAX_rx_statA:
 qMAX_rx_statB:
 qMAX_rx_statC:
 |
 qMAX_rx_statX:

Example - 2: Ping test using the tx queue 3.

$ tc qdisc add dev enp0s30f4 root mqprio num_tc 2 map 1 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 queues 3@0 1@3 hw 0

Statistic before ping:
---------------------
$ ethtool -S enp0s30f4

[ snip ]
     q3_tx_pkt_n: 7916
     q3_tx_irq_n: 316
[ snip ]

$ cat /proc/interrupts

[ snip ]
 143:          0          0          0        316          0          0

         0          0  IR-PCI-MSI 499719-edge      enp0s30f4:tx-3
[ snip ]

$ ping -I enp0s30f4 192.168.1.10 -i 0.01 -c 100 > /dev/null

Statistic after ping:
---------------------
$ ethtool -S enp0s30f4

[ snip ]
     q3_tx_pkt_n: 8016
     q3_tx_irq_n: 320
[ snip ]

$ cat /proc/interrupts

[ snip ]
143:          0          0          0        320          0          0

         0          0  IR-PCI-MSI 499719-edge      enp0s30f4:tx-3
[ snip ]

Vijayakannan Ayyathurai (2):
  net: stmmac: add ethtool per-queue statistic framework
  net: stmmac: add ethtool per-queue irq statistic support

Voon Weifeng (1):
  net: stmmac: fix INTR TBU status affecting irq count statistic

 drivers/net/ethernet/stmicro/stmmac/common.h  | 13 ++++
 .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  |  7 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 67 ++++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  5 ++
 4 files changed, 89 insertions(+), 3 deletions(-)


base-commit: e4637f621203cb482f3ddb590cfe9f65045d92a6
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
