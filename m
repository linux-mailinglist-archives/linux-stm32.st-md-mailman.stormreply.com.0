Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPUICdTMvWmsCAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 23:40:20 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A92E1D4E
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 23:40:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCB5FC36B3E;
	Fri, 20 Mar 2026 22:40:19 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E603C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 22:40:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2B97F60154;
 Fri, 20 Mar 2026 22:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A85C2BC9E;
 Fri, 20 Mar 2026 22:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774046417;
 bh=L0GQ2G+rRvGPAFrt5sDMa8oj/FKKHLhal+DfkgK7NEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bFVvmSaqDqJLoDlg+6noI1Wxcf1pqHJkBZjp3o48gNpg4DH44rSaBGPbLYz/qYZkM
 Nd8QwUFV1MaXSsj8jMMIjACmWtdO9Y/w9/2x+JJoanOvv9XyP9qFBdKZZkxb1A4iHC
 tkLQhKpN3alMVayVyEb9I/udX19c+sGN7XDtcaIOMLn6nekaglVJYw11nFmLwGrBc4
 hsCpEv1VvOJUhXrUrciA2il+pJ/sMHTGafOaYgDrjovh6SCT8n/MXsfdX3tgBGQOS2
 ldB6CM957Gunm1xRN2e3elhZJR5PM4eGqJVCx4WeRxsCBdQ44ZurTnPnt2jh0taBlN
 sszGTQBOqqiOA==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 20 Mar 2026 22:39:30 +0000
Message-ID: <d44248be9da68258b07c2c59d4e73485ee0ca943.1774045440.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774045440.git.ljs@kernel.org>
References: <cover.1774045440.git.ljs@kernel.org>
MIME-Version: 1.0
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
Subject: [Linux-stm32] [PATCH v4 04/21] mm: avoid deadlock when holding rmap
	on mmap_prepare error
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
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 0C7A92E1D4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit ac0a3fc9c07d ("mm: add ability to take further action in
vm_area_desc") added the ability for drivers to instruct mm to take actions
after the .mmap_prepare callback is complete.

To make life simpler and safer, this is done before the VMA/mmap write lock
is dropped but when the VMA is completely established.

So on error, we simply munmap() the VMA.

As part of this implementation, unfortunately a horrible hack had to be
implemented to support some questionable behaviour hugetlb relies upon -
that is that the file rmap lock is held until the operation is complete.

The implementation, for convenience, did this in mmap_action_finish() so
both the VMA and mmap_prepare compatibility layer paths would have this
correctly handled.

However, it turns out there is a mistake here - the rmap lock cannot be
held on munmap, as free_pgtables() -> unlink_file_vma_batch_add() ->
unlink_file_vma_batch_process() takes the file rmap lock.

We therefore currently have a deadlock issue that might arise.

Resolve this by leaving it to callers to handle the unmap.

The compatibility layer does not support this rmap behaviour, so we simply
have it unmap on error after calling mmap_action_complete().

In the VMA implementation, we only perform the unmap after the rmap lock is
dropped.

This resolves the issue by ensuring the rmap lock is always dropped when
the unmap occurs.

Fixes: ac0a3fc9c07d ("mm: add ability to take further action in vm_area_desc")
Cc: <stable@vger.kernel.org>
Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 mm/util.c | 12 +++++++-----
 mm/vma.c  | 13 ++++++++++---
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/mm/util.c b/mm/util.c
index 73c97a748d8e..a2cfa0d77c35 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1215,7 +1215,13 @@ int compat_vma_mmap(struct file *file, struct vm_area_struct *vma)
 		return err;
 
 	set_vma_from_desc(vma, &desc);
-	return mmap_action_complete(vma, &desc.action);
+	err = mmap_action_complete(vma, &desc.action);
+	if (err) {
+		const size_t len = vma_pages(vma) << PAGE_SHIFT;
+
+		do_munmap(current->mm, vma->vm_start, len, NULL);
+	}
+	return err;
 }
 EXPORT_SYMBOL(compat_vma_mmap);
 
@@ -1316,10 +1322,6 @@ static int mmap_action_finish(struct vm_area_struct *vma,
 	 * invoked if we do NOT merge, so we only clean up the VMA we created.
 	 */
 	if (err) {
-		const size_t len = vma_pages(vma) << PAGE_SHIFT;
-
-		do_munmap(current->mm, vma->vm_start, len, NULL);
-
 		if (action->error_hook) {
 			/* We may want to filter the error. */
 			err = action->error_hook(err);
diff --git a/mm/vma.c b/mm/vma.c
index ee91f2b76acf..3fc5fe4f1a7c 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2736,9 +2736,9 @@ static int call_action_complete(struct mmap_state *map,
 				struct mmap_action *action,
 				struct vm_area_struct *vma)
 {
-	int ret;
+	int err;
 
-	ret = mmap_action_complete(vma, action);
+	err = mmap_action_complete(vma, action);
 
 	/* If we held the file rmap we need to release it. */
 	if (map->hold_file_rmap_lock) {
@@ -2746,7 +2746,14 @@ static int call_action_complete(struct mmap_state *map,
 
 		i_mmap_unlock_write(file->f_mapping);
 	}
-	return ret;
+
+	if (err) {
+		const size_t len = vma_pages(vma) << PAGE_SHIFT;
+
+		do_munmap(current->mm, vma->vm_start, len, NULL);
+	}
+
+	return err;
 }
 
 static unsigned long __mmap_region(struct file *file, unsigned long addr,
-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
