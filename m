Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0B21FA6FA
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2020 05:30:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33AEFC36B11;
	Tue, 16 Jun 2020 03:30:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8714C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 03:30:39 +0000 (UTC)
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B3B8206D7;
 Tue, 16 Jun 2020 03:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592278237;
 bh=cbCBV+GA89Kxk07F75+TVwUbSIVVlsmXitOPPgujt0g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CI14aWxQPw24ENjaHXJfOipbxs59iBOy6w+TeEVniGvJYBqy6D1cwSzDbSE5kI4lU
 lIYg5jNgJLjG7j91Xm1X3e+BxtmR8FfP4CJnhYPkHwCMU6wjZ6YBjNC+nYJMCpp2N5
 Vlpy20o3OcJdDug0iUS5K1iWjVtuIX+008M01eB4=
Date: Mon, 15 Jun 2020 20:30:35 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Waiman Long <longman@redhat.com>
Message-ID: <20200616033035.GB902@sol.localdomain>
References: <20200616015718.7812-1-longman@redhat.com>
 <20200616015718.7812-2-longman@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616015718.7812-2-longman@redhat.com>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 linux-btrfs@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 David Sterba <dsterba@suse.cz>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-stm32@st-md-mailman.stormreply.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-scsi@vger.kernel.org, James Morris <jmorris@namei.org>,
 Matthew Wilcox <willy@infradead.org>, linux-wpan@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-nfs@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, target-devel@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 1/3] mm/slab: Use memzero_explicit() in
	kzfree()
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

On Mon, Jun 15, 2020 at 09:57:16PM -0400, Waiman Long wrote:
> The kzfree() function is normally used to clear some sensitive
> information, like encryption keys, in the buffer before freeing it back
> to the pool. Memset() is currently used for the buffer clearing. However,
> it is entirely possible that the compiler may choose to optimize away the
> memory clearing especially if LTO is being used. To make sure that this
> optimization will not happen, memzero_explicit(), which is introduced
> in v3.18, is now used in kzfree() to do the clearing.
> 
> Fixes: 3ef0e5ba4673 ("slab: introduce kzfree()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  mm/slab_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index 9e72ba224175..37d48a56431d 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -1726,7 +1726,7 @@ void kzfree(const void *p)
>  	if (unlikely(ZERO_OR_NULL_PTR(mem)))
>  		return;
>  	ks = ksize(mem);
> -	memset(mem, 0, ks);
> +	memzero_explicit(mem, ks);
>  	kfree(mem);
>  }
>  EXPORT_SYMBOL(kzfree);

This is a good change, but the commit message isn't really accurate.  AFAIK, no
one has found any case where this memset() gets optimized out.  And even with
LTO, it would be virtually impossible due to all the synchronization and global
data structures that kfree() uses.  (Remember that this isn't the C standard
function "free()", so the compiler can't assign it any special meaning.)
Not to mention that LTO support isn't actually upstream yet.

I still agree with the change, but it might be helpful if the commit message
were honest that this is really a hardening measure and about properly conveying
the intent.  As-is this sounds like a critical fix, which might confuse people.

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
