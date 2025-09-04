Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDE8B42E78
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Sep 2025 02:53:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BDCDC36B3D;
	Thu,  4 Sep 2025 00:53:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91C78C36B3A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 00:53:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7AE776023D;
 Thu,  4 Sep 2025 00:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CDAC4CEE7;
 Thu,  4 Sep 2025 00:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756947211;
 bh=PRZRjRSX2JA9lvFNL/WZkeCUWyYQfQ1+r6Jp/WjO5pw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NgdwO+8wAFHW6LdO/eVyFoEDcchaE2YqsA5D3ztR5fafA1jCL3Sm2HpA+DttiBmGc
 /ClJ8qp+GmwYYnTJU8T9YOjXhS90FeHJPWLUrw8FyTxBolt4XzJGSy8nL8t0W2PzgV
 UcbGAKWYK2FD5eO7qPzQESFhUvGz/BcbTfUAHxbHjGOJZ7rhFG/TCfFiZtQemB8Qxc
 WcZGqDmvoyw8Z0D3YBkpBRmlPmPZO4j/So44m5f9fmvANi4hxPhdvrXUGOY7PDZKlw
 ImnIcmjuDEbWXJJgYaxxcGoPzh0qRUHNnMIRolv4044ETy6YaRJap3cAH9+do8qtX7
 Nz0JutItWH87A==
Date: Wed, 3 Sep 2025 17:53:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250903175330.6937a8a5@kernel.org>
In-Reply-To: <E1utmli-00000001s00-49Uk@rmk-PC.armlinux.org.uk>
References: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
 <E1utmli-00000001s00-49Uk@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 01/11] net: stmmac: mdio: provide
 address register formatter
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

On Wed, 03 Sep 2025 13:39:18 +0100 Russell King (Oracle) wrote:
> +/**
> + * stmmac_mdio_format_addr() - format the address register
> + * @priv: struct stmmac_priv pointer
> + * @pa: 5-bit MDIO package address
> + * @gr: 5-bit MDIO register address (C22) or MDIO device address (C45)

If you're willing to oblige kdoc it wants Return: to be documented.
Similar comment on patch 9 where stmmac_clk_csr_set() gains a return
value.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
