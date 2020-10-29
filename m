Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BAC29F227
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 17:51:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18A32C3FAD5;
	Thu, 29 Oct 2020 16:51:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50531C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 16:51:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09TGh2EC008652; Thu, 29 Oct 2020 17:49:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=Mob56LhM6sAkz2L2wk6dZEKkVhrLDQUMsyRzFNsv3XU=;
 b=Skm6nkKPBAs+smcvx0P8Tmd5pCuSHb1FmyROzy1YgE2+dk3dT5s9HOWvo8Txdo2xdXgo
 Nu4qmKN4hT4PwSmPfUcH4KtGQJzvHVHAX5qBwROuPsGI/avcmwiW5LUqk5I5+dFn8a9J
 xH4Oa7k1GAhiZ+oRdnxrRL1T++MrGg/9spMBop3xZCvgL/uxSO1DMkSWYnGSHpnseWPU
 Gd0ba3GoUjn4QKUAlSAcJZ8Q/Fbk89X152ai9FX11AYDGiEM/qhARf0VdRtxi99MW+Wk
 +sPrMRtRSghB4fnP1Hz2DfdqOyj3ZNDgUqSlLg6o3oFx/Hik4oKQzLyJJGlTNaYoJ2Wq Pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccffthgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 17:49:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9CC4210002A;
 Thu, 29 Oct 2020 17:49:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F215F22AE30;
 Thu, 29 Oct 2020 17:49:34 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 29 Oct
 2020 17:49:33 +0100
To: Rob Herring <robh@kernel.org>
References: <20201029095806.10648-1-amelie.delaunay@st.com>
 <20201029095806.10648-2-amelie.delaunay@st.com>
 <20201029154016.GA1917373@bogus>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <860d5620-4fdf-6e01-9a04-3967d6fcfd6b@st.com>
Date: Thu, 29 Oct 2020 17:49:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029154016.GA1917373@bogus>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_10:2020-10-29,
 2020-10-29 signatures=0
Cc: devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v3 1/4] dt-bindings: connector: add
 power-opmode optional property to usb-connector
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



On 10/29/20 4:40 PM, Rob Herring wrote:
> On Thu, Oct 29, 2020 at 10:58:03AM +0100, Amelie Delaunay wrote:
>> Power operation mode may depends on hardware design, so, add the optional
>> property power-opmode for usb-c connector to select the power operation
>> mode capability.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
>> ---
>>   .../bindings/connector/usb-connector.yaml      | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> index 728f82db073d..200d19c60fd5 100644
>> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> @@ -93,6 +93,24 @@ properties:
>>         - device
>>         - dual
>>   
>> +  power-opmode:
> 
> I've acked this version:
> 
> https://lore.kernel.org/r/20201020093627.256885-2-badhri@google.com
>

frs is used for Fast Role Swap defined in USB PD spec.
I understand it allows to get the same information but I'm wondering why 
the property name is limited to -frs- in this case. What about a 
non-power delivery USB-C connector ?

Moreover, power-opmode property support is already merged in typec class:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/usb/typec/class.c?h=v5.10-rc1&id=12f3467b0d28369d3add7a0deb65fdac9b503c90
and stusb160x driver uses it :(

So, do I need to modify stusb160x driver (and bindings) to take into 
account this USB PD specific property?

Regards,
Amelie

> Please ack it if you are okay with it.
> 
> Rob
> 
> 
>> +    description: Determines the power operation mode that the Type C connector
>> +      will support and will advertise through CC pins when it has no power
>> +      delivery support.
>> +      - "default" corresponds to default USB voltage and current defined by the
>> +        USB 2.0 and USB 3.2 specifications, 5V 500mA for USB 2.0 ports and
>> +        5V 900mA or 1500mA for USB 3.2 ports in single-lane or dual-lane
>> +        operation respectively.
>> +      - "1.5A" and "3.0A", 5V 1.5A and 5V 3.0A respectively, as defined in USB
>> +        Type-C Cable and Connector specification, when Power Delivery is not
>> +        supported.
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#definitions/string
>> +    enum:
>> +      - default
>> +      - 1.5A
>> +      - 3.0A
>> +
>>     # The following are optional properties for "usb-c-connector" with power
>>     # delivery support.
>>     source-pdos:
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
