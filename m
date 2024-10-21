Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8014C9AE509
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 14:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 212B5C78F6D;
	Thu, 24 Oct 2024 12:39:13 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8496BC7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 12:38:31 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-7ea7ad1e01fso2919784a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 05:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729514310; x=1730119110;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5VdkMJahzYM4ARizPLfC5JGwlmy+1HUcx/YnyM/NNsU=;
 b=HSQGNzow/T/k3xmHU5gyGD2+Q3kKmhFaTJW9oiuR8hshIZAcEBtHLTPiseF3GUnKql
 QVvboLQHnyxoUER5ytws1OLk23Ctg67JpXdL5s/gDLNsvjeCKX82aNjOXqb4hY8oy8OL
 O5wxUqS/OKi9aad5WVFcjbHEpwooUAgdtz+5nCR03l1KW/lxYoawtBWdBJmUAhZWUJXK
 bR5sjAwbtzYX0Batfpj70+BpWBgPLMGEBK2BNfW8mOOaXzsFrjX/o81TU2R5ydDfA7Q+
 nBN3DnlVoh5SDPqsBRlkqRla8gYX7Izgwofzz4LvfV8KQHlfyQEACczZfuGYVTqPdxyF
 jkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729514310; x=1730119110;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5VdkMJahzYM4ARizPLfC5JGwlmy+1HUcx/YnyM/NNsU=;
 b=Sb7QkpLFoZarpgORsyIqiPPCcPm+RaptQ5ESl+psxJUGca+FCohRTL/yjEnepAB1TG
 C/lKoUxcA5Cun9eUFnzvT0yClPpav1CkDWdltPl04xSf7m2IY1KY3RbM9hOq7Xe2C9c9
 M7jLDvZYbLg9iFz+LC+kT6fx3XazIRhI115IyTKlXD6LZODEjBC3CDG9Kx8XrXaBYW9W
 qZF5BtSvwIqEdr14qn2xJun9JaAbFmkvruNjaB9KOeMY+2SSo/uooXiCuwVLQSA5GHkK
 vuCUGegmHkUd8XDgqvdjN9Cdft1bfnxwM1bClAEWzAhU26HSgDEb5BEHsVlBMQilH9G1
 YmsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJhAgGXCPO2VW9rdSrWeZOTv4QP13ICJhTmyf0hGK347FfwaGbg/x103GnrX3/ZYddk8JuANTiWR+6UQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwdPWsWukFuUSwTZKjT0KMDPGKWFDs5ee+N05A1zTC6SARms+Mj
 5/kPh4n3Am8Bq7psq71av9JwZzNhhr5K/Av4uistxiSeqSCmPXcX
X-Google-Smtp-Source: AGHT+IELTG5U+pOWjQan4mOzNnHckdPe5BPOOI3wlomTskXwd3e2mPKfcYsxX04oUIZTOqrQqVQjwQ==
X-Received: by 2002:a05:6a20:ac43:b0:1d7:109f:cac4 with SMTP id
 adf61e73a8af0-1d92c9f873amr17387168637.3.1729514310059; 
 Mon, 21 Oct 2024 05:38:30 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71ec1312d6bsm2750800b3a.29.2024.10.21.05.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:38:29 -0700 (PDT)
Date: Mon, 21 Oct 2024 20:38:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <gwtiuotmwj2x3d5rhfrploj7o763yjye4jj7vniomv77s7crqx@5jwrpwrlwn4s>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
 <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:39:11 +0000
Cc: Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Chen Wang <unicorn_wang@outlook.com>, Jose Abreu <joabreu@synopsys.com>,
 Inochi Amaoto <inochiama@outlook.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 4/4] net: stmmac: Add glue layer for
	Sophgo SG2044 SoC
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

On Mon, Oct 21, 2024 at 02:22:47PM +0200, Andrew Lunn wrote:
> > +static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> > +{
> > +	struct sophgo_dwmac *dwmac = priv;
> > +	unsigned long rate;
> > +	int ret;
> > +
> > +	switch (speed) {
> > +	case SPEED_1000:
> > +		rate = 125000000;
> > +		break;
> > +	case SPEED_100:
> > +		rate = 25000000;
> > +		break;
> > +	case SPEED_10:
> > +		rate = 2500000;
> > +		break;
> > +	default:
> > +		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> > +		break;
> > +	}
> 
> There was a helper added recently for this, since it appears
> repeatedly in drivers.
> 

OK, I will change it.

> > +	ret = regmap_set_bits(regmap, args[0], DWMAC_SG2044_FLAG_USE_RX_DELAY);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "failed to set the phy rx delay\n");
> 
> Please could you explain what this delay is for. Is it the 2ns RGMII
> delay?
> 
> 	Andrew

It is related to the RGMII delay. On sg2044, when the phy 
sets rx-delay, the interal mac is not set the same delay, 
so this is needed to be set.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
