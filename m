Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC5E96B0A7
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 07:48:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EC69C7802B;
	Wed,  4 Sep 2024 05:48:37 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com
 [192.19.144.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD7D2C7801C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 05:48:31 +0000 (UTC)
Received: from mail-lvn-it-01.lvn.broadcom.net
 (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B68A8C0000EA;
 Tue,  3 Sep 2024 22:48:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B68A8C0000EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1725428910;
 bh=LeJBorlgmmwIJfi9UAl/k7sM2jC+wlgmF+0l067YFu0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GLuyaj2Hr+lMNnLqmokXeijlHFVmpXkwjQ40aKWV8mB1kUtLrfB7auiZRbRCuAMr9
 Kmw7JrE+o3YBSKCUOH9DVfSW0l5ZKCOEU4EIHAH6Y2bAxaPrONOccISzEoG73uRR1d
 WkcJ6nBJEZE0oYr9HRla6xy1ub40916wh1uw/jbA=
Received: from pcie-dev03.dhcp.broadcom.net (pcie-dev03.dhcp.broadcom.net
 [10.59.171.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 1737618041D1E4;
 Tue,  3 Sep 2024 22:48:30 -0700 (PDT)
From: jitendra.vegiraju@broadcom.com
To: netdev@vger.kernel.org
Date: Tue,  3 Sep 2024 22:48:15 -0700
Message-Id: <20240904054815.1341712-6-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904054815.1341712-1-jitendra.vegiraju@broadcom.com>
References: <20240904054815.1341712-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, jitendra.vegiraju@broadcom.com,
 kuba@kernel.org, rohan.g.thomas@intel.com, pabeni@redhat.com,
 ahalaney@redhat.com, hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v5 5/5] net: stmmac: Add BCM8958x
	driver to build system
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

From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>

Add PCI driver for BCM8958x to the linux build system and
update MAINTAINERS file.

Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
---
 MAINTAINERS                                  |  8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig  | 11 +++++++++++
 drivers/net/ethernet/stmicro/stmmac/Makefile |  1 +
 3 files changed, 20 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index baf88e74c907..199fe7699365 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4360,6 +4360,14 @@ N:	brcmstb
 N:	bcm7038
 N:	bcm7120
 
+BROADCOM BCM8958X ETHERNET DRIVER
+M:	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
+R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	drivers/net/ethernet/stmicro/stmmac/dw25gmac.*
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
+
 BROADCOM BCMBCA ARM ARCHITECTURE
 M:	William Zhang <william.zhang@broadcom.com>
 M:	Anand Gore <anand.gore@broadcom.com>
diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 05cc07b8f48c..47c9db123b03 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -298,6 +298,17 @@ config DWMAC_LOONGSON
 	  This selects the LOONGSON PCI bus support for the stmmac driver,
 	  Support for ethernet controller on Loongson-2K1000 SoC and LS7A1000 bridge.
 
+config DWMAC_BRCM
+	tristate "Broadcom XGMAC support"
+	depends on STMMAC_ETH && PCI
+	depends on COMMON_CLK
+	help
+	  Support for ethernet controllers on Broadcom BCM8958x SoCs.
+
+	  This selects Broadcom XGMAC specific PCI bus support for the
+	  stmmac driver. This driver provides the glue layer on top of the
+	  stmmac driver required for the Broadcom BCM8958x SoC devices.
+
 config STMMAC_PCI
 	tristate "STMMAC PCI bus support"
 	depends on STMMAC_ETH && PCI
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 967e8a9aa432..517981b9e93a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -41,4 +41,5 @@ dwmac-altr-socfpga-objs := dwmac-socfpga.o
 obj-$(CONFIG_STMMAC_PCI)	+= stmmac-pci.o
 obj-$(CONFIG_DWMAC_INTEL)	+= dwmac-intel.o
 obj-$(CONFIG_DWMAC_LOONGSON)	+= dwmac-loongson.o
+obj-$(CONFIG_DWMAC_BRCM)	+= dwmac-brcm.o
 stmmac-pci-objs:= stmmac_pci.o
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
