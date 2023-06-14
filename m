Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0611173028B
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 16:58:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5AF0C6A617;
	Wed, 14 Jun 2023 14:58:44 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B549FC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 14:58:43 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-3f8d258f203so6443385e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686754723; x=1689346723;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=cwHOEAiF9KfcpBV2FsuQGv04SjS1N5o4UGAs/GJkRIM=;
 b=HrgN3iTZqEJnZ+cWUam2y0hNTwU7zJQIh+PO2OOD1V0dKK6Day4ODu61szESSCbcVg
 8nECpsSl57fgDUiNVhyWExWfwOKMrDojt4Mw2EyAgDm4RLWeRScrIYMlERBFgZySiuMy
 VDg6BE6FvUSGBzdoOT0k7Wqa+gHrrXVM8hMTARr4fL7mY9IDKASQrP+ub1K5Z2OBGKtp
 4k4F3SzICfcZg1djHXBtey23xFNDUyAmIaTa9P/ssQe7DlCGSz8nsJl1mUnGYyIyBJ+N
 /yFNP9kWASak6rO6lZ/d5e+a7Js7yLeG685kqdZnQpSz3zMP7SPknRbe426IrgA9UEPa
 cZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686754723; x=1689346723;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cwHOEAiF9KfcpBV2FsuQGv04SjS1N5o4UGAs/GJkRIM=;
 b=alWFufSh+J1GH1EoropGgfX9ZP5fNAbALjYa6JngoehHvgP7Hjirl6/Dl1bSKvUsnP
 L2mStzLIGsBAdYKZS0/LtAQJiu7M1d9XIMepalD62FBRrUa9Qa3oucLAfNI7+clKMxDc
 6BJnWl9hsq58gHRgwuEQzkrWn+76mx13B5WiRwy2H2C8weJGBLwH+UdOZ0zUmoblOg22
 EmAz+9UC0SCvX4v/kxA2SBL3cemOh9v2cW5QRKpw94EnukmR0Hotykb6zHgZES7UUox+
 2ns+yV9EI0gDAzKT604NGOF+Maf25HCkNSdGxYEEsk43Iymt5kvyjmg58KIkwwte9bHY
 VpzQ==
X-Gm-Message-State: AC+VfDwa50wiDUp26HTBzaC2dDjp0L6EmZunUjoHzqFFmHf0ErVTO2Kk
 g1GxNu/Hd/zrTdw99mBZzJA=
X-Google-Smtp-Source: ACHHUZ42J+w43AeCv+jIRznzv9mpK6x3YnnHigR05cUDdfxwPzyO8LQJ2mQRRGGDh7MzUrt4gXUKKQ==
X-Received: by 2002:a1c:6a18:0:b0:3f6:a966:ee8d with SMTP id
 f24-20020a1c6a18000000b003f6a966ee8dmr9847496wmc.26.1686754722830; 
 Wed, 14 Jun 2023 07:58:42 -0700 (PDT)
Received: from Ansuel-xps. (93-34-93-173.ip49.fastwebnet.it. [93.34.93.173])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a1c740b000000b003f733c1129fsm17703302wmc.33.2023.06.14.07.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 07:58:42 -0700 (PDT)
Message-ID: <6489d5a2.1c0a0220.c53b2.acb0@mx.google.com>
X-Google-Original-Message-ID: <ZIl3zACHBZmrk/8o@Ansuel-xps.>
Date: Wed, 14 Jun 2023 10:18:20 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Simon Horman <simon.horman@corigine.com>
References: <20230614073241.6382-1-ansuelsmth@gmail.com>
 <ZInUzhOZ/3TGSQl9@corigine.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZInUzhOZ/3TGSQl9@corigine.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 stable@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net PATCH] net: ethernet: stmicro: stmmac: fix
 possible memory leak in __stmmac_open
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

On Wed, Jun 14, 2023 at 04:55:10PM +0200, Simon Horman wrote:
> On Wed, Jun 14, 2023 at 09:32:41AM +0200, Christian Marangi wrote:
> > Fix a possible memory leak in __stmmac_open when stmmac_init_phy fails.
> > It's also needed to free everything allocated by stmmac_setup_dma_desc
> > and not just the dma_conf struct.
> > 
> > Correctly call free_dma_desc_resources on the new dma_conf passed to
> > __stmmac_open on error.
> > 
> > Reported-by: Jose Abreu <Jose.Abreu@synopsys.com>
> > Fixes: ba39b344e924 ("net: ethernet: stmicro: stmmac: generate stmmac dma conf before open")
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > Cc: stable@vger.kernel.org
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index fa07b0d50b46..0966ab86fde2 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -3877,10 +3877,10 @@ static int __stmmac_open(struct net_device *dev,
> >  
> >  	stmmac_hw_teardown(dev);
> >  init_error:
> > -	free_dma_desc_resources(priv, &priv->dma_conf);
> >  	phylink_disconnect_phy(priv->phylink);
> >  init_phy_error:
> >  	pm_runtime_put(priv->device);
> > +	free_dma_desc_resources(priv, dma_conf);
> 
> Hi Christian,
> 
> Are these resources allocated by the caller?
> If so, perhaps it would be clearer if a symmetric approach
> was taken and the caller handled freeing them on error.
>

Yes, they are. Handling in the caller would require some additional
delta to this and some duplicated code but if preferred I can implement
it. I can provide a v2 shortly if it's ok and you prefer this
implementation.

> >  	return ret;
> >  }
> >  
> > -- 
> > 2.40.1
> > 
> > 

-- 
	Ansuel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
