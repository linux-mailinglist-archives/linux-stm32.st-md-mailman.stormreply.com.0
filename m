Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45858B20A3F
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Aug 2025 15:33:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED57BC32E8E;
	Mon, 11 Aug 2025 13:33:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C3FDC32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Aug 2025 13:33:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BDNkl9025158;
 Mon, 11 Aug 2025 15:32:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 aywYyzoixAm3Sjd8epTOZToUh9Gg+kyh1HfqY33n5bw=; b=Zv4kHUCXcILUQIx5
 iF4WiJiPI9HHvmA+T3RoIcBguAuS3C3kJDOPnxHM0kLu4l/+9SwtqS4cV6SWc5UI
 wU25e4iXd6rhFt8jyReReMhjqGC3POpMn3Fsvn19vgxAyo5jU/cF5q6co8GkTBAi
 Y6ZkpKmwjsMMOAufHn1POVfQotIT9MsYheaNWLEwgf03SC9ZweA5EIPWXG57iv43
 4NsH6+qCCE4kbtBLzwSxUc6wYRfBjVsj4PvD9iEtZhEol8L2Nv878LY6uMrUDmjR
 o4uMnnnj6GuP8q+wSo0cNWkJQunTzuuQGx8Gf2Yoq7qBpxK+gD4WWO6kpG+ueWv3
 ajQglg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48dw7g65xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Aug 2025 15:32:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 036A340044;
 Mon, 11 Aug 2025 15:31:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0BA2474D375;
 Mon, 11 Aug 2025 15:30:11 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Aug
 2025 15:30:10 +0200
Message-ID: <2c497e75-bdb7-45ee-96ba-e293e33db91b@foss.st.com>
Date: Mon, 11 Aug 2025 15:30:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20250808164527.GA92564@bhelgaas>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <20250808164527.GA92564@bhelgaas>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-11_01,2025-03-28_01
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 p.zabel@pengutronix.de, mani@kernel.org, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, thippeswamy.havalige@amd.com,
 linux-stm32@st-md-mailman.stormreply.com, cassel@kernel.org,
 devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bhelgaas@google.com, krzk+dt@kernel.org, shradha.t@samsung.com,
 lpieralisi@kernel.org, johan+linaro@kernel.org, kwilczynski@kernel.org
Subject: Re: [Linux-stm32] [PATCH v12 2/9] PCI: stm32: Add PCIe host support
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



On 8/8/25 18:45, Bjorn Helgaas wrote:
> On Fri, Aug 08, 2025 at 04:55:52PM +0200, Christian Bruel wrote:
>> On 8/7/25 20:09, Bjorn Helgaas wrote:
>>> [+to Linus for pinctrl usage question below]
>>>
>>> On Tue, Jun 10, 2025 at 11:07:07AM +0200, Christian Bruel wrote:
>>>> Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
>>>> controller based on the DesignWare PCIe core.
> 
>>>> +	return pinctrl_pm_select_sleep_state(dev);
>>>
>>> Isn't there some setup required before we can use
>>> pinctrl_select_state(), pinctrl_pm_select_sleep_state(),
>>> pinctrl_pm_select_default_state(), etc?
>>>
>>> I expected something like devm_pinctrl_get() in the .probe() path, but
>>> I don't see anything.  I don't know how pinctrl works, but I don't see
>>> how dev->pins gets set up.
>>
>> Linus knows better, but the dev->pins states are attached to the dev struct
>> before probe by the pinctrl driver
>>
>> /**
>>   * pinctrl_bind_pins() - called by the device core before probe
>>   * @dev: the device that is just about to probe
>>   */
>> int pinctrl_bind_pins(struct device *dev)
> 
> Thanks for the pointer.  Might be worthy of a mention in
> Documentation/driver-api/pin-control.rst.  Maybe pinctrl/consumer.h
> could even have a bread crumb to that effect since drivers use all
> those interfaces that rely in the implicit initialization done before
> their .probe().
> 
> pin-control.rst mentions pinctrl_get_select_default() being called
> just before the driver probe, but that's now unused and it looks like
> pinctrl_bind_pins() does something similar:
> 
>    really_probe
>      pinctrl_bind_pins
>        dev->pins = devm_kzalloc()
>        devm_pinctrl_get
>        pinctrl_lookup_state(PINCTRL_STATE_DEFAULT)
>        pinctrl_lookup_state(PINCTRL_STATE_INIT)
>        pinctrl_select_state(init)      # if present, else default
>      call_driver_probe

Yeah, and state_init is not mentioned in the documentation even for the 
'normal probe'. The only doc I see from the original commit 
ef0eebc05130b0d22b0ea65c0cd014ee16fc89c7

" 

     Let's introudce a new "init" state.  If this is defined we'll set
     pinctrl to this state before probe and then "default" after probe
     (unless the driver explicitly changed states already). 

"

I will propose something in pin-control.rst, with maybe some code-block 
for the pm part and respin [PATCH 0/2] Add pinctrl_pm_select_init_state 
helper function...

Christian

> 
> Bjorn

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
