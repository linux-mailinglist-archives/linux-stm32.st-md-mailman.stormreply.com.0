Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OZPOqtQnmmNUgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 02:30:19 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9183D18EC8E
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 02:30:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B549C8F289;
	Wed, 25 Feb 2026 01:30:19 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2765C87ECA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 01:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ufDQ0fUtWsvfQhbjJOQTgw5KO2seGIzv7CfmCQnwbl4=; b=bdz8JTGrtOd6HiHj9Y+MNZFHuO
 KW3GozSU8occtDOwywyv+A/zkYXKCfGSx2eDoDaTO5WLbAFrqaO5xMZaAddvGE8goqEtFQS7Tprp8
 /oLuogpyyiWApdP4Ws3RoTXPvNfLDZeAuMVrWKY0bRLbIneT1GCqnzt1JcqJ2R8930m+S7mm/EyyL
 06UrcKGkM2k56QNKbrIh+lQ+AII/rj0DGgDA/RLr/EuEWqpcyUtnDcXKPoLwkkaXxid4TgpMbCLiS
 zhCncimJpHZy8CnqEVBNrVaQnTX20Oaj3Gh3XlneACqJ+ASGNnBQ3cJe1WtHeSbRJ+o+4hyltiw1R
 oBWn4Iqg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45494)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vv3j4-000000005rx-20ko;
 Wed, 25 Feb 2026 01:30:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vv3iz-000000000SO-1u9Q; Wed, 25 Feb 2026 01:30:01 +0000
Date: Wed, 25 Feb 2026 01:30:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <aZ5QmRjp_78ZT_Az@shell.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
 <E1vuSL5-0000000AScX-2wuM@rmk-PC.armlinux.org.uk>
 <20260224171052.27bebff0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260224171052.27bebff0@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <Frank.Li@nxp.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 08/10] net: stmmac: qcom-ethqos:
 use phy interface mode for inband
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:Frank.Li@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:kernel@pengutronix.de,m:netdev@vger.kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.933];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9183D18EC8E
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 05:10:52PM -0800, Jakub Kicinski wrote:
> On Mon, 23 Feb 2026 09:34:51 +0000 Russell King (Oracle) wrote:
> >  	switch (speed) {
> >  	case SPEED_2500:
> > -		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> > -			      RGMII_IO_MACRO_CONFIG2);
> > -		ethqos_set_serdes_speed(ethqos, SPEED_2500);
> > -		ethqos_pcs_set_inband(priv, false);
> > -		break;
> >  	case SPEED_1000:
> >  		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> >  			      RGMII_IO_MACRO_CONFIG2);
> > -		ethqos_set_serdes_speed(ethqos, SPEED_1000);
> > -		ethqos_pcs_set_inband(priv, true);
> 
> Not clear to me why rgmii_setmask() goes away in the 2.5G case?
> Just checking it's intentional..

It doesn't. The code ends up as:

	switch (speed) {
	case SPEED_2500:
	case SPEED_1000:
		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
			      RGMII_IO_MACRO_CONFIG2);
		break;

rather than being:

	switch (speed) {
	case SPEED_2500:
		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
			      RGMII_IO_MACRO_CONFIG2);
		break;
	case SPEED_1000:
		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
			      RGMII_IO_MACRO_CONFIG2);
		break;

which is needless duplication.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
