Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C01A86283
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Apr 2025 17:58:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BB41C78006;
	Fri, 11 Apr 2025 15:58:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F0C1C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Apr 2025 15:58:53 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BEC02E001077;
 Fri, 11 Apr 2025 17:58:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Vt0ruUB9NLi+cVvpgT4lg66aGgsUlr+R02KjxPZ63f8=; b=wd+J+MbcF4I0xzOr
 ERcxLZxKiXZfUsGjwxokGRW5dr8qWikM6kFDAw4S23Trlce+vzq3oD4effpDmVmq
 0CseWKZqNzALYidgcdOPj0BuFeaGlev8MNiZQgtezW0iukhWJrIqeoKHzwkLESQ3
 vMVCqMoibCEQVFX/JURBye5UX4ltQrEQPaDyn98R6EpQ1ZUdefxQ7ihuNEfqD7R5
 hGwbqxFBamlN1ezvNJAfIchiGQVh2wMJ11dcH+uTEhENoG5f2pmGM0sFzZ2k+eKH
 6exOdlrqwBU7mShUDou9sSj7d7T9a+gT5bR/lMzHaGfbNncRzm+8DRjBGufEIaGW
 GJhnuQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw8pxcs3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Apr 2025 17:58:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BF8F64002D;
 Fri, 11 Apr 2025 17:56:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E1059A3EBA;
 Fri, 11 Apr 2025 17:55:30 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 17:55:29 +0200
Message-ID: <6bae3c34-47a6-466a-bd57-25fa0cea63e9@foss.st.com>
Date: Fri, 11 Apr 2025 17:55:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20250325065935.908886-1-christian.bruel@foss.st.com>
 <20250325065935.908886-5-christian.bruel@foss.st.com>
 <dirqsnrzjoiht7vvzzwh73gf3zuwyco6lc46k6s6pkifde2uzw@icmtn7x53swc>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <dirqsnrzjoiht7vvzzwh73gf3zuwyco6lc46k6s6pkifde2uzw@icmtn7x53swc>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_06,2025-04-10_01,2024-11-22_01
Cc: linux-arm-kernel@lists.infradead.org, kw@linux.com, conor+dt@kernel.org,
 p.zabel@pengutronix.de, robh@kernel.org, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, linux-kernel@vger.kernel.org, cassel@kernel.org,
 devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, johan+linaro@kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 4/9 RESEND] PCI: stm32: Add PCIe
 Endpoint support for STM32MP25
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 4/9/25 10:03, Manivannan Sadhasivam wrote:
> On Tue, Mar 25, 2025 at 07:59:30AM +0100, Christian Bruel wrote:
>> Add driver to configure the STM32MP25 SoC PCIe Gen1 2.5GT/s or Gen2 5GT/s
>> controller based on the DesignWare PCIe core in endpoint mode.
>>
>> Uses the common reference clock provided by the host.
>>
>> The PCIe core_clk receives the pipe0_clk from the ComboPHY as input,
>> and the ComboPHY PLL must be locked for pipe0_clk to be ready.
>> Consequently, PCIe core registers cannot be accessed until the ComboPHY is
>> fully initialised and refclk is enabled and ready.
>>
>> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
>> ---
>>   drivers/pci/controller/dwc/Kconfig         |  12 +
>>   drivers/pci/controller/dwc/Makefile        |   1 +
>>   drivers/pci/controller/dwc/pcie-stm32-ep.c | 420 +++++++++++++++++++++
>>   drivers/pci/controller/dwc/pcie-stm32.h    |   1 +
>>   4 files changed, 434 insertions(+)
>>   create mode 100644 drivers/pci/controller/dwc/pcie-stm32-ep.c
>>
>> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
>> index 0c18879b604c..4a3eb838557c 100644
>> --- a/drivers/pci/controller/dwc/Kconfig
>> +++ b/drivers/pci/controller/dwc/Kconfig
>> @@ -401,6 +401,18 @@ config PCIE_STM32
>>   	  This driver can also be built as a module. If so, the module
>>   	  will be called pcie-stm32.
>>   
>> +config PCIE_STM32_EP
>> +	tristate "STMicroelectronics STM32MP25 PCIe Controller (endpoint mode)"
>> +	depends on ARCH_STM32 || COMPILE_TEST
>> +	depends on PCI_ENDPOINT
>> +	select PCIE_DW_EP
>> +	help
>> +	  Enables endpoint support for DesignWare core based PCIe controller
>> +	  found in STM32MP25 SoC.
>> +
>> +	  This driver can also be built as a module. If so, the module
>> +	  will be called pcie-stm32-ep.
>> +
>>   config PCI_DRA7XX
>>   	tristate
>>   
>> diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
>> index 576d99cb3bc5..caebd98f6dd3 100644
>> --- a/drivers/pci/controller/dwc/Makefile
>> +++ b/drivers/pci/controller/dwc/Makefile
>> @@ -29,6 +29,7 @@ obj-$(CONFIG_PCIE_UNIPHIER_EP) += pcie-uniphier-ep.o
>>   obj-$(CONFIG_PCIE_VISCONTI_HOST) += pcie-visconti.o
>>   obj-$(CONFIG_PCIE_RCAR_GEN4) += pcie-rcar-gen4.o
>>   obj-$(CONFIG_PCIE_STM32) += pcie-stm32.o
>> +obj-$(CONFIG_PCIE_STM32_EP) += pcie-stm32-ep.o
>>   
>>   # The following drivers are for devices that use the generic ACPI
>>   # pci_root.c driver but don't support standard ECAM config access.
>> diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
>> new file mode 100644
>> index 000000000000..a8e9c5a9b127
>> --- /dev/null
>> +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
>> @@ -0,0 +1,420 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * STMicroelectronics STM32MP25 PCIe endpoint driver.
>> + *
>> + * Copyright (C) 2025 STMicroelectronics
>> + * Author: Christian Bruel <christian.bruel@foss.st.com>
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/of_gpio.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset.h>
>> +#include "pcie-designware.h"
>> +#include "pcie-stm32.h"
>> +
>> +enum stm32_pcie_ep_link_status {
>> +	STM32_PCIE_EP_LINK_DISABLED,
>> +	STM32_PCIE_EP_LINK_ENABLED,
>> +};
>> +
>> +struct stm32_pcie {
>> +	struct dw_pcie pci;
>> +	struct regmap *regmap;
>> +	struct reset_control *rst;
>> +	struct phy *phy;
>> +	struct clk *clk;
>> +	struct gpio_desc *perst_gpio;
>> +	enum stm32_pcie_ep_link_status link_status;
>> +	unsigned int perst_irq;
>> +};
>> +
>> +static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
>> +{
>> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>> +	enum pci_barno bar;
>> +
>> +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
>> +		dw_pcie_ep_reset_bar(pci, bar);
>> +}
>> +
>> +static int stm32_pcie_enable_link(struct dw_pcie *pci)
>> +{
>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>> +
>> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
>> +			   STM32MP25_PCIECR_LTSSM_EN,
>> +			   STM32MP25_PCIECR_LTSSM_EN);
>> +
>> +	return dw_pcie_wait_for_link(pci);
>> +}
>> +
>> +static void stm32_pcie_disable_link(struct dw_pcie *pci)
>> +{
>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>> +
>> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR, STM32MP25_PCIECR_LTSSM_EN, 0);
>> +}
>> +
>> +static int stm32_pcie_start_link(struct dw_pcie *pci)
>> +{
>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>> +	struct dw_pcie_ep *ep = &pci->ep;
>> +	int ret;
>> +
>> +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_ENABLED) {
>> +		dev_dbg(pci->dev, "Link is already enabled\n");
>> +		return 0;
>> +	}
>> +
>> +	ret = stm32_pcie_enable_link(pci);
>> +	if (ret) {
>> +		dev_err(pci->dev, "PCIe cannot establish link: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	dw_pcie_ep_linkup(ep);
>> +
> 
> This callback should only be used when the epc_features::linkup_notifier flag is
> set. That only applies to platforms supporting LINK_UP interrupt. In this case,
> once the start_link() callback returns, it is assumed that the link is active.
> So no need to call dw_pcie_ep_linkup().

OK thank you

> 
>> +	stm32_pcie->link_status = STM32_PCIE_EP_LINK_ENABLED;
>> +
>> +	enable_irq(stm32_pcie->perst_irq);
>> +
>> +	return 0;
>> +}
>> +
>> +static void stm32_pcie_stop_link(struct dw_pcie *pci)
>> +{
>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>> +
>> +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_DISABLED) {
>> +		dev_dbg(pci->dev, "Link is already disabled\n");
>> +		return;
>> +	}
>> +
>> +	disable_irq(stm32_pcie->perst_irq);
>> +
>> +	stm32_pcie_disable_link(pci);
>> +
>> +	stm32_pcie->link_status = STM32_PCIE_EP_LINK_DISABLED;
>> +}
>> +
>> +static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>> +				unsigned int type, u16 interrupt_num)
>> +{
>> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>> +
>> +	switch (type) {
>> +	case PCI_IRQ_INTX:
>> +		return dw_pcie_ep_raise_intx_irq(ep, func_no);
>> +	case PCI_IRQ_MSI:
>> +		return dw_pcie_ep_raise_msi_irq(ep, func_no, interrupt_num);
>> +	default:
>> +		dev_err(pci->dev, "UNKNOWN IRQ type\n");
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>> +static const struct pci_epc_features stm32_pcie_epc_features = {
>> +	.msi_capable = true,
>> +	.align = SZ_64K,
>> +};
>> +
>> +static const struct pci_epc_features*
>> +stm32_pcie_get_features(struct dw_pcie_ep *ep)
>> +{
>> +	return &stm32_pcie_epc_features;
>> +}
>> +
>> +static const struct dw_pcie_ep_ops stm32_pcie_ep_ops = {
>> +	.init = stm32_pcie_ep_init,
>> +	.raise_irq = stm32_pcie_raise_irq,
>> +	.get_features = stm32_pcie_get_features,
>> +};
>> +
>> +static const struct dw_pcie_ops dw_pcie_ops = {
>> +	.start_link = stm32_pcie_start_link,
>> +	.stop_link = stm32_pcie_stop_link,
>> +};
>> +
>> +static int stm32_pcie_enable_resources(struct stm32_pcie *stm32_pcie)
>> +{
>> +	int ret;
>> +
>> +	ret = phy_init(stm32_pcie->phy);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = clk_prepare_enable(stm32_pcie->clk);
>> +	if (ret)
>> +		phy_exit(stm32_pcie->phy);
>> +
>> +	return ret;
>> +}
>> +
>> +static void stm32_pcie_disable_resources(struct stm32_pcie *stm32_pcie)
>> +{
>> +	clk_disable_unprepare(stm32_pcie->clk);
>> +
>> +	phy_exit(stm32_pcie->phy);
>> +}
>> +
>> +static void stm32_pcie_perst_assert(struct dw_pcie *pci)
>> +{
>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>> +	struct device *dev = pci->dev;
>> +
>> +	dev_dbg(dev, "PERST asserted by host. Shutting down the PCIe link\n");
>> +
>> +	/*
>> +	 * Do not try to release resources if the PERST# is
>> +	 * asserted before the link is started.
> 
> Make use of 80 columns.
> 
>> +	 */
>> +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_DISABLED) {
>> +		dev_dbg(pci->dev, "Link is already disabled\n");
>> +		return;
>> +	}
>> +
>> +	stm32_pcie_disable_link(pci);
>> +
>> +	stm32_pcie_disable_resources(stm32_pcie);
>> +
>> +	pm_runtime_put_sync(dev);
>> +
>> +	stm32_pcie->link_status = STM32_PCIE_EP_LINK_DISABLED;
>> +}
>> +
>> +static void stm32_pcie_perst_deassert(struct dw_pcie *pci)
>> +{
>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>> +	struct device *dev = pci->dev;
>> +	struct dw_pcie_ep *ep = &pci->ep;
>> +	int ret;
>> +
>> +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_ENABLED) {
>> +		dev_dbg(pci->dev, "Link is already enabled\n");
>> +		return;
>> +	}
>> +
>> +	dev_dbg(dev, "PERST de-asserted by host. Starting link training\n");
>> +
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret < 0) {
>> +		dev_err(dev, "pm runtime resume failed: %d\n", ret);
>> +		return;
>> +	}
>> +
>> +	ret = stm32_pcie_enable_resources(stm32_pcie);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable resources: %d\n", ret);
>> +		goto err_pm_put_sync;
>> +	}
>> +
>> +	ret = dw_pcie_ep_init_registers(ep);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to complete initialization: %d\n", ret);
>> +		goto err_disable_resources;
>> +	}
>> +
>> +	pci_epc_init_notify(ep->epc);
>> +
>> +	ret = stm32_pcie_enable_link(pci);
>> +	if (ret) {
>> +		dev_err(dev, "PCIe Cannot establish link: %d\n", ret);
>> +		goto err_deinit_notify;
>> +	}
> 
> Link is supposed to be enabled only by the start_link() callback.

OK. and then I need to remove the IRQ_NOAUTOEN for perst_irq, which make 
the link_status unnecessary and results in simplifications. thank you

> 
>> +
>> +	stm32_pcie->link_status = STM32_PCIE_EP_LINK_ENABLED;
>> +
>> +	return;
>> +
>> +err_deinit_notify:
>> +	pci_epc_deinit_notify(ep->epc);
>> +
>> +err_disable_resources:
>> +	stm32_pcie_disable_resources(stm32_pcie);
>> +
>> +err_pm_put_sync:
>> +	pm_runtime_put_sync(dev);
>> +}
>> +
>> +static irqreturn_t stm32_pcie_ep_perst_irq_thread(int irq, void *data)
>> +{
>> +	struct stm32_pcie *stm32_pcie = data;
>> +	struct dw_pcie *pci = &stm32_pcie->pci;
>> +	u32 perst;
>> +
>> +	perst = gpiod_get_value(stm32_pcie->perst_gpio);
>> +	if (perst)
>> +		stm32_pcie_perst_assert(pci);
>> +	else
>> +		stm32_pcie_perst_deassert(pci);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int stm32_add_pcie_ep(struct stm32_pcie *stm32_pcie,
>> +			     struct platform_device *pdev)
>> +{
>> +	struct dw_pcie_ep *ep = &stm32_pcie->pci.ep;
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret < 0) {
>> +		dev_err(dev, "pm runtime resume failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
>> +				 STM32MP25_PCIECR_TYPE_MASK,
>> +				 STM32MP25_PCIECR_EP);
>> +	if (ret) {
>> +		goto err_pm_put_sync;
>> +		return ret;
>> +	}
>> +
>> +	reset_control_assert(stm32_pcie->rst);
>> +	reset_control_deassert(stm32_pcie->rst);
>> +
>> +	ep->ops = &stm32_pcie_ep_ops;
>> +
>> +	ret = dw_pcie_ep_init(ep);
>> +	if (ret) {
>> +		dev_err(dev, "failed to initialize ep: %d\n", ret);
>> +		goto err_pm_put_sync;
>> +	}
>> +
>> +	ret = stm32_pcie_enable_resources(stm32_pcie);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable resources: %d\n", ret);
>> +		goto err_ep_deinit;
>> +	}
>> +
>> +	ret = dw_pcie_ep_init_registers(ep);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
>> +		goto err_disable_resources;
>> +	}
>> +
>> +	pci_epc_init_notify(ep->epc);
>> +
> 
> You are calling dw_pcie_ep_init_registers() and  pci_epc_init_notify() from 2
> places. I think the one in stm32_pcie_perst_deassert() should be dropped since
> the DBI registers are available at this point itself.

The DBI registers need to be rewritten as a results of phy_init() 
resetting the PCIe core on RCC phy_reset :
RCC phy_reset is connected to power_up_rst_n, causing the PCIe logic to 
be reset when it should not be for a warm reset.
I will document this bug in this part of the code.

Christian


> 
> - Mani
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
