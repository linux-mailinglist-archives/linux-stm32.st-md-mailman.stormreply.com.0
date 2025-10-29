Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEF3C177AF
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 01:10:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5742C62D2D;
	Wed, 29 Oct 2025 00:10:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F9A6C62D2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 00:10:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F33DB44530;
 Wed, 29 Oct 2025 00:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4AFC4CEE7;
 Wed, 29 Oct 2025 00:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761696634;
 bh=fWgybk4zJ8v4uHqTzhcQSKCfyRk/m+NFcuLw6/SBDzM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zn4kwfwOegS/wt629E7r632Ghchk7SkSaKzoVi1YnCYk5rAH7oe/FBdM6821dOQNb
 LxlB0YKKva0KpERflFyEiCVobvKbcUoS9FLzTzFFHVt/rKuhWuVdCTpyKWCMtPOu/K
 SuABN8f5i/32fGANHjargfgjvpLSLLFZP2+f6Zki5YZ8Ks/JqsYRFBBPkwUMUSBpUF
 uD396HYImedHwG3FC7MjQjs+DvWPk9KLbnn9BChud1S8EXO5icOTSfdZlWbwiTU1EU
 Q5GG7HQPCNuYcJvJJlNyTORq25lJU7Dao3ne591kyt68s7dACakMq53gyk9kUlcC+E
 LeRdbWgc4Ebzg==
Date: Tue, 28 Oct 2025 17:10:33 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20251028171033.0a9a5a63@kernel.org>
In-Reply-To: <aQFYdRZV9CQVuqFu@shell.armlinux.org.uk>
References: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
 <20251028164257.067bdbcd@kernel.org>
 <aQFYdRZV9CQVuqFu@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/8] net: stmmac: hwif.c cleanups
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

On Tue, 28 Oct 2025 23:57:41 +0000 Russell King (Oracle) wrote:
> > This one needs a respin (patch 6 vs your IRQ masking changes?).  
> 
> Ah, I see it, rebase can cope with that, but not application. Bah.
> Another week of waiting for it to be applied. :(
> 
> I'm going to start sending larger patch series...

I could have told you earlier, too. I assumed it's conflicting with
Maxime's patches and I didn't get to those yesterday :(
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
