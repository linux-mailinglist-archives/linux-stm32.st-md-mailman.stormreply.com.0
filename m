Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 996C8823633
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 21:10:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 461F8C6B476;
	Wed,  3 Jan 2024 20:10:25 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 707D4C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jan 2024 20:10:24 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-55539cac143so7676263a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jan 2024 12:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704312624; x=1704917424;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TEWitAjG0rxRY6xuTFfAPPp0IKF7z0xEqu0WIKnmO8Q=;
 b=h/V2CSLHgkadI5Cnxit10yOzqD9yXIhV3xJJYM0Y/vUPau6qWQeMIphJN21V7S4LDr
 JalSOWHKxhZLVje7FqFngnyNg0+Fki6hPi0A1iC/ODcxuZ+9wBRZjKYBkunTGY2IOOpI
 EGbeCPc5V5B8c0KTRGCNUHuuhWyr2b96Eej7qLh/DsGtyaKd10dr9jdL+fzvsvlOSEVE
 59Kk8AhNcdH6M0OVg5rv7qcoBXrGQ7HWUgs2azGK3WXtBMc11N+PELpov7lqc7DT+olI
 TIweP57ZDs2mvKjUIUJ4YJ7OC3KIqkBcmMvBqPEHVgm5DQqSXC2+6y68dsUvGiL0x4rn
 VCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704312624; x=1704917424;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TEWitAjG0rxRY6xuTFfAPPp0IKF7z0xEqu0WIKnmO8Q=;
 b=Aqluiso775p/VYeFReUftStSGdkmpn673uWDvycN0XNwuydxarz6SNWk2XTJvOex3j
 iOGq+AdhJMepYibDudbKLu7UX21wR6UEwxm9hg4VfwcNjPtTIs2UYdnVaxXc9O2L5Sj0
 IGrO0hi/hscZkrm1bLn1FLuwQnsZapOzJpqovUpz20AOthms4WY02KnJHjJ0/rAevfZM
 OQl/mhsjPpoYgiIy727MGIhDfxAa/dfWkX1/AQqDT5k4CwCXVQbTYdRNmKflPbM8z5y4
 PeUsnzVXvLd7whEyyLlE3qOKvMMVF3LioTYRF/wFAmXm+CJ8B5kaN+7uZJNNYwQpGf3O
 LcOA==
X-Gm-Message-State: AOJu0YyvVgzYoYJy1iV6hgovYk5TPCOare4ncgE8rUA2Djb1I/1XinHH
 7fsrrfBtBlCJ0cjyDXMhfpk=
X-Google-Smtp-Source: AGHT+IGJGoQUOiSvT4Z+HaGOUOb+1C6AsGCUQxkqJHEOh2dvB4IyhyPYb3StWVhA73AfEXnqgJITYg==
X-Received: by 2002:a17:906:1db:b0:a26:8c3a:5133 with SMTP id
 27-20020a17090601db00b00a268c3a5133mr7854783ejj.99.1704312623657; 
 Wed, 03 Jan 2024 12:10:23 -0800 (PST)
Received: from skbuf ([188.25.255.36]) by smtp.gmail.com with ESMTPSA id
 vp23-20020a17090712d700b00a27e4d34455sm3625721ejb.183.2024.01.03.12.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 12:10:23 -0800 (PST)
Date: Wed, 3 Jan 2024 22:10:21 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <20240103201021.2ixxndfqe622afnf@skbuf>
References: <20240102162718.268271-1-romain.gantois@bootlin.com>
 <20240102162718.268271-1-romain.gantois@bootlin.com>
 <20240102162718.268271-2-romain.gantois@bootlin.com>
 <20240102162718.268271-2-romain.gantois@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102162718.268271-2-romain.gantois@bootlin.com>
 <20240102162718.268271-2-romain.gantois@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, Jan 02, 2024 at 05:27:15PM +0100, Romain Gantois wrote:
> +/* Check if ethertype will trigger IP
> + * header checks/COE in hardware
> + */
> +static inline bool stmmac_has_ip_ethertype(struct sk_buff *skb)
> +{
> +	__be16 proto = eth_header_parse_protocol(skb);
> +
> +	return (proto == htons(ETH_P_IP)) || (proto == htons(ETH_P_IPV6)) ||
> +		(proto == htons(ETH_P_8021Q));

proto == htons(ETH_P_8021Q) means that the skb has an IP EtherType?
What if an IP header does not follow after the VLAN header?

> +}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
