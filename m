Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKE3HXrFs2lAawAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 09:06:18 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0DC27F48D
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 09:06:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D755C9009F;
	Fri, 13 Mar 2026 08:06:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 075BEC8F28E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 20:28:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 31CB961339;
 Thu, 12 Mar 2026 20:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C774C19425;
 Thu, 12 Mar 2026 20:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773347303;
 bh=jgGSscmoelPI8GEiWGdwMLRrmOSZJpVQGB2V/0UBDOA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I/IDHplTtuCF1meDV4022nAtR0eunUyZdd/Pn6AG5LG8aC/qQuhx7VdN7Xi60Ijwi
 rWIms1/Yp+FYH2BYdTfFB1pdAG2cEqHkRwA3NI10yCiiVssqT68FLEMWGinY97G30H
 AMhWFjHZ8hWHClGwkxaGqF16kgp5Ih0W71zaBA5EXa4DZ9lvVjQJet93KcVY1YsC6w
 AX6++a3hDsehyLMkh/7gGoppnBdYTd7QlvNYhmEvetQv3AVQaes0b+ASuwvNaf7KHG
 eDJy51fvOizaY5bkXRbNrzCMor4ti+9ytYmyAT8JmZfpcabApjNaTPAcwwoSPYeevP
 bV1fSgq3LSIXQ==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 12 Mar 2026 20:27:30 +0000
Message-ID: <21d8899bb1f4db61203072fb3a56a6c98a61e23d.1773346620.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773346620.git.ljs@kernel.org>
References: <cover.1773346620.git.ljs@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Mar 2026 08:05:57 +0000
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-doc@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Clemens Ladisch <clemens@ladisch.de>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Marc Dionne <marc.dionne@auristor.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 linux-stm32@st-md-mailman.stormreply.com, Wei Liu <wei.liu@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, linux-scsi@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Long Li <longli@microsoft.com>, linux-staging@lists.linux.dev,
 Dexuan Cui <decui@microsoft.com>, linux-afs@lists.infradead.org,
 Pedro Falcato <pfalcato@suse.de>, Ryan Roberts <ryan.roberts@arm.com>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org,
 Christian Brauner <brauner@kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fsdevel@vger.kernel.org,
 Mike Rapoport <rppt@kernel.org>, Bodo Stroesser <bostroesser@gmail.com>
Subject: [Linux-stm32] [PATCH 15/15] mm: add
	mmap_action_map_kernel_pages[_full]()
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
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:vbabka@kernel.org,m:linux-scsi@vger.kernel.org,m:corbet@lwn.net,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:arnd@arndb.de,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:surenb@google.com,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.or
 g,m:mcoquelin.stm32@gmail.com,m:linux-fsdevel@vger.kernel.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,lwn.net,nod.at,lists.linux.dev,suse.de,arm.com,arndb.de,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[43];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.965];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 5C0DC27F48D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A user can invoke mmap_action_map_kernel_pages() to specify that the
mapping should map kernel pages starting from desc->start of a specified
number of pages specified in an array.

In order to implement this, adjust mmap_action_prepare() to be able to
return an error code, as it makes sense to assert that the specified
parameters are valid as quickly as possible as well as updating the VMA
flags to include VMA_MIXEDMAP_BIT as necessary.

This provides an mmap_prepare equivalent of vm_insert_pages().

We additionally update the existing vm_insert_pages() code to use
range_in_vma() and add a new range_in_vma_desc() helper function for the
mmap_prepare case, sharing the code between the two in range_is_subset().

We add both mmap_action_map_kernel_pages() and
mmap_action_map_kernel_pages_full() to allow for both partial and full VMA
mappings.

We also add mmap_action_map_kernel_pages_discontig() to allow for
discontiguous mapping of kernel pages should the need arise.

We update the documentation to reflect the new features.

Finally, we update the VMA tests accordingly to reflect the changes.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 Documentation/filesystems/mmap_prepare.rst |  8 ++
 include/linux/mm.h                         | 94 +++++++++++++++++++++-
 include/linux/mm_types.h                   |  7 ++
 mm/memory.c                                | 42 +++++++++-
 mm/util.c                                  |  6 ++
 tools/testing/vma/include/dup.h            |  7 ++
 6 files changed, 159 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/mmap_prepare.rst b/Documentation/filesystems/mmap_prepare.rst
index d21406848bca..f89718285869 100644
--- a/Documentation/filesystems/mmap_prepare.rst
+++ b/Documentation/filesystems/mmap_prepare.rst
@@ -129,5 +129,13 @@ pointer. These are:
 * `mmap_action_simple_ioremap()` - Sets up an I/O remap from a specified
   physical address and over a specified length.
 
+* `mmap_action_map_kernel_pages()` - Maps a specified array of `struct page`
+  pointers in the VMA from a specific offset.
+
+* `mmap_action_map_kernel_pages_full()` - Maps a specified array of `struct
+  page` pointers over the entire VMA. The caller must ensure there are
+  sufficient entries in the page array to cover the entire range of the
+  described VMA.
+
 **NOTE:** The 'action' field should never normally be manipulated directly,
 rather you ought to use one of these helpers.
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 88f42faeb377..88ad5649c02d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4160,6 +4160,45 @@ static inline void mmap_action_simple_ioremap(struct vm_area_desc *desc,
 	action->type = MMAP_SIMPLE_IO_REMAP;
 }
 
+/**
+ * mmap_action_map_kernel_pages - helper for mmap_prepare hook to specify that
+ * @num kernel pages contained in the @pages array should be mapped to userland
+ * starting at virtual address @start.
+ * @desc: The VMA descriptor for the VMA requiring kernel pags to be mapped.
+ * @start: The virtual address from which to map them.
+ * @pages: An array of struct page pointers describing the memory to map.
+ * @nr_pages: The number of entries in the @pages aray.
+ */
+static inline void mmap_action_map_kernel_pages(struct vm_area_desc *desc,
+		unsigned long start, struct page **pages,
+		unsigned long nr_pages)
+{
+	struct mmap_action *action = &desc->action;
+
+	action->type = MMAP_MAP_KERNEL_PAGES;
+	action->map_kernel.start = start;
+	action->map_kernel.pages = pages;
+	action->map_kernel.nr_pages = nr_pages;
+	action->map_kernel.pgoff = desc->pgoff;
+}
+
+/**
+ * mmap_action_map_kernel_pages_full - helper for mmap_prepare hook to specify that
+ * kernel pages contained in the @pages array should be mapped to userland
+ * from @desc->start to @desc->end.
+ * @desc: The VMA descriptor for the VMA requiring kernel pags to be mapped.
+ * @pages: An array of struct page pointers describing the memory to map.
+ *
+ * The caller must ensure that @pages contains sufficient entries to cover the
+ * entire range described by @desc.
+ */
+static inline void mmap_action_map_kernel_pages_full(struct vm_area_desc *desc,
+		struct page **pages)
+{
+	mmap_action_map_kernel_pages(desc, desc->start, pages,
+				     vma_desc_pages(desc));
+}
+
 int mmap_action_prepare(struct vm_area_desc *desc,
 			struct mmap_action *action);
 int mmap_action_complete(struct vm_area_struct *vma,
@@ -4177,10 +4216,59 @@ static inline struct vm_area_struct *find_exact_vma(struct mm_struct *mm,
 	return vma;
 }
 
+/**
+ * range_is_subset - Is the specified inner range a subset of the outer range?
+ * @outer_start: The start of the outer range.
+ * @outer_end: The exclusive end of the outer range.
+ * @inner_start: The start of the inner range.
+ * @inner_end: The exclusive end of the inner range.
+ *
+ * Returns %true if [inner_start, inner_end) is a subset of [outer_start,
+ * outer_end), otherwise %false.
+ */
+static inline bool range_is_subset(unsigned long outer_start,
+				   unsigned long outer_end,
+				   unsigned long inner_start,
+				   unsigned long inner_end)
+{
+	return outer_start <= inner_start && inner_end <= outer_end;
+}
+
+/**
+ * range_in_vma - is the specified [@start, @end) range a subset of the VMA?
+ * @vma: The VMA against which we want to check [@start, @end).
+ * @start: The start of the range we wish to check.
+ * @end: The exclusive end of the range we wish to check.
+ *
+ * Returns %true if [@start, @end) is a subset of [@vma->vm_start,
+ * @vma->vm_end), %false otherwise.
+ */
 static inline bool range_in_vma(const struct vm_area_struct *vma,
 				unsigned long start, unsigned long end)
 {
-	return (vma && vma->vm_start <= start && end <= vma->vm_end);
+	if (!vma)
+		return false;
+
+	return range_is_subset(vma->vm_start, vma->vm_end, start, end);
+}
+
+/**
+ * range_in_vma_desc - is the specified [@start, @end) range a subset of the VMA
+ * described by @desc, a VMA descriptor?
+ * @desc: The VMA descriptor against which we want to check [@start, @end).
+ * @start: The start of the range we wish to check.
+ * @end: The exclusive end of the range we wish to check.
+ *
+ * Returns %true if [@start, @end) is a subset of [@desc->start, @desc->end),
+ * %false otherwise.
+ */
+static inline bool range_in_vma_desc(const struct vm_area_desc *desc,
+				     unsigned long start, unsigned long end)
+{
+	if (!desc)
+		return false;
+
+	return range_is_subset(desc->start, desc->end, start, end);
 }
 
 #ifdef CONFIG_MMU
@@ -4212,6 +4300,10 @@ int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
 int vm_insert_page(struct vm_area_struct *, unsigned long addr, struct page *);
 int vm_insert_pages(struct vm_area_struct *vma, unsigned long addr,
 			struct page **pages, unsigned long *num);
+int map_kernel_pages_prepare(struct vm_area_desc *desc,
+			     struct mmap_action *action);
+int map_kernel_pages_complete(struct vm_area_struct *vma,
+			      struct mmap_action *action);
 int vm_map_pages(struct vm_area_struct *vma, struct page **pages,
 				unsigned long num);
 int vm_map_pages_zero(struct vm_area_struct *vma, struct page **pages,
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 316bb0adf91d..6e7a399f0724 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -815,6 +815,7 @@ enum mmap_action_type {
 	MMAP_REMAP_PFN,		/* Remap PFN range. */
 	MMAP_IO_REMAP_PFN,	/* I/O remap PFN range. */
 	MMAP_SIMPLE_IO_REMAP,	/* I/O remap with guardrails. */
+	MMAP_MAP_KERNEL_PAGES,	/* Map kernel page range from array. */
 };
 
 /*
@@ -833,6 +834,12 @@ struct mmap_action {
 			phys_addr_t start_phys_addr;
 			unsigned long size;
 		} simple_ioremap;
+		struct {
+			unsigned long start;
+			struct page **pages;
+			unsigned long nr_pages;
+			pgoff_t pgoff;
+		} map_kernel;
 	};
 	enum mmap_action_type type;
 
diff --git a/mm/memory.c b/mm/memory.c
index 351cc917b7aa..608a98c4c947 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2484,13 +2484,14 @@ static int insert_pages(struct vm_area_struct *vma, unsigned long addr,
 int vm_insert_pages(struct vm_area_struct *vma, unsigned long addr,
 			struct page **pages, unsigned long *num)
 {
-	const unsigned long end_addr = addr + (*num * PAGE_SIZE) - 1;
+	const unsigned long nr_pages = *num;
+	const unsigned long end = addr + PAGE_SIZE * nr_pages;
 
-	if (addr < vma->vm_start || end_addr >= vma->vm_end)
+	if (!range_in_vma(vma, addr, end))
 		return -EFAULT;
 	if (!(vma->vm_flags & VM_MIXEDMAP)) {
-		BUG_ON(mmap_read_trylock(vma->vm_mm));
-		BUG_ON(vma->vm_flags & VM_PFNMAP);
+		VM_WARN_ON_ONCE(mmap_read_trylock(vma->vm_mm));
+		VM_WARN_ON_ONCE(vma->vm_flags & VM_PFNMAP);
 		vm_flags_set(vma, VM_MIXEDMAP);
 	}
 	/* Defer page refcount checking till we're about to map that page. */
@@ -2498,6 +2499,39 @@ int vm_insert_pages(struct vm_area_struct *vma, unsigned long addr,
 }
 EXPORT_SYMBOL(vm_insert_pages);
 
+int map_kernel_pages_prepare(struct vm_area_desc *desc,
+			     struct mmap_action *action)
+{
+	const unsigned long addr = action->map_kernel.start;
+	unsigned long nr_pages, end;
+
+	if (!vma_desc_test(desc, VMA_MIXEDMAP_BIT)) {
+		VM_WARN_ON_ONCE(mmap_read_trylock(desc->mm));
+		VM_WARN_ON_ONCE(vma_desc_test(desc, VMA_PFNMAP_BIT));
+		vma_desc_set_flags(desc, VMA_MIXEDMAP_BIT);
+	}
+
+	nr_pages = action->map_kernel.nr_pages;
+	end = addr + PAGE_SIZE * nr_pages;
+	if (!range_in_vma_desc(desc, addr, end))
+		return -EFAULT;
+
+	return 0;
+}
+EXPORT_SYMBOL(map_kernel_pages_prepare);
+
+int map_kernel_pages_complete(struct vm_area_struct *vma,
+			      struct mmap_action *action)
+{
+	unsigned long nr_pages;
+
+	nr_pages = action->map_kernel.nr_pages;
+	return insert_pages(vma, action->map_kernel.start,
+			    action->map_kernel.pages,
+			    &nr_pages, vma->vm_page_prot);
+}
+EXPORT_SYMBOL(map_kernel_pages_complete);
+
 /**
  * vm_insert_page - insert single page into user vma
  * @vma: user vma to map to
diff --git a/mm/util.c b/mm/util.c
index e739d7c0311c..7934e303b230 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1445,6 +1445,8 @@ int mmap_action_prepare(struct vm_area_desc *desc,
 		return io_remap_pfn_range_prepare(desc, action);
 	case MMAP_SIMPLE_IO_REMAP:
 		return simple_ioremap_prepare(desc, action);
+	case MMAP_MAP_KERNEL_PAGES:
+		return map_kernel_pages_prepare(desc, action);
 	}
 }
 EXPORT_SYMBOL(mmap_action_prepare);
@@ -1473,6 +1475,9 @@ int mmap_action_complete(struct vm_area_struct *vma,
 	case MMAP_IO_REMAP_PFN:
 		err = io_remap_pfn_range_complete(vma, action);
 		break;
+	case MMAP_MAP_KERNEL_PAGES:
+		err = map_kernel_pages_complete(vma, action);
+		break;
 	case MMAP_SIMPLE_IO_REMAP:
 		/*
 		 * The simple I/O remap should have been delegated to an I/O
@@ -1496,6 +1501,7 @@ int mmap_action_prepare(struct vm_area_desc *desc,
 	case MMAP_REMAP_PFN:
 	case MMAP_IO_REMAP_PFN:
 	case MMAP_SIMPLE_IO_REMAP:
+	case MMAP_MAP_KERNEL_PAGES:
 		WARN_ON_ONCE(1); /* nommu cannot handle these. */
 		break;
 	}
diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/dup.h
index 4f2c9bb6b1ea..50ef2f62150d 100644
--- a/tools/testing/vma/include/dup.h
+++ b/tools/testing/vma/include/dup.h
@@ -425,6 +425,7 @@ enum mmap_action_type {
 	MMAP_REMAP_PFN,		/* Remap PFN range. */
 	MMAP_IO_REMAP_PFN,	/* I/O remap PFN range. */
 	MMAP_SIMPLE_IO_REMAP,	/* I/O remap with guardrails. */
+	MMAP_MAP_KERNEL_PAGES,	/* Map kernel page range from an array. */
 };
 
 /*
@@ -443,6 +444,12 @@ struct mmap_action {
 			phys_addr_t start;
 			unsigned long len;
 		} simple_ioremap;
+		struct {
+			unsigned long start;
+			struct page **pages;
+			unsigned long num;
+			pgoff_t pgoff;
+		} map_kernel;
 	};
 	enum mmap_action_type type;
 
-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
