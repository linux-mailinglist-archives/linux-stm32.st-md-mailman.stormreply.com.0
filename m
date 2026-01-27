Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGjCJkHleGlwtwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 17:18:09 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9F7979B8
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 17:18:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEF06C555BE;
	Tue, 27 Jan 2026 16:18:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77537C01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 16:18:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 77FA560132;
 Tue, 27 Jan 2026 16:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987AEC116C6;
 Tue, 27 Jan 2026 16:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769530686;
 bh=ZcNWtYJLIeryb15EqaIHjsT/CHKImJVZ9MYEChHRjRI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i1fRsSxV9eVplljd+MJ6yUFvekmXAaHasq2TxJPzMmEmHW6XOVTGJPY5H5/PpjoPt
 5lV896kGw0/406DS2MElUeHkkQc68yLkwtDyND7plvjq1EQuZtwr+8jDvS4H2WrF+i
 VqmNtJdv05LND6Fzfa0CMHrQ4Qgs5nq7GgTqblB7w+ySjgOS3pPrtLWtdSxt4mSByF
 2kF9Lia/W5vBPtEWCvXn84V4mPNmRLpTRZ+T6hwR/kArs10I4s000LpEsISzBjRxaL
 O3Wwc1tumTy48rBSBsxvOC97A/BRRS2BwPC9GfsAW/JYW08WtyAUaR9BBsWxXrGYnF
 eL92+wnW9rJ4w==
Date: Tue, 27 Jan 2026 08:18:04 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260127081804.64841f65@kernel.org>
In-Reply-To: <aXidBha0FahIS6Du@shell.armlinux.org.uk>
References: <E1vkL28-00000005usi-30YC@rmk-PC.armlinux.org.uk>
 <20260127004020.3785641-1-kuba@kernel.org>
 <aXgMIYPiL9JK-c_K@shell.armlinux.org.uk>
 <aXidBha0FahIS6Du@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: andrew@lunn.ch, heiko@sntech.de, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
 edumazet@google.com, pabeni@redhat.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next, v2,
 06/22] net: stmmac: rk: add SoC specific ->init() method
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
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 3B9F7979B8
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 11:09:58 +0000 Russell King (Oracle) wrote:
> > > If ops->init() fails here, does bsp_priv->phy_reset need to be released?
> > > 
> > > Earlier in rk_gmac_setup(), at line 1610, the code calls:
> > > 
> > >     bsp_priv->phy_reset = of_reset_control_get(plat->phy_node, NULL);
> > > 
> > > of_reset_control_get() is not a devm-managed function, so the reset control
> > > would need to be explicitly released with reset_control_put() on error paths.
> > > 
> > > This new error return happens after phy_reset could have been acquired (when
> > > the device has an integrated PHY), but before the function successfully
> > > returns. If this path is taken, it appears the reset control would be leaked.
> > > 
> > > Currently no SoC sets ops->init so this path cannot trigger, but when a
> > > future SoC implements this callback, the leak would occur on init failure
> > > for devices with integrated PHYs.  
> > 
> > However, the driver does not release this resource when cleaning up, so
> > that's already a bug as the driver currently stands. I think this could
> > be converted to devm_reset_control_get(), which would resolve both
> > leakages, but not sure.  
> 
> Note that fixing this is going to add yet another patch to the series,
> because this is a pre-existing bug in the driver. It can't be replaced
> with devm_reset_control_get(), because this driver is getting resources
> for a foreign device (we don't have the struct device pointer.)
> 
> So, it isn't going to be a simple patch to fix this.

Would it work to make that plus patches 1-4,6 a separate series?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
