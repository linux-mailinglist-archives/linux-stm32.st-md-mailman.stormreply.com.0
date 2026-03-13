Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APUlNVL8s2nWeQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 13:00:18 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E96282943
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 13:00:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A959C8F29C;
	Fri, 13 Mar 2026 12:00:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CDC0C87ED6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 12:00:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1FEC14405C;
 Fri, 13 Mar 2026 12:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC72C19421;
 Fri, 13 Mar 2026 12:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773403215;
 bh=oJXek/425Du8hdak6ZAKOrvHZlv0IlGG9djsmRtUsQI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AfKnv5A1okg9eNUiDxAyQy2xL/uhZe8tJX6hGHDskVrVUSvtmRufjkpjd+43UzOoT
 j+/00iEd+AcyU75UVscGSS97YkUSD3Xj7ph8IVySNVl0YuO0W0k6uG2Gm4Ig3K3L9G
 GxvPH9Z+HCSmaRFDcS/l0JZpB+sCZ4V3tnWxMZ9AkjTNkVBhEe3p5SvVjG3qcpMRfm
 lj3LNsVtqxvYmqV38UIqIAegY9wtrOU6PtJCJEn1jXPI8FdDrMhoQN2V9ApulNo8Hv
 BjUfQu7SLOUWuC9ypjjkfA3Vzk6PSSxyeIkwbc1RRGgwaSCvM4p930Dh4y7vVgEcK7
 EjEmbpAxgrV0A==
Date: Fri, 13 Mar 2026 12:00:03 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Usama Arif <usama.arif@linux.dev>
Message-ID: <c62305d7-22c4-4cf7-969b-fbe214c93b64@lucifer.local>
References: <4a5fa45119220b9d99ed72a36308aed01a30d2c1.1773346620.git.ljs@kernel.org>
 <20260313110745.2573005-1-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260313110745.2573005-1-usama.arif@linux.dev>
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
 Richard Weinberger <richard@nod.at>, Long Li <longli@microsoft.com>,
 linux-staging@lists.linux.dev, Dexuan Cui <decui@microsoft.com>,
 linux-afs@lists.infradead.org, Pedro Falcato <pfalcato@suse.de>,
 Ryan Roberts <ryan.roberts@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org,
 Christian Brauner <brauner@kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Bodo Stroesser <bostroesser@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 05/15] fs: afs: correctly drop reference
 count on mapping failure
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[43];
	FORGED_RECIPIENTS(0.00)[m:usama.arif@linux.dev,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:vbabka@kernel.org,m:linux-scsi@vger.kernel.org,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:arnd@arndb.de,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:surenb@google.com,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gm
 ail.com,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,nod.at,lists.linux.dev,suse.de,arm.com,arndb.de,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com,linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,lucifer.local:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 75E96282943
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 04:07:43AM -0700, Usama Arif wrote:
> On Thu, 12 Mar 2026 20:27:20 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:
>
> > Commit 9d5403b1036c ("fs: convert most other generic_file_*mmap() users to
> > .mmap_prepare()") updated AFS to use the mmap_prepare callback in favour of
> > the deprecated mmap callback.
> >
> > However, it did not account for the fact that mmap_prepare can fail to map
> > due to an out of memory error, and thus should not be incrementing a
> > reference count on mmap_prepare.
> >
> > With the newly added vm_ops->mapped callback available, we can simply defer
> > this operation to that callback which is only invoked once the mapping is
> > successfully in place (but not yet visible to userspace as the mmap and VMA
> > write locks are held).
> >
> > Therefore add afs_mapped() to implement this callback for AFS.
> >
> > In practice the mapping allocations are 'too small to fail' so this is
> > something that realistically should never happen in practice (or would do
> > so in a case where the process is about to die anyway), but we should still
> > handle this.
> >
> > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> > ---
> >  fs/afs/file.c | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/afs/file.c b/fs/afs/file.c
> > index f609366fd2ac..69ef86f5e274 100644
> > --- a/fs/afs/file.c
> > +++ b/fs/afs/file.c
> > @@ -28,6 +28,8 @@ static ssize_t afs_file_splice_read(struct file *in, loff_t *ppos,
> >  static void afs_vm_open(struct vm_area_struct *area);
> >  static void afs_vm_close(struct vm_area_struct *area);
> >  static vm_fault_t afs_vm_map_pages(struct vm_fault *vmf, pgoff_t start_pgoff, pgoff_t end_pgoff);
> > +static int afs_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
> > +		      const struct file *file, void **vm_private_data);
> >
> >  const struct file_operations afs_file_operations = {
> >  	.open		= afs_open,
> > @@ -61,6 +63,7 @@ const struct address_space_operations afs_file_aops = {
> >  };
> >
> >  static const struct vm_operations_struct afs_vm_ops = {
> > +	.mapped		= afs_mapped,
> >  	.open		= afs_vm_open,
> >  	.close		= afs_vm_close,
> >  	.fault		= filemap_fault,
> > @@ -500,13 +503,22 @@ static int afs_file_mmap_prepare(struct vm_area_desc *desc)
> >  	afs_add_open_mmap(vnode);
>
> Is the above afs_add_open_mmap an additional one, which could cause a reference
> leak? Does the above one need to be removed and only the one in afs_mapped()
> needs to be kept?

Ah yeah good spot, will fix thanks!

>
> >
> >  	ret = generic_file_mmap_prepare(desc);
> > -	if (ret == 0)
> > -		desc->vm_ops = &afs_vm_ops;
> > -	else
> > -		afs_drop_open_mmap(vnode);
> > +	if (ret)
> > +		return ret;
> > +
> > +	desc->vm_ops = &afs_vm_ops;
> >  	return ret;
> >  }
> >
> > +static int afs_mapped(unsigned long start, unsigned long end, pgoff_t pgoff,
> > +		      const struct file *file, void **vm_private_data)
> > +{
> > +	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
> > +
> > +	afs_add_open_mmap(vnode);
> > +	return 0;
> > +}
> > +
> >  static void afs_vm_open(struct vm_area_struct *vma)
> >  {
> >  	afs_add_open_mmap(AFS_FS_I(file_inode(vma->vm_file)));
> > --
> > 2.53.0
> >
> >

Cheers, Lorenzo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
