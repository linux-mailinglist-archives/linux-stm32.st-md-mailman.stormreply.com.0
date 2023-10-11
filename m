Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 063D37C4D9E
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Oct 2023 10:51:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1269C6B44B;
	Wed, 11 Oct 2023 08:51:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BC04C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Oct 2023 08:51:02 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39B5xlfO011115; Wed, 11 Oct 2023 10:50:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=8gYo5goS4DqeD1ldn/WMNS5pR/ViIwg7IylwRkFLbCQ=; b=Za
 TlXAtbPx+MB2v0D8AaSOiCRr0QWaExzh07Zo/oJZvuCeapBUJIlchy/0wVkKmKEn
 wF4z0gNW2gVgYd+nm+OoUH3zQARoNUOh9jLOsqhjQPZQakZgQ8UQum8NC5lIu53G
 J9/i4D9RVwogLLkVq45t8JbhccX58FoBHOkPFG54l4Myu31cTN8/lVAO4VwO3iQ/
 QVK9wmSpmZQtWB32TwY8Jbg0FQFxf0GPdf5ZAKxNUqJf8bLx+7v473H+0cTRORLN
 +6OGQsijOBEGjRMLIhQfjAvoAYEoRWr3fmVZBKuazCBrw1XmeMdLs2GuCUkIAx4t
 D2E7cjGWOwhthrlESwYw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tnp24gtuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Oct 2023 10:50:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 21883100064;
 Wed, 11 Oct 2023 10:50:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B630822FA2E;
 Wed, 11 Oct 2023 10:50:05 +0200 (CEST)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 11 Oct
 2023 10:50:03 +0200
Message-ID: <8f1b6915-68be-a525-c5d5-37f0983c14de@foss.st.com>
Date: Wed, 11 Oct 2023 10:49:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Rob Herring <robh@kernel.org>
References: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
 <20231010125719.784627-11-gatien.chevallier@foss.st.com>
 <20231010184212.GA1221641-robh@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20231010184212.GA1221641-robh@kernel.org>
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_06,2023-10-10_01,2023-05-22_02
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, peng.fan@oss.nxp.com,
 herbert@gondor.apana.org.au, Frank Rowand <frowand.list@gmail.com>,
 hugues.fruchet@foss.st.com, lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org,
 linux-p.hy@lists.infradead.org, richardcochran@gmail.com,
 linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 10/11] ARM: dts: stm32: add ETZPC as a
 system bus for STM32MP15x boards
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

Hi Rob,

On 10/10/23 20:42, Rob Herring wrote:
> On Tue, Oct 10, 2023 at 02:57:18PM +0200, Gatien Chevallier wrote:
>> ETZPC is a firewall controller. Put all peripherals filtered by the
>> ETZPC as ETZPC subnodes and reference ETZPC as an
>> access-control-provider.
>>
>> For more information on which peripheral is securable or supports MCU
>> isolation, please read the STM32MP15 reference manual.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>
>> Changes in V6:
>>      	- Renamed access-controller to access-controllers
>>      	- Removal of access-control-provider property
>>
>> Changes in V5:
>>      	- Renamed feature-domain* to access-control*
>>
>>   arch/arm/boot/dts/st/stm32mp151.dtsi  | 2756 +++++++++++++------------
>>   arch/arm/boot/dts/st/stm32mp153.dtsi  |   52 +-
>>   arch/arm/boot/dts/st/stm32mp15xc.dtsi |   19 +-
>>   3 files changed, 1450 insertions(+), 1377 deletions(-)
> 
> This is not reviewable. Change the indentation and any non-functional
> change in one patch and then actual changes in another.

Ok, I'll make it easier to read.

> 
> This is also an ABI break. Though I'm not sure it's avoidable. All the
> devices below the ETZPC node won't probe on existing kernel. A
> simple-bus fallback for ETZPC node should solve that.
> 

I had one issue when trying with a simple-bus fallback that was the
drivers were probing even though the access rights aren't correct.
Hence the removal of the simple-bus compatible in the STM32MP25 patch.

Even though a node is tagged with the OF_POPULATED flag when checking
the access rights with the firewall controller, it seems that when
simple-bus is probing, there's no check of this flag.

of_platform_populate() checks and sets the OF_POPULATED_BUS flag.
Maybe that is my error and the firewall bus populate should set
OF_POPULATED_BUS instead of OF_POPULATED. Is that correct?

Best regards,
Gatien

> Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
