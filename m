Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 854781FC0BD
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2020 23:15:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2795EC36B0D;
	Tue, 16 Jun 2020 21:15:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA5F1C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 21:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=leEz1fiyyYNCvStCVFZ11qKUfHMh+AfUoU9zFTvCrqA=; b=oHgSA/KCDX899omYMHX4U2OLjJ
 EwMhiIoHigLxQ+MmRFcXyHzBFlTQmZXr04WRoMkHZe+LheH9bL5uSbscQsM64m29mzWCbQbg2tT8+
 7YVv6xeVy1vViCaTYlOd/6wXfcX6a1cFVTgtaelhNr5Sx0Bq8ty7srr8SsI2tSkKUXRYqisvkGrfi
 sJiaQyRIt9mSxfwey610s9TuikWX8HXsiUmyGfH8ZS9oPdOb24GGhFyI8BfzM4UPPYgOLJ+VdR52j
 Y86D/VTQJXkQsTbKRbFAYueGk1mSp6BZ3PR31zhRZoTaAupph04Ady7RM7jEh9GkVMlChc2sCJczP
 HkwXD4Iw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jlIv1-00069R-Gz; Tue, 16 Jun 2020 21:14:55 +0000
Date: Tue, 16 Jun 2020 14:14:55 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Joe Perches <joe@perches.com>
Message-ID: <20200616211455.GB8681@bombadil.infradead.org>
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 linux-btrfs@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 David Sterba <dsterba@suse.cz>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, kasan-dev@googlegroups.com,
 linux-wpan@vger.kernel.org, David Rientjes <rientjes@google.com>,
 Waiman Long <longman@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-nfs@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 0/3] mm,
	treewide: Rename kzfree() to kfree_sensitive()
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

On Tue, Jun 16, 2020 at 11:53:50AM -0700, Joe Perches wrote:
> To this larger audience and last week without reply:
> https://lore.kernel.org/lkml/573b3fbd5927c643920e1364230c296b23e7584d.camel@perches.com/
> 
> Are there _any_ fastpath uses of kfree or vfree?

I worked on adding a 'free' a couple of years ago.  That was capable
of freeing percpu, vmalloc, kmalloc and alloc_pages memory.  I ran into
trouble when I tried to free kmem_cache_alloc memory -- it works for slab
and slub, but not slob (because slob needs the size from the kmem_cache).

My motivation for this was to change kfree_rcu() to just free_rcu().

> To eliminate these mispairings at a runtime cost of four
> comparisons, should the kfree/vfree/kvfree/kfree_const
> functions be consolidated into a single kfree?

I would say to leave kfree() alone and just introduce free() as a new
default.  There's some weird places in the kernel that have a 'free'
symbol of their own, but those should be renamed anyway.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
