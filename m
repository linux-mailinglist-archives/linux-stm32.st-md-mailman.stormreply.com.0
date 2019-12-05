Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6809B113F82
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2019 11:38:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 237F4C36B0B;
	Thu,  5 Dec 2019 10:38:36 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EECD6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2019 09:36:32 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c14so2616138wrn.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2019 01:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yDhpzGph/Sl3F5yiAxtDx7OozplQyiOLtDQYn1Ymcc4=;
 b=cFs1DKxxrz3wBHesk8ew2n1s9xKJYKOoB799VoJIVv7vULGEjf8uPBSiTsC/uIEN0b
 rGnDFF9fgPyFOi/HhbgkzTxaYPn89KCBGiQrMptVXesZLRn6BXw//WBBFa0NqxTTCRQ+
 RYm7Bph9RQq5Vne74F/S8/agrOXEavnZbA/yzX/HKP0sZsASJ2kebR4VFGv4iVKJZaKY
 B2MiD7qkcJeYtcY1CbGtrCvRNRRDzU81NWP49VI9Bh2UraywJ8vdE3cRdRwcs4CSyo8g
 B7YRwjFxN/n21rzlbyVkyiiW1EQ1AHPhxHem+7IJD9doSzgLWCydSd1dVtnhKPTocYXg
 BzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yDhpzGph/Sl3F5yiAxtDx7OozplQyiOLtDQYn1Ymcc4=;
 b=h42L1wevT6fheE5aGvZ/CQ6Q06RxbMj33jrRg3PfoP0GN2SV6YwBVTNTzVZYPdvvTt
 cH46JaN7PWo1qpF40vcqjfhGzW7z022aaOTJPK17SId3yxfnte7ehqRDiA7rsTpaHXYC
 nHBFVVzHflsBkL3eeZKWlphRZ1O5eK3V/+3Bm2DRva1pkAVay1bLA0YKj2/x9aCBJwb2
 8EwpH7LHS1CinVXiutnlrEccV2cqDMneUXneueiYYNljNQP3QQjfgOjezxaIMRP6ulaF
 Tl2UGtQZjrAiOTe+y8Pq96s2toqpSpGpSYaYJfb4xo6BXkdrGP6XpN9PZ83XjV3AT1ZZ
 skLg==
X-Gm-Message-State: APjAAAWogOqcT/R5Ldwsr/xUt5KboGeBZWzmV2yHlvm/mo5Kdzi5gwmS
 u8IJWCvoYYnwBmFG56A/KRF0SjgP1mvQNo7Z2l3wbA==
X-Google-Smtp-Source: APXvYqzV4yD5evgBaMe8lq6m+lD5/SimV/mRxPFn5FYoNCSYAHmao71QnHJ9x2c2DpakxxM1i1+QHz1VLBVG3mRVAi4=
X-Received: by 2002:a5d:6652:: with SMTP id f18mr9267283wrw.246.1575538592021; 
 Thu, 05 Dec 2019 01:36:32 -0800 (PST)
MIME-Version: 1.0
References: <5de7d155.1c69fb81.c06f8.3583@mx.google.com>
 <377fa169-7ae5-479f-023c-e282d8c19f3a@collabora.com>
In-Reply-To: <377fa169-7ae5-479f-023c-e282d8c19f3a@collabora.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 5 Dec 2019 09:36:28 +0000
Message-ID: <CAKv+Gu_LY29hJ9c+myomeappoOgJYHdNYoWOu=KyfH3zCcTkLw@mail.gmail.com>
To: Guillaume Tucker <guillaume.tucker@collabora.com>,
 Eric Biggers <ebiggers@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>
X-Mailman-Approved-At: Thu, 05 Dec 2019 10:38:34 +0000
Cc: tomeu.vizoso@collabora.com, "David S. Miller" <davem@davemloft.net>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Mark Brown <broonie@kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 mgalka@collabora.com, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] ardb/for-kernelci bisection: boot on
	rk3288-rock2-square
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

(+ Eric)

On Wed, 4 Dec 2019 at 17:17, Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 04/12/2019 15:31, kernelci.org bot wrote:
> > * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> > * This automated bisection report was sent to you on the basis  *
> > * that you may be involved with the breaking commit it has      *
> > * found.  No manual investigation has been done to verify it,   *
> > * and the root cause of the problem may be somewhere else.      *
> > *                                                               *
> > * If you do send a fix, please include this trailer:            *
> > *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> > *                                                               *
> > * Hope this helps!                                              *
> > * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> >
> > ardb/for-kernelci bisection: boot on rk3288-rock2-square
> >
> > Summary:
> >   Start:      16839329da69 enable extra tests by default
> >   Details:    https://kernelci.org/boot/id/5de79104990bc03e5a960f0b
> >   Plain log:  https://storage.kernelci.org//ardb/for-kernelci/v5.4-9340-g16839329da69/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-8/lab-collabora/boot-rk3288-rock2-square.txt
> >   HTML log:   https://storage.kernelci.org//ardb/for-kernelci/v5.4-9340-g16839329da69/arm/multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y/gcc-8/lab-collabora/boot-rk3288-rock2-square.html
> >   Result:     16839329da69 enable extra tests by default
> >
> > Checks:
> >   revert:     PASS
> >   verify:     PASS
> >
> > Parameters:
> >   Tree:       ardb
> >   URL:        git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
> >   Branch:     for-kernelci
> >   Target:     rk3288-rock2-square
> >   CPU arch:   arm
> >   Lab:        lab-collabora
> >   Compiler:   gcc-8
> >   Config:     multi_v7_defconfig+CONFIG_EFI=y+CONFIG_ARM_LPAE=y
> >   Test suite: boot
> >
> > Breaking commit found:
> >
> > -------------------------------------------------------------------------------
> > commit 16839329da69263e7360f3819bae01bcf4b220ec
> > Author: Ard Biesheuvel <ardb@kernel.org>
> > Date:   Tue Dec 3 12:29:31 2019 +0000
> >
> >     enable extra tests by default
> >
> > diff --git a/crypto/Kconfig b/crypto/Kconfig
> > index 5575d48473bd..36af840aa820 100644
> > --- a/crypto/Kconfig
> > +++ b/crypto/Kconfig
> > @@ -140,7 +140,6 @@ if CRYPTO_MANAGER2
> >
> >  config CRYPTO_MANAGER_DISABLE_TESTS
> >       bool "Disable run-time self tests"
> > -     default y
> >       help
> >         Disable run-time self tests that normally take place at
> >         algorithm registration.
> > @@ -148,6 +147,7 @@ config CRYPTO_MANAGER_DISABLE_TESTS
> >  config CRYPTO_MANAGER_EXTRA_TESTS
> >       bool "Enable extra run-time crypto self tests"
> >       depends on DEBUG_KERNEL && !CRYPTO_MANAGER_DISABLE_TESTS
> > +     default y
> >       help
> >         Enable extra run-time self tests of registered crypto algorithms,
> >         including randomized fuzz tests.
> > diff --git a/crypto/testmgr.c b/crypto/testmgr.c
> > index 88f33c0efb23..5df87bcf6c4d 100644
> > --- a/crypto/testmgr.c
> > +++ b/crypto/testmgr.c
> > @@ -40,7 +40,7 @@ static bool notests;
> >  module_param(notests, bool, 0644);
> >  MODULE_PARM_DESC(notests, "disable crypto self-tests");
> >
> > -static bool panic_on_fail;
> > +static bool panic_on_fail = true;
> >  module_param(panic_on_fail, bool, 0444);
> >
> >  #ifdef CONFIG_CRYPTO_MANAGER_EXTRA_TESTS
> > -------------------------------------------------------------------------------
>
>
> Seems legit, from the log:
>
> <3>[   18.186181] rk3288-crypto ff8a0000.cypto-controller: [rk_load_data:123] pcopy err
> <3>[   18.199432] alg: skcipher: ecb-aes-rk encryption failed on test vector \"random: len=0 klen=32\"; expected_error=0, actual_error=-22, cfg=\"random: inplace use_finup nosimd src_divs=[100.0%@+2054] key_offset=16\"
> <0>[   18.220458] Kernel panic - not syncing: alg: self-tests for ecb-aes-rk (ecb(aes)) failed in panic_on_fail mode!
>
> Let me know if you need any help with testing a fix on this
> platform or anything.
>

This is an expected failure. I pushed this to my branch to check if
Eric's new AEAD testing code identifies any new problems on the
hardware we have in kernelCI, but it only found stuff we already knew
about.

> Also, as you probably only want this to be enabled in KernelCI
> and not merged upstream, we could have a config fragment to
> enable the config with your branch and maybe even others.
>

It would be *very* helpful if we could add Herbert's cryptodev branch
[0] to kernelCI with a kconfig fragment that turns off
CRYPTO_MANAGER_DISABLE_TESTS and turns on CRYPTO_MANAGER_EXTRA_TESTS,
and passes cryptomgr.panic_on_fail=1 on the kernel command line. That
way, we'll have rolling coverage of just the crypto changes queued up
in linux-next, but tested thoroughly on actual hardware, and without
the need to carry patches like the above to trigger the tests
explicitly.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
