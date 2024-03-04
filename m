Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E9C87046A
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Mar 2024 15:41:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77D63C6B45E;
	Mon,  4 Mar 2024 14:41:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97EA3C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Mar 2024 14:41:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C28A51BF20C;
 Mon,  4 Mar 2024 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709563296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JB4712Zmm5XygfOkhRNsGTmf84IUmoX3p3owXLkMnrY=;
 b=pwOLp/q2NMfAhLnUpRwHw4RnWdElX/CLSXWTpOPs0zic6ZiTu5twmlh+kERXKoYgZRylLJ
 CQw8z4GeHv3qna7mFij6jURThx5evriRiOmvGL3b8HV5IB+SdT0psjNX9numwZl+QB2bXe
 jedsjxzbt0X9lErHaDSsAqf5ryoROSNB2n1LIUPryWOxeiKnBHOGRhjDSIKmM8f6EiE+Wf
 mTLhjBGV/r0DjRFnERtQTF3SucXLgJDgoSG/b03xaLlPP8mn0qi1ilxhQIcsKB3Q+kVRfw
 ONwmaD9NSjdj0MZOY8kPPO5iLWD7orf4Z+eiFstCwU14FchxGjELfaYaEtFJuQ==
Date: Mon, 4 Mar 2024 15:42:06 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
In-Reply-To: <ZeXbV2hIBs7OcEDK@shell.armlinux.org.uk>
Message-ID: <1a5ba9e2-9cf2-00be-3a0f-03a8d6bfb04c@bootlin.com>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
 <20240301-rxc_bugfix-v5-1-8dac30230050@bootlin.com>
 <ZeXbV2hIBs7OcEDK@shell.armlinux.org.uk>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v5 1/7] net: phylink: add
 PHY_F_RXC_ALWAYS_ON to PHY dev flags
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

On Mon, 4 Mar 2024, Russell King (Oracle) wrote:

> > the PHY goes into suspend.
> > 
> > Signed-off-by: Russell King <linux@armlinux.org.uk>
> 
> This is not the sign-off I sent you with my patches. At the very least,
> it doesn't acknowledge my employer, and also has the wrong email address
> that I use for _all_ my kernel attributations. Therefore, I can
> definitively say that that you made this up. Please correct it back to
> the sign-off in my patches that you derived this combined work from.

My apologies, I'll fix the commit tags.

Best Regards,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
