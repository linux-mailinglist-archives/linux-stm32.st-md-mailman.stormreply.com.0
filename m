Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F499282DF
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 09:38:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C476DC78017;
	Fri,  5 Jul 2024 07:38:43 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EB28C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 07:38:36 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EEA0E87FC8;
 Fri,  5 Jul 2024 09:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720165115;
 bh=k+wTC2CV9BU+QOh9R0AUaRWABHWjccuUbKu4M+E3rs8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=S72Rz4N48DZexuc1SRDxFJLJEyGk+hhnkm5aZ/tDHrh2um8HPdB2RBX436YFtXu3N
 LZfa5FTuZGZV2r/HYBW3TWRq+pxdqamyA8mcmXS2wOQ3V6dK93laGKH7XeffWmJ8Fl
 7A3C1VjHno443i1OuGjzm8QDeHVTxs4FJSnu1LasY9WtT//lOvMNgOCs51onc2z1f/
 rYJ14qZJ9FJnLJy1pBlkfv4ZF6F2/sEMWhhERsD5dWgHNitTHofVWoh+bIxWjRAEAW
 soVuaHd7IbztNHb8/Kmk8K01zGDRByjf+CDfFgV9DlDTGix4blusMQi8JutPGkq0s3
 1vIsqYKUoxFvw==
Message-ID: <0a664eba-1c97-4222-8c88-2958f4a72672@denx.de>
Date: Fri, 5 Jul 2024 09:34:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240629203706.93145-1-marex@denx.de>
 <f303a45a-3844-485c-8971-f71a46b8b0fb@foss.st.com>
 <f2a1f9c0-3234-4839-b99c-dd33b8dfc268@denx.de>
 <daad8a12-5822-4008-9418-0287476ff424@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <daad8a12-5822-4008-9418-0287476ff424@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: omit unused pinctrl
 groups from stm32mp13 dtb files
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

On 7/5/24 9:06 AM, Alexandre TORGUE wrote:

Hi,

>>> On 6/29/24 22:36, Marek Vasut wrote:
>>>> stm32mp13-pinctrl.dtsi contains nearly all pinctrl groups collected 
>>>> from
>>>> all boards. Most of them end up unused by a board and only waste binary
>>>> space. Add /omit-if-no-ref/ to the groups to scrub the unused groups
>>>> from the dtbs.
>>>>
>>>> Use the following regex to update the file and drop two useless 
>>>> newlines too:
>>>> s@^\t[^:]\+: [^ ]\+ {$@\t/omit-if-no-ref/\r&@
>>>
>>> I understand the aim of this patch but I'm just wondering about DT 
>>> overlay that would need one of those configurations. IMO, in this 
>>> case the DT overlay will not apply.
>>
>> It is always a compromise, either we will have massive ever-growing 
>> base DTs or DTOs would have to ship their own pinmux settings. I think 
>> I am fine with the later option, also that's what the MP15 is doing 
>> already.
> 
> Yes, it is probably the best solution to define pinmux in DTSO that 
> would need a new pin config. For some use case, we will have pinconfig 
> duplication in dtso but as you said it is a good compromise.

Maybe someone else will chime in, let's see what the overall opinion is.

btw I didn't write it is a _good_ compromise, I wrote it is _a_ 
compromise. I think nobody is particularly happy about it one way or the 
other in this case :)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
