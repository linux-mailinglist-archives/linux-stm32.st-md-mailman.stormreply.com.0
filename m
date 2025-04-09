Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5ECA820EF
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Apr 2025 11:24:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BFA2C7803D;
	Wed,  9 Apr 2025 09:24:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1910C78023
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Apr 2025 09:24:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 300596843E;
 Wed,  9 Apr 2025 09:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F195BC4CEE3;
 Wed,  9 Apr 2025 09:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744190660;
 bh=DwGnLL6yRkvpHKgsWq2KLkFsuAMpxTUYys1PXFd8l/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I5IgcAlRk1EgDie6uaxayYtmeWyKVS9fIZR/1/0nWhopGT1klDsqsAR7EEvpioDBA
 fT+AelYZcJx98j9ircBrA/HFfrqqKxbfjSa6MQrT5xWwUW8xPgSSMzDlert4absJ6f
 bN0q1tjepncf6SDptO1blqFqaz/am//rlMjDmRAeUp/jdX/eN4wmAAvTDvgkNHDN+x
 Hr06pPWxCq93goCnSt6PUrlzRR3E2sHbGERKzE+hRoSqOzeWpPubGNxQuyfeVRghR+
 HKyRoY10GR+tr2P6I3RsaFu6Nnz2Hc+vRvi4fdIdM6Yo0Gw7CvaddfZs/7/qYPcVXK
 RSmto31DVfR+Q==
Date: Wed, 9 Apr 2025 10:24:15 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250409092415.GI395307@horms.kernel.org>
References: <E1u1rwV-0013jc-Ez@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1u1rwV-0013jc-Ez@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: stm32: simplify
	clock handling
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

On Mon, Apr 07, 2025 at 08:15:35PM +0100, Russell King (Oracle) wrote:
> Some stm32 implementations need the receive clock running in suspend,
> as indicated by dwmac->ops->clk_rx_enable_in_suspend. The existing
> code achieved this in a rather complex way, by passing a flag around.
> 
> However, the clk API prepare/enables are counted - which means that a
> clock won't be stopped as long as there are more prepare and enables
> than disables and unprepares, just like a reference count.
> 
> Therefore, we can simplify this logic by calling clk_prepare_enable()
> an additional time in the probe function if this flag is set, and then
> balancing that at remove time.
> 
> With this, we can avoid passing a "are we suspending" and "are we
> resuming" flag to various functions in the driver.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> This patch has been only build tested, so I would be grateful if
> someone with the hardware could run-test this change please.

Yes, agreed that would be nice.
But this is a very nice cleanup.

Reviewed-by: Simon Horman <horms@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
