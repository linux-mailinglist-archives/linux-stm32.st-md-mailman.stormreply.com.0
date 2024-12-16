Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 881DC9F2BA3
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2024 09:18:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EFE0C71292;
	Mon, 16 Dec 2024 08:18:38 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4672EC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2024 08:18:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 52484FF802;
 Mon, 16 Dec 2024 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734337111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxS4ncPpbKlMnJQoKFd8UWkTSQivyZ8RY8LCYQtrmNo=;
 b=L6g0QXKdxrWm0q1CYYnXC6J2ukMS3d5pJImPPr7qQ8cAMergObjjMlyk2MwqGMnTc8SCGH
 yyGyr79Fb8aXS207hHSHxL726xEHZTIC5Z8XMPbHzK0SuSLkghGPD3DJj0QgBm5Vj4w6Ls
 jKgPjmvahPDAHsoRhdwxP56NAR6njisU6iY+EUK9WRpxgASltWnc3m4E3YJYyKqR+OO/FD
 bSECcVFfm++Hv018s7qg4qJ25q7YlhhUle5G9sVksvlJ3zC0Nv40gl5yT83MJ4ZXMboV2S
 m9e6sMIKILAFiAEweWN7L0Dtmlzf4qqVHs5iTgcFgk1M9+J9JSTSdQycndxAkA==
Date: Mon, 16 Dec 2024 09:42:24 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20241216094224.199e8df7@fedora.home>
In-Reply-To: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
 <20241213090526.71516-3-maxime.chevallier@bootlin.com>
 <Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
 <20241213182904.55eb2504@fedora.home>
 <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
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

Hello Russell,

On Fri, 13 Dec 2024 19:21:38 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> > > However, maybe at this point we need to introduce an interface bitmap
> > > into struct phylink_pcs so that these kinds of checks can be done in
> > > phylink itself when it has the PCS, and it would also mean that stmmac
> > > could do something like:

[...]

> > > and not have to worry about this from individual PCS or platform code.  
> > 
> > I like the idea, I will give it a go and send a series for that if
> > that's ok :)  
> 
> I've actually already created that series!

Woaw that was fast ! I'll review and give it a test on my setup then.

Maybe one thing to clarify with the net maintainers is that this work
you've done doesn't replace the series this thread is replying to,
which still makes sense (we need the
stmmac_priv->phylink_config.supported_interfaces to be correctly
populated on socfpga).

Thanks a lot for that work Russell,

Maxime

Thanks a lot,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
