Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A1A33AAAF
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 06:23:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D6BAC57192;
	Mon, 15 Mar 2021 05:23:37 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48FEEC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 05:23:35 +0000 (UTC)
IronPort-SDR: Q51v/+rj+YgX6TBstD/293SeOEcumMZxyRgw7RpTE9QzYtszmfz8AywXs292IvWgW+a0wchO8O
 daOxrVYQ0EXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9923"; a="274079707"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="274079707"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2021 22:23:29 -0700
IronPort-SDR: JcCFDc4GqxOuzFSlKoQE1YDvqDCOUrp0+IvN/UezeggyZhQX8Q+CicrTPBBiV2gLi5uSBQ7Fh6
 RDChyKjyZirw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="373313736"
Received: from glass.png.intel.com ([10.158.65.59])
 by orsmga006.jf.intel.com with ESMTP; 14 Mar 2021 22:23:25 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King i <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Mon, 15 Mar 2021 13:27:05 +0800
Message-Id: <20210315052711.16728-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Fugang Duan <fugang.duan@nxp.com>, Voon Weifeng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/6] net: pcs,
	stmmac: add C37 AN SGMII support
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

Hi all,

This patch series adds MAC-side SGMII support to stmmac driver and it is
changed as follow:-

1/6: Refactor the current C73 implementation in pcs-xpcs to prepare for
     adding C37 AN later.
2/6: Add MAC-side SGMII C37 AN support to pcs-xpcs
3,4/6: make phylink_parse_mode() to work for non-DT platform so that
       we can use stmmac platform_data to set it.
5/6: Make stmmac_open() to only skip PHY init if C73 is used, otherwise
     C37 AN will need phydev to be connected to phylink.
6/6: Finally, add pcs-xpcs SGMII interface support to Intel mGbE
     controller.

The patch series have been tested on EHL CRB PCH TSN (eth2) controller
that has Marvell 88E1512 PHY attached over SGMII interface and the
iterative tests of speed change (AN) + ping test have been successful.

[63446.009295] intel-eth-pci 0000:00:1e.4 eth2: Link is Down
[63449.986365] intel-eth-pci 0000:00:1e.4 eth2: Link is Up - 1Gbps/Full - flow control off
[63449.987625] IPv6: ADDRCONF(NETDEV_CHANGE): eth2: link becomes ready
[63451.248064] intel-eth-pci 0000:00:1e.4 eth2: Link is Down
[63454.082366] intel-eth-pci 0000:00:1e.4 eth2: Link is Up - 100Mbps/Full - flow control off
[63454.083650] IPv6: ADDRCONF(NETDEV_CHANGE): eth2: link becomes ready
[63456.465179] intel-eth-pci 0000:00:1e.4 eth2: Link is Down
[63459.202367] intel-eth-pci 0000:00:1e.4 eth2: Link is Up - 10Mbps/Full - flow control off
[63459.203639] IPv6: ADDRCONF(NETDEV_CHANGE): eth2: link becomes ready
[63460.882832] intel-eth-pci 0000:00:1e.4 eth2: Link is Down
[63464.322366] intel-eth-pci 0000:00:1e.4 eth2: Link is Up - 1Gbps/Full - flow control off

Thanks
Boon Leong

Ong Boon Leong (6):
  net: pcs: rearrange C73 functions to prepare for C37 support later
  net: pcs: add C37 SGMII AN support for intel mGbE controller
  net: phylink: make phylink_parse_mode() support non-DT platform
  net: stmmac: make in-band AN mode parsing is supported for non-DT
  net: stmmac: ensure phydev is attached to phylink for C37 AN
  stmmac: intel: add pcs-xpcs for Intel mGbE controller

 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  15 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   4 +-
 drivers/net/pcs/pcs-xpcs.c                    | 257 ++++++++++++++++--
 drivers/net/phy/phylink.c                     |   5 +-
 include/linux/pcs/pcs-xpcs.h                  |   5 +
 include/linux/phylink.h                       |   2 +
 include/linux/stmmac.h                        |   1 +
 7 files changed, 258 insertions(+), 31 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
