Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4564FEA46
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Apr 2022 01:22:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E05C1C60495;
	Tue, 12 Apr 2022 23:22:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3326C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Apr 2022 23:22:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E58E6124E;
 Tue, 12 Apr 2022 23:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADCAC385A1;
 Tue, 12 Apr 2022 23:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1649805743;
 bh=LhsrzMk77NQcPYdzCX5hauu5G7NVYwkJ4kIRPOYv+jk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OUPqbvxsOygFrdjKnucWtXRA6pZ58t4BbVh6aJItY6VIkO0ECkmgTLNww9ch3/54L
 /cgUn+gNN3s6PE28IRe52XAJ1cKjhDDVt6/4sGzmDIbG5elo2++1OewvsV5XqSxRYr
 Wea5kCBi12XMe7idooeG7FBpQy+8iPUMmt4Xga7M=
Date: Tue, 12 Apr 2022 16:22:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hugh Dickins <hughd@google.com>
Message-Id: <20220412162221.7c55379548017bab61ea5103@linux-foundation.org>
In-Reply-To: <f73cfd56-35d2-53a3-3a59-4ff9495d7d34@google.com>
References: <9a978571-8648-e830-5735-1f4748ce2e30@google.com>
 <20220409050638.GB17755@lst.de>
 <f73cfd56-35d2-53a3-3a59-4ff9495d7d34@google.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-nfs@vger.kernel.org,
 linux-mm@kvack.org, Chuck Lever III <chuck.lever@oracle.com>,
 Mikulas Patocka <mpatocka@redhat.com>, viro@zeniv.linux.org.uk,
 Mark Hemment <markhemm@googlemail.com>, Borislav Petkov <bp@alien8.de>,
 Lukas Czerner <lczerner@redhat.com>, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] tmpfs: fix regressions from wider use of
	ZERO_PAGE
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

On Fri, 8 Apr 2022 23:08:29 -0700 (PDT) Hugh Dickins <hughd@google.com> wrote:

> > 
> > Either way I'd rather do this optimization in iov_iter_zero rather
> > than hiding it in tmpfs.
> 
> Let's see what others say.  I think we would all prefer clear_user() to be
> enhanced, and hack around it neither here in tmpfs nor in iov_iter_zero().
> But that careful work won't get done by magic, nor by me.
> 
> And iov_iter_zero() has to deal with a wider range of possibilities,
> when pulling in cache lines of ZERO_PAGE(0) will be less advantageous,
> than in tmpfs doing a large dd - the case I'm aiming not to regress here
> (tmpfs has been copying ZERO_PAGE(0) like this for years).

We do need something to get 5.18 fixed.  Christoph, do you think we
should proceed with this patch for 5.18?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
