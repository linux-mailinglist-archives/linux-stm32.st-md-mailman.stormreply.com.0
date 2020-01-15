Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C873C13BA25
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2020 08:10:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60123C36B11;
	Wed, 15 Jan 2020 07:10:48 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EB55C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 07:10:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 23:10:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,321,1574150400"; d="scan'208";a="256643646"
Received: from bong5-hp-z440.png.intel.com ([10.221.118.136])
 by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2020 23:10:34 -0800
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: netdev@vger.kernel.org
Date: Wed, 15 Jan 2020 15:09:59 +0800
Message-Id: <20200115071003.42820-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Voon Weifeng <weifeng.voon@intel.com>,
 Jakub Kicinski <kubakici@wp.pl>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2 0/4] net: stmmac: general fixes for
	Ethernet functionality
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

Thanks to all feedbacks from community.

We updated the patch-series to below:-

1/4: It ensures that the real_num_rx|tx_queues are set in both driver
     probe() and resume(). So, move the netif_set_real_num_rx|tx_queues()
     into stmmac_hw_setup().

2/4: It ensures that the previous value of GMAC_VLAN_TAG register is
     read first before for updating the register.

3/4: It ensures the GMAC IP v4.xx and above behaves correctly to:-
       ip link set <devname> multicast off|on

4/4: It ensures PCI platform data is using plat->phy_interface.

Rgds,
Boon Leong

Changes from v1:-
 - Drop v1 patches (1/7, 3/7 & 4/7) that are not valid.

Aashish Verma (1):
  net: stmmac: Fix incorrect location to set real_num_rx|tx_queues

Tan, Tee Min (1):
  net: stmmac: fix incorrect GMAC_VLAN_TAG register writting
    implementation

Verma, Aashish (1):
  net: stmmac: fix missing IFF_MULTICAST check in dwmac4_set_filter

Voon Weifeng (1):
  net: stmmac: update pci platform data to use phy_interface

 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c |  9 +++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c  | 14 ++++++++------
 3 files changed, 17 insertions(+), 14 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
