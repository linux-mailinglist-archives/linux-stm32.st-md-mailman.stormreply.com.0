Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7121FBE1B
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2020 20:36:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64F9DC36B0D;
	Tue, 16 Jun 2020 18:36:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7A47C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 18:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592332591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/6v2jfN6UIDhJeosnSs1R4UAP7mOiLuFVPEnJvGTnM=;
 b=VsbTXqwl7xxf+MUWbnJM4vCOVIS/iCxA1SAjzyA8FsjzrodShKHnZfMLXBOQL/GHNJH8vC
 OuxP6I6blTXluNjdUqYdGiIeMKVM7wFH4inGVQHpTaw8gw2uwB0FCvyIBJbPEBsvhu17TV
 Bbxsdyz8zlcvC51jFF/xVTwdyLhzHT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-AXrSOJCONRyyvrghDqFtvA-1; Tue, 16 Jun 2020 14:36:27 -0400
X-MC-Unique: AXrSOJCONRyyvrghDqFtvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2578680332A;
 Tue, 16 Jun 2020 18:36:22 +0000 (UTC)
Received: from llong.remote.csb (ovpn-114-156.rdu2.redhat.com [10.10.114.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B77519C71;
 Tue, 16 Jun 2020 18:36:16 +0000 (UTC)
To: Andrew Morton <akpm@linux-foundation.org>
References: <20200616154311.12314-1-longman@redhat.com>
 <20200616154311.12314-3-longman@redhat.com>
 <20200616110944.c13f221e5c3f54e775190afe@linux-foundation.org>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <65002c1e-5e31-1f4e-283c-186e06e55ef0@redhat.com>
Date: Tue, 16 Jun 2020 14:36:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200616110944.c13f221e5c3f54e775190afe@linux-foundation.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-stm32@st-md-mailman.stormreply.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-scsi@vger.kernel.org, James Morris <jmorris@namei.org>,
 Matthew Wilcox <willy@infradead.org>, linux-wpan@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-nfs@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Joe Perches <joe@perches.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 2/2] mm,
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

On 6/16/20 2:09 PM, Andrew Morton wrote:
> On Tue, 16 Jun 2020 11:43:11 -0400 Waiman Long <longman@redhat.com> wrote:
>
>> As said by Linus:
>>
>>    A symmetric naming is only helpful if it implies symmetries in use.
>>    Otherwise it's actively misleading.
>>
>>    In "kzalloc()", the z is meaningful and an important part of what the
>>    caller wants.
>>
>>    In "kzfree()", the z is actively detrimental, because maybe in the
>>    future we really _might_ want to use that "memfill(0xdeadbeef)" or
>>    something. The "zero" part of the interface isn't even _relevant_.
>>
>> The main reason that kzfree() exists is to clear sensitive information
>> that should not be leaked to other future users of the same memory
>> objects.
>>
>> Rename kzfree() to kfree_sensitive() to follow the example of the
>> recently added kvfree_sensitive() and make the intention of the API
>> more explicit. In addition, memzero_explicit() is used to clear the
>> memory to make sure that it won't get optimized away by the compiler.
>>
>> The renaming is done by using the command sequence:
>>
>>    git grep -w --name-only kzfree |\
>>    xargs sed -i 's/\bkzfree\b/kfree_sensitive/'
>>
>> followed by some editing of the kfree_sensitive() kerneldoc and adding
>> a kzfree backward compatibility macro in slab.h.
>>
>> ...
>>
>> --- a/include/linux/slab.h
>> +++ b/include/linux/slab.h
>> @@ -186,10 +186,12 @@ void memcg_deactivate_kmem_caches(struct mem_cgroup *, struct mem_cgroup *);
>>    */
>>   void * __must_check krealloc(const void *, size_t, gfp_t);
>>   void kfree(const void *);
>> -void kzfree(const void *);
>> +void kfree_sensitive(const void *);
>>   size_t __ksize(const void *);
>>   size_t ksize(const void *);
>>   
>> +#define kzfree(x)	kfree_sensitive(x)	/* For backward compatibility */
>> +
> What was the thinking here?  Is this really necessary?
>
> I suppose we could keep this around for a while to ease migration.  But
> not for too long, please.
>
It should be there just for 1 release cycle. I have broken out the btrfs 
patch to the btrfs list and I didn't make the kzfree to kfree_sensitive 
conversion there as that patch was in front in my patch list. So 
depending on which one lands first, there can be a window where the 
compilation may fail without this workaround. I am going to send out 
another patch in the next release cycle to remove it.

Cheers,
Longman

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
