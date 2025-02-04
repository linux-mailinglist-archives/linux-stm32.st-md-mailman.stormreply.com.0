Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C925BA26BE9
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2025 07:11:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E078C78F7B;
	Tue,  4 Feb 2025 06:11:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B6A3C78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2025 06:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738649478; x=1770185478;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wFcpLZeR+9puSZ3enjCz0fy9g9uHT+CQiy08Uu+Q6Ec=;
 b=Xe5Uif4MzvqDaTpyAqdbLPtW7dTn9Zqkh1vSu3FIFI1fn1lnd4UVeFkb
 1sRr3OeuA/a+lgLF1bfYb0ejA3Q+G71+XuVQi2PjFc/opQ1+GMuqYGThP
 n2xwzS6t4tf4/Asl2a8sIYR5yqs+IXl1qRzCb8t6j8HZaz5dxJV9BlFY7
 QZQEG4cPqrtHN/OjlApUw/dAR6BtDH4RjE3Jm3Sur/Nzw3hvU8hLh9aK2
 gfZQ9tBfINQwaQIYlS/9VAbnwH1m19p2TlLmybsCMFKvh+FgEbrOSE5/f
 60wMIeL2BfMCHTdV3Wwux96XLe5OYuYTICj6ZNeXIy+k5Iv5mCVfWnY7x g==;
X-CSE-ConnectionGUID: XhQTrbnaQIaWK6YM2jQWbQ==
X-CSE-MsgGUID: Mm3PB2/+S8O9UO6HNv68wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50579577"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50579577"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 22:11:10 -0800
X-CSE-ConnectionGUID: 6jwsG0/7QO+8MjZY2BO8oQ==
X-CSE-MsgGUID: qq7r9d+hTXaVNxJRjccM7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="110279139"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
 by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 22:11:02 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>,
 David E Box <david.e.box@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>, Serge Semin <fancer.lancer@gmail.com>
Date: Tue,  4 Feb 2025 14:10:13 +0800
Message-Id: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 0/7] Enable SGMII and 2500BASEX
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

During the interface mode change, the 'phylink_major_config' function will
be triggered in phylink. The modification of the following functions will
support the switching between SGMII and 2500BASE-X interface modes for
the Intel platform:

- xpcs_switch_interface_mode: Re-initiates clause 37 auto-negotiation for
  the SGMII interface mode to perform auto-negotiation.
- mac_finish: Configures the SerDes according to the interface mode.

With the above changes, the code will work as follows during the interface
mode change. The PCS will reconfigure according to the pcs_neg_mode and the
selected interface mode. Then, the MAC driver will perform SerDes
configuration in 'mac_finish' based on the selected interface mode. During
the SerDes configuration, the selected interface mode will identify TSN
lane registers from FIA and then send IPC commands to the Power Management
Controller (PMC) through the PMC driver/API. The PMC will act as a proxy to
program the PLL registers.

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

v5 -> v6:
- Remove 'mac_get_pcs_neg_mode' related patches. 
  The pcs_neg_mode is properly handled by the
  'net: add negotiation of in-band capabilities' patch series:
  https://patchwork.kernel.org/project/netdevbpf/cover/Z08kCwxdkU4n2V6x@shell.armlinux.org.uk/
- Using act_link_an_mode to determine PHY, as cfg_link_an_mode was not
  updated for the 2500BASE-X interface mode, caused a failure to link up.
- Clean up and standardize the interface mode switch for xpcs.

v1: https://patchwork.kernel.org/project/netdevbpf/cover/20230622041905.629430-1-yong.liang.choong@linux.intel.com/
v2: https://patchwork.kernel.org/project/netdevbpf/cover/20230804084527.2082302-1-yong.liang.choong@linux.intel.com/
v3: https://patchwork.kernel.org/project/netdevbpf/cover/20230921121946.3025771-1-yong.liang.choong@linux.intel.com/
v4: https://patchwork.kernel.org/project/netdevbpf/cover/20240129130253.1400707-1-yong.liang.choong@linux.intel.com/
v5: https://patchwork.kernel.org/project/netdevbpf/cover/20240215030500.3067426-1-yong.liang.choong@linux.intel.com/

Choong Yong Liang (6):
  net: phylink: use act_link_an_mode to determine PHY
  net: pcs: xpcs: re-initiate clause 37 Auto-negotiation
  stmmac: intel: configure SerDes according to the interface mode
  net: stmmac: configure SerDes on mac_finish
  stmmac: intel: interface switching support for EHL platform
  stmmac: intel: interface switching support for ADL-N platform

David E. Box (1):
  arch: x86: add IPC mailbox accessor function and add SoC register
    access

 MAINTAINERS                                   |   2 +
 arch/x86/Kconfig                              |   9 +
 arch/x86/platform/intel/Makefile              |   1 +
 arch/x86/platform/intel/pmc_ipc.c             |  75 ++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   2 +
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 173 +++++++++++++++++-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.h |  81 ++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  13 ++
 drivers/net/pcs/pcs-xpcs-wx.c                 |   4 +-
 drivers/net/pcs/pcs-xpcs.c                    |  60 +++++-
 drivers/net/phy/phylink.c                     |  10 +-
 .../linux/platform_data/x86/intel_pmc_ipc.h   |  34 ++++
 include/linux/stmmac.h                        |   3 +
 13 files changed, 450 insertions(+), 17 deletions(-)
 create mode 100644 arch/x86/platform/intel/pmc_ipc.c
 create mode 100644 include/linux/platform_data/x86/intel_pmc_ipc.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
