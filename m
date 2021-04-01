Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7F4350EB1
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Apr 2021 08:02:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA0ABC57B54;
	Thu,  1 Apr 2021 06:02:15 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0DCDC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 06:02:11 +0000 (UTC)
IronPort-SDR: tsYffVAVmBF95Z/H80caRpuI6DK+OmaNoZRv65Hq4DGLjbXBLryj3H3poL/Vw9HI52joLVGMjx
 xmXvs37DiadQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="277346639"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="277346639"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 23:02:09 -0700
IronPort-SDR: 3syucskN8LM8LtLBaJYl15+HJr2elqI3Irezo8nFFZK7qqndb3cAk7h8Sm6ZMiEAa1rK5s636C
 M8QXjV6XVGBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="377569641"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga003.jf.intel.com with ESMTP; 31 Mar 2021 23:02:09 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.59])
 by linux.intel.com (Postfix) with ESMTP id 6387F5808ED;
 Wed, 31 Mar 2021 23:02:07 -0700 (PDT)
From: Wong Vee Khee <vee.khee.wong@linux.intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu,  1 Apr 2021 14:06:28 +0800
Message-Id: <20210401060628.27339-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: remove unnecessary
	pci_enable_msi() call
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

The commit d2a029bde37b ("stmmac: pci: add MSI support for Intel Quark
X1000") introduced a pci_enable_msi() call in stmmac_pci.c.

With the commit 58da0cfa6cf1 ("net: stmmac: create dwmac-intel.c to
contain all Intel platform"), Intel Quark platform related codes
have been moved to the newly created driver.

Removing this unnecessary pci_enable_msi() call as there are no other
devices that uses stmmac-pci and need MSI to be enabled.

Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
index 272cb47af9f2..95e0e4d6f74d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c
@@ -198,8 +198,6 @@ static int stmmac_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	pci_enable_msi(pdev);
-
 	memset(&res, 0, sizeof(res));
 	res.addr = pcim_iomap_table(pdev)[i];
 	res.wol_irq = pdev->irq;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
