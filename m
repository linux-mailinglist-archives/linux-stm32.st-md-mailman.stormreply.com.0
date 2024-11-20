Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E319D39A5
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 12:41:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC648C78F87;
	Wed, 20 Nov 2024 11:41:43 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A989C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2024 11:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pj3fkjxRBBRbKsik6UaWTJe/SP1ioAOvTFAZ8+3xNBI=; b=pIyXcthefqtcgadsqRc7qaaHRG
 hi6v7ChfC1RQB61X13RRO558mhfiV7ABPoiP+LbCJC5ykYHJp9gMouduUCMqwKwlSu9s+69cS+z8o
 Fcaxl3IrTM8U+lK75izHvfmo6U0tfHz1btxRHGekSWzD5d5UpI+RX4E8XO5C48sc0Lr8BBC8fENdJ
 9KnW8TS+sR5ecuJqMbFwRi24lKmbCsdaGT+hxPk4CAz7fGFwDF9ppHmRb5dRomHG0HYCHBW82Kde8
 lo8NIIH2JAQghOEBjMH1v5ssYwuHvFzxJgRwJK15sDP52FiGqKN47Uo+1MiEjoXL0H2lJYzf5483y
 akhr1DCQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44762)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tDj5F-0005PY-1e;
 Wed, 20 Nov 2024 11:41:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tDj5A-00073k-2J;
 Wed, 20 Nov 2024 11:41:16 +0000
Date: Wed, 20 Nov 2024 11:41:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <Zz3K3DnAkDgeNP7R@shell.armlinux.org.uk>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <20241115111151.183108-2-yong.liang.choong@linux.intel.com>
 <ZzdOkE0lqpl6wx2d@shell.armlinux.org.uk>
 <c1bb831c-fd88-4b03-bda6-d8f4ec4a1681@linux.intel.com>
 <ZzxerMEiUYUhdDIy@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZzxerMEiUYUhdDIy@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net v2 1/2] net: phy: replace
 phydev->eee_enabled with eee_cfg.eee_enabled
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

On Tue, Nov 19, 2024 at 10:47:24AM +0100, Oleksij Rempel wrote:
> On Tue, Nov 19, 2024 at 05:06:33PM +0800, Choong Yong Liang wrote:
> > Sorry for the late reply; I just got back from my sick leave. I wasn't aware
> > that you had already submitted a patch. I thought I should include it in my
> > patch series. However, I think I messed up the "Signed-off" part. Sorry
> > about that.
> > 
> > The testing part actually took quite some time to complete, and I was
> > already sick last Friday. I was only able to complete the patch series and
> > resubmit the patch, and I thought we could discuss the test results from the
> > patch series. The issue was initially found with EEE on GPY PHY working
> > together with ptp4l, and it did not meet the expected results. There are
> > many things that need to be tested, as it is not only Marvell PHY that has
> > the issue.
> 
> Hm, the PTP issue with EEE is usually related to PHYs implementing the
> EEE without MAC/LPI support.

I think you are referring to PHYs that implement EEE on their own,
without requiring support at the MAC, such as Atheros SmartEEE.

It wasn't clear that you aren't referring to a situation where the
PHY has EEE support, requiring the MAC to generate LPI but the MAC
does have that ability.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
