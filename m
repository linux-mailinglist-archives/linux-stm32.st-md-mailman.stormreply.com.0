Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFCD42258A
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Oct 2021 13:45:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA13FC5AB7F;
	Tue,  5 Oct 2021 11:45:12 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBC6CC5719C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 11:45:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="225615934"
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="225615934"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2021 04:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,348,1624345200"; d="scan'208";a="477646370"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 05 Oct 2021 04:44:52 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.69])
 by linux.intel.com (Postfix) with ESMTP id D46EE5805EE;
 Tue,  5 Oct 2021 04:44:48 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue,  5 Oct 2021 19:50:58 +0800
Message-Id: <20211005115100.1648170-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Wong Vee Khee <veekhee@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 0/2] net: stmmac: Turn off EEE on MAC link
	down
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

This patch series ensure PCS EEE is turned off on the event of MAC
link down.

Tested on Intel AlderLake-S (STMMAC + MaxLinear GPY211 PHY).

Wong Vee Khee (2):
  net: pcs: xpcs: fix incorrect steps on disable EEE
  net: stmmac: trigger PCS EEE to turn off on link down

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++++-
 drivers/net/pcs/pcs-xpcs.c                        | 13 +++++++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
