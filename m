Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOv9L0BdvGlxxQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 21:32:00 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5688F2D22DD
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 21:32:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 044E9C87ED5;
	Thu, 19 Mar 2026 20:32:00 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9C88C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 20:31:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8BB454409F;
 Thu, 19 Mar 2026 20:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1892DC19424;
 Thu, 19 Mar 2026 20:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1773952317;
 bh=k4Wu0yW+mvI9B7Y5ruIvTPwY3ACHxidfwH+5dDU5ckk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QVSebynGroB6foJO0/OXslM669XvU6nEbsiX403mdEF6B35aKR75rTbZ9Wp1hP+rZ
 zg+NNlb82u2RNpiIRVFeZ155ZV9VkPFYeFPRXlLdeVuVQ49zNflcj9iJ8OhifTADHX
 6+GFbBRP2EAe1BhmGSZIu7yAbsv6Up1UZ9OGEadY=
Date: Thu, 19 Mar 2026 13:31:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Message-Id: <20260319133155.692b298782828bb0fbb7959b@linux-foundation.org>
In-Reply-To: <cover.1773944114.git.ljs@kernel.org>
References: <cover.1773944114.git.ljs@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH v3 00/16] mm: expand mmap_prepare
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[linux-foundation.org:s=korg];
	MV_CASE(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[akpm@linux-foundation.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:vbabka@kernel.org,m:linux-scsi@vger.kernel.org,m:corbet@lwn.net,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:arnd@arndb.de,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:surenb@google.com,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:mcoquel
 in.stm32@gmail.com,m:linux-fsdevel@vger.kernel.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[43];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,lwn.net,nod.at,lists.linux.dev,suse.de,arm.com,arndb.de,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com];
	NEURAL_SPAM(0.00)[0.198];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 5688F2D22DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026 18:23:24 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:

> This series expands the mmap_prepare functionality, which is intended to
> replace the deprecated f_op->mmap hook which has been the source of bugs
> and security issues for some time.
> 

Thanks, I updated mm.git's mm-new branch to this version.
> 
> v3:
> * Propagated tags (thanks Suren, Richard!)
> * Updated 12/16 to correctly clear the vm_area_desc data structure in
>   set_desc_from_vma() as per Joshua Hahn (thanks! :)
> * Fixed type in 12/16 as per Suren (cheers!)
> * Fixed up 6/16 to use mmap_action_ioremap_full() in simple_ioremap_prepare() as
>   suggested by Suren.
> * Also fixed up 6/16 to call io_remap_pfn_range_prepare() direct rather than
>   mmap_action_prepare() as per Suren.
> * Also fixed up 6/16 to pass vm_len rather than vm_[start, end] to
>   __simple_ioremap_prep() as per Suren (thanks for all the above! :)
> * Fixed issue in rmap lock being held - we were referencing a vma->vm_file after
>   the VMA was unmapped, so UAF. Avoid that. Also do_munmap() relies on rmap lock
>   NOT being held or may deadlock, so extend functionality to ensure we drop it
>   when it is held on error paths.
> * Updated 'area' -> 'vma' variable in 3/16 in VMA test dup.h.
> * Fixed up reference to __compat_vma_mmap() in 12/16 commit message.
> * Updated 1/16 to no longer duplicatively apply io_remap_pfn_range_pfn().
> * Updated 1/16 to delegate I/O remap complete to remap complete logic.
> * Fixed various typos in 12/16.
> * Fixed stale comment typos in 13/16.
> * Fixed commit msg and comment typos in 14/16.
> * Removed accidental sneak peak to future functionality in 15/16 commit message
>   :).
> * Fixed up field names to be identical in VMA tests + mm_types.h in 6/16,
>   15/16.

Here's how v3 altered mm.git:


 drivers/hv/vmbus_drv.c            |    6 +-
 drivers/target/target_core_user.c |    2 
 include/linux/mm.h                |    3 -
 include/linux/uio_driver.h        |    2 
 mm/internal.h                     |   22 ++++-----
 mm/memory.c                       |   16 +++----
 mm/util.c                         |   62 ++++++++++++++--------------
 mm/vma.c                          |   24 +++-------
 tools/testing/vma/include/dup.h   |   19 ++++----
 tools/testing/vma/include/stubs.h |    3 -
 10 files changed, 77 insertions(+), 82 deletions(-)

--- a/drivers/hv/vmbus_drv.c~b
+++ a/drivers/hv/vmbus_drv.c
@@ -1955,8 +1955,8 @@ static int hv_mmap_ring_buffer_wrapper(s
 	int err;
 
 	/*
-	 * hv_(create|remove)_ring_sysfs implementation ensures that mmap_ring_buffer
-	 * is not NULL.
+	 * hv_(create|remove)_ring_sysfs implementation ensures that
+	 * mmap_prepare_ring_buffer is not NULL.
 	 */
 	compat_set_desc_from_vma(&desc, filp, vma);
 	err = channel->mmap_prepare_ring_buffer(channel, &desc);
@@ -2055,7 +2055,7 @@ static const struct kobj_type vmbus_chan
 /**
  * hv_create_ring_sysfs() - create "ring" sysfs entry corresponding to ring buffers for a channel.
  * @channel: Pointer to vmbus_channel structure
- * @hv_mmap_ring_buffer: function pointer for initializing the function to be called on mmap
+ * @hv_mmap_prepare_ring_buffer: function pointer for initializing the function to be called on mmap
  *                       channel's "ring" sysfs node, which is for the ring buffer of that channel.
  *                       Function pointer is of below type:
  *                       int (*hv_mmap_prepare_ring_buffer)(struct vmbus_channel *channel,
--- a/drivers/target/target_core_user.c~b
+++ a/drivers/target/target_core_user.c
@@ -1865,7 +1865,7 @@ static int tcmu_vma_mapped(unsigned long
 {
 	struct tcmu_dev *udev = *vm_private_data;
 
-	pr_debug("vma_open\n");
+	pr_debug("vma_mapped\n");
 
 	kref_get(&udev->kref);
 	return 0;
--- a/include/linux/mm.h~b
+++ a/include/linux/mm.h
@@ -4405,7 +4405,8 @@ static inline void mmap_action_map_kerne
 
 int mmap_action_prepare(struct vm_area_desc *desc);
 int mmap_action_complete(struct vm_area_struct *vma,
-			 struct mmap_action *action);
+			 struct mmap_action *action,
+			 bool rmap_lock_held);
 
 /* Look up the first VMA which exactly match the interval vm_start ... vm_end */
 static inline struct vm_area_struct *find_exact_vma(struct mm_struct *mm,
--- a/include/linux/uio_driver.h~b
+++ a/include/linux/uio_driver.h
@@ -97,7 +97,7 @@ struct uio_device {
  * @irq_flags:		flags for request_irq()
  * @priv:		optional private data
  * @handler:		the device's irq handler
- * @mmap_prepare:	mmap_pepare operation for this uio device
+ * @mmap_prepare:	mmap_prepare operation for this uio device
  * @open:		open operation for this uio device
  * @release:		release operation for this uio device
  * @irqcontrol:		disable/enable irqs when 0/1 is written to /dev/uioX
--- a/mm/internal.h~b
+++ a/mm/internal.h
@@ -1805,29 +1805,25 @@ int remap_pfn_range_prepare(struct vm_ar
 int remap_pfn_range_complete(struct vm_area_struct *vma,
 			     struct mmap_action *action);
 int simple_ioremap_prepare(struct vm_area_desc *desc);
-/* No simple_ioremap_complete, is ultimately handled by remap complete. */
 
 static inline int io_remap_pfn_range_prepare(struct vm_area_desc *desc)
 {
 	struct mmap_action *action = &desc->action;
 	const unsigned long orig_pfn = action->remap.start_pfn;
+	const pgprot_t orig_pgprot = action->remap.pgprot;
 	const unsigned long size = action->remap.size;
 	const unsigned long pfn = io_remap_pfn_range_pfn(orig_pfn, size);
+	int err;
 
 	action->remap.start_pfn = pfn;
-	return remap_pfn_range_prepare(desc);
-}
-
-static inline int io_remap_pfn_range_complete(struct vm_area_struct *vma,
-					      struct mmap_action *action)
-{
-	const unsigned long size = action->remap.size;
-	const unsigned long orig_pfn = action->remap.start_pfn;
-	const pgprot_t orig_prot = vma->vm_page_prot;
+	action->remap.pgprot = pgprot_decrypted(orig_pgprot);
+	err = remap_pfn_range_prepare(desc);
+	if (err)
+		return err;
 
-	action->remap.pgprot = pgprot_decrypted(orig_prot);
-	action->remap.start_pfn  = io_remap_pfn_range_pfn(orig_pfn, size);
-	return remap_pfn_range_complete(vma, action);
+	/* Remap does the actual work. */
+	action->type = MMAP_REMAP_PFN;
+	return 0;
 }
 
 #ifdef CONFIG_MMU_NOTIFIER
--- a/mm/memory.c~b
+++ a/mm/memory.c
@@ -3207,11 +3207,10 @@ int remap_pfn_range_complete(struct vm_a
 	return do_remap_pfn_range(vma, start, pfn, size, prot);
 }
 
-static int __simple_ioremap_prep(unsigned long vm_start, unsigned long vm_end,
-				 pgoff_t vm_pgoff, phys_addr_t start_phys,
-				 unsigned long size, unsigned long *pfnp)
+static int __simple_ioremap_prep(unsigned long vm_len, pgoff_t vm_pgoff,
+				 phys_addr_t start_phys, unsigned long size,
+				 unsigned long *pfnp)
 {
-	const unsigned long vm_len = vm_end - vm_start;
 	unsigned long pfn, pages;
 
 	/* Check that the physical memory area passed in looks valid */
@@ -3250,14 +3249,14 @@ int simple_ioremap_prepare(struct vm_are
 	unsigned long pfn;
 	int err;
 
-	err = __simple_ioremap_prep(desc->start, desc->end, desc->pgoff,
+	err = __simple_ioremap_prep(vma_desc_size(desc), desc->pgoff,
 				    start, size, &pfn);
 	if (err)
 		return err;
 
 	/* The I/O remap logic does the heavy lifting. */
-	mmap_action_ioremap(desc, desc->start, pfn, vma_desc_size(desc));
-	return mmap_action_prepare(desc);
+	mmap_action_ioremap_full(desc, pfn);
+	return io_remap_pfn_range_prepare(desc);
 }
 
 /**
@@ -3283,8 +3282,7 @@ int vm_iomap_memory(struct vm_area_struc
 	unsigned long pfn;
 	int err;
 
-	err = __simple_ioremap_prep(vm_start, vm_end, vma->vm_pgoff, start,
-				    len, &pfn);
+	err = __simple_ioremap_prep(vm_len, vma->vm_pgoff, start, len, &pfn);
 	if (err)
 		return err;
 
--- a/mm/util.c~b
+++ a/mm/util.c
@@ -1181,6 +1181,8 @@ void compat_set_desc_from_vma(struct vm_
 			      const struct file *file,
 			      const struct vm_area_struct *vma)
 {
+	memset(desc, 0, sizeof(*desc));
+
 	desc->mm = vma->vm_mm;
 	desc->file = (struct file *)file;
 	desc->start = vma->vm_start;
@@ -1224,7 +1226,7 @@ static int __compat_vma_mapped(struct fi
  * @vma: The VMA to which @desc should be applied.
  *
  * The function assumes that you have obtained a VMA descriptor @desc from
- * compt_set_desc_from_vma(), and already executed the mmap_prepare() hook upon
+ * compat_set_desc_from_vma(), and already executed the mmap_prepare() hook upon
  * it.
  *
  * It then performs any specified mmap actions, and invokes the vm_ops->mapped()
@@ -1249,7 +1251,8 @@ int __compat_vma_mmap(struct vm_area_des
 	/* Update the VMA from the descriptor. */
 	compat_set_vma_from_desc(vma, desc);
 	/* Complete any specified mmap actions. */
-	err = mmap_action_complete(vma, &desc->action);
+	err = mmap_action_complete(vma, &desc->action,
+				   /*rmap_lock_held=*/false);
 	if (err)
 		return err;
 
@@ -1397,29 +1400,31 @@ again:
 }
 
 static int mmap_action_finish(struct vm_area_struct *vma,
-			      struct mmap_action *action, int err)
+			      struct mmap_action *action, int err,
+			      bool rmap_lock_held)
 {
+	if (rmap_lock_held)
+		i_mmap_unlock_write(vma->vm_file->f_mapping);
+
+	if (!err) {
+		if (action->success_hook)
+			return action->success_hook(vma);
+		return 0;
+	}
+
 	/*
 	 * If an error occurs, unmap the VMA altogether and return an error. We
 	 * only clear the newly allocated VMA, since this function is only
 	 * invoked if we do NOT merge, so we only clean up the VMA we created.
 	 */
-	if (err) {
-		unmap_vma_locked(vma);
-		if (action->error_hook) {
-			/* We may want to filter the error. */
-			err = action->error_hook(err);
-
-			/* The caller should not clear the error. */
-			VM_WARN_ON_ONCE(!err);
-		}
-		return err;
+	unmap_vma_locked(vma);
+	if (action->error_hook) {
+		/* We may want to filter the error. */
+		err = action->error_hook(err);
+		/* The caller should not clear the error. */
+		VM_WARN_ON_ONCE(!err);
 	}
-
-	if (action->success_hook)
-		return action->success_hook(vma);
-
-	return 0;
+	return err;
 }
 
 #ifdef CONFIG_MMU
@@ -1454,13 +1459,15 @@ EXPORT_SYMBOL(mmap_action_prepare);
  * mmap_action_complete - Execute VMA descriptor action.
  * @vma: The VMA to perform the action upon.
  * @action: The action to perform.
+ * @rmap_lock_held: Is the file rmap lock held?
  *
  * Similar to mmap_action_prepare().
  *
  * Return: 0 on success, or error, at which point the VMA will be unmapped.
  */
 int mmap_action_complete(struct vm_area_struct *vma,
-			 struct mmap_action *action)
+			 struct mmap_action *action,
+			 bool rmap_lock_held)
 
 {
 	int err = 0;
@@ -1471,23 +1478,19 @@ int mmap_action_complete(struct vm_area_
 	case MMAP_REMAP_PFN:
 		err = remap_pfn_range_complete(vma, action);
 		break;
-	case MMAP_IO_REMAP_PFN:
-		err = io_remap_pfn_range_complete(vma, action);
-		break;
 	case MMAP_MAP_KERNEL_PAGES:
 		err = map_kernel_pages_complete(vma, action);
 		break;
+	case MMAP_IO_REMAP_PFN:
 	case MMAP_SIMPLE_IO_REMAP:
-		/*
-		 * The simple I/O remap should have been delegated to an I/O
-		 * remap.
-		 */
+		/* Should have been delegated. */
 		WARN_ON_ONCE(1);
 		err = -EINVAL;
 		break;
 	}
 
-	return mmap_action_finish(vma, action, err);
+	return mmap_action_finish(vma, action, err,
+				  rmap_lock_held);
 }
 EXPORT_SYMBOL(mmap_action_complete);
 #else
@@ -1509,7 +1512,8 @@ int mmap_action_prepare(struct vm_area_d
 EXPORT_SYMBOL(mmap_action_prepare);
 
 int mmap_action_complete(struct vm_area_struct *vma,
-			 struct mmap_action *action)
+			 struct mmap_action *action,
+			 bool rmap_lock_held)
 {
 	int err = 0;
 
@@ -1525,7 +1529,7 @@ int mmap_action_complete(struct vm_area_
 		break;
 	}
 
-	return mmap_action_finish(vma, action, err);
+	return mmap_action_finish(vma, action, err, rmap_lock_held);
 }
 EXPORT_SYMBOL(mmap_action_complete);
 #endif
--- a/mm/vma.c~b
+++ a/mm/vma.c
@@ -2732,7 +2732,8 @@ static bool can_set_ksm_flags_early(stru
 	return false;
 }
 
-static int call_mapped_hook(struct vm_area_struct *vma)
+static int call_mapped_hook(struct mmap_state *map,
+			    struct vm_area_struct *vma)
 {
 	const struct vm_operations_struct *vm_ops = vma->vm_ops;
 	void *vm_private_data = vma->vm_private_data;
@@ -2743,6 +2744,9 @@ static int call_mapped_hook(struct vm_ar
 	err = vm_ops->mapped(vma->vm_start, vma->vm_end, vma->vm_pgoff,
 			     vma->vm_file, &vm_private_data);
 	if (err) {
+		if (map->hold_file_rmap_lock)
+			i_mmap_unlock_write(vma->vm_file->f_mapping);
+
 		unmap_vma_locked(vma);
 		return err;
 	}
@@ -2752,17 +2756,6 @@ static int call_mapped_hook(struct vm_ar
 	return 0;
 }
 
-static void maybe_drop_file_rmap_lock(struct mmap_state *map,
-				      struct vm_area_struct *vma)
-{
-	struct file *file;
-
-	if (!map->hold_file_rmap_lock)
-		return;
-	file = vma->vm_file;
-	i_mmap_unlock_write(file->f_mapping);
-}
-
 static unsigned long __mmap_region(struct file *file, unsigned long addr,
 		unsigned long len, vma_flags_t vma_flags,
 		unsigned long pgoff, struct list_head *uf)
@@ -2814,11 +2807,10 @@ static unsigned long __mmap_region(struc
 	__mmap_complete(&map, vma);
 
 	if (have_mmap_prepare && allocated_new) {
-		error = mmap_action_complete(vma, &desc.action);
+		error = mmap_action_complete(vma, &desc.action,
+					     map.hold_file_rmap_lock);
 		if (!error)
-			error = call_mapped_hook(vma);
-
-		maybe_drop_file_rmap_lock(&map, vma);
+			error = call_mapped_hook(&map, vma);
 		if (error)
 			return error;
 	}
--- a/tools/testing/vma/include/dup.h~b
+++ a/tools/testing/vma/include/dup.h
@@ -470,13 +470,13 @@ struct mmap_action {
 			pgprot_t pgprot;
 		} remap;
 		struct {
-			phys_addr_t start;
-			unsigned long len;
+			phys_addr_t start_phys_addr;
+			unsigned long size;
 		} simple_ioremap;
 		struct {
 			unsigned long start;
 			struct page **pages;
-			unsigned long num;
+			unsigned long nr_pages;
 			pgoff_t pgoff;
 		} map_kernel;
 	};
@@ -648,7 +648,7 @@ struct vm_operations_struct {
 	 * upon first mapping a VMA.
 	 * Context: User context.  May sleep.  Caller holds mmap_lock.
 	 */
-	void (*open)(struct vm_area_struct * area);
+	void (*open)(struct vm_area_struct *vma);
 	/**
 	 * @close: Called when the VMA is being removed from the MM.
 	 * Context: User context.  May sleep.  Caller holds mmap_lock.
@@ -672,8 +672,8 @@ struct vm_operations_struct {
 	int (*mapped)(unsigned long start, unsigned long end, pgoff_t pgoff,
 		      const struct file *file, void **vm_private_data);
 	/* Called any time before splitting to check if it's allowed */
-	int (*may_split)(struct vm_area_struct *area, unsigned long addr);
-	int (*mremap)(struct vm_area_struct *area);
+	int (*may_split)(struct vm_area_struct *vma, unsigned long addr);
+	int (*mremap)(struct vm_area_struct *vma);
 	/*
 	 * Called by mprotect() to make driver-specific permission
 	 * checks before mprotect() is finalised.   The VMA must not
@@ -685,7 +685,7 @@ struct vm_operations_struct {
 	vm_fault_t (*huge_fault)(struct vm_fault *vmf, unsigned int order);
 	vm_fault_t (*map_pages)(struct vm_fault *vmf,
 			pgoff_t start_pgoff, pgoff_t end_pgoff);
-	unsigned long (*pagesize)(struct vm_area_struct * area);
+	unsigned long (*pagesize)(struct vm_area_struct *vma);
 
 	/* notification that a previously read-only page is about to become
 	 * writable, if an error is returned it will cause a SIGBUS */
@@ -1288,6 +1288,8 @@ static inline void compat_set_desc_from_
 			      const struct file *file,
 			      const struct vm_area_struct *vma)
 {
+	memset(desc, 0, sizeof(*desc));
+
 	desc->mm = vma->vm_mm;
 	desc->file = (struct file *)file;
 	desc->start = vma->vm_start;
@@ -1342,7 +1344,8 @@ static inline int __compat_vma_mmap(stru
 	/* Update the VMA from the descriptor. */
 	compat_set_vma_from_desc(vma, desc);
 	/* Complete any specified mmap actions. */
-	err = mmap_action_complete(vma, &desc->action);
+	err = mmap_action_complete(vma, &desc->action,
+				   /*rmap_lock_held=*/false);
 	if (err)
 		return err;
 
--- a/tools/testing/vma/include/stubs.h~b
+++ a/tools/testing/vma/include/stubs.h
@@ -87,7 +87,8 @@ static inline int mmap_action_prepare(st
 }
 
 static inline int mmap_action_complete(struct vm_area_struct *vma,
-				       struct mmap_action *action)
+				       struct mmap_action *action,
+				       bool rmap_lock_held)
 {
 	return 0;
 }
_

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
