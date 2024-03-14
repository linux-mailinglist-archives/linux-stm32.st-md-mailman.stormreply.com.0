Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D600487BFA8
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Mar 2024 16:12:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8790CC6B476;
	Thu, 14 Mar 2024 15:12:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09713C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Mar 2024 15:12:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42ECLgg5008484; Thu, 14 Mar 2024 16:11:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=bU+OuOUBiYItdSMHewTGuq8gPvvZH7JVomcCgOz8k/4=; b=L/
 AKO6OVGC2VcgKp77wKZFEqvqbBXd+hnFlWsZ/uzX83aEj7/XCW7ElSSRQo5MovQp
 xugjjJssdGB+uYxV0lsZFDgOmO5q7XfTtjzTvViOmpLYeK5n/y6jjiLBINiO2lKG
 kzIxO+F70uzG5pMyXf7NpxE+dhOvrHW1eQj9LwMhxQVEnK1IHDhEOiSD8fRLVnpP
 TfhlB0L2HQ0ZGks2zU55wwqrj1esBTkYwK3sT+N7XsiZhiGfcSWiTrclWqX5DfCh
 B3RvlvsoKdZX0oFyuBSWklXZ2hWtZ4pdH45I6rBhHSavN/zfq6gcX/Y3w5iNl1aq
 B6mOjgpl+hOydCShVwGg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wtd6255qd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Mar 2024 16:11:47 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9C0D240044;
 Thu, 14 Mar 2024 16:11:39 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AF51526FCF7;
 Thu, 14 Mar 2024 16:10:25 +0100 (CET)
Received: from [10.201.21.128] (10.201.21.128) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 14 Mar
 2024 16:10:24 +0100
Message-ID: <51531046-ee83-4d99-836b-af4dc5d7add9@foss.st.com>
Date: Thu, 14 Mar 2024 16:10:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240307135957.303481-1-christophe.roullier@foss.st.com>
 <20240307135957.303481-3-christophe.roullier@foss.st.com>
 <578f421c-ca06-45d4-8380-8b2b423d4d47@linaro.org>
 <50ee6122-b160-48ea-8c44-1046b5907d7c@foss.st.com>
 <e2a98098-8ccd-4b8f-9a4b-1cbc0776a9c2@linaro.org>
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <e2a98098-8ccd-4b8f-9a4b-1cbc0776a9c2@linaro.org>
X-Originating-IP: [10.201.21.128]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-14_12,2024-03-13_01,2023-05-22_02
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] dt-bindings: net: add new property
 st, ext-phyclk in documentation for stm32
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

Hi,

On 3/13/24 14:06, Krzysztof Kozlowski wrote:
> On 13/03/2024 11:39, Christophe ROULLIER wrote:
>> On 3/8/24 09:28, Krzysztof Kozlowski wrote:
>>> On 07/03/2024 14:59, Christophe Roullier wrote:
>>>> Add property st,ext-phyclk to manage cases when PHY have no cristal/quartz
>>>> This property can be used with RMII phy without cristal 50Mhz and when we
>>>> want to select RCC clock instead of ETH_REF_CLK
>>>> Can be used also with RGMII phy with no cristal and we select RCC clock
>>>> instead of ETH_CLK125
>>>>
>>> Nothing improved here. You say you add new property (wrote it explicitly
>>> in the subject), but where is it? Where is the user?
>>>
>>> I think we talked about this. Rob also asked quite clear:
>>>
>>>> That is obvious from the diff. What is not obvious is why we need a new
>>>> property and what is the problem with the existing ones.
>>> How did you solve it?
>> Hi,
>>
>> I do not understand your questions.
> OK, I will clarify some questions, but are you sure that this question:
> "How did you solve it?"
> needs clarification?
>
> If so, then let me clarify:
> Rob pointed issue. How did you resolve Rob's comment? How did you
> address it? What changed in your patch, that Rob's comment should be
> considered as addressed/resolved/done?
This property was introduced in 2020 in order to simplify management of 
all STM32 platforms without Ethernet cristal/quartz PHY.
>
> Now about my other question:
> "but where is it? Where is the user?"
>
> Your subject and commit message claim you add new property. This means
> such property was not existing so far in the Linux kernel. If you add
> new property in the binding, then I expect adding the user of that
> binding, thus my question: where is the user of that binding?
>
I'm preparing glue and DTS to upstream for STM32MP13 platform, this 
platform will use with property.

Since 2020, this property is available in the driver in kernel.org, so 
it is also possible that someone who has not upstreamed their

code also uses it.

>> That I would like to do, it is property "st,ext-phyclk" was introduced
>> in driver
>>
>> "drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c" in 2020, and YAML
>> was not updated at the time.
> Are you saying you document existing property or add a new one?
Yes, existing property, since 2020 in kernel.org.
>
>> Goal of this patch it is to update YAML to avoid dtbs check issue if
>> someone use this property :
>>
>>    dtbs check issue : views/kernel/upstream/net-next/arch/arm/boot/dts/st/stm32mp157c-dk2.dtb:
>> ethernet@5800a000: Unevaluated properties are not allowed
>> ('st,ext-phyclk' was unexpected)
> So DTS uses it?
Here it was example, if someone wants to use this property, but today 
this property is not yet present in DTS in kernel.org

>
> Are my questions now clear?
Thanks Krzysztof ;-)
> BTW, I asked some of them before and you
> just sent the same patch, so looks like ignored my questions.
>
> Best regards,
> Krzysztof
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
