Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJLpNpdyuGn5dgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 22:13:59 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C888E2A0988
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 22:13:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89C51C8F262;
	Mon, 16 Mar 2026 21:13:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6052EC8F262
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 21:13:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4FA3F417B1;
 Mon, 16 Mar 2026 21:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6DBC19421;
 Mon, 16 Mar 2026 21:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773695637;
 bh=Ety6uMqPsqMphsUZjHWQlJPo7xJz901fcYuIgrq0DKg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nmnL0tjD2LjXqkscja+qK+o5w7KYcx1X3tNZZE+4s6jUiRbSKxC975NUisVAyfni6
 ZPAgYMCz590lP0FEbj4vo4otQhWUiDSpzm4M+SQVKlLbHX4QVH9StZHxUT3cJw1+NW
 mGc991yrKiEn4hkncIYU5mC8kMkfnkfdNzrr9iLncJ73hWX3VN5JP/d/zQPsM6uquV
 gJHsvKM4YJ8z2rhjCDfyrDvhGX2EH7g7R9+s2NQqn4s27zAsmYMC+pZq7Edt6YITp3
 4uRMMAkFqkX1hlYFoHTcFgKZVEb9+zpQOxRY+Pr0qA6jUCQdRny3jjbHKXYBIyrVyp
 phbu2Trdoa39w==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 16 Mar 2026 21:12:03 +0000
Message-ID: <77fbdae93f250fa1551f3052fc9034739795ff20.1773695307.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773695307.git.ljs@kernel.org>
References: <cover.1773695307.git.ljs@kernel.org>
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
Subject: [Linux-stm32] [PATCH v2 07/16] misc: open-dice: replace deprecated
	mmap hook with mmap_prepare
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
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,lwn.net,nod.at,lists.linux.dev,suse.de,arm.com,arndb.de,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:vbabka@kernel.org,m:linux-scsi@vger.kernel.org,m:corbet@lwn.net,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:arnd@arndb.de,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:surenb@google.com,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.or
 g,m:mcoquelin.stm32@gmail.com,m:linux-fsdevel@vger.kernel.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_SPAM(0.00)[0.661];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: C888E2A0988
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The f_op->mmap interface is deprecated, so update driver to use its
successor, mmap_prepare.

The driver previously used vm_iomap_memory(), so this change replaces it
with its mmap_prepare equivalent, mmap_action_simple_ioremap().

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 drivers/misc/open-dice.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/open-dice.c b/drivers/misc/open-dice.c
index 24c29e0f00ef..45060fb4ea27 100644
--- a/drivers/misc/open-dice.c
+++ b/drivers/misc/open-dice.c
@@ -86,29 +86,32 @@ static ssize_t open_dice_write(struct file *filp, const char __user *ptr,
 /*
  * Creates a mapping of the reserved memory region in user address space.
  */
-static int open_dice_mmap(struct file *filp, struct vm_area_struct *vma)
+static int open_dice_mmap_prepare(struct vm_area_desc *desc)
 {
+	struct file *filp = desc->file;
 	struct open_dice_drvdata *drvdata = to_open_dice_drvdata(filp);
 
-	if (vma->vm_flags & VM_MAYSHARE) {
+	if (vma_desc_test(desc, VMA_MAYSHARE_BIT)) {
 		/* Do not allow userspace to modify the underlying data. */
-		if (vma->vm_flags & VM_WRITE)
+		if (vma_desc_test(desc, VMA_WRITE_BIT))
 			return -EPERM;
 		/* Ensure userspace cannot acquire VM_WRITE later. */
-		vm_flags_clear(vma, VM_MAYWRITE);
+		vma_desc_clear_flags(desc, VMA_MAYWRITE_BIT);
 	}
 
 	/* Create write-combine mapping so all clients observe a wipe. */
-	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-	vm_flags_set(vma, VM_DONTCOPY | VM_DONTDUMP);
-	return vm_iomap_memory(vma, drvdata->rmem->base, drvdata->rmem->size);
+	desc->page_prot = pgprot_writecombine(desc->page_prot);
+	vma_desc_set_flags(desc, VMA_DONTCOPY_BIT, VMA_DONTDUMP_BIT);
+	mmap_action_simple_ioremap(desc, drvdata->rmem->base,
+				   drvdata->rmem->size);
+	return 0;
 }
 
 static const struct file_operations open_dice_fops = {
 	.owner = THIS_MODULE,
 	.read = open_dice_read,
 	.write = open_dice_write,
-	.mmap = open_dice_mmap,
+	.mmap_prepare = open_dice_mmap_prepare,
 };
 
 static int __init open_dice_probe(struct platform_device *pdev)
-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
