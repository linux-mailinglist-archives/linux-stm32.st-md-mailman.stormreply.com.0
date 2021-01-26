Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A0E303964
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jan 2021 10:49:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96B69C57182;
	Tue, 26 Jan 2021 09:49:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 516C3C3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jan 2021 09:49:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10Q9WvNK027767; Tue, 26 Jan 2021 10:49:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jc22SqmdYibgtAaJq3omeHgrRDIC9ZnXdKisEe+EuSc=;
 b=EWr7NECmAp0pEZ7oHXJO+C8QvdWfHvPmVLkH3Og0PUxq69dszHgi9j8JctB84suqYLYL
 SDDL5PLSFiHvzz/C80My3uBiZ/MkGsmmYgdvAPzlMr7fNOKykVNnvguF78Daae1Zw/G1
 GggsRmb2V9sZMQc/7dSbLlqIthkTV4ZfYY/2DIgJmVpW5snbHUC42fF0qzGUT65B3gHF
 z4PXfeFnxNVByH8vjDplOoPZ70R5cQVYnOPNDSeJal8rtcZ61SmojYmgc3E1kdOJ4X2R
 aC3TaGDOzCSlZLgeCQ5us87ypr4sZD6S2t5ZHpQ4mBIwDKVyxe9rnciu3itCskmJhOcy YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3689tdrb4r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 10:49:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1464910002A;
 Tue, 26 Jan 2021 10:49:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 012E3230361;
 Tue, 26 Jan 2021 10:49:33 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 26 Jan
 2021 10:49:32 +0100
To: Rob Herring <robh@kernel.org>
References: <20210114171314.18946-1-amelie.delaunay@foss.st.com>
 <20210114171314.18946-2-amelie.delaunay@foss.st.com>
 <20210125214042.GA1049362@robh.at.kernel.org>
From: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Message-ID: <be0f4e5f-3e7d-d178-160b-ea90e9e00147@foss.st.com>
Date: Tue, 26 Jan 2021 10:49:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210125214042.GA1049362@robh.at.kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-26_06:2021-01-25,
 2021-01-26 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: phy:
 phy-stm32-usbphyc: add #clock-cells required property
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

On 1/25/21 10:40 PM, Rob Herring wrote:
> On Thu, Jan 14, 2021 at 06:13:13PM +0100, Amelie Delaunay wrote:
>> usbphyc provides a unique clock called ck_usbo_48m.
>> STM32 USB OTG needs a 48Mhz clock (utmifs_clk48) for Full-Speed operation.
>> ck_usbo_48m is a possible parent clock for USB OTG 48Mhz clock.
>>
>> ck_usbo_48m is available as soon as the PLL is enabled.
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
>> ---
>> No change in v2.
>> ---
>>   .../devicetree/bindings/phy/phy-stm32-usbphyc.yaml          | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
>> index 46df6786727a..4e4da64b8e01 100644
>> --- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
>> +++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
>> @@ -51,6 +51,10 @@ properties:
>>     vdda1v8-supply:
>>       description: regulator providing 1V8 power supply to the PLL block
>>   
>> +  '#clock-cells':
>> +    description: number of clock cells for ck_usbo_48m consumer
>> +    const: 0
>> +
>>   #Required child nodes:
>>   
>>   patternProperties:
>> @@ -102,6 +106,7 @@ required:
>>     - "#size-cells"
>>     - vdda1v1-supply
>>     - vdda1v8-supply
>> +  - '#clock-cells'
> 
> You can't really make new properties required as it's not backwards
> compatible. If things can never work without or the binding has never
> been used, then you can. You just need to spell this out in the commit
> msg.
> 

In fact things can work without this property. But I made this new 
property required because in clock-bindings, #clock-cells property is a 
required property for clock providers.

phy-stm32-usbphyc bindings are only used in stm32mp151.dtsi, which will 
be updated with this new property as soon as this bindings will be reviewed.

I can remove this new property from required ones, but is it okay as 
#clock-cells property is a required property for clock providers?

Regards,
Amelie

>>     - usb-phy@0
>>     - usb-phy@1
>>   
>> @@ -120,6 +125,7 @@ examples:
>>           vdda1v8-supply = <&reg18>;
>>           #address-cells = <1>;
>>           #size-cells = <0>;
>> +        #clock-cells = <0>;
>>   
>>           usbphyc_port0: usb-phy@0 {
>>               reg = <0>;
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
