Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9DB1FA5DA
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2020 03:58:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7895C36B11;
	Tue, 16 Jun 2020 01:58:11 +0000 (UTC)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B78E7C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 01:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592272689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=w0ZJeQQk3EMaWCq5vRe2fLP4T7LhSgQGKZa9FTUZAA4=;
 b=cmfbCyUDRGwKjLGBejxtzwXYJZpxYp4m4gTqt1HJSocbaTeByL2ZSn3rJ/ux/7hS8NPcJY
 pDmzv+GqMhAOF/UyMu9ENB1TqV6U+tP0Mht2YLdiU0vgD5MEO3kgZFDGI5G30nsnTYzl6e
 3vAL0jFWUiwI5s0OQXwAYyvRhcKeSIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-siDUOdYEMkuGDz0Coifxdg-1; Mon, 15 Jun 2020 21:58:05 -0400
X-MC-Unique: siDUOdYEMkuGDz0Coifxdg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6856710059B7;
 Tue, 16 Jun 2020 01:58:00 +0000 (UTC)
Received: from llong.com (ovpn-117-41.rdu2.redhat.com [10.10.117.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45E126ED96;
 Tue, 16 Jun 2020 01:57:52 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Joe Perches <joe@perches.com>, Matthew Wilcox <willy@infradead.org>,
 David Rientjes <rientjes@google.com>
Date: Mon, 15 Jun 2020 21:57:16 -0400
Message-Id: <20200616015718.7812-2-longman@redhat.com>
In-Reply-To: <20200616015718.7812-1-longman@redhat.com>
References: <20200616015718.7812-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-wpan@vger.kernel.org,
 Waiman Long <longman@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 linux-pm@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, David Sterba <dsterba@suse.cz>,
 stable@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com,
 linux-ppp@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 1/3] mm/slab: Use memzero_explicit() in
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The kzfree() function is normally used to clear some sensitive
information, like encryption keys, in the buffer before freeing it back
to the pool. Memset() is currently used for the buffer clearing. However,
it is entirely possible that the compiler may choose to optimize away the
memory clearing especially if LTO is being used. To make sure that this
optimization will not happen, memzero_explicit(), which is introduced
in v3.18, is now used in kzfree() to do the clearing.

Fixes: 3ef0e5ba4673 ("slab: introduce kzfree()")
Cc: stable@vger.kernel.org
Signed-off-by: Waiman Long <longman@redhat.com>
---
 mm/slab_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index 9e72ba224175..37d48a56431d 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1726,7 +1726,7 @@ void kzfree(const void *p)
 	if (unlikely(ZERO_OR_NULL_PTR(mem)))
 		return;
 	ks = ksize(mem);
-	memset(mem, 0, ks);
+	memzero_explicit(mem, ks);
 	kfree(mem);
 }
 EXPORT_SYMBOL(kzfree);
-- 
2.18.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
