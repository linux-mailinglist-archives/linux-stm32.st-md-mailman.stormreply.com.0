Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C28889A04CB
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 10:55:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77649C78031;
	Wed, 16 Oct 2024 08:55:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D0ECC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 08:55:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 465ADFEC;
 Wed, 16 Oct 2024 01:56:19 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04EAC3F528;
 Wed, 16 Oct 2024 01:55:47 -0700 (PDT)
Date: Wed, 16 Oct 2024 09:55:38 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <Zw9_imsl2KLf7_GY@J2N7QTR9R3>
References: <Zw5D2aTkkUVOK89g@J2N7QTR9R3>
 <CACRpkdY79nbBoaHe6ijuyJS9dDduNw_sv1J90pz121YDgCvC3Q@mail.gmail.com>
 <Zw51fhCkmCYrTOeV@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEcLD3PWd-9osjo9AOe5Jg-NMOmJ8afB_x7VeboueLoeQ@mail.gmail.com>
 <Zw59x0LVS-kvs9Jv@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXEnhHkxywh8TH1i=fmyAR8cXZ8D-rvV43X-N7GpCf2Axw@mail.gmail.com>
 <Zw6Jk74-d0mhR0jx@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXG3bwMGpArYNUm-qMO7PPgb3--wy5kp-3Ks2Uv9M479xg@mail.gmail.com>
 <Zw6X9KQT0-z7r7SY@J2N7QTR9R3.cambridge.arm.com>
 <CAMj1kXGGmsWs2XpM7zLURjKp67Uz2ePi1pSV1=rPCMgviLVUgw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXGGmsWs2XpM7zLURjKp67Uz2ePi1pSV1=rPCMgviLVUgw@mail.gmail.com>
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

On Tue, Oct 15, 2024 at 07:28:06PM +0200, Ard Biesheuvel wrote:
> On Tue, 15 Oct 2024 at 18:27, Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > On Tue, Oct 15, 2024 at 06:07:00PM +0200, Ard Biesheuvel wrote:
> > > On Tue, 15 Oct 2024 at 17:26, Mark Rutland <mark.rutland@arm.com> wrote:
> > > > Looking some more, I don't see how VMAP_STACK guarantees that the
> > > > old/active stack is mapped in the new mm when switching from the old mm
> > > > to the new mm (which happens before __switch_to()).
> > > >
> > > > Either I'm missing something, or we have a latent bug. Maybe we have
> > > > some explicit copying/prefaulting elsewhere I'm missing?
> > >
> > > We bump the vmalloc_seq counter for that. Given that the top-level
> > > page table can only gain entries covering the kernel space, this
> > > should be sufficient for the old task's stack to be mapped in the new
> > > task's page tables.
> >
> > Ah, yep -- I had missed that. Thanks for the pointer!
> >
> > From a superficial look, it sounds like it should be possible to extend
> > that to also handle the KASAN shadow of the vmalloc area (which
> > __check_vmalloc_seq() currently doesn't copy), but I'm not sure of
> > exactly when we initialise the shadow for a vmalloc allocation relative
> > to updating vmalloc_seq.
> >
> 
> Indeed. It appears both vmalloc_seq() and arch_sync_kernel_mappings()
> need to take the vmalloc shadow into account specifically. And we may
> also need the dummy read from the stack's shadow in __switch_to - I am
> pretty sure I added that for a reason.

I believe that's necessary for the lazy TLB switch, at least for SMP:

	// CPU 0			// CPU 1

	<< switches to task X's mm >>

					<< creates kthread task Y >>
					<< maps task Y's new stack >>
					<< maps task Y's new shadow >>

					// Y switched out
					context_switch(..., Y, ..., ...);

	// Switch from X to Y
	context_switch(..., X, Y, ...) {
		// prev = X
		// next = Y

		if (!next->mm) { 
			// Y has no mm
			// No switch_mm() here
			// ... so no check_vmalloc_seq()
		} else {
			// not taken
		}

		...

		// X's mm still lacks Y's stack + shadow here

		switch_to(prev, next, prev);
	}

... so probably worth a comment that we're faulting in the new
stack+shadow for for lazy tlb when switching to a task with no mm?

In the lazy tlb case the current/old mappings don't disappear from the
active mm, and so we don't need to go add those to the new mm, which is what
we need check_vmalloc_seq() for.

Mark.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
