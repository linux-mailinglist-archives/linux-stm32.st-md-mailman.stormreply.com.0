Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BADB980EEBE
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 15:28:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E737C6C856;
	Tue, 12 Dec 2023 14:28:42 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96AB6C6B47F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 14:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702391320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sic7JgTbCqXENzuaXidvmcJDkf8Pxtwv2IpV4/8llXA=;
 b=hrXg1Qz2qMriIzzDLT0EsESX/OqA3/o0ZhbZiH+ntnvNebIQpWuf+gcjg2eJqbBBcMFl9H
 QXPoWaF1XEncqvDNQfo6GZ9wlfwTrsERE8O3LQVgkSYZr1rj/VtkCc21Z6bT7TIDnmHGrE
 Z0O1H4aPEs4cgbupVw2TpWYf/XH0j+0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-Z01eGIkfMnOew6VFkhbiRQ-1; Tue, 12 Dec 2023 09:28:39 -0500
X-MC-Unique: Z01eGIkfMnOew6VFkhbiRQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-67ab0fa577fso78794026d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 06:28:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702391319; x=1702996119;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sic7JgTbCqXENzuaXidvmcJDkf8Pxtwv2IpV4/8llXA=;
 b=uwjHhxEZyaunl/yCwnm4iCx+eesJjfM4lwQgOmq1qLdkfAsYo6cO2nyeHYIeNt/kiJ
 FZ/vy5cTIOMT3jRTTychT9rb7YtIULEXmKrpEK0BZTlCFvLh7lmLNmEg+cnbK+UQmLvI
 RiNqlQZSZK/ucjPJ1BbNhhnZaGmWPFCaO3wfxSMwCrFwMviQk+0uUTDheb6gNrLMULO6
 4WFSxbyUmf6B5lWFlrZQHa/GmgDe5n3/B2YUga3iKoA1p7nqMKQ9Ud7tkImOJruLzqaK
 ydz8K80hFsYV8q0vDixmE/AQyN6DvKgu3r5FPuXz+DhVyiohcIVXQQK4QOXs3QGFvKvg
 /xVA==
X-Gm-Message-State: AOJu0YwbEM2AgQMpPuSVPI9t8E2Y6HRg5BA7ZFMc6yrtNEPIqp/d7tNy
 cUh0Dr7MiKDCuvfUVnSOaxKmVZfTNqMM1z3Ty+Nr5MZPWC7AvJLkuGRQK04GNtyzlrXE4n7ZCIC
 JfhiZs6ao11B5gZM9E3gJLGGdLiBopMUF+XMtNZno
X-Received: by 2002:a05:6214:c25:b0:67a:a721:830b with SMTP id
 a5-20020a0562140c2500b0067aa721830bmr7837488qvd.101.1702391318792; 
 Tue, 12 Dec 2023 06:28:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHOEPNqyZdk9QNuyLbwX1ImY1txSg6BBuVoLWOx94ej3ijMZxTQS0qC/sSDGxEP2PvMWaFUg==
X-Received: by 2002:a05:6214:c25:b0:67a:a721:830b with SMTP id
 a5-20020a0562140c2500b0067aa721830bmr7837469qvd.101.1702391318451; 
 Tue, 12 Dec 2023 06:28:38 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 jr12-20020a0562142a8c00b0067a14d996e9sm4231045qvb.1.2023.12.12.06.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 06:28:37 -0800 (PST)
Date: Tue, 12 Dec 2023 08:28:35 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <d7vwj7p55ig7fjste3ctqwpccuoowh2ryqnmcxq3qqrn6exzjd@z5mbsitxbupk>
References: <20231211-b4-stmmac-handle-mdio-enodev-v1-1-73c20c44f8d6@redhat.com>
 <ggbqvhdhgl6wmuewqtwtgud7ubx2ypmnb3p6p6w7cy37mnnyxn@2eqd63s2t5ii>
MIME-Version: 1.0
In-Reply-To: <ggbqvhdhgl6wmuewqtwtgud7ubx2ypmnb3p6p6w7cy37mnnyxn@2eqd63s2t5ii>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Handle disabled MDIO
 busses from devicetree
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

On Tue, Dec 12, 2023 at 01:59:25PM +0300, Serge Semin wrote:
> On Mon, Dec 11, 2023 at 03:31:17PM -0600, Andrew Halaney wrote:
> > Many hardware configurations have the MDIO bus disabled, and are instead
> > using some other MDIO bus to talk to the MAC's phy.
> > 
> > of_mdiobus_register() returns -ENODEV in this case. Let's handle it
> > gracefully instead of failing to probe the MAC.
> > 
> > Fixes: 47dd7a540b8a (net: add support for STMicroelectronics Ethernet controllers.")
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> > index fa9e7e7040b9..a39be15d41a8 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> > @@ -591,7 +591,13 @@ int stmmac_mdio_register(struct net_device *ndev)
> >  	new_bus->parent = priv->device;
> >  
> >  	err = of_mdiobus_register(new_bus, mdio_node);
> > -	if (err != 0) {
> > +	if (err) {
> > +		if (err == -ENODEV) {
> > +			/* The bus is disabled in the devicetree, that's ok */
> > +			mdiobus_free(new_bus);
> > +			return 0;
> > +		}
> > +
> >  		dev_err_probe(dev, err, "Cannot register the MDIO bus\n");
> >  		goto bus_register_fail;
> >  	}
> 
> This can be implemented a bit simpler, more maintainable and saving
> one indentations level:
> 
> 	err = of_mdiobus_register(new_bus, mdio_node);
> 	if (err == -ENODEV) {
> 		err = 0;
> 		dev_warn(dev, "MDIO bus is disabled\n");

Thanks for all your reviews, I agree this is cleaner!

I'm going to opt to use dev_info() here as this isn't something that's
wrong, just worth noting.

> 		goto bus_register_fail;
> 	} else if (err) {
>   		dev_err_probe(dev, err, "Cannot register the MDIO bus\n");
>   		goto bus_register_fail;
> 	}
> 
> -Serge(y)
> 
> > 
> > ---
> > base-commit: bbd220ce4e29ed55ab079007cff0b550895258eb
> > change-id: 20231211-b4-stmmac-handle-mdio-enodev-82168de68c6a
> > 
> > Best regards,
> > -- 
> > Andrew Halaney <ahalaney@redhat.com>
> > 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
