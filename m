Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F804878DCE
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 05:28:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9FDAC6DD73;
	Tue, 12 Mar 2024 04:28:58 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8FDBC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 04:28:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A556FCE1116;
 Tue, 12 Mar 2024 04:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BE0C433C7;
 Tue, 12 Mar 2024 04:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710217733;
 bh=dVpF90zefLWAqpU31bKcETHT4IBXM4S+wtcvz9Boem4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IMTV257J5X5outjE5pGZIoNb00rx7AZY48tt+FF9LhaibdAp4nHH0+8e2G4n094xY
 ne5uukUhjoaqDYLEUSNqISDF1I1gZiDtGGhu/VSwBQq8XmoVW0ubY4OKcfvVNer8yL
 MiWnfDxVy896vPPkngxeKQSNEBqOUjb9FY+m5Puq7k7q9H3y1C57RUZGmMCwuJFbpR
 mxdR9FHZiGm6ieEavDf4Goke95w+XLwMutkOOv79TIEMWN2KXhv6L7QBaRDOHx8joL
 vmktuuy+B8lvq7EKDCYBCKi1urANBznNOhrHSaKF2MEzKK+mYQd0QYbFyPuYmMxtfU
 oj40jEy9Yg1dQ==
Date: Mon, 11 Mar 2024 21:28:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <20240311212851.315ec6f7@kernel.org>
In-Reply-To: <20240311-rxc_bugfix-v6-0-adf5133829a2@bootlin.com>
References: <20240311-rxc_bugfix-v6-0-adf5133829a2@bootlin.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 linux-renesas-soc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v6 0/7] Fix missing PHY-to-MAC RX
	clock
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

On Mon, 11 Mar 2024 10:55:43 +0100 Romain Gantois wrote:
> This is version six of my series that addresses the issue with some MAC/PHY
> combinations.

## Form letter - net-next-closed

The merge window for v6.9 has begun and we have already posted our pull
request. Therefore net-next is closed for new drivers, features, code
refactoring and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after March 25th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
