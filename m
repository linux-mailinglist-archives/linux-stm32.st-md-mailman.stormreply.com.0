Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FB2825B69
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jan 2024 21:13:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 777AFC6C83C;
	Fri,  5 Jan 2024 20:13:53 +0000 (UTC)
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07462C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jan 2024 20:13:51 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id C11741A8FC8;
 Fri,  5 Jan 2024 21:13:50 +0100 (CET)
Authentication-Results: mail.tesarici.cz;
 dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
 t=1704485631; bh=qdEGmoXSPqG4JbD1i3Bm79Ffe7UZE6+DjIAOPeN0k74=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IyRRnvIR+xXTGvFOFwKNNre/mUzSmkDSN9w4c2vj2tl0J4QkA7mIS+eReSwVFXFkF
 PPyecJeVe8o1cDxzGlZGICAl+vniWccUVR6Xin5h411EdTIuJ7IfjXK4gvMi/i+E+G
 qZefGhIbVtCXqFxXyVUHXO/LOGS46bXNAHmgvDw7LDNGP76QIhfCMZInO1y+6+FHzS
 jYs2MiHsYpSE4i5LQX5rUchHMl159i3CeKkN1mCDGiI/6gJ3vLulIQg+52yx4oUlvn
 ayBRu23ikbtm67E2IVd9aMtLqyQoVPA4kKb13TfI3SkNgHIuQ3H5P2N03f73mDbw+9
 FFxMp0us9260g==
Date: Fri, 5 Jan 2024 21:13:49 +0100
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20240105211349.1017573e@meshulam.tesarici.cz>
In-Reply-To: <14d3ba8c-c01f-42d2-9f5a-d681d9ce3a55@lunn.ch>
References: <20240105181024.14418-1-petr@tesarici.cz>
 <14d3ba8c-c01f-42d2-9f5a-d681d9ce3a55@lunn.ch>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Cc: open list <linux-kernel@vger.kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix ethtool per-queue
	statistics
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

On Fri, 5 Jan 2024 20:54:01 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> On Fri, Jan 05, 2024 at 07:10:24PM +0100, Petr Tesarik wrote:
> > Fix per-queue statistics for devices with more than one queue.
> > 
> > The output data pointer is currently reset in each loop iteration,
> > effectively summing all queue statistics in the first four u64 values.
> > 
> > The summary values are not even labeled correctly. For example, if eth0 has
> > 2 queues, ethtool -S eth0 shows:
> > 
> >      q0_tx_pkt_n: 374 (actually tx_pkt_n over all queues)
> >      q0_tx_irq_n: 23  (actually tx_normal_irq_n over all queues)
> >      q1_tx_pkt_n: 462 (actually rx_pkt_n over all queues)
> >      q1_tx_irq_n: 446 (actually rx_normal_irq_n over all queues)
> >      q0_rx_pkt_n: 0
> >      q0_rx_irq_n: 0
> >      q1_rx_pkt_n: 0
> >      q1_rx_irq_n: 0
> > 
> > While touching this code, change the pointer type to u64 and get rid of the
> > weird pointer arithmetic.
> > 
> > Signed-off-by: Petr Tesarik <petr@tesarici.cz>
> > Fixes: 133466c3bbe1 ("net: stmmac: use per-queue 64 bit statistics where necessary")  
> 
> Hi Petr
> 
> There are a few process things you are missing. Please take a look at
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
> 
> You need to indicate which tree this is for.

Ah. Thank you for the pointer. You see, this is my first netdev patch...

> Additionally, your Signed-off-by comes last.

Oh, I'm sorry for that.

> Patches for stable should ideally be minimal. And obviously correct. See:
> 
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> 
> So the bits about changing the pointer type and removing the weird
> arithmetic might be better suited for net-next, not net.

Good. Given that I have meanwhile found out that I will have to change
this whole function to fix the lockup on 32-bit systems, let me just
discard this part, add "net" to the subject and cc stable.

Resending...

Petr T
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
