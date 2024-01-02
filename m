Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AF5822284
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jan 2024 21:26:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0A32C6DD69;
	Tue,  2 Jan 2024 20:26:43 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26B4BC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jan 2024 20:26:43 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-3bbbf5a59b7so4877280b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Jan 2024 12:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704227202; x=1704832002;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ND+OLXd8ysMaukWUwVdTBQu9Bq4kTBqMzqgELsTouEM=;
 b=U6Qj23Bxf/XNbrTmNEuUQOzpoPopO47YIM79JaXZD5xrNWZ3vhxf8x/i8r/BBY8G1W
 j5sGfKfb5BccYjE5iUzpeMO9pH6lJJslB/rjgh38g5qqC/6euAExmii7XcvveP6eWsXU
 whUQSW1vdPSAh6uNHvpmxfblYNLxpOrXnSw2m6mSnCj2g6nUmTDUiKIhsnAf4rNCakjp
 qVOqH3AuTI3xnUo+1/PRFPW4Mgdupub9poLd4+xXcnXiZgbe5zkvzD4rpIFioXz7pIi9
 nEX0CzpbRhuOxK8NqfyfXqoOlpo3I1emxPtmE0qmCgZarBUWcOnMn3/e9cXzOXFFluUk
 SSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704227202; x=1704832002;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ND+OLXd8ysMaukWUwVdTBQu9Bq4kTBqMzqgELsTouEM=;
 b=XTbl0TS4e9ZbTPiXwe/opxCPeFmMQDJEF/p21gEf5owyctrdYnkCHb2n/l6g6rvUxN
 Y3uoltqw7IxdSS+txnLqmpckpP6XX4j6aEC0QkG8ByAnFjGSnPfGUtFXyFT50Y2L9/A1
 FCFpNtNpfoIagmv+zDFm/gGFFXAx3BZmZsJmVu7r1SlP4yagFLr/tfWrs7UgTvT5xgpj
 Fhhc7LAu/dhJRpTbK7ZTPFuSwYUbmquGU6dcvQNRZKo1TnjprR0PvM6c4+Jg+Gq7prcp
 sjTEZs1Mb7WceBoAkxxkwhkdZ1g0jISRPakuXwb7D4M1JiziOIWAieD3UyHtT16uiSC0
 47FQ==
X-Gm-Message-State: AOJu0YwzSvJ4TkcdACAw7FnLni11NY0VwZnr1ak9il4WyRBwHMi/13dk
 WIdi1OLKSXuzUdoPGLVZ9qU=
X-Google-Smtp-Source: AGHT+IECf2pCqyhQfLb0z19B9usr5kRSPtS6GrVnfDloU3HnQVX6HP0jstc9NMMeueOf/oK5pNIl0A==
X-Received: by 2002:a05:6808:18a8:b0:3bc:187b:545c with SMTP id
 bi40-20020a05680818a800b003bc187b545cmr1915272oib.57.1704227201778; 
 Tue, 02 Jan 2024 12:26:41 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 n3-20020ad444a3000000b00680b1090832sm1898429qvt.146.2024.01.02.12.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jan 2024 12:26:40 -0800 (PST)
Message-ID: <e2250240-db19-4cb6-93ca-2384a382cdd5@gmail.com>
Date: Tue, 2 Jan 2024 12:26:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Romain Gantois <romain.gantois@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
References: <20240102162718.268271-1-romain.gantois@bootlin.com>
 <20240102162718.268271-2-romain.gantois@bootlin.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240102162718.268271-2-romain.gantois@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 Pascal EBERHARD <pascal.eberhard@se.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: Prevent DSA tags
 from breaking COE on stmmac
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 1/2/24 08:27, Romain Gantois wrote:
> Some DSA tagging protocols change the EtherType field in the MAC header
> e.g.  DSA_TAG_PROTO_(DSA/EDSA/BRCM/MTK/RTL4C_A/SJA1105). On TX these tagged
> frames are ignored by the checksum offload engine and IP header checker of
> some stmmac cores.
> 
> On RX, the stmmac driver wrongly assumes that checksums have been computed
> for these tagged packets, and sets CHECKSUM_UNNECESSARY.
> 
> Add an additional check in the stmmac tx and rx hotpaths so that COE is
> deactivated for packets with ethertypes that will not trigger the COE and
> ip header checks.
> 
> Fixes: 6b2c6e4a938f ("net: stmmac: propagate feature flags to vlan")
> Cc: stable@vger.kernel.org
> Reported-by: Richard Tresidder <rtresidd@electromag.com.au>
> Closes: https://lore.kernel.org/netdev/e5c6c75f-2dfa-4e50-a1fb-6bf4cdb617c2@electromag.com.au/
> Reported-by: Romain Gantois <romain.gantois@bootlin.com>
> Closes: https://lore.kernel.org/netdev/c57283ed-6b9b-b0e6-ee12-5655c1c54495@bootlin.com/

Fairly sure those should be Link: and Closes: should be used for bug 
tracker entries.

> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c | 21 ++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 37e64283f910..bb2ae6b32b2f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4371,6 +4371,17 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>   	return NETDEV_TX_OK;
>   }
>   
> +/* Check if ethertype will trigger IP
> + * header checks/COE in hardware
> + */
> +static inline bool stmmac_has_ip_ethertype(struct sk_buff *skb)
> +{
> +	__be16 proto = eth_header_parse_protocol(skb);
> +
> +	return (proto == htons(ETH_P_IP)) || (proto == htons(ETH_P_IPV6)) ||
> +		(proto == htons(ETH_P_8021Q));

Do you need to include ETH_P_8021AD in that list as well or is not 
stmmac capable of checksuming beyond a single VLAN tag?

Thanks!
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
