Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AEDD207B7
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 18:16:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02BA3C8F275;
	Wed, 14 Jan 2026 17:16:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43968C8F26F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 16:38:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9A323408E4;
 Wed, 14 Jan 2026 16:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80489C4CEF7;
 Wed, 14 Jan 2026 16:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768408730;
 bh=3O46Pj7m8kkRm5o6FCiKeQjNffkaPKNOyTPfHDTuyTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rX3NXa+ZIaH3nFwhK4UUCK7Tl+BkdrM7lAWylErEBVX8n4+UiQ4G9G3ZhsgmdM3kk
 vN8PXFoQ+O9dscO4bKZ3M3QWmyyXJXre63JLVYqnzZ2NTakKl+OU0g0oj8iEefzjr3
 mgengyjgYNSq8vnqi/nIcJdbHx722ODGLyY8W8WF4jD1J44QYJo3q7W39OBPor2Wnp
 mtMB1YriAKD7oAMO5DENXpRw1aefTtMKh3nXtSKTmIbbZIhuLzX4/xt9jCGtUk6R4U
 0bsnyWbYeo3xcvSjczR5clmShq482fExnV7dzxGfD2Q4FGvs3AgYwtJ9KizIe5aoQq
 liWKl6bOegsTQ==
Date: Wed, 14 Jan 2026 16:38:39 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Message-ID: <aWfGj1eQhj2fAWB-@aspen.lan>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <aVuz_hpbrk8oSCVC@aspen.lan> <aVvF2hivCm0vIlfE@aspen.lan>
 <a5d83903fe2d2c2eb21de1527007913ff00847c5.camel@suse.com>
 <89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com>
X-Mailman-Approved-At: Wed, 14 Jan 2026 17:16:04 +0000
Cc: Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Breno Leitao <leitao@debian.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, sparclinux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Richard Weinberger <richard@nod.at>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Jacky Huang <ychuang3@nuvoton.com>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/19] printk cleanup - part 3
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

On Tue, Jan 13, 2026 at 09:32:33PM -0300, Marcos Paulo de Souza wrote:
> I talked with Petr Mladek and it would need to rework the way that we
> register a console, and he's already working on it. For now I believe
> that we could take a look in all the patches besides the last one that
> currently breaks the earlycon with kgdb and maybe other usecases.
>
> Sorry for not catching this issue before. I'll use kgdb next time to
> make sure that it keeps working :)

As I understood things the bug was in earlycon rather then kgdb.

It was picked up by the kgdbtest suite since kgdb does some cool things
with earlycon (thanks to Doug Anderson) so I added a few earlycon tests
to the kgdbtest suite. However it wasn't kgdb itself that failed here.

So... if you want to run https://gitlab.com/daniel-thompson/kgdbtest
then certainly feel free but its probably less effort just to include
a couple of earlycon checks in your testing.


Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
