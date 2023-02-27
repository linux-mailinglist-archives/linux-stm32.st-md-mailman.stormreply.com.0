Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEB66A4D00
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Feb 2023 22:18:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E43FC6A5EA;
	Mon, 27 Feb 2023 21:18:03 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85EF9C6904C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Feb 2023 21:18:02 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-536bf92b55cso212845037b3.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Feb 2023 13:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=861ENRhd8EcHSgkNed94lLcOy+3hO+Ai15ZLxiI8kpM=;
 b=kloYiVK17/dt2g3sp7Dfx3rk4LMRwTyDQgC5p0DMXht369w9cWMi9xv7oVE/2p3m9q
 APhG6yjBMR1RV1BkutloNYHI/oKXML0JscnUGWpgoPTr5hGSK0RWsyasxlZsVIFSkbdt
 dgUIrX23diNJXG+RUt9nJMrga98jtbyGd0PpIzC8UGEi4uaKfVOOlSnkr2BVp636gGPU
 oCwBueM+qUp0hrN52MRgMAxZmDDufSyBMPqz7wni4mu0VjOUOBF9KAmDfsUv1rxN3BPA
 kQcR9YDXDLcH8SC/JjCS8CZNtglOl6t+57ywwIDCk/zhZMj0yljfLe6CE0/zDKwsrLxc
 gDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=861ENRhd8EcHSgkNed94lLcOy+3hO+Ai15ZLxiI8kpM=;
 b=uxLHCnLqrKR8R0Xk/VXCP65dlSVEidMSHgYPHCvy1Tq2OjJ6xyHurgFT5qVYZbhFH7
 oFBYWD5u/lEzpO/b2XHNwZZbEGlmNjiPUjtqsQS07dEESwhdi0anbOPplLIDRvhCfZJQ
 GCj+Gk+0MOnk/wPsn9610WiJm/vybN5PQ+vlfQOC9WIGLfZkFD0zTaJpyv3CiXgKjp1b
 AmE0po+N3mEEe0a4ECKxpmXgUypR3lIeP3bXPg4SzPp10Qa1IlVza1PuZClPaQgn7FPR
 Yf5w7tNs19RVC6X60XtTc8QFD2ci4T3DltYbhAzkj3tJOJnqKqPI4OypMCMJ5J7abuEQ
 hZyw==
X-Gm-Message-State: AO0yUKVjfAETM2YmgV29PEMhGGUw1/eL5tgJ9UqtNRvwOEXSOQwNEl17
 9ul2wHBTHWi8PSQSWvguAQLMwOeY8Brc2/cpBirewQ==
X-Google-Smtp-Source: AK7set//HnE1NkogtMQUUnKRN9ZnMZvonCvFO7FMIxs+p8rQ32omlyXDjNQIPGNptsPySH4EGsfKDlYCxpjMnXONZwM=
X-Received: by 2002:a5b:685:0:b0:9f1:6c48:f95f with SMTP id
 j5-20020a5b0685000000b009f16c48f95fmr75674ybq.5.1677532681340; Mon, 27 Feb
 2023 13:18:01 -0800 (PST)
MIME-Version: 1.0
References: <Y/cBB+q0Ono9j2Jy@gondor.apana.org.au>
 <20230224231430.2948-1-kunyu@nfschina.com>
 <Y/cy5wUtk10OahpO@gondor.apana.org.au>
 <CACRpkdYyB=-UnE1bmdVszSSB5ReECZ0fUoWJX6XtYbKHEe52tA@mail.gmail.com>
 <Y/c7iVW67Xhhdu8e@gondor.apana.org.au> <Y/hQdzsKMYgkIfMY@gondor.apana.org.au>
 <Y/yIbPBVCPx9K/0s@gondor.apana.org.au>
In-Reply-To: <Y/yIbPBVCPx9K/0s@gondor.apana.org.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Feb 2023 22:17:49 +0100
Message-ID: <CACRpkdZC4z2Xng4=k94rmM=AFzNzTdXkvtkArMnK7afouz=7VA@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v3 PATCH] crypto: stm32 - Save and restore
	between each request
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

On Mon, Feb 27, 2023 at 11:39 AM Herbert Xu <herbert@gondor.apana.org.au> wrote:

> v3 moves the exported state into its own structure so that it
> doesn't contain unnecessary data.  It also subsumes the "empty
> message" patch, as only the stm32_hash_copy_hash hunk was really
> needed and it's easiest if we put that here.

Thanks Herbert, now the driver probes fine, but unfortunately the tests
fail:

[    2.963725] alg: extra crypto tests enabled.  This is intended for
developer use only.
[   17.106532] Key type encrypted registered
[   23.804729] stm32-hash a03c2000.hash: allocated hmac(sha256) fallback
[   23.812529] alg: ahash: stm32-hmac-sha256 test failed (wrong
result) on test vector 0, cfg="init+update+final aligned buffer"
[   23.823902] alg: self-tests for hmac(sha256) using
stm32-hmac-sha256 failed (rc=-22)
[   23.823924] ------------[ cut here ]------------
[   23.836312] WARNING: CPU: 0 PID: 72 at crypto/testmgr.c:5858
alg_test.part.0+0x4d0/0x4dc
[   23.844449] alg: self-tests for hmac(sha256) using
stm32-hmac-sha256 failed (rc=-22)
[   23.844460] Modules linked in:
[   23.855261] CPU: 0 PID: 72 Comm: cryptomgr_test Not tainted
6.2.0-12019-g4bc85a2f8f63 #65
[   23.863440] Hardware name: ST-Ericsson Ux5x0 platform (Device Tree Support)
[   23.870408]  unwind_backtrace from show_stack+0x10/0x14
[   23.875653]  show_stack from dump_stack_lvl+0x40/0x4c
[   23.880727]  dump_stack_lvl from __warn+0x94/0xc0
[   23.885450]  __warn from warn_slowpath_fmt+0x118/0x164
[   23.890603]  warn_slowpath_fmt from alg_test.part.0+0x4d0/0x4dc
[   23.896540]  alg_test.part.0 from cryptomgr_test+0x18/0x38
[   23.902042]  cryptomgr_test from kthread+0xc0/0xc4
[   23.906847]  kthread from ret_from_fork+0x14/0x2c
[   23.911557] Exception stack(0xf0f39fb0 to 0xf0f39ff8)
[   23.916609] 9fa0:                                     00000000
00000000 00000000 00000000
[   23.924783] 9fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   23.932956] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   23.939604] ---[ end trace 0000000000000000 ]---


All tests fail on vector 0 or 1.

I am trying to debug!

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
