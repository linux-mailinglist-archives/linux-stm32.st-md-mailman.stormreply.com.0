Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBSKNygEwWlUPgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 10:13:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C872EECA2
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 10:13:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2674BC87EC5;
	Mon, 23 Mar 2026 09:13:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F074C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 09:13:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E411D600C4;
 Mon, 23 Mar 2026 09:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06702C4CEF7;
 Mon, 23 Mar 2026 09:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774257188;
 bh=wzMrqKx3Jtzn/TAs56FycVP5WjxG7mSofPlph6puuTE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=joSxwlspVhKYcgE4zizMzEupkVxH7zBoRt16ItgpGqtktF8hLPrEEOTxfgh4aRR46
 H0U9alpLsA83SdovjY4NjT0S8IVfoGCFHfdV08wBojK7QatPitGsHroy+nurmzIUo5
 9LTrYrheRCty7XcM5Hdcd35jJVYk4YzX2FwqnAgbFVPaee1S/zk0OOYbb6dWKe54SV
 Qejn61X7CFhOqRsAbeUsXpGiEPrzUHGPx8hpLYNbDN7Ghgx9DVL33kddcsAYc4j5Sz
 AmCzqaip3eo7Xnd8PbIQkYXGzXvvJm8fegMwy8XoqhfyH8Ytxfa3hUrWvBicIE9Bu0
 C1NjdvWhW+Gjw==
Date: Mon, 23 Mar 2026 09:13:06 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Michael Kelley <mhklinux@outlook.com>
Message-ID: <409ff1b0-43ff-4b1d-ad07-7624e0817640@lucifer.local>
References: <cover.1774045440.git.ljs@kernel.org>
 <05467cb62267d750e5c770147517d4df0246cda6.1774045440.git.ljs@kernel.org>
 <SN6PR02MB41573DF211DA2469D7FFE892D44BA@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN6PR02MB41573DF211DA2469D7FFE892D44BA@SN6PR02MB4157.namprd02.prod.outlook.com>
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Clemens Ladisch <clemens@ladisch.de>, David Howells <dhowells@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Marc Dionne <marc.dionne@auristor.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Wei Liu <wei.liu@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Long Li <longli@microsoft.com>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 Pedro Falcato <pfalcato@suse.de>, Ryan Roberts <ryan.roberts@arm.com>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Bodo Stroesser <bostroesser@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 18/21] drivers: hv: vmbus: replace
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mhklinux@outlook.com,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:vbabka@kernel.org,m:linux-scsi@vger.kernel.org,m:corbet@lwn.net,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:arnd@arndb.de,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:surenb@google.com,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:m
 coquelin.stm32@gmail.com,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[44];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,lwn.net,nod.at,lists.linux.dev,suse.de,arm.com,arndb.de,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com,linux-foundation.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,stormreply.com:email,stormreply.com:url,lucifer.local:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 76C872EECA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 04:16:20AM +0000, Michael Kelley wrote:
> From: Lorenzo Stoakes (Oracle) <ljs@kernel.org> Sent: Friday, March 20, 2026 3:40 PM
> >
> > The f_op->mmap interface is deprecated, so update the vmbus driver to use
> > its successor, mmap_prepare.
> >
> > This updates all callbacks which referenced the function pointer
> > hv_mmap_ring_buffer to instead reference hv_mmap_prepare_ring_buffer,
> > utilising the newly introduced compat_set_desc_from_vma() and
> > __compat_vma_mmap() to be able to implement this change.
> >
> > The UIO HV generic driver is the only user of hv_create_ring_sysfs(),
> > which is the only function which references
> > vmbus_channel->mmap_prepare_ring_buffer which, in turn, is the only
> > external interface to hv_mmap_prepare_ring_buffer.
> >
> > This patch therefore updates this caller to use mmap_prepare instead,
> > which also previously used vm_iomap_memory(), so this change replaces it
> > with its mmap_prepare equivalent, mmap_action_simple_ioremap().
> >
> > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> > ---
> >  drivers/hv/hyperv_vmbus.h    |  4 ++--
> >  drivers/hv/vmbus_drv.c       | 31 +++++++++++++++++++------------
> >  drivers/uio/uio_hv_generic.c | 11 ++++++-----
> >  include/linux/hyperv.h       |  4 ++--
> >  4 files changed, 29 insertions(+), 21 deletions(-)
> >
>
> There are two mmap() code paths in the Hyper-V UIO code. One path is
> to mmap() the file descriptor for /dev/uio<n>, and the other is to mmap()
> the "ring" entry under /sys/devices/vmbus/devices/<uuid>. The former is
> done by uio_mmap(), and the latter by hv_uio_ring_mmap_prepare().
>
> I tested both these paths using a combination of two methods in a
> x86/x64 VM on Hyper-V:
>
> 1) Using the fcopy daemon, which maps the ring buffer for the primary
> channel and sends/receives messages with the Hyper-V host. This
> method tests only the 1st path because the fcopy daemon doesn't create
> any subchannels that would use the "ring" entry.
>
> 2) Using a custom-built test program. This program doesn't communicate
> with the Hyper-V host, but allows mostly verifying both code paths for the
> primary channel. As a sanity check, it verifies that the two mmaps are
> mapping the same memory, as expected.
>
> As such,
>
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>

Perfect, thanks so much for this!

It is tricky for me to test these, beyond fairly exhaustive logical
confirmation of equivalence, so this is _hugely_ helpful.

>
> The most robust test would be to run DPDK networking against
> UIO, as it would communicate with the Hyper-V host and use
> multiple subchannels that resulting in mmap'ing the "ring"
> entry under /sys.
>
> @Long Li -- I'll leave it to your discretion as to whether you want
> to test DPDK against these mmap() changes.

Thanks in advance for taking a look on this also!

>
> I've noted one minor issue below.
>
> [snip]
>
> --- a/include/linux/hyperv.h
> +++ b/include/linux/hyperv.h
> @@ -1015,8 +1015,8 @@ struct vmbus_channel {
>  	/* The max size of a packet on this channel */
>  	u32 max_pkt_size;
>
> -	/* function to mmap ring buffer memory to the channel's sysfs ring attribute */
> -	int (*mmap_ring_buffer)(struct vmbus_channel *channel, struct vm_area_struct *vma);
> +	/* function to mmap_prepare ring buffer memory to the channel's sysfs ring attribute */
>
> Changing the comment from "mmap ring buffer" to "mmap_prepare ring buffer"
> produces awkward wording since "mmap" is used here as a verb.  It might be better
> to just leave the comment unchanged.

Sure am happy with that of course, I think Sashiko moaned about this but
it's obviously fine either way.

Andrew - do you mind restoring the comment to its original form above? Thanks!

>
> Michael
>
>
> +	int (*mmap_prepare_ring_buffer)(struct vmbus_channel *channel, struct vm_area_desc *desc);
>
>  	/* boolean to control visibility of sysfs for ring buffer */
>  	bool ring_sysfs_visible;

Cheers, Lorenzo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
