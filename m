Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CEC667CF7
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 18:50:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B3DDC65E45;
	Thu, 12 Jan 2023 17:50:38 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A27EC6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 17:50:36 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4A53E854CD;
 Thu, 12 Jan 2023 18:50:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1673545836;
 bh=qu2W7NqtJUjgvf7eHxl057a2RpoLqvtPlVzDvOVesMw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HFsmpbCVzQRhSkAekS3F0KSi/s7ZdbE3FEy4G6JXicAJd/qxLRFY4C6fhwm/3yin5
 Xkoxcv6PNjVgeyzZySaykIdu6TLeHjyyA4EJAe+ehyRhe+E2uRX0xUqCKyVkV8gjTH
 sVF/Q8H+oFIeRc4iTCOJbXiFmyKKOObr0Ejm7iku2obs3kX9lTTSwbZRqhlE9o9trt
 1xC6o5n9j9tqoKTiDCnUFqMUpX88Gf4CytFAEA5vRL+LSjdghIrMXzzaXyEx0+ueky
 cvSNAGz8oCumnF3LH/gcQyWw/UUN1coQ0bI6SPwg8LEKsiH7z0UAIjaXsu1xfAnk7Y
 TSocy/SkKFJ7Q==
Message-ID: <c2f69d59-7c10-53a2-44d3-e3d274da0892@denx.de>
Date: Thu, 12 Jan 2023 18:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
References: <20221216115338.7150-1-marex@denx.de>
 <Y6sHr5kuxUoahlzJ@hovoldconsulting.com> <Y7vou3wAeLP4X+TY@linutronix.de>
 <Y8AHaJIttNga68q4@hovoldconsulting.com>
 <78e3f61f-4f87-9ac5-7c7c-172714da69d3@denx.de>
 <Y8A+1wUUNCU+3Kry@hovoldconsulting.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Y8A+1wUUNCU+3Kry@hovoldconsulting.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-serial@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] serial: stm32: Merge hard IRQ and
 threaded IRQ handling into single IRQ handler
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

On 1/12/23 18:09, Johan Hovold wrote:
> On Thu, Jan 12, 2023 at 05:38:48PM +0100, Marek Vasut wrote:
>> On 1/12/23 14:13, Johan Hovold wrote:
>    
>>> The author did not seem to think this was stable material as there is no
>>> cc-stable tag and it also seems fairly intrusive.
>>
>> The author does not have enough experience with preempt-rt to make that
>> determination, hence deferred to Sebastian for better judgement.
> 
> Fair enough. And it's not obvious that the stable team should backport
> patches that only concern PREEMPT_RT either (e.g. as parts of it are
> still out-of-tree).
> 
> The stable tag is still missing from the final revision though.

Please pardon my ignorance, which stable tag is missing ?

Can you maybe just comment on the V4 and point this out to me ? I'll 
send a V5 then.

Thanks !
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
