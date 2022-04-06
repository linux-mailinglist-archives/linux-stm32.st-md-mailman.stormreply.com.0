Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E606C4F56B2
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Apr 2022 09:03:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3520DC628B5;
	Wed,  6 Apr 2022 07:03:26 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19C60C60479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Apr 2022 06:22:31 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 i11-20020a9d4a8b000000b005cda3b9754aso1089188otf.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Apr 2022 23:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version; bh=yiBEe+9/yoFS8QNsq6W7R4IU+UE1TYnjoeST9R9+qNE=;
 b=KUT/9NgMmzw9YQOEqgdiz670pyxDVPMbjQx3otCmSMt/gdzMHcoLFm2T972RH9JEEJ
 wzNHJBqSYPoYUG9rbbh+wEnWgQz2amBs1F824UgSA/7sEZRbiWnAt5T/e4pKu9i+sJPu
 VIlArAJUfWGx8iav+WnwxfS8HQRxOf1Sb95eTUgxXjP78YPWXlpAgJq3PJYqs9VFWk4Y
 GPWom4esroTnLycQhVNIiHLZxKlkmBZZ/hOXoLKhxBA0FRZhxpg2jMKcBK1CsEOQbRc6
 I8RDZCVDIKuXUTS8kRhVn5wEBq0KFWZTuzTAB19k2VtQez5WFi8D9mCEuQPI8dkDMAfm
 LTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:mime-version;
 bh=yiBEe+9/yoFS8QNsq6W7R4IU+UE1TYnjoeST9R9+qNE=;
 b=mQ4NdJl/5GYAfmnUgtBIB9erIDho2S4WJuRD8ar2oUEsnJNgLZhTX4l+V7fpFhMpC9
 oKHUDnrHsmkzT4rKf6V4KU1g+cstHpfVFb2DyLw6zw78+8FfQJF0WGqDuDaq45IGurNN
 wWs2gLAS5zQmuS2HMpWecWlXEKInzyZlZMWUr5xb5aI7WymqDrE1zSDWQtBVZzDXwLSk
 j5DGFI9lojR1LiR3/gSZn864zapFgz6+qzqiF2JfWFzr5mS4xvU/78Kmt+hFS04KpX8c
 z0UhPw7C1mcWqkGrevR+jrenD45y7G2+6zvqe1AV5z30/mVzhoq89o3S35aGtYnkTrBC
 wzYQ==
X-Gm-Message-State: AOAM533bafxsxFFnS7n62lGtaQVvOTeE8M1SwHh2KyXcwlOralhV04Nt
 YdSurnkOpEGAf6/qO1W4BH72kw==
X-Google-Smtp-Source: ABdhPJxM2+O1/dslWgPqHrxOi+Em6zSBu8nEJlKSSUqBOQa0w/3S7eEJuGm4nvupcGs+sNGkQQKeCA==
X-Received: by 2002:a9d:426:0:b0:5cb:5837:bfc0 with SMTP id
 35-20020a9d0426000000b005cb5837bfc0mr2509606otc.305.1649226149595; 
 Tue, 05 Apr 2022 23:22:29 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 s125-20020acaa983000000b002ecdbaf98fesm6067819oie.34.2022.04.05.23.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 23:22:29 -0700 (PDT)
Date: Tue, 5 Apr 2022 23:22:10 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <95a0d1dd-bcce-76c7-97b9-8374c9913321@google.com>
Message-ID: <7f2993a9-adc5-2b90-9218-c4ca8239c3e@google.com>
References: <481a13f8-d339-f726-0418-ab4258228e91@foss.st.com>
 <95a0d1dd-bcce-76c7-97b9-8374c9913321@google.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 06 Apr 2022 07:03:24 +0000
Cc: djwong@kernel.org, linux-mm@kvack.org, zkabelac@redhat.com,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, miklos@szeredi.hu,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Geert Uytterhoeven <geert@linux-m68k.org>, bp@suse.de,
 uclinux-h8-devel@lists.sourceforge.jp, linux-m68k@lists.linux-m68k.org,
 mpatocka@redhat.com, linux-arm-kernel@lists.infradead.org,
 Hugh Dickins <hughd@googl.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, lczerner@redhat.com, akpm@linux-foundation.org,
 hch@lst.de
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

Asking Arnd and others below: should noMMU arches have a good ZERO_PAGE?

On Tue, 5 Apr 2022, Hugh Dickins wrote:
> On Tue, 5 Apr 2022, Patrice CHOTARD wrote:
> > 
> > We found an issue with last kernel tag v5.18-rc1 on stm32f746-disco and 
> > stm32h743-disco boards (ARMV7-M SoCs).
> > 
> > Kernel hangs when executing SetPageUptodate(ZERO_PAGE(0)); in mm/filemap.c.
> > 
> > By reverting commit 56a8c8eb1eaf ("tmpfs: do not allocate pages on read"), 
> > kernel boots without any issue.
> 
> Sorry about that, thanks a lot for finding.
> 
> I see that arch/arm/configs/stm32_defconfig says CONFIG_MMU is not set:
> please confirm that is the case here.
> 
> Yes, it looks as if NOMMU platforms are liable to have a bogus (that's my
> reading, but it may be unfair) definition for ZERO_PAGE(vaddr), and I was
> walking on ice to touch it without regard for !CONFIG_MMU.
> 
> CONFIG_SHMEM depends on CONFIG_MMU, so that PageUptodate is only needed
> when CONFIG_MMU.
> 
> Easily fixed by an #ifdef CONFIG_MMU there in mm/filemap.c, but I'll hunt
> around (again) for a better place to do it - though I won't want to touch
> all the architectures for it.  I'll post later today.

I could put #ifdef CONFIG_MMU around the SetPageUptodate(ZERO_PAGE(0))
added to pagecache_init(); or if that's considered distasteful, I could
skip making it potentially useful to other filesystems, revert the change
to pagecache_init(), and just do it in mm/shmem.c's CONFIG_SHMEM (hence
CONFIG_MMU) instance of shmem_init().

But I wonder if it's safe for noMMU architectures to go on without a
working ZERO_PAGE(0).  It has uses scattered throughout the tree, in
drivers, fs, crypto and more, and it's not at all obvious (to me) that
they all depend on CONFIG_MMU.  Some might cause (unreported) crashes,
some might use an unzeroed page in place of a pageful of zeroes.

arm noMMU and h8300 noMMU and m68k noMMU each has
#define ZERO_PAGE(vaddr)	(virt_to_page(0))
which seems riskily wrong to me.

h8300 and m68k actually go to the trouble of allocating an empty_zero_page
for this, but then forget to link it up to the ZERO_PAGE(vaddr) definition,
which is what all the common code uses.

arm noMMU does not presently allocate such a page; and I do not feel
entitled to steal a page from arm noMMU platforms, for a hypothetical
case, without agreement.

But here's an unbuilt and untested patch for consideration - which of
course should be split in three if agreed (and perhaps the h8300 part
quietly forgotten if h8300 is already on its way out).

(Yes, arm uses empty_zero_page in a different way from all the other
architectures; but that's okay, and I think arm's way, with virt_to_page()
already baked in, is better than the others; but I've no wish to get into
changing them.)

Patrice, does this patch build and run for you? I have no appreciation
of arm early startup issues, and may have got it horribly wrong.

Thanks,
Hugh

 arch/arm/include/asm/pgtable-nommu.h |    3 ++-
 arch/arm/mm/nommu.c                  |   16 ++++++++++++++++
 arch/h8300/include/asm/pgtable.h     |    6 +++++-
 arch/h8300/mm/init.c                 |    5 +++--
 arch/m68k/include/asm/pgtable_no.h   |    5 ++++-
 5 files changed, 30 insertions(+), 5 deletions(-)

--- a/arch/arm/include/asm/pgtable-nommu.h
+++ b/arch/arm/include/asm/pgtable-nommu.h
@@ -48,7 +48,8 @@ typedef pte_t *pte_addr_t;
  * ZERO_PAGE is a global shared page that is always zero: used
  * for zero-mapped memory areas etc..
  */
-#define ZERO_PAGE(vaddr)	(virt_to_page(0))
+extern struct page *empty_zero_page;
+#define ZERO_PAGE(vaddr)	(empty_zero_page)
 
 /*
  * Mark the prot value as uncacheable and unbufferable.
--- a/arch/arm/mm/nommu.c
+++ b/arch/arm/mm/nommu.c
@@ -24,6 +24,13 @@
 
 #include "mm.h"
 
+/*
+ * empty_zero_page is a special page that is used for
+ * zero-initialized data and COW.
+ */
+struct page *empty_zero_page;
+EXPORT_SYMBOL(empty_zero_page);
+
 unsigned long vectors_base;
 
 #ifdef CONFIG_ARM_MPU
@@ -148,9 +155,18 @@ void __init adjust_lowmem_bounds(void)
  */
 void __init paging_init(const struct machine_desc *mdesc)
 {
+	void *zero_page;
+
 	early_trap_init((void *)vectors_base);
 	mpu_setup();
 	bootmem_init();
+
+	zero_page = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
+	if (!zero_page)
+		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
+		      __func__, PAGE_SIZE, PAGE_SIZE);
+	empty_zero_page = virt_to_page(zero_page);
+	flush_dcache_page(empty_zero_page);
 }
 
 /*
--- a/arch/h8300/include/asm/pgtable.h
+++ b/arch/h8300/include/asm/pgtable.h
@@ -19,11 +19,15 @@ extern void paging_init(void);
 
 static inline int pte_file(pte_t pte) { return 0; }
 #define swapper_pg_dir ((pgd_t *) 0)
+
+/* zero page used for uninitialized stuff */
+extern void *empty_zero_page;
+
 /*
  * ZERO_PAGE is a global shared page that is always zero: used
  * for zero-mapped memory areas etc..
  */
-#define ZERO_PAGE(vaddr)	(virt_to_page(0))
+#define ZERO_PAGE(vaddr)	(virt_to_page(empty_zero_page))
 
 /*
  * These would be in other places but having them here reduces the diffs.
--- a/arch/h8300/mm/init.c
+++ b/arch/h8300/mm/init.c
@@ -41,7 +41,8 @@
  * ZERO_PAGE is a special page that is used for zero-initialized
  * data and COW.
  */
-unsigned long empty_zero_page;
+void *empty_zero_page;
+EXPORT_SYMBOL(empty_zero_page);
 
 /*
  * paging_init() continues the virtual memory environment setup which
@@ -65,7 +66,7 @@ void __init paging_init(void)
 	 * Initialize the bad page table and bad page to point
 	 * to a couple of allocated pages.
 	 */
-	empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE, PAGE_SIZE);
+	empty_zero_page = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
 	if (!empty_zero_page)
 		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
 		      __func__, PAGE_SIZE, PAGE_SIZE);
--- a/arch/m68k/include/asm/pgtable_no.h
+++ b/arch/m68k/include/asm/pgtable_no.h
@@ -38,11 +38,14 @@ extern void paging_init(void);
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
 #define __swp_entry_to_pte(x)	((pte_t) { (x).val })
 
+/* zero page used for uninitialized stuff */
+extern void *empty_zero_page;
+
 /*
  * ZERO_PAGE is a global shared page that is always zero: used
  * for zero-mapped memory areas etc..
  */
-#define ZERO_PAGE(vaddr)	(virt_to_page(0))
+#define ZERO_PAGE(vaddr)	(virt_to_page(empty_zero_page))
 
 /*
  * All 32bit addresses are effectively valid for vmalloc...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
