Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2BD43FEB2
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Oct 2021 16:52:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36982C5E2C2;
	Fri, 29 Oct 2021 14:52:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A2E1C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Oct 2021 14:52:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19TDDB1d031438; 
 Fri, 29 Oct 2021 16:52:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=I1juxWCbFobtAQIbrKW1gjVS0UkgsEenVBQr32iMpWc=;
 b=cUjW0fCFUkxrpDLYpGUU2+Rjec67+uiIE7jgCN8GypfCENziuHwR+/6PR7jSO111tyQn
 8xQRlGQsVr63YqWXmvK8jB9rxa/Joahi3wdS0Gf/Y8dg59IB6KsosPp5qOw9TzSbShj0
 z9ePYaDCoCPYh4hRB2uAUnSjgcZxV9F6U3WrfVe1Id9bHGZSfJEJfeCA2QDQGApC8QRv
 YLB5nkswb+gVzzVMALfdtbMrk+jUCdgRJmgg54wy5mm6/iiEYkw/lEhDhLLY+BD5W3uw
 d/YsWPG74JZ3oZBG1dg6MesUHDVrRY9MocoG88xGHwiyHgk3hNnvbpjzwtqjz4yJ1bZT jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3c0c4y2qp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Oct 2021 16:52:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3C3A710002A;
 Fri, 29 Oct 2021 16:52:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3035B2C41F5;
 Fri, 29 Oct 2021 16:52:11 +0200 (CEST)
Received: from [10.48.0.126] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 29 Oct
 2021 16:52:10 +0200
To: Rob Herring <robh@kernel.org>
References: <1634144026-3326-1-git-send-email-fabrice.gasnier@foss.st.com>
 <YXhnLh9OYxUz8dIC@robh.at.kernel.org>
 <be749cbe-c029-7a24-da0e-94ab363ea07e@foss.st.com>
 <CAL_JsqJPbJiNi5=YT3siGrb-vu2+Ex6Xa5=XQQ9NR2iMv-3Fxg@mail.gmail.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <c5e5b327-4f92-4623-56d3-62e6f7dc8604@foss.st.com>
Date: Fri, 29 Oct 2021 16:52:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJPbJiNi5=YT3siGrb-vu2+Ex6Xa5=XQQ9NR2iMv-3Fxg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-29_03,2021-10-29_01,2020-04-07_01
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Minas Harutyunyan <hminas@synopsys.com>, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: usb: dwc2: document the port
 when usb-role-switch is used
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

On 10/29/21 12:50 AM, Rob Herring wrote:
> On Wed, Oct 27, 2021 at 7:05 AM Fabrice Gasnier
> <fabrice.gasnier@foss.st.com> wrote:
>>
>> On 10/26/21 10:38 PM, Rob Herring wrote:
>>> On Wed, Oct 13, 2021 at 06:53:46PM +0200, Fabrice Gasnier wrote:
>>>> Document the "port" property, which is used with "usb-role-switch"
>>>> to describe the bus connector.
>>>> Definition is inspired from mediatek,mtu3.yaml.
>>>>
>>>> This fixes some errors seen when running "make dtbs_check":
>>>> ... 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
>>>>         From schema: ... Documentation/devicetree/bindings/usb/dwc2.yaml
>>>>
>>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/usb/dwc2.yaml | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
>>>> index 10c7d9b..7d1aa53 100644
>>>> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
>>>> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
>>>> @@ -130,6 +130,16 @@ properties:
>>>>      description: If present indicates that we need to reset the PHY when we
>>>>        detect a wakeup. This is due to a hardware errata.
>>>>
>>>> +  port:
>>>> +    description:
>>>> +      Any connector to the data bus of this controller should be modelled
>>>> +      using the OF graph bindings specified, if the "usb-role-switch"
>>>> +      property is used. See graph.txt
>>>
>>> Drop 'See graph.txt'
>>>
>>>> +    $ref: /schemas/graph.yaml#/properties/port
>>>> +
>>>> +dependencies:
>>>> +  port: [ 'usb-role-switch' ]
>>>
>>> usb-role-switch without port is valid or both must be present. In case
>>> of the latter, you need to add:
> 
> If I wasn't clear, that was a question. Is usb-role-switch without
> port is valid?

Hi Rob,

Ah ok... I didn't get it was a question.
So, usb-role-switch without port is valid.

> 
>>
>> Hi Rob,
>>
>> Thanks for your review.
>> I agree with your statement. But I miss something in this proposal:
>>
>>>
>>> usb-role-switch: [ port ]
>>
>> I tried this without success, when running dt_binding_check.
>>
>> For testing, I added locally in the example successively:
>>
>> 1 - usb-role-switch (alone)
>> -----
>> +        usb-role-switch;
>> "dwc2.example.dt.yaml: usb@101c0000: 'port' is a dependency of
>> 'usb-role-switch'
>>
>> 2 - port without usb-role-switch
>> -----
>> +        //usb-role-switch;
>> +
>> +        port {
>> +          usb_role_sw: endpoint {
>> +            remote-endpoint = <&hs_ep>;
>> +          };
>> +        };
>> dt_binding_check is happy here. But it shouldn't, right ?
> 
> You had this?:
> 
> dependencies:
>   usb-role-switch: [ port ]
>   port: [ usb-role-switch ]

no, above test was only with "usb-role-switch: [ port ]"

> 
> 
> If both properties have to be present together, then you need the above.

This isn't the case. The only constraints here is, if port is used, then
usb-role-switch must be set.

dependencies:
  port: [ usb-role-switch ]

V2 is under review, with the above.

BR,
Fabrice
> 
>>
>> 3 - both (port + usb-role-switch)
>> -----
>> dt_binding_check is ok.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
