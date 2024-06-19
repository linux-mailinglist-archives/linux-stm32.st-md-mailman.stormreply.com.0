Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1AC90F841
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 23:07:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BB49C6A613;
	Wed, 19 Jun 2024 21:07:46 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02EABC5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 21:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=apkHiW2X6RnjMVqGxxO930mZZqBygksKAzUjVPVtHeo=; b=Wul1SQyfHjvOBkw3PAVi9q4N3W
 9GA/iJg5pesd7SSsJ0aSHQLtT63biBvLKb+LH2EUDgD152ZdphHFPeowup7b6dAAZ/qvcGeu0Xrmb
 snb+lKOWTj0piaejkVboQJPFYAdF/KUu0W6nmvFqjGDuKheObVZHOlWO6Nu2TBvNeMhFpv+5Vt1Zi
 u6VT2qynIhDC49gouf8dLQnHhhMQav19yWujBsmyhaSb7zHhro2ViWj2GnaQS+L/VQuAS7pCSZSE5
 yQEfkcZxBpkHFhlKqoh1DXjUKksB5pnOzl0b/nRbneZ0dvF4C3A6RLaOAld0FN8+g6Sbyh3jjAAYw
 56RkOMXg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57470)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sK2WX-0000tM-2V;
 Wed, 19 Jun 2024 22:07:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sK2WX-00072L-Ov; Wed, 19 Jun 2024 22:07:21 +0100
Date: Wed, 19 Jun 2024 22:07:21 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZnNIib8GEpvAOlGd@shell.armlinux.org.uk>
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-2-brgl@bgdev.pl>
 <bedd74cb-ee1e-4f8d-86ee-021e5964f6e5@lunn.ch>
 <CAMRc=MeCcrvid=+KG-6Pe5_-u21PBJDdNCChVrib8zT+FUfPJw@mail.gmail.com>
 <160b9abd-3972-449d-906d-71d12b2a0aeb@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160b9abd-3972-449d-906d-71d12b2a0aeb@lunn.ch>
Cc: linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/8] net: phy: add support for
	overclocked SGMII
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

On Wed, Jun 19, 2024 at 09:51:12PM +0200, Andrew Lunn wrote:
> phylib supports out of band signalling, which is enough to make this
> work, so long as two peers will actually establish a link because they
> are sufficiently tolerant of what the other end is doing. Sometimes
> they need a hint. Russell King has been working on this mess, and i'm
> sure he will be along soon.

... and I'm rolling my eyes, wondering whether I will get time to
finish the code that I started any time soon. I'll note that the more
hacky code we end up merging, the harder it will become to solve this
problem (and we already have several differing behaviours merged with
2500base-X already.)

> What i expect will happen is you keep calling this 2500BaseX, without
> in band signalling. You can look back in the netdev mailling list for
> more details and those that have been here before you. It is always
> good to search the history, otherwise you are just going to repeat it.

That's where things start getting sticky, because at the moment,
phylink expects 2500base-X to be like 1000base-X, and be a media
interface mode rather than a MAC-to-PHY interface mode. This is partly
what my patches will address if I can get around to finishing them -
but at this point I really do not know when that will be.

I still have the high priority work problem that I'm actively involved
with. I may have three weeks holiday at the start of July (and I really
need it right now!) Then, there's possibly quite a lot of down time in
August because I'm having early cataract ops which will substantially
change my eye sight. There's two possible outcomes from that. The best
case is that in just over two weeks after the first op, I'll be able to
read the screen without glasses. The worst case is that I have to wait
a further two to three weeks to see my optometrist (assuming he has
availability), and then wait for replacement lenses to be made up,
fitted and the new glasses sent.

So, I'm only finding the occasional time to be able to look at
mainline stuff, and I don't see that changing very much until maybe
September.

At this point, I think we may as well give up and let people do
whatever they want to do with 2500base-X (which is basically what we're
already doing), and when they have compatibility problems... well...
really not much we can do about that, and it will be way too late to
try and sort the mess out.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
