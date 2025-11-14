Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BBFC5EF46
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 20:03:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2B2AC628DA;
	Fri, 14 Nov 2025 19:03:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD3EFC06935
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 19:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763147025; x=1794683025;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dym/pfPU9DLIbudGmaXmsPCZxOSh2XiLLb064rHEO3A=;
 b=M2rDxOcLXW7gMM+PVnkFYuHSswOCgHURG/rugX/06p7xQfRMCoXR7R2B
 lGuZk8428m6m6gd7BkwHEYTFe9ZOK0qkXXDDohMHIpzquIpC+NHUNFeZY
 yM1JCXE1fEksxd05MssEO4kTZ4wa/mA/TnPJU8ZuBcbr2/xoKaPWalBN7
 oOdE7eRG8v7fMm/AXvGqS863Cc8vpEy+N/RxdF55/xswbbXrwxkZugc6L
 hyaZFXM/pIpc3GU9gxsJYP+KE5wqqxuIeVi07Vb8KiP2mGIdDzEjHLbtI
 /C6CeQWPlXF5mbpyZB38JSPzyaugnZpFYQX+yJZGUqm/PUBJBO5b9rBDP A==;
X-CSE-ConnectionGUID: 1EgfeoghTtW2r9C1OucBIw==
X-CSE-MsgGUID: 8sgbHE9rQv+8udVrVh+Buw==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="87896167"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="87896167"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 11:03:43 -0800
X-CSE-ConnectionGUID: Y3M1gm+YRxme2H3VOXGn5Q==
X-CSE-MsgGUID: ZFiGynYVRpC+9bZ21AGmqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="195002153"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP; 14 Nov 2025 11:03:41 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id B1D2F94; Fri, 14 Nov 2025 19:55:36 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christian Bruel <christian.bruel@foss.st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 14 Nov 2025 19:52:01 +0100
Message-ID: <20251114185534.3287497-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: [Linux-stm32] [PATCH v2 1/1] PCI: stm32: Don't use "proxy" headers
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

Update header inclusions to follow IWYU (Include What You Use)
principle.

In particular, replace of_gpio.h, which is subject to remove by the GPIOLIB
subsystem, with the respective headers that are being used by the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: took care of pci-stm32.* as well (Christian)

 drivers/pci/controller/dwc/pcie-stm32-ep.c |  2 +-
 drivers/pci/controller/dwc/pcie-stm32.c    | 14 +++++++++++++-
 drivers/pci/controller/dwc/pcie-stm32.h    |  3 +++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
index 3400c7cd2d88..2b9b451306fc 100644
--- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
+++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
@@ -7,9 +7,9 @@
  */
 
 #include <linux/clk.h>
+#include <linux/gpio/consumer.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of_platform.h>
-#include <linux/of_gpio.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
index 96a5fb893af4..a9e77478443b 100644
--- a/drivers/pci/controller/dwc/pcie-stm32.c
+++ b/drivers/pci/controller/dwc/pcie-stm32.c
@@ -7,18 +7,30 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/irq.h>
 #include <linux/mfd/syscon.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/stddef.h>
+
+#include "../../pci.h"
+
 #include "pcie-designware.h"
 #include "pcie-stm32.h"
-#include "../../pci.h"
 
 struct stm32_pcie {
 	struct dw_pcie pci;
diff --git a/drivers/pci/controller/dwc/pcie-stm32.h b/drivers/pci/controller/dwc/pcie-stm32.h
index 09d39f04e469..419cf1ff669d 100644
--- a/drivers/pci/controller/dwc/pcie-stm32.h
+++ b/drivers/pci/controller/dwc/pcie-stm32.h
@@ -6,6 +6,9 @@
  * Author: Christian Bruel <christian.bruel@foss.st.com>
  */
 
+#include <linux/bits.h>
+#include <linux/device.h>
+
 #define to_stm32_pcie(x)	dev_get_drvdata((x)->dev)
 
 #define STM32MP25_PCIECR_TYPE_MASK	GENMASK(11, 8)
-- 
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
