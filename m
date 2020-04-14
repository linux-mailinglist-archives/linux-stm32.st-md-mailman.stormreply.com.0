Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE101A764A
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2020 10:39:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A74B5C36B0C;
	Tue, 14 Apr 2020 08:39:26 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B5E2C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 08:32:08 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d220a78;
 Tue, 14 Apr 2020 08:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=subject:to:cc
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=mail; bh=Bn42dUX94nPZ
 VI2aresTt2verm4=; b=sx6IKJIxzuEOA3MDWmGK5eH/64R8mpMYlG8WURWdfzRD
 XFeah0rjLnpfJ/wNxDNPuLqvGkOXg2tTc6/J9yxFJV/B/IyVASTm/xV1AWFh8sOT
 E+Zkl2VUcl4Y0wf6Mu5iapMmn3g8Ztyi36JLXdlWN66PEuOJynjCGScQFzOu0tep
 4+h/FZal3et8UceGQF9vqtL2mbwwUOtzAFh6NniwZkygh5iiMorXd4zwhnYD2AoL
 UBjxDBvR+PqwgLJDDNN43HRxAe1Ka1ICHvrV5FNQIfjCNS9xZTJzxiJXAqnsHyrN
 w3BT8jw4OmracAotC1L9+6WCZMUQn8YWdWOjpIB/Jw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e4f42b92
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 14 Apr 2020 08:22:18 +0000 (UTC)
To: Waiman Long <longman@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Joe Perches
 <joe@perches.com>, Matthew Wilcox <willy@infradead.org>,
 David Rientjes <rientjes@google.com>
References: <20200413211550.8307-1-longman@redhat.com>
 <20200413211550.8307-2-longman@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <4babf834-c531-50ba-53f6-e88410b15ce3@zx2c4.com>
Date: Tue, 14 Apr 2020 02:32:03 -0600
MIME-Version: 1.0
In-Reply-To: <20200413211550.8307-2-longman@redhat.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 14 Apr 2020 08:39:25 +0000
Cc: samba-technical@lists.samba.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 kasan-dev@googlegroups.com, cocci@systeme.lip6.fr, linux-wpan@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-crypto@vger.kernel.org,
 linux-pm@vger.kernel.org, ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/2] mm,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 4/13/20 3:15 PM, Waiman Long wrote:
> As said by Linus:
> 
>    A symmetric naming is only helpful if it implies symmetries in use.
>    Otherwise it's actively misleading.
> 
>    In "kzalloc()", the z is meaningful and an important part of what the
>    caller wants.
> 
>    In "kzfree()", the z is actively detrimental, because maybe in the
>    future we really _might_ want to use that "memfill(0xdeadbeef)" or
>    something. The "zero" part of the interface isn't even _relevant_.
> 
> The main reason that kzfree() exists is to clear sensitive information
> that should not be leaked to other future users of the same memory
> objects.
> 
> Rename kzfree() to kfree_sensitive() to follow the example of the
> recently added kvfree_sensitive() and make the intention of the API
> more explicit. 

Seems reasonable to me. One bikeshed, that you can safely discard and 
ignore as a mere bikeshed: kfree_memzero or kfree_scrub or 
kfree_{someverb} seems like a better function name, as it describes what 
the function does, rather than "_sensitive" that suggests something 
about the data maybe but who knows what that entails. If you disagree, 
not a big deal either way.

 > In addition, memzero_explicit() is used to clear the
 > memory to make sure that it won't get optimized away by the compiler.

This had occurred to me momentarily a number of years ago, but I was 
under the impression that the kernel presumes extern function calls to 
always imply a compiler barrier, making it difficult for the compiler to 
reason about what happens in/after kfree, in order to be able to 
optimize out the preceding memset. With LTO, that rule obviously 
changes. I guess new code should be written with cross-object 
optimizations in mind now a days? [Meanwhile, it would be sort of 
interesting to teach gcc about kfree to enable additional scary 
optimizations...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
