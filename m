Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B06946386
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 21:02:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 451BEC7129D;
	Fri,  2 Aug 2024 19:02:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B85D1C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 19:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722625350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3mGGPNMYW+PwVsxgLN/1XKLLl4dJIQ78l9NLO9EBmCQ=;
 b=KAL/QI0hKl/PP2T3dknRUJJJL0eLb8a8DuHZIljFTVgPTihcL5IIk4BnmfwMbbUG/tKR1h
 aZCEfr9F/D4ncnzjKhv0/Atjw/1pQTkp/nV8f+fGx9cfU9LY6OpfRXhJIdyMDoftwbSHij
 TgwlqX8RM71sGYw+wZdUBFU3iYxgugc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-vRNIL-xzMA2LV0MpO1O_kA-1; Fri, 02 Aug 2024 15:02:29 -0400
X-MC-Unique: vRNIL-xzMA2LV0MpO1O_kA-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7a1d690cef9so705951885a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Aug 2024 12:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722625349; x=1723230149;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3mGGPNMYW+PwVsxgLN/1XKLLl4dJIQ78l9NLO9EBmCQ=;
 b=TwzpWcxsedaMo+W++bn4g0vL04rBRuhoMZn/OtU+bamwgH/Cr4VUV5N0dkFyr5sBk7
 m/gOpvOJ8ZzeJ3vd9Ik5oNm1ZYsfT16EB5yIx5RQI7GOH7u1ED2fS6cD7kWl9hbt58/U
 tjSObU7snTlNgl1Qr12yIJkhKrRswkBvITrZH+a9+WTu6viyECik3AcLPeoXI+AgOWSm
 IkpRGrQ9EXKUva4VC+vPO+Mnb9tHJh+Tda7vH8Re64nGcOoal0lEsXafpCeb96I3W7Mi
 Q8jNk9VEKEpk8Y2Feljt+KnkSvZ+vctbZ/Sl2MPN94cYq2AVOTF/+xDnNktyFI+7cakv
 oPhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPHm+NUKUShJq0eA5M9IzygylF8kVGb3DaizDy5LZXh/CXXnCJPMg/WLxCyvl3jpYEZzfRSZKOFqusOo25yhUbGdJbVJuZorIOfRhcxNMd1wmS2bF33D6i
X-Gm-Message-State: AOJu0Yyu1n02v9dJIDG4kEaU7FuIu9B3LEwBqwdFq7uXsqMvYlYP7vLp
 Cw90QKtTIBU4tUq96Z9ZC/RCiSEAXGtCQQRxCOunvaLGn1W7jNMTcBitszfhn6PudNwjZzu+YkX
 30nMzkkwm58r4M8Mc71Ncy3NDHxc+i/jKacTRp552PTAeSnwI63K71GsMWwMO0WNATU1ctDDo5M
 DJSw==
X-Received: by 2002:a05:620a:3904:b0:7a1:df8e:3266 with SMTP id
 af79cd13be357-7a34c06899cmr982695785a.16.1722625348939; 
 Fri, 02 Aug 2024 12:02:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfNmVNiVUXQYiFVSaa9qpl6QZ/E/1LfvB87rHqYLChQThUb1cOPW5N5oeiv7xY8fOXZ6JvXw==
X-Received: by 2002:a05:620a:3904:b0:7a1:df8e:3266 with SMTP id
 af79cd13be357-7a34c06899cmr982691085a.16.1722625348564; 
 Fri, 02 Aug 2024 12:02:28 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a34f6e7d6esm111860785a.36.2024.08.02.12.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 12:02:28 -0700 (PDT)
Date: Fri, 2 Aug 2024 14:02:25 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <ij562xfhvgxmvpgh2l6rhsvcpi43yvvkvef4wgpjupwusi6uwy@cpnkopeu7cpc>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpoq-000eHy-GR@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sZpoq-000eHy-GR@rmk-PC.armlinux.org.uk>
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

On Fri, Aug 02, 2024 at 11:47:32AM GMT, Russell King (Oracle) wrote:
> The pcs_ctrl_ane() method is no longer required as this will be handled
> by the mac_pcs phylink_pcs instance. Remove these methods, their common
> implementation, the pcs_link, pcs_duplex and pcs_speed members of
> struct stmmac_extra_stats, and stmmac_has_mac_phylink_select_pcs().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

...

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 3c8ae3753205..799af80024d2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -321,48 +321,6 @@ static int stmmac_ethtool_get_link_ksettings(struct net_device *dev,
>  {
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  
> -	if (!(priv->plat->flags & STMMAC_FLAG_HAS_INTEGRATED_PCS) &&

This change effectively makes the INTEGRATED_PCS flag useless, I think
we should remove it entirely.

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
