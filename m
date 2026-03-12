Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBSLFHrFs2lAawAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 09:06:18 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 346D427F483
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 09:06:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF78FC9009B;
	Fri, 13 Mar 2026 08:06:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44538C8F28F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 20:28:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 92BDA61840;
 Thu, 12 Mar 2026 20:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE0CC2BC86;
 Thu, 12 Mar 2026 20:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773347299;
 bh=3gkyUtsSx7jHel7cmRKZSxJv14d/Oyif1xbXqVSUag8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SE1eoNLLnCchG8HnK6XRvfFeHKhyfrzwwjiWm9QdAt5SsrbT5Uw9DpSpKd50HTu4X
 xdndXitgm96uIJn7PRDHQ7k9Hgf4LZp/zIwyQxTDnU08FmxgNaGLbcUr/QaZemp3i6
 DkSmTS08I/Wqy4/GCxky+IbGqrb4HTAtMgXkKY6chyfRut5Zuvanm3/fJh/KyDnajD
 zgAsNGcfUqJVqPQsSSgeeaMqILTnr1t9nv9XdS8jqAAcPSUMs8GYDUPyMJIN6ryyR7
 WipiB8AnSPEZcCIwFfuXFjLJFpnnAcxDM1jDa9nEcFSnQ+CAffoYMGMMWgKSaFy739
 ZBR1/mSnh9p4Q==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 12 Mar 2026 20:27:28 +0000
Message-ID: <1f0408ba81f455d35bcf510ccd3dc3cb939b55ca.1773346620.git.ljs@kernel.org>
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
Subject: [Linux-stm32] [PATCH 13/15] drivers: hv: vmbus: replace deprecated
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
	NEURAL_HAM(-0.00)[-0.971];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 346D427F483
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The f_op->mmap interface is deprecated, so update the vmbus driver to use
its successor, mmap_prepare.

This updates all callbacks which referenced the function pointer
hv_mmap_ring_buffer to instead reference hv_mmap_prepare_ring_buffer,
utilising the newly introduced compat_set_desc_from_vma() and
__compat_vma_mmap() to be able to implement this change.

The UIO HV generic driver is the only user of hv_create_ring_sysfs(), which
is the only function which references
vmbus_channel->mmap_prepare_ring_buffer which, in turn, is the only
external interface to hv_mmap_prepare_ring_buffer.

This patch therefore updates this caller to use mmap_prepare instead, which
also previously used vm_iomap_memory(), so this change replaces it
with its mmap_prepare equivalent, mmap_action_simple_ioremap().

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 drivers/hv/hyperv_vmbus.h    |  4 ++--
 drivers/hv/vmbus_drv.c       | 27 +++++++++++++++++----------
 drivers/uio/uio_hv_generic.c | 11 ++++++-----
 include/linux/hyperv.h       |  4 ++--
 4 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/hv/hyperv_vmbus.h b/drivers/hv/hyperv_vmbus.h
index 7bd8f8486e85..31f576464f18 100644
--- a/drivers/hv/hyperv_vmbus.h
+++ b/drivers/hv/hyperv_vmbus.h
@@ -545,8 +545,8 @@ static inline int hv_debug_add_dev_dir(struct hv_device *dev)
 
 /* Create and remove sysfs entry for memory mapped ring buffers for a channel */
 int hv_create_ring_sysfs(struct vmbus_channel *channel,
-			 int (*hv_mmap_ring_buffer)(struct vmbus_channel *channel,
-						    struct vm_area_struct *vma));
+			 int (*hv_mmap_prepare_ring_buffer)(struct vmbus_channel *channel,
+							    struct vm_area_desc *desc));
 int hv_remove_ring_sysfs(struct vmbus_channel *channel);
 
 #endif /* _HYPERV_VMBUS_H */
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index bc4fc1951ae1..a76fa3f0588c 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -1951,12 +1951,19 @@ static int hv_mmap_ring_buffer_wrapper(struct file *filp, struct kobject *kobj,
 				       struct vm_area_struct *vma)
 {
 	struct vmbus_channel *channel = container_of(kobj, struct vmbus_channel, kobj);
+	struct vm_area_desc desc;
+	int err;
 
 	/*
 	 * hv_(create|remove)_ring_sysfs implementation ensures that mmap_ring_buffer
 	 * is not NULL.
 	 */
-	return channel->mmap_ring_buffer(channel, vma);
+	compat_set_desc_from_vma(&desc, filp, vma);
+	err = channel->mmap_prepare_ring_buffer(channel, &desc);
+	if (err)
+		return err;
+
+	return __compat_vma_mmap(&desc, vma);
 }
 
 static struct bin_attribute chan_attr_ring_buffer = {
@@ -2048,13 +2055,13 @@ static const struct kobj_type vmbus_chan_ktype = {
 /**
  * hv_create_ring_sysfs() - create "ring" sysfs entry corresponding to ring buffers for a channel.
  * @channel: Pointer to vmbus_channel structure
- * @hv_mmap_ring_buffer: function pointer for initializing the function to be called on mmap of
+ * @hv_mmap_ring_buffer: function pointer for initializing the function to be called on mmap
  *                       channel's "ring" sysfs node, which is for the ring buffer of that channel.
  *                       Function pointer is of below type:
- *                       int (*hv_mmap_ring_buffer)(struct vmbus_channel *channel,
- *                                                  struct vm_area_struct *vma))
- *                       This has a pointer to the channel and a pointer to vm_area_struct,
- *                       used for mmap, as arguments.
+ *                       int (*hv_mmap_prepare_ring_buffer)(struct vmbus_channel *channel,
+ *                                                          struct vm_area_desc *desc))
+ *                       This has a pointer to the channel and a pointer to vm_area_desc,
+ *                       used for mmap_prepare, as arguments.
  *
  * Sysfs node for ring buffer of a channel is created along with other fields, however its
  * visibility is disabled by default. Sysfs creation needs to be controlled when the use-case
@@ -2071,12 +2078,12 @@ static const struct kobj_type vmbus_chan_ktype = {
  * Returns 0 on success or error code on failure.
  */
 int hv_create_ring_sysfs(struct vmbus_channel *channel,
-			 int (*hv_mmap_ring_buffer)(struct vmbus_channel *channel,
-						    struct vm_area_struct *vma))
+			 int (*hv_mmap_prepare_ring_buffer)(struct vmbus_channel *channel,
+							    struct vm_area_desc *desc))
 {
 	struct kobject *kobj = &channel->kobj;
 
-	channel->mmap_ring_buffer = hv_mmap_ring_buffer;
+	channel->mmap_prepare_ring_buffer = hv_mmap_prepare_ring_buffer;
 	channel->ring_sysfs_visible = true;
 
 	return sysfs_update_group(kobj, &vmbus_chan_group);
@@ -2098,7 +2105,7 @@ int hv_remove_ring_sysfs(struct vmbus_channel *channel)
 
 	channel->ring_sysfs_visible = false;
 	ret = sysfs_update_group(kobj, &vmbus_chan_group);
-	channel->mmap_ring_buffer = NULL;
+	channel->mmap_prepare_ring_buffer = NULL;
 	return ret;
 }
 EXPORT_SYMBOL_GPL(hv_remove_ring_sysfs);
diff --git a/drivers/uio/uio_hv_generic.c b/drivers/uio/uio_hv_generic.c
index 3f8e2e27697f..29ec2d15ada8 100644
--- a/drivers/uio/uio_hv_generic.c
+++ b/drivers/uio/uio_hv_generic.c
@@ -154,15 +154,16 @@ static void hv_uio_rescind(struct vmbus_channel *channel)
  * The ring buffer is allocated as contiguous memory by vmbus_open
  */
 static int
-hv_uio_ring_mmap(struct vmbus_channel *channel, struct vm_area_struct *vma)
+hv_uio_ring_mmap_prepare(struct vmbus_channel *channel, struct vm_area_desc *desc)
 {
 	void *ring_buffer = page_address(channel->ringbuffer_page);
 
 	if (channel->state != CHANNEL_OPENED_STATE)
 		return -ENODEV;
 
-	return vm_iomap_memory(vma, virt_to_phys(ring_buffer),
-			       channel->ringbuffer_pagecount << PAGE_SHIFT);
+	mmap_action_simple_ioremap(desc, virt_to_phys(ring_buffer),
+			channel->ringbuffer_pagecount << PAGE_SHIFT);
+	return 0;
 }
 
 /* Callback from VMBUS subsystem when new channel created. */
@@ -183,7 +184,7 @@ hv_uio_new_channel(struct vmbus_channel *new_sc)
 	}
 
 	set_channel_read_mode(new_sc, HV_CALL_ISR);
-	ret = hv_create_ring_sysfs(new_sc, hv_uio_ring_mmap);
+	ret = hv_create_ring_sysfs(new_sc, hv_uio_ring_mmap_prepare);
 	if (ret) {
 		dev_err(device, "sysfs create ring bin file failed; %d\n", ret);
 		vmbus_close(new_sc);
@@ -366,7 +367,7 @@ hv_uio_probe(struct hv_device *dev,
 	 * or decoupled from uio_hv_generic probe. Userspace programs can make use of inotify
 	 * APIs to make sure that ring is created.
 	 */
-	hv_create_ring_sysfs(channel, hv_uio_ring_mmap);
+	hv_create_ring_sysfs(channel, hv_uio_ring_mmap_prepare);
 
 	hv_set_drvdata(dev, pdata);
 
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index dfc516c1c719..3a721b1853a4 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1015,8 +1015,8 @@ struct vmbus_channel {
 	/* The max size of a packet on this channel */
 	u32 max_pkt_size;
 
-	/* function to mmap ring buffer memory to the channel's sysfs ring attribute */
-	int (*mmap_ring_buffer)(struct vmbus_channel *channel, struct vm_area_struct *vma);
+	/* function to mmap_prepare ring buffer memory to the channel's sysfs ring attribute */
+	int (*mmap_prepare_ring_buffer)(struct vmbus_channel *channel, struct vm_area_desc *desc);
 
 	/* boolean to control visibility of sysfs for ring buffer */
 	bool ring_sysfs_visible;
-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
