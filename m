Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD98685591D
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 04:07:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92392C62EFE;
	Thu, 15 Feb 2024 03:07:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC2BFCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 03:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707966451; x=1739502451;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qwwasO+1xBKjEezC6aXWqJJmEG8jQepQBuZ9KNK5I8Y=;
 b=mJN5ckaMcm4qtMYIZbnojCzPtUfD/N/oE5ynFpzK9qQs/Bw5aq/k9wb6
 dSqAWNBxbERwYtknsJpOUuGrIbrOmGGdVAWwqmqVjqlWMWFHPwoCCQqTO
 qK9TPPXw+Ha7yuKnjiJA4Dcz4Vk/+l8eNIF2GJdKzwz5jmpyQp4pErfqc
 txN8CzmGxeZ1+0xeHq21wv47cvOajFTofqWoGHvaaBsWlRRGX+APqT05C
 FMAzsanfDy+ZJKTpouN81+Or0/APV6toX6/3WBLQGkrI7q/JmECBEzSvT
 GoyX/m/OctglxE0kRzgKXaUxky7j+KUhPaKGiCxjXJn09ruC4WdSYEZJg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="19461208"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="19461208"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 19:07:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3385643"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by fmviesa009.fm.intel.com with ESMTP; 14 Feb 2024 19:07:21 -0800
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
Date: Thu, 15 Feb 2024 11:04:50 +0800
Message-Id: <20240215030500.3067426-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-hwmon@vger.kernel.org, Voon Wei Feng <weifeng.voon@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, platform-driver-x86@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Abdul Rahim Faizal <faizal.abdul.rahim@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v5 0/9] Enable SGMII and 2500BASEX
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

From: root <root@YongLiang-Ubuntu20-iLBPG12.png.intel.com>

During the interface mode change, the 'phylink_major_config' function
will be triggered in phylink. The modification of the following functions
will be triggered to support the switching between SGMII and 2500BASEX
interfaces mode for the Intel platform.

- mac_get_pcs_neg_mode: A new function that selects the PCS negotiation
  mode according to the interface mode.
- xpcs_do_config: Re-initiate clause 37 auto-negotiation for SGMII interface
  mode to perform auto-negotiation.
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
 
 v4 -> v5:
 - remove 'allow_switch_interface' related patches.
 - remove 'mac_select_pcs' related patches.
 - add a soft reset according to XPCS datasheet for re-initiate Clause 37
 auto-negotiation when switching to SGMII interface mode.

Choong Yong Liang (7):
  net: phylink: provide mac_get_pcs_neg_mode() function
  net: phylink: add phylink_pcs_neg_mode() declaration into phylink.h
  net: stmmac: select PCS negotiation mode according to the interface
    mode
  net: pcs: xpcs: re-initiate clause 37 Auto-negotiation
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
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   2 +
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 233 ++++++++++++++++--
 .../net/ethernet/stmicro/stmmac/dwmac-intel.h |  81 ++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  30 +++
 drivers/net/pcs/pcs-xpcs.c                    |  62 ++++-
 drivers/net/phy/phylink.c                     |  21 +-
 include/linux/phylink.h                       |   8 +
 .../linux/platform_data/x86/intel_pmc_ipc.h   |  34 +++
 include/linux/stmmac.h                        |   5 +
 13 files changed, 538 insertions(+), 25 deletions(-)
 create mode 100644 arch/x86/platform/intel/pmc_ipc.c
 create mode 100644 include/linux/platform_data/x86/intel_pmc_ipc.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
