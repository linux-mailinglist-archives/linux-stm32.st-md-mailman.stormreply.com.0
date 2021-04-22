Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB59E367B8A
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Apr 2021 09:55:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 732BCC58D5C;
	Thu, 22 Apr 2021 07:55:29 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F4DDCFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Apr 2021 07:55:26 +0000 (UTC)
IronPort-SDR: NQkbXoHpsNLPmRWQL5sQjAg9fAl+QEvvP3TSEndS73PCZbu+1F99aBlHUzWIOJNzwafo4R9QAL
 vjSuMPtTDohg==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="193726189"
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="193726189"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 00:55:23 -0700
IronPort-SDR: NzzDXLHqu2L9ny8xkAuI5KpJ53WmVuRRYa4TXBeg0VGbwjgtGyJ9SCmJPHoPY87pGnjicHzuzi
 WL7/NlHup3mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="421282361"
Received: from mismail5-ilbpg0.png.intel.com ([10.88.229.82])
 by fmsmga008.fm.intel.com with ESMTP; 22 Apr 2021 00:55:17 -0700
From: mohammad.athari.ismail@intel.com
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Chuah@stm-ict-prod-mailman-01.stormreply.prv,
	Kim Tatt <kim.tatt.chuah@intel.com>
Date: Thu, 22 Apr 2021 15:54:59 +0800
Message-Id: <20210422075501.20207-1-mohammad.athari.ismail@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Voon Weifeng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mohammad.athari.ismail@intel.com,
 Tan Tee Min <tee.min.tan@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/2] Enable DWMAC HW descriptor
	prefetch
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>

This patch series to add setting for HW descriptor prefetch for DWMAC version 5.20 onwards. For Intel platform, enable the capability by default.

Mohammad Athari Bin Ismail (2):
  net: stmmac: Add HW descriptor prefetch setting for DWMAC Core 5.20
    onwards
  stmmac: intel: Enable HW descriptor prefetch by default

 drivers/net/ethernet/stmicro/stmmac/common.h      |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c |  1 +
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 10 ++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  5 +++++
 include/linux/stmmac.h                            |  1 +
 6 files changed, 17 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
