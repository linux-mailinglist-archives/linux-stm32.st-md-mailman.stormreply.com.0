Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D36A09450
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 15:53:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10D05C78F6F;
	Fri, 10 Jan 2025 14:53:03 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E741C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 14:53:01 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ABpGCR019273;
 Fri, 10 Jan 2025 15:51:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 7Qc8B9n8Wk0ETebdx29AGZE+bnYd24Q0I0YVr1DZ2f0=; b=qGesxML4Mz6fX7wF
 GEzxs2lDns+ZtEKh+nByR5NtjNc78e35EGatN7/MaD6LQcwyZPw6s94uUTQsGLbP
 pCfTZGu6AuaSY3bYm7g5rOVIXmdMK+sctCkDjm4q/LgoYHAZADhFMPegvHnqkbP2
 ld3V+KO0gxHMm9XCMDlFmWM1ec/Pu3JwLrWK51wIUovyeZOzTt2JU/n2yzeezO1U
 jp1w35ELvKmPfJxrHCSYbp2k+L0yeF15E90eOh53PaBsgROP4rnAf6YfEPy3ft3I
 Yytr5vGRxFRR9o2AH4YAu74OuNH25z19redaPRy0Q4W/WFu2kaMDfK6iQMOG1N+r
 0AQZ3A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44331t8pn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2025 15:51:43 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6672D4004F;
 Fri, 10 Jan 2025 15:50:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ECCF12BC88C;
 Fri, 10 Jan 2025 15:49:19 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 10 Jan
 2025 15:49:18 +0100
Message-ID: <181e2e45-9d00-414e-a0cb-60f61afa488f@foss.st.com>
Date: Fri, 10 Jan 2025 15:49:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-5-christian.bruel@foss.st.com>
 <20241203152230.5mdrt27u5u5ecwcz@thinkpad>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20241203152230.5mdrt27u5u5ecwcz@thinkpad>
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 cassel@kernel.org, devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/5] PCI: stm32: Add PCIe endpoint
 support for STM32MP25
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

Hi Mani,

On 12/3/24 16:22, Manivannan Sadhasivam wrote:
> On Tue, Nov 26, 2024 at 04:51:18PM +0100, Christian Bruel wrote:
> 
> [...]
> 
>> +static int stm32_pcie_start_link(struct dw_pcie *pci)
>> +{
>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
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
> 
> How the REFCLK is supplied to the endpoint? From host or generated locally?

The REFCLK is supplied from the host, it does not support separated clocks
> 
>> +
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
>> +	.align = 1 << 16,
> 
> Use SZ_64K
> 
>> +};
>> +
> 
> [...]
> 
>> +static int stm32_add_pcie_ep(struct stm32_pcie *stm32_pcie,
>> +			     struct platform_device *pdev)
>> +{
>> +	struct dw_pcie *pci = stm32_pcie->pci;
>> +	struct dw_pcie_ep *ep = &pci->ep;
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	ret = regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
>> +				 STM32MP25_PCIECR_TYPE_MASK,
>> +				 STM32MP25_PCIECR_EP);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret < 0) {
>> +		dev_err(dev, "pm runtime resume failed: %d\n", ret);
>> +		return ret;
>> +	}
> 
> You might want to do runtime resume before accessing regmap.

ok

> 
>> +
>> +	reset_control_assert(stm32_pcie->rst);
>> +	reset_control_deassert(stm32_pcie->rst);
>> +
>> +	ep->ops = &stm32_pcie_ep_ops;
>> +
>> +	ret = dw_pcie_ep_init(ep);
>> +	if (ret) {
>> +		dev_err(dev, "failed to initialize ep: %d\n", ret);
>> +		goto err_init;
>> +	}
>> +
>> +	ret = stm32_pcie_enable_resources(stm32_pcie);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable resources: %d\n", ret);
>> +		goto err_clk;
>> +	}
>> +
>> +	ret = dw_pcie_ep_init_registers(ep);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
>> +		goto err_init_regs;
>> +	}
>> +
>> +	pci_epc_init_notify(ep->epc);
>> +
>> +	return 0;
>> +
>> +err_init_regs:
>> +	stm32_pcie_disable_resources(stm32_pcie);
>> +
>> +err_clk:
>> +	dw_pcie_ep_deinit(ep);
>> +
>> +err_init:
>> +	pm_runtime_put_sync(dev);
>> +	return ret;
>> +}
>> +
>> +static int stm32_pcie_probe(struct platform_device *pdev)
>> +{
>> +	struct stm32_pcie *stm32_pcie;
>> +	struct dw_pcie *dw;
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	stm32_pcie = devm_kzalloc(dev, sizeof(*stm32_pcie), GFP_KERNEL);
>> +	if (!stm32_pcie)
>> +		return -ENOMEM;
>> +
>> +	dw = devm_kzalloc(dev, sizeof(*dw), GFP_KERNEL);
>> +	if (!dw)
>> +		return -ENOMEM;
> 
> Why can't you allocate it statically inside 'struct stm32_pcie'?
> 

will do, as for the rc

>> +
>> +	stm32_pcie->pci = dw;
>> +
>> +	dw->dev = dev;
>> +	dw->ops = &dw_pcie_ops;
>> +
>> +	stm32_pcie->regmap = syscon_regmap_lookup_by_compatible("st,stm32mp25-syscfg");
>> +	if (IS_ERR(stm32_pcie->regmap))
>> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->regmap),
>> +				     "No syscfg specified\n");
>> +
>> +	stm32_pcie->phy = devm_phy_get(dev, "pcie-phy");
>> +	if (IS_ERR(stm32_pcie->phy))
>> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->phy),
>> +				     "failed to get pcie-phy\n");
>> +
>> +	stm32_pcie->clk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(stm32_pcie->clk))
>> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->clk),
>> +				     "Failed to get PCIe clock source\n");
>> +
>> +	stm32_pcie->rst = devm_reset_control_get_exclusive(dev, NULL);
>> +	if (IS_ERR(stm32_pcie->rst))
>> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->rst),
>> +				     "Failed to get PCIe reset\n");
>> +
>> +	stm32_pcie->perst_gpio = devm_gpiod_get(dev, "reset", GPIOD_IN);
>> between PCIE and USB3+	if (IS_ERR(stm32_pcie->perst_gpio))
>> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->perst_gpio),
>> +				     "Failed to get reset GPIO\n");
>> +
>> +	ret = phy_set_mode(stm32_pcie->phy, PHY_MODE_PCIE);
> 
> Hmm, so PHY mode is common for both endpoint and host?

the COMBOPHY MODESEL sysconf takes PCIE or USB3 as value
> 
> - Mani
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
