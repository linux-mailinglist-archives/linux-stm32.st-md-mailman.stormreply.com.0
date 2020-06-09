Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F29E31F3F27
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jun 2020 17:23:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2168EC36B23;
	Tue,  9 Jun 2020 15:23:06 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCC01C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2020 15:23:03 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id q8so23157222iow.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2020 08:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tm2L6wHDp3vnilQA0CPW6PPlVERzEGHmJnGxVxjkT7E=;
 b=T+Zzc+a927fTmCQYyxa3HRIQOfzwB1rlff67AJQPfhedtRBsi15M7hvfbqDBXLIz2Q
 4KRSTB9cKCGWi5zszA165U7802EQ1b74v54j3AsREkXTLXlxzSrced4LqVHdtgrT1BQ9
 icKt9YViOgQcAKVNZjPcxK88gttpktYPeUNKqPo0gT68ATxzhYHzokNHc6pQNtrlY3IB
 KLlyZtOGJ7375RmWBKPKHCsRXSeqb8bmjuZkdeSsCP5k1BIfCRczdUBF+5569MGYmO+T
 9qN0v9U3DtCz4Hj+aIgzbWRsAMWfOM1PmMsRZr4OhT+ygqb8U0vc40a1PdHjSqLm2//i
 88sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tm2L6wHDp3vnilQA0CPW6PPlVERzEGHmJnGxVxjkT7E=;
 b=POcnFYjAQA1s8/6nVmxWfj/SdBMuf5GtYSwlEa7muIo4QEzkziVt0JumNZnVzuuy5P
 xnl/kqGjNsw39CI2a44Jn7WV7zIqmFjtgz7aBQWTVfAoEXiVGMure5RpqGTvt2UNfVTf
 cE20B6a9WtNKR1wquqfSZUYOBz5esrKPf1qCK0QRtg5IVwn4la6Ig/Yv2LZVDkDKQzFd
 cGaWrogbucmumQNs6BDZ6oMEdjFQuMeHA4ZiIKp0jE4Dsfu5Kc6Y6RCtlYqb6wFe7vBQ
 Qw0uJpR6C7FCJRC6i9SA14PuTDp8tEMdax9QHRMNPY3P/EFk+w/jTu3W/AIHgjyTKGQY
 xDKQ==
X-Gm-Message-State: AOAM5330qzGZhkqwxVQxYXGh0nsGkYV8gT69Rqx45eMSZ9yaZL5p+5Rg
 faMm5sIdCzCJyWumPQKWnmzmhW0uP1kPk223jLs=
X-Google-Smtp-Source: ABdhPJzVZNaa7SnqUFgCpq6WJTUKH4jHLaYl37zbFlWb1E6BwdaMRDZEkUg9vCMO67A149eiG/aXayH1ph7RpIU/MNM=
X-Received: by 2002:a05:6638:d05:: with SMTP id
 q5mr26413027jaj.2.1591716182166; 
 Tue, 09 Jun 2020 08:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <1591605038-8682-1-git-send-email-dillon.minfei@gmail.com>
 <1591605038-8682-3-git-send-email-dillon.minfei@gmail.com>
 <90df5646-e0c4-fcac-d934-4cc922230dd2@arm.com>
In-Reply-To: <90df5646-e0c4-fcac-d934-4cc922230dd2@arm.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Tue, 9 Jun 2020 23:22:24 +0800
Message-ID: <CAL9mu0+__0Z3R3TcSrj9-kPxsyQHKS9WqK1u58P0dEZ+Jd-wbQ@mail.gmail.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>, hch@lst.de
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux@armlinux.org.uk,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, tglx@linutronix.de,
 info@metux.net, linux-stm32@st-md-mailman.stormreply.com, allison@lohutok.net
Subject: Re: [Linux-stm32] [PATCH 2/2] arm-nommu: Add use_reserved_mem() to
 check if device support reserved memory
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

Hi Vladimir,

Thanks for reviewing.

Hi Christoph Hellwig,

I just want to know if kernel dma mapping/direct is focused on
platforms with MMU.
leave arch code to handle dma coherent memory management themself for
no-MMU platform.

so, you just return error code in kernel/dma/mapping.c,direct.c
without CONFIG_MMU defined ?
which means dma-direct mapping doesn't support !CONFIG_MMU is not a
bug, but design as it's.
or, just return error code currently, will add dma direct mapping
support for !CONFIG_MMU in the
future?

As Vladimir Murzin's suggestion has changes in kernel code, I need
your input to get
the design goal about dma-direct mapping, thanks.

On Tue, Jun 9, 2020 at 10:07 PM Vladimir Murzin <vladimir.murzin@arm.com> wrote:
>
> On 6/8/20 9:30 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > Currently, we use dma direct to request coherent memory for driver on armv7m
> > platform if 'cacheid' is zero, but dma_direct_can_mmap() is return false,
> > dma_direct_mmap() return -ENXIO for CONFIG_MMU undefined platform.
> >
> > so we have to back to use 'arm_nommu_dma_ops', add use_reserved_mem() to check
> > if device support global or device corherent memory. if yes, then call
> > set_dma_ops()
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >  arch/arm/mm/dma-mapping-nommu.c | 28 +++++++++++++++++++++++++++-
> >  1 file changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-mapping-nommu.c
> > index 287ef898a55e..e1c213fec152 100644
> > --- a/arch/arm/mm/dma-mapping-nommu.c
> > +++ b/arch/arm/mm/dma-mapping-nommu.c
> > @@ -14,6 +14,7 @@
> >  #include <asm/cacheflush.h>
> >  #include <asm/outercache.h>
> >  #include <asm/cp15.h>
> > +#include <linux/of.h>
> >
> >  #include "dma.h"
> >
> > @@ -188,6 +189,31 @@ const struct dma_map_ops arm_nommu_dma_ops = {
> >  };
> >  EXPORT_SYMBOL(arm_nommu_dma_ops);
> >
> > +static bool use_reserved_mem(struct device *dev)
> > +{
> > +     struct device_node *np;
> > +
> > +     np = of_find_node_by_path("/reserved-memory/linux,dma");
> > +
> > +     if (np &&
> > +             of_device_is_compatible(np, "shared-dma-pool") &&
> > +             of_property_read_bool(np, "no-map") &&
> > +             of_property_read_bool(np, "linux,dma-default")) {
> > +             /* has global corherent mem support */
> > +             of_node_put(np);
> > +             return true;
> > +     }
> > +
> > +     np = of_parse_phandle(dev->of_node, "memory-region", 0);
> > +     if (np) {
> > +             /* has dev corherent mem support */
> > +             of_node_put(np);
> > +             return true;
> > +     }
> > +
> > +     return false;
> > +}
> > +
> >  void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> >                       const struct iommu_ops *iommu, bool coherent)
> >  {
> > @@ -206,6 +232,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> >               dev->archdata.dma_coherent = (get_cr() & CR_M) ? coherent : true;
> >       }
> >
> > -     if (!dev->archdata.dma_coherent)
> > +     if (!dev->archdata.dma_coherent || use_reserved_mem(dev))
> >               set_dma_ops(dev, &arm_nommu_dma_ops);
> >  }
> >
>
> Sorry I have to NAK this hack :(
>
> Digging git history reveled 79964a1c2972 ("ARM: 8633/1: nommu: allow mmap when !CONFIG_MMU")
> which make me wonder if diff below does the trick for you
>
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 8f4bbda..8623b9e 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -456,14 +456,14 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
>  #else /* CONFIG_MMU */
>  bool dma_direct_can_mmap(struct device *dev)
>  {
> -       return false;
> +       return true;
>  }
>
>  int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
>                 void *cpu_addr, dma_addr_t dma_addr, size_t size,
>                 unsigned long attrs)
>  {
> -       return -ENXIO;
> +       return vm_iomap_memory(vma, vma->vm_start, (vma->vm_end - vma->vm_start));;
>  }
>  #endif /* CONFIG_MMU */
Yes, this is a quite nice way to support !CONFIG_MMU without cache on
platforms. I will try your suggestion.
thanks

>
> Cheers
> Vladimir
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
