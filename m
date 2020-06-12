Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A95FF1F721E
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2020 04:15:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C645C36B21;
	Fri, 12 Jun 2020 02:15:49 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A238EC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2020 02:15:46 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id o5so8650392iow.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2020 19:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NBuImNZJUOHAcMdNirnqNdfxcsQ2t26UAs7QUyiyLrA=;
 b=CSvZe25C2fwv4G8CtuJ5LGADD7XH1+hw3iXV3UPdybI2Wn5uesXsz6c2ZXa8XqBuNu
 9MUqBYO00T1Dlka13KaqXswvqCfxqtdF14PATYtXoQkymTy4LobTZZujA+y65BQXu6Vt
 IyFvDgL+E97bi2woUM6AIIy6coqRYOvjJnLFKXvWNREnlN0DiowuGK87YtfmPgB5ibRK
 /thKJEo3PcrmOyiF6jn3hMYxeLEiAJLnNc2XKn5suQGDqeR7nKzoLqk3Xntbh3ERpFNN
 7ytP9nTB8B4Q3ZYCpDFA8HEzYAmQ46D6slN1tB+7XqzPPcbzTFrGTDuamjgrj7UG8qCp
 WMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NBuImNZJUOHAcMdNirnqNdfxcsQ2t26UAs7QUyiyLrA=;
 b=Q53H9cFCWsfdYxn4xTikytYaVPeAN7eCZV1fo0iBTpPvf2qsQQf3tze7mgJnnaHa+g
 z1WFw1HxYA0BuufS7mnqanpXYVup4zdwEh9SSvZV7yHugJG/i/wYbPLNprOs61vIBL5a
 kSxcc+gStDnCaLL286EzkTe+qqzLlov+TONU+D/iDlN5QEHwEXzPB6SEZd46CendSxRg
 cwivzdZ13tcEETYh/GrdXJL/QeNirwKK3dMgezXuza4sCc+up7lwBg/5I2gEG9i7EEcN
 +GoUUEtyG+oRUxzwOf8Zur3baAG56gSgLBwAtFiKgazflY392FN7y8/pIAtqA7rZxMwl
 bh3w==
X-Gm-Message-State: AOAM5314GSDcpVmwtihmgs0+SGKU1BnH+8ZdTAK+k7LXDARsftOwBQAF
 nz2c3b/9W6vaZQNjwDT7vQudxarrmqE1qlk04qI=
X-Google-Smtp-Source: ABdhPJxMBOHc52GKXGY4KZd1zNrgtQTD0ozbXNYiuxbWME1ZaP5hoURzRjxVunisuqPjhbSGemzXmgIgilN6zmmjmP0=
X-Received: by 2002:a05:6602:2ac9:: with SMTP id
 m9mr11505755iov.68.1591928145464; 
 Thu, 11 Jun 2020 19:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <1591605038-8682-1-git-send-email-dillon.minfei@gmail.com>
 <1591605038-8682-3-git-send-email-dillon.minfei@gmail.com>
 <90df5646-e0c4-fcac-d934-4cc922230dd2@arm.com>
 <20200610072444.GA6293@infradead.org>
 <9c3a7b4e-0190-e9bb-91fe-6d5692559888@arm.com>
 <27881ee0-dc40-e8c6-34f6-712f9acc3fbc@arm.com>
In-Reply-To: <27881ee0-dc40-e8c6-34f6-712f9acc3fbc@arm.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 12 Jun 2020 10:15:08 +0800
Message-ID: <CAL9mu0+ZfW-DoO-DvhvGO-KeGMA+vuHga3FOxN_Ce7uStGPoqg@mail.gmail.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux@armlinux.org.uk,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Rob Herring <robh+dt@kernel.org>,
 allison@lohutok.net, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 tglx@linutronix.de, info@metux.net, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On Thu, Jun 11, 2020 at 11:45 PM Vladimir Murzin
<vladimir.murzin@arm.com> wrote:
>
> On 6/10/20 9:19 AM, Vladimir Murzin wrote:
> > On 6/10/20 8:24 AM, Christoph Hellwig wrote:
> >> Ok, I finally found the original patch from Vladimir.  Comments below:
> >>
> >>> +++ b/kernel/dma/direct.c
> >>> @@ -456,14 +456,14 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
> >>>  #else /* CONFIG_MMU */
> >>>  bool dma_direct_can_mmap(struct device *dev)
> >>>  {
> >>> -   return false;
> >>> +   return true;
> >>>  }
> >>>
> >>>  int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
> >>>             void *cpu_addr, dma_addr_t dma_addr, size_t size,
> >>>             unsigned long attrs)
> >>>  {
> >>> -   return -ENXIO;
> >>> +   return vm_iomap_memory(vma, vma->vm_start, (vma->vm_end - vma->vm_start));;
> >>
> >> I think we should try to reuse the mmu dma_direct_mmap implementation,
> >> which does about the same.  This version has been compile tested on
> >> arm-nommu only, let me know what you think: (btw, a nommu_defconfig of
> >> some kind for arm would be nice..)
> >
> > Catch-all nommu_defconfig is not easy for ARM, AFAIK folk carry few hacks
> > for randconfig...
> >
> > Meanwhile, known working NOMMU configs
> >
> > $ git grep "# CONFIG_MMU is not set" arch/arm/configs/
> > arch/arm/configs/efm32_defconfig:# CONFIG_MMU is not set
> > arch/arm/configs/lpc18xx_defconfig:# CONFIG_MMU is not set
> > arch/arm/configs/mps2_defconfig:# CONFIG_MMU is not set
> > arch/arm/configs/stm32_defconfig:# CONFIG_MMU is not set
> > arch/arm/configs/vf610m4_defconfig:# CONFIG_MMU is not set
> >
> >>
> >> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> >> index d006668c0027d2..e0dae570a51530 100644
> >> --- a/kernel/dma/Kconfig
> >> +++ b/kernel/dma/Kconfig
> >> @@ -71,6 +71,7 @@ config SWIOTLB
> >>  # in the pagetables
> >>  #
> >>  config DMA_NONCOHERENT_MMAP
> >> +    default y if !MMU
> >>      bool
> >
> > Nit: def_bool !MMU
> >
> >>
> >>  config DMA_REMAP
> >> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> >> index 0a4881e59aa7d6..9ec6a5c3fc578c 100644
> >> --- a/kernel/dma/direct.c
> >> +++ b/kernel/dma/direct.c
> >> @@ -459,7 +459,6 @@ int dma_direct_get_sgtable(struct device *dev, struct sg_table *sgt,
> >>      return ret;
> >>  }
> >>
> >> -#ifdef CONFIG_MMU
> >>  bool dma_direct_can_mmap(struct device *dev)
> >>  {
> >>      return dev_is_dma_coherent(dev) ||
> >> @@ -485,19 +484,6 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
> >>      return remap_pfn_range(vma, vma->vm_start, pfn + vma->vm_pgoff,
> >>                      user_count << PAGE_SHIFT, vma->vm_page_prot);
> >>  }
> >> -#else /* CONFIG_MMU */
> >> -bool dma_direct_can_mmap(struct device *dev)
> >> -{
> >> -    return false;
> >> -}
> >> -
> >> -int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
> >> -            void *cpu_addr, dma_addr_t dma_addr, size_t size,
> >> -            unsigned long attrs)
> >> -{
> >> -    return -ENXIO;
> >> -}
> >> -#endif /* CONFIG_MMU */
> >>
> >>  int dma_direct_supported(struct device *dev, u64 mask)
> >>  {
> >>
> >
> > LGTM. FWIW:
> >
> > Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
> >
> >
>
> @dillon, can you give it a try?
>
> I think Christoph would appreciate your Tested-by and that might speed up
> getting fix mainline.
>
sorry for the late response. Yes, it's working

Thanks Christoph

index 8f4bbdaf965e..3e0ecf0b5fb3 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -427,7 +427,6 @@ int dma_direct_get_sgtable(struct device *dev,
struct sg_table *sgt,
        return ret;
 }

-#ifdef CONFIG_MMU
 bool dma_direct_can_mmap(struct device *dev)
 {
        return dev_is_dma_coherent(dev) ||
@@ -453,19 +452,6 @@ int dma_direct_mmap(struct device *dev, struct
vm_area_struct *vma,
        return remap_pfn_range(vma, vma->vm_start, pfn + vma->vm_pgoff,
                        user_count << PAGE_SHIFT, vma->vm_page_prot);
 }
-#else /* CONFIG_MMU */
-bool dma_direct_can_mmap(struct device *dev)
-{
-       return false;
-}
-
-int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
-               void *cpu_addr, dma_addr_t dma_addr, size_t size,
-               unsigned long attrs)
-{
-       return -ENXIO;
-}
-#endif /* CONFIG_MMU */

Tested-by:  dillon min <dillon.minfei@gmail.com>

>
> Cheers
> Vladimir
>
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
