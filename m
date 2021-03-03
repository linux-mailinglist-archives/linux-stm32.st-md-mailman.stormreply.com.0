Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 580DF32B658
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 10:52:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0871AC57B62;
	Wed,  3 Mar 2021 09:52:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFFE7C56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 09:52:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F066A1FB;
 Wed,  3 Mar 2021 01:52:01 -0800 (PST)
Received: from [10.57.12.223] (unknown [10.57.12.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33BFD3F73B;
 Wed,  3 Mar 2021 01:52:00 -0800 (PST)
To: dillon.minfei@gmail.com, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
 <1614758717-18223-2-git-send-email-dillon.minfei@gmail.com>
From: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <5284d390-c03a-4035-df5a-10d6cd60e47b@arm.com>
Date: Wed, 3 Mar 2021 09:52:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1614758717-18223-2-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
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

On 3/3/21 8:05 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> For some case, kernel not boot by u-boot(single thread),
> but by rtos , as most rtos use pendsv to do context switch.


Hmm, does it mean that it starts kernel from process context?

I'd assume that it is not only kernel who expects MSP. So, what
if RTOS you mentioned want to boot other RTOS (even itself)? What
if you have no access to the source code for those RTOS(es) to
patch MSP/PSP switch?

I'd very much prefer to keep stack switching logic outside kernel,
say, in some shim which RTOS/bootloader can maintain.

Cheers
Vladimir

> 
> So, we need add an lr check after svc call, to find out should
> use psp or msp. else register restore after svc call might be
> corrupted.
> 
> Fixes: b70cd406d7fe ("ARM: 8671/1: V7M: Preserve registers across switch from Thread to Handler mode")
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  arch/arm/mm/proc-v7m.S | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mm/proc-v7m.S b/arch/arm/mm/proc-v7m.S
> index 84459c1d31b8..c93d2757312d 100644
> --- a/arch/arm/mm/proc-v7m.S
> +++ b/arch/arm/mm/proc-v7m.S
> @@ -137,7 +137,10 @@ __v7m_setup_cont:
>  1:	cpsid	i
>  	/* Calculate exc_ret */
>  	orr	r10, lr, #EXC_RET_THREADMODE_PROCESSSTACK
> -	ldmia	sp, {r0-r3, r12}
> +	tst	lr, #EXC_RET_STACK_MASK
> +	mrsne	r4, psp
> +	moveq	r4, sp
> +	ldmia	r4!, {r0-r3, r12}
>  	str	r5, [r12, #11 * 4]	@ restore the original SVC vector entry
>  	mov	lr, r6			@ restore LR
>  
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
