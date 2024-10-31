Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2448D9B811B
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Oct 2024 18:23:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBAF0C78035;
	Thu, 31 Oct 2024 17:23:29 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE6ECC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 17:23:22 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-37d58a51fa5so67479f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 10:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730395402; x=1731000202;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VVTW9hw36AFB4MImdvCga8qTTKZp0wzSmGjii8X9VoA=;
 b=atGLi8/CbNmsA+HDT5IO+1IMw/6M8SMmQ/VHyVn3ypMDIuveyaJ1El6giNX8lMvEKa
 JfAZXNWTui+UnQTM5BNp9s38yVnosLmHxwFoF8nCkN+8hjeJXrCNRhlGohCTKvKRdpQy
 dFbGpzzhYG3aSWTOeXq9s3PQOmbXKK4LZuZ8lHb1h1RzpBaOux+XTKDup+6v61QboU0h
 wZd+Wq02cH7RF9HBAuF2n7LP/+SzKMKpQGR9xrpoRg7e+rOjFmbtS3+FnuVyJF51N1G+
 /qCJZBXttmkthdd6IGjlT5GTspdNlQxE3b2cBrR2MY7wRaDPWHrgqhkQf1aXrlLosmt8
 n7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730395402; x=1731000202;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VVTW9hw36AFB4MImdvCga8qTTKZp0wzSmGjii8X9VoA=;
 b=ecsd5rjnzxtVLGBEc3ala64KNHRGWn+N6eTnwmkFsh8p04zQFrvzH/narGLuwVGHJJ
 +J4yP3U1IMbXiREBVxMB2sGdj8Az9c+cHCP+j48o7hbIPjg9YG/d14yJORr5AFXDFMUa
 IsXislz2TMmmId1AsIehmjA9SmpZ+0w9XFpvuTO3d/CMpXenqYwBXA2otTKHKS1GTVHG
 UeQSg2HNB5lBAvKvPmXkPI/0klMjbjYZXq7lz6p/BUjo/gcu8eoPtSM7tkqbisLGEtcp
 DBYa+iVuWUUWCDmD7TNvUUk3lw9FAiAcItNmleFWlTpFBcCTd6bZG0IYMb/iJmQZ/0G/
 Cz6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPRfA0vPW4+PSHSvYo9fYXo9ZpTQEQh0dg60xTWeuNtG/v3MLDmKSGnWoSiEsg7UVvU++4ZKRtb7O9Lg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw16Og573Qy3fE/UNFI9kfOhP4wGJvkd49Tp+6OpBJQXwHi4YjI
 MYdMfdXUkx8dfoJHrrxx04fG4yOfxntL8ykxebctQbQVuf/MCp2n
X-Google-Smtp-Source: AGHT+IG8AifXoJzt/afMNe67tcFeiLrP5M6/urrkBJoQb1aUjJpqK75XQe++iygSMilFNcs3++wDxA==
X-Received: by 2002:a5d:6c6d:0:b0:37d:487e:4d9d with SMTP id
 ffacd0b85a97d-380612323c9mr8339382f8f.8.1730395402017; 
 Thu, 31 Oct 2024 10:23:22 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116b181sm2703414f8f.107.2024.10.31.10.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 10:23:21 -0700 (PDT)
Date: Thu, 31 Oct 2024 19:23:18 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241031172318.w77ibjcz7pvia5wh@skbuf>
References: <cover.1730376866.git.0x1207@gmail.com>
 <cover.1730376866.git.0x1207@gmail.com>
 <1c05e448a12057b909cc6c7cc0c9645cf393d181.1730376866.git.0x1207@gmail.com>
 <1c05e448a12057b909cc6c7cc0c9645cf393d181.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c05e448a12057b909cc6c7cc0c9645cf393d181.1730376866.git.0x1207@gmail.com>
 <1c05e448a12057b909cc6c7cc0c9645cf393d181.1730376866.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/8] net: stmmac: Refactor FPE
 functions to generic version
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

On Thu, Oct 31, 2024 at 08:37:57PM +0800, Furong Xu wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
> index 25725fd5182f..15fcb9ef1a97 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
> @@ -12,34 +12,22 @@
>  #define STMMAC_FPE_MM_MAX_VERIFY_RETRIES	3
>  #define STMMAC_FPE_MM_MAX_VERIFY_TIME_MS	128
>  
> -/* FPE link-partner hand-shaking mPacket type */
> -enum stmmac_mpacket_type {
> -	MPACKET_VERIFY = 0,
> -	MPACKET_RESPONSE = 1,
> -};
> -
>  struct stmmac_priv;
>  struct stmmac_fpe_cfg;

With the removal of the dwmac5_*() and dwxgmac3_*() functions, the
forward definition of struct stmmac_fpe_cfg has no user in stmmac_fpe.h.

>  
>  void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up);
> -void stmmac_fpe_event_status(struct stmmac_priv *priv, int status);
>  void stmmac_fpe_init(struct stmmac_priv *priv);
>  void stmmac_fpe_apply(struct stmmac_priv *priv);
> +void stmmac_fpe_configure(struct stmmac_priv *priv, bool tx_enable,
> +			  bool pmac_enable);

I'm not sure why I missed this during v6, but stmmac_fpe_configure() is
only called from within stmmac_fpe.c, and thus should be static.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
