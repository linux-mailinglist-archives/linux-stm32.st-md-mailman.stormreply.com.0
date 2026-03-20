Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BANCPbMvWmsCAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 23:40:54 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B032E1DE8
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 23:40:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4E96C36B3E;
	Fri, 20 Mar 2026 22:40:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C252C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 22:40:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7932C4403F;
 Fri, 20 Mar 2026 22:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA946C4CEF7;
 Fri, 20 Mar 2026 22:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774046451;
 bh=rywd1FEi1wWV4fl3gPPvz3vegyh8dDCmAT13xfhNCIY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mzh/VzNfn6owZgsAvp11YUWy6Ov62q3AksJSQPQGotGTLaVk8DUWoGOSIuPJc2Skm
 GcNkj89ZRfB/AJhumMEGHyopvzejgPPjD5JMAqXv6ekioGaY6Wbgk99VTAfg81a4fg
 qkbjrAhoW8twMolBCVxcIPE5igQ8FEeeXR8AoONojgL/vaNxVDE2d6TlODG+3M8ZPD
 kKZ3aDnmBxV3JHk5JTfrvS9Zi8Ur8+j6R+VmxzzEj0iV4hxRnhBbqbqfFaig73ngbW
 74lFPJeMzaejB5zScvPpsfMbHzCIr0pK3HWGQOCNcfheiHFK860SpEuHrdRp41KD/5
 m5QwNoosDnA5Q==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 20 Mar 2026 22:39:42 +0000
Message-ID: <08ecc1e1d319564fd49b9e9012f994edaff921db.1774045440.git.ljs@kernel.org>
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
Subject: [Linux-stm32] [PATCH v4 16/21] staging: vme_user: replace
	deprecated mmap hook with mmap_prepare
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 09B032E1DE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The f_op->mmap interface is deprecated, so update driver to use its
successor, mmap_prepare.

The driver previously used vm_iomap_memory(), so this change replaces it
with its mmap_prepare equivalent, mmap_action_simple_ioremap().

Functions that wrap mmap() are also converted to wrap mmap_prepare()
instead.

Also update the documentation accordingly.

Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 Documentation/driver-api/vme.rst    |  2 +-
 drivers/staging/vme_user/vme.c      | 20 +++++------
 drivers/staging/vme_user/vme.h      |  2 +-
 drivers/staging/vme_user/vme_user.c | 51 +++++++++++++++++------------
 4 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/Documentation/driver-api/vme.rst b/Documentation/driver-api/vme.rst
index c0b475369de0..7111999abc14 100644
--- a/Documentation/driver-api/vme.rst
+++ b/Documentation/driver-api/vme.rst
@@ -107,7 +107,7 @@ The function :c:func:`vme_master_read` can be used to read from and
 
 In addition to simple reads and writes, :c:func:`vme_master_rmw` is provided to
 do a read-modify-write transaction. Parts of a VME window can also be mapped
-into user space memory using :c:func:`vme_master_mmap`.
+into user space memory using :c:func:`vme_master_mmap_prepare`.
 
 
 Slave windows
diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index f10a00c05f12..7220aba7b919 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -735,9 +735,9 @@ unsigned int vme_master_rmw(struct vme_resource *resource, unsigned int mask,
 EXPORT_SYMBOL(vme_master_rmw);
 
 /**
- * vme_master_mmap - Mmap region of VME master window.
+ * vme_master_mmap_prepare - Mmap region of VME master window.
  * @resource: Pointer to VME master resource.
- * @vma: Pointer to definition of user mapping.
+ * @desc: Pointer to descriptor of user mapping.
  *
  * Memory map a region of the VME master window into user space.
  *
@@ -745,12 +745,13 @@ EXPORT_SYMBOL(vme_master_rmw);
  *         resource or -EFAULT if map exceeds window size. Other generic mmap
  *         errors may also be returned.
  */
-int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct *vma)
+int vme_master_mmap_prepare(struct vme_resource *resource,
+			    struct vm_area_desc *desc)
 {
+	const unsigned long vma_size = vma_desc_size(desc);
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_master_resource *image;
 	phys_addr_t phys_addr;
-	unsigned long vma_size;
 
 	if (resource->type != VME_MASTER) {
 		dev_err(bridge->parent, "Not a master resource\n");
@@ -758,19 +759,18 @@ int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct *vma)
 	}
 
 	image = list_entry(resource->entry, struct vme_master_resource, list);
-	phys_addr = image->bus_resource.start + (vma->vm_pgoff << PAGE_SHIFT);
-	vma_size = vma->vm_end - vma->vm_start;
+	phys_addr = image->bus_resource.start + (desc->pgoff << PAGE_SHIFT);
 
 	if (phys_addr + vma_size > image->bus_resource.end + 1) {
 		dev_err(bridge->parent, "Map size cannot exceed the window size\n");
 		return -EFAULT;
 	}
 
-	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-
-	return vm_iomap_memory(vma, phys_addr, vma->vm_end - vma->vm_start);
+	desc->page_prot = pgprot_noncached(desc->page_prot);
+	mmap_action_simple_ioremap(desc, phys_addr, vma_size);
+	return 0;
 }
-EXPORT_SYMBOL(vme_master_mmap);
+EXPORT_SYMBOL(vme_master_mmap_prepare);
 
 /**
  * vme_master_free - Free VME master window
diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
index 797e9940fdd1..b6413605ea49 100644
--- a/drivers/staging/vme_user/vme.h
+++ b/drivers/staging/vme_user/vme.h
@@ -151,7 +151,7 @@ ssize_t vme_master_read(struct vme_resource *resource, void *buf, size_t count,
 ssize_t vme_master_write(struct vme_resource *resource, void *buf, size_t count, loff_t offset);
 unsigned int vme_master_rmw(struct vme_resource *resource, unsigned int mask, unsigned int compare,
 			    unsigned int swap, loff_t offset);
-int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct *vma);
+int vme_master_mmap_prepare(struct vme_resource *resource, struct vm_area_desc *desc);
 void vme_master_free(struct vme_resource *resource);
 
 struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route);
diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index d95dd7d9190a..11e25c2f6b0a 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -446,24 +446,14 @@ static void vme_user_vm_close(struct vm_area_struct *vma)
 	kfree(vma_priv);
 }
 
-static const struct vm_operations_struct vme_user_vm_ops = {
-	.open = vme_user_vm_open,
-	.close = vme_user_vm_close,
-};
-
-static int vme_user_master_mmap(unsigned int minor, struct vm_area_struct *vma)
+static int vme_user_vm_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
+			      const struct file *file, void **vm_private_data)
 {
-	int err;
+	const unsigned int minor = iminor(file_inode(file));
 	struct vme_user_vma_priv *vma_priv;
 
 	mutex_lock(&image[minor].mutex);
 
-	err = vme_master_mmap(image[minor].resource, vma);
-	if (err) {
-		mutex_unlock(&image[minor].mutex);
-		return err;
-	}
-
 	vma_priv = kmalloc_obj(*vma_priv);
 	if (!vma_priv) {
 		mutex_unlock(&image[minor].mutex);
@@ -472,22 +462,41 @@ static int vme_user_master_mmap(unsigned int minor, struct vm_area_struct *vma)
 
 	vma_priv->minor = minor;
 	refcount_set(&vma_priv->refcnt, 1);
-	vma->vm_ops = &vme_user_vm_ops;
-	vma->vm_private_data = vma_priv;
-
+	*vm_private_data = vma_priv;
 	image[minor].mmap_count++;
 
 	mutex_unlock(&image[minor].mutex);
-
 	return 0;
 }
 
-static int vme_user_mmap(struct file *file, struct vm_area_struct *vma)
+static const struct vm_operations_struct vme_user_vm_ops = {
+	.mapped = vme_user_vm_mapped,
+	.open = vme_user_vm_open,
+	.close = vme_user_vm_close,
+};
+
+static int vme_user_master_mmap_prepare(unsigned int minor,
+					struct vm_area_desc *desc)
+{
+	int err;
+
+	mutex_lock(&image[minor].mutex);
+
+	err = vme_master_mmap_prepare(image[minor].resource, desc);
+	if (!err)
+		desc->vm_ops = &vme_user_vm_ops;
+
+	mutex_unlock(&image[minor].mutex);
+	return err;
+}
+
+static int vme_user_mmap_prepare(struct vm_area_desc *desc)
 {
-	unsigned int minor = iminor(file_inode(file));
+	const struct file *file = desc->file;
+	const unsigned int minor = iminor(file_inode(file));
 
 	if (type[minor] == MASTER_MINOR)
-		return vme_user_master_mmap(minor, vma);
+		return vme_user_master_mmap_prepare(minor, desc);
 
 	return -ENODEV;
 }
@@ -498,7 +507,7 @@ static const struct file_operations vme_user_fops = {
 	.llseek = vme_user_llseek,
 	.unlocked_ioctl = vme_user_unlocked_ioctl,
 	.compat_ioctl = compat_ptr_ioctl,
-	.mmap = vme_user_mmap,
+	.mmap_prepare = vme_user_mmap_prepare,
 };
 
 static int vme_user_match(struct vme_dev *vdev)
-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
