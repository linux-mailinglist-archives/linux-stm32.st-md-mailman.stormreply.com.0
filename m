Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5CD3B6CCC
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jun 2021 05:10:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E56DAC57B7D;
	Tue, 29 Jun 2021 03:10:30 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9113C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jun 2021 03:10:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="229699764"
X-IronPort-AV: E=Sophos;i="5.83,307,1616482800"; d="scan'208";a="229699764"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 20:10:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,307,1616482800"; d="scan'208";a="558597289"
Received: from peileeli.png.intel.com ([172.30.240.12])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2021 20:10:21 -0700
From: Ling Pei Lee <pei.lee.ling@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, weifeng.voon@intel.com,
 boon.leong.ong@intel.com, vee.khee.wong@linux.intel.com,
 vee.khee.wong@intel.com, tee.min.tan@intel.com,
 michael.wei.hong.sit@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 29 Jun 2021 11:08:56 +0800
Message-Id: <20210629030859.1273157-1-pei.lee.ling@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: pei.lee.ling@intel.com
Subject: [Linux-stm32] [PATCH net-next V2 0/3] Add option to enable PHY WOL
	with PMT enabled
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

This patchset main objective is to provide an option to enable PHY WoL even the PMT is enabled by default in the HW features.

The current stmmac driver WOL implementation will enable MAC WOL if MAC HW PMT feature is on. Else, the driver will check for PHY WOL support.
Intel EHL mgbe are designed to wake up through PHY WOL although the HW PMT is enabled.Hence, introduced use_phy_wol platform data to provide this PHY WOL option. Set use_phy_wol will disable the plat->pmt which currently used to determine the system to wake up by MAC WOL or PHY WOL.

This WOL patchset includes of setting the device power state to D3hot.
This is because the EHL PSE will need to PSE mgbe to be in D3 state in order for the PSE to goes into suspend mode.

Change Log:
 V2: Drop Patch #3 net: stmmac: Reconfigure the PHY WOL settings in stmmac_resume().

Ling Pei Lee (2):
  net: stmmac: option to enable PHY WOL with PMT enabled
  stmmac: intel: Enable PHY WOL option in EHL

Voon Weifeng (1):
  stmmac: intel: set PCI_D3hot in suspend

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 include/linux/stmmac.h                            | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
