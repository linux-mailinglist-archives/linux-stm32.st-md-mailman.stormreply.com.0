Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F14B2C14080
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Oct 2025 11:16:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A26BC628C8;
	Tue, 28 Oct 2025 10:16:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 866D9C628BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 10:16:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 049ED1A16F8;
 Tue, 28 Oct 2025 10:16:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C3F8E606AB;
 Tue, 28 Oct 2025 10:16:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B7D061179B09A; Tue, 28 Oct 2025 11:16:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761646587; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=qYkSNjVRC4huW3BOIeZ7ligdjSUf5E+H3Pi1sGaKGTU=;
 b=ZE6JGDOoX/OJXZ0LOEM3oy69yMuQAYK5M1YXgue5oYH7XCOttwhDf/7shVjzM0SdXm8+Y/
 hgJl5upKofTjs1nPPeCSZMI0w8W/bWyYCZsHzRc3+HasMQpH1y6E91LjVGmZ1G1AAZxx15
 hRZGUGv/VQ6fDfuVF7azTAiIBjrBC/x9XllDyp+Fwg8i6Ys7XnxMwCz4u+KInwxcIn9Yz2
 Db9c4onUPoBG+GVDsrFLGJbNWr2kpHUGZbtxGajI53YPSaUi8EyWJKlXiElJ1vgHhawgVn
 /H69KBXCwRSFqJ5H4K/R/Wq9gtHsM0SbutsmVmBSwIDJq4SE8h0CF74QvLROjg==
Message-ID: <604b68ce-595f-4d50-92ad-3d1d5a1b4989@bootlin.com>
Date: Tue, 28 Oct 2025 11:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <E1vClC5-0000000Bcbb-1WUk@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vClC5-0000000Bcbb-1WUk@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Yu-Chun Lin <eleanor15x@gmail.com>,
 Daniel Machon <daniel.machon@microchip.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Furong Xu <0x1207@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Alexis Lothor__ <alexis.lothore@bootlin.com>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: add support
 specifying PCS supported interfaces
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

Hello Russell,

On 25/10/2025 22:48, Russell King (Oracle) wrote:
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Maybe this needs a commit log, even a small one ? :(

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
