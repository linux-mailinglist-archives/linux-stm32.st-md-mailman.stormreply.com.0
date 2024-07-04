Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E164927708
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2024 15:19:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C7AEC71287;
	Thu,  4 Jul 2024 13:19:59 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9222C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jul 2024 13:19:51 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52cdbc20faeso741336e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 04 Jul 2024 06:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720099191; x=1720703991;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+Mio7nA2GrQAf/CO8lwaLayQG4Qad6gjdq+KH1l6Sqc=;
 b=RbAMZibM9dqhxVZRoGE4E0GQHR4YEsLJuxPGvEBbGtJPGcNTLaOsLpORUBk3k0cdJ3
 B3+XUBGIoGurf66X3b9+zoTMVR03CMlxnJzj1UzrWSp6zK+Sl/DAsFg0c9yTLsgnPUi2
 CXSHTRJF/Rsxk6lhj6BCO03BSK563HDJp7ux64Nt5HaDWRr/57fBKr8PgfawIVYwNaix
 Fprw7lla5Q2lFgJVz1zK0JpaRx1QEvHUMSdy7JrcloqtWs+feo7zc2n05SpkjvSsRG+g
 ftPvn4etTmUc5trqyzTIwYF3n3WLBK5/xmcsrY4rfoGqPtsqXxKWeke7ww1qGYtH6M0H
 8aLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720099191; x=1720703991;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Mio7nA2GrQAf/CO8lwaLayQG4Qad6gjdq+KH1l6Sqc=;
 b=AMy8nr6nHVHGP0S4PpIhnZPnInE8uVxjCHerL+pTaQdAWUNPsZpP6eV8kMxX2OQB9X
 jRWhwau5yPTaUUM+1QhMq0x3Qp7J1/MkecJzW0/FLufZXw8LbKKlk4Jo51zXPRvYDPSe
 JjldArQqXisrMg6415+95dCskA6LGXtRB++2XwOfKNCx+8SyxV2BSKxPSF5rR/alyNxk
 O6b2O+NtaUvKZeEwoQY8fFYULQf6sk8hrpl+ymp5AHekdhF7uZQQmCohG3CYPtuWssb0
 cpWmmhSl6O6nMfvxi0kG7f3yT4ypOY+7Ba9HwxyIRICL/aJrRnBcshOSYbUz1LLxP4GP
 Gjbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbn8IDyxNDaWeY7xSMP7oIV0YIKm/X+FEhdgDZqNLB6cwjiFq6KQZP/3xPWslA0fmGUwYEkS+aPnGpwN4h8Bdt/kztWTAYU0Rx9rTcKVxDzpq7nE7kETG8
X-Gm-Message-State: AOJu0YxYlObqnk/Gg+l+zm5Znmrrc4e6mkzACgcFDBUp4rF2zPb56GDT
 cJOTuKGwbIgIEtWk4TUZd0JCG7uJSnlfzw4ylRJB9lqIQFd65GIc
X-Google-Smtp-Source: AGHT+IFLsJluxr9qbjbQR6D4oopUOzte2TNpjqiQgp9iU60Xia5F2mbvt0C30sUaoP0hA8XPlTqBtA==
X-Received: by 2002:a05:6512:4819:b0:52c:7fe8:6489 with SMTP id
 2adb3069b0e04-52ea07126e6mr985561e87.63.1720099190585; 
 Thu, 04 Jul 2024 06:19:50 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e9fbeb17asm200371e87.194.2024.07.04.06.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jul 2024 06:19:50 -0700 (PDT)
Date: Thu, 4 Jul 2024 16:19:47 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <tqghwucifrtbeeucsrbbc4zx22axaij7f4qx3rwhj27kmohgci@zin7ke5272n5>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <20240624132802.14238-9-fancer.lancer@gmail.com>
 <Zn7L4cP62MsNN61J@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zn7L4cP62MsNN61J@shell.armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 17/17] net: stmmac: pcs:
 Drop the _SHIFT macros
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

On Fri, Jun 28, 2024 at 03:42:41PM +0100, Russell King (Oracle) wrote:
> On Mon, Jun 24, 2024 at 04:26:34PM +0300, Serge Semin wrote:
> > The PCS_ANE_PSE_SHIFT and PCS_ANE_RFE_SHIFT are unused anyway. Moreover
> > PCS_ANE_PSE and PCS_ANE_RFE are the respective field masks. So the
> > FIELD_GET()/FIELD_SET() macro-functions can be used to get/set the fields
> > content. Drop the _SHIFT macros for good then.
> > 
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> > index a17e5b37c411..0f15c9898788 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> > @@ -43,9 +43,7 @@
> >  #define PCS_ANE_FD		BIT(5)		/* AN Full-duplex flag */
> >  #define PCS_ANE_HD		BIT(6)		/* AN Half-duplex flag */
> >  #define PCS_ANE_PSE		GENMASK(8, 7)	/* AN Pause Encoding */
> > -#define PCS_ANE_PSE_SHIFT	7
> >  #define PCS_ANE_RFE		GENMASK(13, 12)	/* AN Remote Fault Encoding */
> > -#define PCS_ANE_RFE_SHIFT	12
> >  #define PCS_ANE_ACK		BIT(14)		/* AN Base-page acknowledge */
> 

> I would actually like to see all these go away.
> 
> PCS_ANE_FD == LPA_1000XFULL
> PCS_ANE_HD == LPA_1000XHALF
> PCS_ANE_PSE == LPA_1000XPAUSE and LPA_1000XPAUSE_ASYM
> PCS_ANE_RFE == LPA_RESV and LPA_RFAULT
> PCS_ANE_ACK == LPA_LPACK

Great! It will be even better.

> 
> Isn't it rather weird that the field layout matches 802.3z aka
> 1000base-X and not SGMII? This layout would not make sense for Cisco
> SGMII as it loses the speed information conveyed by the Cisco SGMII
> control word.
> 
> This isn't a case of the manufacturer using "SGMII" to mean a serial
> gigabit media independent interface that supports 1000base-X
> (PHY_INTERFACE_MODE_1000BASEX) rather than Cisco SGMII
> (PHY_INTERFACE_MODE_SGMII) ?

It's not that weird. The only CSRs available and functional for SGMII
PCS are PCS_AN_CTRL and PCS_AN_STATUS (plus PCS_SRGMII_CSR where the
PCS exposes the link status, aka Cisco SGMII tx_config_reg[15:0] with
the vendor-specific layout). Registers from PCS_ANE_ADV up to PCS_TBI_EXT
exist for TBI and RTBI PCS only. Since TBI is defined in the IEEE
802.3z C36 I guess that's why the layout matches to what is described
in IEEE 802.3z C37.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
