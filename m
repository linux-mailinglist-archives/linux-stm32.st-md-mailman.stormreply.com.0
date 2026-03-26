Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDY1CFwVxWnr6QQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2026 12:15:40 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD053343AB
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2026 12:15:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40B82C8F27F;
	Thu, 26 Mar 2026 11:15:39 +0000 (UTC)
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FC00C8F27A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2026 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DH6OZbGLz6JBjk1mkEJ81mLvO4rTm1UWMB27HtaTvcM=; b=xW/QOBApGKxhjAHWxrKhsO4paW
 xK89CYlamTAn1AP6eLV9cfTVNJI/ewzZy4wSLYyakacZky5MH/QjCd+aKaHQx3a/Z/96yfR2syCNf
 P7Cx+SApeqNc8KkuiEUlIqS+R3iXol9E9BdXOjbht4BGl5zgx7C4J+ncxsMCrBjxcgmQxVoIMCy8O
 bmV29jQB6/srewPeRNWQ2iusgKWNQnulKaLN4O6Qqy6Jipt82HSlULinu1fjin3ig1Bef4/90SKCV
 Vuy5IGxBRdNgfYPJr7LNDBpXhCL7zIPubChZXshfZ9GXodTgobhevtupjsvNn+LWl+JYpjAcoyUPY
 P37m3+bQ==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
 by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <michal.piekos@mmpsystems.pl>)
 id 1w5igY-00000000ajn-1kSH; Thu, 26 Mar 2026 12:15:34 +0100
Date: Thu, 26 Mar 2026 12:14:44 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Message-ID: <lhlghwdoe6o7eecxpgbnv3e5nb7n2snk6jd6fn4wbolbqwjax4@czydhov4pv4s>
References: <20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl>
 <abb1c779-b306-42f8-b2b1-aa56bfcebe1b@bootlin.com>
 <TY7P301MB198407F8C0280B991334304ED356A@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TY7P301MB198407F8C0280B991334304ED356A@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: skip VLAN restore when
 VLAN hash ops are missing
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
X-Spamd-Result: default: False [3.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[mmpsystems.pl:s=x];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[mmpsystems.pl : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ovidiu.panait.rb@renesas.com,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.piekos@mmpsystems.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.500];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 8FD053343AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 08:07:33AM +0000, Ovidiu Panait wrote:
> Hi,
> 
> > 
> > Hi,
> > 
> > On 21/03/2026 06:38, Michal Piekos wrote:
> > > stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
> > > NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
> > > ->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
> > > -EINVAL via stmmac_do_void_callback(), resulting in a spurious
> > > "Failed to restore VLANs" error even when no VLAN filtering is in use.
> > >
> > > Check presence of VLAN HW FILTER flags before stmmac_vlan_update().
> > >
> > > Tested on Orange Pi Zero 3.
> > >
> > > Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
> > > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > > ---
> > > This patch fixes a noisy "Failed to restore VLANs" message on platforms
> > > where stmmac VLAN hash ops are not implemented.
> > > stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
> > > VLAN hash ops presence which results in -EINVAL.
> > 
> > I've been seeing the same message on socfpga. My two cents on that is
> > that this error messages doesn't bring anything to the table anyways.
> > 
> > As Russell explains, it's either triggered when the vlan op isn't
> > implemented (the stmmac callback macro stuff turns that into a -EINVAL),
> > or when some capabilities arent present. All in all, it's always stuff
> > that users can't really do anything about, as it's HW limitations, I
> > think we can simply discard this message.
> > 
> > Also, nothing actually checks what stmmac_vlan_restore() returns, so we
> > might as well return void ?
> > 
> 
> I think this is the best solution until the VLAN capabilities handling is
> cleaned up.
> 
> Michal, please let me know if you will be handling this in v3 or I should
> send a fix for it.
> 

I will provide the fix for it latest during the weekend.

Michal

> Thanks,
> Ovidiu
> 
> > Maxime
> > 
> > > ---
> > > Changes in v2:
> > > - Replace check for hash ops with check for HW FILTER flags
> > > - Link to v1: https://lore.kernel.org/r/20260314-vlan-restore-error-v1-
> > 1-4fc6c3e2115f@mmpsystems.pl
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index 6827c99bde8c..cfc0ce9cec9c 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -6863,7 +6863,8 @@ static int stmmac_vlan_restore(struct stmmac_priv
> > *priv)
> > >  {
> > >  	int ret;
> > >
> > > -	if (!(priv->dev->features & NETIF_F_VLAN_FEATURES))
> > > +	if (!(priv->dev->features &
> > > +	      (NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_HW_VLAN_STAG_FILTER)))
> > >  		return 0;
> > >
> > >  	if (priv->hw->num_vlan)
> > >
> > > ---
> > > base-commit: 42bddab0563fe67882b2722620a66dd98c8dbf33
> > > change-id: 20260314-vlan-restore-error-f8b3a1c7f50a
> > >
> > > Best regards,
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
