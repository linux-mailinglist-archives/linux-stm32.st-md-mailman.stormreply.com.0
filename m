Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56171C5136E
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Nov 2025 09:56:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F13F7C628D0;
	Wed, 12 Nov 2025 08:56:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62C90C628CF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Nov 2025 08:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762937787; x=1794473787;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sl+zfwNpML36ev1KM+JlgPIGMQCZVqEo/fI0Ku9iDIM=;
 b=NaLcGxmoD7ZBAo84iMzWE4Xsk1kkv3IAyc1ALngqkuVO4eX8D5XHQ8zw
 BvJyP77shXb5AlzhMb98rD8Q+KMhQGyJxlrbqRvFz0eeSGra9rdL8H8IY
 rCJm2YKv/RfAvvm4r6yD8ef0VlwlkVTCGzc9xTYeJxOCgTCNXexeN3hpQ
 nmCSkzBesd2jL7RSO+dq/NzRFRSyU6BPDKTujfTi8xnqcoQYipC5pyvXR
 f9eo27U9cahaIM0/oD1CB5pGN0C+p8RRVv/u+LJYAyBsqi44THuS38u+k
 UM93FeoJlTcINJ3CwHcEuXAf/67oPw3dso6fATGxFzLDQE7LlqLS46+eZ A==;
X-CSE-ConnectionGUID: ft629YgqSwebYuTqZ4eWRQ==
X-CSE-MsgGUID: Mb8SyK/ISj+EbLD95931lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="90470259"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="90470259"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 00:56:24 -0800
X-CSE-ConnectionGUID: 6iy+RXr/QdiJ/GHS8641Ig==
X-CSE-MsgGUID: qqOSY0sjRGOCddFGLQVfKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188806184"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP; 12 Nov 2025 00:56:22 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id EC9B495; Wed, 12 Nov 2025 09:56:20 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christian Bruel <christian.bruel@foss.st.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 12 Nov 2025 09:56:20 +0100
Message-ID: <20251112085620.1452826-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: [Linux-stm32] [PATCH v1 1/1] PCI: stm32-ep: Don't use "proxy"
	headers
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

In this case replace of_gpio.h, which is subject to remove by the GPIOLIB
subsystem, with the respective headers that are being used by the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pci/controller/dwc/pcie-stm32-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
