Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B7D9AF6F2
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2024 03:40:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E33F0C78F62;
	Fri, 25 Oct 2024 01:40:03 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6782FC6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 01:39:56 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-20bb39d97d1so11807755ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 18:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729820395; x=1730425195;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tFezwFo6gCZgxkhS3m0Bz40bL+vqBj5E53gWNhWxLYM=;
 b=YHmzz75TtD4SVK62sGE+K5kYXmt2eD3p13oarc64Ds4Smn8XKKdYta6w+SKnwQFOvv
 UNADOu4vUnhRXA/bM4JM3GISvT+Wg7H38Q1o6MxwR28VBZlnGXFGCBx750jGviyA8/8b
 dQLpZAZyFYwJm0mXrNqwGHqCcI+Py/5lbFnn6HlPZliNdBgfCPBI09jmp+4sYkGFaAtE
 VMq/n9YqEwcMGfZ8veSZSoUum7H5ozMcdlW6J9xn9r0xS9xHusGWYLF98iJAO7tOzgTZ
 QZDPeA6RNcsrqI0uiU7WdT/bjsr5tzcLCDopoFTBptu7RiA8UedhoJ3ZM6MHaX1NCOCi
 f0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729820395; x=1730425195;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tFezwFo6gCZgxkhS3m0Bz40bL+vqBj5E53gWNhWxLYM=;
 b=JPBcxHWyaFztEGGfMYmp0KRp2GraZve42sfDSCnUZ4UY0JBuh5sQ9VHPR9O2ednFZO
 lzr5q6D8dz/+nAT3yOZXjCxXhQCuL3Guc5tC5bE5cMIVBUu1UFLp2+48NAIZC7teKrZm
 yE68We5CQqUZvcZjtSOfiA06Oyzd2Sz4r8Yf4Lg4jVfD7aoTnzKLbK11M1MGskrtBYh7
 0la5vSgZ+Q7FSp/LcNhKtPU9QQKLZUIxH+hIOhHgzmNS8r+X+QSyJwCA0cTW12bU+d7Y
 0Gc9+zzXcBF9dmDNXI2kkWayf37ww1p9pjTFz9CJuppWTIu4hkbfQhV+MCf3U32t9TyJ
 /jFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2YS524wBpnoaKFhsn6VITkV9ed7N5v8sMkbvpHSA2K+m3DlrnzBsNzL0uuEZ15BSytoAWVJYHPlZXxA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyvP60Me+fuqaZvUAoRALHANWNiSgeWKS5GHhr5zjVRvCnYD75a
 gKXdl8Rdlr/mYJT8Wl3nB7hiQYdnk7TQvDbTjx2swODRFnoU3w6U
X-Google-Smtp-Source: AGHT+IEHw2vnCcYrgnHOby/RDV1VCi/V1qVIt7cOTUZOAUPWFAmc5ivhTLTks2UseKSuzasudSeCxw==
X-Received: by 2002:a17:902:ecd0:b0:20c:5cdd:a91 with SMTP id
 d9443c01a7336-20fa9e99bbdmr109987285ad.41.1729820394814; 
 Thu, 24 Oct 2024 18:39:54 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc02e661sm761665ad.191.2024.10.24.18.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 18:39:54 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:39:16 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Message-ID: <2emb7jimgg4utgecdfhc232qclp5yfiqvlw6gl53niwtgoeb7z@uvoy7kqedqst>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
 <7lcmhspo5xq3numdbrfc44uqppbzigwq56vmqne5ldvg2uac6z@ivu4fmwbzajm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7lcmhspo5xq3numdbrfc44uqppbzigwq56vmqne5ldvg2uac6z@ivu4fmwbzajm>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, Oct 24, 2024 at 05:37:03PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> On Mon, Oct 21, 2024 at 06:36:17PM +0800, Inochi Amaoto wrote:
> > +static struct platform_driver sophgo_dwmac_driver =3D {
> > +	.probe  =3D sophgo_dwmac_probe,
> > +	.remove_new =3D stmmac_pltfr_remove,
> > +	.driver =3D {
> > +		.name =3D "sophgo-dwmac",
> > +		.pm =3D &stmmac_pltfr_pm_ops,
> > +		.of_match_table =3D sophgo_dwmac_match,
> > +	},
> > +};
> =

> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers. Please just drop "_new".
> =

> Best regards
> Uwe


Thanks, I will fix it.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
