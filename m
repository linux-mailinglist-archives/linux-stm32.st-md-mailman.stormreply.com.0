Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B575592679E
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jul 2024 20:03:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65B22C6DD9E;
	Wed,  3 Jul 2024 18:03:55 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 349BFC6DD96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2024 18:03:48 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52cf4ca8904so9282853e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jul 2024 11:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720029827; x=1720634627;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5pUANthD2RfMuvZXmpYUOmYzj9A++tZ8LVG4JgOmllc=;
 b=RszpXbaMungTDtp1WQ5TkxH2HDmBCxBi6TWmQkJuTmuLjyeyLvOgEswMzU2qhrc9Fb
 GN63XLuvkYUAfyw2rlIxHvCNsZy2MIFLsBR4Nyo4RkXkccZpYwTK/Fumt74TUTzfHngB
 1dtix8hqku4rlLPqRq6enXEWVnaK8Os/Q+qKxY8GCAV2bXy9y4gqEDbNEDKFHhN8/KIW
 Ygvf9JIknkFKcMhmsUg0tf7OU5DGXfI40ZT/ZijGoYbk0rYpeUHU6KVPc3eqa6Hw4a3I
 OLEyiHW1iSZ39+8j3UZUZxtdP3xLPTwOfZSjgnvJR6nAeipSL5W9HQc3yXCXXmz0lSO3
 xutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720029827; x=1720634627;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5pUANthD2RfMuvZXmpYUOmYzj9A++tZ8LVG4JgOmllc=;
 b=b40dArG/tiryItSKt+px2kGIpz1DIAugJZzbqfhwKMQHu3hITUZEwoGX5X7BnnaIIU
 /AeTuTbislYF/8hNrh8FwjxFRmjkdnT9GENSYQhxU20YR9zGmQ3ERi+soJyKBOjzRLk1
 l1l8m8Mww0Cu19umpDs8BCdCYniRFC0TUhPFh3RpXIagQnun49l/Y9ka0DH/6Qy9FDQ/
 0XK6P63+ZKfiTNqe27QXLFlvPBBI0fcwlHQHVnHnttOIT0iAoq6HuRNtU2mfYyD1Raip
 zu3XUKRy7Q0l6CA6G9pZsLobBOF4p6UkSuLrZWvzriTfRYNa2I9zrh1HDKd8Q38fcKfZ
 oEuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVV0WU0hiILUcFLkExiDf4BZJa6bCq5AoZtcddHEOaM0aKXd+2gI9RC4YJmDSID3C03tvQBrVh2TuF+7aUgahU+sjaaX8B0QX5ra9jxC6vw/SVaElBsYCc
X-Gm-Message-State: AOJu0YysdzCS/uP6GOR4m+iDWaGfFpFFNgyBiNGzzuyrCrl5PXA6CGXx
 GPwCf2axxReEK7VYEctrhHwo/4fNtIPIHnxALfy1/5Of02N47b4R
X-Google-Smtp-Source: AGHT+IEzqdXoqCQ87ptf6kZX7djqsIHyutpvUl0WyZiNqihSTsmFkE+7S47HCg6mq1RDtsjlWdH3Kw==
X-Received: by 2002:a05:6512:2315:b0:52c:db75:9640 with SMTP id
 2adb3069b0e04-52e82701721mr8301874e87.48.1720029825101; 
 Wed, 03 Jul 2024 11:03:45 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e9b59bdcfsm143863e87.293.2024.07.03.11.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 11:03:44 -0700 (PDT)
Date: Wed, 3 Jul 2024 21:03:41 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <57xxremctndaz7rfmuyw3rjuz3hi7tntbaghvqda5uxngku7pl@rsekr4b5gbzr>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <20240624132802.14238-2-fancer.lancer@gmail.com>
 <Zn7OlQ4aoO2vZTrj@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zn7OlQ4aoO2vZTrj@shell.armlinux.org.uk>
Cc: Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 10/17] net: stmmac:
 Introduce internal PCS offset-based CSR access
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

On Fri, Jun 28, 2024 at 03:54:13PM +0100, Russell King (Oracle) wrote:
> On Mon, Jun 24, 2024 at 04:26:27PM +0300, Serge Semin wrote:
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index 80eb72bc6311..d0bcebe87ee8 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -633,7 +633,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
> >  			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> >  			      RGMII_IO_MACRO_CONFIG2);
> >  		ethqos_set_serdes_speed(ethqos, SPEED_2500);
> > -		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
> > +		stmmac_pcs_ctrl_ane(priv, priv->pcsaddr, 0, 0, 0);
> >  		break;
> >  	case SPEED_1000:
> >  		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
> > @@ -641,12 +641,12 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
> >  			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> >  			      RGMII_IO_MACRO_CONFIG2);
> >  		ethqos_set_serdes_speed(ethqos, SPEED_1000);
> > -		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
> > +		stmmac_pcs_ctrl_ane(priv, priv->pcsaddr, 1, 0, 0);
> >  		break;
> >  	case SPEED_100:
> >  		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
> >  		ethqos_set_serdes_speed(ethqos, SPEED_1000);
> > -		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
> > +		stmmac_pcs_ctrl_ane(priv, priv->pcsaddr, 1, 0, 0);
> >  		break;
> >  	case SPEED_10:
> >  		val |= ETHQOS_MAC_CTRL_PORT_SEL;
> > @@ -656,7 +656,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
> >  					 SGMII_10M_RX_CLK_DVDR),
> >  			      RGMII_IO_MACRO_CONFIG);
> >  		ethqos_set_serdes_speed(ethqos, SPEED_1000);
> > -		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
> > +		stmmac_pcs_ctrl_ane(priv, priv->pcsaddr, 1, 0, 0);
> >  		break;
> >  	}
> >  
> 

> I think a better preparatory patch (given what you do in future patches)
> would be to change all of these to:
> 
> 	ethqos_pcs_set_inband(priv, {false | true});
> 
> which would be:
> 
> static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
> {
> 	stmmac_pcs_ctrl_ane(priv, priv->ioaddr, enable, 0, 0);
> }
> 
> which then means this patch becomes a single line, and your subsequent
> patch just has to replace stmmac_pcs_ctrl_ane() with its open-coded
> equivalent.

Why not. We can introduce one more preparation patch as you suggest.

> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > index 84fd57b76fad..3666893acb69 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > @@ -6,6 +6,7 @@
> >  
> >  #include "common.h"
> >  #include "stmmac.h"
> > +#include "stmmac_pcs.h"
> >  #include "stmmac_ptp.h"
> >  #include "stmmac_est.h"
> >  
> > @@ -116,6 +117,7 @@ static const struct stmmac_hwif_entry {
> >  	const void *tc;
> >  	const void *mmc;
> >  	const void *est;
> > +	const void *pcs;
> 

> I'm not a fan of void pointers. common.h includes linux/phylink.h, which
> will define struct phylink_pcs_ops, so there is no reason not to declare
> this as:
> 
> 	const struct phylink_pcs_ops *pcs;

So am I. But in this case we have all the ops fields defined as voids.
So I just followed the local convention.

Anyway, I failed to find out the reason of using void pointers here.
So locally, in one of my cleanup patchesets, I've got them converted
to the typed pointers. I can submit that patch as another preparation
patch to this series. Then we can use the pointer to phylink_pcs_ops
with no doubts. What do you think?

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
