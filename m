Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FB7B92576
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 19:05:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68478C32EBF;
	Mon, 22 Sep 2025 17:05:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3407C32E93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 17:05:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6F5AC40BEA;
 Mon, 22 Sep 2025 17:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5240C4CEF5;
 Mon, 22 Sep 2025 17:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758560736;
 bh=aB41Del3g0nOA+kFSYQYpkWIe9LOgh+neGwq9E8TZ/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oyLdi0ayT0aqVNMp+NAnnqmKMZU8LE/Z8pI+DgUCXRagaJXUQE8nzBE0zVj7a6/Ek
 iz0b4gKpWMOKM/DmDDzJF1X9fIe6fGbg44ZJ7sereMMo8kRRqSJK7b3Klbe9bwVi1C
 BvyQ7oZqfv4R/tv4F6BZHQHvKzTDjvthu9lAs6gSajdWyw0QRSwB5+jFF7VCbfpJT7
 Y+FACemuaEeWt8jogzH1Be44PxCngu+YUCJI9SFzobW25FgBcY9qhU2rMOpuhw15yg
 blZPN2eSj7PH5CptcE7u9r74WWbvb+isvaWIi+rpHXNLtebtSmzG/qpG2N5IQwwZE7
 Jjz28vUQjzF6Q==
Date: Mon, 22 Sep 2025 12:05:34 -0500
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20250922170534.GA468503-robh@kernel.org>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-1-105f5eb89b7f@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250917-wol-smsc-phy-v2-1-105f5eb89b7f@foss.st.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, devicetree@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tristram Ha <Tristram.Ha@microchip.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/4] dt-bindings: net:
 document st, phy-wol property
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

On Wed, Sep 17, 2025 at 05:36:36PM +0200, Gatien Chevallier wrote:
> Add the  "st,phy-wol" to indicate the MAC to use the wakeup capability
> of the PHY instead of the MAC.

Why is this ST specific? PHYs being wakeup capable or not is independent 
of ST. If you want to or can use wakeup from the PHY, shouldn't that be 
a property in the PHY?

Seems to me you would want to define what all components are wakeup 
capable and then let the kernel decide which component to use. I'd think 
the kernel would prefer the PHY as that's closest to the wire and 
probably lowest power.

That's my 2 cents spending all of 5 minutes thinking about it. I'll 
defer to Russell and Andrew...

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
