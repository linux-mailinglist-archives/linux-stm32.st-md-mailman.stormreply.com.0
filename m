Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D458C6F76
	for <lists+linux-stm32@lfdr.de>; Thu, 16 May 2024 02:24:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4B9FC6C838;
	Thu, 16 May 2024 00:24:06 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56652C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2024 00:23:59 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4250B87EF7;
 Thu, 16 May 2024 02:23:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715819038;
 bh=jG1kyEHStM/G4Bx69cnZ9ynPKSC8S8yZPDjm5wi4i4Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ayMHRsU9bOUstMRI7s2hcFPlwsAQONW2aXEHzKPB8nCX3D6FtQMDFRMmx1mxxi+BP
 5ky2+jR2Jr3j7N0oAkQuIMB+5Gl5K26MjsPPaWL7KqmRCLUOMfwxgfCTPMONCIvkqL
 SqGAcXwUuRuUAmMzIxvfEr7IXpjwl7iDxtsZw+IJPQOcqufFWg/DUrlpKxNbAkGhJ0
 aN6/aP1dRQ5VlfzYKYii3cU7PolA1UvwvCtDYMZNtnquw2M7qcDXLoe0wBC6ECr1QU
 FdLw9aAbGx587PlLFTMQT5i+kTGmfznpVsaumkZFEwNZ0Aa56qrto+S+bHv6g0/6WD
 1TfGLe9G7saKw==
Message-ID: <9c1d80eb-03e7-4d39-b516-cbcae0d50e4a@denx.de>
Date: Thu, 16 May 2024 02:23:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240426125707.585269-1-christophe.roullier@foss.st.com>
 <20240426125707.585269-11-christophe.roullier@foss.st.com>
 <43024130-dcd6-4175-b958-4401edfb5fd8@denx.de>
 <8bf3be27-3222-422d-bfff-ff67271981d8@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <8bf3be27-3222-422d-bfff-ff67271981d8@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 10/11] ARM: dts: stm32: add ethernet1
 and ethernet2 for STM32MP135F-DK board
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

On 5/13/24 6:01 PM, Alexandre TORGUE wrote:
> Hi Marek

Hi,

> On 4/26/24 17:44, Marek Vasut wrote:
>> On 4/26/24 2:57 PM, Christophe Roullier wrote:
>>> Add dual Ethernet:
>>> -Ethernet1: RMII with crystal
>>> -Ethernet2: RMII without crystal
>>> PHYs used are SMSC (LAN8742A)
>>>
>>> With Ethernet1, we can performed WoL from PHY instead of GMAC point
>>> of view.
>>> (in this case IRQ for WoL is managed as wakeup pin and configured
>>> in OS secure).
>>
>> How does the Linux PHY driver process such a PHY IRQ ?
>>
>> Or is Linux unaware of the PHY IRQ ? Doesn't that cause issues ?
> 
> In this case, we want to have an example to wakeup the system from 
> Standby low power mode (VDDCPU and VDD_CORE off) thanks to a magic 
> packet detected by the PHY. The PHY then assert his interrupt output 
> signal.
> On MP13 DK platform, this PHY signal is connected to a specific GPIO
> aka "Wakeup pins" (only 6 wakeup pins an MP13). Those specific GPIOs are 
> handled by the PWR peripheral which is controlled by the secure OS.

What does configure the PHY for this wakeup mode ?

> On WoL packet, the Secure OS catches the PHY interrupt and uses 
> asynchronous notification mechanism to warn Linux (on our platform we 
> use a PPI). On Linux side, Optee core driver creates an irq 
> domain/irqchip triggered on the asynchronous notification. Each device 
> which use a wakeup pin need then to request an IRQ on this "Optee irq 
> domain".
> 
> This OPTEE irq domain will be pushed soon.

I suspect it might make sense to add this WoL part separately from the 
actual ethernet DT nodes, so ethernet could land and the WoL 
functionality can be added when it is ready ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
