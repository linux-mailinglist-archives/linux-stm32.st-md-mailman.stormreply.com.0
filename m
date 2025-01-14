Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FBCA1111D
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 20:27:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D41FEC78032;
	Tue, 14 Jan 2025 19:27:08 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD46BC78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 19:27:01 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43658c452f5so5231235e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 11:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736882821; x=1737487621;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QPDOC2//XkjZODpmg0y0cTcEshGv93e+h8EC+PgTW2w=;
 b=iQfEnxzc/JmOkbQTs+K03Oz3gaAwHlWpRG0tpHuU2n0W7VI24wVrGgBVKMKeJVbh0i
 Is+YYVE4AkJCG1CIVqKonaA7sUXWokV4nkg6sI0yT+eVQroQL39Cchg+WuPCzyeggdKA
 +Ivnaiq+6KsDLq2O4w13ws/jetNjY/IqDj+YXr4YNTyUfIw8IQak8nXUD7L8PJWWQ2su
 ldCjodxbNEPB89qPFSw1K4iqKyw7jtlI865KGl+PJLfLQvjl7sKtPHm9gq5aJV9wFPAU
 uDQfjCdJAlkpjgOHqxbSfrA4hFQ5e4h1owj8QEo9xq4b2TylMJpFafaGz8LGtaxWP+Z5
 CCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736882821; x=1737487621;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPDOC2//XkjZODpmg0y0cTcEshGv93e+h8EC+PgTW2w=;
 b=WnMAYgY2H6dpBX5hkJGiF3hmKrsP05mxxlqt6O47dND1pP5uIeLfhgMyRqcTEeE386
 kOKsDSnrLHRsMQBQAeX65BX805ieV6GMM7o1RUAKrE8AanY0OU24c2TH3XZ5x+dPSmNR
 MeY1hbnr8eCybrCSIukDaHsI8xah4zZtrizq6RdTuyIf6VuAqLlUwO5DgfkCqkANQZA6
 s6cJCmwPyziDVBN89EiWS+277ceynt9wKcjcA4hhAnnOaWVP+MRGgff4IM4r8VOAN5dM
 NP4CnxNBslgcxXexlhCEEtT7Sd/EhiJfd0ltgvpGeNNTlMclAolPHy7X3bC8lWY7r+D8
 RXCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6j9gu9GtiSLtF7b6lBMJHnFHYunRmpheJPMLlX2wHEhlcOykQ+ALxaZfI+nlk12S56KmjMAA252TR0g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyYrYWjqftKL0pb9Cl5Whtp+9cM3RnJQce/4NdSlGyTn92QBhr1
 hYiM1wl7ly9UBAmpU/KTnTEnW6Ypx7p7bwIjPdp+laxUs1Aejg8l
X-Gm-Gg: ASbGncsInsIRYgj1avogbOEy0mBreFt7xMW5/BJOPK5Q1Otd04VtLSiwxMR6EALyxAL
 1q+EAH8t/8q90HMCqNlRYxmTodYcx9cefReCWQKyns1InQARxO5kd8lnffuYimg2Eo7Zun8NaEk
 asHjsl/yybm5iRs7M2TrUvIC01jRx+fEJDQUcZZcrcZPWKjlmJNuh6biJfOvdhqU13l/gdNAMpj
 wtODXtRz27eWenOm6BZlOf+9EMfBF8Bd62k2bGyuX+4
X-Google-Smtp-Source: AGHT+IFRMhm4Uswt+iLT80MZuXuKVqSaWMPJbe10Y7O9d5L2JP8nrXQetkrsSgWyKgweQMeH2SjLVA==
X-Received: by 2002:a05:600c:35c2:b0:434:941c:9df2 with SMTP id
 5b1f17b1804b1-436e272c89cmr94080655e9.8.1736882820898; 
 Tue, 14 Jan 2025 11:27:00 -0800 (PST)
Received: from skbuf ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e89f29sm219901715e9.28.2025.01.14.11.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 11:26:59 -0800 (PST)
Date: Tue, 14 Jan 2025 21:26:56 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250114192656.l5xlipbe4fkirkq4@skbuf>
References: <Z4ZtoeeHIXPucjUv@shell.armlinux.org.uk>
 <E1tXhVK-000n18-3C@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1tXhVK-000n18-3C@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 UNGLinuxDriver@microchip.com, Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 10/10] net: dsa: allow use of
 phylink managed EEE support
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

On Tue, Jan 14, 2025 at 02:02:50PM +0000, Russell King (Oracle) wrote:
> In order to allow DSA drivers to use phylink managed EEE, changes are
> necessary to the DSA .set_eee() and .get_eee() methods. Where drivers
> make use of phylink managed EEE, these should just pass the method on
> to their phylink implementation without calling the DSA specific
> operations.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

What is the reason for including this patch with this set, where
it is of no use until at least one DSA driver provides the new API
implementations?

>  net/dsa/user.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/net/dsa/user.c b/net/dsa/user.c
> index c74f2b2b92de..6912d2d57486 100644
> --- a/net/dsa/user.c
> +++ b/net/dsa/user.c
> @@ -1233,16 +1233,23 @@ static int dsa_user_set_eee(struct net_device *dev, struct ethtool_keee *e)
>  	if (!ds->ops->support_eee || !ds->ops->support_eee(ds, dp->index))
>  		return -EOPNOTSUPP;
>  
> -	/* Port's PHY and MAC both need to be EEE capable */
> -	if (!dev->phydev)
> -		return -ENODEV;
> -
> -	if (!ds->ops->set_mac_eee)
> -		return -EOPNOTSUPP;
> +	/* If the port is using phylink managed EEE, then get_mac_eee is

set_mac_eee() is what is unnecessary.

> +	 * unnecessary.
> +	 */
> +	if (!ds->phylink_mac_ops ||
> +	    !ds->phylink_mac_ops->mac_disable_tx_lpi ||
> +	    !ds->phylink_mac_ops->mac_enable_tx_lpi) {

Does it make sense to export pl->mac_supports_eee_ops wrapped into a
helper function and call that here? To avoid making DSA too tightly
coupled with the phylink MAC operation names.

> +		/* Port's PHY and MAC both need to be EEE capable */
> +		if (!dev->phydev)
> +			return -ENODEV;
> +
> +		if (!ds->ops->set_mac_eee)
> +			return -EOPNOTSUPP;
>  
> -	ret = ds->ops->set_mac_eee(ds, dp->index, e);
> -	if (ret)
> -		return ret;
> +		ret = ds->ops->set_mac_eee(ds, dp->index, e);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	return phylink_ethtool_set_eee(dp->pl, e);
>  }
> -- 
> 2.30.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
