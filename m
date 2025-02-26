Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC732A4533C
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 03:43:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82792C7A824;
	Wed, 26 Feb 2025 02:43:43 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 145F3C78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 02:43:41 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2fcce9bb0ecso12181543a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 18:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740537820; x=1741142620;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=09wSZxKgriakTOPJO9UMgX94JkvJeeXEmpJoFk0WInU=;
 b=QrGeWScPJDnlUsab8j4mV7ZiI0XJPGWEsIR/XtPa+51nOkUmsCXhVG+7dSFC0r+lH5
 smAviyHQxEElP7KApYQh5KGZmra8NKcvZGonLze1sJMVNL4bKwg17l8hsBoVzYPwQvqf
 jpQwo2SehKiQViqU23CvxLrgee3qxMBhkoQ0towNNmgZ1XNZfu2rjr4GuXyvBj17cDOf
 xDfnP0UfVJE8MQj4oIa1mKRzCzNfWaqiaMY78f3LhtVGP87iGztHKXdSzwTPpW+Eft07
 X5SRS+xu0N4+CPhdFCOYNjkgccGyVVgsyJ00Y8yroHdY6rkPa5HE0iDLuPgUu9+e9Ubt
 rQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740537820; x=1741142620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=09wSZxKgriakTOPJO9UMgX94JkvJeeXEmpJoFk0WInU=;
 b=Dpwj7ictxmhF0l4A1NCwF9i3Lfl4umNF6isZR0h/MbzG7CeMdT1cN/xk+mwFzVBr72
 cMXpOVLL+wKnnuflI7qn5/e9eI76tvbQYGNLXAnOSYPHafpA6LmPpOYUcSvRjVZuDOiQ
 U1VG5JSgcFK16Y1bk62cA0Te2d31E+k3nZRL5a/k10HC07xQwuvsYUCobLm12h7Dk4Cp
 Abf7h7EUqvQPQRRt3U7NyssSYv0leVuW8kN5B+7fqvfxxw4fDoZkuulHeGHkvo+HNwuA
 xlq420Tc52jcAOKcBryev0ewLi6HrtVyyaFhCRVqR08K5Jci8oUrc2gElR1IP2rEdw1G
 sZDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbAzkRabC9oSgIRvrZEU3pfRd5L75q7dvfVlwcFjJhD8OeJJE5WBz3d769mVSfS+wbBdTkMX3T7oh+Ug==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzjXYyTn43BnoEdNiidJoytaudNZNEpHOqI6wDMDFTay2vSn9cK
 O19vvrHvJNcugx+jvd4YTY3j0c0HhtT6tbOuzDPCpZ0mcTrb9EU5
X-Gm-Gg: ASbGnctet5uRKnjpBnIr7fMiBFYUMwnF+d4uMIghwCMYSyNAByFLKGOshWZZFyS2Vg8
 aVTvv5tkbewtX/N8AgpIq25btU236vBh/k5+cj2K6CqadrRb5rsZ0gtZcoMgv9cymMRfQYGIKoc
 VBPhy1YIO6t3jABjVfhQpvO4+kzZSXntuY6yz95rWou9ko3KOic5GBB4mT9hQ4r2UWq1Iiq3N5M
 lQxY9oOJdLFJz+UkqJWWi8m97S7t4ysaIEL+UeTpcDyMfXkRmJfpigViSTInmL4QPFspdhyQAdT
 nvpsyAMC8RyEWVA2qp/2PGc=
X-Google-Smtp-Source: AGHT+IHqWiTmKahLoNDEtQkn8Ysj7aO7VlP6FoYVWXaVQHY/r9/BHTTRDx4CPzCNopfHUXBmu0dRbg==
X-Received: by 2002:a17:90b:53c3:b0:2ee:f687:6acb with SMTP id
 98e67ed59e1d1-2fe68adedc1mr8899627a91.13.1740537820375; 
 Tue, 25 Feb 2025 18:43:40 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe825d2b85sm326939a91.26.2025.02.25.18.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 18:43:40 -0800 (PST)
Date: Wed, 26 Feb 2025 10:43:26 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20250226104326.0000766e@gmail.com>
In-Reply-To: <Z7dVp7_InAHe0q_y@shell.armlinux.org.uk>
References: <Z7dVp7_InAHe0q_y@shell.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>, 2694439648@qq.com,
 hailong.fan@siengine.com, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Minda Chen <minda.chen@starfivetech.com>, linux-arm-kernel@lists.infradead.org,
 Thierry Reding <treding@nvidia.com>, Inochi Amaoto <inochiama@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] net: stmmac: weirdness in stmmac_hw_setup()
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

On Thu, 20 Feb 2025 16:17:43 +0000, "Russell King (Oracle)" wrote:

> While looking through the stmmac driver, I've come across some
> weirdness in stmmac_hw_setup() which looks completely barmy to me.
> 
> It seems that it follows the initialisation suggested by Synopsys
> (as best I can determine from the iMX8MP documentation), even going
> as far as to *enable* transmit and receive *before* the network
> device has been administratively brought up. stmmac_hw_setup() does
> this:
> 
>         /* Enable the MAC Rx/Tx */
>         stmmac_mac_set(priv, priv->ioaddr, true);
> 
> which sets the TE and RE bits in the MAC configuration register.
> 
> This means that if the network link is active, packets will start
> to be received and will be placed into the receive descriptors.
> 
> We won't transmit anything because we won't be placing packets in
> the transmit descriptors to be transmitted.
> 
> However, this in stmmac_hw_setup() is just wrong. Can it be deleted
> as per the below?
> Tested-by: Thierry Reding <treding@nvidia.com>
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index c2913f003fe6..d6e492f523f5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3493,9 +3493,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
>  		priv->hw->rx_csum = 0;
>  	}
>  
> -	/* Enable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, true);
> -
>  	/* Set the HW DMA mode and the COE */
>  	stmmac_dma_operation_mode(priv);
>  

A better fix here:
https://lore.kernel.org/all/tencent_CCC29C4F562F2DEFE48289DB52F4D91BDE05@qq.com/

I can reproduce and confirm that patch works well.
I was going to leave a Tested-by: tag on that patch if everything looks good enough,
but the author (now copied) never come back.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
