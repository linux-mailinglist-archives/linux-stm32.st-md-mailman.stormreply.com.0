Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 902DD91850A
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 16:58:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BF2DC71282;
	Wed, 26 Jun 2024 14:58:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F83DC6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 14:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719413910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Aya9QIUU1dceOpRSHwLiYWRs5fBhpIvpFHsqd9ObPGw=;
 b=hqVCury/LQW1aL/8KmtaUXBsFDVQnQ8vlQQhQzgF8hcEE2clW4InEuFa5NsEvwaZc+FcNq
 FPpJ1VXIc+0IMqMBeXX1tfgyFMnT6E3RAJZRjv1Kr5RNCQZD1R0ydvnENKypYMWgb7HE+n
 w75JcN7Okr4H9IIXB4U0ndLI4OBZ8DU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-Rnqs4aYTMoyWZ7zTuAJ-vQ-1; Wed, 26 Jun 2024 10:58:28 -0400
X-MC-Unique: Rnqs4aYTMoyWZ7zTuAJ-vQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6b500743a3fso102416436d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 07:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719413908; x=1720018708;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aya9QIUU1dceOpRSHwLiYWRs5fBhpIvpFHsqd9ObPGw=;
 b=d1wskPW2Bvxq91iLIgnLsnb7q6YqTEL0hyTKYMcEBgfDsGx0Z9Br9VPFuZHmBVoA3H
 8SFeZ2djONpXmP9BDZ58T3+5dmpI9ZvTPcbl8fI7PJIcQn00jIDi72+bF7eMbIhMRnvT
 gap9b0tdFBxIaFRsujZ+LAYUiZ5lOKrZX+e4PVerZZqBuN3hmvDwq7XKaVvjl06CNjkE
 9UzQK7LIsi6hqtLNeGoAdosDkX0y5qPGPOMwOGubkpKhBBIYpVEk47jH5CtPdhW7HRvX
 C0omvSGyXU/pNlyvoFhqB+L1ukifPlEFcwnuiqrDl+YP3aBqChh9Ot/0tOhSoZqYZEBy
 MFGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/CGu3fdouiz4Pu4nYQd8fuiP9rx3+MRNQQ3QpV0IaMI7oTjrC05/iqwpGAiKWtvXR2087+olXnHLLYLOTw4zZn28xnbMD71wqxXYVI4yirhXxRuC+10is
X-Gm-Message-State: AOJu0Yw4JIV7X2k0JkWnNWBynpVyBlMrFaw+/mCmYxEYnoM0xUcoVXx/
 ZXpo5oOKpawDbZq81lLgoqMTmxjOgJvD9flnW+w5JsVd89TyNVHel6lG+lwox1ZHLosP0Q34O55
 MCvq8vtqXz9SU/A4xHa3Iwp7Agz4CZRwb8h0xv7sSp3T8Ury3UOPsKbvKJvlgdO/O5VTd9nEPP6
 SLjQ==
X-Received: by 2002:ad4:424e:0:b0:6b4:fe0c:1a92 with SMTP id
 6a1803df08f44-6b53bff41abmr121545806d6.43.1719413908143; 
 Wed, 26 Jun 2024 07:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6nPLCGa2C50EKUtysGXYh0LMEa5egqmh4lDlG99IlgJl3jje0UqDxnnZntsdaxpPxTw2dxA==
X-Received: by 2002:ad4:424e:0:b0:6b4:fe0c:1a92 with SMTP id
 6a1803df08f44-6b53bff41abmr121545616d6.43.1719413907762; 
 Wed, 26 Jun 2024 07:58:27 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::f])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b531673e6esm42461056d6.85.2024.06.26.07.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 07:58:27 -0700 (PDT)
Date: Wed, 26 Jun 2024 09:58:24 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Message-ID: <qf4zl7qupkzbrb6ik4v4nkjct7tsh34cmoufy23zozcht5gch6@kvymsd2ue6cd>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-3-eaa7cf9060f0@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240625-icc_bw_voting_from_ethqos-v2-3-eaa7cf9060f0@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/3] net: stmmac: Bring down the clocks
 to lower frequencies when mac link goes down
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

On Tue, Jun 25, 2024 at 04:49:30PM GMT, Sagar Cheluvegowda wrote:
> When mac link goes down we don't need to mainitain the clocks to operate
> at higher frequencies, as an optimized solution to save power when
> the link goes down we are trying to bring down the clocks to the
> frequencies corresponding to the lowest speed possible.
> 
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index ec7c61ee44d4..f0166f0bc25f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -996,6 +996,9 @@ static void stmmac_mac_link_down(struct phylink_config *config,
>  {
>  	struct stmmac_priv *priv = netdev_priv(to_net_dev(config->dev));
>  
> +	if (priv->plat->fix_mac_speed)
> +		priv->plat->fix_mac_speed(priv->plat->bsp_priv, SPEED_10, mode);
> +
>  	stmmac_mac_set(priv, priv->ioaddr, false);
>  	priv->eee_active = false;
>  	priv->tx_lpi_enabled = false;
> @@ -1004,6 +1007,11 @@ static void stmmac_mac_link_down(struct phylink_config *config,
>  
>  	if (priv->dma_cap.fpesel)
>  		stmmac_fpe_link_state_handle(priv, false);
> +
> +	stmmac_set_icc_bw(priv, SPEED_10);
> +
> +	if (priv->plat->fix_mac_speed)
> +		priv->plat->fix_mac_speed(priv->plat->bsp_priv, SPEED_10, mode);


I think you're doing this at the beginning and end of
stmmac_mac_link_down(), is that intentional?

I'm still curious if any of the netdev folks have any opinion on scaling
things down like this on link down.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
