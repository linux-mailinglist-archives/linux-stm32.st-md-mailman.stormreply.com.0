Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A015AB97D9
	for <lists+linux-stm32@lfdr.de>; Fri, 16 May 2025 10:41:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30716C78F7D;
	Fri, 16 May 2025 08:41:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E07DCC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 May 2025 08:41:02 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G7PoHT028005;
 Fri, 16 May 2025 10:40:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 jOVQbSyRtvHqlvBwmgwbNuyQyI33ggIazbqG1gBI7zE=; b=bV5T8TAK7sCLOU2a
 M33BxFPl4Hm54I2NCmUuqlxss0eiqlrpXONjMgoIpqqFYl9vfMqMaiq6qtGd/vzM
 uclxTteUpXmPMHaztuyyZt/g08HdkcZUJPPBwTdFYlt5yfQGh+0uYeu3FnQ33LBc
 PpNV8gAuTu8Dq64zPc3NeGa1igIHNyp6GqRpfsP5ssE9mGe1nYwF2B1gkREIqFDl
 2mG5Qw8Pwm2iwD0FUjuypOyhDZw3ezcK1msu1YhxZESXebfmFJ/vFuBxFHRlX906
 c6aKPkBTAjFxL7spZ2AmChDAqzVt0NRJnZbJOz5QkJpvZL2+5s+6qCWpAdbLbZ0E
 bvA56A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbdy4g62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 May 2025 10:40:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1FCE04002D;
 Fri, 16 May 2025 10:38:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E7B0B34A7F;
 Fri, 16 May 2025 10:37:18 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 10:37:17 +0200
Message-ID: <7df0c1e5-f53b-4a44-920a-c2dfe8842481@foss.st.com>
Date: Fri, 16 May 2025 10:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20250423090119.4003700-1-christian.bruel@foss.st.com>
 <20250423090119.4003700-3-christian.bruel@foss.st.com>
 <gzw3rcuwuu7yswljzde2zszqlzkfsilozdfv2ebrcxjpvngpkk@hvzqb5wbjalb>
 <c01d0d72-e43c-4e10-b298-c8ed4f5d1942@foss.st.com>
 <ec33uuugief45swij7eu3mbx7htfxov6qa5miucqsrdp36z7qe@svpbhliveks4>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <ec33uuugief45swij7eu3mbx7htfxov6qa5miucqsrdp36z7qe@svpbhliveks4>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_03,2025-05-15_01,2025-03-28_01
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



On 5/15/25 13:29, Manivannan Sadhasivam wrote:
> On Mon, May 12, 2025 at 05:08:13PM +0200, Christian Bruel wrote:
>> Hi Manivannan,
>>
>> On 4/30/25 09:30, Manivannan Sadhasivam wrote:
>>> On Wed, Apr 23, 2025 at 11:01:12AM +0200, Christian Bruel wrote:
>>>> Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
>>>> controller based on the DesignWare PCIe core.
>>>>
>>>> Supports MSI via GICv2m, Single Virtual Channel, Single Function
>>>>
>>>> Supports WAKE# GPIO.
>>>>
>>>
>>> Mostly looks good. Just a couple of comments below.
>>>
>>>> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
>>>> ---
>>>>    drivers/pci/controller/dwc/Kconfig      |  12 +
>>>>    drivers/pci/controller/dwc/Makefile     |   1 +
>>>>    drivers/pci/controller/dwc/pcie-stm32.c | 368 ++++++++++++++++++++++++
>>>>    drivers/pci/controller/dwc/pcie-stm32.h |  15 +
>>>>    4 files changed, 396 insertions(+)
>>>>    create mode 100644 drivers/pci/controller/dwc/pcie-stm32.c
>>>>    create mode 100644 drivers/pci/controller/dwc/pcie-stm32.h
>>>>
>>>
>>> [...]
>>>
>>>> +static int stm32_pcie_probe(struct platform_device *pdev)
>>>> +{
>>>> +	struct stm32_pcie *stm32_pcie;
>>>> +	struct device *dev = &pdev->dev;
>>>> +	int ret;
>>>> +
>>>> +	stm32_pcie = devm_kzalloc(dev, sizeof(*stm32_pcie), GFP_KERNEL);
>>>> +	if (!stm32_pcie)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	stm32_pcie->pci.dev = dev;
>>>> +	stm32_pcie->pci.ops = &dw_pcie_ops;
>>>> +	stm32_pcie->pci.pp.ops = &stm32_pcie_host_ops;
>>>> +
>>>> +	stm32_pcie->regmap = syscon_regmap_lookup_by_compatible("st,stm32mp25-syscfg");
>>>> +	if (IS_ERR(stm32_pcie->regmap))
>>>> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->regmap),
>>>> +				     "No syscfg specified\n");
>>>> +
>>>> +	stm32_pcie->clk = devm_clk_get(dev, NULL);
>>>> +	if (IS_ERR(stm32_pcie->clk))
>>>> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->clk),
>>>> +				     "Failed to get PCIe clock source\n");
>>>> +
>>>> +	stm32_pcie->rst = devm_reset_control_get_exclusive(dev, NULL);
>>>> +	if (IS_ERR(stm32_pcie->rst))
>>>> +		return dev_err_probe(dev, PTR_ERR(stm32_pcie->rst),
>>>> +				     "Failed to get PCIe reset\n");
>>>> +
>>>> +	ret = stm32_pcie_parse_port(stm32_pcie);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	platform_set_drvdata(pdev, stm32_pcie);
>>>> +
>>>> +	ret = pm_runtime_set_active(dev);
>>>> +	if (ret < 0) {
>>>> +		dev_err(dev, "Failed to activate runtime PM %d\n", ret);
>>>
>>> Please use dev_err_probe() here and below.
>>
>> OK, will report this in the EP driver also.
>>
>>>
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = devm_pm_runtime_enable(dev);
>>>> +	if (ret < 0) {
>>>> +		dev_err(dev, "Failed to enable runtime PM %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	pm_runtime_get_noresume(dev);
>>>> +
>>>
>>> I know that a lot of the controller drivers do this for no obvious reason. But
>>> in this case, I believe you want to enable power domain or genpd before
>>> registering the host bridge. Is that right?
>>
>> We call pm_runtime_enable() before stm32_add_pcie_port() and
>> dw_pcie_host_init(). This ensures that PCIe is active during the PERST#
>> sequence and before accessing the DWC registers.
>>
> 
> What do you mean by 'PCIe is active'? Who is activating it other than this
> driver?

"PCIe is active" in the sense of pm_runtime_active() and PM runtime_enabled.

A better call point would be just before dw_host_init(), after the PCIe 
controller is reset :

stm32_add_pcie_port()
clk_prepare_enable()
devm_pm_runtime_enable()
dw_pcie_host_init()

with this sequence, the stm32_pcie_suspend_noirq() is well balanced. 
does that sound better ?

> 
>>> And the fact that you are not
>>> decrementing the runtime usage count means, you want to keep it ON all the time?
>>> Beware that your system suspend/resume calls would never get executed.
>>
>> We do not support PM runtime autosuspend, so we must notify PM runtime that
>> PCIe is always active. Without invoking pm_runtime_get_noresume(), PCIe
>> would mistakenly be marked as suspended.
> 
> This cannot happen unless the child devices are also suspended? Or if there are
> no child devices connected.

If no device is connected or if one is active, without 
pm_runtime_get_noresume(), pm_genpd_summary says "PCIe suspended" 
despite being clocked and having accessible configuration space

thank you,

Christian

> 
> - Mani
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
