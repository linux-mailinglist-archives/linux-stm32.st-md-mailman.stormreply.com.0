Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A1A1B71F5
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 12:27:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1651BC36B0B;
	Fri, 24 Apr 2020 10:27:51 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0A24C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 10:27:49 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 497r383075z1r3dY;
 Fri, 24 Apr 2020 12:27:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 497r381DwHz1qr4s;
 Fri, 24 Apr 2020 12:27:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id dolzM1ggvfB3; Fri, 24 Apr 2020 12:27:45 +0200 (CEST)
X-Auth-Info: sKNCq0LDWdPK1vCn4vD4jzbxqTdPHMFIWhlETY4t0i0=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 24 Apr 2020 12:27:45 +0200 (CEST)
To: Lee Jones <lee.jones@linaro.org>,
 Christophe Kerello <christophe.kerello@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-3-git-send-email-christophe.kerello@st.com>
 <20200424074517.GN3612@dell>
From: Marek Vasut <marex@denx.de>
Message-ID: <8b625f1c-9ded-c07a-a20e-8cd44c1ca46d@denx.de>
Date: Fri, 24 Apr 2020 12:27:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200424074517.GN3612@dell>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 4/24/20 9:45 AM, Lee Jones wrote:
> On Wed, 15 Apr 2020, Christophe Kerello wrote:
> 
>> The driver adds the support for the STMicroelectronics FMC2 controller
>> found on STM32MP SOCs.
>>
>> The FMC2 functional block makes the interface with: synchronous and
>> asynchronous static memories (such as PSNOR, PSRAM or other
>> memory-mapped peripherals) and NAND flash memories.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
>> ---
>> Changes in v2:
>>  - remove ops from stm32_fmc2 structure
>>  - add 2 APIs to manage FMC2 enable/disable
>>  - add 2 APIs to manage FMC2 NWAIT shared signal
>>
>>  drivers/mfd/Kconfig            |  12 +++
>>  drivers/mfd/Makefile           |   1 +
>>  drivers/mfd/stm32-fmc2.c       | 136 +++++++++++++++++++++++++
>>  include/linux/mfd/stm32-fmc2.h | 225 +++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 374 insertions(+)
>>  create mode 100644 drivers/mfd/stm32-fmc2.c
>>  create mode 100644 include/linux/mfd/stm32-fmc2.h
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index 2b20329..5260582 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1922,6 +1922,18 @@ config MFD_ROHM_BD71828
>>  	  Also included is a Coulomb counter, a real-time clock (RTC), and
>>  	  a 32.768 kHz clock gate.
>>  
>> +config MFD_STM32_FMC2
>> +	tristate "Support for FMC2 controllers on STM32MP SoCs"
>> +	depends on MACH_STM32MP157 || COMPILE_TEST
>> +	select MFD_CORE
>> +	select REGMAP
>> +	select REGMAP_MMIO
>> +	help
>> +	  Select this option to enable STM32 FMC2 driver used for FMC2 External
>> +	  Bus Interface controller and FMC2 NAND flash controller. This driver
>> +	  provides core support for the STM32 FMC2 controllers, in order to use
>> +	  the actual functionality of the device other drivers must be enabled.
> 
> Not sure how many times I have to say this before people stop
> attempting to pass these kinds of relationships off as MFDs:
> 
> A memory device and its bus is not an MFD.  In a similar vain to the
> thousands of USB, I2C, SPI, PCI and the like devices that aren't MFDs
> either.
> 
> Please find another way to associate your device with its bus.

This FMC2 is however an IP which can either operate external devices
(like ethernet chip on this parallel bus) or external flashes (like NOR
and NAND chips).

Can you provide a suggestion how this should be handled, if not as MFD?
It seems to me, that this is a Multi-Function Device .

If this discussion is a recurring topic, is there some documentation
which explains how such devices should be handled ?

Thank you
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
