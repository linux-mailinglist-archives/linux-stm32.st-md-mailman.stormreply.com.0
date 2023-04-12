Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 284256E07C8
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 09:33:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D03EEC6907A;
	Thu, 13 Apr 2023 07:33:38 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08D82C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 08:06:33 +0000 (UTC)
Received: (Authenticated sender: maxime.chevallier@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F28BBFF812;
 Wed, 12 Apr 2023 08:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1681286793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6sMvKzPXUQPaUNOAoXoB+ksyWApeu4V++9ieBbSNplg=;
 b=AIVwknBRq8FtcBddorKYDhaPsak6w1IVgxAE9xHvkAPQVErV8RYUDd6KxSE5Er7tT0vBOu
 Dr/zOZLwchd2skzKssKhhMzHtlpL5oBblK2V12mCHU6oe9I1HtLDHGB4/vBMJcOfGauOna
 /7B10RZPn3M+Nv+lOMkBQenM38zYKP5VBOJbbXyfvi5jYNYCDg8fX026aIiocQYbGAn6AX
 W+pGpnyr7cl1G6D2ikFwuDuOKEEbDerKgYAsUJma5XImsB7RJSV06/wDsp9Te9xu7VxRnf
 PwnvgufuGi3mvEukHNtihQcLj7fNZdeUqMZFl3gCWlhgmzNt+LDl5THknAdB0A==
Date: Wed, 12 Apr 2023 10:06:27 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20230412100627.1daab691@pc-288.home>
In-Reply-To: <ZDZi+fs13A8JJFOs@shell.armlinux.org.uk>
References: <20230412074850.41260-1-maxime.chevallier@bootlin.com>
 <ZDZi+fs13A8JJFOs@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Apr 2023 07:33:37 +0000
Cc: linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, thomas.petazzoni@bootlin.com,
 netdev@vger.kernel.org, "linux-stm32 @ st-md-mailman . stormreply .
 com" <linux-stm32@st-md-mailman.stormreply.com>,
 Sit Michael Wei Hong <michael.wei.hong.sit@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 "alexis . lothore @ bootlin . com" <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 davem@davemloft.net, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net] net: phylink: check for SFP bus
 presence in phylink_expects_phy
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

On Wed, 12 Apr 2023 08:51:21 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Wed, Apr 12, 2023 at 09:48:50AM +0200, Maxime Chevallier wrote:
> > When an SFP bus is present, we don't expect a PHY to be attached
> > directly from the MAC driver, it will be handled by phylink at SFP
> > attach time.  
> 
> If we have a SFP, then phylink should be configured for in-band mode.
> Maybe fix the firmware description instead?
> 

The DT used on that platform has the following configuration :

[...]
&gmac1 {
  status = "okay";
  phy-mode = "sgmii";
  managed = "in-band-status";
  sfp = <&sfp>;
[...]
}

Here phylink_expects_phy() returns true because although we use
in-band management, the link mode is set to sgmii, and
phylink_expects_phy() checks if we are in in-band mode AND 802.3z.

As we have an SFP and the link mode will be changed according to the
module we plug-in, there should be no problem switching phy-mode to
"1000BaseX", so I'm perfectly fine with this solution.

However, is it semantically correct to use sgmii here ? If so, it may be
a bit counter-intuitive to have to set the mode to 1000BaseX just so
that the phylink_expects_phy() check passes ?

Thanks for the quick reply,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
