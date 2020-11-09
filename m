Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FF72AC04B
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Nov 2020 16:55:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CCAEC3FAE2;
	Mon,  9 Nov 2020 15:55:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0C8AC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Nov 2020 15:55:08 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A9Fkdt6032585; Mon, 9 Nov 2020 16:54:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=UBGo5D2wKRwZPFXsITIZTn6DFn/APPci5EP/rirzjqc=;
 b=J9K8BqLjt5FzSEbfXkVSs+P046W5I2QQZI+Utl1BTaCkgsaGBrV4VkyjNnNHyrCadrWp
 hKYCPrca47AIE4qRAHuPg/aFg+ve/12zC+zGaSW4m5zky3sHzV0TorCtxdLFjBVNBzNP
 Xfu4JDrxLsSM9F2t3oyXbuQUUG0Dim+ApvP/k9PjGxmYKkXGJNSg7KUaapwnOAlY+TCv
 iz9DBemlzLrai6E7KDPTfJCfPLmlWs6F8XhF73Nq/xdqtABINi9kidS6S8cMdTnjoLFe
 FkHaZbxnJraXF0QQT3VDiMqoHe1GOJI0cUS6ddS4NLFsRKAXhiDJ+BgpMFAHfiFnZ2RW HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34nj80jvyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Nov 2020 16:54:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D4C4E10002A;
 Mon,  9 Nov 2020 16:54:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BBD1322D74A;
 Mon,  9 Nov 2020 16:54:44 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Nov
 2020 16:54:43 +0100
To: Rob Herring <robh+dt@kernel.org>
References: <20201106165805.31534-1-amelie.delaunay@st.com>
 <20201106165805.31534-2-amelie.delaunay@st.com>
 <CAL_Jsq+A=nixpdrT3Omq7Osat=_Egb5g6VGao=gY4CEssOe+xQ@mail.gmail.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <a0e0bde1-5657-c0f9-9123-6b1dd5a1bd73@st.com>
Date: Mon, 9 Nov 2020 16:54:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+A=nixpdrT3Omq7Osat=_Egb5g6VGao=gY4CEssOe+xQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_08:2020-11-05,
 2020-11-09 signatures=0
Cc: devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Badhri Jagan Sridharan <badhri@google.com>, Jun Li <lijun.kernel@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v5 1/5] dt-bindings: connector: add
 typec-power-opmode property to usb-connector
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

On 11/9/20 4:03 PM, Rob Herring wrote:
> On Fri, Nov 6, 2020 at 10:58 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:
>>
>> Power operation mode may depends on hardware design, so, add the optional
>> property typec-power-opmode for usb-c connector to select the power
>> operation mode capability.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
>> ---
>> Hi Bahdri, Rob,
>>
>> I've added the exlusion with FRS property, but new FRS property name
>> should be use here so, be careful.
>>
>> ---
>>   .../bindings/connector/usb-connector.yaml     | 24 +++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> index 62781518aefc..a84464b3e1f2 100644
>> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> @@ -93,6 +93,24 @@ properties:
>>         - device
>>         - dual
>>
>> +  typec-power-opmode:
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
> 
> Use the enums here. Unless you want to define it as actual current as
> a numerical value.

If I understand your point correctly, I think I should remove allOf here 
and stick with what is done to describe power-role and data-role 
property. Right ?

Regards,
Amelie
> 
> Rob
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
