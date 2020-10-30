Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D692A00AB
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Oct 2020 10:04:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42E86C3FAD5;
	Fri, 30 Oct 2020 09:04:29 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 087BFC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Oct 2020 09:04:25 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CMxFh1lXdz1rwvG;
 Fri, 30 Oct 2020 10:04:24 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CMxFh0ZYGz1qsWp;
 Fri, 30 Oct 2020 10:04:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 54Z8qHTvgzlZ; Fri, 30 Oct 2020 10:04:21 +0100 (CET)
X-Auth-Info: h+X3VqnfpQvZL26n7uCjlXiwwu3HcfJAFYZjnmkI1BM=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 30 Oct 2020 10:04:21 +0100 (CET)
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
 SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <4ac236b3-b980-f653-f644-53e586570724@st.com>
 <4bb5d090-df39-8d58-808f-1fe33c54de14@pengutronix.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <10efa774-946d-b02d-2d0c-37d451cb3ccd@denx.de>
Date: Fri, 30 Oct 2020 10:04:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4bb5d090-df39-8d58-808f-1fe33c54de14@pengutronix.de>
Content-Language: en-US
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [GIT PULL] STM32 DT fixes for v5.10 #1
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

On 10/28/20 6:38 PM, Ahmad Fatoum wrote:
> Hello Alex,

Hi,

> On 10/28/20 4:28 PM, Alexandre Torgue wrote:
>> Hi Arnd, Olof and Kevin,
>>
>> On v5.10-rc1 STM32 boards cannot boot. It is linked to a change in regulator framework which highlights that our supplies are not well described. This PR fixes it for STM32 boards that I have on my desk: ED1 and DKx.
> 
> Which change triggered the regression?

I think it might be:
aea6cb99703e ("regulator: resolve supply after creating regulator")
which landed in 5.4.73 as
0120ec32a777 ("regulator: resolve supply after creating regulator")

>> I assume that same patch has to be done for other STM32 boards, but as I don't have schematics I can't provide it. So a round2 has to be done for:
>> - stinger96
>> - MC-1
>> - Odyssey SOM
>> - DHCOR /DHCOM
>>
>> Mani, Marek, Ahmad, Marcin can you please have a look on it and provide patches (then I'll provide round2). Thanks in advance.
> 
> Your change doesn't look right. If I set vref_ddr-supply to a fixed regulator,
> the MC-1 now boots again as well, but that seems to just mask the real issue:
> 
>   - vref_ddr is an _output_ of the PMIC, why should one have to specify a supply for it?
> 
>   - This is actually incompatible with the binding. vref_ddr-supply isn't specified
>     as an allowed property (not to mention a required one)
> 
>   - Isn't the kernel supposed to stay compatible to old device trees?
> 
> I think the stpmic driver is at fault here and that the regulator framework change just
> made that apparent.

I agree updating the DT is not the right approach.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
