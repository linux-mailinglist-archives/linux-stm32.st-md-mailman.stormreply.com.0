Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD5BAB3BB2
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 17:11:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB909C7A82D;
	Mon, 12 May 2025 15:11:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD006C7A82A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 May 2025 15:11:52 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CD4kW1025877;
 Mon, 12 May 2025 17:11:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 BsohuFHL0A1uGoWvntQ5+Cuy1yzn6J9UrbSwG2edDAA=; b=rnuUverqE269o+TQ
 pLW8NzKc9m5dDDkRw+fVwCvwLK9Aw4KkSzKfPSEDSpoMdaa6/vDn9pF6CX7Kx4Y6
 BokEFE2Ycmt6iokXnRg7lvVZ7A0TTIp3A5jbKjI4g6owBUKGynNHyfJMTbseNzGa
 4YxoABtAZSUNcV1z3r2o5/Z1kjsdluS+oHSrAT5ObUIgr0vk2ipLSYEVvl+Vxewi
 BZdFVyBwBTGXEIi9+srPgDi7Wa25O/3K+SUilx250eeAP6ROgacOH3eDoxKnKGL7
 XbKOMz5tqaTVVIpZH3XaGM39OlvUQNj8EExDTEUfW5cf0qjZB2g7mOMslDCtzK80
 BbR3Hw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46hv7kqvq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 May 2025 17:11:19 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0094F40045;
 Mon, 12 May 2025 17:09:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 75DB7B20C2D;
 Mon, 12 May 2025 17:08:25 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 17:08:24 +0200
Message-ID: <c01d0d72-e43c-4e10-b298-c8ed4f5d1942@foss.st.com>
Date: Mon, 12 May 2025 17:08:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20250423090119.4003700-1-christian.bruel@foss.st.com>
 <20250423090119.4003700-3-christian.bruel@foss.st.com>
 <gzw3rcuwuu7yswljzde2zszqlzkfsilozdfv2ebrcxjpvngpkk@hvzqb5wbjalb>
Content-Language: en-US
In-Reply-To: <gzw3rcuwuu7yswljzde2zszqlzkfsilozdfv2ebrcxjpvngpkk@hvzqb5wbjalb>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, thippeswamy.havalige@amd.com,
 linux-kernel@vger.kernel.org, cassel@kernel.org, devicetree@vger.kernel.org,
 quic_schintav@quicinc.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, bhelgaas@google.com, krzk+dt@kernel.org,
 shradha.t@samsung.com, linux-stm32@st-md-mailman.stormreply.com,
 johan+linaro@kernel.org
Subject: Re: [Linux-stm32] [PATCH v8 2/9] PCI: stm32: Add PCIe host support
	for STM32MP25
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

Hi Manivannan,

On 4/30/25 09:30, Manivannan Sadhasivam wrote:
> On Wed, Apr 23, 2025 at 11:01:12AM +0200, Christian Bruel wrote:
>> Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
>> controller based on the DesignWare PCIe core.
>>
>> Supports MSI via GICv2m, Single Virtual Channel, Single Function
>>
>> Supports WAKE# GPIO.
>>
> 
> Mostly looks good. Just a couple of comments below.
> 
>> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
>> ---
>>   drivers/pci/controller/dwc/Kconfig      |  12 +
>>   drivers/pci/controller/dwc/Makefile     |   1 +
>>   drivers/pci/controller/dwc/pcie-stm32.c | 368 ++++++++++++++++++++++++
>>   drivers/pci/controller/dwc/pcie-stm32.h |  15 +
>>   4 files changed, 396 insertions(+)
>>   create mode 100644 drivers/pci/controller/dwc/pcie-stm32.c
>>   create mode 100644 drivers/pci/controller/dwc/pcie-stm32.h
>>
> 
> [...]
> 
>> +static int stm32_pcie_probe(struct platform_device *pdev)
>> +{
>> +	struct stm32_pcie *stm32_pcie;
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	stm32_pcie = devm_kzalloc(dev, sizeof(*stm32_pcie), GFP_KERNEL);
>> +	if (!stm32_pcie)
>> +		return -ENOMEM;
>> +
>> +	stm32_pcie->pci.dev = dev;
>> +	stm32_pcie->pci.ops = &dw_pcie_ops;
>> +	stm32_pcie->pci.pp.ops = &stm32_pcie_host_ops;
>> +
>> +	stm32_pcie->regmap = syscon_regmap_lookup_by_compatible("st,stm32mp25-syscfg");
>> +	if (IS_ERR(stm32_pcie->regmap))
>> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->regmap),
>> +				     "No syscfg specified\n");
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
>> +	ret = stm32_pcie_parse_port(stm32_pcie);
>> +	if (ret)
>> +		return ret;
>> +
>> +	platform_set_drvdata(pdev, stm32_pcie);
>> +
>> +	ret = pm_runtime_set_active(dev);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to activate runtime PM %d\n", ret);
> 
> Please use dev_err_probe() here and below.

OK, will report this in the EP driver also.

> 
>> +		return ret;
>> +	}
>> +
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to enable runtime PM %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	pm_runtime_get_noresume(dev);
>> +
> 
> I know that a lot of the controller drivers do this for no obvious reason. But
> in this case, I believe you want to enable power domain or genpd before
> registering the host bridge. Is that right? 

We call pm_runtime_enable() before stm32_add_pcie_port() and 
dw_pcie_host_init(). This ensures that PCIe is active during the PERST# 
sequence and before accessing the DWC registers.

 > And the fact that you are not
> decrementing the runtime usage count means, you want to keep it ON all the time?
> Beware that your system suspend/resume calls would never get executed.

We do not support PM runtime autosuspend, so we must notify PM runtime 
that PCIe is always active. Without invoking pm_runtime_get_noresume(), 
PCIe would mistakenly be marked as suspended.
The function stm32_pcie_suspend_noirq() is triggered when the system 
transitions to Stop or Standby power states, (from /sys/power/state)

> 
> Also in any case, you need to call this before devm_pm_runtime_enable().
> Otherwise, PM core will suspend the parent and enable it during
> pm_runtime_get_noresume(), which is redundant.

OK, I will invert the calls.

Thank you

Christian

> 
> - Mani
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
