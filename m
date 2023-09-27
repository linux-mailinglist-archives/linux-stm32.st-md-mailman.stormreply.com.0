Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C94A7B057F
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Sep 2023 15:33:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1539C6A60C;
	Wed, 27 Sep 2023 13:33:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16A3CC65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 13:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695821613; x=1727357613;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NUigNMShWhyuKldPxid5E/o6rZg3Y7HZGIR7UdP0JxM=;
 b=bzL/2ZEOvmKqGFBtWe/e3ZAcpkR4u8mgoULCxDlb307ae98jVRiKX/72
 bKkkG0nPzCfKd7KceK9m6OGaEGK1D+5JN1W5LbdmX9lXD+gNQklWDY2g/
 261CE9HGJ3/vdd103alHRxodItvg7U0oiaXlRTmw7vIp+A9zPIiJ1cdYZ
 VecGoHvppGyqqNxtIheouw1RvSdk1cNQmHvUWmwA5BaivDEIWUKVjFosj
 Q424W1wrpC6gRcusAMRjaqMd926PJsP40/gJLUks84ppYpZzDuTb/WKUW
 RGXjaBfr4x0hC5/i8GoapkEfyRPP+dF+ZMtbT2g4jimtmNmRQt/DnholZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="380700669"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="380700669"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:09:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="698866879"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="698866879"
Received: from pglc00352.png.intel.com ([10.221.235.155])
 by orsmga003.jf.intel.com with ESMTP; 27 Sep 2023 06:09:24 -0700
From: Rohan G Thomas <rohan.g.thomas@intel.com>
To: "David S . Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Serge Semin <fancer.lancer@gmail.com>
Date: Wed, 27 Sep 2023 21:09:17 +0800
Message-Id: <20230927130919.25683-1-rohan.g.thomas@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rohan G Thomas <rohan.g.thomas@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: TBS support for
	platform driver
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
This patchset enable Time Based Scheduling(TBS) support for Tx queues
through the stmmac platform driver. For this a new per-queue
tx-config property, tbs-enabled is added to the devicetree.

Commit 7eadf57290ec ("net: stmmac: pci: Enable TBS on GMAC5 IPK PCI
entry") enables similar support for the stmmac pci driver.

Rohan G Thomas (2):
  dt-bindings: net: snps,dwmac: Time Based Scheduling
  net: stmmac: TBS support for platform driver

 .../devicetree/bindings/net/snps,dwmac.yaml   |  8 ++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 25 +++++++++++++++----
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  4 +++
 3 files changed, 32 insertions(+), 5 deletions(-)

-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
