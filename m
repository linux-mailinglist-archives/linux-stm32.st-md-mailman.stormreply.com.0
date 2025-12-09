Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F86FCAFFED
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Dec 2025 14:01:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DCF7C5F1FB;
	Tue,  9 Dec 2025 13:01:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12AD4C5F1FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Dec 2025 13:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sNF4oF6tZY/gCkRoXoRliKrYOLDoPNsc6ELPW7Fexlw=; b=dg8D7Ezl56lz7o0YcwxLF/Bmeg
 CcIFUL2XuKHcnirSqdiMQfi1VEwVG2fcRFuuqkmrYMPEWXKozdGNJEyuqGfym/Pd/wazbbPyv10eF
 y2yfSQoSrwLvqXfFmq9RtdW0SEXpqVvIhbPLY4Z4CZ8qfobhMqlqmPvS0qNUv0nJH2ffDb7P08fdp
 koL5meuoOnDJDT5KsosqJJAfDWZL/8erH347C8mGM5dQGFs/O0cdKDEme9Ymkh0PF1nnRGtK8kNww
 O2R5UXMy7B2vPWp6tqgYOtVs8j6LsMz/S99GkiPF9B+1nlwdBEZC4UOXW0fHIoiOUTXXFzyGTcVl7
 q+JeZ6yg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49898)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vSxLA-000000000UH-3V0J;
 Tue, 09 Dec 2025 13:01:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vSxL5-0000000061g-329i; Tue, 09 Dec 2025 13:01:11 +0000
Date: Tue, 9 Dec 2025 13:01:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <aTgdlykiar3SlNox@shell.armlinux.org.uk>
References: <20251129-ext-ptp-2v-v2-1-d23aca3e694f@altera.com>
 <26656845-d9d6-4fd2-bfff-99996cf03741@redhat.com>
 <aTFuJUiLMnHrnpW5@shell.armlinux.org.uk>
 <9f0da5db-e92a-42e2-b788-2b07b8d28cfa@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9f0da5db-e92a-42e2-b788-2b07b8d28cfa@altera.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Fugang Duan <fugang.duan@nxp.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
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

On Tue, Dec 09, 2025 at 06:01:05PM +0530, G Thomas, Rohan wrote:
> Hi Russell,
> 
> Thanks for reviewing the patch.
> 
> On 12/4/2025 4:49 PM, Russell King (Oracle) wrote:
> > On Thu, Dec 04, 2025 at 10:58:40AM +0100, Paolo Abeni wrote:
> > > On 11/29/25 4:07 AM, Rohan G Thomas wrote:
> > > > For E2E delay mechanism, "received DELAY_REQ without timestamp" error
> > > > messages show up for dwmac v3.70+ and dwxgmac IPs.
> > > > 
> > > > This issue affects socfpga platforms, Agilex7 (dwmac 3.70) and
> > > > Agilex5 (dwxgmac). According to the databook, to enable timestamping
> > > > for all events, the SNAPTYPSEL bits in the MAC_Timestamp_Control
> > > > register must be set to 2'b01, and the TSEVNTENA bit must be cleared
> > > > to 0'b0.
> > > > 
> > > > Commit 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism") already
> > > > addresses this problem for all dwmacs above version v4.10. However,
> > > > same holds true for v3.70 and above, as well as for dwxgmac. Updates
> > > > the check accordingly.
> > > > 
> > > > Fixes: 14f347334bf2 ("net: stmmac: Correctly take timestamp for PTPv2")
> > > > Fixes: f2fb6b6275eb ("net: stmmac: enable timestamp snapshot for required PTP packets in dwmac v5.10a")
> > > > Fixes: 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism")
> > > > Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> > > > ---
> > > > v1 -> v2:
> > > >     - Rebased patch to net tree
> > > >     - Replace core_type with has_xgmac
> > > >     - Nit changes in the commit message
> > > >     - Link: https://lore.kernel.org/all/20251125-ext-ptp-fix-v1-1-83f9f069cb36@altera.com/
> > > 
> > > Given there is some uncertain WRT the exact oldest version to be used,
> > > it would be great to have some 3rd party testing/feedback on this. Let's
> > > wait a little more.
> > 
> > As I said, in the v3.74 documentation, it is stated that the SNAPTYPSEL
> > functions changed between v3.50 and v3.60, so I think it would be better
> > to propose a patch to test for < v3.6.
> > 
> 
> I tested this on socfpga platforms like Agilex7 which are using
> 3.7x, but don't have any platforms with dwmac <= v3.6.
> 
> > Alternatively, if someone has the pre-v3.6 databook to check what the
> > SNAPTYPSEL definition is and compare it with the v3.6+ definition, that
> > would also be a good thing to do.
> > 
> >  From the 3.74:
> > 
> > SNAPTYPSEL
> > 00		?
> > 01		?
> > 10		Sync, Delay_Req
> > 11		Sync, PDelay_Req, PDelay_Resp
> > 
> > TSEVNTENA
> > 0		All messages except Announce, Management and Signalling
> > 1		Sync, Delay_Req, PDelay_Req, PDelay_Resp
> > 
> > No table is provided, so it's difficult to know what all the bit
> > combinations do for v3.74.
> 
> In 3.73a databook, Table 6-70 has the following information and this is
> similar to v5.1 and v5.3. But don't have 3.74 databook.
> 
> SNAPTYPSEL	TSMSTRENA	TSEVNTENA	PTP Messages
> 00		X 		0 		SYNC, Follow_Up,
> 						Delay_Req, Delay_Resp
> 00 		0 		1 		SYNC
> 00 		1 		1 		Delay_Req
> 01 		X 		0 		SYNC, Follow_Up,
> 						Delay_Req, Delay_Resp,
> 						Pdelay_Req, Pdelay_Resp,
> 						Pdelay_Resp_Follow_Up
> 01 		0 		1 		SYNC, Pdelay_Req,
> 						Pdelay_Resp
> 01 		1 		1 		Delay_Req, Pdelay_Req,
> 						Pdelay_Resp
> 10 		X 		X 		SYNC, Delay_Req
> 11 		X 		X 		Pdelay_Req, Pdelay_Resp

I can't fathom why they would use this table in v3.73a, then put
something different in v4.2, and then go back to this table in
v5.1, so I'm wondering whether any of these tables can be relied
upon. This seems to be a complete mess.

I think the only way out of this is to test this - and I wonder
whether stmmac_selftests.c could have tests added to check which
PTP messages and in which direction get timestamped in each of
these modes.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
