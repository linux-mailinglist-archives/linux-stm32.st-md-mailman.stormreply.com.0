Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BA9138EA5
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2020 11:13:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F8EBC36B0B;
	Mon, 13 Jan 2020 10:13:29 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13D1AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:13:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 02:13:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,428,1571727600"; d="scan'208";a="397116735"
Received: from bong5-hp-z440.png.intel.com ([10.221.118.136])
 by orsmga005.jf.intel.com with ESMTP; 13 Jan 2020 02:13:21 -0800
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: netdev@vger.kernel.org
Date: Tue, 14 Jan 2020 10:01:09 +0800
Message-Id: <1578967276-55956-1-git-send-email-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Voon Weifeng <weifeng.voon@intel.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 0/7] net: stmmac: general fixes for
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

Patch-series that fixes couple of issues in stmmac:-

1/7: It fixes the incorrect setting of Rx Tail Pointer. Rx Tail Pointer
     should points to the last valid descriptor that was replenished by
     stmmac_rx_refill().

2/7: It ensures that the real_num_rx|tx_queues are set in both driver
     probe() and resume(). So, move the netif_set_real_num_rx|tx_queues()
     into stmmac_hw_setup().

3/7: It fixes missing netdev->features = features update in
     stmmac_set_features().

4/7: It fixes incorrect MACRO function defininition for TX and RX user
     priority queue steering for queue > 3.

5/7: It ensures that the previous value of GMAC_VLAN_TAG register is
     read first before for updating the register.

6/7: It ensures the GMAC IP v4.xx and above behaves correctly to:-
      ip link set <devname> multicast off|on

7/7: It ensures PCI platform data is using plat->phy_interface.

Thanks,
Boon Leong

Aashish Verma (1):
  net: stmmac: Fix incorrect location to set real_num_rx|tx_queues

Ong Boon Leong (2):
  net: stmmac: fix error in updating rx tail pointer to last free entry
  net: stmmac: fix missing netdev->features in stmmac_set_features

Tan, Tee Min (1):
  net: stmmac: fix incorrect GMAC_VLAN_TAG register writting
    implementation

Verma, Aashish (1):
  net: stmmac: fix missing IFF_MULTICAST check in dwmac4_set_filter

Voon Weifeng (2):
  net: stmmac: Fix priority steering for tx/rx queue >3
  net: stmmac: update pci platform data to use phy_interface

 drivers/net/ethernet/stmicro/stmmac/dwmac4.h      | 10 ++++++----
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c |  9 +++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 16 ++++++++++------
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c  | 14 ++++++++------
 4 files changed, 29 insertions(+), 20 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
