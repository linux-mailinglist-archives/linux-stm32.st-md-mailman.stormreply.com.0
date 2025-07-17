Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7253B084F9
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jul 2025 08:33:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8351AC3F950;
	Thu, 17 Jul 2025 06:33:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BAC4C3F949
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jul 2025 06:33:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H2W55C019996;
 Thu, 17 Jul 2025 08:33:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 dwwi92ajr3Hx7+OnqQ/c83G/3mwouq+VJfJgJebS2Lg=; b=RVrVYkbd4bX0SVY5
 BdSY02pTpW6qPdNinX2+osvN0l5c9hCR1hwItQnswWOUN4LLWrJq1TaU0lkjxfQz
 ZEoG8VOfsqAGT4RpGFANhRtcEHNNTU5UKDHOyVP3WAjTp9vh+FRDHrIxxnlTWoft
 u5NV0ktnZPAU1637KtvnSS2cDlNWZ51ROdbH5tHzBFsXfRDLPXGdiYh3dmkxyOFn
 sxi5wShjsNeJ4FJ13J95oNhDC9C456iE4MVYLeRhCGo3wVlTiZ6BzNfJLFnEBG5g
 vcD2OLdg9IT3UhGj10VZosVg33q/pjIPHUAKx5eUd86IXWU7nZGJZGCh8o2il6FY
 bszB/g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47uekh6329-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jul 2025 08:33:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C47CA40046;
 Thu, 17 Jul 2025 08:32:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 951D478D295;
 Thu, 17 Jul 2025 08:31:31 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 08:31:31 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <lpieralisi@kernel.org>,
 <kwilczynski@kernel.org>, <mani@kernel.org>, <robh@kernel.org>,
 <bhelgaas@google.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <linus.walleij@linaro.org>
Date: Thu, 17 Jul 2025 08:30:42 +0200
Message-ID: <20250717063042.2236524-3-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717063042.2236524-1-christian.bruel@foss.st.com>
References: <20250717063042.2236524-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
Cc: kernel test robot <lkp@intel.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH 2/2] PCI: stm32: use
	pinctrl_pm_select_init_state() in stm32_pcie_resume_noirq()
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

Replace direct access to dev->pins->init_state with the new helper
pinctrl_pm_select_init_state() to select the init pinctrl state.
This fixes build issues when CONFIG_PINCTRL is not defined.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
Reported-by: Bjorn Helgaas <bhelgaas@google.com>  
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506260920.bmQ9hQ9s-lkp@intel.com/
Fixes: 633f42f48af5 ("PCI: stm32: Add PCIe host support for STM32MP25")
---
 drivers/pci/controller/dwc/pcie-stm32.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
index 50fae5f5ced2..c1d803dc3778 100644
--- a/drivers/pci/controller/dwc/pcie-stm32.c
+++ b/drivers/pci/controller/dwc/pcie-stm32.c
@@ -28,6 +28,7 @@ struct stm32_pcie {
 	struct clk *clk;
 	struct gpio_desc *perst_gpio;
 	struct gpio_desc *wake_gpio;
+	bool   have_pinctrl_init;
 };
 
 static void stm32_pcie_deassert_perst(struct stm32_pcie *stm32_pcie)
@@ -91,10 +92,10 @@ static int stm32_pcie_resume_noirq(struct device *dev)
 	/*
 	 * The core clock is gated with CLKREQ# from the COMBOPHY REFCLK,
 	 * thus if no device is present, must force it low with an init pinmux
-	 * to be able to access the DBI registers.
+	 * if present to be able to access the DBI registers.
 	 */
-	if (!IS_ERR(dev->pins->init_state))
-		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
+	if (stm32_pcie->have_pinctrl_init)
+		ret = pinctrl_pm_select_init_state(dev);
 	else
 		ret = pinctrl_pm_select_default_state(dev);
 
@@ -274,6 +275,9 @@ static int stm32_pcie_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(stm32_pcie->rst),
 				     "Failed to get PCIe reset\n");
 
+	if (device_property_match_string(dev, "pinctrl-names", PINCTRL_STATE_INIT) >= 0)
+		stm32_pcie->have_pinctrl_init = true;
+
 	ret = stm32_pcie_parse_port(stm32_pcie);
 	if (ret)
 		return ret;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
