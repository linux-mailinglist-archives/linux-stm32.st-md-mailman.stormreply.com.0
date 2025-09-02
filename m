Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4F9B3F918
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Sep 2025 10:49:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D40E0C3FACB;
	Tue,  2 Sep 2025 08:49:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5EF0C3F95B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Sep 2025 08:49:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B612360207;
 Tue,  2 Sep 2025 08:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DE7C4CEED;
 Tue,  2 Sep 2025 08:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802966;
 bh=rEEUhyesr1JfcnPJBOaeHTZak+JujvzT4iPgYVAefgY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B4dK+02dMlR8emlHiLWqZYbLOQhyLVddyOOin8epDnyty080NGW2VX2tWBmYFo1zC
 1fzMnTtYbdLKl4lyGu3PkXcLMCXqrRJEkzD7o6NfFYDqwJz7xvOU0vtDRfxKfELku8
 IqAlKWY1CZaVZCkpF81r/Sx1HKQYpgm7/MnbFMgCLcds8WCOWjZi12/fSsjMWrR8g4
 edT7akdZ4A4pNTJJ1OwT9xzJzf5BQCG50jJ3RTJo6KITr44epGr4jzAz9tUDNalccz
 c+6SZEwjc4yqdWSNBJhWX+2F1juf2LY9raq7U8W0xe6NlyK+Nbzp8JEGAm4YUvO2C3
 b5upV9De/LlVg==
Date: Tue, 2 Sep 2025 10:49:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Message-ID: <20250902-spirited-congenial-stingray-f8aff7@kuoka>
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902001302.3823418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250902001302.3823418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 1/4] dt-bindings: net: dwmac:
 Increase 'maxItems' for 'interrupts' and 'interrupt-names'
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

On Tue, Sep 02, 2025 at 01:12:59AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Increase the `maxItems` value for the `interrupts` and `interrupt-names`
> properties to 19 to support additional per-channel Tx/Rx completion
> interrupts on the Renesas RZ/T2H SoC, which features the
> `snps,dwmac-5.20` IP with 8 Rx queues and 8 Tx queues.

This alone makes no sense. Why would we need more interrupts here if
there is no user of it at all? Squash patches.

You also need to constrain other devices, because now one Renesas
binding gets 19 interrupts without any explanation. Please rethink how
you split your patches...

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
