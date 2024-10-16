Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 506BD9A086B
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 13:33:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C67BC78031;
	Wed, 16 Oct 2024 11:33:10 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 034E6C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 11:33:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DC1DEA42664
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 11:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E978C4AF09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 11:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729078381;
 bh=AgAb2/0Ar0SNrTRqLsq8IGW9WXAFzXTWj6vD2c0csaE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uYnWyXnDKbzlY5CliMnpskooLOd8vvnA3ggEPgdkRfgerLYOY/7WULiAAITDpIwUE
 9vk74pr0eXb0bS2+RpVU+EiXMgLsLHE6+4hyoxYhtBdoShgxgvGbUucD+Qe5+C9fN5
 ea7xMx6U6i8zk4C5I8S8BQJrfwngTcdnnlD6kOQ2T+0M0nxvMYz/4Xl1wQ3EszRIcD
 AA+J4KhQxOm3b3ImGVdUVMClp4rDbFFjDQoUSyggHpvvYHy7vhsIHq7GR0Y324SZZ+
 BWVp9lRti4zBud6MD5oFsHAXg0GnHQ6jNqnjSbByLXrFJXWb0LyooSsvrs36cchkVL
 pavyHnJ6zN1jg==
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2fb3ce15172so7600811fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 04:33:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWwDV3FRhOcsK+0Q+ObpIREAsADvHXaTgotJb2MRSlEcCrhDfFs/21cjqaeIdQY6xUFeZDi1Z2YBZqpIg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YytnQyraEeWRoZltS5ge9yRWKrxlSACa5yigHmctuefzblbh+Pr
 DKK365kkscKxQjQ4zt1BXbmBhY7zut/DXNQ0BPl+4AcJLSzPU0JxZrfKCV+3k3oB1TeAYVpVewi
 A2gpUxmDKjOsQi2LS5LFRqES95kg=
X-Google-Smtp-Source: AGHT+IHrgsSoxLlIJcPoKJq8iBlYE3eb86eDcfSfZ6Vt9oZtqS4DVKxBoJPTTgmTOC+VgTV+sz8N7qsFIS19fkP9Tr0=
X-Received: by 2002:a05:651c:2209:b0:2fb:55b0:82b8 with SMTP id
 38308e7fff4ca-2fb61b34167mr12008591fa.4.1729078379930; Wed, 16 Oct 2024
 04:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20241015-arm-kasan-vmalloc-crash-v1-0-dbb23592ca83@linaro.org>
 <20241015-arm-kasan-vmalloc-crash-v1-1-dbb23592ca83@linaro.org>
In-Reply-To: <20241015-arm-kasan-vmalloc-crash-v1-1-dbb23592ca83@linaro.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 16 Oct 2024 13:32:48 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHuJ9JjbxcG0LkRpQiPzW-BDfX+LoW3+W_cfsD=1hdPDg@mail.gmail.com>
Message-ID: <CAMj1kXHuJ9JjbxcG0LkRpQiPzW-BDfX+LoW3+W_cfsD=1hdPDg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
 Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: ioremap: Flush PGDs for VMALLOC
	shadow
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

On Tue, 15 Oct 2024 at 23:37, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> When sync:ing the VMALLOC area to other CPUs, make sure to also
> sync the KASAN shadow memory for the VMALLOC area, so that we
> don't get stale entries for the shadow memory in the top level PGD.
>
> Cc: stable@vger.kernel.org
> Fixes: 565cbaad83d8 ("ARM: 9202/1: kasan: support CONFIG_KASAN_VMALLOC")
> Link: https://lore.kernel.org/linux-arm-kernel/a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com/
> Reported-by: Clement LE GOFFIC <clement.legoffic@foss.st.com>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/mm/ioremap.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
> index 794cfea9f9d4..449f1f04814c 100644
> --- a/arch/arm/mm/ioremap.c
> +++ b/arch/arm/mm/ioremap.c
> @@ -23,6 +23,7 @@
>   */
>  #include <linux/module.h>
>  #include <linux/errno.h>
> +#include <linux/kasan.h>
>  #include <linux/mm.h>
>  #include <linux/vmalloc.h>
>  #include <linux/io.h>
> @@ -125,6 +126,12 @@ void __check_vmalloc_seq(struct mm_struct *mm)
>                        pgd_offset_k(VMALLOC_START),
>                        sizeof(pgd_t) * (pgd_index(VMALLOC_END) -
>                                         pgd_index(VMALLOC_START)));
> +               if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
> +                       memcpy(pgd_offset(mm, (unsigned long)kasan_mem_to_shadow((void *)VMALLOC_START)),
> +                              pgd_offset_k((unsigned long)kasan_mem_to_shadow((void *)VMALLOC_START)),
> +                              sizeof(pgd_t) * (pgd_index((unsigned long)kasan_mem_to_shadow((void *)VMALLOC_END)) -
> +                                               pgd_index((unsigned long)kasan_mem_to_shadow((void *)VMALLOC_START))));
> +               }

+1 to Russell's suggestion to change this wall of text into something legible.

Then, there is another part to this: in arch/arm/kernel/traps.c, we
have the following code

void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
{
    if (start < VMALLOC_END && end > VMALLOC_START)
        atomic_inc_return_release(&init_mm.context.vmalloc_seq);
}

where we only bump vmalloc_seq if the updated region overlaps with the
vmalloc region, so this will need a similar treatment afaict.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
