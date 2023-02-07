Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F8C68D955
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Feb 2023 14:32:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 398D7C6A5E8;
	Tue,  7 Feb 2023 13:32:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0393C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Feb 2023 13:32:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317ArI1e008460; Tue, 7 Feb 2023 14:31:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=DvaNpdrSgE+lHP2IkmzvxSLVAaIdRRvLf0BwPPBEci4=;
 b=aQaSbkCpRXS5PTBvs/7A4rURHj3O8ll9TldW/dJbYL96OW9dyidgNbpqQ2IMwlJcHYfV
 PCVnikmHA0+/GU/YHrkk37G8Rh1vwsakP87ID7Au4i9IPIaHZeIDNhs3YvOTq1WTSruH
 P/8HpNo2WO25T81982igFgAtil5zgYjG1s7tQEMU059ZhJ/Ri0m3Ps7/HUr6/6js0yXH
 74wlbwkqH4zm93ascw8YJ8mG5y0V5j0ZKxb4kjWICzncOKYOnHM36Ik5nhtQdo8YyV1/
 CkELeSEYnoaCyUnTE4l4Y2LIuOvGfr53WsS7P8Z1L0NcrxY6EwxnjvkuyxgzkO+gacI9 kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nhdcfk48x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 14:31:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B91DA10002A;
 Tue,  7 Feb 2023 14:31:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F17372194F5;
 Tue,  7 Feb 2023 14:31:20 +0100 (CET)
Received: from [10.201.20.249] (10.201.20.249) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 7 Feb
 2023 14:31:19 +0100
Message-ID: <d283ef50-7807-b928-83a5-63ef4565f9e4@foss.st.com>
Date: Tue, 7 Feb 2023 14:31:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Jonathan Cameron <jic23@kernel.org>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-4-gatien.chevallier@foss.st.com>
 <20230128154827.4f23534e@jic23-huawei>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20230128154827.4f23534e@jic23-huawei>
X-Originating-IP: [10.201.20.249]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_05,2023-02-06_03,2022-06-22_01
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, edumazet@google.com,
 Oleksii_Moisieiev@epam.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, kuba@kernel.org, arnaud.pouliquen@foss.st.com,
 pabeni@redhat.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 3/6] dt-bindings: bus: add STM32 System
	Bus
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

Hello Jonathan,

On 1/28/23 16:48, Jonathan Cameron wrote:
> On Fri, 27 Jan 2023 17:40:37 +0100
> Gatien Chevallier <gatien.chevallier@foss.st.com> wrote:
> 
>> Document STM32 System Bus. This bus is intended to control firewall
>> access for the peripherals connected to it.
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> Signed-off-by: Loic PALLARDY <loic.pallardy@st.com>
> Trivial comment on formatting.
> 
>> +
>> +examples:
>> +  - |
>> +    // In this example, the rng1 device refers to etzpc as its domain controller.
>> +    // Same goes for fmc.
>> +    // Access rights are verified before creating devices.
>> +
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/stm32mp1-clks.h>
>> +    #include <dt-bindings/reset/stm32mp1-resets.h>
>> +
>> +    etzpc: bus@5c007000 {
>> +        compatible = "st,stm32mp15-sys-bus";
>> +        reg = <0x5c007000 0x400>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +        feature-domain-controller;
>> +        #feature-domain-cells = <1>;
>> +
>> +        rng1: rng@54003000 {
> 
> Odd mixture of 4 spacing and 2 spacing in this example.
> I'd suggest one or the other (slight preference for 4 space indents).
> 

Thank you for spotting this, I'll change to 4 space indents

> 
>> +          compatible = "st,stm32-rng";
>> +          reg = <0x54003000 0x400>;
>> +          clocks = <&rcc RNG1_K>;
>> +          resets = <&rcc RNG1_R>;
>> +          feature-domains = <&etzpc 7>;
>> +          status = "disabled";
>> +        };

Best regards,
Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
