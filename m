Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKhME2dWs2mzVAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 01:12:23 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE9827B75B
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 01:12:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CB06C8F299;
	Fri, 13 Mar 2026 00:12:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C50D0C8F28E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 00:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Content-Type:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+GAI1yniehNGO2chwWjeJzMqefzHRGvnktfqEKsFLzY=; b=qZu7McthjBQtMj3aupJH1qJGgZ
 hKfu0DbCBr+3K+tnF9BoSB27l+4l1SpwxmKtVIMSc2xx+jsyaAa+w2I4QqDb7xtpgpaEXkMpdA4nm
 mU+yVb4umzLA87r5gf1DLfd7BsRQ0pP6gUDStnSk9lsUu/aytOBVbnxWQAFzgRbGNRBIl2Y1nMicN
 cmtT+S3U+xXWfSATHp24Wop6HYDRJiuNPDo+fBX5eYhi+EChJIGxPpnUdbkGi70Znq6mst/6jhwvs
 yztWkaiTkXncGNcjnmSVCXuuJE21lkxpP2x5JBsvLXf9YP+caSyG+t/jo14zcoxoVtD+8+Q/hB9PC
 nfWCKWoQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1w0q8L-0000000FsPm-2hlm; Fri, 13 Mar 2026 00:12:05 +0000
Content-Type: multipart/mixed; boundary="------------27O3bLyj7x6zyBk5Hv9GUKC3"
Message-ID: <f0e33b51-d465-462d-b0f6-98a1db66bb15@infradead.org>
Date: Thu, 12 Mar 2026 17:12:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <cover.1773346620.git.ljs@kernel.org>
 <c5bb61cf789df1ecb32facc29df9749987c7ddfc.1773346620.git.ljs@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <c5bb61cf789df1ecb32facc29df9749987c7ddfc.1773346620.git.ljs@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH 02/15] mm: add documentation for the
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:akpm@linux-foundation.org,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:vbabka@kernel.org,m:linux-scsi@vger.kernel.org,m:corbet@lwn.net,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:arnd@arndb.de,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:surenb@google.com,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kern
 el@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-fsdevel@vger.kernel.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[44];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,lwn.net,nod.at,lists.linux.dev,suse.de,arm.com,arndb.de,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_SPAM(0.00)[0.567];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: DBE9827B75B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a multi-part message in MIME format.
--------------27O3bLyj7x6zyBk5Hv9GUKC3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

(Andrew: patch attached)


On 3/12/26 1:27 PM, Lorenzo Stoakes (Oracle) wrote:

Documentation/filesystems/mmap_prepare.rst: WARNING: document isn't included in any toctree [toc.not_included]

Should be in some index.rst file. In filesystems I suppose.

> ---
>  Documentation/filesystems/mmap_prepare.rst | 131 +++++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/filesystems/mmap_prepare.rst
> 
> diff --git a/Documentation/filesystems/mmap_prepare.rst b/Documentation/filesystems/mmap_prepare.rst
> new file mode 100644
> index 000000000000..76908200f3a1
> --- /dev/null
> +++ b/Documentation/filesystems/mmap_prepare.rst
> @@ -0,0 +1,131 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===========================
> +mmap_prepare callback HOWTO
> +===========================
> +
> +Introduction
> +############

Kernel style is "=============" above instead of "############".

> +
> +The `struct file->f_op->mmap()` callback has been deprecated as it is both a
> +stability and security risk, and doesn't always permit the merging of adjacent
> +mappings resulting in unnecessary memory fragmentation.
> +
> +It has been replaced with the `file->f_op->mmap_prepare()` callback which solves
> +these problems.
> +
> +## How To Use
> +
> +In your driver's `struct file_operations` struct, specify an `mmap_prepare`
> +callback rather than an `mmap` one, e.g. for ext4:
> +
> +
> +.. code-block:: C
> +
> +    const struct file_operations ext4_file_operations = {
> +        ...
> +        .mmap_prepare    = ext4_file_mmap_prepare,
> +    };
> +
> +This has a signature of `int (*mmap_prepare)(struct vm_area_desc *)`.
> +
> +Examining the `struct vm_area_desc` type:
> +
> +.. code-block:: C
> +
> +    struct vm_area_desc {
> +        /* Immutable state. */
> +        const struct mm_struct *const mm;
> +        struct file *const file; /* May vary from vm_file in stacked callers. */
> +        unsigned long start;
> +        unsigned long end;
> +
> +        /* Mutable fields. Populated with initial state. */
> +        pgoff_t pgoff;
> +        struct file *vm_file;
> +        vma_flags_t vma_flags;
> +        pgprot_t page_prot;
> +
> +        /* Write-only fields. */
> +        const struct vm_operations_struct *vm_ops;
> +        void *private_data;
> +
> +        /* Take further action? */
> +        struct mmap_action action;
> +    };
> +
> +This is straightforward - you have all the fields you need to set up the
> +mapping, and you can update the mutable and writable fields, for instance:
> +
> +.. code-block:: Cw

   .. code-block:: C

Documentation/filesystems/mmap_prepare.rst:60: WARNING: Pygments lexer name 'Cw' is not known [misc.highlighting_failure]

Maybe a typo?

> +
> +    static int ext4_file_mmap_prepare(struct vm_area_desc *desc)
> +    {
> +        int ret;
> +        struct file *file = desc->file;
> +        struct inode *inode = file->f_mapping->host;
> +
> +        ...
> +
> +        file_accessed(file);
> +        if (IS_DAX(file_inode(file))) {
> +            desc->vm_ops = &ext4_dax_vm_ops;
> +            vma_desc_set_flags(desc, VMA_HUGEPAGE_BIT);
> +        } else {
> +            desc->vm_ops = &ext4_file_vm_ops;
> +        }
> +        return 0;
> +    }
> +
> +Importantly, you no longer have to dance around with reference counts or locks
> +when updating these fields - __you can simply go ahead and change them__.
> +
> +Everything is taken care of by the mapping code.
> +
> +VMA Flags
> +=========

and then use "---------------" here instead of "==============".

(from Documentation/doc-guide/sphinx.rst)

> +
> +Along with `mmap_prepare`, VMA flags have undergone an overhaul. Where before
> +you would invoke one of `vm_flags_init()`, `vm_flags_reset()`, `vm_flags_set()`,
> +`vm_flags_clear()`, and `vm_flags_mod()` to modify flags (and to have the
> +locking done correctly for you, this is no longer necessary.
> +
> +Also, the legacy approach of specifying VMA flags via `VM_READ`, `VM_WRITE`,
> +etc. - i.e. using a `VM_xxx` macro has changed too.
> +
> +When implementing `mmap_prepare()`, reference flags by their bit number, defined
> +as a `VMA_xxx_BIT` macro, e.g. `VMA_READ_BIT`, `VMA_WRITE_BIT` etc., and use one
> +of (where `desc` is a pointer to `struct vma_area_desc`):
> +
> +* `vma_desc_test_flags(desc, ...)` - Specify a comma-separated list of flags you
> +  wish to test for (whether _any_ are set), e.g. - `vma_desc_test_flags(desc,
> +  VMA_WRITE_BIT, VMA_MAYWRITE_BIT)` - returns `true` if either are set,
> +  otherwise `false`.
> +* `vma_desc_set_flags(desc, ...)` - Update the VMA descriptor flags to set
> +  additional flags specified by a comma-separated list,
> +  e.g. - `vma_desc_set_flags(desc, VMA_PFNMAP_BIT, VMA_IO_BIT)`.
> +* `vma_desc_clear_flags(desc, ...)` - Update the VMA descriptor flags to clear
> +  flags specified by a comma-separated list, e.g. - `vma_desc_clear_flags(desc,
> +  VMA_WRITE_BIT, VMA_MAYWRITE_BIT)`.
> +
> +Actions
> +=======
> +
> +You can now very easily have actions be performed upon a mapping once set up by
> +utilising simple helper functions invoked upon the `struct vm_area_desc`
> +pointer. These are:
> +
> +* `mmap_action_remap()` - Remaps a range consisting only of PFNs for a specific
> +  range starting a virtual address and PFN number of a set size.
> +
> +* `mmap_action_remap_full()` - Same as `mmap_action_remap()`, only remaps the
> +  entire mapping from `start_pfn` onward.
> +
> +* `mmap_action_ioremap()` - Same as `mmap_action_remap()`, only performs an I/O
> +  remap.
> +
> +* `mmap_action_ioremap_full()` - Same as `mmap_action_ioremap()`, only remaps
> +  the entire mapping from `start_pfn` onward.
> +
> +**NOTE:** The 'action' field should never normally be manipulated directly,
> +rather you ought to use one of these helpers.

I also see this warning, but I don't know what it is referring to:

Documentation/filesystems/mmap_prepare.rst:132: ERROR: Anonymous hyperlink mismatch: 1 references but 0 targets.
See "backrefs" attribute for IDs. [docutils]

(OK, I found/fixed that also.)

There are also lots of single ` marks which mean italics. I thought those were
not what was intended, so I changed (most of) them to `` marks, which means
"code block / monospace". I can fix those if needed.

from the patch file:
@Lorenzo: ISTR that you prefer explicit quoting on structs and
functions. I didn't do that here since kernel automarkup does that,
but if you prefer, I can redo the patch with those changes.

HTH.
-- 
~Randy

--------------27O3bLyj7x6zyBk5Hv9GUKC3
Content-Type: text/x-patch; charset=UTF-8;
 name="mmap-prepare-docs-fixes.patch"
Content-Disposition: attachment; filename="mmap-prepare-docs-fixes.patch"
Content-Transfer-Encoding: base64

RnJvbTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+ClN1YmplY3Q6IFtQ
QVRDSF0gRG9jczogbW1hcF9wcmVwYXJlOiBmaXggc3BoaW54IHdhcm5pbmdzIGFuZCBmb3Jt
YXQKCkZpeCAnbWFrZSBodG1sZG9jcycgYnVpbGQgd2FybmluZ3MsIGhlYWRpbmdzIHN0eWxl
LCBhbmQgcXVvdGluZwpzdHlsZS4KCkRvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbW1hcF9w
cmVwYXJlLnJzdDogV0FSTklORzogZG9jdW1lbnQgaXNuJ3QgaW5jbHVkZWQgaW4gYW55IHRv
Y3RyZWUgW3RvYy5ub3RfaW5jbHVkZWRdCkRvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbW1h
cF9wcmVwYXJlLnJzdDo2MDogV0FSTklORzogUHlnbWVudHMgbGV4ZXIgbmFtZSAnQ3cnIGlz
IG5vdCBrbm93biBbbWlzYy5oaWdobGlnaHRpbmdfZmFpbHVyZV0KRG9jdW1lbnRhdGlvbi9m
aWxlc3lzdGVtcy9tbWFwX3ByZXBhcmUucnN0OjEzMjogRVJST1I6IEFub255bW91cyBoeXBl
cmxpbmsgbWlzbWF0Y2g6IDEgcmVmZXJlbmNlcyBidXQgMCB0YXJnZXRzLgpTZWUgImJhY2ty
ZWZzIiBhdHRyaWJ1dGUgZm9yIElEcy4gW2RvY3V0aWxzXQoKU2lnbmVkLW9mZi1ieTogUmFu
ZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+Ci0tLQpATG9yZW56bzogSVNUUiB0
aGF0IHlvdSBwcmVmZXIgZXhwbGljaXQgcXVvdGluZyBvbiBzdHJ1Y3RzIGFuZApmdW5jdGlv
bnMuIEkgZGlkbid0IGRvIHRoYXQgaGVyZSBzaW5jZSBrZXJuZWwgYXV0b21hcmt1cCBkb2Vz
IHRoYXQsCmJ1dCBpZiB5b3UgcHJlZmVyLCBJIGNhbiByZWRvIHRoZSBwYXRjaCB3aXRoIHRo
b3NlIGNoYW5nZXMuCgogRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9pbmRleC5yc3QgICAg
ICAgIHwgICAgMSAKIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbW1hcF9wcmVwYXJlLnJz
dCB8ICAgNzQgKysrKysrKysrLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNl
cnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkKCi0tLSBsaW51eC1uZXh0Lm9yaWcvRG9jdW1l
bnRhdGlvbi9maWxlc3lzdGVtcy9pbmRleC5yc3QKKysrIGxpbnV4LW5leHQvRG9jdW1lbnRh
dGlvbi9maWxlc3lzdGVtcy9pbmRleC5yc3QKQEAgLTI5LDYgKzI5LDcgQEAgYWxnb3JpdGht
cyB3b3JrLgogICAgZmllbWFwCiAgICBmaWxlcwogICAgbG9ja3MKKyAgIG1tYXBfcHJlcGFy
ZQogICAgbXVsdGlncmFpbi10cwogICAgbW91bnRfYXBpCiAgICBxdW90YQotLS0gbGludXgt
bmV4dC5vcmlnL0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbW1hcF9wcmVwYXJlLnJzdAor
KysgbGludXgtbmV4dC9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL21tYXBfcHJlcGFyZS5y
c3QKQEAgLTUsMTkgKzUsMTkgQEAgbW1hcF9wcmVwYXJlIGNhbGxiYWNrIEhPV1RPCiA9PT09
PT09PT09PT09PT09PT09PT09PT09PT0KIAogSW50cm9kdWN0aW9uCi0jIyMjIyMjIyMjIyMK
Kz09PT09PT09PT09PQogCi1UaGUgYHN0cnVjdCBmaWxlLT5mX29wLT5tbWFwKClgIGNhbGxi
YWNrIGhhcyBiZWVuIGRlcHJlY2F0ZWQgYXMgaXQgaXMgYm90aCBhCitUaGUgYGBzdHJ1Y3Qg
ZmlsZS0+Zl9vcC0+bW1hcCgpYGAgY2FsbGJhY2sgaGFzIGJlZW4gZGVwcmVjYXRlZCBhcyBp
dCBpcyBib3RoIGEKIHN0YWJpbGl0eSBhbmQgc2VjdXJpdHkgcmlzaywgYW5kIGRvZXNuJ3Qg
YWx3YXlzIHBlcm1pdCB0aGUgbWVyZ2luZyBvZiBhZGphY2VudAogbWFwcGluZ3MgcmVzdWx0
aW5nIGluIHVubmVjZXNzYXJ5IG1lbW9yeSBmcmFnbWVudGF0aW9uLgogCi1JdCBoYXMgYmVl
biByZXBsYWNlZCB3aXRoIHRoZSBgZmlsZS0+Zl9vcC0+bW1hcF9wcmVwYXJlKClgIGNhbGxi
YWNrIHdoaWNoIHNvbHZlcwotdGhlc2UgcHJvYmxlbXMuCitJdCBoYXMgYmVlbiByZXBsYWNl
ZCB3aXRoIHRoZSBgYGZpbGUtPmZfb3AtPm1tYXBfcHJlcGFyZSgpYGAgY2FsbGJhY2sgd2hp
Y2gKK3NvbHZlcyB0aGVzZSBwcm9ibGVtcy4KIAogIyMgSG93IFRvIFVzZQogCi1JbiB5b3Vy
IGRyaXZlcidzIGBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zYCBzdHJ1Y3QsIHNwZWNpZnkgYW4g
YG1tYXBfcHJlcGFyZWAKLWNhbGxiYWNrIHJhdGhlciB0aGFuIGFuIGBtbWFwYCBvbmUsIGUu
Zy4gZm9yIGV4dDQ6CitJbiB5b3VyIGRyaXZlcidzIHN0cnVjdCBmaWxlX29wZXJhdGlvbnMg
c3RydWN0LCBzcGVjaWZ5IGFuIGBgbW1hcF9wcmVwYXJlYGAKK2NhbGxiYWNrIHJhdGhlciB0
aGFuIGFuIGBgbW1hcGBgIG9uZSwgZS5nLiBmb3IgZXh0NDoKIAogCiAuLiBjb2RlLWJsb2Nr
OjogQwpAQCAtMjcsOSArMjcsOSBAQCBjYWxsYmFjayByYXRoZXIgdGhhbiBhbiBgbW1hcGAg
b25lLCBlLmcuCiAgICAgICAgIC5tbWFwX3ByZXBhcmUgICAgPSBleHQ0X2ZpbGVfbW1hcF9w
cmVwYXJlLAogICAgIH07CiAKLVRoaXMgaGFzIGEgc2lnbmF0dXJlIG9mIGBpbnQgKCptbWFw
X3ByZXBhcmUpKHN0cnVjdCB2bV9hcmVhX2Rlc2MgKilgLgorVGhpcyBoYXMgYSBzaWduYXR1
cmUgb2YgYGBpbnQgKCptbWFwX3ByZXBhcmUpKHN0cnVjdCB2bV9hcmVhX2Rlc2MgKilgYC4K
IAotRXhhbWluaW5nIHRoZSBgc3RydWN0IHZtX2FyZWFfZGVzY2AgdHlwZToKK0V4YW1pbmlu
ZyB0aGUgc3RydWN0IHZtX2FyZWFfZGVzYyB0eXBlOgogCiAuLiBjb2RlLWJsb2NrOjogQwog
CkBAIC01Nyw3ICs1Nyw3IEBAIEV4YW1pbmluZyB0aGUgYHN0cnVjdCB2bV9hcmVhX2Rlc2Ng
IHR5cGUKIFRoaXMgaXMgc3RyYWlnaHRmb3J3YXJkIC0geW91IGhhdmUgYWxsIHRoZSBmaWVs
ZHMgeW91IG5lZWQgdG8gc2V0IHVwIHRoZQogbWFwcGluZywgYW5kIHlvdSBjYW4gdXBkYXRl
IHRoZSBtdXRhYmxlIGFuZCB3cml0YWJsZSBmaWVsZHMsIGZvciBpbnN0YW5jZToKIAotLi4g
Y29kZS1ibG9jazo6IEN3CisuLiBjb2RlLWJsb2NrOjogQwogCiAgICAgc3RhdGljIGludCBl
eHQ0X2ZpbGVfbW1hcF9wcmVwYXJlKHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCiAgICAg
ewpAQCAtNzgsNTQgKzc4LDU0IEBAIG1hcHBpbmcsIGFuZCB5b3UgY2FuIHVwZGF0ZSB0aGUg
bXV0YWJsZQogICAgIH0KIAogSW1wb3J0YW50bHksIHlvdSBubyBsb25nZXIgaGF2ZSB0byBk
YW5jZSBhcm91bmQgd2l0aCByZWZlcmVuY2UgY291bnRzIG9yIGxvY2tzCi13aGVuIHVwZGF0
aW5nIHRoZXNlIGZpZWxkcyAtIF9feW91IGNhbiBzaW1wbHkgZ28gYWhlYWQgYW5kIGNoYW5n
ZSB0aGVtX18uCit3aGVuIHVwZGF0aW5nIHRoZXNlIGZpZWxkcyAtICoqeW91IGNhbiBzaW1w
bHkgZ28gYWhlYWQgYW5kIGNoYW5nZSB0aGVtKiouCiAKIEV2ZXJ5dGhpbmcgaXMgdGFrZW4g
Y2FyZSBvZiBieSB0aGUgbWFwcGluZyBjb2RlLgogCiBWTUEgRmxhZ3MKLT09PT09PT09PQor
LS0tLS0tLS0tCiAKLUFsb25nIHdpdGggYG1tYXBfcHJlcGFyZWAsIFZNQSBmbGFncyBoYXZl
IHVuZGVyZ29uZSBhbiBvdmVyaGF1bC4gV2hlcmUgYmVmb3JlCi15b3Ugd291bGQgaW52b2tl
IG9uZSBvZiBgdm1fZmxhZ3NfaW5pdCgpYCwgYHZtX2ZsYWdzX3Jlc2V0KClgLCBgdm1fZmxh
Z3Nfc2V0KClgLAotYHZtX2ZsYWdzX2NsZWFyKClgLCBhbmQgYHZtX2ZsYWdzX21vZCgpYCB0
byBtb2RpZnkgZmxhZ3MgKGFuZCB0byBoYXZlIHRoZQorQWxvbmcgd2l0aCBgYG1tYXBfcHJl
cGFyZWBgLCBWTUEgZmxhZ3MgaGF2ZSB1bmRlcmdvbmUgYW4gb3ZlcmhhdWwuIFdoZXJlIGJl
Zm9yZQoreW91IHdvdWxkIGludm9rZSBvbmUgb2Ygdm1fZmxhZ3NfaW5pdCgpLCB2bV9mbGFn
c19yZXNldCgpLCB2bV9mbGFnc19zZXQoKSwKK3ZtX2ZsYWdzX2NsZWFyKCksIGFuZCB2bV9m
bGFnc19tb2QoKSB0byBtb2RpZnkgZmxhZ3MgKGFuZCB0byBoYXZlIHRoZQogbG9ja2luZyBk
b25lIGNvcnJlY3RseSBmb3IgeW91LCB0aGlzIGlzIG5vIGxvbmdlciBuZWNlc3NhcnkuCiAK
LUFsc28sIHRoZSBsZWdhY3kgYXBwcm9hY2ggb2Ygc3BlY2lmeWluZyBWTUEgZmxhZ3Mgdmlh
IGBWTV9SRUFEYCwgYFZNX1dSSVRFYCwKLWV0Yy4gLSBpLmUuIHVzaW5nIGEgYFZNX3h4eGAg
bWFjcm8gaGFzIGNoYW5nZWQgdG9vLgorQWxzbywgdGhlIGxlZ2FjeSBhcHByb2FjaCBvZiBz
cGVjaWZ5aW5nIFZNQSBmbGFncyB2aWEgYGBWTV9SRUFEYGAsIGBgVk1fV1JJVEVgYCwKK2V0
Yy4gLSBpLmUuIHVzaW5nIGEgYGAtVk1feHh4YGAtIG1hY3JvIGhhcyBjaGFuZ2VkIHRvby4K
IAotV2hlbiBpbXBsZW1lbnRpbmcgYG1tYXBfcHJlcGFyZSgpYCwgcmVmZXJlbmNlIGZsYWdz
IGJ5IHRoZWlyIGJpdCBudW1iZXIsIGRlZmluZWQKLWFzIGEgYFZNQV94eHhfQklUYCBtYWNy
bywgZS5nLiBgVk1BX1JFQURfQklUYCwgYFZNQV9XUklURV9CSVRgIGV0Yy4sIGFuZCB1c2Ug
b25lCi1vZiAod2hlcmUgYGRlc2NgIGlzIGEgcG9pbnRlciB0byBgc3RydWN0IHZtYV9hcmVh
X2Rlc2NgKToKLQotKiBgdm1hX2Rlc2NfdGVzdF9mbGFncyhkZXNjLCAuLi4pYCAtIFNwZWNp
ZnkgYSBjb21tYS1zZXBhcmF0ZWQgbGlzdCBvZiBmbGFncyB5b3UKLSAgd2lzaCB0byB0ZXN0
IGZvciAod2hldGhlciBfYW55XyBhcmUgc2V0KSwgZS5nLiAtIGB2bWFfZGVzY190ZXN0X2Zs
YWdzKGRlc2MsCi0gIFZNQV9XUklURV9CSVQsIFZNQV9NQVlXUklURV9CSVQpYCAtIHJldHVy
bnMgYHRydWVgIGlmIGVpdGhlciBhcmUgc2V0LAotICBvdGhlcndpc2UgYGZhbHNlYC4KLSog
YHZtYV9kZXNjX3NldF9mbGFncyhkZXNjLCAuLi4pYCAtIFVwZGF0ZSB0aGUgVk1BIGRlc2Ny
aXB0b3IgZmxhZ3MgdG8gc2V0CitXaGVuIGltcGxlbWVudGluZyBtbWFwX3ByZXBhcmUoKSwg
cmVmZXJlbmNlIGZsYWdzIGJ5IHRoZWlyIGJpdCBudW1iZXIsIGRlZmluZWQKK2FzIGEgYGBW
TUFfeHh4X0JJVGBgIG1hY3JvLCBlLmcuIGBgVk1BX1JFQURfQklUYGAsIGBgVk1BX1dSSVRF
X0JJVGBgIGV0Yy4sCithbmQgdXNlIG9uZSBvZiAod2hlcmUgYGBkZXNjYGAgaXMgYSBwb2lu
dGVyIHRvIHN0cnVjdCB2bWFfYXJlYV9kZXNjKToKKworKiBgYHZtYV9kZXNjX3Rlc3RfZmxh
Z3MoZGVzYywgLi4uKWBgIC0gU3BlY2lmeSBhIGNvbW1hLXNlcGFyYXRlZCBsaXN0IG9mIGZs
YWdzCisgIHlvdSB3aXNoIHRvIHRlc3QgZm9yICh3aGV0aGVyIF9hbnlfIGFyZSBzZXQpLCBl
LmcuIC0gYGB2bWFfZGVzY190ZXN0X2ZsYWdzKAorICBkZXNjLCBWTUFfV1JJVEVfQklULCBW
TUFfTUFZV1JJVEVfQklUKWBgIC0gcmV0dXJucyBgYHRydWVgYCBpZiBlaXRoZXIgYXJlIHNl
dCwKKyAgb3RoZXJ3aXNlIGBgZmFsc2VgYC4KKyogYGB2bWFfZGVzY19zZXRfZmxhZ3MoZGVz
YywgLi4uKWBgIC0gVXBkYXRlIHRoZSBWTUEgZGVzY3JpcHRvciBmbGFncyB0byBzZXQKICAg
YWRkaXRpb25hbCBmbGFncyBzcGVjaWZpZWQgYnkgYSBjb21tYS1zZXBhcmF0ZWQgbGlzdCwK
LSAgZS5nLiAtIGB2bWFfZGVzY19zZXRfZmxhZ3MoZGVzYywgVk1BX1BGTk1BUF9CSVQsIFZN
QV9JT19CSVQpYC4KLSogYHZtYV9kZXNjX2NsZWFyX2ZsYWdzKGRlc2MsIC4uLilgIC0gVXBk
YXRlIHRoZSBWTUEgZGVzY3JpcHRvciBmbGFncyB0byBjbGVhcgotICBmbGFncyBzcGVjaWZp
ZWQgYnkgYSBjb21tYS1zZXBhcmF0ZWQgbGlzdCwgZS5nLiAtIGB2bWFfZGVzY19jbGVhcl9m
bGFncyhkZXNjLAotICBWTUFfV1JJVEVfQklULCBWTUFfTUFZV1JJVEVfQklUKWAuCisgIGUu
Zy4gLSBgYHZtYV9kZXNjX3NldF9mbGFncyhkZXNjLCBWTUFfUEZOTUFQX0JJVCwgVk1BX0lP
X0JJVClgYC4KKyogYGB2bWFfZGVzY19jbGVhcl9mbGFncyhkZXNjLCAuLi4pYGAgLSBVcGRh
dGUgdGhlIFZNQSBkZXNjcmlwdG9yIGZsYWdzIHRvIGNsZWFyCisgIGZsYWdzIHNwZWNpZmll
ZCBieSBhIGNvbW1hLXNlcGFyYXRlZCBsaXN0LCBlLmcuIC0gYGB2bWFfZGVzY19jbGVhcl9m
bGFncygKKyAgZGVzYywgVk1BX1dSSVRFX0JJVCwgVk1BX01BWVdSSVRFX0JJVClgYC4KIAog
QWN0aW9ucwogPT09PT09PQogCiBZb3UgY2FuIG5vdyB2ZXJ5IGVhc2lseSBoYXZlIGFjdGlv
bnMgYmUgcGVyZm9ybWVkIHVwb24gYSBtYXBwaW5nIG9uY2Ugc2V0IHVwIGJ5Ci11dGlsaXNp
bmcgc2ltcGxlIGhlbHBlciBmdW5jdGlvbnMgaW52b2tlZCB1cG9uIHRoZSBgc3RydWN0IHZt
X2FyZWFfZGVzY2AKK3V0aWxpc2luZyBzaW1wbGUgaGVscGVyIGZ1bmN0aW9ucyBpbnZva2Vk
IHVwb24gdGhlIHN0cnVjdCB2bV9hcmVhX2Rlc2MKIHBvaW50ZXIuIFRoZXNlIGFyZToKIAot
KiBgbW1hcF9hY3Rpb25fcmVtYXAoKWAgLSBSZW1hcHMgYSByYW5nZSBjb25zaXN0aW5nIG9u
bHkgb2YgUEZOcyBmb3IgYSBzcGVjaWZpYworKiBtbWFwX2FjdGlvbl9yZW1hcCgpIC0gUmVt
YXBzIGEgcmFuZ2UgY29uc2lzdGluZyBvbmx5IG9mIFBGTnMgZm9yIGEgc3BlY2lmaWMKICAg
cmFuZ2Ugc3RhcnRpbmcgYSB2aXJ0dWFsIGFkZHJlc3MgYW5kIFBGTiBudW1iZXIgb2YgYSBz
ZXQgc2l6ZS4KIAotKiBgbW1hcF9hY3Rpb25fcmVtYXBfZnVsbCgpYCAtIFNhbWUgYXMgYG1t
YXBfYWN0aW9uX3JlbWFwKClgLCBvbmx5IHJlbWFwcyB0aGUKLSAgZW50aXJlIG1hcHBpbmcg
ZnJvbSBgc3RhcnRfcGZuYCBvbndhcmQuCisqIG1tYXBfYWN0aW9uX3JlbWFwX2Z1bGwoKSAt
IFNhbWUgYXMgbW1hcF9hY3Rpb25fcmVtYXAoKSwgb25seSByZW1hcHMgdGhlCisgIGVudGly
ZSBtYXBwaW5nIGZyb20gYGBzdGFydF9wZm5gYCBvbndhcmQuCiAKLSogYG1tYXBfYWN0aW9u
X2lvcmVtYXAoKWAgLSBTYW1lIGFzIGBtbWFwX2FjdGlvbl9yZW1hcCgpYCwgb25seSBwZXJm
b3JtcyBhbiBJL08KKyogbW1hcF9hY3Rpb25faW9yZW1hcCgpIC0gU2FtZSBhcyBtbWFwX2Fj
dGlvbl9yZW1hcCgpLCBvbmx5IHBlcmZvcm1zIGFuIEkvTwogICByZW1hcC4KIAotKiBgbW1h
cF9hY3Rpb25faW9yZW1hcF9mdWxsKClgIC0gU2FtZSBhcyBgbW1hcF9hY3Rpb25faW9yZW1h
cCgpYCwgb25seSByZW1hcHMKLSAgdGhlIGVudGlyZSBtYXBwaW5nIGZyb20gYHN0YXJ0X3Bm
bmAgb253YXJkLgorKiBtbWFwX2FjdGlvbl9pb3JlbWFwX2Z1bGwoKSAtIFNhbWUgYXMgbW1h
cF9hY3Rpb25faW9yZW1hcCgpLCBvbmx5IHJlbWFwcworICB0aGUgZW50aXJlIG1hcHBpbmcg
ZnJvbSBgYHN0YXJ0X3BmbmBgIG9ud2FyZC4KIAotKipOT1RFOioqIFRoZSAnYWN0aW9uJyBm
aWVsZCBzaG91bGQgbmV2ZXIgbm9ybWFsbHkgYmUgbWFuaXB1bGF0ZWQgZGlyZWN0bHksCisq
Kk5PVEU6KiogVGhlIGBgYWN0aW9uYGAgZmllbGQgc2hvdWxkIG5ldmVyIG5vcm1hbGx5IGJl
IG1hbmlwdWxhdGVkIGRpcmVjdGx5LAogcmF0aGVyIHlvdSBvdWdodCB0byB1c2Ugb25lIG9m
IHRoZXNlIGhlbHBlcnMuCg==

--------------27O3bLyj7x6zyBk5Hv9GUKC3
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--------------27O3bLyj7x6zyBk5Hv9GUKC3--
