Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 320891D368E
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 18:35:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB88EC36B12;
	Thu, 14 May 2020 16:35:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3824C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 16:35:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04EGX9LD016146; Thu, 14 May 2020 18:34:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=6CWTZEVuPSh18Gx/dEw+pHe2HNLYt2f856wC0oo8ZZs=;
 b=cIxk/9B0oAGAeKm62YX9t0NG7W/KMHFKjA5dyFQF37+EeX0MB4mo0hNR4z/RS8e0b5vR
 EdJL3EODjAONumZPR8ECm+MFUHtLVBnomkx0w9QNoSpV2Il2jUWBDGAnKF8O/KghUqBa
 45EzhCuopvvmzsYCHsaiqJxy4cFetWdNLv8TP4OZYjOMgMRd28/g/prkc6U3IkGv7SMC
 wgZbBxMcoIT1SpJcq3EEhwB2mXiiLIewFd0MeSoGcporBlDjWaeFGQti9NpJrSmm7xqB
 /OfUcZj72DSxJ5ax8frY5vrK9eYTkAEcbbwHn6+LKTMR71MFvsPoDebwVYr8WggjsSeZ 2Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vymmu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 18:34:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C044A10002A;
 Thu, 14 May 2020 18:34:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AACFD2A7CEA;
 Thu, 14 May 2020 18:34:51 +0200 (CEST)
Received: from [10.211.8.23] (10.75.127.45) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 14 May
 2020 18:34:49 +0200
To: Rob Herring <robh@kernel.org>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-7-git-send-email-christophe.kerello@st.com>
 <20200514150028.GB28489@bogus>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <9ffc04cf-137f-5ee5-57ff-39a876abfb34@st.com>
Date: Thu, 14 May 2020 18:34:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200514150028.GB28489@bogus>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_05:2020-05-14,
 2020-05-14 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, richard@nod.at, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, gregkh@linuxfoundation.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 06/10] dt-bindings: mtd: update STM32
 FMC2 NAND controller documentation
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

On 5/14/20 5:00 PM, Rob Herring wrote:
> On Wed, May 06, 2020 at 11:11:15AM +0200, Christophe Kerello wrote:
>> These bindings can be used on SOCs where the FMC2 NAND controller is
>> in standalone. In case that the FMC2 embeds 2 controllers (an external
>> bus controller and a raw NAND controller), the register base and the
>> clock will be defined in the parent node. It is the reason why the
>> register base address and the clock are now optional.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>> ---
>>   .../devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml   | 19 ++++++++++---------
>>   1 file changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
>> index b059267..68fac1a 100644
>> --- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
>> @@ -18,13 +18,15 @@ properties:
>>   
>>     reg:
>>       items:
>> -      - description: Registers
>> +      - description: Registers (optional)
> 
> The only thing that can be optional are the last entries. You have to do
> a 'oneOf' with 6 entries and 7 entries.

Ok, so the way to describe the reg property in my case should be:
        reg:
          oneOf:
            - description: FMC2 embeds the NFC controller in standalone.
              items:
                - description: Registers
                - description: Chip select 0 data
                - description: Chip select 0 command
                - description: Chip select 0 address space
                - description: Chip select 1 data
                - description: Chip select 1 command
                - description: Chip select 1 address space

            - description: FMC2 embeds the NFC controller and the EBI
                controller.
              items:
                - description: Chip select 0 data
                - description: Chip select 0 command
                - description: Chip select 0 address space
                - description: Chip select 1 data
                - description: Chip select 1 command
                - description: Chip select 1 address space

> 
> And where's your new compatible string for this different h/w?

 From NFC controller point of view, it is the same HW.
In the case that we have 2 controllers embedded, the register base is 
shared.
The NFC driver will check at probe time the compatible string of its 
parent node.
In case that it is "st,stm32mp1-fmc2-ebi", then the driver will find the 
register base in the parent node (EBI node), otherwise it will find it 
in the NFC node.
Is it better to have 2 compatible strings (one for each reg description) 
than checking the parent's compatible string and have only one 
compatible string?

Regards,
Christophe Kerello.

> 
>>         - description: Chip select 0 data
>>         - description: Chip select 0 command
>>         - description: Chip select 0 address space
>>         - description: Chip select 1 data
>>         - description: Chip select 1 command
>>         - description: Chip select 1 address space
>> +    minItems: 6
>> +    maxItems: 7
>>   
>>     interrupts:
>>       maxItems: 1
>> @@ -61,7 +63,6 @@ required:
>>     - compatible
>>     - reg
>>     - interrupts
>> -  - clocks
>>   
>>   examples:
>>     - |
>> @@ -77,13 +78,13 @@ examples:
>>               <0x81000000 0x1000>,
>>               <0x89010000 0x1000>,
>>               <0x89020000 0x1000>;
>> -            interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
>> -            dmas = <&mdma1 20 0x10 0x12000a02 0x0 0x0>,
>> -                   <&mdma1 20 0x10 0x12000a08 0x0 0x0>,
>> -                   <&mdma1 21 0x10 0x12000a0a 0x0 0x0>;
>> -            dma-names = "tx", "rx", "ecc";
>> -            clocks = <&rcc FMC_K>;
>> -            resets = <&rcc FMC_R>;
>> +      interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
>> +      dmas = <&mdma1 20 0x2 0x12000a02 0x0 0x0>,
>> +             <&mdma1 20 0x2 0x12000a08 0x0 0x0>,
>> +             <&mdma1 21 0x2 0x12000a0a 0x0 0x0>;
>> +      dma-names = "tx", "rx", "ecc";
>> +      clocks = <&rcc FMC_K>;
>> +      resets = <&rcc FMC_R>;
>>         #address-cells = <1>;
>>         #size-cells = <0>;
>>   
>> -- 
>> 1.9.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
