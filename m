Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC50798C6B0
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Oct 2024 22:21:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 509A5C78019;
	Tue,  1 Oct 2024 20:21:03 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DE42C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Oct 2024 20:20:55 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53992157528so3280775e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Oct 2024 13:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727814055; x=1728418855;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pZ73CcQvi1PQ+XEgRkwDCiOtDJhUD8sj5gWpktchgqE=;
 b=O8DLK1LP3HCdnfFaGR+7Nm/Mw95lx3jyz4G7vrQShe6zJVNIKELsBwyMfrzoBmDEop
 l7HE0BwgSwz67eYoqMUEtsJ3GRy/8EBDb6DSm+cpnQKn558u+S6EwA2tQM4n+cI3F/IF
 loe9AgygsdyYVvxxtNjKBSzeECcPFxWsaTlGD/AzyDNZmfjeGYSw+CilEVp8AWFLR4Z0
 8eB2H84sluBomWfD1ups0LNJC7Isdd85+E0CAdnOB08fpwdnqKkB8hvZUZ3/eDpBxBh2
 tbIA8wCivYiZJW9bcwPIrba7ddcYfnUBkn4HAZHO/Ho6iC9k9T9UTwGMl4W8Sy7bjGpN
 8d8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727814055; x=1728418855;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pZ73CcQvi1PQ+XEgRkwDCiOtDJhUD8sj5gWpktchgqE=;
 b=f0VfU5v6UEkRaqUd4BzE4qnYKsMGMAUW3OWQxUf/NCoIj/XblKAodyIAWopAMXjshD
 6jByQd3XEs3xL6xw4TRWF5wEQxUv3t4teFR3E93JvJ6+9eX4O0gME3ACEv6rK3nAfiqt
 pfTxKHTf6NrnxFbwAGVWW5JfFfy1H8yKrgj3/FSqooYGVmNWNNR4eB05zg5XeZfUZ9gu
 OXZZIYC97v0P7103hnWv01DwObWqV4RPOzfD0IL101dlIfmhG2zzJ09ZqaKF18i6T9RP
 fOJrBIO0qsPnesLfTjOTzLIfPrW4ejz2ID8cZeJnEiNyyIyb+CRB1QzkgQXRznwJY9wY
 eLqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu4YxZ4NEN21WaRfhBCnlExkIJgBsdGgnO8n2HXEC0krkZ1UP3YQz+5s/i73fW08VtxNs/rAElS9GXFQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyq1lqHxw/vDhqtuYRPxK7Ai3vuR9IdWKCJwH5cuO/qEu4HGi5s
 JRHZ4Z+bENLOJkRhkSJRqgKU/PAjuwhbL3vqrSFTBYbj9TibxWnz
X-Google-Smtp-Source: AGHT+IFApS0/WtALkW3Qi+48Aew2ZvtyMeOfMCb8CRdV8LudxHG1ORDpdi8RYFS2Cc/aayUDMXCAQw==
X-Received: by 2002:a05:6512:68a:b0:535:63a9:9d8c with SMTP id
 2adb3069b0e04-539a0664ff6mr399889e87.17.1727814054194; 
 Tue, 01 Oct 2024 13:20:54 -0700 (PDT)
Received: from mobilestation ([95.79.225.241])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5398ff6996csm1124907e87.170.2024.10.01.13.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 13:20:53 -0700 (PDT)
Date: Tue, 1 Oct 2024 23:20:51 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <7drrlatwrjf3x77k3fswobcmbquye5luu2thoxwahqmodsm3ur@c6vqwcgtwnot>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <E1ssjcZ-005Nrf-QL@rmk-PC.armlinux.org.uk>
 <mykeabksgikgk6otbub2i3ksfettbozuhqy3gt5vyezmemvttg@cpjn5bcfiwei>
 <Zvp59w0kId/t8CZs@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zvp59w0kId/t8CZs@shell.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 01/10] net: pcs: xpcs: move
 PCS reset to .pcs_pre_config()
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

On Mon, Sep 30, 2024 at 11:14:15AM GMT, Russell King (Oracle) wrote:
> On Mon, Sep 30, 2024 at 01:16:57AM +0300, Serge Semin wrote:
> > Hi Russell
> > 
> > On Mon, Sep 23, 2024 at 03:00:59PM GMT, Russell King (Oracle) wrote:
> > > +static void xpcs_pre_config(struct phylink_pcs *pcs, phy_interface_t interface)
> > > +{
> > > +	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
> > > +	const struct dw_xpcs_compat *compat;
> > > +	int ret;
> > > +
> > > +	if (!xpcs->need_reset)
> > > +		return;
> > > +
> > 
> > > +	compat = xpcs_find_compat(xpcs->desc, interface);
> > > +	if (!compat) {
> > > +		dev_err(&xpcs->mdiodev->dev, "unsupported interface %s\n",
> > > +			phy_modes(interface));
> > > +		return;
> > > +	}
> > 
> > Please note, it's better to preserve the xpcs_find_compat() call even
> > if the need_reset flag is false, since it makes sure that the
> > PHY-interface is actually supported by the PCS.
>
 
> Sorry, but I strongly disagree. xpcs_validate() will already have dealt
> with that, so we can be sure at this point that the interface is always
> valid. The NULL check is really only there because it'll stop the
> "you've forgotten to check for NULL on this function that can return
> NULL" brigade endlessly submitting patches to add something there -
> just like xpcs_get_state() and xpcs_do_config().

Thanks for the detailed answer. Indeed, I missed the part that the
pcs_validate() already does the interface check.

> 
> > > +	bool need_reset;
> > 
> > If you still prefer the PCS-reset being done in the pre_config()
> > function, then what about just directly checking the PMA id in there?
> > 
> > 	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
> > 		return 0;
> > 
> > 	return xpcs_soft_reset(xpcs);
> 
> I think you've missed what "need_reset" is doing as you seem to
> think it's just to make it conditional on the PMA ID. That's only
> part of the story.
> 
> In the existing code, the reset only happens _once_ when the create
> happens, not every time the PCS is configured. I am preserving this
> behaviour, because I do _NOT_ wish to incorporate multiple functional
> changes into one patch - and certainly in a cleanup series keep the
> number of functional changes to a minimum.

Ok. So the goal is to preserve the semantics. Seems reasonable. But... 

> 
> So, all in all, I don't see the need to change anything in my patch.

I'll get back to this patch discussion in the v1 series since you have
already submitted it.

-Serge(y)

> 
> Thanks for the feedback anyway.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
