Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D34F45EB938
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 06:30:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93B5AC63325;
	Tue, 27 Sep 2022 04:30:54 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D113AC5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 04:30:52 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R291e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VQq1JZ-_1664253048; 
Received: from 30.240.100.75(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0VQq1JZ-_1664253048) by smtp.aliyun-inc.com;
 Tue, 27 Sep 2022 12:30:50 +0800
Message-ID: <0d3188a0-3e6f-4999-9fe8-92509d7cf0d5@linux.alibaba.com>
Date: Tue, 27 Sep 2022 12:30:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
References: <20220926093620.99898-1-tianjia.zhang@linux.alibaba.com>
 <20220926093620.99898-17-tianjia.zhang@linux.alibaba.com>
 <CAMj1kXF8Fi9cG4p6udRYT4LbCAj0UBXQL12nmQBFEWvZsVX7Wg@mail.gmail.com>
 <YzHd/U9vvSwuhKsx@sirena.org.uk>
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
In-Reply-To: <YzHd/U9vvSwuhKsx@sirena.org.uk>
Cc: Jussi Kivilinna <jussi.kivilinna@iki.fi>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 16/16] crypto: arm64/sm4 - add ARMv9 SVE
 cryptography acceleration implementation
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

Hi Mark,

On 9/27/22 1:14 AM, Mark Brown wrote:
> On Mon, Sep 26, 2022 at 12:02:04PM +0200, Ard Biesheuvel wrote:
> 
>> Given that we currently do not support the use of SVE in kernel mode,
>> this patch cannot be accepted at this time (but the rest of the series
>> looks reasonable to me, although I have only skimmed over the patches)
> 
>> In view of the disappointing benchmark results below, I don't think
>> this is worth the hassle at the moment. If we can find a case where
>> using SVE in kernel mode truly makes a [favorable] difference, we can
>> revisit this, but not without a thorough analysis of the impact it
>> will have to support SVE in the kernel. Also, the fact that SVE may
> 
> The kernel code doesn't really distinguish between FPSIMD and SVE in
> terms of state management, and with the sharing of the V and Z registers
> the architecture is very similar too so it shouldn't be too much hassle,
> the only thing we should need is some management for the VL when
> starting kernel mode SVE (probably just setting the maximum VL as a
> first pass).
> 
> The current code should *work* and on a system with only a single VL
> supported it'd be equivalent since setting the VL is a noop, it'd just
> mean that any kernel mode SVE would end up using whatever the last VL
> set on the PE happened to be in which could result in inconsistent
> performance.
> 
>> also cover cryptographic extensions does not necessarily imply that a
>> micro-architecture will perform those crypto transformations in
>> parallel and so the performance may be the same even if VL > 128.
> 
> Indeed, though so long as the performance is comparable I guess it
> doesn't really hurt - if we run into situations where for some
> implementations SVE performs worse then we'd need to do something more
> complicated than just using SVE if it's available but...
> 
>> In summary, please drop this patch for now, and once there are more
>> encouraging performance numbers, please resubmit it as part of a
>> series that explicitly enables SVE in kernel mode on arm64, and
>> documents the requirements and constraints.
> 
> ...in any case as you say until there are cases where SVE does better
> for some in kernel use case we probably just shouldn't merge things.
> 
> Having said that I have been tempted to put together a branch which has
> a kernel_sve_begin() implementation and collects proposed algorithm
> implementations so they're there for people to experiment with as new
> hardware becomes available.  There's clearly interest in trying to use
> SVE in kernel and it makes sense to try to avoid common pitfalls and
> reduce duplication of effort.
> 

Your reply helped me a lot, I did encounter problems when using qemu VL
larger than 128-bit environment, but I also tested it with the pure
user-mode library libgcrypt, it seems to be normal, maybe in 128-bit
It's just a coincidence that it works fine in the physical machine.

I am looking forward to your experimental branch, and I believe that
there will be breakthroughs in hardware in the near future.

> A couple of very minor comments on the patch:
> 
>>> +config CRYPTO_SM4_ARM64_SVE_CE_BLK
>>> +       tristate "Ciphers: SM4, modes: ECB/CBC/CFB/CTR (ARMv9 cryptography
>> +acceleration with SVE2)"
>>> +       depends on KERNEL_MODE_NEON
>>> +       select CRYPTO_SKCIPHER
>>> +       select CRYPTO_SM4
>>> +       select CRYPTO_SM4_ARM64_CE_BLK
>>> +       help
> 
> Our current baseline binutils version requirement predates SVE support
> so we'd either need to manually encode all SVE instructions used or add
> suitable dependency.  The dependency seems a lot more reasonable here,
> and we could require a new enough version to avoid the manual encoding
> that is done in the patch (though I've not checked how new a version
> that'd end up requiring, it might be unreasonable so perhaps just
> depending on binutils having basic SVE support and continuing with the
> manual encoding might be more helpful).
> 
>>> +.macro sm4e, vd, vn
>>> +       .inst 0xcec08400 | (.L\vn << 5) | .L\vd
>>> +.endm
> 
> For any manual encodings that do get left it'd be good to note the
> binutils and LLVM versions which support the instruction so we can
> hopefully at some point switch to assembling them normally.
> 
>>> +static int __init sm4_sve_ce_init(void)
>>> +{
>>> +       if (sm4_sve_get_vl() <= 16)
>>> +               return -ENODEV;
> 
> I'm not clear what this check is attempting to guard against - what's
> the issue with larger VLs?

Since there is no physical environment, this check is based on my naive
assumption that the performance when VL is 256-bit should theoretically
be twice that of 128-bit, because SVE needs to handle more complex data
shifting operations and CTR incrementing operations, so When VL is
greater than or equal to 256 bits, the use of SVE will bring performance
improvement, otherwise it is a suitable choice to degenerate to CE.

Now it seems that this assumption itself is not valid, I will drop
this patch first.

> 
> If it is needed then we already have a sve_get_vl() in the core kernel
> which we should probably be making available to modules rather than
> having them open code something (eg, making it a static inline rather
> than putting it in asm).

Yes, I agree, exporting sve_get_vl() to the module is the more
appropriate approach.

Best regards,
Tianjia

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
