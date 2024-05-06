Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F18958BC9FD
	for <lists+linux-stm32@lfdr.de>; Mon,  6 May 2024 10:50:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8ECBC5E2CB;
	Mon,  6 May 2024 08:50:20 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A72F6C030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 May 2024 08:50:12 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2e3737697d9so7263211fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 May 2024 01:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714985412; x=1715590212;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0W3OM+PzsAuNXqvgrbwYe/sYHFhkCcz6xsmFOfCjwNc=;
 b=DXT1s0hWNRaMBBwgQKXFa7i6knVTHOpIOX9+TP35PUarU1XpTF7HVAzygsWnkjOOG5
 EsfBrMmNe12gm5MCbrqEMF7GP7Txd7GXdjKWQdhGs7Nj3RvJOQ61VONgkfrK7EAIpUUs
 IytNLc7YowgQu84XTopF7oAei/OuCeMaM5tqhveY2E8KNOl0kfNzArq/kRu/PTb+MbRn
 QaZOH4GXaG/fz92B7Gz0Jsq05nN/M2k/DhJHqHyMRDcwEPvOaEx7+enHH+MIcbeQE0g4
 X+9RQ+IFl9pmgeWRuV6n+XrW3nR7nx3dqtFUDstHItsMSeJvWheAJs8RKlt6sofZy9uN
 U4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714985412; x=1715590212;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0W3OM+PzsAuNXqvgrbwYe/sYHFhkCcz6xsmFOfCjwNc=;
 b=vjWNPp5zKS/jH7qkkq3XfafivCAvfL2gJP5O/kqfWSB3I6fOtdzfivyNzm9qvBpzK9
 ICuwpciAFHpvh8/M27hOexzqvnkX+WQPlGK7TNu6DCnxRNqpPde2mJiIH2GokZnZKufL
 GsB8+ljry0mKItzjw+RXe7PUuQtSEVSQ900paUDCc8omJDLA9IVoYqfjSu2xWP7eNE9c
 311kraw/E17SCbJJPrmbhc9C5COUAz38HRaVVgxyGW8UsaSHI6Oaap4Ufims3XjlzTXz
 L5c2Ors25vgUcBTP3A+h8euQ256vtQWrFYK2sDRXqRCu350TgBPkB6KNxMevJXsFaWjh
 qINA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKsl1FWg4Xj0WIehRlygvmmm2XtzuC/K0anDF+0cBU9zDwpmvTc+af2Kk+TNvJh1DcYtfHMaYDQjrohPQhLzvubMRSs+/1Aja8YVMNeg/yDt6Y3AhwcHEL
X-Gm-Message-State: AOJu0YwAoyLdCYVPfChhLSFxrCANewkhh3n4aIzeTUcq9CJeH6ubdIn8
 WLKx3EfmYPbJXffE6vigbqsXfTM8cAvoFkYC7E0DYMeF/BP+l+R3
X-Google-Smtp-Source: AGHT+IEh+fGA+MGksiXkeu45MPOZ4U+YR5N+ndBcztXInjKnEGGz7Iui8cqavnJNkkCV9JKVT3Rxsw==
X-Received: by 2002:ac2:46e3:0:b0:51d:2a27:9574 with SMTP id
 q3-20020ac246e3000000b0051d2a279574mr5758742lfo.6.1714985411631; 
 Mon, 06 May 2024 01:50:11 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a0565123f0600b0051e16048adesm1569125lfa.48.2024.05.06.01.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 01:50:11 -0700 (PDT)
Date: Mon, 6 May 2024 11:50:08 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <ljlbqz3o5btsufgc4jx3rqldmgvyl6k3raezcaur5g6qg44jje@ql2ws5ntt6eq>
References: <20240430-rzn1-gmac1-v5-0-62f65a84f418@bootlin.com>
 <20240430-rzn1-gmac1-v5-2-62f65a84f418@bootlin.com>
 <4wdcmcb2yxneynxtppestl6cp25z5xge3hfv7o47bxwpafn4cg@mtvc3ls2cxij>
 <ec3e6c1b-1a5e-f7c9-4782-bc8f01a67f5f@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec3e6c1b-1a5e-f7c9-4782-bc8f01a67f5f@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 2/7] net: stmmac: Add
 dedicated XPCS cleanup method
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

On Mon, May 06, 2024 at 09:07:41AM +0200, Romain Gantois wrote:
> Hi Serge,
> 
> On Fri, 3 May 2024, Serge Semin wrote:
> 
> > 
> > > +void stmmac_pcs_clean(struct stmmac_priv *priv)
> > 
> > Ideally it would have been great to have the entire driver fixed to
> > accept the stmmac_priv pointer as the functions argument. But this
> > would be too tiresome. Anyway seeing the PCS-setup protagonist method
> > has the net_device pointer passed I would implement the same prototype
> > for the antagonist even though it would require an additional local
> > variable. That will make the MDIO and PCS local interface-functions
> > looking alike and as if unified. That is the reason of why I made
> > stmmac_xpcs_clean() accepting the net_device pointer. 
> > 
> > Alternatively both stmmac_pcs_setup() and stmmac_pcs_clean() could be
> > converted to just accepting a pointer to the stmmac_priv instance.
>
 
> I think that adapting stmmac_pcs_clean() to take a net_device struct would be 
> more appropriate since it's the simpler of the two methods. I'll implement this 
> in the next version.

Awesome! Thanks.

-Serge(y)

> 
> Thanks,
> 
> -- 
> Romain Gantois, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
