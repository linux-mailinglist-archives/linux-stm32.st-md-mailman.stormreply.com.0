Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMwDJbgFvmmBFgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 21 Mar 2026 03:43:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1912E2F37
	for <lists+linux-stm32@lfdr.de>; Sat, 21 Mar 2026 03:43:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C157FC87ED5;
	Sat, 21 Mar 2026 02:43:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90148C87EBD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Mar 2026 02:43:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E611143789;
 Sat, 21 Mar 2026 02:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713BDC4CEF7;
 Sat, 21 Mar 2026 02:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1774060980;
 bh=BgN7DRMw/b+g+o3kfdBnAM90Udq9D+FeM/bxcwNC3t4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m7rFYZJyPUJygsgH+qiD39v5OLPAO4qM/j5uGyhL+yQw8aAoTQB9Y1SEP53/9Kin1
 3WqGLjL4VUQjZS0N4OUlpTGI2wHXbNDD1qIiuETlW6pZu5Fa+LHFmJAqri/1nO1Grr
 uitz00N5SqQNSahN3+dkJfjmUakWldSwDxOFAblo=
Date: Fri, 20 Mar 2026 19:42:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Message-Id: <20260320194258.9c00594e67c675a239ea44a6@linux-foundation.org>
In-Reply-To: <cover.1774045440.git.ljs@kernel.org>
References: <cover.1774045440.git.ljs@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Subject: Re: [Linux-stm32] [PATCH v4 00/21] mm: expand mmap_prepare
 functionality and usage
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
X-Spamd-Result: default: False [3.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linux-foundation.org:s=korg];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MV_CASE(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-foundation.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:vbabka@kernel.org,m:linux-scsi@vger.kernel.org,m:corbet@lwn.net,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:arnd@arndb.de,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:surenb@google.com,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:mcoquel
 in.stm32@gmail.com,m:linux-fsdevel@vger.kernel.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,lwn.net,nod.at,lists.linux.dev,suse.de,arm.com,arndb.de,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[linux-foundation.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:mid,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 2E1912E2F37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 20 Mar 2026 22:39:26 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:

> This series expands the mmap_prepare functionality, which is intended to
> replace the deprecated f_op->mmap hook which has been the source of bugs
> and security issues for some time.

Thanks, I updated mm-unstable to this version.  Here's how that altered
mm.git:


 Documentation/filesystems/mmap_prepare.rst |    4 
 include/linux/mm.h                         |    3 
 mm/internal.h                              |   27 ++++-
 mm/util.c                                  |   87 +++++++++----------
 mm/vma.c                                   |   41 +-------
 tools/testing/vma/include/dup.h            |   44 +--------
 tools/testing/vma/include/stubs.h          |    3 
 7 files changed, 80 insertions(+), 129 deletions(-)

--- a/Documentation/filesystems/mmap_prepare.rst~b
+++ a/Documentation/filesystems/mmap_prepare.rst
@@ -123,8 +123,8 @@ When implementing mmap_prepare(), refere
 as a ``VMA_xxx_BIT`` macro, e.g. ``VMA_READ_BIT``, ``VMA_WRITE_BIT`` etc.,
 and use one of (where ``desc`` is a pointer to struct vm_area_desc):
 
-* ``vma_desc_test_flags(desc, ...)`` - Specify a comma-separated list of flags
-  you wish to test for (whether _any_ are set), e.g. - ``vma_desc_test_flags(
+* ``vma_desc_test_any(desc, ...)`` - Specify a comma-separated list of flags
+  you wish to test for (whether _any_ are set), e.g. - ``vma_desc_test_any(
   desc, VMA_WRITE_BIT, VMA_MAYWRITE_BIT)`` - returns ``true`` if either are set,
   otherwise ``false``.
 * ``vma_desc_set_flags(desc, ...)`` - Update the VMA descriptor flags to set
--- a/include/linux/mm.h~b
+++ a/include/linux/mm.h
@@ -4394,8 +4394,7 @@ static inline void mmap_action_map_kerne
 
 int mmap_action_prepare(struct vm_area_desc *desc);
 int mmap_action_complete(struct vm_area_struct *vma,
-			 struct mmap_action *action,
-			 bool rmap_lock_held);
+			 struct mmap_action *action);
 
 /* Look up the first VMA which exactly match the interval vm_start ... vm_end */
 static inline struct vm_area_struct *find_exact_vma(struct mm_struct *mm,
--- a/mm/internal.h~b
+++ a/mm/internal.h
@@ -202,14 +202,6 @@ static inline void vma_close(struct vm_a
 /* unmap_vmas is in mm/memory.c */
 void unmap_vmas(struct mmu_gather *tlb, struct unmap_desc *unmap);
 
-static inline void unmap_vma_locked(struct vm_area_struct *vma)
-{
-	const size_t len = vma_pages(vma) << PAGE_SHIFT;
-
-	mmap_assert_write_locked(vma->vm_mm);
-	do_munmap(vma->vm_mm, vma->vm_start, len, NULL);
-}
-
 #ifdef CONFIG_MMU
 
 static inline void get_anon_vma(struct anon_vma *anon_vma)
@@ -1826,6 +1818,25 @@ static inline int io_remap_pfn_range_pre
 	return 0;
 }
 
+/*
+ * When we succeed an mmap action or just before we unmap a VMA on error, we
+ * need to ensure any rmap lock held is released. On unmap it's required to
+ * avoid a deadlock.
+ */
+static inline void maybe_rmap_unlock_action(struct vm_area_struct *vma,
+		struct mmap_action *action)
+{
+	struct file *file;
+
+	if (!action->hide_from_rmap_until_complete)
+		return;
+
+	VM_WARN_ON_ONCE(vma_is_anonymous(vma));
+	file = vma->vm_file;
+	i_mmap_unlock_write(file->f_mapping);
+	action->hide_from_rmap_until_complete = false;
+}
+
 #ifdef CONFIG_MMU_NOTIFIER
 static inline int clear_flush_young_ptes_notify(struct vm_area_struct *vma,
 		unsigned long addr, pte_t *ptep, unsigned int nr)
--- a/mm/util.c~b
+++ a/mm/util.c
@@ -1198,25 +1198,6 @@ void compat_set_desc_from_vma(struct vm_
 }
 EXPORT_SYMBOL(compat_set_desc_from_vma);
 
-static int __compat_vma_mapped(struct file *file, struct vm_area_struct *vma)
-{
-	const struct vm_operations_struct *vm_ops = vma->vm_ops;
-	void *vm_private_data = vma->vm_private_data;
-	int err;
-
-	if (!vm_ops || !vm_ops->mapped)
-		return 0;
-
-	err = vm_ops->mapped(vma->vm_start, vma->vm_end, vma->vm_pgoff, file,
-			     &vm_private_data);
-	if (err)
-		unmap_vma_locked(vma);
-	else if (vm_private_data != vma->vm_private_data)
-		vma->vm_private_data = vm_private_data;
-
-	return err;
-}
-
 /**
  * __compat_vma_mmap() - Similar to compat_vma_mmap(), only it allows
  * flexibility as to how the mmap_prepare callback is invoked, which is useful
@@ -1251,13 +1232,7 @@ int __compat_vma_mmap(struct vm_area_des
 	/* Update the VMA from the descriptor. */
 	compat_set_vma_from_desc(vma, desc);
 	/* Complete any specified mmap actions. */
-	err = mmap_action_complete(vma, &desc->action,
-				   /*rmap_lock_held=*/false);
-	if (err)
-		return err;
-
-	/* Invoke vm_ops->mapped callback. */
-	return __compat_vma_mapped(desc->file, vma);
+	return mmap_action_complete(vma, &desc->action);
 }
 EXPORT_SYMBOL(__compat_vma_mmap);
 
@@ -1290,12 +1265,17 @@ EXPORT_SYMBOL(__compat_vma_mmap);
 int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct vm_area_desc desc;
+	struct mmap_action *action;
 	int err;
 
 	compat_set_desc_from_vma(&desc, file, vma);
 	err = vfs_mmap_prepare(file, &desc);
 	if (err)
 		return err;
+	action = &desc.action;
+
+	/* being invoked from .mmmap means we don't have to enforce this. */
+	action->hide_from_rmap_until_complete = false;
 
 	return __compat_vma_mmap(&desc, vma);
 }
@@ -1399,25 +1379,47 @@ again:
 	}
 }
 
+static int call_vma_mapped(struct vm_area_struct *vma)
+{
+	const struct vm_operations_struct *vm_ops = vma->vm_ops;
+	void *vm_private_data = vma->vm_private_data;
+	int err;
+
+	if (!vm_ops || !vm_ops->mapped)
+		return 0;
+
+	err = vm_ops->mapped(vma->vm_start, vma->vm_end, vma->vm_pgoff,
+			     vma->vm_file, &vm_private_data);
+	if (err)
+		return err;
+
+	if (vm_private_data != vma->vm_private_data)
+		vma->vm_private_data = vm_private_data;
+	return 0;
+}
+
 static int mmap_action_finish(struct vm_area_struct *vma,
-			      struct mmap_action *action, int err,
-			      bool rmap_lock_held)
+			      struct mmap_action *action, int err)
 {
-	if (rmap_lock_held)
-		i_mmap_unlock_write(vma->vm_file->f_mapping);
+	size_t len;
 
-	if (!err) {
-		if (action->success_hook)
-			return action->success_hook(vma);
+	if (!err)
+		err = call_vma_mapped(vma);
+	if (!err && action->success_hook)
+		err = action->success_hook(vma);
+
+	/* do_munmap() might take rmap lock, so release if held. */
+	maybe_rmap_unlock_action(vma, action);
+	if (!err)
 		return 0;
-	}
 
 	/*
 	 * If an error occurs, unmap the VMA altogether and return an error. We
 	 * only clear the newly allocated VMA, since this function is only
 	 * invoked if we do NOT merge, so we only clean up the VMA we created.
 	 */
-	unmap_vma_locked(vma);
+	len = vma_pages(vma) << PAGE_SHIFT;
+	do_munmap(current->mm, vma->vm_start, len, NULL);
 	if (action->error_hook) {
 		/* We may want to filter the error. */
 		err = action->error_hook(err);
@@ -1459,16 +1461,13 @@ EXPORT_SYMBOL(mmap_action_prepare);
  * mmap_action_complete - Execute VMA descriptor action.
  * @vma: The VMA to perform the action upon.
  * @action: The action to perform.
- * @rmap_lock_held: Is the file rmap lock held?
  *
  * Similar to mmap_action_prepare().
  *
  * Return: 0 on success, or error, at which point the VMA will be unmapped.
  */
 int mmap_action_complete(struct vm_area_struct *vma,
-			 struct mmap_action *action,
-			 bool rmap_lock_held)
-
+			 struct mmap_action *action)
 {
 	int err = 0;
 
@@ -1489,8 +1488,7 @@ int mmap_action_complete(struct vm_area_
 		break;
 	}
 
-	return mmap_action_finish(vma, action, err,
-				  rmap_lock_held);
+	return mmap_action_finish(vma, action, err);
 }
 EXPORT_SYMBOL(mmap_action_complete);
 #else
@@ -1512,8 +1510,7 @@ int mmap_action_prepare(struct vm_area_d
 EXPORT_SYMBOL(mmap_action_prepare);
 
 int mmap_action_complete(struct vm_area_struct *vma,
-			 struct mmap_action *action,
-			 bool rmap_lock_held)
+			 struct mmap_action *action)
 {
 	int err = 0;
 
@@ -1523,14 +1520,14 @@ int mmap_action_complete(struct vm_area_
 	case MMAP_REMAP_PFN:
 	case MMAP_IO_REMAP_PFN:
 	case MMAP_SIMPLE_IO_REMAP:
-	casr MMAP_MAP_KERNEL_PAGES:
+	case MMAP_MAP_KERNEL_PAGES:
 		WARN_ON_ONCE(1); /* nommu cannot handle this. */
 
 		err = -EINVAL;
 		break;
 	}
 
-	return mmap_action_finish(vma, action, err, rmap_lock_held);
+	return mmap_action_finish(vma, action, err);
 }
 EXPORT_SYMBOL(mmap_action_complete);
 #endif
--- a/mm/vma.c~b
+++ a/mm/vma.c
@@ -38,8 +38,6 @@ struct mmap_state {
 
 	/* Determine if we can check KSM flags early in mmap() logic. */
 	bool check_ksm_early :1;
-	/* If we map new, hold the file rmap lock on mapping. */
-	bool hold_file_rmap_lock :1;
 	/* If .mmap_prepare changed the file, we don't need to pin. */
 	bool file_doesnt_need_get :1;
 };
@@ -2530,10 +2528,12 @@ static int __mmap_new_file_vma(struct mm
  *
  * @map:  Mapping state.
  * @vmap: Output pointer for the new VMA.
+ * @action: Any mmap_prepare action that is still to complete.
  *
  * Returns: Zero on success, or an error.
  */
-static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
+static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap,
+	struct mmap_action *action)
 {
 	struct vma_iterator *vmi = map->vmi;
 	int error = 0;
@@ -2582,7 +2582,7 @@ static int __mmap_new_vma(struct mmap_st
 	vma_start_write(vma);
 	vma_iter_store_new(vmi, vma);
 	map->mm->map_count++;
-	vma_link_file(vma, map->hold_file_rmap_lock);
+	vma_link_file(vma, action->hide_from_rmap_until_complete);
 
 	/*
 	 * vma_merge_new_range() calls khugepaged_enter_vma() too, the below
@@ -2649,8 +2649,6 @@ static int call_action_prepare(struct mm
 	if (err)
 		return err;
 
-	if (desc->action.hide_from_rmap_until_complete)
-		map->hold_file_rmap_lock = true;
 	return 0;
 }
 
@@ -2731,30 +2729,6 @@ static bool can_set_ksm_flags_early(stru
 	return false;
 }
 
-static int call_mapped_hook(struct mmap_state *map,
-			    struct vm_area_struct *vma)
-{
-	const struct vm_operations_struct *vm_ops = vma->vm_ops;
-	void *vm_private_data = vma->vm_private_data;
-	int err;
-
-	if (!vm_ops || !vm_ops->mapped)
-		return 0;
-	err = vm_ops->mapped(vma->vm_start, vma->vm_end, vma->vm_pgoff,
-			     vma->vm_file, &vm_private_data);
-	if (err) {
-		if (map->hold_file_rmap_lock)
-			i_mmap_unlock_write(vma->vm_file->f_mapping);
-
-		unmap_vma_locked(vma);
-		return err;
-	}
-	/* Update private data if changed. */
-	if (vm_private_data != vma->vm_private_data)
-		vma->vm_private_data = vm_private_data;
-	return 0;
-}
-
 static unsigned long __mmap_region(struct file *file, unsigned long addr,
 		unsigned long len, vma_flags_t vma_flags,
 		unsigned long pgoff, struct list_head *uf)
@@ -2794,7 +2768,7 @@ static unsigned long __mmap_region(struc
 
 	/* ...but if we can't, allocate a new VMA. */
 	if (!vma) {
-		error = __mmap_new_vma(&map, &vma);
+		error = __mmap_new_vma(&map, &vma, &desc.action);
 		if (error)
 			goto unacct_error;
 		allocated_new = true;
@@ -2806,10 +2780,7 @@ static unsigned long __mmap_region(struc
 	__mmap_complete(&map, vma);
 
 	if (have_mmap_prepare && allocated_new) {
-		error = mmap_action_complete(vma, &desc.action,
-					     map.hold_file_rmap_lock);
-		if (!error)
-			error = call_mapped_hook(&map, vma);
+		error = mmap_action_complete(vma, &desc.action);
 		if (error)
 			return error;
 	}
--- a/tools/testing/vma/include/dup.h~b
+++ a/tools/testing/vma/include/dup.h
@@ -1313,27 +1313,9 @@ static inline unsigned long vma_pages(co
 	return (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
 }
 
-static inline void unmap_vma_locked(struct vm_area_struct *vma)
-{
-	const size_t len = vma_pages(vma) << PAGE_SHIFT;
-
-	mmap_assert_write_locked(vma->vm_mm);
-	do_munmap(vma->vm_mm, vma->vm_start, len, NULL);
-}
-
-static inline int __compat_vma_mapped(struct file *file, struct vm_area_struct *vma)
+static inline int vfs_mmap_prepare(struct file *file, struct vm_area_desc *desc)
 {
-	const struct vm_operations_struct *vm_ops = vma->vm_ops;
-	int err;
-
-	if (!vm_ops->mapped)
-		return 0;
-
-	err = vm_ops->mapped(vma->vm_start, vma->vm_end, vma->vm_pgoff, file,
-			     &vma->vm_private_data);
-	if (err)
-		unmap_vma_locked(vma);
-	return err;
+	return file->f_op->mmap_prepare(desc);
 }
 
 static inline int __compat_vma_mmap(struct vm_area_desc *desc,
@@ -1348,35 +1330,27 @@ static inline int __compat_vma_mmap(stru
 	/* Update the VMA from the descriptor. */
 	compat_set_vma_from_desc(vma, desc);
 	/* Complete any specified mmap actions. */
-	err = mmap_action_complete(vma, &desc->action,
-				   /*rmap_lock_held=*/false);
-	if (err)
-		return err;
-
-	/* Invoke vm_ops->mapped callback. */
-	return __compat_vma_mapped(desc->file, vma);
-}
-
-static inline int vfs_mmap_prepare(struct file *file, struct vm_area_desc *desc)
-{
-	return file->f_op->mmap_prepare(desc);
+	return mmap_action_complete(vma, &desc->action);
 }
 
-static inline int compat_vma_mmap(struct file *file,
-		struct vm_area_struct *vma)
+static inline int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct vm_area_desc desc;
+	struct mmap_action *action;
 	int err;
 
 	compat_set_desc_from_vma(&desc, file, vma);
 	err = vfs_mmap_prepare(file, &desc);
 	if (err)
 		return err;
+	action = &desc.action;
+
+	/* being invoked from .mmmap means we don't have to enforce this. */
+	action->hide_from_rmap_until_complete = false;
 
 	return __compat_vma_mmap(&desc, vma);
 }
 
-
 static inline void vma_iter_init(struct vma_iterator *vmi,
 		struct mm_struct *mm, unsigned long addr)
 {
--- a/tools/testing/vma/include/stubs.h~b
+++ a/tools/testing/vma/include/stubs.h
@@ -87,8 +87,7 @@ static inline int mmap_action_prepare(st
 }
 
 static inline int mmap_action_complete(struct vm_area_struct *vma,
-				       struct mmap_action *action,
-				       bool rmap_lock_held)
+				       struct mmap_action *action)
 {
 	return 0;
 }
_

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
