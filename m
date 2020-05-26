Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ACC1E0E09
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2020 14:01:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34545C36B24;
	Mon, 25 May 2020 12:01:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 628DCC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 12:01:36 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9359520878
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 12:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590408095;
 bh=olZ0l8qh0RgdmNkDjt4UJayckN8lajlhkaGjs7bHEeE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Gs+uvbRGLsbo3vy6rwsHoco5X/SzKn6JSTUt9CLdqp9utF45n8uwJwhdVfOVlQcea
 De6yUNJSMfyixnbw7jRQUAImnglZD1zpljR+MJ4JltWMlHPNUiTQmjPlrRFpCMO0EY
 kcd/txtcni5zZqmQdZ7bV3la97AIR7apubgQUY0w=
Received: by mail-io1-f51.google.com with SMTP id h10so18353790iob.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 May 2020 05:01:35 -0700 (PDT)
X-Gm-Message-State: AOAM531phHnQCKjLO0I8Uhi6WJy0Y5RHhwcThNm11pNCqZgLOfAlmLC4
 TnS/AstYOV8xouaeByPP0uojD3RPoZVDUqLglgI=
X-Google-Smtp-Source: ABdhPJw5HEiBbr0kLePKL1iehx5NCuUOjnEBURwJrKMeTQaSRXq0GgKTzqpxxM48oIY8rVt+HjNzuxWQOIFyZlvcKyA=
X-Received: by 2002:a5d:81d7:: with SMTP id t23mr12092506iol.142.1590408094927; 
 Mon, 25 May 2020 05:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200512141113.18972-1-nicolas.toromanoff@st.com>
 <20200512141113.18972-6-nicolas.toromanoff@st.com>
 <CAMj1kXGs6UgkKb5+tH2B-+26=tbjHq3UUY2gxfcRfMb1nGVuFA@mail.gmail.com>
 <67c25d90d9714a85b52f3d9c2070af88@SFHDAG6NODE1.st.com>
 <CAMj1kXGo+9aXeYppGSheqhC-pNeJCcEie+SAnWy_sAiooEDMsQ@mail.gmail.com>
 <bd6cac3bd4c74db1a403df58082028fd@SFHDAG6NODE1.st.com>
 <CAMj1kXFwt6cs-MJhAeMRF4-yiddm=ezq=qvSjA_sRAX+_Gdqhw@mail.gmail.com>
 <31e99726fa6544fcaac88490de3186e6@SFHDAG6NODE1.st.com>
In-Reply-To: <31e99726fa6544fcaac88490de3186e6@SFHDAG6NODE1.st.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 25 May 2020 14:01:24 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGyjDbemHBOyprx8NzaxOvauhxV40u81Wa=ONE6HfSRSQ@mail.gmail.com>
Message-ID: <CAMj1kXGyjDbemHBOyprx8NzaxOvauhxV40u81Wa=ONE6HfSRSQ@mail.gmail.com>
To: Nicolas TOROMANOFF <nicolas.toromanoff@st.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Biggers <ebiggers@kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [Linux-stm32] [PATCH 5/5] crypto: stm32/crc: protect from
	concurrent accesses
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

On Mon, 25 May 2020 at 13:49, Nicolas TOROMANOFF
<nicolas.toromanoff@st.com> wrote:
>
> > -----Original Message-----
> > From: Ard Biesheuvel <ardb@kernel.org>
> > Sent: Monday, May 25, 2020 11:07 AM
> > To: Nicolas TOROMANOFF <nicolas.toromanoff@st.com>; Eric Biggers
> > <ebiggers@kernel.org>
> > On Mon, 25 May 2020 at 11:01, Nicolas TOROMANOFF
> > <nicolas.toromanoff@st.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > > Sent: Monday, May 25, 2020 9:46 AM
> > > > To: Nicolas TOROMANOFF <nicolas.toromanoff@st.com>
> > > > Subject: Re: [PATCH 5/5] crypto: stm32/crc: protect from concurrent
> > > > accesses
> > > >
> > > > On Mon, 25 May 2020 at 09:24, Nicolas TOROMANOFF
> > > > <nicolas.toromanoff@st.com> wrote:
> > > > >
> > > > > Hello,
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > > > > Sent: Friday, May 22, 2020 6:12 PM> On Tue, 12 May 2020 at
> > > > > > 16:13, Nicolas Toromanoff <nicolas.toromanoff@st.com> wrote:
> > > > > > >
> > > > > > > Protect STM32 CRC device from concurrent accesses.
> > > > > > >
> > > > > > > As we create a spinlocked section that increase with buffer
> > > > > > > size, we provide a module parameter to release the pressure by
> > > > > > > splitting critical section in chunks.
> > > > > > >
> > > > > > > Size of each chunk is defined in burst_size module parameter.
> > > > > > > By default burst_size=0, i.e. don't split incoming buffer.
> > > > > > >
> > > > > > > Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@st.com>
> > > > > >
> > > > > > Would you mind explaining the usage model here? It looks like
> > > > > > you are sharing a CRC hardware accelerator with a synchronous
> > > > > > interface between different users by using spinlocks? You are
> > > > > > aware that this will tie up the waiting CPUs completely during
> > > > > > this time, right? So it would be much better to use a mutex
> > > > > > here. Or perhaps it would make more sense to fall back to a s/w
> > > > > > based CRC routine if the h/w is tied up
> > > > working for another task?
> > > > >
> > > > > I know mutex are more acceptable here, but shash _update() and
> > > > > _init() may be call from any context, and so I cannot take a mutex.
> > > > > And to protect my concurrent HW access I only though about spinlock.
> > > > > Due to possible constraint on CPUs, I add a burst_size option to
> > > > > force slitting long buffer into smaller one, and so decrease time we take
> > the lock.
> > > > > But I didn't though to fallback to software CRC.
> > > > >
> > > > > I'll do a patch on top.
> > > > > In in the burst_update() function I'll use a
> > > > > spin_trylock_irqsave() and use
> > > > software CRC32 if HW is already in use.
> > > > >
> > > >
> > > > Right. I didn't even notice that you were keeping interrupts
> > > > disabled the whole time when using the h/w block. That means that
> > > > any serious use of this h/w block will make IRQ latency go through the roof.
> > > >
> > > > I recommend that you go back to the drawing board on this driver,
> > > > rather than papering over the issues with a spin_trylock(). Perhaps
> > > > it would be better to model it as a ahash (even though the h/w block
> > > > itself is synchronous) and use a kthread to feed in the data.
> > >
> > > I thought when I updated the driver to move to a ahash interface, but
> > > the main usage of crc32 is the ext4 fs, that calls the shash API.
> > > Commit 877b5691f27a ("crypto: shash - remove shash_desc::flags")
> > > removed possibility to sleep in shash callback. (before this commit
> > > and with MAY_SLEEP option set, using a mutex may have been fine).
> > >
> >
> > According to that commit's log, sleeping is never fine for shash(), since it uses
> > kmap_atomic() when iterating over the scatterlist.
>
> Today, we could avoid using kmap_atomic() in shash_ashash_*() APIs (the
> ones that Walks through the scatterlist) by using the
> crypto_ahash_walk_first() function to initialize the shash_ahash walker
> (note that this function is never call in current kernel source [to remove ?]).
> Then shash_ahash_*() functions will call ahash_*() function that use kmap()
> if (walk->flags & CRYPTO_ALG_ASYNC) [flag set by crypto_ahash_walk_first()]
> The last kmap_atomic() will be in the shash_ahash_digest() call in the
> optimize branch (that should be replaced by the no atomic one)
>
> I didn't investigate more this way, because I didn't check the drawback of
> using kmap() instead of kmap_atomic(), I wanted to avoid modifying behavior
> of other drivers and using a function never use elsewhere in kernel scarred
> me ;-).
> If these updates correct visible bugs in the ahash usage of the stm32-crc32
> code [no more "sleep while atomic" traces even with mutex in tests],
> Documentation states that shash API could be called from any context,
> I cannot add mutex in them.
>
> > > By now the solution I see is to use the spin_trylock_irqsave(),
> > > fallback to software crc *AND* capping burst_size to ensure the locked
> > section stay reasonable.
> > >
> > > Does this seems acceptable ?
> > >
> >
> > If the reason for disabling interrupts is to avoid deadlocks, wouldn't the switch
> > to trylock() with a software fallback allow us to keep interrupts enabled?
>
> Right, with the trylock, I don't see why we may need to mask interrupts.
>
>

OK, then the fix should be easy.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
