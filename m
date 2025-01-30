Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 697CEA22B11
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Jan 2025 10:59:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B7D1C71289;
	Thu, 30 Jan 2025 09:59:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D533EC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2025 09:59:07 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U9tuFE006037;
 Thu, 30 Jan 2025 10:58:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Sqonxp9aXTn3c2hsrTLPYeaBVLsx7H/jkmUhYlzq4ac=; b=iQmcYJuXQcC9F7mV
 72ZONSqhy/flHR0oif4Mkm/ITMki91Csklg3bGJNu/RI/iHHSvfc1dTrtfR/ksGm
 FjrQgTATxVd4KfiifJ3BTnds9W0Tyjs2CH5qNUPEqWAnQsdyMuyML+E1Toa0ai4w
 I3p0ioH/Bo3RSDYsxT+n02qUkQJBlSdEFUDEurnLplVmW4nwIRbYweq7GIx7YTz5
 mPew0rg7UZ1q2N9SsNEurvL/sV8jxd0p67ivOwrSaybYfXRuQZ42VtwQH9siMVcQ
 SC2ZhijLos4wQcn7Xq8eRON16pjxxJ5e0EOCNkrWIhCig45ZYXaUglhW7ZHYcIkD
 5Nt8Eg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44fy471jdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jan 2025 10:58:48 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A74564002D;
 Thu, 30 Jan 2025 10:57:32 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F9F72EC5C3;
 Thu, 30 Jan 2025 10:48:08 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 30 Jan
 2025 10:48:07 +0100
Message-ID: <bbdf57b8-60e7-4f73-b597-edbbee641fcb@foss.st.com>
Date: Thu, 30 Jan 2025 10:48:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-2-patrice.chotard@foss.st.com>
 <20250128-panama-manly-a753d91c297c@spud>
 <20250129-annoying-flawless-porpoise-47daed@krzk-bin>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250129-annoying-flawless-porpoise-47daed@krzk-bin>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/9] dt-bindings: spi: Add STM32 OSPI
	controller
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 1/29/25 08:40, Krzysztof Kozlowski wrote:
> On Tue, Jan 28, 2025 at 06:02:27PM +0000, Conor Dooley wrote:
>>> +  st,syscfg-dlyb:
>>> +    description: phandle to syscon block
>>> +      Use to set the OSPI delay block within syscon to
>>> +      tune the phase of the RX sampling clock (or DQS) in order
>>> +      to sample the data in their valid window and to
>>> +      tune the phase of the TX launch clock in order to meet setup
>>> +      and hold constraints of TX signals versus the memory clock.
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>
>> Why do you need a phandle here? I assume looking up by compatible ain't
>> possible because you have multiple controllers on the SoC? Also, I don't
>> think your copy-paste "phandle to" stuff here is accurate:
>>       st,syscfg-dlyb = <&syscfg 0x1000>;
>> There's an offset here that you don't mention in your description.
> 
> This needs double items: and listing them with description, instead of
> free form text.

ok, i will remove most of ths text description and update as following :

  st,syscfg-dlyb:
    description: configure OCTOSPI delay block.
    $ref: /schemas/types.yaml#/definitions/phandle-array
    items:
      - description: phandle to syscfg
      - description: register offset within syscfg

Thanks
Patrice
> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
