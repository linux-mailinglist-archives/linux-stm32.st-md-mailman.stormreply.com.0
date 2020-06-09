Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B931F3FFC
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jun 2020 17:58:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22572C36B23;
	Tue,  9 Jun 2020 15:58:45 +0000 (UTC)
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFBC2C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2020 15:58:42 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id a13so20848361ilh.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2020 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XTmR8DDTbpuRLrg4Dxe54sTFIEfxL4/fHVrG5Q0Qecc=;
 b=AB6ptOdnB5z9Lot4ciWyiYuE6HGmWmbIwdMI2v9p37RW9vIGnX/vnPMfTcceN8kysj
 UeJRlrLlFtiLLa7ZUCBXFTB2if6niO5aciWexn6lLt74ARj+tvU7J0a6CMOm0N9Old5M
 0nNC/R75byfQkSBdHR0mO6oZN/MWIenirMnIZZZhA0Ku37cS/9VNeowWKVBSEFX/O7L1
 rUIuP1MX3QyEoJOP33FebN6F3wNj4C1hyz+NirfswshNJwyJG8B2m/ifCXWECX8DJl/1
 HOPF2UlCgfmOR8x4cXZOO6fbDlugUqovL3TaiN7r6LMrsSBhN4WbBcqbXTE3gf6CvMbn
 /WHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XTmR8DDTbpuRLrg4Dxe54sTFIEfxL4/fHVrG5Q0Qecc=;
 b=P3JWf7afX9uf9kkux5eMDaGP+jlJGMSFKFK6pw4JRrYAHavps+rkNR7PAeTg7fshoJ
 Z5aS9jqtWLybnVisE2XTfBDTJvdGos/Ns96Y7TPNwdY0aqj9mUulEY3gK5T1k0alaedx
 hwHm5QksupPjDAht/yP3wV53Dx7Bbk9wlk830GJIA3Wjnt/RwxK/hHy9ZzaIpNkKHXSc
 KtW65icLdjio0nWwwB8s0vUrEg9DIu+tk4R9rp4TBdJc9z5O5qX9BoIcFRL7vOi9lvo5
 EbAc8uVSY4EgPnpcHmKOcyulV9fB8ToHxgKjRIl5C2TshYf0HtxJg5D2vXI1cA5DW5oY
 wf7A==
X-Gm-Message-State: AOAM5320jReNpDQWPZYiYH+XLE3dMzg9g+4QI4xx8fxw52vWdNTJ6/ve
 Q4dNFcurFa8P62q7LE3kK0X9ys39DccHwAamJ6E=
X-Google-Smtp-Source: ABdhPJxux6g3vaB/cZUTBdsI/fsNLkF6h3A6gvPaXzdAi095druL3kMv7nH5YKpHBp3ajTNuv4JMpDOTRu2EDD2z9o8=
X-Received: by 2002:a92:ad02:: with SMTP id w2mr18619302ilh.184.1591718321670; 
 Tue, 09 Jun 2020 08:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <1591605038-8682-1-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1591605038-8682-1-git-send-email-dillon.minfei@gmail.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Tue, 9 Jun 2020 23:58:05 +0800
Message-ID: <CAL9mu0+hmyYGrTeHhvOhPHLm3nSWTt5waAr9e6Lzrdqxp5x5iQ@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@st.com>, linux@armlinux.org.uk, 
 Vladimir Murzin <vladimir.murzin@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>, 
 allison@lohutok.net, info@metux.net, tglx@linutronix.de, hch@lst.de
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH 0/2] Use 'arm_nommu_dma_ops' to handle dma
 memroy if device offer consistent dma memory region
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

Hi Christoph Hellwig,

This is the patchset. for your reference.

thanks,

On Mon, Jun 8, 2020 at 4:30 PM <dillon.minfei@gmail.com> wrote:
>
> From: dillon min <dillon.minfei@gmail.com>
>
> when do mmap on /dev/fb0, we will get -6 error on cortex-m3/m4 or armv7m
> platform without cache support, this is caused by following reason:
>
> on armv7m platform, if no cache support, we will use dma direct mapping,
> but, this is not support on !MMU hardware, just return '-ENXIO' error
>
> so, add use_reserved_mem() for these armv7m hardware but no-cache support.
> eg, stm32f429/stm32f469.
>
> verified on stm32f469-disco board, mmap frambuffer to userspace.
>
> dillon min (2):
>   ARM: dts: stm32: Setup 4M bytes reserved memory for mmap
>   arm-nommu: Add use_reserved_mem() to check if device support reserved
>     memory
>
>  arch/arm/boot/dts/stm32f469-disco.dts | 14 ++++++++++++++
>  arch/arm/mm/dma-mapping-nommu.c       | 28 +++++++++++++++++++++++++++-
>  2 files changed, 41 insertions(+), 1 deletion(-)
>
> --
> 2.7.4
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
