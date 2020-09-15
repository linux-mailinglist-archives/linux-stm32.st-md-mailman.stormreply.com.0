Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CCA269B09
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Sep 2020 03:26:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57E54C3FAD6;
	Tue, 15 Sep 2020 01:26:59 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 250AAC32EB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 01:26:56 +0000 (UTC)
IronPort-SDR: rbwf9pAB0sTtbK4iJDxg6RAM8HFgdRjomI5Gj6SKgFuu5XFVN7RT0sYCfNuQ88roc/oMzxq23m
 /woXA1smNH7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="156615182"
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="156615182"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 18:26:55 -0700
IronPort-SDR: X1mLw+WKIcGdRUEAS6YE3OAgd0yykakJDcHVHbcztrxjTp4xUteXKRmpVAqN8mjkKphG9dntir
 efLOrLzVs3Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,427,1592895600"; d="scan'208";a="345632589"
Received: from glass.png.intel.com ([172.30.181.92])
 by orsmga007.jf.intel.com with ESMTP; 14 Sep 2020 18:26:50 -0700
From: Wong Vee Khee <vee.khee.wong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>
Date: Tue, 15 Sep 2020 09:28:37 +0800
Message-Id: <20200915012840.31841-1-vee.khee.wong@intel.com>
X-Mailer: git-send-email 2.17.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 Voon Wei Feng <weifeng.voon@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Rusell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Seow Chen Yong <chen.yong.seow@intel.com>,
 Vijaya Balan Sadhishkhanna <sadhishkhanna.vijaya.balan@intel.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: Add ethtool support
	for get|set channels
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

This patch set is to add support for user to get or set Tx/Rx channel
via ethtool. There are two patches that fixes bug introduced on upstream
in order to have the feature work.

Tested on Intel Tigerlake Platform.

Aashish Verma (1):
  net: stmmac: Fix incorrect location to set real_num_rx|tx_queues

Ong Boon Leong (2):
  net: stmmac: add ethtool support for get/set channels
  net: stmmac: use netif_tx_start|stop_all_queues() function

 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   1 +
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  26 ++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 135 +++++++++---------
 3 files changed, 98 insertions(+), 64 deletions(-)

-- 
2.17.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
