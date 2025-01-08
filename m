Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1280CA057B1
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2025 11:11:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8FDBC78031;
	Wed,  8 Jan 2025 10:11:09 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC72EC78030
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 10:11:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D4795C1116;
 Wed,  8 Jan 2025 10:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91504C4CEE1;
 Wed,  8 Jan 2025 10:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736331061;
 bh=ZAOvCmQtAkYPaOMmqXIxilcjMsbJEBo9S7TbBj2iB7k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jSYzvAZlwLRamAE26BsRm51HQXveJ4MnFFNKVCnpyhZORRvxcNdfE2EzoYfPX78Fn
 9eD88AukwzOmZ798c+wW0/YXJTRfwrIoLdvAW9ryKPbHe5tzNaUY8njTdya7Xx9v1C
 mfq0RrKUVoT4SKPgrJh81bbqGsrl1+9YYIfLQX/IcetSuqWDSY2NbkSEaXXcphgxvg
 mTHZAuSUfHJHSIaLANiMJDM9dYxS53dHciS87qqmmNe4QklC0uM6OcSxcTue94v929
 Jw4drEvlia9a0C29yRKywXhMiVn2Qj1qcu25x/Zm5L7LC+1fn8k1rMyju/41hRpJCZ
 zSfqDbT32fDdA==
Date: Wed, 8 Jan 2025 10:10:56 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250108101056.GH2772@kernel.org>
References: <Z31V9O8SATRbu2L3@shell.armlinux.org.uk>
 <E1tVCRj-007Y3H-Hm@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tVCRj-007Y3H-Hm@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 04/18] net: stmmac: use
 unsigned int for eee_timer
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

On Tue, Jan 07, 2025 at 04:28:47PM +0000, Russell King (Oracle) wrote:
> Since eee_timer is used to initialise priv->tx_lpi_timer, this also
> should be unsigned to avoid a negative number being interpreted as a
> very large positive number. Note that this makes the check for negative
> numbers passed in as a module parameter redundant, and passing a
> negative number will now produce a large delay rather than the
> default. Since the default is used without an argument, passing a
> negative number would be quite obscure. However, if users do, then
> this will need to be revisited.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
