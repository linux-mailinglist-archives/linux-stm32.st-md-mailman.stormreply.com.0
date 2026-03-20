Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMgeFWgIvWkO5gIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 09:42:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EB52D7560
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 09:42:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85FADC87EBD;
	Fri, 20 Mar 2026 08:42:15 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C12AC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 08:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5S1jC4GzKRWZlRIWjIEJX66RpWiCwNLjwF++K0MsrPk=; b=rcfOk2m5zGtNf8qVGdqfySzpmh
 Ina0KbLvEhcXQPtstjplYuTxsXVdHbqCsRSyubjPUS1Ddpm34CqTc8cZoxGP+p33qj99Dmle+geRd
 LW7XzrgNRUt+KiXrnqOxxIMV33ILQge2m5H6PRLQ26XZcezJcnWdJDQkQvi3wRtDpBtcAmnn9GK5t
 qz415YBYHroEA5F2pZDJSsolrhEEJdV35kCoxEBFdPy6dp1r84wOBo/3YQ5TGnfg/Z2Gf1elhec3z
 jsYQnP2jum3LO8ahIutsRiskvUUyW+QmWtvFPvBRn28Yb/2pjayq0MBsda32tXOEtoj5cHn6eeOYR
 4bIH61Xw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55662)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w3VQa-000000005nM-236X;
 Fri, 20 Mar 2026 08:41:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w3VQT-000000000ft-2FXE; Fri, 20 Mar 2026 08:41:49 +0000
Date: Fri, 20 Mar 2026 08:41:49 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: yangg9 <cohenyang511@gmail.com>
Message-ID: <ab0ITVGxiX5w7-0k@shell.armlinux.org.uk>
References: <20260320061955.833785-1-cohenyang511@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260320061955.833785-1-cohenyang511@gmail.com>
Cc: linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, yangg9@xiaopeng.com,
 vladimir.oltean@nxp.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: close reset IRQ window and
	avoid double free
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:cohenyang511@gmail.com,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:yangg9@xiaopeng.com,m:vladimir.oltean@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lunn.ch,google.com,xiaopeng.com,nxp.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.473];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,armlinux.org.uk:url,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: C8EB52D7560
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 02:19:55PM +0800, yangg9 wrote:
> From: yangg9 <yangg9@xiaopeng.com>
> 
> During reset, stmmac_reset_subtask() used to set STMMAC_DOWN before IRQs
> were freed in __stmmac_release(). That leaves a window where interrupts can
> still fire after the device is marked down, which may lead to interrupt
> storms while the interface is transitioning.
> 
> Move stmmac_free_irq() earlier in the reset flow, before setting
> STMMAC_DOWN, so the reset path no longer has that interrupt window.
> 
> Since IRQs are now released in stmmac_reset_subtask(), guard IRQ release in
> __stmmac_release() with STMMAC_DOWN to avoid a second free_irq() during the
> same reset sequence.
> 
> This removes the interrupt-storm window in reset and prevents double IRQ
> release.
> 
> Signed-off-by: yangg9 <yangg9@xiaopeng.com>

I want to review this, but from this afternoon I may be out of range of
LTE signal for about 24h, and thus have no Internet access.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
