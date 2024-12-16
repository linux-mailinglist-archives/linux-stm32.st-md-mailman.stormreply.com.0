Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA59F3235
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2024 15:05:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2077EC7129D;
	Mon, 16 Dec 2024 14:05:37 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55618C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2024 14:05:29 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGBSXHC019814;
 Mon, 16 Dec 2024 15:03:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zg4ilhS7TTTXcjH+uIPD/koI66ea2Qpvy0x9hiKQl8Y=; b=lKQXyxcP27EDP2SN
 0Op6pw5jUuTudTT1tjc1Ox1RMd+Bs1nVCHNRFoAibKwrCoxzwXiAvMDKo8RG5zTW
 gSVmLkgZDsS8TwhTT3AXTQD9LVhpZTcwFSmeWlhCqTkTpvF5/omg4n7PSl0WLVPe
 uUVKQBCyxdf46N8npdM9WTXr/rJbFp8SDLwl71zoU/NeJJW1ZG0BU0MK6Ul+NNuq
 KgbNQoimNYQZuRLQbp8Zwv1gzQ8/BSRqrwKBh6x83P0scZoumiYKAus+IJsq8SGq
 KO//wHf0gnLp2zoJdrnuuh4jwZYN5EkuMZjBdnNI42j5M+BgaPbGtwtNlsOomhc1
 F9Ydbg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43jeeyj1h0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2024 15:03:33 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F2E9840044;
 Mon, 16 Dec 2024 15:02:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 66AB926E55B;
 Mon, 16 Dec 2024 15:01:00 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 16 Dec
 2024 15:00:59 +0100
Message-ID: <ef02ddbf-0838-4616-a3c5-ef7ab55de3c9@foss.st.com>
Date: Mon, 16 Dec 2024 15:00:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20241205172738.GA3054352@bhelgaas>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20241205172738.GA3054352@bhelgaas>
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
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



On 12/5/24 18:27, Bjorn Helgaas wrote:
> On Tue, Nov 26, 2024 at 04:51:18PM +0100, Christian Bruel wrote:
>> Add driver to configure the STM32MP25 SoC PCIe Gen2 controller based on the
>> DesignWare PCIe core in endpoint mode.
> 
>> +config PCIE_STM32_EP
>> +	tristate "STMicroelectronics STM32MP25 PCIe Controller (endpoint mode)"
>> +	depends on ARCH_STM32 || COMPILE_TEST
>> +	depends on PCI_ENDPOINT
>> +	select PCIE_DW_EP
>> +	help
>> +	  Enables endpoint support for DesignWare core based PCIe controller in found
>> +	  in STM32MP25 SoC.
> 
> s/in found in/in/ (or "found in" if you prefer)
> 
> Wrap so help text fits in 80 columns when for "make menuconfig".
> 
>> +static void stm32_pcie_ep_init(struct dw_pcie_ep *ep)
>> +{
>> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>> +	enum pci_barno bar;
>> +
>> +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++)
>> +		dw_pcie_ep_reset_bar(pci, bar);
>> +
>> +	/* Defer Completion Requests until link started */
> 
> I asked about this before [1] but didn't finish the conversation.  My
> main point is that I think "Completion Request" is a misnomer.
> There's a "Configuration Request" and a "Completion," but no such
> thing as a "Completion Request."
> 
> Based on your previous response, I think this should say something
> like "respond to config requests with Request Retry Status (RRS) until
> we're prepared to handle them."

OK thanks for the phrasing. This is inline with the DWC doc:
"... controller completes incoming configuration requests with a
configuration request retry status."
The only thing is that the PCIe specs talks about CRS, not RRS.

so slightly change to
"respond to config requests with Configuration Request Retry Status 
(CRS) until we're prepared to handle them."


> 
>> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
>> +			   STM32MP25_PCIECR_REQ_RETRY_EN,
>> +			   STM32MP25_PCIECR_REQ_RETRY_EN);
>> +}
>> +
>> +static int stm32_pcie_enable_link(struct dw_pcie *pci)
>> +{
>> +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
>> +	int ret;
>> +
>> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
>> +			   STM32MP25_PCIECR_LTSSM_EN,
>> +			   STM32MP25_PCIECR_LTSSM_EN);
>> +
>> +	ret = dw_pcie_wait_for_link(pci);
>> +	if (ret)
>> +		return ret;
>> +
>> +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
>> +			   STM32MP25_PCIECR_REQ_RETRY_EN,
>> +			   0);
> 
> And I assume this means the endpoint will accept config requests and
> handle them normally instead of responding with RRS.
> 
> Strictly speaking this is a different condition than "the link is up"
> because the link must be up in order to even receive a config request.
> The purpose of RRS is for devices that need more initialization time
> after the link is up before they can respond to config requests.
> 
> The fact that the hardware provides this bit makes me think the
> designer anticipated that the link might come up before the rest of
> the device is fully initialized.

Agree, this there are 2 conditions in this function: link is up + 
accepting config requests. I'll split or rename

Thanks
Christian
> 
> Bjorn
> 
> [1] https://lore.kernel.org/r/20241112203846.GA1856246@bhelgaas
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
