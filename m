Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A84BB2A15B
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Aug 2025 14:21:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 613FFC3F93B;
	Mon, 18 Aug 2025 12:21:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B570C3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Aug 2025 12:21:00 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IBGdPu032348;
 Mon, 18 Aug 2025 14:20:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 lAMmpDtYCfkoYrqxpq6XktgA+w7f+7+MRuTH/F71Yto=; b=imPR8A/OMbS0hMQf
 3WwZBJsZBgZ7gHblZoXzYvnYc7X/T6iczc5d+LtY0DqtQ6GASKg7Ycm0Ci6buwad
 2BAf1kBb8ziVigu8YOjExHerj0oUQht0bmp7q+OkDCZ+z3UtTBKkhv5Ap8wOZPTp
 p+5XhS3AHJB76arlVmnvKb6TYg0K2zoAfD/YGbEjK9dRDBInLD4zUP9aBrgFlJtu
 82kMLF/enXswDX7n+i2gDcCNQbhorwNagtOn84ECes7jx1pkHDUxYBhcDpR9bDYL
 FywPUFxngMRZGH2ih+3tLC+oIa46mYjzSqqdELl/4Etu40VrjIpSIGThaujVu2+6
 iM2/8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48jfdk6pkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Aug 2025 14:20:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BA1D54004A;
 Mon, 18 Aug 2025 14:19:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE2BE723768;
 Mon, 18 Aug 2025 14:18:47 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Aug
 2025 14:18:47 +0200
Message-ID: <c8076e56-4b5a-466c-8702-0a7a596f987e@foss.st.com>
Date: Mon, 18 Aug 2025 14:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20250813190633.GA284987@bhelgaas>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <20250813190633.GA284987@bhelgaas>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
Cc: robh@kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, mani@kernel.org, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-gpio@vger.kernel.org, mcoquelin.stm32@gmail.com, bhelgaas@google.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 kwilczynski@kernel.org
Subject: Re: [Linux-stm32] [PATCH v1] PCI: stm32: use
 pinctrl_pm_select_init_state() in stm32_pcie_resume_noirq()
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



On 8/13/25 21:06, Bjorn Helgaas wrote:
> On Wed, Aug 13, 2025 at 01:53:19PM +0200, Christian Bruel wrote:
>> Replace direct access to dev->pins->init_state with the new helper
>> pinctrl_pm_select_init_state() to select the init pinctrl state.
>> This fixes build issues when CONFIG_PINCTRL is not defined.
>>
>> Depends-on: <20250813081139.93201-3-christian.bruel@foss.st.com>
>> Reported-by: Bjorn Helgaas <bhelgaas@google.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202506260920.bmQ9hQ9s-lkp@intel.com/
>> Fixes: 633f42f48af5 ("PCI: stm32: Add PCIe host support for STM32MP25")
>> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> 
> I can't merge 633f42f48af5 as-is because of the build issue.
> 
> Pinctrl provides stubs for the non-CONFIG_PINCTRL case; the issue is
> that 633f42f48af5 uses dev->pins, which only exists when
> CONFIG_PINCTRL is enabled.
> 
> The possibilities I see are:
> 
>    1) Merge initial stm32 without suspend/resume support via PCI, merge
>       pinctrl_pm_select_init_state() via pinctrl, then add stm32
>       suspend/resume support.  pinctrl_pm_select_init_state() and stm32
>       (without suspend/resume) would appear in v6.18, and stm32
>       suspend/resume would be added in v6.19.
> 
>    2) Temporarily #ifdef the dev->pins use.  pinctrl_pm_select_init_state()
>       and stm32 (with #ifdef) would appear in v6.18, follow-on patch to
>       replace #ifdef with pinctrl_pm_select_init_state() would appear
>       in v6.19.
>    3) Merge your [1] to add pinctrl_pm_select_init_state() via PCI with
>       Linus's ack, followed by the stm32 series with the change below
>       squashed in.  Everything would appear in v6.18.

or 4) Linus applies it in his PINCTRL branch and Mani cherry-pick it in 
PCI. But that will be a conflict to solve when both comes to mainline.

Personally I prefer 3) if Linus Acks, to break the dependency

Thank you

Christian

> 
> I'm OK with any of these.
> 
> [1] https://lore.kernel.org/r/20250813081139.93201-1-christian.bruel@foss.st.com
> 
>> ---
>> Changes in v1:
>>   - pinctrl_pm_select_init_state() return 0 if the state is not defined.
>>     No need to test as pinctrl_pm_select_default_state() is called.
>> ---
>>   drivers/pci/controller/dwc/pcie-stm32.c | 10 +++-------
>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
>> index 50fae5f5ced2..8501b9ed0633 100644
>> --- a/drivers/pci/controller/dwc/pcie-stm32.c
>> +++ b/drivers/pci/controller/dwc/pcie-stm32.c
>> @@ -90,14 +90,10 @@ static int stm32_pcie_resume_noirq(struct device *dev)
>>   
>>   	/*
>>   	 * The core clock is gated with CLKREQ# from the COMBOPHY REFCLK,
>> -	 * thus if no device is present, must force it low with an init pinmux
>> -	 * to be able to access the DBI registers.
>> +	 * thus if no device is present, must deassert it with a GPIO from
>> +	 * pinctrl pinmux before accessing the DBI registers.
>>   	 */
>> -	if (!IS_ERR(dev->pins->init_state))
>> -		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
>> -	else
>> -		ret = pinctrl_pm_select_default_state(dev);
>> -
>> +	ret = pinctrl_pm_select_init_state(dev);
>>   	if (ret) {
>>   		dev_err(dev, "Failed to activate pinctrl pm state: %d\n", ret);
>>   		return ret;
>> -- 
>> 2.34.1
>>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
