Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AC850E609
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 18:43:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59EFBC60479;
	Mon, 25 Apr 2022 16:43:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DF2BC5C829
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Apr 2022 13:53:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 62E2C6126E;
 Wed, 20 Apr 2022 13:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFDEC385A0;
 Wed, 20 Apr 2022 13:52:53 +0000 (UTC)
Message-ID: <6f56d0d6-6d0d-f0c9-87df-f3ff25b26fc5@linux-m68k.org>
Date: Wed, 20 Apr 2022 23:52:50 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Hugh Dickins <hughd@google.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>
References: <481a13f8-d339-f726-0418-ab4258228e91@foss.st.com>
 <95a0d1dd-bcce-76c7-97b9-8374c9913321@google.com>
 <7f2993a9-adc5-2b90-9218-c4ca8239c3e@google.com>
 <3695dc2a-7518-dee4-a647-821c7cda4a0f@foss.st.com>
 <2a462b23-5b8e-bbf4-ec7d-778434a3b9d7@google.com>
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <2a462b23-5b8e-bbf4-ec7d-778434a3b9d7@google.com>
X-Mailman-Approved-At: Mon, 25 Apr 2022 16:43:58 +0000
Cc: djwong@kernel.org, linux-mm@kvack.org, zkabelac@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, miklos@szeredi.hu,
 Russell King <linux@armlinux.org.uk>, hch@lst.de,
 Geert Uytterhoeven <geert@linux-m68k.org>, bp@suse.de,
 uclinux-h8-devel@lists.sourceforge.jp, Arnd Bergmann <arnd@arndb.de>,
 linux-m68k@lists.linux-m68k.org, mpatocka@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, lczerner@redhat.com, akpm@linux-foundation.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Hugh,

On 16/4/22 10:58, Hugh Dickins wrote:
> On Wed, 6 Apr 2022, Patrice CHOTARD wrote:
>> On 4/6/22 08:22, Hugh Dickins wrote:
>>> Asking Arnd and others below: should noMMU arches have a good ZERO_PAGE?
>>>
>>> On Tue, 5 Apr 2022, Hugh Dickins wrote:
>>>> On Tue, 5 Apr 2022, Patrice CHOTARD wrote:
>>>>>
>>>>> We found an issue with last kernel tag v5.18-rc1 on stm32f746-disco and
>>>>> stm32h743-disco boards (ARMV7-M SoCs).
>>>>>
>>>>> Kernel hangs when executing SetPageUptodate(ZERO_PAGE(0)); in mm/filemap.c.
>>>>>
>>>>> By reverting commit 56a8c8eb1eaf ("tmpfs: do not allocate pages on read"),
>>>>> kernel boots without any issue.
>>>>
>>>> Sorry about that, thanks a lot for finding.
>>>>
>>>> I see that arch/arm/configs/stm32_defconfig says CONFIG_MMU is not set:
>>>> please confirm that is the case here.
>>>>
>>>> Yes, it looks as if NOMMU platforms are liable to have a bogus (that's my
>>>> reading, but it may be unfair) definition for ZERO_PAGE(vaddr), and I was
>>>> walking on ice to touch it without regard for !CONFIG_MMU.
>>>>
>>>> CONFIG_SHMEM depends on CONFIG_MMU, so that PageUptodate is only needed
>>>> when CONFIG_MMU.
>>>>
>>>> Easily fixed by an #ifdef CONFIG_MMU there in mm/filemap.c, but I'll hunt
>>>> around (again) for a better place to do it - though I won't want to touch
>>>> all the architectures for it.  I'll post later today.
>>>
>>> I could put #ifdef CONFIG_MMU around the SetPageUptodate(ZERO_PAGE(0))
>>> added to pagecache_init(); or if that's considered distasteful, I could
>>> skip making it potentially useful to other filesystems, revert the change
>>> to pagecache_init(), and just do it in mm/shmem.c's CONFIG_SHMEM (hence
>>> CONFIG_MMU) instance of shmem_init().
>>>
>>> But I wonder if it's safe for noMMU architectures to go on without a
>>> working ZERO_PAGE(0).  It has uses scattered throughout the tree, in
>>> drivers, fs, crypto and more, and it's not at all obvious (to me) that
>>> they all depend on CONFIG_MMU.  Some might cause (unreported) crashes,
>>> some might use an unzeroed page in place of a pageful of zeroes.
>>>
>>> arm noMMU and h8300 noMMU and m68k noMMU each has
>>> #define ZERO_PAGE(vaddr)	(virt_to_page(0))
>>> which seems riskily wrong to me.
>>>
>>> h8300 and m68k actually go to the trouble of allocating an empty_zero_page
>>> for this, but then forget to link it up to the ZERO_PAGE(vaddr) definition,
>>> which is what all the common code uses.
>>>
>>> arm noMMU does not presently allocate such a page; and I do not feel
>>> entitled to steal a page from arm noMMU platforms, for a hypothetical
>>> case, without agreement.
>>>
>>> But here's an unbuilt and untested patch for consideration - which of
>>> course should be split in three if agreed (and perhaps the h8300 part
>>> quietly forgotten if h8300 is already on its way out).
>>>
>>> (Yes, arm uses empty_zero_page in a different way from all the other
>>> architectures; but that's okay, and I think arm's way, with virt_to_page()
>>> already baked in, is better than the others; but I've no wish to get into
>>> changing them.)
>>>
>>> Patrice, does this patch build and run for you? I have no appreciation
>>> of arm early startup issues, and may have got it horribly wrong.
>>
>> This patch is okay on my side on both boards (STM32F7 and STM32H7), boot are OK.
>>
>> Thanks for your reactivity ;-)
>> Patrice
> 
> Just to wrap up this thread: the tentative arch/ patches below did not
> go into 5.18-rc2, but 5.18-rc3 will contain
> 1bdec44b1eee ("tmpfs: fix regressions from wider use of ZERO_PAGE")
> which fixes a further issue, and deletes the line which gave you trouble.
> 
> With arch/h8300 removed from linux-next, and arch/arm losing a page by
> the patch below, I don't think it's worth my arguing for those changes.
> I'd still prefer arch/m68k to expose its empty_zero_page in ZERO_PAGE(),
> or else not allocate it; but I won't be pursuing this further.

Thanks for pointing this out. It certainly does look wrong to me for
the m68k nommu case. I am not aware of any existing issues caused by
this - but there is no good reason not to fix it.

So I propose this change. Build and run tested on my m68knommu targets.

Regards
Greg


 From f809fb8fbca9e5e637b8fda380955bd799bb3926 Mon Sep 17 00:00:00 2001
From: Greg Ungerer <gerg@linux-m68k.org>
Date: Wed, 20 Apr 2022 23:27:47 +1000
Subject: [PATCH] m68knommu: set ZERO_PAGE() allocated zeroed page

The non-MMU m68k pagetable ZERO_PAGE() macro is being set to the
somewhat non-sensical value of "virt_to_page(0)". The zeroth page
is not in any way guaranteed to be a page full of "0". So the result
is that ZERO_PAGE() will almost certainly contain random values.

We already allocate a real "empty_zero_page" in the mm setup code shared
between MMU m68k and non-MMU m68k. It is just not hooked up to the
ZERO_PAGE() macro for the non-MMU m68k case.

Fix ZERO_PAGE() to use the allocated "empty_zero_page" pointer.

I am not aware of any specific issues caused by the old code.

Link: https://lore.kernel.org/linux-m68k/2a462b23-5b8e-bbf4-ec7d-778434a3b9d7@google.com/T/#t
Reported-by: Hugh Dickens <hughd@google.com>
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
  arch/m68k/include/asm/pgtable_no.h | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/pgtable_no.h b/arch/m68k/include/asm/pgtable_no.h
index 87151d67d91e..bce5ca56c388 100644
--- a/arch/m68k/include/asm/pgtable_no.h
+++ b/arch/m68k/include/asm/pgtable_no.h
@@ -42,7 +42,8 @@ extern void paging_init(void);
   * ZERO_PAGE is a global shared page that is always zero: used
   * for zero-mapped memory areas etc..
   */
-#define ZERO_PAGE(vaddr)	(virt_to_page(0))
+extern void *empty_zero_page;
+#define ZERO_PAGE(vaddr)	(virt_to_page(empty_zero_page))
  
  /*
   * All 32bit addresses are effectively valid for vmalloc...
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
