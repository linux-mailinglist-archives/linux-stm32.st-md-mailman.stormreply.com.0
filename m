Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAOVIpf9cGmgbAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 17:23:51 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E81C59D88
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 17:23:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E290DC35E3C;
	Wed, 21 Jan 2026 16:23:50 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 276A3C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 16:23:50 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-47ee26a760eso23015e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 08:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769012629; x=1769617429;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6T3WJuA4E+9aoryIRHTxSBnO+FD6uxeUirc/O0FSnGs=;
 b=JkPGJCcRlsE52iHmx1F9g9WWYPPJoImGV/aw1bZA7fOuY1kj8V0TvPkYZ8pZtFGKbj
 +j+zPAZo6s39tJ0JzAqyKIrb12lqPPnnTrWb/jYfERq6I5VihXOZ48jMKv9i6q+LJ0vv
 vTx65dLX565o0exOr1U2fE+QWDWtICUHYTmSNcZpumbBwSoKuOxTZ6SxlWGUNyboWsUZ
 I9B9dpCLbdcoHkxFHdotb+jbZgr+4hU6or9t2wyUez3gT8a04I2KVdN+OjrF5Q9HKfWI
 tiFo65+eCBBxAMWjNX1o+GvYfOpTke8BTZX5Qr3LVdCE0Zlado8zHlXcLle5aypjlgOo
 N79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769012629; x=1769617429;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6T3WJuA4E+9aoryIRHTxSBnO+FD6uxeUirc/O0FSnGs=;
 b=T+3LF4Ikcm3kCCAYlXLqWs7Nc0Sv6HzqXDLpgOE8OEy7yVkbW5hqVjoywSMV9U2ZNE
 KV7Qgowy8JmdQcAnnmA2ypny8DtIZlC/QacW2iGiq00F995bPThf4xRnavODpUg0WDoZ
 txnh5tsBrGnUdEbXzAHCMczkmv7jWFNeLgi6zO88TRzlw94awi0zyzYPYh/whiXsky7L
 9b+yhafgJesGRXm1D7WAeWolzHNRMtwjDZonJY/XSuzNsaLX4rUvlIyr5BWd/aMyPzbe
 jnq2TmjHveOO5mwRRc9++fKmMRtmii0SP0vPOLbj6i8qEGxcQqjq3Q3iWRB/R5RJUftt
 FuIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKyazfvm93Y2gv+8uYofchzGjklAiliH6F8d8DBsWsLDoHFYZ3e+7shypyuzTq8Ssi78eQO/+rEeOhNQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxbvJhisoYy8sSnV/UKHddHJl8OoZ7gKx3Jp8ITVPenj9EroOdD
 PQg1qDsCIoy5p9WpRyeOGE6VaS1Wtv3vTh+u6QLwdUttVzo0Ja8Otwpk
X-Gm-Gg: AZuq6aKrke41QH2XdDJ3iaF4Auu3EWBG9y/+dnup7NOcCtfueRFuLoitIxU5X2I448S
 faShwBBsYJAaytPEocWoJwy3QVFTRQkqmC5I1F1aQ3fmf4Li0hrv1RF+GsLUgMgSYzApBDUX7+g
 yl1I4Qn6sSFb3LK6ovwOmIeYCy+MzJkZcKmitRAuMcXVGE8Q0+p+xNtU4sh21uoP6YuoqS/QUor
 8sR7AvWE5+uOAv+k3cpUHjvyFfM1KBQADcJ3JopQaw8ea2N/IoFqrrXXAaHW/z3tq6ELafWKFgf
 i1Mzc+pAel1FMto92Ib+6aGx74T9Wp8DAaGpf+ZC7rHV1TRwNDUWR6eQJ9b6S1XAPxGSntKswYr
 YaTYXtTpi+OH88Yklaz2wsgFbW3QtppbQpOWbAOAaENOqSoMenP6oMdfZu7fyiRR+6CoMeuQH9i
 6nVGw=
X-Received: by 2002:a05:600c:64cf:b0:477:a6f1:499d with SMTP id
 5b1f17b1804b1-4801e33c5ecmr150113385e9.3.1769012629150; 
 Wed, 21 Jan 2026 08:23:49 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:c2ab:16f0:db90:9d02])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43597ae9f37sm8153161f8f.8.2026.01.21.08.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 08:23:48 -0800 (PST)
Date: Wed, 21 Jan 2026 18:23:45 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260121162345.4jpzvwqhfqxd7tl7@skbuf>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
 <20260120081844.7e6aq2urhxrylywi@skbuf>
 <aW9VHt6meEJFxV0I@shell.armlinux.org.uk>
 <20260120121114.2aedgu42i2wax3yp@skbuf>
 <aXDm0jVOYOZ9l6Wu@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXDm0jVOYOZ9l6Wu@shell.armlinux.org.uk>
Cc: neil.armstrong@linaro.org, mohd.anwar@oss.qualcomm.com, vkoul@kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, andrew@lunn.ch,
 mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next,
	05/14] net: stmmac: add stmmac core serdes support
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
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:neil.armstrong@linaro.org,m:mohd.anwar@oss.qualcomm.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:andrew@lunn.ch,m:mcoquelin.stm32@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,lists.infradead.org,redhat.com,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 2E81C59D88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 02:46:42PM +0000, Russell King (Oracle) wrote:
> On Tue, Jan 20, 2026 at 02:11:14PM +0200, Vladimir Oltean wrote:
> > On Tue, Jan 20, 2026 at 10:12:46AM +0000, Russell King (Oracle) wrote:
> > > First, I'll say I'm on a very short fuse today; no dinner last night,
> > > at the hospital up until 5:30am, and a fucking cold caller rang the door
> > > bell at 10am this morning. Just fucking our luck.
> > 
> > Sorry to hear that.
> > 
> > > On Tue, Jan 20, 2026 at 10:18:44AM +0200, Vladimir Oltean wrote:
> > > > Isn't it sufficient to set pl->pcs to NULL when pcs_enable() fails and
> > > > after calling pcs_disable(), though?
> > >
> > > No. We've already called mac_prepare(), pcs_pre_config(),
> > > pcs_post_config() by this time, we're past the point of being able to
> > > unwind.
> > 
> > I'm set out to resolve a much smaller problem.
> > 
> > Calling it a full "unwind" is perhaps a bit much, because pcs_pre_config()
> > and pcs_post_config() don't have unwinding equivalents, unlike how
> > pcs_enable() has pcs_disable(). I don't see what API convention would be
> > violated if phylink decided to drop a PCS whose enable() returned an error.
> 
> While pcs_pre_config() and pcs_post_config() do not have unwinding
> equivalents (what would they be?) the issue here is that these could
> have changed any state that isn't simply undone by calling
> pcs_disable().
> 
> For example, pcs_pre_config() could have reprogrammed signal routing,
> clocking, or power supplies to blocks.
> 
> This already applies to Marvell DSA pcs-639x.c, where the pre/post
> config hooks change the power state of the PCS block (for errata
> handling), and the only way that gets undone is via a call to
> pcs_disable() which explicitly disables IRQs and power for the PCS. Its
> pcs_disable() isn't a strict reversal of pcs_enable(), it does more.
> 
> We already declare the interface to be dead on pcs_post_config()
> failure, but we don't do that for pcs_enable() failure.
> 
> Maybe I need to explicitly state that pcs_disable() does not directly
> balance pcs_enable(), but that _and_ the effects of pcs_pre_config()
> and pcs_post_config(). However, that itself will add to the problems.
> What if pcs_pre_config() and pcs_post_config() succeed but not
> pcs_enable()? pcs-639x needs pcs_disable() to be called, but if we
> require pcs_disable() to be balanced with a successful call to
> pcs_enable(), that messes up that driver, and pretty much makes it
> impossible to work around the errata.

What if we reordered phylink_major_config() such that phylink_pcs_enable()
comes first, followed by phylink_pcs_pre_config() -> phylink_mac_config() ->
phylink_pcs_post_config()? Superficially looking at pcs-639x, I don't
think it would break.

If we did that, we'd effectively have to also call pcs_disable() when
pcs_post_config() fails, and that is semantically compatible with saying
that pcs_disable() is balanced with pcs_enable(). It also gives the
ability for drivers such as pcs-639x to unwind in pcs_disable() any
actions done in pcs_enable(), pcs_pre_config() or pcs_post_config().

Plus, it's more natural/useful from an API perspective to say
"the PCS has to be enabled in order for anything to be done with it",
rather than the current "first mac_config cycle runs with the PCS not
enabled; subsequent mac_config cycles run with the PCS enabled".

> If you feel strongly about this, then the only thing I can think of
> doing is to move this SerDes support out of stmmac and into phylink
> (which is a point I already raised in the cover message) so that
> its failure can be dealt with at the higher level, where we can
> ensure that phy_power_off() is balaced with phy_power_on(). However,
> that means pushing even more of the stmmac specific "we need the
> clocks running to access registers XYZ or reset" weirdness into
> phylink.

I think core phylink support for generic PHYs eventually makes sense,
but at this stage it's perhaps too early, there's too much we don't yet
know. I would wait at least until it's clear, with an upstream example,
that multiple generic PHYs per phylink instance are needed: 1 SerDes PHY
per lane (for 40GBase-R etc), plus 1 retimer PHY per lane direction.
Also how do those retimers differ from SerDes PHYs. At the very least,
the phy_validate() of SerDes PHYs should be additive w.r.t.
supported_interfaces, whereas the phy_validate() of retimers should be
subtractive.

Also, moving SerDes PHY into phylink only avoids the problem, but if the
PCS driver needs to allocate memory, it will return. I have downstream
patches for a software backplane AN/LT state machine in phylink_pcs,
which is allocated in pcs_enable() and freed in pcs_disable().
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
