Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9649B3AA48
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 20:50:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 453BAC3F95F;
	Thu, 28 Aug 2025 18:50:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB301C3F95E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 18:50:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SGK1Q6000314;
 Thu, 28 Aug 2025 20:49:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 QngEIke0AHC8FxDBE5xQKqvSi6Ne/Qs63SuZOpgs9rU=; b=7PhGVjWors7Len+8
 8boKa4Mku8xTRTVBQIwPckTq5qP62dkbDckuIoWUjJwRBQVkDO/NCvZ/Xd0f0lAc
 qlMzdA0j+8xixjOEBDzfNE/bMlhcC43lIyqxbxLuD0mDYI/P53pBKDim9k2ond7K
 DDEnnnkNsHh8ul7tnHtQkcbAN98RKbHDJ2kr7mEAZfVmQZDlc/Lhzv/v5bB+XRpC
 4RVE5sqxff1+wnAQ9BtratCEwvItq0kJIPBIj1U+we+otSG3PWul6RlLRfkKN5kk
 EZ2IBrk3RwkwnBuzL7MQ2Kt7kXS5AgcdWUIsu+Xd7OBNOZQ/yFhTSOIBk3mYIzUJ
 DfW2Ag==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48q5xbwhff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Aug 2025 20:49:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D36834004B;
 Thu, 28 Aug 2025 20:48:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E170277A5A4;
 Thu, 28 Aug 2025 20:46:34 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 20:46:33 +0200
Message-ID: <3a0afc93-a7ae-467e-97ad-f1c8d7d7a693@foss.st.com>
Date: Thu, 28 Aug 2025 20:46:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20250828171622.GA945192@bhelgaas>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <20250828171622.GA945192@bhelgaas>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
Cc: linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 quic_schintav@quicinc.com, linux-stm32@st-md-mailman.stormreply.com,
 kwilczynski@kernel.org, namcao@linutronix.de, robh@kernel.org, corbet@lwn.net,
 linux-arm-kernel@lists.infradead.org, linus.walleij@linaro.org,
 mayank.rana@oss.qualcomm.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, mani@kernel.org, qiang.yu@oss.qualcomm.com,
 linux-gpio@vger.kernel.org, bhelgaas@google.com, johan+linaro@kernel.org,
 shradha.t@samsung.com, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, krzk+dt@kernel.org
Subject: Re: [Linux-stm32] [PATCH v13 06/11] PCI: stm32: Add PCIe Endpoint
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



On 8/28/25 19:16, Bjorn Helgaas wrote:
> On Thu, Aug 28, 2025 at 02:12:57PM +0200, Christian Bruel wrote:
>> On 8/27/25 20:58, Bjorn Helgaas wrote:
>>> On Wed, Aug 20, 2025 at 09:54:06AM +0200, Christian Bruel wrote:
>>>> Add driver to configure the STM32MP25 SoC PCIe Gen1 2.5GT/s or Gen2 5GT/s
>>>> controller based on the DesignWare PCIe core in endpoint mode.
>>>
>>>> +static void stm32_pcie_perst_deassert(struct dw_pcie *pci)
>>>> +{
>>>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>>>> +	struct device *dev = pci->dev;
>>>> +	struct dw_pcie_ep *ep = &pci->ep;
>>>> +	int ret;
>>>> +
>>>> +	dev_dbg(dev, "PERST de-asserted by host\n");
>>>> +
>>>> +	ret = pm_runtime_resume_and_get(dev);
>>>> +	if (ret < 0) {
>>>> +		dev_err(dev, "Failed to resume runtime PM: %d\n", ret);
>>>> +		return;
>>>> +	}
>>>> +
>>>> +	ret = stm32_pcie_enable_resources(stm32_pcie);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "Failed to enable resources: %d\n", ret);
>>>> +		goto err_pm_put_sync;
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * Need to reprogram the configuration space registers here because the
>>>> +	 * DBI registers were incorrectly reset by the PHY RCC during phy_init().
>>>
>>> Is this incorrect reset of DBI registers a software issue or some kind
>>> of hardware erratum that might be fixed someday?  Or maybe it's just a
>>> characteristic of the hardware and thus not really "incorrect"?
>>>
>>> I do see that qcom_pcie_perst_deassert() in pcie-qcom-ep.c also calls
>>> dw_pcie_ep_init_registers() in the qcom_pcie_ep_perst_irq_thread()
>>> path.
>>>
>>> So does pex_ep_event_pex_rst_deassert() (pcie-tegra194.c) in the
>>> tegra_pcie_ep_pex_rst_irq() path.
>>>
>>> But as far as I can tell, none of the other dwc drivers need this, so
>>> maybe it's something to do with the glue around the DWC core?
>>
>> The RCC PHY reset is connected to the Synopsys cold reset logic, which
>> explains why the registers need to be restored. This point has been
>> addressed in the reference manual.
> 
> OK.  I dropped "incorrectly" from the comment because I think future
> readers will wonder about whether or how this could be fixed, and it
> sounds like it's just a feature of the hardware that we need to deal
> with.

OK, thank you. "unexpectedly" would have been appropriate, but just drop 
it is even better.

> 
>>>> +	 */
>>>> +	ret = dw_pcie_ep_init_registers(ep);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "Failed to complete initialization: %d\n", ret);
>>>> +		goto err_disable_resources;
>>>> +	}
>>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
