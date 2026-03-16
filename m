Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEfyJbcZuGn/YwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 15:54:47 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 397FD29BCA5
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 15:54:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7D8DC87ED8;
	Mon, 16 Mar 2026 14:54:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3708BC3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 14:54:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DD8B860018;
 Mon, 16 Mar 2026 14:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6787C19421;
 Mon, 16 Mar 2026 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773672884;
 bh=151f3cWiR6axiSpyETGy2809glU/p+Thfrb+WhG7his=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IiVlA9K5MR2pm/vVWcjl3jHa1ZLppG/xkVDg4LYhSHBo7tILA3oKU7/VyDtSsg2Kg
 kQqyeUnfpOlDxu6AfhX2DKeTc56qG3sgVr8cRvArcJDPpB7MtB8+8m/W1CGm4DXnWU
 /IAV35ajExH6TG7ujNjLHJy8C1NUnuOmNHMTs/CZoSJyL1gIEFWKuYKmUapF57E+52
 QtJhwAwyYFC0d6NKgO01Zvw7BDFPVjqf+FrFODQ4Cqwr/bAXtOkwM5wsRJqmso1ekz
 dUhxuwzJMFbfz9arxSyuA8RSwOjRWaOSv5ZVSyJ0pPvwE3EtZ56ZowEAdLjTcvuW1x
 yQ/B9jgOXn+mA==
Date: Mon, 16 Mar 2026 14:54:33 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b9474609-4c7e-4cbe-8e6c-d55baa689430@lucifer.local>
References: <cover.1773346620.git.ljs@kernel.org>
 <21d8899bb1f4db61203072fb3a56a6c98a61e23d.1773346620.git.ljs@kernel.org>
 <4fd15134-ae1e-4233-8d5a-9d1e0b9f94dc@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4fd15134-ae1e-4233-8d5a-9d1e0b9f94dc@infradead.org>
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
Subject: Re: [Linux-stm32] [PATCH 15/15] mm: add
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
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:vbabka@kernel.org,m:linux-scsi@vger.kernel.org,m:corbet@lwn.net,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:arnd@arndb.de,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:surenb@google.com,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:
 mcoquelin.stm32@gmail.com,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,lwn.net,nod.at,lists.linux.dev,suse.de,arm.com,arndb.de,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com,linux-foundation.org];
	NEURAL_SPAM(0.00)[0.021];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,lucifer.local:mid]
X-Rspamd-Queue-Id: 397FD29BCA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 04:15:26PM -0700, Randy Dunlap wrote:
>
> On 3/12/26 1:27 PM, Lorenzo Stoakes (Oracle) wrote:
>
> > Finally, we update the VMA tests accordingly to reflect the changes.
>
> IMO we could omit the word "we" 5 times above.
> (but no change is required)
>
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 88f42faeb377..88ad5649c02d 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
>
> > +/**
> > + * range_is_subset - Is the specified inner range a subset of the outer range?
> > + * @outer_start: The start of the outer range.
> > + * @outer_end: The exclusive end of the outer range.
> > + * @inner_start: The start of the inner range.
> > + * @inner_end: The exclusive end of the inner range.
> > + *
> > + * Returns %true if [inner_start, inner_end) is a subset of [outer_start,
>
>     * Returns:
> (for kernel-doc)

Ack

>
> > + * outer_end), otherwise %false.
> > + */
> > +static inline bool range_is_subset(unsigned long outer_start,
> > +				   unsigned long outer_end,
> > +				   unsigned long inner_start,
> > +				   unsigned long inner_end)
> > +{
> > +	return outer_start <= inner_start && inner_end <= outer_end;
> > +}
> > +
> > +/**
> > + * range_in_vma - is the specified [@start, @end) range a subset of the VMA?
> > + * @vma: The VMA against which we want to check [@start, @end).
> > + * @start: The start of the range we wish to check.
> > + * @end: The exclusive end of the range we wish to check.
> > + *
> > + * Returns %true if [@start, @end) is a subset of [@vma->vm_start,
>
>     * Returns:

Ack

>
> > + * @vma->vm_end), %false otherwise.
> > + */
> >  static inline bool range_in_vma(const struct vm_area_struct *vma,
> >  				unsigned long start, unsigned long end)
> >  {
> > -	return (vma && vma->vm_start <= start && end <= vma->vm_end);
> > +	if (!vma)
> > +		return false;
> > +
> > +	return range_is_subset(vma->vm_start, vma->vm_end, start, end);
> > +}
> > +
> > +/**
> > + * range_in_vma_desc - is the specified [@start, @end) range a subset of the VMA
> > + * described by @desc, a VMA descriptor?
> > + * @desc: The VMA descriptor against which we want to check [@start, @end).
> > + * @start: The start of the range we wish to check.
> > + * @end: The exclusive end of the range we wish to check.
> > + *
> > + * Returns %true if [@start, @end) is a subset of [@desc->start, @desc->end),
>
>     * Returns:

Ack, I think in general I've seen (or believe I've seen :) other cases without
the colon, so was kinda imitating, but I may also be imagining that ;)

>
> > + * %false otherwise.
> > + */
> > +static inline bool range_in_vma_desc(const struct vm_area_desc *desc,
> > +				     unsigned long start, unsigned long end)
> > +{
> > +	if (!desc)
> > +		return false;
> > +
> > +	return range_is_subset(desc->start, desc->end, start, end);
> >  }
>
> --
> ~Randy
>

Will also fold these changes into the respin!

Cheers, Lorenzo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
