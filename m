Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAD5AB9BA8
	for <lists+linux-stm32@lfdr.de>; Fri, 16 May 2025 14:10:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 726D2C7A840;
	Fri, 16 May 2025 12:10:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12FADC7A83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 May 2025 12:10:48 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GASX3V020923;
 Fri, 16 May 2025 14:10:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 AUqkuqqNfwv9TzLB2auox1AYvgBbMC8kgRWp43OMpKQ=; b=hsvr53u5RVEmNowt
 Rj+biihArb/195vChHxDvhEpOBIoMMTXCtF01uaVBzpqgo1hCNVhe1I8d1chqsa2
 O3HelKcdTOZyGYRROcVj4hhXHZKLFMDfIkMdT3+DDfVM5JIXDO27Xtgm7xF5nGEG
 CKNCX5FhT4OeSalAHEPKYUHhDoPKSmNd9W1Yow/Pthc2IAberfC4/wp+szFsd0Bz
 Ce/B10EC8mQvsZR2i2eUnN7UINS10/WlUfygaKCSJi3KFcCY94umVA+1LDBl955y
 VAV9uIQAvm8bsaF0k349u6llinJJL0U9CAe94lBgsdHN5hu/TDE25PXM5bnxw2pQ
 a+iqSg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46mbdrp3m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 May 2025 14:10:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A064840046;
 Fri, 16 May 2025 14:08:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 58425B6B7AB;
 Fri, 16 May 2025 14:07:24 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 14:07:23 +0200
Message-ID: <b3bff3aa-cd99-4c9e-851a-950a4877e664@foss.st.com>
Date: Fri, 16 May 2025 14:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20250423090119.4003700-1-christian.bruel@foss.st.com>
 <20250423090119.4003700-5-christian.bruel@foss.st.com>
 <tdgyva6qyn6qwzvft4f7r3tgp5qswuv4q5swoaeomnnbxtmz5j@zo3gvevx2skp>
 <619756c5-1a61-4aa9-b7fb-6be65175ded2@foss.st.com>
 <b5x4fayqm242xqm3rgwvrz3jywlixedhhxwo7lft2y3tnuszxr@3oy2kzj2of5l>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <b5x4fayqm242xqm3rgwvrz3jywlixedhhxwo7lft2y3tnuszxr@3oy2kzj2of5l>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_02,2025-03-28_01
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, thippeswamy.havalige@amd.com,
 linux-kernel@vger.kernel.org, cassel@kernel.org, devicetree@vger.kernel.org,
 quic_schintav@quicinc.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, bhelgaas@google.com, krzk+dt@kernel.org,
 shradha.t@samsung.com, linux-stm32@st-md-mailman.stormreply.com,
 johan+linaro@kernel.org
Subject: Re: [Linux-stm32] [PATCH v8 4/9] PCI: stm32: Add PCIe Endpoint
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

(Sorry I missed the last point before my reply with a new v9/v10 series)

On 5/15/25 13:26, Manivannan Sadhasivam wrote:
> On Mon, May 12, 2025 at 06:06:16PM +0200, Christian Bruel wrote:
>> Hello Manivannan,
>>
>> On 4/30/25 09:50, Manivannan Sadhasivam wrote:
>>> On Wed, Apr 23, 2025 at 11:01:14AM +0200, Christian Bruel wrote:
>>>> Add driver to configure the STM32MP25 SoC PCIe Gen1 2.5GT/s or Gen2 5GT/s
>>>> controller based on the DesignWare PCIe core in endpoint mode.
>>>>
>>>> Uses the common reference clock provided by the host.
>>>>
>>>> The PCIe core_clk receives the pipe0_clk from the ComboPHY as input,
>>>> and the ComboPHY PLL must be locked for pipe0_clk to be ready.
>>>> Consequently, PCIe core registers cannot be accessed until the ComboPHY is
>>>> fully initialised and refclk is enabled and ready.
>>>>
>>>> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
>>>> ---
>>>>    drivers/pci/controller/dwc/Kconfig         |  12 +
>>>>    drivers/pci/controller/dwc/Makefile        |   1 +
>>>>    drivers/pci/controller/dwc/pcie-stm32-ep.c | 414 +++++++++++++++++++++
>>>>    drivers/pci/controller/dwc/pcie-stm32.h    |   1 +
>>>>    4 files changed, 428 insertions(+)
>>>>    create mode 100644 drivers/pci/controller/dwc/pcie-stm32-ep.c
>>>>
>>>> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
>>>> index 2aec5d2f9a46..aceff7d1ef33 100644
>>>> --- a/drivers/pci/controller/dwc/Kconfig
>>>> +++ b/drivers/pci/controller/dwc/Kconfig
>>>> @@ -422,6 +422,18 @@ config PCIE_STM32_HOST
>>>>    	  This driver can also be built as a module. If so, the module
>>>>    	  will be called pcie-stm32.
>>>> +config PCIE_STM32_EP
>>>> +	tristate "STMicroelectronics STM32MP25 PCIe Controller (endpoint mode)"
>>>> +	depends on ARCH_STM32 || COMPILE_TEST
>>>> +	depends on PCI_ENDPOINT
>>>> +	select PCIE_DW_EP
>>>> +	help
>>>> +	  Enables endpoint support for DesignWare core based PCIe controller
>>>> +	  found in STM32MP25 SoC.
>>>
>>> Can you please use similar description for the RC driver also?
>>>
>>> "Enables Root Complex (RC) support for the DesignWare core based PCIe host
>>> controller found in STM32MP25 SoC."
>>
>> Yes, will align the messages
>>
>>>> +
>>>> +	  This driver can also be built as a module. If so, the module
>>>> +	  will be called pcie-stm32-ep.
>>>> +
>>>>    config PCI_DRA7XX
>>>>    	tristate
>>>
>>> [...]
>>>
>>>> +static int stm32_add_pcie_ep(struct stm32_pcie *stm32_pcie,
>>>> +			     struct platform_device *pdev)
>>>> +{
>>>> +	struct dw_pcie_ep *ep = &stm32_pcie->pci.ep;
>>>> +	struct device *dev = &pdev->dev;
>>>> +	int ret;
>>>> +
>>>> +	ret = pm_runtime_resume_and_get(dev);
>>>
>>> This needs to be called before devm_pm_runtime_enable().
>>
>> OK. Also and we must use pm_runtime_get_noresume() here.
>>
> 
> Yes!
> 
>>>
>>>> +	if (ret < 0) {
>>>> +		dev_err(dev, "pm runtime resume failed: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	ret = regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
>>>> +				 STM32MP25_PCIECR_TYPE_MASK,
>>>> +				 STM32MP25_PCIECR_EP);
>>>> +	if (ret) {
>>>> +		goto err_pm_put_sync;
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	reset_control_assert(stm32_pcie->rst);
>>>> +	reset_control_deassert(stm32_pcie->rst);
>>>> +
>>>> +	ep->ops = &stm32_pcie_ep_ops;
>>>> +
>>>> +	ret = dw_pcie_ep_init(ep);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to initialize ep: %d\n", ret);
>>>> +		goto err_pm_put_sync;
>>>> +	}
>>>> +
>>>> +	ret = stm32_pcie_enable_resources(stm32_pcie);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "failed to enable resources: %d\n", ret);
>>>> +		goto err_ep_deinit;
>>>> +	}
>>>> +
>>>> +	ret = dw_pcie_ep_init_registers(ep);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
>>>> +		goto err_disable_resources;
>>>> +	}
>>>> +
>>>> +	pci_epc_init_notify(ep->epc);
>>>> +
>>>
>>> Hmm, looks like you need to duplicate dw_pcie_ep_init_registers() and
>>> pci_epc_init_notify() in stm32_pcie_perst_deassert() for hw specific reasons.
>>> So can you drop these from there?
>>
>> We cannot remove dw_pcie_ep_init_registers() and dw_pcie_ep_init_registers()
>> here because the PCIe registers need to be ready at the end of
>> pcie_stm32_probe, as the host might already be running. In that case the
>> host enumerates with /sys/bus/pci/rescan rather than asserting/deasserting
>> PERST#.
>> Therefore, we do not need to reboot the host after initializing the EP."
>>
> 
> Since PERST# is level triggered, the endpoint should still receive the PERST#
> deassert interrupt if the host was already booted. In that case, these will be
> called by the stm32_pcie_perst_deassert() function.

GPIO level interrupts are simulated on STM32 (*), so I didn't consider 
using them here
However, using the same sequence as in pcie-qcom-ep.c works fine with 
the gpio hack, avoiding the call the dw_pcie_ep_init_registers() here.

I will switch to this scheme. Thank you

Christian

(*) 47beed513a85b3561e74cbb4dd7af848716fa4e0 ("pinctrl: stm32: Add level 
interrupt support to gpio irq chip")


> 
> - Mani
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
