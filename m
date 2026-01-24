Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGziBXUPdGmp1wAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 01:16:53 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2CE7BA0E
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 01:16:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 532E3C87EDF;
	Sat, 24 Jan 2026 00:16:52 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45DCEC030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Jan 2026 00:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iZB71uqjML4w9rR8etBjxBLKoRFzZrwDxpZiOxS2Ois=; b=vRSuX8oU8/P4wCgCBM9K3rqdta
 ZFSOeo9EMGRE8fRWUz+5xUaBJKm20kbE8f092osZzm89zIJIQMOMjSriMMCx+XzmPJuvFYIdJShSj
 C6RH1gHbjhksFQ7BeCFZS5qInVkMFvhmwAXsQYeSqxE6Xfw47SLPKSSm+sJZ1GOhDDbMQtnNxDXb8
 y/Ce8GNmcD+0y9WBB7GJhtLZ+wXCCKYyAABUYjOQ5L94CV5sVvOuiKsLow80eINl7lIQntrIo3zVZ
 7wAHOswmVW9EA6HQCubITsqcIvNYR0Zkw7w1IXGFjQPET7Lx6RkeLP39OW85A2itOp5AKlNrfwpdT
 Qo3GrNvg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33206)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vjRKT-000000002e4-0vPd;
 Sat, 24 Jan 2026 00:16:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vjRKP-000000002Xd-1kQd; Sat, 24 Jan 2026 00:16:37 +0000
Date: Sat, 24 Jan 2026 00:16:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <aXQPZfRQl2wpQ3Sx@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXNX1oi7nWLcPK28@shell.armlinux.org.uk>
 <20260124000409.36nsxlvkde4zpddk@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260124000409.36nsxlvkde4zpddk@skbuf>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Andrew Lunn <andrew@lunn.ch>, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS,
 BASE-X, and inband goodies
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
X-Rspamd-Server: lfdr
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
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:olteanv@gmail.com,m:konrad.dybcio@oss.qualcomm.com,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,armlinux.org.uk:url]
X-Rspamd-Queue-Id: AF2CE7BA0E
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 02:04:09AM +0200, Vladimir Oltean wrote:
> On Fri, Jan 23, 2026 at 11:13:26AM +0000, Russell King (Oracle) wrote:
> > According to patchwork, this doesn't apply to net-next. That's odd,
> > it was generated on last night's net next, and although there has been
> > further work, it rebases cleanly on top of this morning's. How can
> > these changes:
> > 
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   |  6 +++++-
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++++++++++++----
> >  2 files changed, 21 insertions(+), 5 deletions(-)
> > 
> > which happened in net-next overnight result in this change in patch 1:
> > 
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > failing to apply?
> > 
> > No, patchwork is clearly wrong.
> 
> Conflicts with commit dc6597fab3e3 ("net: stmmac: dwmac-imx: keep
> preamble before sfd on i.MX8MP"), merged in the meantime.
> 
> In include/linux/stmmac.h (your commit "net: stmmac: add stmmac core
> serdes support" adds a "struct phy;" line, but that other commit
> modifies the context by inserting:
> 
> #define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD	BIT(14)
> 
> (the last stmmac flag in your context, at patch generation time, was:
> #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
> )

I still maintain that this is silly - to mark all patches as such
and without any details about the problem applying the patches is
not helpful.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
