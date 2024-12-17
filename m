Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4724B9F4B5F
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 13:59:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE101C78012;
	Tue, 17 Dec 2024 12:59:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E4D3C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 12:59:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20B3460002;
 Tue, 17 Dec 2024 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734440377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nI25amw8mKM1HUCW0J89cbc4oV1eC9Wev0IA+2/p98M=;
 b=b9Mvdrgk1gOB+P6K9XMFfCT86n5yIqey2T6btCwQpOPjmkMEhdo+bdktDZbWNe8soVdAE3
 LowYzA2SUu2X0MPvuk5nJxStHOkDykumdcRoIHfmAsnqYUtEiRFlUG85B5TcYvihSNfvAb
 5J9pCRemqeaF5jrWwhAB5AdAKc1JtpDALj3nANjEuatRhLSxmoQCEdSZhYLH3dz6hkNoET
 bNOdqFyci3R+hRclrlTymBcRCeXcnHJZdgh2Cwiw5Ii5Uyq8BIWDCuicrW9B7jCw4fxJGE
 cQfPFYGtcPFsmXt2wUaFeqxIXUmleh0kGWs5jFHT4jbTaXQodFc2EsrmudIWjw==
Date: Tue, 17 Dec 2024 13:59:32 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20241217135932.60711288@fedora.home>
In-Reply-To: <20241216173333.55e35f34@kernel.org>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
 <20241213090526.71516-3-maxime.chevallier@bootlin.com>
 <Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
 <20241213182904.55eb2504@fedora.home>
 <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
 <20241216094224.199e8df7@fedora.home>
 <20241216173333.55e35f34@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
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

Hi Jakub,

On Mon, 16 Dec 2024 17:33:33 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Mon, 16 Dec 2024 09:42:24 +0100 Maxime Chevallier wrote:
> > > I've actually already created that series!    
> > 
> > Woaw that was fast ! I'll review and give it a test on my setup then.
> > 
> > Maybe one thing to clarify with the net maintainers is that this work
> > you've done doesn't replace the series this thread is replying to,
> > which still makes sense (we need the
> > stmmac_priv->phylink_config.supported_interfaces to be correctly
> > populated on socfpga).  
> 
> Ah, sorry. Should have asked. 
> 
> I assumed since Lynx PCS will have the SGMII and 1000BASEX set -
> Russell's patch 5 will copy them for you to
> priv->phylink_config.supported_interfaces. Your patch 1 is still needed.
> Did I get it wrong?

Both are needed actually :) There are 2 issues on socfpga :

 - 1000BaseX needs to be understood by the socfpga wrapper
(dwmac-socfpga) so that the internal serdes is enabled in the wrapper,
that would be patch 1

- The priv->phylink_config.supported_interfaces is incomplete on
dwmac-socfpga. Russell's patch 5 intersects these modes with that the
PCS supports :

+		phy_interface_or(priv->phylink_config.supported_interfaces,
+				 priv->phylink_config.supported_interfaces,
+				 pcs->supported_interfaces);

So without patch 2 in the series, we'll be missing
PHY_INTERFACE_MODE_1000BASEX in the end result :)

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
