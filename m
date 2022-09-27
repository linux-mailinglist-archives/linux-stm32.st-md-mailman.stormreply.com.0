Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E18E5EB932
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 06:26:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BD31C63325;
	Tue, 27 Sep 2022 04:26:36 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1D12C5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 04:26:34 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R441e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VQq1IO4_1664252789; 
Received: from 30.240.100.75(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0VQq1IO4_1664252789) by smtp.aliyun-inc.com;
 Tue, 27 Sep 2022 12:26:31 +0800
Message-ID: <cb061cbb-5f28-9dde-270e-6d7ccb6d4433@linux.alibaba.com>
Date: Tue, 27 Sep 2022 12:26:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20220926093620.99898-1-tianjia.zhang@linux.alibaba.com>
 <20220926093620.99898-17-tianjia.zhang@linux.alibaba.com>
 <CAMj1kXF8Fi9cG4p6udRYT4LbCAj0UBXQL12nmQBFEWvZsVX7Wg@mail.gmail.com>
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
In-Reply-To: <CAMj1kXF8Fi9cG4p6udRYT4LbCAj0UBXQL12nmQBFEWvZsVX7Wg@mail.gmail.com>
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

Hi Ard,

On 9/26/22 6:02 PM, Ard Biesheuvel wrote:
> (cc Mark Brown)
> 
> Hello Tianjia,
> 
> On Mon, 26 Sept 2022 at 11:37, Tianjia Zhang
> <tianjia.zhang@linux.alibaba.com> wrote:
>>
>> Scalable Vector Extension (SVE) is the next-generation SIMD extension for
>> arm64. SVE allows flexible vector length implementations with a range of
>> possible values in CPU implementations. The vector length can vary from a
>> minimum of 128 bits up to a maximum of 2048 bits, at 128-bit increments.
>> The SVE design guarantees that the same application can run on different
>> implementations that support SVE, without the need to recompile the code.
>>
>> SVE was originally introduced by ARMv8, and ARMv9 introduced SVE2 to
>> expand and improve it. Similar to the Crypto Extension supported by the
>> NEON instruction set for the algorithm, SVE also supports the similar
>> instructions, called cryptography acceleration instructions, but this is
>> also optional instruction set.
>>
>> This patch uses SM4 cryptography acceleration instructions and SVE2
>> instructions to optimize the SM4 algorithm for ECB/CBC/CFB/CTR modes.
>> Since the encryption of CBC/CFB cannot be parallelized, the Crypto
>> Extension instruction is used.
>>
> 
> Given that we currently do not support the use of SVE in kernel mode,
> this patch cannot be accepted at this time (but the rest of the series
> looks reasonable to me, although I have only skimmed over the patches)
> 
> In view of the disappointing benchmark results below, I don't think
> this is worth the hassle at the moment. If we can find a case where
> using SVE in kernel mode truly makes a [favorable] difference, we can
> revisit this, but not without a thorough analysis of the impact it
> will have to support SVE in the kernel. Also, the fact that SVE may
> also cover cryptographic extensions does not necessarily imply that a
> micro-architecture will perform those crypto transformations in
> parallel and so the performance may be the same even if VL > 128.
> 
> In summary, please drop this patch for now, and once there are more
> encouraging performance numbers, please resubmit it as part of a
> series that explicitly enables SVE in kernel mode on arm64, and
> documents the requirements and constraints.
> 
> I have cc'ed Mark who has been working on the SVE support., who might
> have something to add here as well.
> 
> Thanks,
> Ard.
> 
> 

Thanks for your reply, the current performance of SVE is really
unsatisfactory. One reason is that the optimization of SVE needs to deal
with more and more complex data shifting operations, such as in CBC/CFB
mode, but also in CTR mode. needing more instruction to complete the
128-bit count increment, and the use of CE optimization does not have
these complications.

In addition, I naively thought that when the VL is 256-bit, the
performance will simply double compared to 128-bit. At present, this is
not the case. Maybe it is worth using SVE until there are significantly
improved performance data. I'll follow your advice and drop this
patch.

Best regards,
Tianjia

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
