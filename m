Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3FF60C32D
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Oct 2022 07:20:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DCA3C03FC9;
	Tue, 25 Oct 2022 05:20:58 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AA6DC035A5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Oct 2022 05:20:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C16F4B816AD;
 Tue, 25 Oct 2022 05:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC67C433C1;
 Tue, 25 Oct 2022 05:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666675255;
 bh=5cFmToZnfHJ3wdZXZsGCXvTpJ5G1Crrf87o/qATJxsk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p0fCnGGFpHgVFPayes/UIyVNcy6BtBRFTD3Q9/wyqG2Y5xH1mZr2r2sKRSiBWhuDh
 ztXeBQj+aAYuaZH0FmKdh0ijkr9ui60lO7QqMz+DnvlJM7CiwFy1tao33M4GHL5A0B
 k39c3haPGpF0sTuDVeEtZ39lNQqvX1Fz7mnKxSa2yhST/m2Z4A4UQwdc7vy7WBQPZc
 fuqh9cvdkNsODKS+tDbsj2YYA9N93A/DSh0lORlRzKH9o0PDqx3dE/hBsDgp39Eo8g
 9POJdiZ/00GHwRte+7FXXbAQTPh2qOETSQ24pfz47+tX9HEMjgoWkY1gH2yg/GkqX3
 6pVtRZThPUc2Q==
Date: Mon, 24 Oct 2022 22:20:53 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Message-ID: <Y1dyNWSdCesQlWm8@sol.localdomain>
References: <20221018071006.5717-1-tianjia.zhang@linux.alibaba.com>
 <20221018071006.5717-13-tianjia.zhang@linux.alibaba.com>
 <Y1DHb66VYPzFlTwh@sol.localdomain>
 <6d2a98f4-c50d-d05b-4a24-08fdd3ee20fa@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d2a98f4-c50d-d05b-4a24-08fdd3ee20fa@linux.alibaba.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, Oct 21, 2022 at 10:47:14AM +0800, Tianjia Zhang wrote:
> Hi Eric,
> 
> On 10/20/22 11:58 AM, Eric Biggers wrote:
> > On Tue, Oct 18, 2022 at 03:10:03PM +0800, Tianjia Zhang wrote:
> > > This patch is a CE-optimized assembly implementation for ESSIV mode.
> > > The assembly part is realized by reusing the CBC mode.
> > > 
> > > Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> > 
> > Is there still a use case for CBC-ESSIV mode these days, now that everyone is
> > using XTS instead?
> > 
> > - Eric
> 
> The mainstream is already using XTS, but CBC-ESSIV is still an optional
> backup algorithm, especially in block crypto and fscrypto, I'm currently
> working on supporting the SM4 algorithm for these subsystems.
> 

The only reason that AES-CBC-ESSIV support was added to fs/crypto/ was because
someone had a low-power embedded device with a hardware crypto accelerator that
only supported AES-CBC.

Nothing like that is relevant here, as this is just a software implementation.

Please just don't include ESSIV.  There's no need to implement random useless
algorithms.  It could always be added later if a use case actually arises.

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
