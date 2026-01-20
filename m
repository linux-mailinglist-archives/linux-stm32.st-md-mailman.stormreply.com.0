Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8122D3C25C
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 09:42:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 975F0C36B3C;
	Tue, 20 Jan 2026 08:42:32 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA0C2C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 08:42:31 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-655b5094119so746592a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 00:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768898551; x=1769503351;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xxc76MSYJQhrdh5EUR+3rjpNU84KqL6b3u3m7jeyrTQ=;
 b=RBoC/R0k3JzxAksUVed/jviH01u4D+xe0X6r8JeSNJ7csxt9BsvE2D/VOdOyxUvInb
 rBIMSk7DNIQxPg7MRI01kgPoXm7cxxUSOX8wRtjqHuG0NobChoxWk1yeBd9Z+HU7/1tp
 FJyhSS/Wo6bRN1cH03aPfgto/OavnwmLuMxcgvPRQ1e973fWE6HbCmbOHIe/MRUO2/uR
 lHjgmADdu5rvzyqCxYHCi78LMuz4C4UuNf4+ld8MqnX0k0WerV7/bQA+ZpYhkDK+kIDP
 q3TdfPDlL3MaJmO6xKVyA/8Wc5GjlovihyraTRPb/0o2LNpDhwQluwF3N1oUMHh7dRCa
 yZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768898551; x=1769503351;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xxc76MSYJQhrdh5EUR+3rjpNU84KqL6b3u3m7jeyrTQ=;
 b=PGB7t0jDfTzisN3BvFNP7I68MfBC1C+ljY44IexRiSJMkeHCsSeYlDWNdDo+keOzqH
 EEFQdYVOe03k84hgXeDstyaPsBsuIT1fxW2UN5Kdd5RqUHoDKfbxmFMaUT6GMQmuStS/
 wch95g297EZ1JhfQKyObjxNE13hY0/RmC4Ki0vXUEeJTZu5/24x5JHyMTZL2lNBu8DoP
 qEdYEVCIHRJ3yZ/lZU1h61cZlnMTl4EGQGD7mp7tlwDkJGXWqeSaBpGqHXj/+yhzgudD
 XtMrhsu4o7OvKq7haJQN77+IxQRbhDLSxYBa+FGkHV3Y1/zSQGqtJG/KPUL0vY9Do696
 AJXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMZFQzBtbBsdAxtHl4Rs8ptFri9NivlY4P57RAp2Ab8TXVMhau6XT38n45aLnuimqsGrVXGXBAOaduNQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwAhjehHIqM7nOb+P5hcpgkKTcRbAfw8aGWzN9a0YC+HuVCkTjL
 jYVgZgJKroz7yZLggwazKzyCvAbUGfFl30NfiitB0Q4qE3JdZ9UmkAk/
X-Gm-Gg: AZuq6aICsaWS13D8C60+RRoLD9kEmdYS1RmXbbHYX7/vACpSiP20KBRl9cWz4WGSeIN
 p3gDgo4CvbONb6Dgn7o2vJNq2L/3EudeVsyRg0rkB3v8fBK2zadkFDkzdSGa5RdHRr/nnb7oZZw
 bEbgmi1yOT21REoUFRsSaDuFaGpJKO6vJ8M2NRwGuVDrgAtCsLGegXmQDq2BhoDSadsPug59RwA
 pEO8Tio5DeELfPmuDnOqXgOIxZSFD0oi+TvAFuCjxAn5eec8C7IN/AIrK/DTBMnAr/yjZGLcqvA
 jYa6MLx2Kzu86bC6D10kcte2TzuBjQ+ENAdnsrTRh6saybwYRi8cSFeGLll3ek742gif+3MdwIH
 1C09osWb0NAgJ9uBsqbDWNCtx8mNW2s4KnkyU4b9bGlmQwDBDOujmynshSzBfGxFZlswauvkQkF
 V5AVo=
X-Received: by 2002:a05:6402:348d:b0:64c:9e19:982d with SMTP id
 4fb4d7f45d1cf-654523cc85bmr6267784a12.1.1768898550768; 
 Tue, 20 Jan 2026 00:42:30 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:619a:24df:1726:f869])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e72asm1348612966b.11.2026.01.20.00.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 00:42:30 -0800 (PST)
Date: Tue, 20 Jan 2026 10:42:27 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260120084227.j2wgbmjsrpmycpgn@skbuf>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
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

On Tue, Jan 20, 2026 at 05:04:53AM +0000, Russell King (Oracle) wrote:
> On Mon, Jan 19, 2026 at 11:21:25AM -0800, Jakub Kicinski wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> > 
> > For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> > ---
> > net: stmmac: add stmmac core serdes support
> > 
> > This commit adds SerDes PHY support to the stmmac core driver, moving it
> > from platform glue into the integrated PCS driver. The SerDes is managed
> > through phy_init/phy_exit for lifecycle and phy_power_on/phy_power_off
> > for the power state.
> > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > > index 2f826fe7229b..4d1902f3a58f 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > 
> > [ ... ]
> > 
> > > static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
> > > {
> > > 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> > > +	struct stmmac_priv *priv = spcs->priv;
> > > +	int ret;
> > >
> > > -	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
> > > +	ret = dwmac_serdes_power_on(priv);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (spcs->interface != PHY_INTERFACE_MODE_NA) {
> > > +		ret = dwmac_serdes_set_mode(priv, spcs->interface);
> > > +		if (ret)
> > > +			return ret;
> >                         ^^^^^^^^^^
> > 
> > If dwmac_serdes_set_mode() fails here, doesn't this leave the SerDes in
> > a powered-on state? dwmac_serdes_power_on() succeeded at this point but
> > there's no corresponding dwmac_serdes_power_off() call before returning
> > the error.
> > 
> > Looking at phylink_major_config(), it appears to discard the return
> > value from phylink_pcs_enable(), so the caller won't know to call
> > pcs_disable() to clean up the power state.
> 
> This AI analysis is incorrect.
> 
> By the time phylink_pcs_enable() has been called, the PCS is already
> plumbed in to phylink. It _will_ have phylink_pcs_disable() called on
> it at some point in the future, either by having the PCS displaced
> by another in a subsequent phylink_major_config(), or by a driver
> calling phylink_stop().
> 
> If we clean up here, then we will call dwmac_serdes_power_off() twice.
> 
> Yes, it's not "nice" but that's the way phylink is right now, and
> without reworking phylink to record that pcs_enable() has failed
> to avoid a subsequent pcs_disable(), and to stop the major config
> (which then potentially causes a whole bunch of other issues). I
> don't even want to think about that horrid scenario at the moment.

More to the point, if dwmac_integrated_pcs_enable() fails at
dwmac_serdes_power_on() (thus, the SerDes is _not_ powered on), by your
own admission of this PCS calling convention, sooner or later
dwmac_integrated_pcs_disable() -> dwmac_serdes_power_off() will still be
called, leading to a negative phy->power_count.

That is to say, if the model is "irrespective of whether pcs_enable()
succeeds or fails mid way, pcs_disable is called anyway()", then these
methods are not prepared to handle that reliably.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
