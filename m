Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7306A54A74A
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jun 2022 05:05:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23934C5F1EE;
	Tue, 14 Jun 2022 03:05:10 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AA16C0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jun 2022 03:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655175909; x=1686711909;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0q3A6ZlYknCDTiDq54GQ1dl5Y2j8+ayQDmnfAoNRMts=;
 b=PEeDV8Q+Cf/i1ugLyhi6AUJU3OS5C+5rmMn+M0FeG9E2x4kvV+/AXiRp
 xyAUVikXiA6IlERjE1LBNQr5TaGNWoTt051YU3FwOVywCC4V/xn++fqGN
 jSGOMowTi2atQbj4F2suvtc93P+B/olPAVVFttQbF0bZWg9T7nfODs+Sy
 ZH5/pPS8zYmCdGO9Cak+7XJEyBNYxaxJ+nUqAt8dRCApUtybEPRaRF606
 mJnvvYLJbm0PTi/2nc7CooQsChk4xCmR6GTd9pyx4TCf+e4N5hDzqLKyH
 JcukUpEg7a70XpeyV2lFcgLkZWsLN6/RFRjHCDcnYm70EiCY1OBb+W2gs w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="258315636"
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="258315636"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 20:05:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="761787650"
Received: from p12hl98bong5.png.intel.com ([10.158.65.178])
 by orsmga005.jf.intel.com with ESMTP; 13 Jun 2022 20:05:02 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Tue, 14 Jun 2022 11:00:25 +0800
Message-Id: <20220614030030.1249850-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Emilio Riva <emilio.riva@ericsson.com>,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 0/5] pcs-xpcs,
	stmmac: add 1000BASE-X AN for network switch
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

Thanks for review feedback from Russell in [1] and [2]. I have changed
the v4 implementation as follow.

v4 changes:
1/5 - Squash v3:1/7 & 2/7 patches into v4:1/6 so that it passes build.
2/5 - [No change] same as v3:3/7
3/5 - [Fix] Fix issues identified by Russell in [1]
4/5 - [Fix] Drop v3:5/7 patch per input by Russell in [2] and make
            dwmac-intel clear the ovr_an_inband flag if fixed-link
            is used in ACPI _DSD.
5/5 - [No change] same as v3:7/7

The patches are built with C=1 and W=1 and I have found no additional
warn and error from these patches (as advised by Jakub)

The record for v3 changes is in [3]
1/7 - [New] Update xpcs_do_config to accept advertising input
2/7 - [New] Fix to compilation issue introduced v1. Update xpcs_do_config
            for sja1105.
3/7 - Same as 3/4 of v1 series.
4/7 - [Fix] Fix numerous issues identified by Russell King.
5/7 - [New] Make fixed-link setting takes precedence over ovr_an_inband.
            This is a fix to a bug introduced earlier. Separate patch
            will be sent later.
6/7 - [New] Allow phy-mode ACPI _DSD setting for dwmac-intel to overwrite
            the phy_interface detected through PCI DevID.
7/7 - [New] Make mdio register flow to skip PHY scanning if fixed-link
            is specified.

Reference:
[1] https://patchwork.kernel.org/comment/24890210/
[2] https://patchwork.kernel.org/comment/24890222/
[3] https://patchwork.kernel.org/project/netdevbpf/cover/20220610033610.114084-1-boon.leong.ong@intel.com/

Thanks
Boon Leong

Ong Boon Leong (5):
  net: make xpcs_do_config to accept advertising for pcs-xpcs and
    sja1105
  stmmac: intel: prepare to support 1000BASE-X phy interface setting
  net: pcs: xpcs: add CL37 1000BASE-X AN support
  stmmac: intel: add phy-mode and fixed-link ACPI _DSD setting support
  net: stmmac: make mdio register skips PHY scanning for fixed-link

 drivers/net/dsa/sja1105/sja1105_main.c        |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  30 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  11 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |  14 ++
 drivers/net/pcs/pcs-xpcs.c                    | 178 +++++++++++++++++-
 drivers/net/pcs/pcs-xpcs.h                    |   3 +-
 include/linux/pcs/pcs-xpcs.h                  |   3 +-
 7 files changed, 228 insertions(+), 13 deletions(-)

--
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
