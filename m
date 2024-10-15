Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0D399F405
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 19:28:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2235C78030;
	Tue, 15 Oct 2024 17:28:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B953C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 17:28:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 55D4A5C565E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 17:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7057FC4CEC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 17:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729013299;
 bh=SvcSbNOV5T7V2CTtwonfghWnpiklqA3U7lIbuIE4G+Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oOX/5/Mh/ly1EsAVemx+gPhlkl/hdlXNmXx6dSD5GuWJQWHvl5golqpq+fjfiE4Xb
 qevXKTK+h5PjTPFrYw37gVEjUTUzfj8AcapAbWZTg0F89dMQweaW4wGNuF4y1+80cJ
 OlsIdF/HAGsosdXOIf4vAownWKijVRqCrgZht9A/1dlcu2F1U2PUgPmGQ5AR2SfNQ4
 w83mq9HwXCQ5OXvyLS8sXtHmMIhXQHQ/11Pg88Z3v+MT1eMf6Uf3WxCUZE5Z16U7Js
 Wp5QBVbMQ4bQiQnVGVJWQGOcfrtrTXtjtQNslECH136zdOILjf6nUs8JQgx10y0RJv
 VNlUtA+3oLkWQ==
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539e1543ab8so6660906e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 10:28:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVCOTKPJmf0fCB8DIVYI1L1hJn93gXDAV7byYv9c43DOZb2XirW4f3SNa1lxlWrRg17QeM66IoRTe68ew==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw3iiA6+JMOcunC5cISm6mcVSGDDfHjDWbXgzQ15XxTMMoz0ndm
 vYQcjcKiHs80MlFxYsz6MocLaAnmHmPZEweHETmn+96w1WT7Qja04Xhlube8KHzs9PnwGWYPQhX
 Rdo3Ncgi3FC9SiWWz3JVBDg2Ln6Q=
X-Google-Smtp-Source: AGHT+IE5GOsOWQkMJkrj4nhB0GASLO2dOdYEjGu86LFNxJf9a5XL+AzU5hJxbhgWTqIjSR+qZV4yAeu2L86rm2hdapI=
X-Received: by 2002:a05:6512:3f12:b0:539:959e:f0d0 with SMTP id
 2adb3069b0e04-539e54e823cmr8475739e87.21.1729013297829; Tue, 15 Oct 2024
 10:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com>
 <Zw5D2aTkkUVOK89g@J2N7QTR9R3>
 <CACRpkdY79nbBoaHe6ijuyJS9dDduNw_sv1J90pz121YDgCvC3Q@mail.gmail.com>
 <Zw51fhCkmCYrTOeV@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEcLD3PWd-9osjo9AOe5Jg-NMOmJ8afB_x7VeboueLoeQ@mail.gmail.com>
 <Zw59x0LVS-kvs9Jv@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEnhHkxywh8TH1i=fmyAR8cXZ8D-rvV43X-N7GpCf2Axw@mail.gmail.com>
 <Zw6Jk74-d0mhR0jx@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXG3bwMGpArYNUm-qMO7PPgb3--wy5kp-3Ks2Uv9M479xg@mail.gmail.com>
 <Zw6X9KQT0-z7r7SY@J2N7QTR9R3.cambridge.arm.com>
In-Reply-To: <Zw6X9KQT0-z7r7SY@J2N7QTR9R3.cambridge.arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 15 Oct 2024 19:28:06 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGGmsWs2XpM7zLURjKp67Uz2ePi1pSV1=rPCMgviLVUgw@mail.gmail.com>
Message-ID: <CAMj1kXGGmsWs2XpM7zLURjKp67Uz2ePi1pSV1=rPCMgviLVUgw@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] Crash on armv7-a using KASAN
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

On Tue, 15 Oct 2024 at 18:27, Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Tue, Oct 15, 2024 at 06:07:00PM +0200, Ard Biesheuvel wrote:
> > On Tue, 15 Oct 2024 at 17:26, Mark Rutland <mark.rutland@arm.com> wrote:
> > > Looking some more, I don't see how VMAP_STACK guarantees that the
> > > old/active stack is mapped in the new mm when switching from the old mm
> > > to the new mm (which happens before __switch_to()).
> > >
> > > Either I'm missing something, or we have a latent bug. Maybe we have
> > > some explicit copying/prefaulting elsewhere I'm missing?
> >
> > We bump the vmalloc_seq counter for that. Given that the top-level
> > page table can only gain entries covering the kernel space, this
> > should be sufficient for the old task's stack to be mapped in the new
> > task's page tables.
>
> Ah, yep -- I had missed that. Thanks for the pointer!
>
> From a superficial look, it sounds like it should be possible to extend
> that to also handle the KASAN shadow of the vmalloc area (which
> __check_vmalloc_seq() currently doesn't copy), but I'm not sure of
> exactly when we initialise the shadow for a vmalloc allocation relative
> to updating vmalloc_seq.
>

Indeed. It appears both vmalloc_seq() and arch_sync_kernel_mappings()
need to take the vmalloc shadow into account specifically. And we may
also need the dummy read from the stack's shadow in __switch_to - I am
pretty sure I added that for a reason.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
