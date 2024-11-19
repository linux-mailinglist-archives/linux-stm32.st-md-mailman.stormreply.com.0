Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE8B9D22BC
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 10:47:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B52EC78F97;
	Tue, 19 Nov 2024 09:47:56 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52B42C78F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 09:47:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1tDKpT-0005uf-6K; Tue, 19 Nov 2024 10:47:27 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1tDKpQ-001Xed-1N;
 Tue, 19 Nov 2024 10:47:24 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1tDKpQ-003HSG-10;
 Tue, 19 Nov 2024 10:47:24 +0100
Date: Tue, 19 Nov 2024 10:47:24 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <ZzxerMEiUYUhdDIy@pengutronix.de>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <20241115111151.183108-2-yong.liang.choong@linux.intel.com>
 <ZzdOkE0lqpl6wx2d@shell.armlinux.org.uk>
 <c1bb831c-fd88-4b03-bda6-d8f4ec4a1681@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1bb831c-fd88-4b03-bda6-d8f4ec4a1681@linux.intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
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

On Tue, Nov 19, 2024 at 05:06:33PM +0800, Choong Yong Liang wrote:
> 
> 
> On 15/11/2024 9:37 pm, Russell King (Oracle) wrote:
> > On Fri, Nov 15, 2024 at 07:11:50PM +0800, Choong Yong Liang wrote:
> > > Not all PHYs have EEE enabled by default. For example, Marvell PHYs are
> > > designed to have EEE hardware disabled during the initial state.
> > > 
> > > In the initial stage, phy_probe() sets phydev->eee_enabled to be disabled.
> > > Then, the MAC calls phy_support_eee() to set eee_cfg.eee_enabled to be
> > > enabled. However, when phy_start_aneg() is called,
> > > genphy_c45_an_config_eee_aneg() still refers to phydev->eee_enabled.
> > > This causes the 'ethtool --show-eee' command to show that EEE is enabled,
> > > but in actuality, the driver side is disabled.
> > > 
> > > This patch will remove phydev->eee_enabled and replace it with
> > > eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(),
> > > it will follow the master configuration to have software and hardware
> > > in sync.
> > 
> > Hmm. I'm not happy with how you're handling my patch. I would've liked
> > some feedback on it (thanks for spotting that the set_eee case needed
> > to pass the state to genphy_c45_an_config_eee_aneg()).
> > 
> > However, what's worse is, that the bulk of this patch is my work, yet
> > you've effectively claimed complete authorship of it in the way you
> > are submitting this patch. Moreover, you are violating the kernel
> > submission rules, as the Signed-off-by does not include one for me
> > (which I need to explicitly give.) I was waiting for the results of
> > your testing before finalising the patch.
> > 
> > The patch needs to be authored by me, the first sign-off needs to be
> > me, then optionally Co-developed-by for you, and then your sign-off.
> > 
> > See Documentation/process/submitting-patches.rst
> > 
> > Thanks.
> > 
> > pw-bot: cr
> > 
> 
> Sorry for the late reply; I just got back from my sick leave. I wasn't aware
> that you had already submitted a patch. I thought I should include it in my
> patch series. However, I think I messed up the "Signed-off" part. Sorry
> about that.
> 
> The testing part actually took quite some time to complete, and I was
> already sick last Friday. I was only able to complete the patch series and
> resubmit the patch, and I thought we could discuss the test results from the
> patch series. The issue was initially found with EEE on GPY PHY working
> together with ptp4l, and it did not meet the expected results. There are
> many things that need to be tested, as it is not only Marvell PHY that has
> the issue.

Hm, the PTP issue with EEE is usually related to PHYs implementing the
EEE without MAC/LPI support. This PHYs are buffering frames and changing
the transmission time, so if the time stamp is made by MAC it will have
different real transmission time. So far i know, Atheros and Realtek
implement it, even if it is not always officially documented, it can be
tested.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
