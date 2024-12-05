Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 016509E5494
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 12:51:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2E53C7129D;
	Thu,  5 Dec 2024 11:51:33 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4327C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 11:51:26 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5ANMBj026590;
 Thu, 5 Dec 2024 12:50:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 DwOpMaW2es02J1yfBmzoVz6Jv19EkUC2xX3SDPzEuqM=; b=Joc3kW/FpGpozv/F
 49MXK1F3AUIaGDlU0HmQlEy2tYgzNNZdBeXQwaWuNtio/g6MPlb4ftsBGiwKbi8E
 6FL8hx/WN1hSMIBcxw3kOfykVoKfFxh/z9PAHBqKD+qqyA4uYJLW9md83bGqqOlm
 +cqsp8LW61JlT6RSyF/jNRr0cQoh+9TiCv0NYStWxoUYOF5KQOT27dJk8xXfSMHu
 gZnujWyBv9FKpQc8K9QeS4IwlJN7Ctxvb1torK6Y7SesS3Uqox0dODmK4ngz7xuH
 MSsNpC4o4X6lUb4XAD+oxtUGuMDRWhsrjG3aBrUfFK9VUM/51UsdKak7Mw7OyV14
 jtDQsg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 438ehp4gjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Dec 2024 12:50:57 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 907B640044;
 Thu,  5 Dec 2024 12:49:26 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 454DE29BB01;
 Thu,  5 Dec 2024 12:46:38 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 5 Dec
 2024 12:46:37 +0100
Message-ID: <9340979e-8f0e-465b-a524-4ff315a9941d@foss.st.com>
Date: Thu, 5 Dec 2024 12:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
To: Lucas Stach <l.stach@pengutronix.de>, Bjorn Helgaas <helgaas@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>
References: <20241129205822.GA2772018@bhelgaas>
 <9ca967aea19d6c28327f3a9bb77e23f6245603e9.camel@pengutronix.de>
Content-Language: en-US
In-Reply-To: <9ca967aea19d6c28327f3a9bb77e23f6245603e9.camel@pengutronix.de>
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 cassel@kernel.org, devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, manivannan.sadhasivam@linaro.org,
 bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/5] PCI: stm32: Add PCIe host support
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

Hello Bjorn and Lucas,

On 11/29/24 22:18, Lucas Stach wrote:
> Am Freitag, dem 29.11.2024 um 14:58 -0600 schrieb Bjorn Helgaas:
>> [+to Rob, DMA mask question]
>>
>> On Tue, Nov 26, 2024 at 04:51:16PM +0100, Christian Bruel wrote:
>>> Add driver for the STM32MP25 SoC PCIe Gen2 controller based on the
>>> DesignWare PCIe core.
>>
>> Can you include the numeric rate, not just "gen2", so we don't have to
>> search for it?
>>
>>> +static int stm32_pcie_resume_noirq(struct device *dev)
>>> +{
>>> +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
>>> +	struct dw_pcie *pci = stm32_pcie->pci;
>>> +	struct dw_pcie_rp *pp = &pci->pp;
>>> +	int ret;
>>> +
>>> +	/* init_state must be called first to force clk_req# gpio when no
>>> +	 * device is plugged.
>>> +	 */
>>
>> Use drivers/pci/ conventional comment style:
>>
>>    /*
>>     * text ...
>>     */
>>
>>> +static bool is_stm32_pcie_driver(struct device *dev)
>>> +{
>>> +	/* PCI bridge */
>>> +	dev = get_device(dev);
>>> +
>>> +	/* Platform driver */
>>> +	dev = get_device(dev->parent);
>>> +
>>> +	return (dev->driver == &stm32_pcie_driver.driver);
>>> +}
>>> +
>>> +/*
>>> + * DMA masters can only access the first 4GB of memory space,
>>> + * so we setup the bus DMA limit accordingly.
>>> + */
>>> +static int stm32_dma_limit(struct pci_dev *pdev, void *data)
>>> +{
>>> +	dev_dbg(&pdev->dev, "disabling DMA DAC for device");
>>> +
>>> +	pdev->dev.bus_dma_limit = DMA_BIT_MASK(32);
>>
>> I don't think this is the right way to do this.  Surely there's a way
>> to describe the DMA capability of the bridge once instead of iterating
>> over all the downstream devices?  This quirk can't work for hot-added
>> devices anyway.
>>

agree,

> This should simply be a dma-ranges property in the PCIe host controller
> DT node, which should describe the DMA address range limits for
> transactions passing through the host.

far better indeed, dma-ranges works like a charm

thanks,

> 
> Regards,
> Lucas
> 
>>> +	return 0;
>>> +}
>>> +
>>> +static void quirk_stm32_dma_mask(struct pci_dev *pci)
>>> +{
>>> +	struct pci_dev *root_port;
>>> +
>>> +	root_port = pcie_find_root_port(pci);
>>> +
>>> +	if (root_port && is_stm32_pcie_driver(root_port->dev.parent))
>>> +		pci_walk_bus(pci->bus, stm32_dma_limit, NULL);
>>> +}
>>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SYNOPSYS, 0x0550, quirk_stm32_dma_mask);
>>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
