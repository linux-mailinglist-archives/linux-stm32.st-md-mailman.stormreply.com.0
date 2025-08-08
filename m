Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDC6B1EAE9
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Aug 2025 16:59:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFD40C3F952;
	Fri,  8 Aug 2025 14:59:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CEC3C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Aug 2025 14:59:10 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578DVG8N014777;
 Fri, 8 Aug 2025 16:58:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 NKA5zhqFYGJHApG3LHZ1wsad9XAvKI/FIK3QKmiMCpI=; b=WbnCVx14jjeuJHN6
 GJIn+Fy7uBInALd0yOmv8xY1N92s1MboPmYDOVGOfKlyJ1dR9TdIdZfZZ4z7u230
 hOZgX2ZobRFpBIOy2vaW04NBtp7pze1/toMUiVE1RtWulxbwt1s/1hMJbrSvEsKM
 mv8O0GZCz25MOCQgGka/uT3VEShhKKugQsfHOZnGaYcy6pyoWjDb679PqL8ypGYf
 RLUCtOMzNsz/XeURNPf+0IqflqC3ZDk4Ifwp9S9Vi0zr9ltkc3dOgbgt3l/YYUuW
 ArazUWAES+HMyrjVVRVsnQhgUvAFXTm2W7oQM/aPTere3xJqK2sqyKGuQm7MwPo8
 C4I3tQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48cq00pdk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Aug 2025 16:58:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A8D2340046;
 Fri,  8 Aug 2025 16:57:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7F79727648;
 Fri,  8 Aug 2025 16:55:57 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Aug
 2025 16:55:54 +0200
Message-ID: <e7cd764d-bc6d-4e39-aa03-0eee8e30d3e5@foss.st.com>
Date: Fri, 8 Aug 2025 16:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>
References: <20250807180951.GA56737@bhelgaas>
Content-Language: en-US
In-Reply-To: <20250807180951.GA56737@bhelgaas>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_04,2025-08-06_01,2025-03-28_01
Cc: robh@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 mani@kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 thippeswamy.havalige@amd.com, linux-kernel@vger.kernel.org, cassel@kernel.org,
 devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bhelgaas@google.com, krzk+dt@kernel.org, shradha.t@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, johan+linaro@kernel.org,
 kwilczynski@kernel.org
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



On 8/7/25 20:09, Bjorn Helgaas wrote:
> [+to Linus for pinctrl usage question below]
> 
> On Tue, Jun 10, 2025 at 11:07:07AM +0200, Christian Bruel wrote:
>> Add driver for the STM32MP25 SoC PCIe Gen1 2.5 GT/s and Gen2 5GT/s
>> controller based on the DesignWare PCIe core.
>>

>> +
>> +	return pinctrl_pm_select_sleep_state(dev);
> 
> Isn't there some setup required before we can use
> pinctrl_select_state(), pinctrl_pm_select_sleep_state(),
> pinctrl_pm_select_default_state(), etc?
> 
> I expected something like devm_pinctrl_get() in the .probe() path, but
> I don't see anything.  I don't know how pinctrl works, but I don't see
> how dev->pins gets set up.

Linus knows better, but the dev->pins states are attached to the dev 
struct before probe by the pinctrl driver

/**
  * pinctrl_bind_pins() - called by the device core before probe
  * @dev: the device that is just about to probe
  */
int pinctrl_bind_pins(struct device *dev)

Christian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
