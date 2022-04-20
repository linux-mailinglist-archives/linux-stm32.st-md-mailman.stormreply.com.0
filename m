Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E69EF508B28
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Apr 2022 16:50:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98B1AC6047D;
	Wed, 20 Apr 2022 14:50:42 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18050C5EC76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Apr 2022 14:50:41 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id d198so1341933qkc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Apr 2022 07:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JEzFnCq+BQP5/7i1OwdP+xfd73rvdn4Cf2EKhcjMDFo=;
 b=r+q9h/MsJo+F3yzo45pS95zvOUS50Q6iYIjbvnyRPeVargnn54NqmaGy5LJesSKJ1Q
 FzjPAftSqKJP5emkV/yfbaE9sh87qEX2LxIbYwMjczTGSuO3BzhmB3FYw8dc49+pfGow
 ZettRiKvfZYHHiDGQx56NFMZlTfnG8SrA8BFat18U3k8+N07QB1itbOS5yRqONxjnaTl
 55ZzRGnpLgHmUKPNagT0COnlWTtSxEf/3lhVTZ1qz7d4WTPbVzNaReDOYAQX+a8sJE0D
 AlQLIVuW+98T9KaW+a/jzuufwbYXr6QVed7iuBsY6dLpbd41ToYBPvdAhrERCYHiI6kQ
 t6Mw==
X-Gm-Message-State: AOAM5306Wc8+UyhjMSEWpiyht+FRoDaD5nZ16Cz/1c14TKJDiFTi9+i1
 8Lvxmx0gwfm2Vywdx2opkn3sl6q2enmodA==
X-Google-Smtp-Source: ABdhPJxOqGuvhGa12Ns47rDAYgBJyDNwHwsS00h8+MdN90EWDHfrPnXWDuVdxyiP68qyUJ/BzLzHjw==
X-Received: by 2002:a37:5505:0:b0:60d:9998:6dfd with SMTP id
 j5-20020a375505000000b0060d99986dfdmr13399795qkb.607.1650466239862; 
 Wed, 20 Apr 2022 07:50:39 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 t12-20020a05622a01cc00b002f204a559a4sm1869837qtw.53.2022.04.20.07.50.39
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 07:50:39 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id w133so613149ybe.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Apr 2022 07:50:39 -0700 (PDT)
X-Received: by 2002:a81:4f0d:0:b0:2ec:1556:815 with SMTP id
 d13-20020a814f0d000000b002ec15560815mr21306644ywb.256.1650465859173; Wed, 20
 Apr 2022 07:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <481a13f8-d339-f726-0418-ab4258228e91@foss.st.com>
 <95a0d1dd-bcce-76c7-97b9-8374c9913321@google.com>
 <7f2993a9-adc5-2b90-9218-c4ca8239c3e@google.com>
 <3695dc2a-7518-dee4-a647-821c7cda4a0f@foss.st.com>
 <2a462b23-5b8e-bbf4-ec7d-778434a3b9d7@google.com>
 <6f56d0d6-6d0d-f0c9-87df-f3ff25b26fc5@linux-m68k.org>
In-Reply-To: <6f56d0d6-6d0d-f0c9-87df-f3ff25b26fc5@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Apr 2022 16:44:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWA7n588XUKy2yondnZpAw_afFBz8DHxH0Q3Tt53HHsHg@mail.gmail.com>
Message-ID: <CAMuHMdWA7n588XUKy2yondnZpAw_afFBz8DHxH0Q3Tt53HHsHg@mail.gmail.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: "Darrick J . Wong" <djwong@kernel.org>, Linux MM <linux-mm@kvack.org>,
 zkabelac@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 Linux-Arch <linux-arch@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Miklos Szeredi <miklos@szeredi.hu>, Hugh Dickins <hughd@google.com>,
 Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@lst.de>,
 Borislav Petkov <bp@suse.de>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Lukas Czerner <lczerner@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Linux-stm32] Regression with v5.18-rc1 tag on STM32F7 and
	STM32H7 based boards
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

Hi Greg,

On Wed, Apr 20, 2022 at 3:53 PM Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 16/4/22 10:58, Hugh Dickins wrote:
> > Just to wrap up this thread: the tentative arch/ patches below did not
> > go into 5.18-rc2, but 5.18-rc3 will contain
> > 1bdec44b1eee ("tmpfs: fix regressions from wider use of ZERO_PAGE")
> > which fixes a further issue, and deletes the line which gave you trouble.
> >
> > With arch/h8300 removed from linux-next, and arch/arm losing a page by
> > the patch below, I don't think it's worth my arguing for those changes.
> > I'd still prefer arch/m68k to expose its empty_zero_page in ZERO_PAGE(),
> > or else not allocate it; but I won't be pursuing this further.
>
> Thanks for pointing this out. It certainly does look wrong to me for
> the m68k nommu case. I am not aware of any existing issues caused by
> this - but there is no good reason not to fix it.
>
> So I propose this change. Build and run tested on my m68knommu targets.
>
> Regards
> Greg
>
>
>  From f809fb8fbca9e5e637b8fda380955bd799bb3926 Mon Sep 17 00:00:00 2001
> From: Greg Ungerer <gerg@linux-m68k.org>
> Date: Wed, 20 Apr 2022 23:27:47 +1000
> Subject: [PATCH] m68knommu: set ZERO_PAGE() allocated zeroed page
>
> The non-MMU m68k pagetable ZERO_PAGE() macro is being set to the
> somewhat non-sensical value of "virt_to_page(0)". The zeroth page
> is not in any way guaranteed to be a page full of "0". So the result
> is that ZERO_PAGE() will almost certainly contain random values.
>
> We already allocate a real "empty_zero_page" in the mm setup code shared
> between MMU m68k and non-MMU m68k. It is just not hooked up to the
> ZERO_PAGE() macro for the non-MMU m68k case.
>
> Fix ZERO_PAGE() to use the allocated "empty_zero_page" pointer.
>
> I am not aware of any specific issues caused by the old code.
>
> Link: https://lore.kernel.org/linux-m68k/2a462b23-5b8e-bbf4-ec7d-778434a3b9d7@google.com/T/#t
> Reported-by: Hugh Dickens <hughd@google.com>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> ---
>   arch/m68k/include/asm/pgtable_no.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/m68k/include/asm/pgtable_no.h b/arch/m68k/include/asm/pgtable_no.h
> index 87151d67d91e..bce5ca56c388 100644
> --- a/arch/m68k/include/asm/pgtable_no.h
> +++ b/arch/m68k/include/asm/pgtable_no.h
> @@ -42,7 +42,8 @@ extern void paging_init(void);
>    * ZERO_PAGE is a global shared page that is always zero: used
>    * for zero-mapped memory areas etc..
>    */
> -#define ZERO_PAGE(vaddr)       (virt_to_page(0))
> +extern void *empty_zero_page;
> +#define ZERO_PAGE(vaddr)       (virt_to_page(empty_zero_page))
>
>   /*
>    * All 32bit addresses are effectively valid for vmalloc...

And after that (or combined with this?), this can be factored
out from arch/m68k/include/asm/pgtable_{mm,no}.h into
arch/m68k/include/asm/pgtable.h.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
