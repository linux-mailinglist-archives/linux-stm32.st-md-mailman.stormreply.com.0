Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F052F9F4800
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 10:51:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 977D9C78011;
	Tue, 17 Dec 2024 09:51:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C089C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 09:51:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH88B5q032037;
 Tue, 17 Dec 2024 10:51:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 oUC8C14nmQz9b0qpzY68JcxUFhr9uFuo+BsqJHz+Y0A=; b=2dlRNTOIZQmNVA3D
 37LZPO4YILCvvRaKRsS450lvas7bZUDWMzfnNwDgFDwMQh/LnStZDLrPLR2bR5oX
 tMcOojYwHlbjTeIIiIACkQAvjCEXTGFejvCw8QZvbxOlrLbN5c1mrt1kZ2UsINd6
 n5xwiM0PkZu/YPNOKwKPJxECH9l2U/ZDim5fA+AAtAAGNW+qWvJ0EvKf2t+mbDk1
 LKmOm87sfwRLqrKvCFR/H0nEGTxkE68rcG9FpWX059K4schTdZFEFDKs68wjvGp3
 mN4n3Y5hOq8tRu4SNTyPBqfLeWAob7ovSDEww+a4Wo9iPgnfxcu+7orYTXETHmj6
 WR+XMw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43k5h9gg7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Dec 2024 10:51:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6769C4004A;
 Tue, 17 Dec 2024 10:49:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BBB7425E64B;
 Tue, 17 Dec 2024 10:48:45 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 17 Dec
 2024 10:48:44 +0100
Message-ID: <fdc487c4-cbdc-45ac-a79f-aff2b8ccafcc@foss.st.com>
Date: Tue, 17 Dec 2024 10:48:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-5-christian.bruel@foss.st.com>
 <20241203152230.5mdrt27u5u5ecwcz@thinkpad>
 <4e257489-4d90-4e47-a4d9-a2444627c356@foss.st.com>
 <20241216161700.dtldi7fari6kafrr@thinkpad>
Content-Language: en-US
In-Reply-To: <20241216161700.dtldi7fari6kafrr@thinkpad>
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
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



On 12/16/24 17:17, Manivannan Sadhasivam wrote:
> On Mon, Dec 16, 2024 at 11:02:07AM +0100, Christian Bruel wrote:
>> Hi Manivanna,
>>
>> On 12/3/24 16:22, Manivannan Sadhasivam wrote:
>>> On Tue, Nov 26, 2024 at 04:51:18PM +0100, Christian Bruel wrote:
>>>
>>> [...]
>>>
>>>> +static int stm32_pcie_start_link(struct dw_pcie *pci)
>>>> +{
>>>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>>>> +	int ret;
>>>> +
>>>> +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_ENABLED) {
>>>> +		dev_dbg(pci->dev, "Link is already enabled\n");
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	ret = stm32_pcie_enable_link(pci);
>>>> +	if (ret) {
>>>> +		dev_err(pci->dev, "PCIe cannot establish link: %d\n", ret);
>>>> +		return ret;
>>>> +	}
>>>
>>> How the REFCLK is supplied to the endpoint? From host or generated locally?
>>
>>  From Host only, we don't support the separated clock model.
>>
> 
> OK. So even without refclk you are still able to access the controller
> registers? So the controller CSRs should be accessible by separate local clock I
> believe.
> 
> Anyhow, please add this limitation (refclk dependency from host) in commit
> message.
> 
> [...]
> 
>>>> +	ret = phy_set_mode(stm32_pcie->phy, PHY_MODE_PCIE);
>>>
>>> Hmm, so PHY mode is common for both endpoint and host?
>>
>> Yes it is. We need to init the phy here because it is a clock source for the
>> PCIe core clk
>>
> 
> Clock source? Is it coming directly to PCIe or through RCC? There is no direct
> clock representation from PHY to PCIe in DT binding.

The core_clk is generated directly by the PLL in the COMBOPHY, gated by 
the RCC

> 
> - Mani
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
