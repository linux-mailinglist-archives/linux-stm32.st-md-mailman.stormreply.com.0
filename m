Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8F11F4003
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jun 2020 17:59:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37211C36B23;
	Tue,  9 Jun 2020 15:59:11 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0C07C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2020 15:59:09 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id e11so15689832ilr.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2020 08:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y7SNiI5A6RVtZsHvA5zBiQnX39Ic6ndLkU+dDGZxkkE=;
 b=BYvYUZgKPOiFqhDqHbdFaVtVeJjo2pF7jf1ADysyareZY2mE4JGcQkzWaTDD40WYr9
 rFsr99M5cb58XA+NucQrVrbraWMQKkQOnByLp3ArV3tE+p6LIQpWDb5q8GXyVna1RXsH
 8XvEZItxotESA+kA9wSCI+i1eisarnUJ/tKVc/XVlldBXDeoMjuvSp6QoPHDktjB6I26
 As3IEs6xOqwP4bavd8E4NI8w0pAsUTvIZ/oewpgNE0SkevnlK7NrW75K1gn1CSOrCmei
 N4zXN0vWMHe5hLTpfmrSvAM3KYJjns0Vxnc4yE1ECaYPUXayuSn38H2DsKjFYrp4nkAD
 Nm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y7SNiI5A6RVtZsHvA5zBiQnX39Ic6ndLkU+dDGZxkkE=;
 b=eqCIGnXGVw1KFa5qxHSoxt+C5xH5mJDHtGxVLwxJonZ2KNc7hw+Rd7dgRX7d3e0qxt
 rSivXdSIrI5fu/kymzBSLeFavyc3zo0PBXvpMXp4cVdJZuMz5EVgn45tcqVJ2QaW+6Vb
 IFNwH2epE6nAUQMJXv9cmZGNe97IPhaQKVNTeH71vJd86fQJgmcGI1bBrnbaYeD3ynDC
 jZPWFgCIShrrVDnUErqXfRqBX7x7IVPH2gz81YzyiuRohYEMXBmrEOae9+EJi33f3KaC
 FuFK92pUnlZuzgI7rL8hcfnzeDsiYhdAp3EQ7Srvq6lsc0UxhsV4/RXkTR4oJU+VIT/g
 T/ug==
X-Gm-Message-State: AOAM530bUK2JnGNr9bdn4F9XoPNVFmXXZs7UBekuqjdZOTehvDdJRGFF
 4/9L8aWKYMT2QQ3GGl94JXrtnbdUwftt0c+GGDY=
X-Google-Smtp-Source: ABdhPJwrxzXrTqDvIYEv7sGYGoTfNgdI9+AwSKTngZ8wOe8qpPn+MALOTP1Ir5yJrOFe2XEpcp7yexnICas3NiVZxPk=
X-Received: by 2002:a92:914a:: with SMTP id t71mr27627735ild.200.1591718348616; 
 Tue, 09 Jun 2020 08:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <1591605038-8682-1-git-send-email-dillon.minfei@gmail.com>
 <1591605038-8682-2-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1591605038-8682-2-git-send-email-dillon.minfei@gmail.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Tue, 9 Jun 2020 23:58:32 +0800
Message-ID: <CAL9mu0KWq-ANkLBRv_49kGzWf_kDPjMvMeA7S4E6f5MpVtjKaw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: Setup 4M bytes
	reserved memory for mmap
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
> To mmap a framebuffer or v4l2 buffer from kernel to userspace on
> no-mmu platform, we need rely on 'arm_nommu_dma_ops' from
> arch/arm/mm/dma-mapping-nommu.c , so setup 4M bytes memory
> reserved for this purpose.
>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  arch/arm/boot/dts/stm32f469-disco.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
> index 9397db0c43de..082b24ee81f7 100644
> --- a/arch/arm/boot/dts/stm32f469-disco.dts
> +++ b/arch/arm/boot/dts/stm32f469-disco.dts
> @@ -65,6 +65,20 @@
>                 reg = <0x00000000 0x1000000>;
>         };
>
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               linux,dma {
> +                       compatible = "shared-dma-pool";
> +                       size = <0x400000>;
> +                       no-map;
> +                       linux,dma-default;
> +               };
> +
> +       };
> +
>         aliases {
>                 serial0 = &usart3;
>         };
> --
> 2.7.4
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
