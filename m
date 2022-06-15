Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EE054C3C9
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jun 2022 10:43:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E4B3C5E2C6;
	Wed, 15 Jun 2022 08:43:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3FDCC03FDD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 08:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655282636; x=1686818636;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9BCmaDXuxZ78d4GhPN+LZuRqgQk4eGFz2he5NDkGKa4=;
 b=mCCHKCM21FJnIc4dzvHH93pTnROJG/VKYN/ySmVdSrBgIqAsRggxJpm4
 DjAOGqSpVjuvqIAtTkdUOdlGwNYeGrn/Pw5znh0Crthj3n6zZE9wkJDsI
 zdWH44Q+L55AbDC/5+iuJa+XxQnALs9J+8zAxVExaSyP1yhIuDCUWqKym
 5d0gGoCcsN/Zl+cK9fbmLVScbtY7j1YAUI+cjslwCfzLjOqouboogtR66
 1VQqZOzTSiujlvXyRCmY4cHT87XBMTwGfkjchU/cxX+Qskrs9GMeHVsDP
 11j2x2tgNCQAGVY1vyJUXbcsFPUbqR18AoUX5OVjlSJn7aIrs1+CrRGKH w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="258736862"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="258736862"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 01:43:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="712849326"
Received: from p12hl98bong5.png.intel.com ([10.158.65.178])
 by orsmga004.jf.intel.com with ESMTP; 15 Jun 2022 01:43:49 -0700
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
Date: Wed, 15 Jun 2022 16:39:03 +0800
Message-Id: <20220615083908.1651975-1-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Emilio Riva <emilio.riva@ericsson.com>,
 linux-kernel@vger.kernel.org, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 0/5] pcs-xpcs,
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

Thanks for v4 review feedback in [1] and [2]. I have changed the v5
implementation as follow.

v5 changes:
1/5 - No change from v4.
2/5 - No change from v4.
3/5 - [Fix] make xpcs_modify_changed() static and use
      mdiodev_modify_changed() for cleaner code as suggested by
      Russell King.
4/5 - [Fix] Use fwnode_get_phy_mode() as recommended by Andrew Lunn.
5/5 - [Fix] Make fwnode = of_fwnode_handle(priv->plat->phylink_node)
      order after priv = netdev_priv(dev).

v4 changes:
1/5 - Squash v3:1/7 & 2/7 patches into v4:1/6 so that it passes build.
2/5 - [No change] same as v3:3/7
3/5 - [Fix] Fix issues identified by Russell in [1]
4/5 - [Fix] Drop v3:5/7 patch per input by Russell in [2] and make
            dwmac-intel clear the ovr_an_inband flag if fixed-link
            is used in ACPI _DSD.
5/5 - [No change] same as v3:7/7

For the steps to setup ACPI _DSD and checking, they are the same
as in [3]

Reference:
[1] https://patchwork.kernel.org/comment/24894239/
[2] https://patchwork.kernel.org/comment/24895330/
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
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  34 +++-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  12 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |  14 ++
 drivers/net/pcs/pcs-xpcs.c                    | 176 +++++++++++++++++-
 drivers/net/pcs/pcs-xpcs.h                    |   1 -
 include/linux/pcs/pcs-xpcs.h                  |   3 +-
 7 files changed, 229 insertions(+), 13 deletions(-)

--
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
