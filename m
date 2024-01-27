Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE4083EAD9
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Jan 2024 05:04:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF32BC6DD70;
	Sat, 27 Jan 2024 04:04:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA64CC6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Jan 2024 04:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706328295; x=1737864295;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GbF14G6YpxSnI2dRMEHZjL9Vnu5yGrLLsZmxi9qC+8c=;
 b=Sqn0c4boP5NGBNMJheiOKTXYs6/1XzwqHYMBFFrojgAcDAibLAyL2/LH
 k4YCfRFuj+NBKxZElEF9lrRHJhYWzhWG6eFm2m7yTdbq9Y0VfQsjId/T3
 kcRDVSH4S2DkHHLAg3XWGPWOkCJijYD4ZSYdt8QANlOF8GJt9INLa62qr
 F0Li3VQd5baQWpv+gJHD92SxrDudv8l5Cal/GykAK9qDmcQBk4KMQTpZX
 rRJqf3HBr9YCSA1o+zMiimSBM0f5pDKFqGR6r7kntR0yi8x/1mtJEUrDi
 GpWRIzEyMUtpkCAV79p6sNkZi8QbU3yqD0CLFYT6vL8JTlO47YLwz3sYr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="402289585"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="402289585"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 20:04:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="787309780"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; d="scan'208";a="787309780"
Received: from ppglcf2090.png.intel.com ([10.126.160.96])
 by orsmga002.jf.intel.com with ESMTP; 26 Jan 2024 20:04:47 -0800
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>
Date: Sat, 27 Jan 2024 12:04:40 +0800
Message-Id: <20240127040443.24835-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, bpf@vger.kernel.org,
 Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: EST conformance
	support
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

This patchset enables support for queueMaxSDU and transmission overrun
counters which are required for Qbv conformance.

Rohan G Thomas (3):
  net: stmmac: Offload queueMaxSDU from tc-taprio
  net: stmmac: est: Per Tx-queue error count for HLBF
  net: stmmac: Report taprio offload status

 drivers/net/ethernet/stmicro/stmmac/common.h  |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_est.c  |  6 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 +++++
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 87 ++++++++++++++++++-
 include/linux/stmmac.h                        |  1 +
 5 files changed, 114 insertions(+), 4 deletions(-)

-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
