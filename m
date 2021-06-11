Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF93A42BF
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 15:11:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6BDBC58D5C;
	Fri, 11 Jun 2021 13:11:32 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 181CDC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 13:11:30 +0000 (UTC)
IronPort-SDR: cqKvY4shtX8tC0L1D6C7XO514JDGeB/nlqLtcZeb8vrlLckAdxxgQac4J+8Vu9zcYpqPyr4p0c
 EDPLeXq1S9uQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192831900"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="192831900"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 06:11:27 -0700
IronPort-SDR: ury56IbSMFcCKlCvcXyUq/Y2WXyIrUKlnCyKXhtQ3JmjjFjCPfDVN9lh/Z/7qjYiBqeuwPramp
 5wgAiY0ZwNHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="470635506"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 11 Jun 2021 06:11:27 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.69])
 by linux.intel.com (Postfix) with ESMTP id 916595807AA;
 Fri, 11 Jun 2021 06:11:24 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 11 Jun 2021 21:16:07 +0800
Message-Id: <20210611131609.1685105-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 0/2] stmmac: intel: minor clean-up
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

This patch series include two minor-cleanup patches:

  1. Move all the hardcoded DEFINEs to dwmac-intel header file.
  2. Fix the wrong kernel-doc on the intel_eth_pci_remove() function.

Since the changes are minor, only basic sanity tests are done on a
Intel TigerLake with Marvell88E2110 PHY:-

  - Link is up and able to perform ping.
  - phc2sys and ptp4l are running without errors.
 
Wong Vee Khee (2):
  stmmac: intel: move definitions to dwmac-intel header file
  stmmac: intel: fix wrong kernel-doc

 .../net/ethernet/stmicro/stmmac/dwmac-intel.c  | 18 +-----------------
 .../net/ethernet/stmicro/stmmac/dwmac-intel.h  | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
