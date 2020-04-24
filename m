Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB061B736B
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 13:48:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7855C36B0B;
	Fri, 24 Apr 2020 11:48:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 150CEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 11:48:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OBko3N010590; Fri, 24 Apr 2020 13:47:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=eDUxGG9O4i5CdabzQ9g1DJn7cKAT0JlJmvP3BX0WRjc=;
 b=ZSjPsri72sQVac67WI7XcR73DLBOrEs+IFxub11JXnwGf/+djrmTBhHTPpY+jfiQ/WAJ
 u32nNodWmPwoNX27zKntZ+3BHTLirru6VZddRYA+HX+41Kysw0D/eE5QzvjM0To7pD/3
 zL/F/eiZLOilSNGdzRUyeNtn5Dip/94O0Oqi5WGfthyxetjorWr04UQMfZFrY730V6PK
 ZhR/d3m8q4ZsaXGVo+NXpyXb3YGmJ4dzAA3LZOQ4+iCj3Bfn6NbBOEc3e3pPXNjpyuBl
 SEbJvwzKhBXtYPy/9I0jWnbm2dZU1cWGOCgLAsZHRTt6hg+iqM3q8EPTDHvCkwGT38df qA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30freh31er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 13:47:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EBD19100034;
 Fri, 24 Apr 2020 13:47:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B19E52B47A0;
 Fri, 24 Apr 2020 13:47:36 +0200 (CEST)
Received: from [10.211.2.59] (10.75.127.51) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Apr
 2020 13:47:35 +0200
To: Marek Vasut <marex@denx.de>, Lee Jones <lee.jones@linaro.org>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-3-git-send-email-christophe.kerello@st.com>
 <20200424074517.GN3612@dell> <8b625f1c-9ded-c07a-a20e-8cd44c1ca46d@denx.de>
 <20200424105053.GC8414@dell> <e5e6c279-28d0-f423-aa6d-5c7aca563352@denx.de>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <268ea231-eb4a-6144-c632-1bc8e9f21582@st.com>
Date: Fri, 24 Apr 2020 13:47:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e5e6c279-28d0-f423-aa6d-5c7aca563352@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_04:2020-04-23,
 2020-04-24 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 tony@atomide.com, richard@nod.at, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 02/12] mfd: stm32-fmc2: add STM32 FMC2
 controller driver
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



On 4/24/20 1:06 PM, Marek Vasut wrote:
> On 4/24/20 12:50 PM, Lee Jones wrote:
>> On Fri, 24 Apr 2020, Marek Vasut wrote:
>>
>>> On 4/24/20 9:45 AM, Lee Jones wrote:
>>>> On Wed, 15 Apr 2020, Christophe Kerello wrote:
>>>>
>>>>> The driver adds the support for the STMicroelectronics FMC2 controller
>>>>> found on STM32MP SOCs.
>>>>>
>>>>> The FMC2 functional block makes the interface with: synchronous and
>>>>> asynchronous static memories (such as PSNOR, PSRAM or other
>>>>> memory-mapped peripherals) and NAND flash memories.
>>>>>
>>>>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>>>>> ---
>>>>> Changes in v2:
>>>>>   - remove ops from stm32_fmc2 structure
>>>>>   - add 2 APIs to manage FMC2 enable/disable
>>>>>   - add 2 APIs to manage FMC2 NWAIT shared signal
>>>>>
>>>>>   drivers/mfd/Kconfig            |  12 +++
>>>>>   drivers/mfd/Makefile           |   1 +
>>>>>   drivers/mfd/stm32-fmc2.c       | 136 +++++++++++++++++++++++++
>>>>>   include/linux/mfd/stm32-fmc2.h | 225 +++++++++++++++++++++++++++++++++++++++++
>>>>>   4 files changed, 374 insertions(+)
>>>>>   create mode 100644 drivers/mfd/stm32-fmc2.c
>>>>>   create mode 100644 include/linux/mfd/stm32-fmc2.h
>>>>>
>>>>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>>>>> index 2b20329..5260582 100644
>>>>> --- a/drivers/mfd/Kconfig
>>>>> +++ b/drivers/mfd/Kconfig
>>>>> @@ -1922,6 +1922,18 @@ config MFD_ROHM_BD71828
>>>>>   	  Also included is a Coulomb counter, a real-time clock (RTC), and
>>>>>   	  a 32.768 kHz clock gate.
>>>>>   
>>>>> +config MFD_STM32_FMC2
>>>>> +	tristate "Support for FMC2 controllers on STM32MP SoCs"
>>>>> +	depends on MACH_STM32MP157 || COMPILE_TEST
>>>>> +	select MFD_CORE
>>>>> +	select REGMAP
>>>>> +	select REGMAP_MMIO
>>>>> +	help
>>>>> +	  Select this option to enable STM32 FMC2 driver used for FMC2 External
>>>>> +	  Bus Interface controller and FMC2 NAND flash controller. This driver
>>>>> +	  provides core support for the STM32 FMC2 controllers, in order to use
>>>>> +	  the actual functionality of the device other drivers must be enabled.
>>>>
>>>> Not sure how many times I have to say this before people stop
>>>> attempting to pass these kinds of relationships off as MFDs:
>>>>
>>>> A memory device and its bus is not an MFD.  In a similar vain to the
>>>> thousands of USB, I2C, SPI, PCI and the like devices that aren't MFDs
>>>> either.
>>>>
>>>> Please find another way to associate your device with its bus.
>>>
>>> This FMC2 is however an IP which can either operate external devices
>>> (like ethernet chip on this parallel bus) or external flashes (like NOR
>>> and NAND chips).
>>
>> I'm sure that it *can*.  Although that's not its main purpose.
> 
> I use it to operate KSZ8851-16MLL ethernet chip, which has async bus
> interface. Linux just didn't have support for that mode of operation
> thus far and the FMC was used to operate NANDs and NORs only. This
> series, or rather, the first three patches in this series, add support
> for operating other bus devices, like this ethernet controller.
> 
>> The
>> clue is in the nomenclature ("Flexible *Memory* Controller").  Nor is
>> it how the device is being used in this submission:
>>
>>    "The FMC2 functional block makes the interface with: synchronous and
>>     asynchronous static memories (such as PSNOR, PSRAM or other
>>     memory-mapped peripherals) and NAND flash memories."
>>
>> As I mentioned, this is just another memory device and its bus.
> 
> I don't think it's _just_ a memory controller, it's more universal than
> that, see above. Note that SRAM interface basically boils down to
> anything which has external parallel bus, e.g. Davicom DM9000, that
> KSZ8851-16MLL etc.
> 
>>> Can you provide a suggestion how this should be handled, if not as MFD?
>>> It seems to me, that this is a Multi-Function Device .
>>
>> Simply move it into the MTD or Memory subsystems and set up the
>> dependencies via Kconfig.
>>
>>> If this discussion is a recurring topic, is there some documentation
>>> which explains how such devices should be handled ?
>>
>> Not that I'm aware of.
> 
> I see.
>

Hi Lee, Marek,

I will move this source code in the FMC2 bus driver. I think that I 
should be able to manage the 2 controllers with 2 drivers (the FMC2 bus 
driver and the FMC2 raw NAND driver). I will have to modify some part of 
the proposed bindings, and some updates will have to be done in the FMC2 
bus driver. All these modifications will be part of V3.

Regards,
Christophe Kerello.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
