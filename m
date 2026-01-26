Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKgwOHyJd2m9hgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 16:34:20 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 750218A30F
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 16:34:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2510DC87EDB;
	Mon, 26 Jan 2026 15:34:20 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12FBFC030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 15:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eae6B3pYhJ65yiJ/woVw/sITqVU+XQC0UckLLwclRkM=; b=PVSXX3paoP2wq8qCHoHUZWhYIi
 dqkW3/AGt5t0PjIhJjxoPF0ZRs/xbuaZu/ZFrL1mXcQhocrCS0ZakfIFYnjtaq2nylaFQeC6qGPZX
 jzLRSTfuqZSpz4sXdVekpqz2JckScisybCNTXK79Vt4gJgOSOF8x/96DmjN3NXynVHudSQhJD+dEn
 cL7XXmLLXnqxnoRcY15Lqrn+B1qRv/e9GfCkl0nusIb0doBZRmBOxEes7qBffEXjPleMKNYn2dKj/
 rhXiCC4uttqL/6NFsuQeNlXBUfAUfbOeeGmOp8aPbe2610SqOXXhYp55nRKb1YjbEtuENctuIIhFE
 6bvIprsA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54392)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vkObG-0000000051g-3n3m;
 Mon, 26 Jan 2026 15:33:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vkObC-00000000530-35q3; Mon, 26 Jan 2026 15:33:54 +0000
Date: Mon, 26 Jan 2026 15:33:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Message-ID: <aXeJYo-0iiNuXVGH@shell.armlinux.org.uk>
References: <8f2139e8adf02b485a4c84d558fc23f78cf04add.1769195864.git.dan.carpenter@linaro.org>
 <20260126152430.1390514-1-horms@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260126152430.1390514-1-horms@kernel.org>
Cc: imx@lists.linux.dev, s32@nxp.com, Frank.li@nxp.com, edumazet@google.com,
 ghennadi.procopciuc@oss.nxp.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, dan.carpenter@linaro.org,
 robh@kernel.org, kuba@kernel.org, pabeni@redhat.com, linaro-s32@linaro.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, kernel@pengutronix.de,
 s.hauer@pengutronix.de, jan.petrous@oss.nxp.com,
 linux-arm-kernel@lists.infradead.org, chester62515@gmail.com,
 mbrugger@suse.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org,
 shawnguo@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [v4,
 1/3] net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
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
	URIBL_MULTI_FAIL(0.00)[linux.dev:server fail,stormreply.com:server fail,shell.armlinux.org.uk:server fail,stm-ict-prod-mailman-01.stormreply.prv:server fail,st-md-mailman.stormreply.com:server fail,armlinux.org.uk:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:horms@kernel.org,m:imx@lists.linux.dev,m:s32@nxp.com,m:Frank.li@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:dan.carpenter@linaro.org,m:robh@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:linaro-s32@linaro.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:kernel@pengutronix.de,m:s.hauer@pengutronix.de,m:jan.petrous@oss.nxp.com,m:linux-arm-kernel@lists.infradead.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.982];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,linaro.org,kernel.org,redhat.com,vger.kernel.org,pengutronix.de,lists.infradead.org,suse.com,lunn.ch,davemloft.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,linux.dev:url,armlinux.org.uk:url,stormreply.com:url,stormreply.com:email,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 750218A30F
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 03:24:30PM +0000, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
>     net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
> 
> This commit adds syscon/regmap support for accessing the GMAC_0_CTRL_STS
> register on s32 chipsets, while maintaining backwards compatibility with
> the existing direct MMIO approach for older device trees.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > index 5a485ee98fa7..2e6bb41f49e1 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> 
> [ ... ]
> 
> > @@ -40,7 +44,10 @@ struct s32_priv_data {
> >
> >  static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
> >  {
> > -	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> > +	if (gmac->ctrl_sts)
> > +		writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
> > +	else
> > +		regmap_write(gmac->sts_regmap, gmac->sts_offset, S32_PHY_INTF_SEL_RGMII);
> 
> Should the regmap_write() return value be checked here? The function
> returns int and the caller s32_gmac_init() checks the return value
> expecting errors to be propagated. For comparison, dwmac-sun55i.c in
> sun55i_gmac200_set_syscon() does check regmap_write() return value:
> 
>     ret = regmap_write(regmap, SYSCON_REG, reg);
>     if (ret < 0)
>         return dev_err_probe(dev, ret, "Failed to write to syscon\n");

AI is wrong on this last line - s32_gmac_write_phy_intf_select() is
called from s32_gmac_init(), which is called from plat_dat->init.

plat_dat->init is called from two paths:

1. stmmac_pltfr_probe() -> stmmac_dvr_probe() -> plat_dat->init()

2. stmmac_resume() -> plat_dat->resume() -> stmmac_plat_resume() ->
   stmmac_pltfr_init() -> plat_dat->init()

In the resume path, it is not appropriate to use dev_err_probe()
because we're not in the probe path.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
