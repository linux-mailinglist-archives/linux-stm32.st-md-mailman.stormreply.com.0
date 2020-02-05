Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9291527B8
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2020 09:55:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADE5DC36B0B;
	Wed,  5 Feb 2020 08:55:37 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C5D2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2020 08:55:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Feb 2020 00:55:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,405,1574150400"; d="scan'208";a="264149167"
Received: from unknown (HELO bong5-HP-Z440.png.intel.com) ([10.221.118.166])
 by fmsmga002.fm.intel.com with ESMTP; 05 Feb 2020 00:55:29 -0800
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: netdev@vger.kernel.org
Date: Wed,  5 Feb 2020 16:55:04 +0800
Message-Id: <20200205085510.32353-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Voon Weifeng <weifeng.voon@intel.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Arnd Bergmann <arnd@arndb.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tan Tee Min <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v4 0/6] net: stmmac: general fixes for
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

1/6: It ensures that the real_num_rx|tx_queues are set in both driver
     probe() and resume(). So, move the netif_set_real_num_rx|tx_queues()
     into stmmac_hw_setup(). Use rtnl_lock() and rtnl_unlock() for
     stmmac_hw_setup() called inside stmmac_resume().

2/6: It ensures that the previous value of GMAC_VLAN_TAG register is
     read first before for updating the register.

3/6: Similar to 2/6 patch but it is a fix for XGMAC_VLAN_TAG register
     as requested by Jose Abreu.

4/6: It ensures the GMAC IP v4.xx and above behaves correctly to:-
       ip link set <devname> multicast off|on

5/6: Added similar IFF_MULTICAST flag for xgmac2, similar to 4/6.

6/6: It ensures PCI platform data is using plat->phy_interface.

Rgds,
Boon Leong

Changes from v3:-
   patch 1/6 - add rtnl_lock() and rtnl_unlock() for stmmac_hw_setup()
               called inside stmmac_resume()
   patch 3/6 - Added new patch to fix XGMAC_VLAN_TAG register writting

v2:-
   patch 1/5 - added control for rtnl_lock() & rtnl_unlock() to ensure
               they are used forstmmac_resume()
   patch 4/5 - added IFF_MULTICAST flag check for xgmac to ensure
               multicast works correctly.

v1:-
 - Drop v1 patches (1/7, 3/7 & 4/7) that are not valid.

Aashish Verma (1):
  net: stmmac: Fix incorrect location to set real_num_rx|tx_queues

Ong Boon Leong (1):
  net: stmmac: xgmac: fix incorrect XGMAC_VLAN_TAG register writting

Tan, Tee Min (2):
  net: stmmac: fix incorrect GMAC_VLAN_TAG register writting in GMAC4+
  net: stmmac: xgmac: fix missing IFF_MULTICAST checki in
    dwxgmac2_set_filter

Verma, Aashish (1):
  net: stmmac: fix missing IFF_MULTICAST check in dwmac4_set_filter

Voon Weifeng (1):
  net: stmmac: update pci platform data to use phy_interface

 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  9 +++++----
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 10 +++++++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 10 ++++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   | 14 ++++++++------
 4 files changed, 26 insertions(+), 17 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
