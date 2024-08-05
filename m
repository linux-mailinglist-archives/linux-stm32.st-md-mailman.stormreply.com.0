Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB1A947DA8
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2024 17:07:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E1FBC71289;
	Mon,  5 Aug 2024 15:07:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67A18C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Aug 2024 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722870457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o4HYh4hoxDN/J50E0Jnd1FVXoMrne/Iur0T/sKC6Q7c=;
 b=TF1Q4GEuPjdGa+mNgFC4Ca/WeSMRgSZ7D0bH0feXHlt0+3mXCNDU7dQwZUO9Em66n6bjZt
 M1/RTL7TN6uSgJ4MrjHEZmVDeA74xUhGajIyt2QvuwWs3vwg3pnoMEjqMy5zbUNuSip3yu
 qysp8B+CeOyCy9UP9G8O/RKb/onyLd8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-fwKwdAXHOmqicQn8dqUuow-1; Mon, 05 Aug 2024 11:07:36 -0400
X-MC-Unique: fwKwdAXHOmqicQn8dqUuow-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-79efb1181ddso1154123385a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Aug 2024 08:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722870455; x=1723475255;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o4HYh4hoxDN/J50E0Jnd1FVXoMrne/Iur0T/sKC6Q7c=;
 b=BDG1ciauW0Elaw5gMLtfjtMk5UiTG65ba6YmaCYcuSOwvo4IVevqdKxo+nNhqLP+DR
 B9PDOTbiJdeteK0rjV2ZLS9j1K7EmKDXqpSxYtI7ypSJABYsjHYg7j4bOfZkmBOwHjqG
 QDiONqzDQ6uOzYMr6PKN92ocCtWC8cshaW8r4Jb1fcu794KZMr+r8cqxV69a31DJ8sdN
 qY2XBFvdQXLBiQfFU3nd9cfdEZ6oB5D2B0074WyrjP/8licBJWXFZ/Od7b+6Dhi/kt0q
 WxuY/TvfrdIpMJUSTtgnJF4PArF/2A/uX1rw8CjwNDDzAiSN2AQj14xICwPPx63fVzR9
 AJAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0PvYX0DbhLb46oOjDCpUpCKbS6IB9zg5ihQGiZh9ntj1lFbCRjxKW+StBJtaW4fRv8UDJs62PW9abBU6v0pH5DI5R98igyvTWbiUKhTJCQ4QpIITDFh73
X-Gm-Message-State: AOJu0YxWUumsiQ9E5i6rkHlq4B3HsEUGOzQUUVqB/4++sKchXUUb+YF3
 NNliRKNtVKpX8tOENjKBC2sUBVkofo+1kO/Wswh3U4Ox75nD0iaIoGGz8EF0xB0uu47/XN6ACVB
 BuDZ9AnEqRKfU2XmjloWX8pBF6pYPuU3eH7lBqKIdDramsztpitXGlq+y01TRftnZj1Q2pyhQkk
 hSwg==
X-Received: by 2002:a05:620a:29cb:b0:79d:5b8b:7ad0 with SMTP id
 af79cd13be357-7a34efca052mr1437715685a.65.1722870455377; 
 Mon, 05 Aug 2024 08:07:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyKUHpuaat+IlBO9jx6OMHcFHgn9Vn6iJEHthO0hM/eX95XRxJJxYlt4N6aAWmvQ48FL1ypg==
X-Received: by 2002:a05:620a:29cb:b0:79d:5b8b:7ad0 with SMTP id
 af79cd13be357-7a34efca052mr1437711685a.65.1722870455002; 
 Mon, 05 Aug 2024 08:07:35 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::13])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a34f78adadsm360064485a.123.2024.08.05.08.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 08:07:34 -0700 (PDT)
Date: Mon, 5 Aug 2024 10:07:32 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <hrvupeqc2pgoqa7ecg5rtg657eyxwpe4eg7xl4o3ij4upqxyvt@iwplq3uo72kt>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpoq-000eHy-GR@rmk-PC.armlinux.org.uk>
 <ij562xfhvgxmvpgh2l6rhsvcpi43yvvkvef4wgpjupwusi6uwy@cpnkopeu7cpc>
 <Zq0yAjzrpIEhcHBZ@shell.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <Zq0yAjzrpIEhcHBZ@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Vinod Koul <vkoul@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 13/14] net: stmmac: remove
 obsolete pcs methods and associated code
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

On Fri, Aug 02, 2024 at 08:22:42PM GMT, Russell King (Oracle) wrote:
> On Fri, Aug 02, 2024 at 02:02:25PM -0500, Andrew Halaney wrote:
> > On Fri, Aug 02, 2024 at 11:47:32AM GMT, Russell King (Oracle) wrote:
> > > The pcs_ctrl_ane() method is no longer required as this will be handled
> > > by the mac_pcs phylink_pcs instance. Remove these methods, their common
> > > implementation, the pcs_link, pcs_duplex and pcs_speed members of
> > > struct stmmac_extra_stats, and stmmac_has_mac_phylink_select_pcs().
> > >
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> >
> > ...
> >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > > index 3c8ae3753205..799af80024d2 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > > @@ -321,48 +321,6 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
> > >  {
> > >  	struct stmmac_priv *priv = netdev_priv(dev);
> > >
> > > -	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&
> >
> > This change effectively makes the INTEGRATED_PCS flag useless, I think
> > we should remove it entirely.
>
> I'm hoping the ethqos folk are going to test this patch series and tell
> me whether it works for them - specifically Sneh Shah who added
>
> 	net: stmmac: dwmac-qcom-ethqos: Add support for 2.5G SGMII
>
> which directly configures the PCS bypassing phylink. Specifically,
> if this in stmmac_check_pcs_mode():
>
> 	priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII
>
> is true for this device, then we may be in for problems. Since
> priv->dma_cap.pcs comes from hardware, it's impossible to tell
> unless one has that hardware.

Hopefully we get a response there. For what its worth I have a
access to the sa8775p-ride.dts board in a remote lab and
dma_cap.pcs is definitely set for this integration of the IP
on sa8775p. The only upstream described boards are:

    1) sa8775p-ride
    2) sa8775p-ride-r3

The difference is that "r3" is the latest spin of the board, with some
Aquantia phys attached to the 2 stmmac MACs on the board instead of the
Marvell 88EA1512 phys on the former. My understanding is that's to
evaluate 2500 Mbps speeds (the 88EA1512 only goes up to 1000 Mbps).

The "r3" board's Aquantia aqr115c's are capable of 2500 Mbps, but are
"overclock SGMII". The "r3" describes the phy interface as 2500base-x,
with no in-band signalling (since the "OCSGMII" is hacked up and doesn't
really do the in-band signalling you've described in the past). That's
all based on Bart's commit message adding support for that in:

    0ebc581f8a4b7 net: phy: aquantia: add support for aqr115c

I think Sneh also had access to a board with the sa8775p in a fixed-link
configuration doing 2500 Mbps, but that's not described upstream at the
moment. I believe that was the board that originally motivated the patch
you highlighted from him.

At the very least Bartosz and I tested this and things didn't break
noticeably for the 2 boards I listed above... so that's good :)

Hope that helps,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
