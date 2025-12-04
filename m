Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A930CA368B
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Dec 2025 12:19:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5679C58D77;
	Thu,  4 Dec 2025 11:19:24 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 498C3C3F95E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Dec 2025 11:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k3+IvcN5Cb0nJ6VY6yDksNa4bwyh6/su6R64NgY1qyg=; b=niif8Ri3Pr6EIrYqqNhb3vmNvQ
 uOhFIpjmURLVVntX8gXkZYAcVnw4wwsFiHVnoGRbXtjLF55vzyiZVBC9YKVq88t+bg+/VC/LJog0+
 YNFUP/WoCBH28h5O4qjhgx8r2eYtnY6+w/EMWRz400ttTS5TXBdXrWTT3+Hixf6mpLunEWCZSWH47
 9nmzvATT2UfIb/JiZUlteOrMSeO8PV4uQGVsFXJA0za0BGOybVbaTVFyAtv1auWpYVs889xt3OKJc
 MMFH2wROwaUTpOr/vt6Pbjppxbrh2MrTgqFg6GIGDJYy0YAACEDPtBbSx1h4u0swldFg9UxItkKBO
 vGv85reg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40064)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vR7MY-000000003Sm-2E0E;
 Thu, 04 Dec 2025 11:19:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vR7MT-000000000yA-3MBl; Thu, 04 Dec 2025 11:19:01 +0000
Date: Thu, 4 Dec 2025 11:19:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Paolo Abeni <pabeni@redhat.com>
Message-ID: <aTFuJUiLMnHrnpW5@shell.armlinux.org.uk>
References: <20251129-ext-ptp-2v-v2-1-d23aca3e694f@altera.com>
 <26656845-d9d6-4fd2-bfff-99996cf03741@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26656845-d9d6-4fd2-bfff-99996cf03741@redhat.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Fugang Duan <fugang.duan@nxp.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Rohan G Thomas <rohan.g.thomas@altera.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: Fix E2E delay
	mechanism
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

On Thu, Dec 04, 2025 at 10:58:40AM +0100, Paolo Abeni wrote:
> On 11/29/25 4:07 AM, Rohan G Thomas wrote:
> > For E2E delay mechanism, "received DELAY_REQ without timestamp" error
> > messages show up for dwmac v3.70+ and dwxgmac IPs.
> > 
> > This issue affects socfpga platforms, Agilex7 (dwmac 3.70) and
> > Agilex5 (dwxgmac). According to the databook, to enable timestamping
> > for all events, the SNAPTYPSEL bits in the MAC_Timestamp_Control
> > register must be set to 2'b01, and the TSEVNTENA bit must be cleared
> > to 0'b0.
> > 
> > Commit 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism") already
> > addresses this problem for all dwmacs above version v4.10. However,
> > same holds true for v3.70 and above, as well as for dwxgmac. Updates
> > the check accordingly.
> > 
> > Fixes: 14f347334bf2 ("net: stmmac: Correctly take timestamp for PTPv2")
> > Fixes: f2fb6b6275eb ("net: stmmac: enable timestamp snapshot for required PTP packets in dwmac v5.10a")
> > Fixes: 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism")
> > Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> > ---
> > v1 -> v2:
> >    - Rebased patch to net tree
> >    - Replace core_type with has_xgmac
> >    - Nit changes in the commit message
> >    - Link: https://lore.kernel.org/all/20251125-ext-ptp-fix-v1-1-83f9f069cb36@altera.com/
> 
> Given there is some uncertain WRT the exact oldest version to be used,
> it would be great to have some 3rd party testing/feedback on this. Let's
> wait a little more.

As I said, in the v3.74 documentation, it is stated that the SNAPTYPSEL
functions changed between v3.50 and v3.60, so I think it would be better
to propose a patch to test for < v3.6.

Alternatively, if someone has the pre-v3.6 databook to check what the
SNAPTYPSEL definition is and compare it with the v3.6+ definition, that
would also be a good thing to do.

From the 3.74:

SNAPTYPSEL
00		?
01		?
10		Sync, Delay_Req
11		Sync, PDelay_Req, PDelay_Resp

TSEVNTENA
0		All messages except Announce, Management and Signalling
1		Sync, Delay_Req, PDelay_Req, PDelay_Resp

No table is provided, so it's difficult to know what all the bit
combinations do for v3.74.

From STM32MP151 documentation (v4.2 according to GMAC4_VERSION
register):

SNAPTYPSEL	TSMSTRENA	TSEVNTENA
00		x		0		Sync, Delay_Req
00		0		1		Delay_Req
00		1		1		Sync
01		x		0		Sync, PDelay_Req, PDelay_Resp
01		0		1		Sync, Delay_Req, PDelay_Req,
						PDelay_Resp
01		1		1		Sync, PDelay_Req, PDelay_Resp
10		x		x		Sync, Delay_Req
11		x		x		Sync, PDelay_Req, PDelay_Resp

For iMX8MP (v5.1) and STM32MP23/25xx (v5.3) documentatiion:

SNAPTYPSEL	TSMSTRENA	TSEVNTENA
00		x		0		Sync, Follow_Up, Delay_Req,
						Delay_Resp
00		0		1		Sync
00		1		1		Delay_Req
01		x		0		Sync, Follow_Up, Delay_Req,
						Delay_Resp, PDelay_Req,
						PDelay_Resp
01		0		1		Sync, PDelay_Req, PDelay_Resp
01		1		1		Delay_Req, PDelay_Req,
						PDelay_Resp
10		x		x		Sync, Delay_Req
11		x		x		PDelay_Req, PDelay_Resp

Differences:
00 x 0 - adds Follow_Up
00 X 1 - TSMSTRENA bit inverted
01 x 0 - adds Follow_Up, Delay_Req, Delay_Resp
01 0 1 - removes Delay_Req
01 1 1 - removes Sync, adds Delay_Req
11 x x - removes Sync

So, it looks like there's another difference between v4.2 and v5.1.

If the STM32MP151 (v4.2) documentation is correct, then from what I see
in the driver, if HWTSTAMP_FILTER_PTP_V1_L4_SYNC is requested, we set
SNAPTYPSEL=00 TSMSTRENA=0 TSEVNTENA=1, which semects Delay_Req messages
only, but on iMX8MP this selects Sync messages.

HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ is the opposite (due to the
inversion of TSMSTRENA) for SNAPTYPSEL=00.

For HWTSTAMP_FILTER_PTP_V2_EVENT, we currently set SNAPTYPSEL=01
TSMSTRENA=0 and TSEVNTENA=1 for cores < v4.1:
- For STM32MP151 (v4.2) we get Sync, PDelay_Req, PDelay_Resp but
  _not_ Delay_Req. Seems broken.
- For iMX8MP (v5.1) and STM32MP23/25xx (v5.3), we get
  Sync, Follow_Up, Delay_Req, Delay_Resp, PDelay_Req, PDelay_Resp

Basically, the conclusion I am coming to is that Synopsys's idea
of "lets tell the hardware what _kind_ of PTP clock we want to be,
whether we're master, etc" is subject to multiple revisions in
terms of which messages each mode selects, and it would have been
_far_ simpler and easier to understand had they just provided a
16-bit bitfield of message types to accept.

So, I'm wary about this change - I think there's more "mess"
here than just that single version check in
HWTSTAMP_FILTER_PTP_V2_EVENT, I think it's a lot more complicated.
I'm not sure what the best solution is right now, because I don't
have the full information, but it looks to me like the current
approach does not result in the expected configuration for each
of the dwmac core versions, and there are multiple issues here.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
