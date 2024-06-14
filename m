Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5B5908350
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 07:28:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CC83C6C83A;
	Fri, 14 Jun 2024 05:28:56 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BC15C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 05:28:49 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-6f9a4f9923aso940862a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2024 22:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718342928; x=1718947728;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dw/wpX2rAqV+uUeAuGGK7ciQ1Eeb9FNFDIAoWNVW3Fw=;
 b=g49txHU8LtTcL5/y1e1+antTuXW/pKrk4wcgjuT+VrPobwFu2Mj3zA5Ve6A/mE1NyV
 yjvf6Z+s+JxY8aZm2BUo33D9KmGu3vsL8KGzdRnTjj5KOJDwi3QnoasYtMJj9KSateiU
 i/NVd2qKQACkgCAQx6b9roK0z5jh6A6eR9nKu3e/mZmgylKZClIuPItCKMOG0kNs9n17
 X8gdoLTfkUzntGhQpL+QaPegNGpRs931mfXBgWCpd2p++irOvgk8QtkCWQam5nm4Ib5N
 kIsr/yGlCBotIno3eWofrTfeb5xSQpiwl/SGwpiey4SrIMBeZjb9q+SEK13z148lyg+z
 7E3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718342928; x=1718947728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dw/wpX2rAqV+uUeAuGGK7ciQ1Eeb9FNFDIAoWNVW3Fw=;
 b=B4BtEZkLTx4LOFaRaXUf2vzhw9asFMYmJ0c9yklGuVPFiS2bWUomqOAqwXgNbr7H8d
 vaGcVXsWS0b8dtro/7rdjQEDWtA5OfJblu++rJkxyD8Z0txt0giqY0htXTVTJ9wjYjO9
 aEPa58W5Bp+CUReCAafHHZBHiFZkaZilepUiHOCsAWMHzGAx3lam6TkBiyyIaBBBRF8j
 3GLTdX8H8cpRlXAAj7o1F9DgFWXQLE/hpPAVohQJCVaPELUmht2AMsrCArAHiVC+d0eS
 Ur/MKMZ1C4G2kxawy3lmhnVwGTqWrH16y/M6PbFwMpOTW3xVJgGFdmhrRbOtU51icdNC
 ZByQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF/6MQZwvBiAO7CzlPRbM4PMktU2M//l/xltqayZSJ3uCAkm71ndTcqHIUlqMy+FRoWwumDvRzaw1uQzFE7BJJGkGImvXgBFXE1hp4EHddIPUu5Ocl7n6m
X-Gm-Message-State: AOJu0Yz2MNOsf7no9wRSRZvg9jzt0Bxm82I2Ym5Y2o/ibHNxkjjMYRkR
 AZcHd9BNVCWhjarkGEXxlSu71XwYjmsrlbxpponmy+Y3r52Ac5wV
X-Google-Smtp-Source: AGHT+IHGmC3uIyBCAhuw0E+MosfhQS9mHFZU4B9Da80064YdPUcHuTQB2Xbr9RyhO+OvfFAHopjXmg==
X-Received: by 2002:a05:6870:41d4:b0:254:a09c:6ddf with SMTP id
 586e51a60fabf-2584298e0ffmr1896203fac.24.1718342928140; 
 Thu, 13 Jun 2024 22:28:48 -0700 (PDT)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc91f699sm2242495b3a.36.2024.06.13.22.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 22:28:47 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:28:35 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20240614132835.000025bb@gmail.com>
In-Reply-To: <ZmrN2W8Fye450TKs@shell.armlinux.org.uk>
References: <20240613023808.448495-1-0x1207@gmail.com>
 <ZmrN2W8Fye450TKs@shell.armlinux.org.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Corinna Vinschen <vinschen@redhat.com>, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: Enable TSO on
	VLANs
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

On Thu, 13 Jun 2024 11:45:45 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Thu, Jun 13, 2024 at 10:38:08AM +0800, Furong Xu wrote:
> > @@ -4239,16 +4239,32 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
> >  	struct stmmac_txq_stats *txq_stats;
> >  	int tmp_pay_len = 0, first_tx;
> >  	struct stmmac_tx_queue *tx_q;
> > -	bool has_vlan, set_ic;
> > +	bool set_ic;
> >  	u8 proto_hdr_len, hdr;
> >  	u32 pay_len, mss;
> >  	dma_addr_t des;
> >  	int i;
> > +	struct vlan_ethhdr *veth;
> >  
> >  	tx_q = &priv->dma_conf.tx_queue[queue];
> >  	txq_stats = &priv->xstats.txq_stats[queue];
> >  	first_tx = tx_q->cur_tx;
> >  
> > +	if (skb_vlan_tag_present(skb)) {
> > +		/* Always insert VLAN tag to SKB payload for TSO frames.
> > +		 *
> > +		 * Never insert VLAN tag by HW, since segments splited by
> > +		 * TSO engine will be un-tagged by mistake.
> > +		 */
> > +		skb_push(skb, VLAN_HLEN);
> > +		memmove(skb->data, skb->data + VLAN_HLEN, ETH_ALEN * 2);
> > +
> > +		veth = skb_vlan_eth_hdr(skb);
> > +		veth->h_vlan_proto = skb->vlan_proto;
> > +		veth->h_vlan_TCI = htons(skb_vlan_tag_get(skb));
> > +		__vlan_hwaccel_clear_tag(skb);
> > +	}  
> 
> I think drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c::
> otx2_sq_append_skb() does something similar, but uses a helper
> instead:
> 
>         if (skb_shinfo(skb)->gso_size && !is_hw_tso_supported(pfvf, skb)) {
>                 /* Insert vlan tag before giving pkt to tso */
>                 if (skb_vlan_tag_present(skb))
>                         skb = __vlan_hwaccel_push_inside(skb);
>                 otx2_sq_append_tso(pfvf, sq, skb, qidx);
>                 return true;
>         }
> 
> Maybe __vlan_hwaccel_push_inside() should be used here?
> 

Yes, it should. Thanks for your comments.
I will send a new patch.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
