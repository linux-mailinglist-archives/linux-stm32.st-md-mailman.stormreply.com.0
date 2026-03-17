Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMl2OK1RuWkoAgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 14:05:49 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 747422AA700
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 14:05:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EAE4C87EC5;
	Tue, 17 Mar 2026 13:05:49 +0000 (UTC)
Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35DA7C7A831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1LeDQMyH2RycDF+8KnCGFkEFqzlWBy52GMaL6I3Md0E=; b=rYLR2K1lFK/0FJ4Mnf0QAtzzMB
 rRRY7w1bbN6NLsHAc4gSIgEJ09Sh508RhXb71uy1KVBXSXzf2C0f2SQ6NDhi3vJAsCHFgtmMKALT8
 RSsAzUr7+mMqOy2UoC/wVrNm9Rc2oLbrwn5nlAh/h5ttFMEjNOl06SAvb/u9anwW7VachNIfTOJ/r
 fVaYss9HQy8BiWIxPDumckhnbY+09PvmlNMm8KfbbHc4KHFx72cg+hqrqJyzNuakr40SU5AlrV5Nd
 eBCkxmlPnCwRtox8jd+HBElM1qmILB/yflF/tJwx72kWZOQmIU9y1UrDldLXCl7e9Tkj8AT8szqWO
 qGgGYs0Q==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
 by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <michal.piekos@mmpsystems.pl>)
 id 1w2U7F-00000000foh-0Rg0; Tue, 17 Mar 2026 14:05:45 +0100
Date: Tue, 17 Mar 2026 14:05:00 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Message-ID: <6wr4v36ijdwlh4q6wiwki42qdjwsjoif7l47mu2df6npi42vrx@scd7zbgb4dml>
References: <20260314-vlan-restore-error-v1-1-4fc6c3e2115f@mmpsystems.pl>
 <TY7P301MB1984C5D71A81DFE5E8EC94D4D341A@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TY7P301MB1984C5D71A81DFE5E8EC94D4D341A@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: skip VLAN restore when VLAN
 hash ops are missing
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.piekos@mmpsystems.pl,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[mmpsystems.pl:-];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.306];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mmpsystems.pl:email,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 747422AA700
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 12:36:42PM +0000, Ovidiu Panait wrote:
> Hi Michal,
> 
> > stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
> > NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
> > ->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
> > -EINVAL via stmmac_do_void_callback(), resulting in a spurious
> > "Failed to restore VLANs" error even when no VLAN filtering is in use.
> > 
> > Check presence of VLAN hash ops before stmmac_vlan_update().
> > 
> > Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > ---
> > This patch fixes a noisy "Failed to restore VLANs" message on platforms
> > where stmmac VLAN hash ops are not implemented.
> > stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
> > VLAN hash ops presence which results in -EINVAL.
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 6827c99bde8c..bc09439ec00b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -6869,6 +6869,9 @@ static int stmmac_vlan_restore(struct stmmac_priv
> > *priv)
> >         if (priv->hw->num_vlan)
> >                 stmmac_restore_hw_vlan_rx_fltr(priv, priv->dev, priv->hw);
> > 
> > +       if (!priv->hw->vlan || !priv->hw->vlan->update_vlan_hash)
> > +               return 0;
> > +
> 
> The stmmac_restore_hw_vlan_rx_fltr() call above also goes through the
> priv->hw->vlan pointer, so maybe for consistency, the check for empty
> VLAN ops should be made at the top of the function.
> 
> Another alternative would be to replace the NETIF_F_VLAN_FEATURES check
> at the top of stmmac_vlan_update() function to check if VLAN HW filtering
> is supported instead (NETIF_F_HW_VLAN_CTAG_FILTER and
> NETIF_F_HW_VLAN_STAG_FILTER).
> 
> The restore only deals with the HW filters anyway and the vlan ops are
> always defined in that case (stmmac_vlan_rx_add_vid() and
> stmmac_vlan_rx_kill_vid() rely on this being true as well, as they also
> call stmmac_vlan_update() unconditionally).
> 
> Ovidiu

Thank you for the comment. 
Your suggested solution to check VLAN HW filtering flags is much better.
I'll go for it for v2.

Michal

> 
> >         ret = stmmac_vlan_update(priv, priv->num_double_vlans);
> >         if (ret)
> >                 netdev_err(priv->dev, "Failed to restore VLANs\n");
> > 
> > ---
> > base-commit: 1c9982b4961334c1edb0745a04cabd34bc2de675
> > change-id: 20260314-vlan-restore-error-f8b3a1c7f50a
> > 
> > Best regards,
> > --
> > Michal Piekos <michal.piekos@mmpsystems.pl>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
