Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2FCA37A5F
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2025 05:16:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDADDC78F87;
	Mon, 17 Feb 2025 04:16:52 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6A96C78F7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 04:16:45 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7c095b5365eso39236685a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2025 20:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739765805; x=1740370605;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xeqYFA0tm4qjUwoN64e2QAw9r7GkkFQxBxzl+wfEXG4=;
 b=UfuAH9lQcyY88dBS4dQ99+BzEbQI/z8Wg1qXI3rb3cxSRddUyVK7w4JwQmskpvwm1L
 AtKWPmc7W5dLHEbp1xjZ5TsZ4B9zDP6NTRKNyyaz9uMXUVdG2pep+QQM7moUjXZ9FCv6
 iGaHUpB3+fnZV3sfmUgiHdXF4/lUBpOetPPpAN8F5EICt9wbSbJN4iv0wFui4oad7VMt
 LUSqC9bHfcDQ3lG+rjmL795Rmx4KDg4NdJqTgn/XgB4Lp7OB33b07NBbfWf70kegqO5H
 2LfAe0Sn/e8S/ptp+w7VfjakERxp2oxDAQh0IJXu/jmNyprUezOIt9ox+JeisH+ipQML
 va9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739765805; x=1740370605;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xeqYFA0tm4qjUwoN64e2QAw9r7GkkFQxBxzl+wfEXG4=;
 b=TKX26v9R6y75ssKmDd9KpAythKQMJ+6WMNJnCwkIRAZnQNjiX3GWsJQLCEFh/B5l5r
 aPGFbinOXbP3v61znvk4RYkC7ND3/95e+dceE/86bl2OcQ2VdtxZ+6tiSwFwIEWC1wEh
 lQy7BTrifU8NcIDmSifULCrW12U4HHRBPtvjJsH1owykn7+j05o9HH/GBdVCenTumvSJ
 s3l7qBFMyujhIDWSa+gyO3D6CJErfRP6dWh6dA5Xm77+4V2xfbaGvkqFH+TPzQXqEonk
 hJFhGytGR7kPPkhIlQrWK4b5X3KWnHB48y2aLtyyJ1tCM39ORv2MJzbFVfo0Kkm4UhJ+
 vj0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCKo2KCK2/dRWDRloUSZvJvF5mv1LV1k1zxXg+yEmzAv9vF/3yyCkx/iMQVL1fhasd+usC8RBLV8v7dg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzm1NFMzkHZa8hn/ffuFmRL9OLc/teQ5w8que8r6ini/iFXW6tI
 z06l7wapFOcvmLOAlGel4DgHLXEUEKt210SQCNUrkfIImOOeWXks
X-Gm-Gg: ASbGncuv8Ba3nPn1qs5E7eJtXXBzv4S2/We2rGoTBB2NDI/sVeIP5XsEd/cw0u1oDNV
 yXO1zGiBh19j/44luX1FyW2vk04aW/RsWPMLddxrGTny2ZReIzDw+idoRq/tQHVDriDJX6UW6Sh
 7L5oeh7i23Y4lyQAhl00RdGFABSFZliQbJwkgP/h5sHw/UophNRp1hi9t3Drm5c0dv4QhdoP8E1
 tfAlQmm6urIsfR7juwAns59zD7+UskXfIeZ10YwuFXVvEL0VRpFPp+EsgnWcTON6pY=
X-Google-Smtp-Source: AGHT+IHUeYGGtto6/bwu6hE+gNTJFxMdU3WJnKYol+GAez3N8iWRXGYbLq/F4f11XJjWE3T4aBpX5Q==
X-Received: by 2002:a05:620a:172c:b0:7b6:d8da:9095 with SMTP id
 af79cd13be357-7c08a9a2157mr1155035485a.13.1739765803223; 
 Sun, 16 Feb 2025 20:16:43 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7c09a14d45dsm102936485a.10.2025.02.16.20.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 20:16:42 -0800 (PST)
Date: Mon, 17 Feb 2025 12:16:30 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-4-inochiama@gmail.com>
 <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Chen Wang <unicorn_wang@outlook.com>, Furong Xu <0x1207@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Lothar Rubusch <l.rubusch@gmail.com>,
 sophgo@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Drew Fustini <dfustini@tenstorrent.com>, linux-arm-kernel@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Hariprasad Kelam <hkelam@marvell.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/3] net: stmmac: Add glue
 layer for Sophgo SG2044 SoC
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

On Sun, Feb 16, 2025 at 06:07:05PM +0100, Andrew Lunn wrote:
> On Sun, Feb 16, 2025 at 03:47:18PM +0000, Russell King (Oracle) wrote:
> > On Sun, Feb 16, 2025 at 08:39:51PM +0800, Inochi Amaoto wrote:
> > > +static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> > > +{
> > > +	struct sophgo_dwmac *dwmac = priv;
> > > +	long rate;
> > > +	int ret;
> > > +
> > > +	rate = rgmii_clock(speed);
> > > +	if (rate < 0) {
> > > +		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> > > +		return;
> > > +	}
> > > +
> > > +	ret = clk_set_rate(dwmac->clk_tx, rate);
> > > +	if (ret)
> > > +		dev_err(dwmac->dev, "failed to set tx rate %ld: %pe\n",
> > > +			rate, ERR_PTR(ret));
> > > +}
> > 
> > There are a bunch of other platform support in stmmac that are doing
> > the same:
> > 
> > dwmac-s32.c is virtually identical
> > dwmac-imx.c does the same, although has some pre-conditions
> > dwmac-dwc-qos-eth.c is virually identical but the two steps are split
> >   across a bunch of register writes
> > dwmac-starfive.c looks the same
> > dwmac-rk.c also
> > dwmac-intel-plat.c also
> > 
> > So, I wonder whether either this should be a helper, or whether core
> > code should be doing this. Maybe something to look at as a part of
> > this patch submission?
> 
> Inochi, please could you look at the datasheet for this IP. Is the
> transmit clock a part of the IP? 

I checked the ip databook and found it is part of the RGMII clock.
Also, I found RGMII also contains a rx clock following this quirk.

> Can we expect all devices integrating this IP to have such a clock?
> That would be a good indicator the clock handling should be moved
> into the core.
> 

I am not sure all whether devices has this clock, but it appears in
the databook. So I think it is possible to move this in the core so
any platform with these clock can reuse it.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
