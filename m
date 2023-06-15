Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5E8731C4B
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 17:17:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE008C65E58;
	Thu, 15 Jun 2023 15:17:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DA6EC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 15:17:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35FCEt7D009758; Thu, 15 Jun 2023 17:16:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Z8QJjun6btnvSr7lAvWu+rc8YKl642Hi51SoBVwCAcM=;
 b=2exfU3/Ij1wcXO3yLgGGfyf9Cktxgq5hJqUym7/DAfLpoZSHchyUfpNLnvUMgBQld7ml
 0QqD3Onw73SbnSpdLQLfRhGTwFKWzdNrSUMcERhAQ7uHtrDeweMBvYhU8sXbBfMiKeku
 X09d7z4vlkZXz7/cbeDM7+SQ4qifvWEHjb85JP7swmy9uWGY67esg/oo85Qmyup7WM8Z
 w26fh6bb0yq5C8pSrcFSGy8qu3RY8/OSIab34V90OUINkCPp3cgf7btVex51yJVdtIwq
 JbBFBUrf5NIFE98gORBZn50DEtu3+b2g4wxZpb1/YSIdolRTZuPAnkG5IjU8wMPGPxH/ jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r82fy93uk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jun 2023 17:16:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D68D10002A;
 Thu, 15 Jun 2023 17:16:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 43B25231523;
 Thu, 15 Jun 2023 17:16:31 +0200 (CEST)
Received: from [10.201.21.210] (10.201.21.210) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 15 Jun
 2023 17:16:29 +0200
Message-ID: <3b6781cb-8f59-e70a-bcf8-9fb48fa47cbf@foss.st.com>
Date: Thu, 15 Jun 2023 17:16:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20230615092001.1213132-1-yann.gautier@foss.st.com>
 <20230615092001.1213132-2-yann.gautier@foss.st.com>
 <CAPDyKFqJsqmNzeRg8hj55yUEMSycOWsmKVKsMWk4Qu7Y8_dNzg@mail.gmail.com>
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <CAPDyKFqJsqmNzeRg8hj55yUEMSycOWsmKVKsMWk4Qu7Y8_dNzg@mail.gmail.com>
X-Originating-IP: [10.201.21.210]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_11,2023-06-15_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Xiang wangx <wangxiang@cdjrlc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: mmc: mmci: Add st,
 stm32mp25-sdmmc2 compatible
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

On 6/15/23 15:20, Ulf Hansson wrote:
> On Thu, 15 Jun 2023 at 11:20, Yann Gautier <yann.gautier@foss.st.com> wrote:
>>
>> For STM32MP25, we'll need to distinguish how is managed the delay block.
>> This is done through a new comptible dedicated for this SoC, as the
>> delay block registers are located in SYSCFG peripheral.
>>
>> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
>> ---
>>   Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>> index 1c96da04f0e53..e47b3418b6c77 100644
>> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
>> @@ -59,6 +59,12 @@ properties:
>>             - const: st,stm32-sdmmc2
>>             - const: arm,pl18x
>>             - const: arm,primecell
>> +      - description: Entry for STMicroelectronics variant of PL18x for
>> +          STM32MP25. This dedicated compatible is used by bootloaders.
> 
> What does this last sentence mean? Can we drop it?

Hi Ulf,

I just copied (and added "for STM32MP25") what was done for STM32MP1x:
       - description: Entry for STMicroelectronics variant of PL18x.
           This dedicated compatible is used by bootloaders.
         items:
           - const: st,stm32-sdmmc2
           - const: arm,pl18x
           - const: arm,primecell
       - description: Entry for STMicroelectronics variant of PL18x for
           STM32MP25. This dedicated compatible is used by bootloaders.
         items:
           - const: st,stm32mp25-sdmmc2
           - const: arm,pl18x
           - const: arm,primecell


Should I remove (or adapt) both descriptions?


Best regards,
Yann

> 
>> +        items:
>> +          - const: st,stm32mp25-sdmmc2
>> +          - const: arm,pl18x
>> +          - const: arm,primecell
>>
>>     clocks:
>>       description: One or two clocks, the "apb_pclk" and the "MCLK"
>> --
>> 2.25.1
>>
> 
> Kind regards
> Uffe

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
