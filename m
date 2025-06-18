Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D9ADF621
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jun 2025 20:44:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76E84C36B31;
	Wed, 18 Jun 2025 18:44:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F45AC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 18:44:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AB0F74AAF6;
 Wed, 18 Jun 2025 18:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14C3C4CEE7;
 Wed, 18 Jun 2025 18:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750272284;
 bh=FlkPWKCF+vrWk0zCgUpHWTZNjZJiKx1wM3zXfGDaXsg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bg30LeSSE32MgC797Sw+q+dZZ+xVcEMIkll39N7Di6bIuOWcH/OEsrGIEPkWohOVE
 eJ6ZnbdFdUmq3qlYI/4ZN24ym1SJTUOwr+qlvlstkyFErb8ljRHqmcqFGGb+MxAIk1
 Wf1XvjEY2MdbpC8TQD5dCvisfYk00Ar8EwU3dEn6KwrkheyvOLf+9fyfPEfykRs4U7
 SAi5V7OQkA+c7TuhaDViLEu199e05SWJzcqKruIfs1R7s55HuVzR/0UFkYH5ghKYrX
 UQ18Biekpca6VwEXWP/nGleW/7yKzowRnrmgJ9+ZfeHewU58FV71DQ0Alx6278u06b
 X/OHw5Il3vtTQ==
Date: Wed, 18 Jun 2025 19:44:39 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250618184439.GY1699@horms.kernel.org>
References: <E1uRqbQ-004djP-1l@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1uRqbQ-004djP-1l@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: replace ioaddr with
 stmmac_priv for pcs_set_ane() method
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

On Wed, Jun 18, 2025 at 12:05:12PM +0100, Russell King (Oracle) wrote:
> Pass the stmmac_priv structure into the pcs_set_ane() MAC method rather
> than having callers dereferencing this structure for the IO address.
> 
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
