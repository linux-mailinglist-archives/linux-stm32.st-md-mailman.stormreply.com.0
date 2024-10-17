Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B309A207B
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 13:03:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A3BCC78032;
	Thu, 17 Oct 2024 11:03:37 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C89A8C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 11:03:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8270EA43923
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 11:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3225CC4CEC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 11:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729163009;
 bh=BxzV3Q3Kns6mqX5qJ4uWTj9fdHOeg+aLWIck9ypRMSs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tVYvrOQjfb9J1ThETVIdg5sr9FRMFoz4f30y5VzDusV59u8M51EObHvPfofUhnkjw
 nlrEmc529zZt1OlbTcf0eJwjKru1jtv8w8snl/0+nMRqFSEr0Zqzr3JtkTkdxOI1GH
 aOda9FhIAqHIp6rEvCOq3VKqdFPtULWprrrp3ZJSyeLaJV+bqgCe06d934rJnnomrP
 4QMGwgZLWhSozgMM8V8zCS2nvvs9Q8tFjA+4aU9gPPw25m9hLJw5GLETlW/FkUFN8S
 xXS6J0AhwXMiHDDU7v5S7LgbCa5OuQJePCRAPSh1w1Vx0zRv+BvkOLKCktljIxIZjC
 Xl8a7FqnMe1jg==
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539e1543ab8so1401721e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 04:03:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXiyXkConFDk2zg5WMv4WAPlc9znuUu/feCexYXPlvDq/5ahHrUQrzm2cY2UA+FZuT3eblKhYHu80xEZg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw+fcpU3DlqKuOZQdcoabj7ymFB9AYqkpxX7h1jN9ehIhSeTJZ8
 An3SIkcHSIETRsSFV4H/Jcm0H3vZZ9Tlrf5J8F/XDyKfi7AytO96zTLZSdFbhuU1sBpQ7M7ZQcB
 P76canizCk8Hwp7UeSDtZ6MTmDiY=
X-Google-Smtp-Source: AGHT+IGCO8vS29Sa5K89HG8yPcVAVf4A86d08xdVfeLGJGg8X8cFtVrgc8q8oFI8bwatzVhSSwEl1zXdJj1pRyFe+co=
X-Received: by 2002:a05:6512:3e06:b0:536:a7a4:c3d4 with SMTP id
 2adb3069b0e04-539e571c959mr14127110e87.39.1729163007547; Thu, 17 Oct 2024
 04:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241016-arm-kasan-vmalloc-crash-v2-0-0a52fd086eef@linaro.org>
 <20241016-arm-kasan-vmalloc-crash-v2-1-0a52fd086eef@linaro.org>
 <ZxDnP3rAAHLHgEXc@J2N7QTR9R3>
In-Reply-To: <ZxDnP3rAAHLHgEXc@J2N7QTR9R3>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 17 Oct 2024 13:03:16 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFpR7MNTTLxdURE7k+PZ0vStQD_BMk92kjSbneqN3WnZQ@mail.gmail.com>
Message-ID: <CAMj1kXFpR7MNTTLxdURE7k+PZ0vStQD_BMk92kjSbneqN3WnZQ@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v2 1/2] ARM: ioremap: Sync PGDs for
	VMALLOC shadow
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

On Thu, 17 Oct 2024 at 12:30, Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Wed, Oct 16, 2024 at 09:15:21PM +0200, Linus Walleij wrote:
> > When sync:ing the VMALLOC area to other CPUs, make sure to also
> > sync the KASAN shadow memory for the VMALLOC area, so that we
> > don't get stale entries for the shadow memory in the top level PGD.
> >
> > Since we are now copying PGDs in two instances, create a helper
> > function named memcpy_pgd() to do the actual copying, and
> > create a helper to map the addresses of VMALLOC_START and
> > VMALLOC_END into the corresponding shadow memory.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 565cbaad83d8 ("ARM: 9202/1: kasan: support CONFIG_KASAN_VMALLOC")
> > Link: https://lore.kernel.org/linux-arm-kernel/a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com/
> > Reported-by: Clement LE GOFFIC <clement.legoffic@foss.st.com>
> > Suggested-by: Mark Rutland <mark.rutland@arm.com>
> > Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  arch/arm/mm/ioremap.c | 25 +++++++++++++++++++++----
> >  1 file changed, 21 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
> > index 794cfea9f9d4..94586015feed 100644
> > --- a/arch/arm/mm/ioremap.c
> > +++ b/arch/arm/mm/ioremap.c
> > @@ -23,6 +23,7 @@
> >   */
> >  #include <linux/module.h>
> >  #include <linux/errno.h>
> > +#include <linux/kasan.h>
> >  #include <linux/mm.h>
> >  #include <linux/vmalloc.h>
> >  #include <linux/io.h>
> > @@ -115,16 +116,32 @@ int ioremap_page(unsigned long virt, unsigned long phys,
> >  }
> >  EXPORT_SYMBOL(ioremap_page);
> >
> > +static unsigned long arm_kasan_mem_to_shadow(unsigned long addr)
> > +{
> > +     return (unsigned long)kasan_mem_to_shadow((void *)addr);
> > +}
> > +
> > +static void memcpy_pgd(struct mm_struct *mm, unsigned long start,
> > +                    unsigned long end)
> > +{
> > +     memcpy(pgd_offset(mm, start), pgd_offset_k(start),
> > +            sizeof(pgd_t) * (pgd_index(end) - pgd_index(start)));
> > +}
> > +
> >  void __check_vmalloc_seq(struct mm_struct *mm)
> >  {
> >       int seq;
> >
> >       do {
> >               seq = atomic_read(&init_mm.context.vmalloc_seq);
> > -             memcpy(pgd_offset(mm, VMALLOC_START),
> > -                    pgd_offset_k(VMALLOC_START),
> > -                    sizeof(pgd_t) * (pgd_index(VMALLOC_END) -
> > -                                     pgd_index(VMALLOC_START)));
> > +             memcpy_pgd(mm, VMALLOC_START, VMALLOC_END);
> > +             if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
> > +                     unsigned long start =
> > +                             arm_kasan_mem_to_shadow(VMALLOC_START);
> > +                     unsigned long end =
> > +                             arm_kasan_mem_to_shadow(VMALLOC_END);
> > +                     memcpy_pgd(mm, start, end);
> > +             }
>
> This looks good; FWIW:
>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
>
> As a separate thing, I believe we also need to use atomic_read_acquire()
> for the reads of vmalloc_seq to pair with the atomic_*_release() on each
> update.
>
> Otherwise, this can be reordered, e.g.
>
>         do {
>                 memcpy_pgd(...);
>                 seq = atomic_read(&init_mm.context.vmalloc_seq);
>                 atomic_set_release(&mm->context.vmalloc_seq, seq);
>         } while (seq != atomic_read(&init_mm.context.vmalloc_seq)
>
> ... and we might fail to copy the relevant table entries from init_mm,
> but still think we're up-to-date and update mm's vmalloc_seq.
>

The compiler cannot reorder this as it has to assume that the memcpy()
may have side effects that affect the result of the atomic read.

So the question is whether this CPU can observe the new value of
init_mm.context.vmalloc_seq but still see the old contents of its page
tables in case another CPU is modifying init_mm concurrently.
atomic_read_acquire() definitely seems more appropriate here to
prevent that from happening, and I don't recall why I didn't use that
at the time.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
