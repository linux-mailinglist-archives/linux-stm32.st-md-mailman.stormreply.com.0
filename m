Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA099F400A
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 02:33:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5785CC7129D;
	Tue, 17 Dec 2024 01:33:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CEA9C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 01:33:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6E9FC5C4D5E;
 Tue, 17 Dec 2024 01:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB17BC4CED0;
 Tue, 17 Dec 2024 01:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734399214;
 bh=jQx59o3wR/vFzoPfSo4zsecm2GePz+OK8mpQNupeUek=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gCP71Z9nQNwt3IAPUQAkOKGdvWzMoRegQfY4Q2lItX3gZwmaSSQwC0+fbg3frju1S
 uty3sd2bWabuzWOiFoLSvfex6vwv1+Tes8g7HDi7Ye1WqIFyKQZdYsQPQ/ktnQoSn3
 MGw9zq6CdwIlxVFo4tcgRm2BKNqkFq/hhy6aO8r11h0/PF09mfxySUTJvlxhst1XIV
 c6jQWxs00GjjCy/5jqfxmwc8zYxzG+Hrwi9GYwl7s5ZP+Iwh/gFLoHaS3+OG/arcR+
 bZv+bOnwlsDQd4YYIx/JFQtKGyhGzszyxexsbIfjy7XSIqsjCJiJ7tbEIVPkelYwIo
 1PF5qPnajJM/A==
Date: Mon, 16 Dec 2024 17:33:33 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20241216173333.55e35f34@kernel.org>
In-Reply-To: <20241216094224.199e8df7@fedora.home>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
 <20241213090526.71516-3-maxime.chevallier@bootlin.com>
 <Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
 <20241213182904.55eb2504@fedora.home>
 <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
 <20241216094224.199e8df7@fedora.home>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-socfpga:
 Set interface modes from Lynx PCS as supported
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

On Mon, 16 Dec 2024 09:42:24 +0100 Maxime Chevallier wrote:
> > I've actually already created that series!  
> 
> Woaw that was fast ! I'll review and give it a test on my setup then.
> 
> Maybe one thing to clarify with the net maintainers is that this work
> you've done doesn't replace the series this thread is replying to,
> which still makes sense (we need the
> stmmac_priv->phylink_config.supported_interfaces to be correctly
> populated on socfpga).

Ah, sorry. Should have asked. 

I assumed since Lynx PCS will have the SGMII and 1000BASEX set -
Russell's patch 5 will copy them for you to
priv->phylink_config.supported_interfaces. Your patch 1 is still needed.
Did I get it wrong?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
