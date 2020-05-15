Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 070631D48F9
	for <lists+linux-stm32@lfdr.de>; Fri, 15 May 2020 11:03:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 301AFC36B10;
	Fri, 15 May 2020 09:03:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A8A5C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 May 2020 09:02:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04F8wViO006970; Fri, 15 May 2020 11:02:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=hq0yOpTmRS0k57eXjZHsS0+DHOsIgaIpHyTmBrD4HFk=;
 b=Opl2LUPYsf6vW2IRAL6IE1rzsUXTolLe7tnktfb38zOD5SkHAEUlJ6+2JfLhQCyfDomd
 lJXikqCAu3c5LBiWAi7l8l8xLw4Pj5vl1hgc5sH37vlUt6O3kj+3VSZjlIWc+l7whmbD
 ufh2PmS4QIUZ3L3+Rc5t8TrXABB81F8N21LGtXs/PB41S2Kr9qCOSrUwlzkg7na/JYNU
 21c/X2T4PIgUEOu6z2LpuYnt+u0PX4AR4QaapWqOgq8rfcwA4VBcq7V9nnXgwFk7o3VS
 aqIImLK7VqWYkLiJmeKFWGm0oRGx81rEinNHJYeFgd0yrpwwipv/q8/4LS6+BEjjT/4P qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3100vps1ep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 May 2020 11:02:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5EA7910002A;
 Fri, 15 May 2020 11:02:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4216F2A531B;
 Fri, 15 May 2020 11:02:38 +0200 (CEST)
Received: from [10.211.11.124] (10.75.127.46) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 15 May
 2020 11:02:37 +0200
To: Rob Herring <robh@kernel.org>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <1588756279-17289-7-git-send-email-christophe.kerello@st.com>
 <20200514150028.GB28489@bogus> <9ffc04cf-137f-5ee5-57ff-39a876abfb34@st.com>
 <CAL_JsqLTyDHBHncrQqtPdkCNgKDkEbp+ts7BOeqWmGv64kcAsg@mail.gmail.com>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <3c860c17-f8dd-6130-861b-afccb9202093@st.com>
Date: Fri, 15 May 2020 11:02:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLTyDHBHncrQqtPdkCNgKDkEbp+ts7BOeqWmGv64kcAsg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-15_03:2020-05-14,
 2020-05-15 signatures=0
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 =?UTF-8?Q?Marek_Va=c5=a1ut?= <marex@denx.de>, Vignesh R <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On 5/14/20 7:55 PM, Rob Herring wrote:
> On Thu, May 14, 2020 at 11:35 AM Christophe Kerello
> <christophe.kerello@st.com> wrote:
>>
>> Hi Rob,
>>
>> On 5/14/20 5:00 PM, Rob Herring wrote:
>>> On Wed, May 06, 2020 at 11:11:15AM +0200, Christophe Kerello wrote:
>>>> These bindings can be used on SOCs where the FMC2 NAND controller is
>>>> in standalone. In case that the FMC2 embeds 2 controllers (an external
>>>> bus controller and a raw NAND controller), the register base and the
>>>> clock will be defined in the parent node. It is the reason why the
>>>> register base address and the clock are now optional.
>>>>
>>>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>>>> ---
>>>>    .../devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml   | 19 ++++++++++---------
>>>>    1 file changed, 10 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
>>>> index b059267..68fac1a 100644
>>>> --- a/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
>>>> +++ b/Documentation/devicetree/bindings/mtd/st,stm32-fmc2-nand.yaml
>>>> @@ -18,13 +18,15 @@ properties:
>>>>
>>>>      reg:
>>>>        items:
>>>> -      - description: Registers
>>>> +      - description: Registers (optional)
>>>
>>> The only thing that can be optional are the last entries. You have to do
>>> a 'oneOf' with 6 entries and 7 entries.
>>
>> Ok, so the way to describe the reg property in my case should be:
>>          reg:
>>            oneOf:
>>              - description: FMC2 embeds the NFC controller in standalone.
>>                items:
>>                  - description: Registers
>>                  - description: Chip select 0 data
>>                  - description: Chip select 0 command
>>                  - description: Chip select 0 address space
>>                  - description: Chip select 1 data
>>                  - description: Chip select 1 command
>>                  - description: Chip select 1 address space
>>
>>              - description: FMC2 embeds the NFC controller and the EBI
>>                  controller.
>>                items:
>>                  - description: Chip select 0 data
>>                  - description: Chip select 0 command
>>                  - description: Chip select 0 address space
>>                  - description: Chip select 1 data
>>                  - description: Chip select 1 command
>>                  - description: Chip select 1 address space
>>
>>>
>>> And where's your new compatible string for this different h/w?
>>
>>   From NFC controller point of view, it is the same HW.
> 
> That's what everyone says until they have some quirk or integration
> difference to handle.
> 
>> In the case that we have 2 controllers embedded, the register base is
>> shared.
>> The NFC driver will check at probe time the compatible string of its
>> parent node.
>> In case that it is "st,stm32mp1-fmc2-ebi", then the driver will find the
>> register base in the parent node (EBI node), otherwise it will find it
>> in the NFC node.
>> Is it better to have 2 compatible strings (one for each reg description)
>> than checking the parent's compatible string and have only one
>> compatible string?
> 
> Why not just put the register base into the child node too? While
> overlapping 'reg' regions for siblings is bad, it's fine for child
> nodes. I guess since there are chip selects for the child nodes that
> may not work here.
> 
> It doesn't hurt to have another compatible. You can always make the
> old one a fallback. With different compatibles you can make sure reg
> has the right number of entries.
> 
> Rob
> 

I will add a new compatible string to handle the reg property.
It will be part of v5.

Regards,
Christophe Kerello.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
