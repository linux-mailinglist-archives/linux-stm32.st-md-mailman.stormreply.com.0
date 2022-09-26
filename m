Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E65545E9FFD
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Sep 2022 12:32:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EB63C5EC6B;
	Mon, 26 Sep 2022 10:32:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B06FCC035BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 10:32:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q6n3rW004276;
 Mon, 26 Sep 2022 12:32:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=2YNk7rnU4FZ13+o3uecNedyFsARFhIeA+ezdGLGCGk4=;
 b=N/E+FthewNCLizrMRhhzGDsnNtzC5gNVHOgrchi7o+xablsWgHH+JEMTQiXZhSvOMoZF
 kzTVL/7paUPj9gIK5AjIdHwHUp7zTtr0ZmML/F5lH58fLbqaEzl1/JMe+pdtzO3+Q8Wv
 CpBDc0wdI3ZADsJ/CjInzicNOln/2ljjhh0sXV1kE4pHVox8SAaqpK7MvnEV11EBxYCV
 bVSyfx7fdin1+6kiOhGPclP/i9t9BNg6jqBDp10SKp6K4Hi4N4/6ZHgFc4FvJLcX115F
 YpdWo1trqKRP9h5ipHecJh8EJQHY+YYq8KPJ3a2K8UZTqiw7STbaldSlTTyBx3hBs9MH Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsjau3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 12:32:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02E3B100034;
 Mon, 26 Sep 2022 12:32:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7CD6D21FEA8;
 Mon, 26 Sep 2022 12:32:03 +0200 (CEST)
Received: from [10.201.21.93] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 12:32:03 +0200
Message-ID: <a8d9aee9-a1e3-5d9a-b9f3-4e92f79a99ef@foss.st.com>
Date: Mon, 26 Sep 2022 12:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>
References: <20220913074639.31932-1-alexandre.torgue@foss.st.com>
 <9b711a9e-9e63-b69e-fabf-e05c11f145a6@linaro.org>
 <c21b9c95-ae35-fd7e-9e8e-6926703725b4@foss.st.com>
 <5145d4db-65bf-971d-84cd-73c222311cd3@linaro.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <5145d4db-65bf-971d-84cd-73c222311cd3@linaro.org>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: stm32: add missing
 entries for gpio subnodes
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

On 9/23/22 11:21, Krzysztof Kozlowski wrote:
> On 23/09/2022 10:29, Alexandre TORGUE wrote:
>> Hi Krzysztof
>>
>> On 9/19/22 13:32, Krzysztof Kozlowski wrote:
>>> On 13/09/2022 09:46, Alexandre Torgue wrote:
>>>> Add "interrupt-controller" and gpio-line-names to gpio subnodes in order to
>>>> fix dtb validation.
>>>
>>> Rebase your patch on recent Linux kernel and use get_maintainers.pl.
>>
>> I did it on 6.0-rc5 but yes I used your kernel.org address instead of
>> linaro ones. Sorry.
>>
>>>
>>>>
>>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
>>>> index d35dcc4f0242..92582cccbb1b 100644
>>>> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
>>>> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
>>>> @@ -65,6 +65,10 @@ patternProperties:
>>>>          '#gpio-cells':
>>>>            const: 2
>>>>    
>>>> +      interrupt-controller: true
>>>> +      '#interrupt-cells':
>>>> +        const: 2
>>>> +
>>>>          reg:
>>>>            maxItems: 1
>>>>          clocks:
>>>> @@ -80,6 +84,8 @@ patternProperties:
>>>>            minimum: 1
>>>>            maximum: 16
>>>>    
>>>> +      gpio-line-names: true
>>>
>>> maxItems?
>>
>> Generic question, Is it mandatory to add maxItems information for all
>> entries ?
> 
> It's not mandatory for all. For some it is recommended, for some it does
> not make sense. Here it's quite easy to add and it will validate the
> entry. Any reason not to add it?

Ok understood. To be honest, no reasons to not add it.

cheers
alex

> 
> Best regards,
> Krzysztof
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
