Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0epBFQd5ymka9QUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 15:22:15 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D41DE35BD78
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Mar 2026 15:22:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 442E0C8F269;
	Mon, 30 Mar 2026 13:22:14 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6ED31C8F260
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2026 13:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=neu4ARCwcfoinhz170R6LNmDJUciz9Vr0r4/+mMh+SI=; b=0gEg9KebiJm2KpoeNAh/J7egLy
 BASIfKM3/qG1q4MpPqWRIHSzKy9xyMNPDWm78WnSMZQHQ5amOmm4E7FCwK1OH2RhKPSFIGrCJDegJ
 VNQvnlysdvTZ7Zij3PesRxgZ9MNE+EsosQ0lwiSbLPbwzzZVYXsH8+Ld9WIyGpyQkMshGlkwiJDso
 sE/9KiMQ3U7uxLxH9wU/2uVOz3NHe1g/62zeUA+mWGV3o2CrrBV1maSW9o3nhJ+9BnT0K9KkNPcx8
 RyxMeayliIB1F8xfFm8dxKdM+fY0s4ZMADAOoODFmPJjP9o5dwb9D8VSNBT48GQSUdUTEsjNXEQqM
 zNjCqXyQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35698)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w7CZ8-000000000X1-3ZfD;
 Mon, 30 Mar 2026 14:22:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w7CZ5-000000002hc-2jMj; Mon, 30 Mar 2026 14:21:59 +0100
Date: Mon, 30 Mar 2026 14:21:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <acp490PTrVCWjiqT@shell.armlinux.org.uk>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
 <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
 <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
 <0d650de4-eb45-481b-8c39-1bf455b948c9@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d650de4-eb45-481b-8c39-1bf455b948c9@lunn.ch>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next] net: stmmac: qcom-ethqos:
	set clk_csr
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:konrad.dybcio@oss.qualcomm.com,m:mohd.anwar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.892];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,armlinux.org.uk:url]
X-Rspamd-Queue-Id: D41DE35BD78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 02:35:39PM +0200, Andrew Lunn wrote:
> On Mon, Mar 30, 2026 at 01:20:18PM +0100, Russell King (Oracle) wrote:
> > On Mon, Mar 30, 2026 at 01:18:56PM +0200, Konrad Dybcio wrote:
> > > On 3/27/26 6:02 PM, Russell King (Oracle) wrote:
> > > > The clocks for qcom-ethqos return a rate of zero as firmware manages
> > > > their rate. According to hardware documentation, the clock which is
> > > > fed to the slave AHB interface can crange between 50 and 100MHz.
> > > 
> > > FWIW this __may__ possibly differ between platforms, but I'm not sure
> > > to what degree. Will there be visible impact if we e.g. have a 200 or
> > > 300 MHz clock somewhere?
> > 
> > When you add other platforms, you're going to have to deal with their
> > differences.
> > 
> > IEEE 802.3 states that the maximum clock rate for the MDIO bus is
> > 2.5MHz. You need to ensure that is the case.
> > 
> > Current qcom-ethqos code doesn't set clk_csr, and returns zero for
> > clk_get_rate() on the stmmac clocks because they are managed entirely
> > in firmware.
> 
> Could a fixed clock be used in DT to represent clk_csr? Different
> platforms then set it to different frequencies, to represent whatever
> the firmware is doing.

Unfortunately, at hardware level, clk_csr isn't a separate clock input
as such. It can be one of many, depending on the synthesis options
chosen by the designer. It may be hclk (AHB clock), aclk (AXI clock)
clk_app (application clock) or a specific clk_csr input.

Nothing is simple with dwmac. :/

The problem with adding a ficticious clock to solve this is that it
adds to implementers confusion for what is already a very complicated
problem.

We've already seen that the stmmac clocks are a total trainwreck
because no one seems to really understnad what is what, and that goes
back to the days when that "apb" clock was added - and that made the
situation worse not better.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
