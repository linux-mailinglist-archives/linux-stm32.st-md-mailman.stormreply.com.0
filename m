Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHkhGKaa3GkxUAkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 09:26:30 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BBF3E831A
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 09:26:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB9E6C36B3C;
	Mon, 13 Apr 2026 07:26:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2060C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 07:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wNSkRS98vTD1N1yDX5+Ln00CNvWjycit9ZpJUKlOBuI=; b=FAQAssc1W37ws8pk6Y4/QdsArK
 nUuZ7joUamnaBOr7XODkiDkzMdJUFxpZ0z4OH1Iw+9TCfCA1DP+STwRIltuFlgQqEhd5OZjueLfok
 yRa8pW+UXRMPNLpuMJafSW1OhMqV2Jb3ydaUMuC0CPuI/OsYZWqhdeIIwVoRII2yE8Lu+mI3EbPg0
 diLpDv07ewmLpt7S4dmSqE1I2wRfl10TrciIXS0hJCZr0d1xEEGbXuBNQehKLJq1aXWTNcmKOOxDg
 un/4KU0hj/Fsp3SWHxAW4VA/QSUyE722425Yz3zHIUtceXlolhCG+quInRt+kn+L77+nMG+KfeTDP
 7ikeqJoA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44652)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wCBgY-000000007vx-2fju;
 Mon, 13 Apr 2026 08:26:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wCBgV-000000008Rl-3tl4; Mon, 13 Apr 2026 08:26:15 +0100
Date: Mon, 13 Apr 2026 08:26:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: KhaiWenTan <khai.wen.tan@linux.intel.com>
Message-ID: <adyal1InVw6UFmTY@shell.armlinux.org.uk>
References: <20260413020339.68426-1-khai.wen.tan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260413020339.68426-1-khai.wen.tan@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, yoong.siang.song@intel.com,
 vladimir.oltean@nxp.com, khai.wen.tan@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, edumazet@google.com, hong.aun.looi@intel.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 ovidiu.panait.rb@renesas.com
Subject: Re: [Linux-stm32] [PATCH net,
 v2 1/1] net: stmmac: Update default_an_inband before passing value
 to phylink_config
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
	FORGED_RECIPIENTS(0.00)[m:khai.wen.tan@linux.intel.com,m:linux-kernel@vger.kernel.org,m:yoong.siang.song@intel.com,m:vladimir.oltean@nxp.com,m:khai.wen.tan@intel.com,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:hong.aun.looi@intel.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,nxp.com,st-md-mailman.stormreply.com,bootlin.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.667];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,shell.armlinux.org.uk:mid,intel.com:email,st-md-mailman.stormreply.com:rdns,armlinux.org.uk:email,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 04BBF3E831A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 10:03:39AM +0800, KhaiWenTan wrote:
> get_interfaces() will update both the plat->phy_interfaces and
> mdio_bus_data->default_an_inband based on reading a SERDES register. As
> get_interfaces() will be called after default_an_inband had already been
> read, dwmac-intel regressed as a result with incorrect default_an_inband
> value in phylink_config.
> 
> Therefore, we moved the priv->plat->get_interfaces() to be executed first
> before assigning mdio_bus_data->default_an_inband to
> config->default_an_inband to ensure default_an_inband is in correct value.
> 
> Fixes: d3836052fe09 ("net: stmmac: intel: convert speed_mode_2500() to get_interfaces()")
> Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

I'll note that this will cause a conflict with net-next when that is
eventually merged.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
