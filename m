Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B26A5606DF3
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Oct 2022 04:47:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 392F4C6410A;
	Fri, 21 Oct 2022 02:47:22 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17006C64101
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Oct 2022 02:47:20 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VShO7aQ_1666320435; 
Received: from 30.240.99.116(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0VShO7aQ_1666320435) by smtp.aliyun-inc.com;
 Fri, 21 Oct 2022 10:47:18 +0800
Message-ID: <6d2a98f4-c50d-d05b-4a24-08fdd3ee20fa@linux.alibaba.com>
Date: Fri, 21 Oct 2022 10:47:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>
References: <20221018071006.5717-1-tianjia.zhang@linux.alibaba.com>
 <20221018071006.5717-13-tianjia.zhang@linux.alibaba.com>
 <Y1DHb66VYPzFlTwh@sol.localdomain>
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
In-Reply-To: <Y1DHb66VYPzFlTwh@sol.localdomain>
Cc: Jussi Kivilinna <jussi.kivilinna@iki.fi>, linux-kernel@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "David S. Miller" <davem@davemloft.net>, Mark Brown <broonie@kernel.org>,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 12/15] crypto: arm64/sm4 - add CE
 implementation for ESSIV mode
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

Hi Eric,

On 10/20/22 11:58 AM, Eric Biggers wrote:
> On Tue, Oct 18, 2022 at 03:10:03PM +0800, Tianjia Zhang wrote:
>> This patch is a CE-optimized assembly implementation for ESSIV mode.
>> The assembly part is realized by reusing the CBC mode.
>>
>> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> 
> Is there still a use case for CBC-ESSIV mode these days, now that everyone is
> using XTS instead?
> 
> - Eric

The mainstream is already using XTS, but CBC-ESSIV is still an optional
backup algorithm, especially in block crypto and fscrypto, I'm currently
working on supporting the SM4 algorithm for these subsystems.

Cheers,
Tianjia
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
