Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7D54FCE5A
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Apr 2022 06:58:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 757DCC628B3;
	Tue, 12 Apr 2022 04:58:02 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBB46C628AA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Apr 2022 04:58:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4103168AA6; Tue, 12 Apr 2022 06:57:58 +0200 (CEST)
Date: Tue, 12 Apr 2022 06:57:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hugh Dickins <hughd@google.com>
Message-ID: <20220412045757.GA5131@lst.de>
References: <9a978571-8648-e830-5735-1f4748ce2e30@google.com>
 <20220409050638.GB17755@lst.de>
 <f73cfd56-35d2-53a3-3a59-4ff9495d7d34@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f73cfd56-35d2-53a3-3a59-4ff9495d7d34@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-nfs@vger.kernel.org,
 linux-mm@kvack.org, Chuck Lever III <chuck.lever@oracle.com>,
 Mikulas Patocka <mpatocka@redhat.com>, viro@zeniv.linux.org.uk,
 Mark Hemment <markhemm@googlemail.com>, Borislav Petkov <bp@alien8.de>,
 Lukas Czerner <lczerner@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] making x86 clear_user not suck,
 was Re: [PATCH] tmpfs: fix regressions from wider use of ZERO_PAGE
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

On Fri, Apr 08, 2022 at 11:08:29PM -0700, Hugh Dickins wrote:
> > 
> > Either way I'd rather do this optimization in iov_iter_zero rather
> > than hiding it in tmpfs.
> 
> Let's see what others say.  I think we would all prefer clear_user() to be
> enhanced, and hack around it neither here in tmpfs nor in iov_iter_zero().
> But that careful work won't get done by magic, nor by me.

I agree with that.

> And iov_iter_zero() has to deal with a wider range of possibilities,
> when pulling in cache lines of ZERO_PAGE(0) will be less advantageous,
> than in tmpfs doing a large dd - the case I'm aiming not to regress here
> (tmpfs has been copying ZERO_PAGE(0) like this for years).

Maybe.  OTOH I'd hate to have iov_iter_zero not used much because it
sucks too much.

So how can we entice someone with the right knowledge to implement a
decent clear_user for x86?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
