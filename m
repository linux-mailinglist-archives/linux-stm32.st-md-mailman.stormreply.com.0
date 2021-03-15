Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F0933ABB3
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 07:41:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2CFAC57A41;
	Mon, 15 Mar 2021 06:41:02 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37F5ECFAC5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 06:40:59 +0000 (UTC)
IronPort-SDR: Qg0SxKcFRiA4UBGy60upvUYX4BEcSybV8XC4I2rRC15icc6w8FHjA6ADSOBGr7z3SHxOPBhsJn
 elHQc6rAD2Rg==
X-IronPort-AV: E=McAfee;i="6000,8403,9923"; a="168314289"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="168314289"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2021 23:40:58 -0700
IronPort-SDR: A7rqz74PYV7+BE/8VXwnXIoaGSSyVCYgUXNeHtD6MOZyetXIws/wfmY3CWj243ZK6/GigoJsEM
 Z2eTfNb0pHhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="604742500"
Received: from glass.png.intel.com ([10.158.65.59])
 by fmsmga005.fm.intel.com with ESMTP; 14 Mar 2021 23:40:53 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 15 Mar 2021 14:44:47 +0800
Message-Id: <20210315064448.16391-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 0/1] net: stmmac: add per-q coalesce
	support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

This patch adds per-queue RX & TX coalesce control so that user can
adjust the RX & TX interrupt moderation per queue. This is beneficial for
mixed criticality control (according to VLAN priority) by user application.

The patch as been tested with following steps and results and the
from the output of ethtool, it looks good.

 ########################################################################

> ethtool --show-coalesce eth0
Coalesce parameters for eth0:
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

> ethtool --per-queue eth0 queue_mask 0xFF --show-coalesce
Queue: 0
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 1
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 2
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 3
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 4
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 5
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 6
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 7
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

> ethtool --per-queue eth0 queue_mask 0x02 --coalesce rx-usecs 100 rx-frames 5
> ethtool --per-queue eth0 queue_mask 0x20 --coalesce rx-usecs 100 rx-frames 5
> ethtool --per-queue eth0 queue_mask 0x22 --show-coalesce
Queue: 1
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 99
rx-frames: 5
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 5
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 99
rx-frames: 5
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

> ethtool --per-queue eth0 queue_mask 0x04 --coalesce tx-usecs 156 tx-frames 26
> ethtool --per-queue eth0 queue_mask 0x40 --coalesce tx-usecs 156 tx-frames 26
> ethtool --per-queue eth0 queue_mask 0x44 --show-coalesce
Queue: 2
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 200
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 156
tx-frames: 26
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 6
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 200
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 156
tx-frames: 26
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

> ethtool --per-queue eth0 queue_mask 0xFF --coalesce rx-usecs 204 rx-frames 0
rx-frames unmodified, ignoring
rx-frames unmodified, ignoring
rx-frames unmodified, ignoring
rx-frames unmodified, ignoring
rx-frames unmodified, ignoring
rx-frames unmodified, ignoring
> ethtool --per-queue eth0 queue_mask 0xFF --coalesce tx-usecs 1000 tx-frames 25
tx-usecs unmodified, ignoring
tx-frames unmodified, ignoring
Queue 0, no coalesce parameters changed
tx-usecs unmodified, ignoring
tx-frames unmodified, ignoring
Queue 1, no coalesce parameters changed
tx-usecs unmodified, ignoring
tx-frames unmodified, ignoring
Queue 3, no coalesce parameters changed
tx-usecs unmodified, ignoring
tx-frames unmodified, ignoring
Queue 4, no coalesce parameters changed
tx-usecs unmodified, ignoring
tx-frames unmodified, ignoring
Queue 5, no coalesce parameters changed
tx-usecs unmodified, ignoring
tx-frames unmodified, ignoring
Queue 7, no coalesce parameters changed
> ethtool --show-coalesce eth0
Coalesce parameters for eth0:
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

> ethtool --per-queue eth0 queue_mask 0xFF --show-coalesce
Queue: 0
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 1
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 2
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 3
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 4
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 5
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 6
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

Queue: 7
Adaptive RX: off  TX: off
stats-block-usecs: 0
sample-interval: 0
pkt-rate-low: 0
pkt-rate-high: 0

rx-usecs: 202
rx-frames: 0
rx-usecs-irq: 0
rx-frames-irq: 0

tx-usecs: 1000
tx-frames: 25
tx-usecs-irq: 0
tx-frames-irq: 0

rx-usecs-low: 0
rx-frames-low: 0
tx-usecs-low: 0
tx-frames-low: 0

rx-usecs-high: 0
rx-frames-high: 0
tx-usecs-high: 0
tx-frames-high: 0

 ########################################################################

Thanks,
Boon Leong

Ong Boon Leong (1):
  net: stmmac: add per-queue TX & RX coalesce ethtool support

 .../ethernet/stmicro/stmmac/dwmac1000_dma.c   |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |   7 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |   7 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   8 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 132 ++++++++++++++++--
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  48 ++++---
 7 files changed, 157 insertions(+), 49 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
