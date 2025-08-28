Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DAEB3A464
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 17:28:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D9AFC30883;
	Thu, 28 Aug 2025 15:28:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 226E8C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 15:28:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1648560097;
 Thu, 28 Aug 2025 15:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F2DC4CEEB;
 Thu, 28 Aug 2025 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756394922;
 bh=HGZLe7DTRuz1r+tooyR6QTpWMuRK0oD7wwj0haGcwpw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Im4kBZaReNs/7kHrN/Q+bICp4U2subu1TwCnRvs9G4O5FY5R7eUhYQ6Gd9X3D/gUH
 lcVaJHWHnnqu+9v/qg9o5lVFhQ/yOtMvOV/RTPR4+VkKISFVy9tVqY0amO7+TvA/6P
 lyXUrHBRwluXgDAQpurq0Zj50IJOm1olVjq7Eu0uOlRYwuwBvjyP2HwxKWHDt/uR7U
 LW2JGxPV4XcW0Fi1fPyAOM4bdiDsoLBTXhhoS4ngc/DyTGMQWCocP4tZttd/O1/VoR
 wxeJ1mLrIDk3sV3uT4G+L8WjxCvifHamyUZx6uWSkLMhgilWunlSJIu4lKc9RBs0zk
 30QzehCzjaA5Q==
Date: Thu, 28 Aug 2025 16:28:38 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250828152838.GU10519@horms.kernel.org>
References: <E1urGBn-00000000DCH-3swS@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1urGBn-00000000DCH-3swS@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: mdio: clean up
 c22/c45 accessor split
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

On Wed, Aug 27, 2025 at 02:27:47PM +0100, Russell King (Oracle) wrote:
> The C45 accessors were setting the GR (register number) field twice,
> once with the 16-bit register address truncated to five bits, and
> then overwritten with the C45 devad. This is harmless since the field
> was being cleared prior to being updated with the C45 devad, except
> for the extra work.
> 
> Remove the redundant code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Untested, as I don't have my Jetson Xavier NX platform with me (and
> probably won't do for a few weeks.)
> 
> While this patch has been prepared on top of "net: stmmac: mdio: use
> netdev_priv() directly" it shouldn't conflict if that patch is not
> applied before this one.

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
