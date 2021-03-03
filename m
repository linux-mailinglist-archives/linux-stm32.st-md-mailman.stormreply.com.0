Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8260A32B891
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 15:19:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FEB7C57B64;
	Wed,  3 Mar 2021 14:19:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F2BCC56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 14:19:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99E90D6E;
 Wed,  3 Mar 2021 06:19:15 -0800 (PST)
Received: from [10.57.12.223] (unknown [10.57.12.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FD333F766;
 Wed,  3 Mar 2021 06:19:13 -0800 (PST)
To: dillon min <dillon.minfei@gmail.com>
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
 <1614758717-18223-2-git-send-email-dillon.minfei@gmail.com>
 <5284d390-c03a-4035-df5a-10d6cd60e47b@arm.com>
 <CAL9mu0KUhctbBzmem1ZSgEwf5CebivHOSUr9Q7VTyzib8pW=Cw@mail.gmail.com>
From: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <5efe3d44-8045-e376-003e-3ccbff54fb23@arm.com>
Date: Wed, 3 Mar 2021 14:19:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0KUhctbBzmem1ZSgEwf5CebivHOSUr9Q7VTyzib8pW=Cw@mail.gmail.com>
Content-Language: en-US
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/8] ARM: ARMv7-M: Fix register restore
 corrupt after svc call
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

On 3/3/21 1:35 PM, dillon min wrote:
> Hi Vladimir,
> 
> Thanks for the review.
> 
> On Wed, Mar 3, 2021 at 5:52 PM Vladimir Murzin <vladimir.murzin@arm.com> wrote:
>>
>> On 3/3/21 8:05 AM, dillon.minfei@gmail.com wrote:
>>> From: dillon min <dillon.minfei@gmail.com>
>>>
>>> For some case, kernel not boot by u-boot(single thread),
>>> but by rtos , as most rtos use pendsv to do context switch.
>>
>>
>> Hmm, does it mean that it starts kernel from process context?
>    Yes, kernel might be started from process context, since u-boot not
> switch context, so kernel always startup under msp.
>>
>> I'd assume that it is not only kernel who expects MSP. So, what
>> if RTOS you mentioned want to boot other RTOS (even itself)? What
>> if you have no access to the source code for those RTOS(es) to
>> patch MSP/PSP switch?
> 
> My case is a little complicated.
> stm32h7 only have 128Kbytes internal flash, can't store u-boot.bin (>200K),
> so, set a bootloader (rt-thread rtos) to internal flash, load
> linux/u-boot from serial port via ymodem
> store to qspi flash(8Mbytes), then jump to u-boot.
> 
> qspi flash layout:
> 0 - 512K:    u-boot
> 512K- 8M : kernel(xip)
> 
> load process : rt-thread -> u-boot -> linux
> 
> before add psp/msp check after svc call, register restore corrupt.
> add a printhex8 around svc call, found the sp stack is 0x24040000c0ffcff8
> it should be 0xc0ffcdf8c0ffcff8. 0x24040000 is the sp stack address
> assigned by u-boot
> i've no idea how it's become to u-boot's sp.
> 
> I have the rtos code, and will try to fix it on the rtos side.

That would be great!

> 
> Can you give more explanation about why linux relies on MSP ? thanks

MSP is what set from boot, thus it is natural assumption that boot code
would preserve that illusion.

I'd guess that kernel is in line in such assumption across different
(RT)OS capable to run on M-class cores (please, note that some variants
might not have two stack pointers)

Cheers
Vladimir

> 
>>
>> I'd very much prefer to keep stack switching logic outside kernel,
>> say, in some shim which RTOS/bootloader can maintain.
>>
>> Cheers
>> Vladimir
>>
>>>
>>> So, we need add an lr check after svc call, to find out should
>>> use psp or msp. else register restore after svc call might be
>>> corrupted.
>>>
>>> Fixes: b70cd406d7fe ("ARM: 8671/1: V7M: Preserve registers across switch from Thread to Handler mode")
>>> Signed-off-by: dillon min <dillon.minfei@gmail.com>
>>> ---
>>>  arch/arm/mm/proc-v7m.S | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/mm/proc-v7m.S b/arch/arm/mm/proc-v7m.S
>>> index 84459c1d31b8..c93d2757312d 100644
>>> --- a/arch/arm/mm/proc-v7m.S
>>> +++ b/arch/arm/mm/proc-v7m.S
>>> @@ -137,7 +137,10 @@ __v7m_setup_cont:
>>>  1:   cpsid   i
>>>       /* Calculate exc_ret */
>>>       orr     r10, lr, #EXC_RET_THREADMODE_PROCESSSTACK
>>> -     ldmia   sp, {r0-r3, r12}
>>> +     tst     lr, #EXC_RET_STACK_MASK
>>> +     mrsne   r4, psp
>>> +     moveq   r4, sp
>>> +     ldmia   r4!, {r0-r3, r12}
>>>       str     r5, [r12, #11 * 4]      @ restore the original SVC vector entry
>>>       mov     lr, r6                  @ restore LR
>>>
>>>
>>
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
