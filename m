Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6343D8405FC
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 14:05:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D57DC6A613;
	Mon, 29 Jan 2024 13:05:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74A42C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 13:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706533509; x=1738069509;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xyoHfqTNIOjnNDp1+5s08f5WV/yjrMhPn3StDt1Ourk=;
 b=S47hAKvfLkmCG3ZJTUn+i7C9qNltHAknLAHr3qihqGWI+fHd44kZPRXP
 cKFukCUTZiLe5ylWOLdfrEUXy6NhHhc9ZEZwy0iLXGj9965DaG4xgnve3
 cwvW6bDf5qclMdVzWRR/cH8rTlHtxzdMB1rwkgOfsHvqS0DjZ8sChxptt
 3PcJHv4H2wi2RLq2w1FSsoYhUNzO1nYJ4CtiKrOkHdnucPuR4OLrLG4us
 m1J8nEZjHQpVa287lb4KDI+YzEbEdkLR1g/lD/Fu3mp1TLI58LoqCYpZ3
 itmoITy7bjnvIhhv5MavJfqOkgRF/rnq27J5W56mDB0XCFc6ra5fkuo9Z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="21473124"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="21473124"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 05:05:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="907106700"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="907106700"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2024 05:04:59 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 29 Jan 2024 21:02:42 +0800
Message-Id: <20240129130253.1400707-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-hwmon@vger.kernel.org, Voon Wei Feng <weifeng.voon@intel.com>,
 Simon Horman <simon.horman@corigine.com>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, platform-driver-x86@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Abdul Rahim Faizal <faizal.abdul.rahim@intel.com>, netdev@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v4 00/11] Enable SGMII and 2500BASEX
	interface mode switching for Intel platforms
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

From: Choong Yong Liang <yong.liang.choong@intel.com>

At the start of link initialization, the 'allow_switch_interface' flag is
set to true. Based on 'allow_switch_interface' flag, the interface mode is
configured to PHY_INTERFACE_MODE_NA within the 'phylink_validate_phy'
function. This setting allows all ethtool link modes that are supported and
advertised will be published. Then interface mode switching occurs based on
the selection of different link modes.

During the interface mode change, the 'phylink_major_config' function
will be triggered in phylink. The modification of the following functions
will be triggered to support the switching between SGMII and 2500BASEX
interfaces for the Intel platform.

- mac_get_pcs_neg_mode: A new function that selects the PCS negotiation
  mode according to the interface mode.
- mac_select_pcs: Destroys and creates a new PCS according to the
  interface mode.
- mac_finish: Configures the SerDes according to the interface mode.

With the above changes, the code will work as follows during the
interface mode change. The PCS and PCS negotiation mode will be selected
for PCS configuration according to the interface mode. Then, the MAC
driver will perform SerDes configuration on the 'mac_finish' based on the
interface mode. During the SerDes configuration, the selected interface
mode will identify TSN lane registers from FIA and then send IPC commands
to the Power Management Controller (PMC) through the PMC driver/API.
PMC will act as a proxy to program the PLL registers.

Change log:
v1 -> v2: 
 - Add static to pmc_lpm_modes declaration
 - Add cur_link_an_mode to the kernel doc
 - Combine 2 commits i.e. "stmmac: intel: Separate driver_data of ADL-N
 from TGL" and "net: stmmac: Add 1G/2.5G auto-negotiation
 support for ADL-N" into 1 commit.

v2 -> v3:
 - Create `pmc_ipc.c` file for `intel_pmc_ipc()` function and 
 allocate the file in `arch/x86/platform/intel/` directory.
 - Update phylink's AN mode during phy interface change and 
 not exposing phylink's AN mode into phylib.
 
 v3 -> v4:
 - Introduce `allow_switch_interface` flag to have all ethtool 
 link modes that are supported and advertised will be published.
 - Introduce `mac_get_pcs_neg_mode` function that selects the PCS 
 negotiation mode according to the interface mode.
 - Remove pcs-xpcs.c changes and handle pcs during `mac_select_pcs`
 function
 - Configure SerDes base on the interface on `mac_finish` function.

Choong Yong Liang (9):
  net: phylink: publish ethtool link modes that supported and advertised
  net: stmmac: provide allow_switch_interface flag
  net: phylink: provide mac_get_pcs_neg_mode() function
  net: phylink: add phylink_pcs_neg_mode() declaration into phylink.h
  net: stmmac: select PCS negotiation mode according to the interface
    mode
  net: stmmac: resetup XPCS according to the new interface mode
  net: stmmac: configure SerDes on mac_finish
  stmmac: intel: interface switching support for EHL platform
  stmmac: intel: interface switching support for ADL-N platform

David E. Box (1):
  arch: x86: Add IPC mailbox accessor function and add SoC register
    access

Tan, Tee Min (1):
  stmmac: intel: configure SerDes according to the interface mode

 MAINTAINERS                                   |   2 +
 arch/x86/Kconfig                              |   9 +
 arch/x86/platform/intel/Makefile              |   1 +
 arch/x86/platform/intel/pmc_ipc.c             |  75 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 233 ++++++++++++++++--
 .../net/ethernet/stmicro/stmmac/dwmac-intel.h |  81 ++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  48 +++-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |   7 +-
 drivers/net/phy/phylink.c                     |  30 ++-
 include/linux/phylink.h                       |   9 +
 .../linux/platform_data/x86/intel_pmc_ipc.h   |  34 +++
 include/linux/stmmac.h                        |   6 +
 14 files changed, 506 insertions(+), 32 deletions(-)
 create mode 100644 arch/x86/platform/intel/pmc_ipc.c
 create mode 100644 include/linux/platform_data/x86/intel_pmc_ipc.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
