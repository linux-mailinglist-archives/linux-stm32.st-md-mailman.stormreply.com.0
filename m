Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKXEMZdMxmmgIAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Mar 2026 10:23:35 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57196341A50
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Mar 2026 10:23:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD29AC8F288;
	Fri, 27 Mar 2026 09:23:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A03A8C8F287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Mar 2026 09:23:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7EDDD60133;
 Fri, 27 Mar 2026 09:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C0EC19423;
 Fri, 27 Mar 2026 09:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774603412;
 bh=UUG2DpyL+eUgewSKD3Yd9/PcZ1TPr1oUxFvTW/dSkKQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZkxF6S0BiL0pUMCoaFi5uLzUqKys1/B/6mt3ukZHPLBa5qEd7hdlLFCxl+Gl75d4a
 Q6SmC/Vi4JBGKgSYfu/rgGMW0d+oawHZ0jiCn1gdZ1F365s5z4nko5D6qYe4S3Iwcd
 IQxsqx4hhrYj/h/eYjDeRpi4tWnh01zkzqLoOfbJm3xT0hgNoY/ld1VKopZv9ZdgSz
 f0ieMUCtFrO2RgZ7tA2E+VSm16BxnaOdxlHNuyR4YWVKbr9pxd6bHP8fNq0b24No7N
 siyHOR6Zpd82Q1sWqO6bVxxMganoTMAAzr0OA75MU3GkWqiZ2lSeUxD5XnXAj4W8W8
 sEdoTraxOBzKg==
Date: Fri, 27 Mar 2026 09:23:27 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260327092327.GA111839@horms.kernel.org>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
 <E1w51Xs-0000000DwVV-2bnh@rmk-PC.armlinux.org.uk>
 <20260326180453.GU111839@horms.kernel.org>
 <acV29ruRVy_fcwDq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acV29ruRVy_fcwDq@shell.armlinux.org.uk>
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
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
	FORGED_SENDER(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.699];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 57196341A50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 06:12:06PM +0000, Russell King (Oracle) wrote:
> On Thu, Mar 26, 2026 at 06:04:53PM +0000, Simon Horman wrote:
> > On Tue, Mar 24, 2026 at 01:11:44PM +0000, Russell King (Oracle) wrote:
> > > Since ethqos_fix_mac_speed() is called via a function pointer, and only
> > > indirects via the configure_func function pointer, eliminate this
> > > unnecessary indirection.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > ...
> > 
> > > @@ -623,14 +627,6 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
> > >  	ethqos_pcs_set_inband(ethqos, interface == PHY_INTERFACE_MODE_SGMII);
> > >  }
> > >  
> > > -static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
> > > -				 int speed, unsigned int mode)
> > > -{
> > > -	struct qcom_ethqos *ethqos = priv;
> > > -
> > > -	ethqos->configure_func(ethqos, interface, speed);
> > > -}
> > > -
> > >  static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
> > >  {
> > >  	struct qcom_ethqos *ethqos = priv;
> > 
> > Hi Russell,
> > 
> > FYI, AI generated review reports that the comment in ethqos_clks_config()
> > that references ethqos_fix_mac_speed() should also be updated.
> 
> Also already noted (yesterday).
> 
> I do keep an eye on patchwork for my own patches - I have a firefox tab
> permanently open for my patches in patchwork:
> 
> https://patchwork.kernel.org/project/netdevbpf/list/?submitter=165511
> 
> Thanks anyway.

Thanks, and sorry if you told me this before.
I'll try to remember and not spam you with these things going forward.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
