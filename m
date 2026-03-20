Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAypOUq3vWkqAwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 22:08:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2EF2E11B0
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 22:08:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2B52C36B3E;
	Fri, 20 Mar 2026 21:08:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F2DCC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 21:08:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BF0F760126;
 Fri, 20 Mar 2026 21:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E28C4CEF7;
 Fri, 20 Mar 2026 21:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774040903;
 bh=u0zdmPIhkicnjjaekGwGuaSnl24uNp/SD6pTY4tTyoI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qC8HBmDJbc3QTlANvhaLjcn0O5ay5GqzDEvYHXsOkZQejTAbOkx+bkEo+ki3/IcqS
 2zxeTAiPAA/ZnIrs1vWkKIH1qQM6hWWWHXeyTtkY/GTcJVwCwrNv3c5QnInC7yBUEZ
 Emq3X5gGUqXLf66MStAVqC5m2WCTfSbnlpAHXDlhTtb1Ap6h4AtLg1EuCVIYnM3U2k
 9XYMGV8lFcVQ3Ofo63x/aFk8UD8Gt0FgB8ThIniVMGJGtCnjMclwn9hpHtv2VORGXx
 vrpZQBmOIITR6wCUusRaEbZoc8REFtZupMT7Shny3yqCThx6DNBFOpK9/XXBVuE7o9
 ZHBuzLHK9WgAw==
Date: Fri, 20 Mar 2026 14:08:12 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Message-ID: <20260320210812.GA3988975@ax162>
References: <cover.1773944114.git.ljs@kernel.org>
 <54ff3670662e10a66ce0c1a13c0ae93b99a5f201.1773944114.git.ljs@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54ff3670662e10a66ce0c1a13c0ae93b99a5f201.1773944114.git.ljs@kernel.org>
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
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Bodo Stroesser <bostroesser@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 15/16] mm: add
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_RECIPIENTS(0.00)[m:ljs@kernel.org,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:vbabka@kernel.org,m:linux-scsi@vger.kernel.org,m:corbet@lwn.net,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:arnd@arndb.de,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:surenb@google.com,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:mcoquel
 in.stm32@gmail.com,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,lwn.net,nod.at,lists.linux.dev,suse.de,arm.com,arndb.de,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com,linux-foundation.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 7C2EF2E11B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Lorenzo,

On Thu, Mar 19, 2026 at 06:23:39PM +0000, Lorenzo Stoakes (Oracle) wrote:
> A user can invoke mmap_action_map_kernel_pages() to specify that the
> mapping should map kernel pages starting from desc->start of a specified
> number of pages specified in an array.
> 
> In order to implement this, adjust mmap_action_prepare() to be able to
> return an error code, as it makes sense to assert that the specified
> parameters are valid as quickly as possible as well as updating the VMA
> flags to include VMA_MIXEDMAP_BIT as necessary.
> 
> This provides an mmap_prepare equivalent of vm_insert_pages().  We
> additionally update the existing vm_insert_pages() code to use
> range_in_vma() and add a new range_in_vma_desc() helper function for the
> mmap_prepare case, sharing the code between the two in range_is_subset().
> 
> We add both mmap_action_map_kernel_pages() and
> mmap_action_map_kernel_pages_full() to allow for both partial and full VMA
> mappings.
> 
> We update the documentation to reflect the new features.
> 
> Finally, we update the VMA tests accordingly to reflect the changes.
> 
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
...
> diff --git a/mm/util.c b/mm/util.c
> index 8cf59267a9ac..682d0d24e1c6 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1446,6 +1446,8 @@ int mmap_action_prepare(struct vm_area_desc *desc)
>  		return io_remap_pfn_range_prepare(desc);
>  	case MMAP_SIMPLE_IO_REMAP:
>  		return simple_ioremap_prepare(desc);
> +	case MMAP_MAP_KERNEL_PAGES:
> +		return map_kernel_pages_prepare(desc);
>  	}
>  
>  	WARN_ON_ONCE(1);
> @@ -1476,6 +1478,9 @@ int mmap_action_complete(struct vm_area_struct *vma,
>  	case MMAP_REMAP_PFN:
>  		err = remap_pfn_range_complete(vma, action);
>  		break;
> +	case MMAP_MAP_KERNEL_PAGES:
> +		err = map_kernel_pages_complete(vma, action);
> +		break;
>  	case MMAP_IO_REMAP_PFN:
>  	case MMAP_SIMPLE_IO_REMAP:
>  		/* Should have been delegated. */
> @@ -1497,6 +1502,7 @@ int mmap_action_prepare(struct vm_area_desc *desc)
>  	case MMAP_REMAP_PFN:
>  	case MMAP_IO_REMAP_PFN:
>  	case MMAP_SIMPLE_IO_REMAP:
> +	case MMAP_MAP_KERNEL_PAGES:
>  		WARN_ON_ONCE(1); /* nommu cannot handle these. */
>  		break;
>  	}

Not sure if it has been reported/addressed yet but it looks like
mmap_action_complete() was missed here, as pointed out by clang:

  $ make -skj"$(nproc)" ARCH=arm LLVM=1 mrproper allnoconfig mm/util.o
  mm/util.c:1520:10: warning: enumeration value 'MMAP_MAP_KERNEL_PAGES' not handled in switch [-Wswitch]
   1520 |         switch (action->type) {
        |                 ^~~~~~~~~~~~

I assume

diff --git a/mm/util.c b/mm/util.c
index 682d0d24e1c6..c41c119a5a74 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -1523,6 +1523,7 @@ int mmap_action_complete(struct vm_area_struct *vma,
 	case MMAP_REMAP_PFN:
 	case MMAP_IO_REMAP_PFN:
 	case MMAP_SIMPLE_IO_REMAP:
+	case MMAP_MAP_KERNEL_PAGES:
 		WARN_ON_ONCE(1); /* nommu cannot handle this. */
 
 		err = -EINVAL;
--

should be the fix?

Cheers,
Nathan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
