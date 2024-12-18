Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D50849F6065
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2024 09:46:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83112C7129D;
	Wed, 18 Dec 2024 08:46:55 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 548A5C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 08:46:48 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI6mX56021743;
 Wed, 18 Dec 2024 09:45:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ALqiweMhEDRg7aBhjFXLJO/WC3zghsGkYaraS6orI60=; b=Y24pdIIdEI/lF5cd
 Q8odLdIb6M9hjNfe4WI/qOKlTOwd/vGfa4DIzCsL6GqXaChv33VVESO8Kzccd+wJ
 z9VZ4oMU5vtecnEWFCz6R0BLoxg08dzHFO/zJ7/MNraAb5wrkieZLa+yf4+lEv60
 Y0sTYUIIdzdnJdI1CI/HPXDwacohBZ1GPyjbU2TY3gHs8DVi1qnGKoFMK/K2r6vC
 A79W1tmZKm1t57SQ7zF2Q3inDgZjxaEVidYpCGZES8XERfUFh8iGNChU8P4tFBd0
 3FrMmduSLt+dAcKcPmdmL2amtBpJgmzojAucoZt9eyFYit1UVz5Erz9Tpnxnv2UK
 LOVkdQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43kfu8a20e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2024 09:45:19 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CAFD74004D;
 Wed, 18 Dec 2024 09:43:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8EC1F25581E;
 Wed, 18 Dec 2024 09:42:47 +0100 (CET)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 18 Dec
 2024 09:42:46 +0100
Message-ID: <5b835381-55bc-4fc8-b848-535f6e881420@foss.st.com>
Date: Wed, 18 Dec 2024 09:42:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20241205172022.GA3053765@bhelgaas>
 <d976d74c-80c0-4446-bb9b-960a990c552b@foss.st.com>
 <20241217172502.borj2oy4rpxcteag@thinkpad>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20241217172502.borj2oy4rpxcteag@thinkpad>
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, quic_schintav@quicinc.com, lpieralisi@kernel.org,
 linux-kernel@vger.kernel.org, cassel@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 mcoquelin.stm32@gmail.com, linux-pci@vger.kernel.org, bhelgaas@google.com,
 krzk+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/5] dt-bindings: PCI: Add STM32MP25
 PCIe root complex bindings
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



On 12/17/24 18:25, Manivannan Sadhasivam wrote:
> On Tue, Dec 17, 2024 at 04:53:48PM +0100, Christian Bruel wrote:
>>
>>> Makes sense.  What about phys, resets, etc?  I'm pretty sure a PHY
>>> would be a per-Root Port thing, and some resets and wakeup signals
>>> also.
>>>
>>> For new drivers, I think we should start adding Root Port stanzas to
>>> specifically associate those things with the Root Port, e.g.,
>>> something like this?
>>>
>>>     pcie@48400000 {
>>>       compatible = "st,stm32mp25-pcie-rc";
>>>
>>>       pcie@0,0 {
>>>         reg = <0x0000 0 0 0 0>;
>>>         phys = <&combophy PHY_TYPE_PCIE>;
>>>         phy-names = "pcie-phy";
>>>       };
>>>     };
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml?id=v6.12#n111
>>> is one binding that does this, others include apple,pcie.yaml,
>>> brcm,stb-pcie.yaml, hisilicon,kirin-pcie.yaml.
>>>
>>
>> On a second thought, moving the PHY to the root-port part would introduce a
>> discrepancy with the pcie_ep binding, whereas the PHY is required on the
>> pcie_ep node.
>>
>> Even for the pcie_rc, the PHY is needed to enable the core_clk to access
>> the PCIe core registers,
>>
> 
> But why that matters? You can still parse the child nodes, enable PHY and
> configure PCIe registers. >
>> So that would make 2 different required PHY locations for RC and EP:
>>
>>      pcie_rc: pcie@48400000 {
>>        compatible = "st,stm32mp25-pcie-rc";
>>
>>        pcie@0,0 {
>>          reg = <0x0000 0 0 0 0>;
>>          phys = <&combophy PHY_TYPE_PCIE>;
>>          phy-names = "pcie-phy";
>>        };
>>      };
>>
>>      pcie_ep pcie@48400000 {
>>        compatible = "st,stm32mp25-pcie-ep";
>>        phys = <&combophy PHY_TYPE_PCIE>;
>>        phy-names = "pcie-phy";
>>      };
>>
>> Simplest seems to keep the PHY required for the pcie core regardless of the
>> mode and keep the empty root port to split the design
>>
> 
> No please. Try to do the right thing from the start itself.

Parsing the child node to clock the IP seems weird. Note that 
hisilicon,kirin-pcie.yaml also declares the PHY at the controller level.

thanks

Christian




> 
> - Mani
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
