Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC9F715DCE
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 13:50:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B68DAC6A614;
	Tue, 30 May 2023 11:50:51 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 063C4C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 11:50:50 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9609A8479B;
 Tue, 30 May 2023 13:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685447450;
 bh=sYTeSQZR8nPFYltLofKFJmmA9gZTRkwev6OoPQuW8wg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pXY1khZArTCe+Pgv50v6FWW9dF1ITEOY3smGGgpNXrsF8bslfPdHWjzGwrHNFm6zh
 mCNEPiYnRiRUBiwc2oDWCcWf8tk/uUq2LBXwVP/uL71K170UVJJzs+kby5V9moPUuL
 grFx2lc04xxPcsW5eowXgU1q2eMytW1zX842NATtaPqO2mstFtHGeocoERCdiDDaI9
 3No0Xw7HXtbyziJrlO5ZgC4uOmr34Or0NipIxy5FKlrfmad/rvJlSfoUhaInXv9MHg
 6rxtSFf09IE3Bj5iq88AVy1ejypNqrzH1muK92YX1fjE1HpbHXGNpVo/0rsq0oe6Pl
 9dSKeMrDpcYNA==
Message-ID: <133c8b4a-8680-f613-807a-2d7931d0a186@denx.de>
Date: Tue, 30 May 2023 13:50:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20230518011246.438097-1-marex@denx.de>
 <PAXPR10MB471850924065C987981634C1F14B9@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <PAXPR10MB471850924065C987981634C1F14B9@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>
Subject: Re: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing detach
 mailbox for emtrion emSBC-Argon
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

On 5/30/23 10:43, Arnaud POULIQUEN wrote:
> Hello Marek,

Hi,

> ST Restricted
> 
>> -----Original Message-----
>> From: Linux-stm32 <linux-stm32-bounces@st-md-mailman.stormreply.com>
>> On Behalf Of Marek Vasut
>> Sent: Thursday, May 18, 2023 3:13 AM
>> To: linux-arm-kernel@lists.infradead.org
>> Cc: Marek Vasut <marex@denx.de>; devicetree@vger.kernel.org; Conor
>> Dooley <conor+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Richard Cochran
>> <richardcochran@gmail.com>; Rob Herring <robh+dt@kernel.org>; Maxime
>> Coquelin <mcoquelin.stm32@gmail.com>; linux-stm32@st-md-
>> mailman.stormreply.com; kernel@dh-electronics.com
>> Subject: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing detach
>> mailbox for emtrion emSBC-Argon
>>
>> Add missing "detach" mailbox to this board to permit the CPU to inform the
>> remote processor on a detach. This signal allows the remote processor
>> firmware to stop IPC communication and to reinitialize the resources for a
>> re-attach.
>>
>> Without this mailbox, detach is not possible and kernel log contains the
>> following warning to, so make sure all the STM32MP15xx platform DTs are in
>> sync regarding the mailboxes to fix the detach issue and the warning:
>> "
>> stm32-rproc 10000000.m4: mbox_request_channel_byname() could not
>> locate channel named "detach"
>> "
>>
>> Fixes: 6257dfc1c412 ("ARM: dts: stm32: Add coprocessor detach mbox on
>> stm32mp15x-dkx boards")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: Richard Cochran <richardcochran@gmail.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: kernel@dh-electronics.com
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> ---
>>   arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
>> b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
>> index b01470a9a3d53..82061c9186338 100644
>> --- a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
>> +++ b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
>> @@ -366,8 +366,8 @@ &iwdg2 {
>>   &m4_rproc {
>>   	memory-region = <&retram>, <&mcuram>, <&mcuram2>,
>> <&vdev0vring0>,
>>   			<&vdev0vring1>, <&vdev0buffer>;
>> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
>> -	mbox-names = "vq0", "vq1", "shutdown";
>> +	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
>> +	mbox-names = "vq0", "vq1", "shutdown", "detach";
> 
> Why do you want to add the detach mailbox?
> It looks to me here that you want to clean the warning message, right?

Yes

> The detach is used in a particular usecase where the main processor
> is  shutdown while the coprocessor is still running.
> I would prefer to not enable it by default as it need a specific
> coprocessor Firmware.

Why is it enabled by default on ST boards and left out on all other boards ?

Surely the ST evaluation boards can load and run both types of firmware, 
ones which do use the detach mailbox and ones which do not use the 
detach mailbox , right ?

I assume that if the firmware does not use the detach mailbox, then the 
detach mailbox is just ignored and unused, so there is no problem with 
having it described in the DT in any case ?

And if that's the case, then I would much rather prefer to have all the 
boards describe the same set of mailboxes, so they don't diverge . What 
do you think ?

> Rather than adding unused optional mailbox, I will more in favor
> of having a mbox_request_channel_byname_optional helper or
> something similar

See above, I think it is better to have the mailbox described in DT 
always and not use it (the user can always remove it), than to not have 
it described on some boards and have it described on other boards 
(inconsistency).
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
