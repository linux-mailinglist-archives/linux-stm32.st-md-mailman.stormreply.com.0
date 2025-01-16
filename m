Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC74A13545
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2025 09:28:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC84DC78F7A;
	Thu, 16 Jan 2025 08:28:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 975BBC78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 08:27:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9213FF804;
 Thu, 16 Jan 2025 08:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737016073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CMMO4I+XOjicEs5GOnQABU5X5tsmLYQ+6VrW28JvHQM=;
 b=h4cuNtj2wuZBJ25fhPMZnM2MQBVVazS1TWD82c/CYS/Z8CDdBBb2/LIjQwokQdG5kpiBY1
 sx0hPsvV0uFsTD6zMzIpb0MgMXjLQ5fohkPFWaqbawQWndJ/7UfjfXH43vXpqyZb6CGYh7
 Y/hmmduxAphLn1XA6AAo1oaPRhdAIk2Fd5emW1LK+QV7fM1Wy/O2AwEVrcZds2SHxltBkW
 XIBrremK6YGd1wT5kQBC9sn9zQUDxvU7pMl4p6gaHnEFW3Zf19Qgy6zlCuZ2lCJWStHYRb
 8LjX029NzekFIAcGyiuDZS+L2sDoLBKp1ECYHlideH3+0OUJ6cAOeQXYpoXsXQ==
Date: Thu, 16 Jan 2025 09:27:43 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250116092743.34ae7dad@2a02-8440-d117-22fd-0cfc-7753-7eff-f472.rev.sfr.net>
In-Reply-To: <E1tYAE0-0014Pz-R9@rmk-PC.armlinux.org.uk>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
 <E1tYAE0-0014Pz-R9@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 UNGLinuxDriver@microchip.com, Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 6/9] net: mvpp2: add EEE
	implementation
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

Hi Russell,

On Wed, 15 Jan 2025 20:42:52 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Add EEE support for mvpp2, using phylink's EEE implementation, which
> means we just need to implement the two methods for LPI control, and
> with the initial configuration. Only SGMII mode is supported, so only
> 100M and 1G speeds.
> 
> Disabling LPI requires clearing a single bit. Enabling LPI needs a full
> configuration of several values, as the timer values are dependent on
> the MAC operating speed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thank you,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
