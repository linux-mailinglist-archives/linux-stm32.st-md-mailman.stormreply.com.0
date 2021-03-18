Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD67D33FC65
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Mar 2021 01:51:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6747EC57B79;
	Thu, 18 Mar 2021 00:51:05 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B158C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 00:51:01 +0000 (UTC)
IronPort-SDR: ELuH7CYQF9NWApXh1SgICztfWDano4Uq2Oi2qxIFFG47lAtdLvjxtnAw9/xIaCs5m2jmiKd0IY
 rhOSjYAiwkaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="176705007"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="176705007"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 17:50:59 -0700
IronPort-SDR: NThe0sP+wsRaDL43ZWqqyTqsF139nvSDXrqYQotLgn1+t9JWq7nMOr9W+d4/z2+22epYk2Owtl
 AVB/wo8rK8Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="602458589"
Received: from mismail5-ilbpg0.png.intel.com ([10.88.229.82])
 by fmsmga006.fm.intel.com with ESMTP; 17 Mar 2021 17:50:55 -0700
From: mohammad.athari.ismail@intel.com
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 18 Mar 2021 08:50:51 +0800
Message-Id: <20210318005053.31400-1-mohammad.athari.ismail@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Voon Weifeng <weifeng.voon@intel.com>, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 mohammad.athari.ismail@intel.com, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: EST interrupts and
	ethtool
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

From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>

This patchset adds support for handling EST interrupts and reporting EST
errors. Additionally, the errors are added into ethtool statistic.

Ong Boon Leong (1):
  net: stmmac: Add EST errors into ethtool statistic

Voon Weifeng (1):
  net: stmmac: EST interrupts handling and error reporting

 drivers/net/ethernet/stmicro/stmmac/common.h  |  6 ++
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 86 +++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  | 32 +++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  4 +
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  6 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 +
 6 files changed, 138 insertions(+)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
