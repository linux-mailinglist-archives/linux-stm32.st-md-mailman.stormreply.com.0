Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFFEA7E8B6
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 19:44:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50550C7128A;
	Mon,  7 Apr 2025 17:44:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91E00C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 17:44:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8A5E5444A4;
 Mon,  7 Apr 2025 17:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C23C4CEDD;
 Mon,  7 Apr 2025 17:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744047889;
 bh=xxHjDP+NyHgWQ2jb/v9uMp+G1hNt7hQcpSlTqvAxzE4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rU9Zo7xuCU1GBu8ICWZkzwDdIy9JRjkUCAis5IdHL5kK6hev+J2xF9tbUUYJfMJzb
 EezmqeGNreOqRpIz+xYQ6Ah4ZhPosPCbLjcb5F0zDUWVrY2kR+nz8l8pEemNiDZc+8
 V9I7LLlItTJfExgcXSmsuI1zV+QRxtU6EZfGYOM3+8OEsL7tzsTwvJXyqQiYG8jMKk
 I2vTcXm5in4biyuNSWi01hMrjmxQXGcVboly/Ryl2y2I6l4CCacxKAwN31+FuX+8mi
 J8nqdG7l4ohdEmGdQg5fiWLIJcHpXqYfchMmeCmhzxo7RGfZSmPjNDw26rzep1J/UQ
 Bs9i3oQ1J8LMA==
Date: Mon, 7 Apr 2025 10:44:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Message-ID: <20250407104447.072449cd@kernel.org>
In-Reply-To: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, "Russell
 King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v5 0/3] Add GBETH glue layer
 driver for Renesas RZ/V2H(P) SoC
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

On Mon,  7 Apr 2025 13:03:14 +0100 Prabhakar wrote:
> This patch series adds support for the GBETH (Gigabit Ethernet) glue layer
> driver for the Renesas RZ/V2H(P) SoC. The GBETH IP is integrated with
> the Synopsys DesignWare MAC (version 5.20). The changes include updating
> the device tree bindings, documenting the GBETH bindings, and adding the
> DWMAC glue layer for the Renesas GBETH.

This was posted prior to the "net-next is OPEN" announcement:
https://lore.kernel.org/all/20250407055403.7a8f40df@kernel.org/

In the interest of fairness towards those who correctly wait 
for the tree to be open I will ask you to repost this again,
in a couple of days.

Thanks!
-- 
pw-bot: defer
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
