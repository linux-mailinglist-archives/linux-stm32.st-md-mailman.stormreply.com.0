Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EDF4FFD71
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Apr 2022 20:06:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FB1AC6049B;
	Wed, 13 Apr 2022 18:06:40 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ADEEC60495
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Apr 2022 18:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RYArLPbSRQE8E13k3ycxmMoQnNRcq1Ic+NpsE4J+dOQ=; b=vMzaRyZmQeJIGHwv1m13Wm5unS
 s3ZTYmn9U4xKPzk44Q0g/u0dGqXES86OwZ1Ug1FlZ4Gg8SY/4PB8pK+ojDwrwQ+qfVTfcIdStZpCq
 dn32OxPcKjM/VvEY22ob50yqVN/B7Yow4fnHkU2iVyAgpCu1Fgh71ZP0IztEIy8ibfnA+6BL+YaKB
 8+UCXRFsHA1WTfOQRgoML1NAxOSqHgyOW8XqCLYRn+FtSosvkYfDg7Ji22uJvZt/yAJqLxEHNriiS
 YM1wYeGLasScQ4LaGKJ8/lstaGm1Jk1WfaXWuKJWpoPWU4bZl0nmuks4rHwfP57ywTk+ZF+jmaeJy
 78VBzJCg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nehNW-00ESOu-K7; Wed, 13 Apr 2022 18:06:06 +0000
Date: Wed, 13 Apr 2022 19:06:06 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YlcRDrEGwEz1EymZ@casper.infradead.org>
References: <9a978571-8648-e830-5735-1f4748ce2e30@google.com>
 <20220409050638.GB17755@lst.de>
 <f73cfd56-35d2-53a3-3a59-4ff9495d7d34@google.com>
 <20220412045757.GA5131@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220412045757.GA5131@lst.de>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Darrick J. Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, linux-nfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Chuck Lever III <chuck.lever@oracle.com>,
 Mikulas Patocka <mpatocka@redhat.com>, viro@zeniv.linux.org.uk,
 Mark Hemment <markhemm@googlemail.com>, Borislav Petkov <bp@alien8.de>,
 Lukas Czerner <lczerner@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Linux-stm32] making x86 clear_user not suck,
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

On Tue, Apr 12, 2022 at 06:57:57AM +0200, Christoph Hellwig wrote:
> On Fri, Apr 08, 2022 at 11:08:29PM -0700, Hugh Dickins wrote:
> > > 
> > > Either way I'd rather do this optimization in iov_iter_zero rather
> > > than hiding it in tmpfs.
> > 
> > Let's see what others say.  I think we would all prefer clear_user() to be
> > enhanced, and hack around it neither here in tmpfs nor in iov_iter_zero().
> > But that careful work won't get done by magic, nor by me.
> 
> I agree with that.
> 
> > And iov_iter_zero() has to deal with a wider range of possibilities,
> > when pulling in cache lines of ZERO_PAGE(0) will be less advantageous,
> > than in tmpfs doing a large dd - the case I'm aiming not to regress here
> > (tmpfs has been copying ZERO_PAGE(0) like this for years).
> 
> Maybe.  OTOH I'd hate to have iov_iter_zero not used much because it
> sucks too much.
> 
> So how can we entice someone with the right knowledge to implement a
> decent clear_user for x86?

Apparently that already happened, but it needs finishing up:
https://lore.kernel.org/lkml/Yk9yBcj78mpXOOLL@zx2c4.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
