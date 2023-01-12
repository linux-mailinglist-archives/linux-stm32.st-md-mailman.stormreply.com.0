Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F85F667B0D
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 17:38:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E965C65E45;
	Thu, 12 Jan 2023 16:38:52 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFB60C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 16:38:50 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5B5F680CB0;
 Thu, 12 Jan 2023 17:38:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1673541530;
 bh=4f4T7bt3j8qj7FQzMPy1igU/EfnhB12Tggy+VjN0tmI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R4v8PDRRR7HBH5GHlxkBZOlCTLuS4eDI1P1nA5VlwoVAfC6+22eESTJYM6OihXPN/
 HQ7670gY0hT5IF3yoQwykY8epoV9z/IxQQmPQyx67XMJecAlWMFHvVtaj4MieebrEz
 NSeNxLuAhZX3T6QepWHMXCqyEHo8DIqJ2yge2wpf0BcWl2g+p2IDfIA03Iuzy8E+TU
 ZbGqcDvy3AyugzXOl/mjRahpxjKtb0GH6ZzK8+kdtPrHhRIkmh38VU8AkvdC8/MB+t
 bsgvOVmDfHfRpKmeVAf8yWD5FHAequdlkOLWH8z0HEGhkDWARnHQlB6JHWM+CkiwSl
 +UbqTHxSmoV7A==
Message-ID: <78e3f61f-4f87-9ac5-7c7c-172714da69d3@denx.de>
Date: Thu, 12 Jan 2023 17:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20221216115338.7150-1-marex@denx.de>
 <Y6sHr5kuxUoahlzJ@hovoldconsulting.com> <Y7vou3wAeLP4X+TY@linutronix.de>
 <Y8AHaJIttNga68q4@hovoldconsulting.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Y8AHaJIttNga68q4@hovoldconsulting.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On 1/12/23 14:13, Johan Hovold wrote:
> On Mon, Jan 09, 2023 at 11:13:15AM +0100, Sebastian Andrzej Siewior wrote:
>> On 2022-12-27 15:56:47 [+0100], Johan Hovold wrote:
>>> On Fri, Dec 16, 2022 at 12:53:38PM +0100, Marek Vasut wrote:
>>>> Requesting an interrupt with IRQF_ONESHOT will run the primary handler
>>>> in the hard-IRQ context even in the force-threaded mode. The
>>>> force-threaded mode is used by PREEMPT_RT in order to avoid acquiring
>>>> sleeping locks (spinlock_t) in hard-IRQ context. This combination
>>>> makes it impossible and leads to "sleeping while atomic" warnings.
>>>>
>>>> Use one interrupt handler for both handlers (primary and secondary)
>>>> and drop the IRQF_ONESHOT flag which is not needed.
>>>>
>>>> Fixes: e359b4411c283 ("serial: stm32: fix threaded interrupt handling")
>>>
>>> I don't think a Fixes tag is warranted as this is only needed due to
>>> this undocumented quirk of PREEMPT_RT.
>>
>> It is not an undocumented quirk of PREEMPT_RT. The part that might not
>> be well documented is that IRQF_ONESHOT won't run the primary handler as
>> a threaded handler. This is also the case for IRQF_NO_THREAD and
>> IRQF_PERCPU but might be more obvious.
> 
> Yeah, that not being documented seems like an oversight as generally
> drivers should not need be changed to continue working on PREEMPT_RT (or
> with forced-threading generally).
> 
>> Anyway, if the primary handler is not threaded then it runs in HARDIRQ
>> context and here you must not use a spinlock_t. This is documented in
>> Documentation/locking/locktypes.rst and there is also a LOCKDEP warning
>> for this on !RT which is off by default because it triggers with printk
>> (and this is worked on).
> 
> All interrupt handlers typically run in hard interrupt context unless
> explicitly requested to be threaded on !RT and drivers still use
> spinlock_t for that so not sure how that lockdep warning is supposed to
> work. Or do you mean that you have a lockdep warning specifically for
> IRQF_ONESHOT primary handlers?
>   
>>> And this should not be backported in any case.
>>
>> Such things have been backported via -stable in the past. If you
>> disagree, please keep me in loop while is merged so I can poke people to
>> backport it as part of the RT patch for the relevant kernels.
> 
> The author did not seem to think this was stable material as there is no
> cc-stable tag and it also seems fairly intrusive.

The author does not have enough experience with preempt-rt to make that 
determination, hence deferred to Sebastian for better judgement.

> But if the ST guys or whoever cares about this driver are fine with this
> being backported, I don't really mind either.

[...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
