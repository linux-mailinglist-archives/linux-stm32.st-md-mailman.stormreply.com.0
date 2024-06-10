Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AFE901CB1
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2024 10:16:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98736C71286;
	Mon, 10 Jun 2024 08:16:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 123F9C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2024 08:16:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 459LdCa7025381;
 Mon, 10 Jun 2024 10:15:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 luPvYi2+bdeQnMajOwT0mxxtNvrSHDJwHEH0GYgBZKI=; b=rZPTBWm0ZyRUTdUs
 WQGUpECn8E4EU1jCXf/0waiFKus+/i4Tmh5mvEjeN3RVZkjIMk5x53R459Hsnezh
 ig2jrKrG74gbb739nA5b/jD9wFs3JlBpUXqAwOnNGw1GCDt9fLfZJvP2HwvVnLEf
 GMu3rZkR/a/ADJbV9tgiG6h3ekCl8oVgA2zrOHVTqnSkFyv6k1A0UNXly0AzdAPM
 wx6mHzoQhLLdj6KlEfq3t1sjS1k92jQqIgfvHroQ7rrPU31o5aNqcbqaneK1ttRB
 xBiUlVIQJcNABkxgOgj8hkG62cSDyAyleV80Ob4btGGTl1wAKhffIybjXGG1eU4T
 FxyFyg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yme6d5nm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jun 2024 10:15:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1CDB74002D;
 Mon, 10 Jun 2024 10:15:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78892211F37;
 Mon, 10 Jun 2024 10:14:20 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 10 Jun
 2024 10:14:18 +0200
Message-ID: <ef4d2ebb-dd2a-423d-acd1-43fdb42c1896@foss.st.com>
Date: Mon, 10 Jun 2024 10:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marek Vasut <marex@denx.de>
References: <20240610080604.291102-1-christophe.roullier@foss.st.com>
 <06703c03-e1ce-4a94-942d-b556c6084728@linaro.org>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <06703c03-e1ce-4a94-942d-b556c6084728@linaro.org>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/1] ARM: multi_v7_defconfig: Add MCP23S08
	pinctrl support
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

Hi Krzysztof,

On 6/10/24 10:09, Krzysztof Kozlowski wrote:
> On 10/06/2024 10:06, Christophe Roullier wrote:
>> Enable MCP23S08 I/O expanders to manage Ethernet PHY
>> reset in STM32MP135F-DK board.
>>
>> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
>> ---
>>   arch/arm/configs/multi_v7_defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
>> index 86bf057ac3663..9758f3d41ad70 100644
>> --- a/arch/arm/configs/multi_v7_defconfig
>> +++ b/arch/arm/configs/multi_v7_defconfig
>> @@ -469,6 +469,7 @@ CONFIG_SPI_XILINX=y
>>   CONFIG_SPI_SPIDEV=y
>>   CONFIG_SPMI=y
>>   CONFIG_PINCTRL_AS3722=y
>> +CONFIG_PINCTRL_MCP23S08=y
> This is not an on-SoC pinctrl, so it should be module (=m).

The stmmac is in built-in, if IO-Expander (MCP23S08) is on module, we 
have huge of message during kernel boot

because stmmac driver is deferred several times. (need to wait that 
module are ready)

Thanks

>
> Best regards,
> Krzysztof
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
