Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ka9JRLXeGmUtgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 16:17:38 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8A196827
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 16:17:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD3F0C555BE;
	Tue, 27 Jan 2026 15:17:37 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F37BEC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 15:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=ZVh052NF40220AWAqRlV3TkXB/pLRow1eBVBsLhpPPk=; b=pI9qkzvuh9ZDIMnTPnQKFVkG/p
 wdEN50YVxEZV47ubYV+IF8h7+5JuCrLjnr4XITbJn0KsVpV6p4P3iJUF6EGdJxWIhtJsLvlTaPZmd
 FxOQS6mq8hG+jNsCevTeiywb1IEYaXeqJOWuk6n0kTUXFS6jaNz4Mx8px8l8wyL0vfVw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1vkkoq-004yQu-1s; Tue, 27 Jan 2026 16:17:28 +0100
Date: Tue, 27 Jan 2026 16:17:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Message-ID: <34469896-9ea8-4f82-891f-0b57253f6cc5@lunn.ch>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
 <aXPo5R1Q-qWG3r3l@shell.armlinux.org.uk>
 <aXjSbu6L6ICYOPiJ@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXjSbu6L6ICYOPiJ@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
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
	R_DKIM_REJECT(1.00)[lunn.ch:s=20171124];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lunn.ch : SPF not aligned (strict),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mohd.anwar@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linaro.org,kernel.org,vger.kernel.org,st-md-mailman.stormreply.com,armlinux.org.uk,lunn.ch,google.com,gmail.com,lists.infradead.org,redhat.com,davemloft.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:-];
	NEURAL_HAM(-0.00)[-0.993];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 3D8A196827
X-Rspamd-Action: no action

> I added additional debug prints, and I think the crash is due to
> BMSR_ESTATEN not being set in GMAC_AN_STATUS.
> 
> During pcs_init, BIT(8) of GMAC_AN_STATUS is 0:
> [    7.985913] [DBG] GMAC_AN_STATUS = 8
> 
> Therefore, this check:
> 	if (readl(spcs->base + GMAC_AN_STATUS) & BMSR_ESTATEN) {
> 		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> 			  spcs->pcs.supported_interfaces);
> 
> 		/* Only allow 2500Base-X if the SerDes has support. */
> 		ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_2500BASEX);
> 		if (ret == 0)
> 			__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> 				  spcs->pcs.supported_interfaces);
> 	}
> fails, and PHY_INTERFACE_MODE_2500BASEX never gets set in
> pcs.supported_interfaces. Pardon my naivete, but does the
> BMSR_ESTATEN bit not being set break some standard?

You might want to check the IEEE 802.3 standard. It is free to
download from IEEE.

The original C22 register definitions only supported 10 and
100Mbps. In order to support 1G, more registers are needed. The
BMSR_ESTATEN bit indicate the PHY supports having more status bits in
register 15. Register 15 then indicates if 1000BaseX, 1000Base-T is
supported.

If the SERDES supports 1000BaseX, it should have BMSR_ESTATEN set, and
register 15 should indicate 1000BASE-X.

	 Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
