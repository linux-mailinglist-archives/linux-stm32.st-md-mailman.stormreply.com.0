Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A4FAF7531
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jul 2025 15:15:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2054C3F949;
	Thu,  3 Jul 2025 13:15:03 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8DE3C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 13:15:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AA689A53809;
 Thu,  3 Jul 2025 13:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FFEC4CEED;
 Thu,  3 Jul 2025 13:14:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="A5NsHkt/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1751548496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xkiEb1x5aeo2U5t7p61ZjNQh1p++o+M4e3PN96IzcNk=;
 b=A5NsHkt/twS0bSDj/dJyaVEYb0DcjCIKrsfieIG5usjSVyLy5UjwXc9Fmro5QFrNm4+oN4
 zntJYgFFrWmxhGHjKr9bh3rpoCZZEUGfgjRACZntqAV8ad3nPAPoEq+xVC9ViWH+oGBfAo
 fi7x52XGQtuUYW396Ey2rPe2bCT2vII=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 91f8f88e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 3 Jul 2025 13:14:56 +0000 (UTC)
Date: Thu, 3 Jul 2025 15:14:52 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Gu Bowen <gubowen5@huawei.com>
Message-ID: <aGaCTOJ30KNPOBIC@zx2c4.com>
References: <20250630133934.766646-1-gubowen5@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630133934.766646-1-gubowen5@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, Eric Biggers <ebiggers@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 GONG Ruiqi <gongruiqi1@huawei.com>, linux-stm32@st-md-mailman.stormreply.com,
 Lu Jialin <lujialin4@huawei.com>, Ard Biesheuvel <ardb@kernel.org>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Lukas Wunner <lukas@wunner.de>, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ignat Korchagin <ignat@cloudflare.com>, David Woodhouse <dwmw2@infradead.org>,
 "David S . Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [Linux-stm32] [PATCH RFC 0/4] Reintroduce the sm2 algorithm
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

Hi,

On Mon, Jun 30, 2025 at 09:39:30PM +0800, Gu Bowen wrote:
> To reintroduce the sm2 algorithm, the patch set did the following:
>  - Reintroduce the mpi library based on libgcrypt.
>  - Reintroduce ec implementation to MPI library.
>  - Rework sm2 algorithm.
>  - Support verification of X.509 certificates.
> 
> Gu Bowen (4):
>   Revert "Revert "lib/mpi: Extend the MPI library""
>   Revert "Revert "lib/mpi: Introduce ec implementation to MPI library""
>   crypto/sm2: Rework sm2 alg with sig_alg backend
>   crypto/sm2: support SM2-with-SM3 verification of X.509 certificates

I am less than enthusiastic about this. Firstly, I'm kind of biased
against the whole "national flag algorithms" thing. But I don't know how
much weight that argument will have here. More importantly, however,
implementing this atop MPI sounds very bad. The more MPI we can get rid
of, the better.

Is MPI constant time? Usually the good way to implement EC algorithms
like this is to very carefully work out constant time (and fast!) field
arithmetic routines, verify their correctness, and then implement your
ECC atop that. At this point, there's *lots* of work out there on doing
fast verified ECC and a bunch of different frameworks for producing good
implementations. There are also other implementations out there you
could look at that people have presumably studied a lot. This is old
news. (In 3 minutes of scrolling around, I noticed that
count_leading_zeros() on a value is used as a loop index, for example.
Maybe fine, maybe not, I dunno; this stuff requires analysis.)

On the other hand, maybe you don't care because you only implement
verification, not signing, so all info is public? If so, the fact that
you don't care about CT should probably be made pretty visible. But
either way, you should still be concerned with having an actually good &
correct implementation of which you feel strongly about the correctness.

Secondly, the MPI stuff you're proposing here adds a 25519 and 448
implementation, and support for weierstrauss, montgomery, and edwards,
and... surely you don't need all of this for SM-2. Why add all this
unused code? Presumably because you don't really understand or "own" all
of the code that you're proposing to add. And that gives me a lot of
hesitation, because somebody is going to have to maintain this, and if
the person sending patches with it isn't fully on top of it, we're not
off to a good start.

Lastly, just to nip in the bud the argument, "but weierstrauss is all
the same, so why not just have one library to do all possible
weierstrauss curves?" -- the fact that this series reintroduces the
removed "generic EC library" indicates there's actually not another user
of it, even before we get into questions of whether it's a good idea.

Jason
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
