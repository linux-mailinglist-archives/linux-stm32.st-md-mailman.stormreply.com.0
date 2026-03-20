Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOeNGNrMvWmsCAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 23:40:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 451FC2E1D6B
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 23:40:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05FF7C87ED8;
	Fri, 20 Mar 2026 22:40:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 964E3C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 22:40:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BD65B61118;
 Fri, 20 Mar 2026 22:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF76C2BCB0;
 Fri, 20 Mar 2026 22:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774046423;
 bh=5B0UudB5t6IvoUSjas4gSsitxv5wljP/xv5/LMRSwMw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KUQ4yJnN/WuHnEHkwKNXjPL29+3niu71Tepf6T8MO4WkDdogsFLE72V8PeJFDVlF4
 Bgq2IUCnGX2DqjqxgG9VU/AJ9tvaRvZoXCJ/edOpA2ecyHNMPx/827tzdtxUxlno1b
 kB/jx2f29BxgqysOfNJm2thngFQSBiZldAHGABhZEbYYZtllNjGAzqunIUk7syMpWE
 q4F2EYNQ3xjEpxq+z70oW/TZyTdZnIe3eNlH70hr0fh7kvql3+XaNSIzX6J9joDX/J
 Wo7adkEJHy2wBoh1A0sfY4bHYjqE6KjPrlgSkBE1+cXFhZzg9cVq3BIUNXtQCYbYf7
 VMR8sVXp9E6aw==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 20 Mar 2026 22:39:32 +0000
Message-ID: <42c3fbb701e361a17193ecda0d2dabcc326288a5.1774045440.git.ljs@kernel.org>
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
Subject: [Linux-stm32] [PATCH v4 06/21] mm/vma: remove superfluous
	map->hold_file_rmap_lock
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 451FC2E1D6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We don't need to reference this field, it's confusing as it duplicates
mmap_action->hide_from_rmap_until_complete, so thread the mmap_action
through to __mmap_new_vma() instead and use the same field consistently.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 mm/vma.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index 3fc5fe4f1a7c..6105f54cea61 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -38,8 +38,6 @@ struct mmap_state {
 
 	/* Determine if we can check KSM flags early in mmap() logic. */
 	bool check_ksm_early :1;
-	/* If we map new, hold the file rmap lock on mapping. */
-	bool hold_file_rmap_lock :1;
 	/* If .mmap_prepare changed the file, we don't need to pin. */
 	bool file_doesnt_need_get :1;
 };
@@ -2531,10 +2529,12 @@ static int __mmap_new_file_vma(struct mmap_state *map,
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
@@ -2583,7 +2583,7 @@ static int __mmap_new_vma(struct mmap_state *map, struct vm_area_struct **vmap)
 	vma_start_write(vma);
 	vma_iter_store_new(vmi, vma);
 	map->mm->map_count++;
-	vma_link_file(vma, map->hold_file_rmap_lock);
+	vma_link_file(vma, action->hide_from_rmap_until_complete);
 
 	/*
 	 * vma_merge_new_range() calls khugepaged_enter_vma() too, the below
@@ -2650,8 +2650,6 @@ static int call_action_prepare(struct mmap_state *map,
 	if (err)
 		return err;
 
-	if (desc->action.hide_from_rmap_until_complete)
-		map->hold_file_rmap_lock = true;
 	return 0;
 }
 
@@ -2741,7 +2739,7 @@ static int call_action_complete(struct mmap_state *map,
 	err = mmap_action_complete(vma, action);
 
 	/* If we held the file rmap we need to release it. */
-	if (map->hold_file_rmap_lock) {
+	if (action->hide_from_rmap_until_complete) {
 		struct file *file = vma->vm_file;
 
 		i_mmap_unlock_write(file->f_mapping);
@@ -2795,7 +2793,7 @@ static unsigned long __mmap_region(struct file *file, unsigned long addr,
 
 	/* ...but if we can't, allocate a new VMA. */
 	if (!vma) {
-		error = __mmap_new_vma(&map, &vma);
+		error = __mmap_new_vma(&map, &vma, &desc.action);
 		if (error)
 			goto unacct_error;
 		allocated_new = true;
-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
