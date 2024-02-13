Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7913852E80
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 11:58:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DA5AC71285;
	Tue, 13 Feb 2024 10:58:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2066EC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 10:58:21 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41DA9Si1026396; Tue, 13 Feb 2024 11:58:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=1J5ztYg9uk0Ni/zb1+iLOfL8R7ELBVGeERYFdVqxo4k=; b=4l
 KeigsmJRyRSZpDB1GGpZeGwsU+pxVgR5svCf0mUhv4HRWOKBopyE/cjDw8pfG5MY
 1X/2MSOr7n3mRjNQ4NCjlj0G24eGjJ2rCmnGP94JlQYEtqJmvPV472r8hkSgONFp
 sOo1C7E6uory1zMAPzC6LkjgG/RvRdi6CwwfAMBRhwfyxj3HiY+yDWtvpexGvAst
 NNhTjTGSq/P52etuCNGLWx27555zq/dpT4S5P07XC7thxZfm2zHYxq+ztRFYnQk8
 MZn4FFIxbLMYVjkziRIhgZHwuJPJ9Im66MWQugZk92r3V8+t+R2esBoS7GlcRCz/
 RykY3g4r9eUJq1U4xnIA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w6kk4r3h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Feb 2024 11:58:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5C7D140049;
 Tue, 13 Feb 2024 11:58:05 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E12A22D19E;
 Tue, 13 Feb 2024 11:57:28 +0100 (CET)
Received: from [10.201.22.200] (10.201.22.200) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 13 Feb
 2024 11:57:27 +0100
Message-ID: <4ec4a926-fd1c-44e7-990b-4af0e09b9224@foss.st.com>
Date: Tue, 13 Feb 2024 11:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-9-christophe.kerello@foss.st.com>
 <20240212-squeak-mortality-5a53a4d1039c@spud>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20240212-squeak-mortality-5a53a4d1039c@spud>
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_05,2024-02-12_03,2023-05-22_02
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, vigneshr@ti.com,
 richard@nod.at, linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 08/12] dt-bindings: mtd: st,
	stm32: add MP25 support
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



On 2/12/24 19:38, Conor Dooley wrote:
> On Mon, Feb 12, 2024 at 06:48:18PM +0100, Christophe Kerello wrote:
>> Add 2 new compatible strings to support MP25 SOC.
>> MP25 SOC supports up to 4 chip select.
> 
> Again, please explain why the new device is not compatible with the
> existing ones. Also, please explain why two compatibles are required for
> the mp25.
> 

Hi Conor,

FMC2 IP supports up to 4 chip select. On MP1 SoC, only 2 of them are 
available when on MP25 SoC, the 4 chip select are available.

MP1 SoC also embeds revision 1.1 of the FMC2 IP when MP25 SoC embeds 
revision 2.0 of the FMC2 IP.

I will add this explanation in the commit message.

Regards,
Christophe Kerello.

> Thanks,
> Conor.
> 
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>> ---
>>   .../bindings/mtd/st,stm32-fmc2-nand.yaml      | 58 ++++++++++++++++++-
>>   1 file changed, 57 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
>> index e72cb5bacaf0..33a753c8877b 100644
>> --- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
>> @@ -14,10 +14,12 @@ properties:
>>       enum:
>>         - st,stm32mp15-fmc2
>>         - st,stm32mp1-fmc2-nfc
>> +      - st,stm32mp25-fmc2
>> +      - st,stm32mp25-fmc2-nfc
>>   
>>     reg:
>>       minItems: 6
>> -    maxItems: 7
>> +    maxItems: 13
>>   
>>     interrupts:
>>       maxItems: 1
>> @@ -92,6 +94,60 @@ allOf:
>>               - description: Chip select 1 command
>>               - description: Chip select 1 address space
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: st,stm32mp25-fmc2
>> +    then:
>> +      properties:
>> +        reg:
>> +          items:
>> +            - description: Registers
>> +            - description: Chip select 0 data
>> +            - description: Chip select 0 command
>> +            - description: Chip select 0 address space
>> +            - description: Chip select 1 data
>> +            - description: Chip select 1 command
>> +            - description: Chip select 1 address space
>> +            - description: Chip select 2 data
>> +            - description: Chip select 2 command
>> +            - description: Chip select 2 address space
>> +            - description: Chip select 3 data
>> +            - description: Chip select 3 command
>> +            - description: Chip select 3 address space
>> +
>> +        clocks:
>> +          maxItems: 1
>> +
>> +        resets:
>> +          maxItems: 1
>> +
>> +      required:
>> +        - clocks
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: st,stm32mp25-fmc2-nfc
>> +    then:
>> +      properties:
>> +        reg:
>> +          items:
>> +            - description: Chip select 0 data
>> +            - description: Chip select 0 command
>> +            - description: Chip select 0 address space
>> +            - description: Chip select 1 data
>> +            - description: Chip select 1 command
>> +            - description: Chip select 1 address space
>> +            - description: Chip select 2 data
>> +            - description: Chip select 2 command
>> +            - description: Chip select 2 address space
>> +            - description: Chip select 3 data
>> +            - description: Chip select 3 command
>> +            - description: Chip select 3 address space
>> +
>>   required:
>>     - compatible
>>     - reg
>> -- 
>> 2.25.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
