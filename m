Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC0rHWrFs2kqawAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 09:06:02 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E67E327F3AD
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 09:06:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AB74C8F29D;
	Fri, 13 Mar 2026 08:06:01 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF7B6C8F28E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 20:27:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F423C6133A;
 Thu, 12 Mar 2026 20:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B7DC19425;
 Thu, 12 Mar 2026 20:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773347273;
 bh=Vhnl6dyI6DciWh1R2wyZ1qlkDiUoqFRvSKLSiU1V8ls=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZK1WltimUAZc0jYB/huW7CthVu5Pu5VFPFyTyvlS4T7HMAkTnJpb74i68i41ylW7Q
 7fyRQuCh/gLCub/cymRHsmhpsfS8DFpbAqZr1SS92G3+vQpwXbZfJnBMCChrImWhS6
 V+8bnKKwhWmdij/nWi43ezCIkdrjaJHlgcQy5rFniS8jR/7Rlk/YDXp43NqjK9oYzc
 FeI0J/rG34AJ6d6heDnhG73A8JiyAlXMohvdqoF701Bc7TYx5fMtntCofNtc6fMrPg
 EWAXKwA/Mf9O9WCfz+8946sw4KO8eURIrObVsTiW6QjgNpFc+hr+6SFctAmLsbLljH
 BJiGxYp2Ms+uA==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 12 Mar 2026 20:27:17 +0000
Message-ID: <c5bb61cf789df1ecb32facc29df9749987c7ddfc.1773346620.git.ljs@kernel.org>
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
Subject: [Linux-stm32] [PATCH 02/15] mm: add documentation for the
	mmap_prepare file operation callback
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
	NEURAL_HAM(-0.00)[-0.969];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: E67E327F3AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This documentation makes it easier for a driver/file system implementer to
correctly use this callback.

It covers the fundamentals, whilst intentionally leaving the less lovely
possible actions one might take undocumented (for instance - the
success_hook, error_hook fields in mmap_action).

The document also covers the new VMA flags implementation which is the only
one which will work correctly with mmap_prepare.

Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 Documentation/filesystems/mmap_prepare.rst | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/filesystems/mmap_prepare.rst

diff --git a/Documentation/filesystems/mmap_prepare.rst b/Documentation/filesystems/mmap_prepare.rst
new file mode 100644
index 000000000000..76908200f3a1
--- /dev/null
+++ b/Documentation/filesystems/mmap_prepare.rst
@@ -0,0 +1,131 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========================
+mmap_prepare callback HOWTO
+===========================
+
+Introduction
+############
+
+The `struct file->f_op->mmap()` callback has been deprecated as it is both a
+stability and security risk, and doesn't always permit the merging of adjacent
+mappings resulting in unnecessary memory fragmentation.
+
+It has been replaced with the `file->f_op->mmap_prepare()` callback which solves
+these problems.
+
+## How To Use
+
+In your driver's `struct file_operations` struct, specify an `mmap_prepare`
+callback rather than an `mmap` one, e.g. for ext4:
+
+
+.. code-block:: C
+
+    const struct file_operations ext4_file_operations = {
+        ...
+        .mmap_prepare    = ext4_file_mmap_prepare,
+    };
+
+This has a signature of `int (*mmap_prepare)(struct vm_area_desc *)`.
+
+Examining the `struct vm_area_desc` type:
+
+.. code-block:: C
+
+    struct vm_area_desc {
+        /* Immutable state. */
+        const struct mm_struct *const mm;
+        struct file *const file; /* May vary from vm_file in stacked callers. */
+        unsigned long start;
+        unsigned long end;
+
+        /* Mutable fields. Populated with initial state. */
+        pgoff_t pgoff;
+        struct file *vm_file;
+        vma_flags_t vma_flags;
+        pgprot_t page_prot;
+
+        /* Write-only fields. */
+        const struct vm_operations_struct *vm_ops;
+        void *private_data;
+
+        /* Take further action? */
+        struct mmap_action action;
+    };
+
+This is straightforward - you have all the fields you need to set up the
+mapping, and you can update the mutable and writable fields, for instance:
+
+.. code-block:: Cw
+
+    static int ext4_file_mmap_prepare(struct vm_area_desc *desc)
+    {
+        int ret;
+        struct file *file = desc->file;
+        struct inode *inode = file->f_mapping->host;
+
+        ...
+
+        file_accessed(file);
+        if (IS_DAX(file_inode(file))) {
+            desc->vm_ops = &ext4_dax_vm_ops;
+            vma_desc_set_flags(desc, VMA_HUGEPAGE_BIT);
+        } else {
+            desc->vm_ops = &ext4_file_vm_ops;
+        }
+        return 0;
+    }
+
+Importantly, you no longer have to dance around with reference counts or locks
+when updating these fields - __you can simply go ahead and change them__.
+
+Everything is taken care of by the mapping code.
+
+VMA Flags
+=========
+
+Along with `mmap_prepare`, VMA flags have undergone an overhaul. Where before
+you would invoke one of `vm_flags_init()`, `vm_flags_reset()`, `vm_flags_set()`,
+`vm_flags_clear()`, and `vm_flags_mod()` to modify flags (and to have the
+locking done correctly for you, this is no longer necessary.
+
+Also, the legacy approach of specifying VMA flags via `VM_READ`, `VM_WRITE`,
+etc. - i.e. using a `VM_xxx` macro has changed too.
+
+When implementing `mmap_prepare()`, reference flags by their bit number, defined
+as a `VMA_xxx_BIT` macro, e.g. `VMA_READ_BIT`, `VMA_WRITE_BIT` etc., and use one
+of (where `desc` is a pointer to `struct vma_area_desc`):
+
+* `vma_desc_test_flags(desc, ...)` - Specify a comma-separated list of flags you
+  wish to test for (whether _any_ are set), e.g. - `vma_desc_test_flags(desc,
+  VMA_WRITE_BIT, VMA_MAYWRITE_BIT)` - returns `true` if either are set,
+  otherwise `false`.
+* `vma_desc_set_flags(desc, ...)` - Update the VMA descriptor flags to set
+  additional flags specified by a comma-separated list,
+  e.g. - `vma_desc_set_flags(desc, VMA_PFNMAP_BIT, VMA_IO_BIT)`.
+* `vma_desc_clear_flags(desc, ...)` - Update the VMA descriptor flags to clear
+  flags specified by a comma-separated list, e.g. - `vma_desc_clear_flags(desc,
+  VMA_WRITE_BIT, VMA_MAYWRITE_BIT)`.
+
+Actions
+=======
+
+You can now very easily have actions be performed upon a mapping once set up by
+utilising simple helper functions invoked upon the `struct vm_area_desc`
+pointer. These are:
+
+* `mmap_action_remap()` - Remaps a range consisting only of PFNs for a specific
+  range starting a virtual address and PFN number of a set size.
+
+* `mmap_action_remap_full()` - Same as `mmap_action_remap()`, only remaps the
+  entire mapping from `start_pfn` onward.
+
+* `mmap_action_ioremap()` - Same as `mmap_action_remap()`, only performs an I/O
+  remap.
+
+* `mmap_action_ioremap_full()` - Same as `mmap_action_ioremap()`, only remaps
+  the entire mapping from `start_pfn` onward.
+
+**NOTE:** The 'action' field should never normally be manipulated directly,
+rather you ought to use one of these helpers.
-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
