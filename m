Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMLmEgJ3xWnw+QQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2026 19:12:18 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65225339D5E
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2026 19:12:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F309AC8F26C;
	Thu, 26 Mar 2026 18:12:16 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8085C8F268
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2026 18:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ji45NUWbwmYmtJWis87trG6dXs16U0uRXqDBTnsy5d4=; b=mAWrfpvOlFfajgP5bFr/ohHOiA
 1QPBL3YZnDhT3I0lLAI2A8ejzh1khwXIIIlePLo6ivYWUVBAGAQy6A2GU1zBq5zM1kgnU1ILI/7aT
 6+bckNXZKZfbJrK+n5XOCoOxHpWJwkcBYCUd8Py71xIDe2hKglU2ktIDZA62zvZq4GzIFu+Z42HZf
 4tD/jRwlnJmeiVEMZbzZDyxj2F3YdFmBbLa9BCXi3otIaZb1H+xuGGgTjvazJhCCtIbuLplgyZwGm
 zOMVqdlpSrwJxH6wuXq+dbMDonDyugML57jeQwYfois/7z+HMwrPJM4W3foKfQI8eEMy3WOE3WilH
 SXgUClFw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53576)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w5pBg-0000000059C-218X;
 Thu, 26 Mar 2026 18:12:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w5pBe-000000007Fq-2PgA; Thu, 26 Mar 2026 18:12:06 +0000
Date: Thu, 26 Mar 2026 18:12:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Message-ID: <acV29ruRVy_fcwDq@shell.armlinux.org.uk>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
 <E1w51Xs-0000000DwVV-2bnh@rmk-PC.armlinux.org.uk>
 <20260326180453.GU111839@horms.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260326180453.GU111839@horms.kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 03/15] net: stmmac: qcom-ethqos:
 eliminate configure_func
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
	FORGED_RECIPIENTS(0.00)[m:horms@kernel.org,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.771];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,shell.armlinux.org.uk:mid,stormreply.com:email,stormreply.com:url,armlinux.org.uk:email,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 65225339D5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 06:04:53PM +0000, Simon Horman wrote:
> On Tue, Mar 24, 2026 at 01:11:44PM +0000, Russell King (Oracle) wrote:
> > Since ethqos_fix_mac_speed() is called via a function pointer, and only
> > indirects via the configure_func function pointer, eliminate this
> > unnecessary indirection.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> ...
> 
> > @@ -623,14 +627,6 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
> >  	ethqos_pcs_set_inband(ethqos, interface == PHY_INTERFACE_MODE_SGMII);
> >  }
> >  
> > -static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
> > -				 int speed, unsigned int mode)
> > -{
> > -	struct qcom_ethqos *ethqos = priv;
> > -
> > -	ethqos->configure_func(ethqos, interface, speed);
> > -}
> > -
> >  static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
> >  {
> >  	struct qcom_ethqos *ethqos = priv;
> 
> Hi Russell,
> 
> FYI, AI generated review reports that the comment in ethqos_clks_config()
> that references ethqos_fix_mac_speed() should also be updated.

Also already noted (yesterday).

I do keep an eye on patchwork for my own patches - I have a firefox tab
permanently open for my patches in patchwork:

https://patchwork.kernel.org/project/netdevbpf/list/?submitter=165511

Thanks anyway.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
