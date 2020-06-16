Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D08271FBE7B
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2020 20:54:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C56DC36B0D;
	Tue, 16 Jun 2020 18:54:01 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0094.hostedemail.com
 [216.40.44.94])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60809C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 18:53:59 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 1290410050792;
 Tue, 16 Jun 2020 18:53:58 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:965:966:967:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2194:2196:2198:2199:2200:2201:2393:2525:2560:2563:2682:2685:2693:2740:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3743:3865:3866:3867:3868:3871:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4385:4390:4395:5007:6248:6691:6742:6743:7807:7808:7875:7903:9025:9108:10004:10400:10848:11026:11658:11914:12043:12048:12050:12295:12296:12297:12438:12555:12740:12760:12895:13069:13311:13357:13439:13845:14096:14097:14181:14659:14721:14777:21080:21433:21451:21627:21811:21990:30054:30070:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: cent55_291055a26e01
X-Filterd-Recvd-Size: 3364
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Tue, 16 Jun 2020 18:53:51 +0000 (UTC)
Message-ID: <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Waiman Long <longman@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>,  David Howells <dhowells@redhat.com>, Jarkko
 Sakkinen <jarkko.sakkinen@linux.intel.com>, James Morris
 <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>,
 David Rientjes <rientjes@google.com>
Date: Tue, 16 Jun 2020 11:53:50 -0700
In-Reply-To: <20200616015718.7812-1-longman@redhat.com>
References: <20200616015718.7812-1-longman@redhat.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-wpan@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 David Sterba <dsterba@suse.cz>, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com,
 linux-ppp@vger.kernel.org
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

On Mon, 2020-06-15 at 21:57 -0400, Waiman Long wrote:
>  v4:
>   - Break out the memzero_explicit() change as suggested by Dan Carpenter
>     so that it can be backported to stable.
>   - Drop the "crypto: Remove unnecessary memzero_explicit()" patch for
>     now as there can be a bit more discussion on what is best. It will be
>     introduced as a separate patch later on after this one is merged.

To this larger audience and last week without reply:
https://lore.kernel.org/lkml/573b3fbd5927c643920e1364230c296b23e7584d.camel@perches.com/

Are there _any_ fastpath uses of kfree or vfree?

Many patches have been posted recently to fix mispairings
of specific types of alloc and free functions.

To eliminate these mispairings at a runtime cost of four
comparisons, should the kfree/vfree/kvfree/kfree_const
functions be consolidated into a single kfree?

Something like the below:

   void kfree(const void *addr)
   {
   	if (is_kernel_rodata((unsigned long)addr))
   		return;

   	if (is_vmalloc_addr(addr))
   		_vfree(addr);
   	else
   		_kfree(addr);
   }

   #define kvfree		kfree
   #define vfree		kfree
   #define kfree_const	kfree


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
