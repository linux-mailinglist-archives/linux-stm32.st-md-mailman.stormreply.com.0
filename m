Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ED2ADF5F7
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jun 2025 20:33:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF384C36B30;
	Wed, 18 Jun 2025 18:33:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D4EEC36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 18:33:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 93B7E61F1F;
 Wed, 18 Jun 2025 18:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C8EC4CEE7;
 Wed, 18 Jun 2025 18:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750271636;
 bh=kpSEGRfAU9fOVbtCMrVZ+rQ1aeDB+P7Ft42jygFEEhI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A3Ej2aul6fOJdod+0Bbxj0EYeWA1n+Nq1rRrj2roqfVx8U5wc9HLvaFtQ/Gl+sX87
 DVlw0BCrspfewDTpmNpbKVx5NKWLTN6j3JaLhozqVKHvBJRbJrAeiHFjzJANJcHvru
 ady7/4IUV0NdKjQIe1n6y1eQPhCTWlo3fImZ/x7KWqP4G7Pi7Voyo3jMtMZaU7TS1g
 2Z8fBPysGH7TIfjr3E84ZogDi7vPuFu4iBSlaUrSlAiuJTiQMrAe29qWgU6+tzKTRt
 Da8MhNQmLQ0fOi+ywjmv1dXi7e4bx7W2YI+ojHWczLCnBetGloAn07w6VGIrBPt1LS
 EN19s6tQH1ViA==
Date: Wed, 18 Jun 2025 19:33:51 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250618183351.GX1699@horms.kernel.org>
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
 <E1uRqEE-004c7M-Go@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1uRqEE-004c7M-Go@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: loongson1: get
 ls1b resource only once
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

On Wed, Jun 18, 2025 at 11:41:14AM +0100, Russell King (Oracle) wrote:
> ls1b_dwmac_syscon_init() was getting the stmmac iomem resource to detect
> which GMAC block is being used. Move this to a separate setup() function
> that only runs at probe time, so it can sensibly behave with an
> unrecognised resource adress. Use this to set a MAC index (id) which is
> then used in place of testing the base address.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
