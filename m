Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B309B1346
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Oct 2024 01:32:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80106C78021;
	Fri, 25 Oct 2024 23:32:42 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4F0AC6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 23:32:34 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-72061bfec2dso364636b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 16:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729899153; x=1730503953;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Wp1HPOnz6KaDGaKZ01AnsiVak0lO4QvTbnFD63srZug=;
 b=WHsObiLu4bcwYglzljGnk2rSBIokfzKvYhVjvbYXVFslM9y+CAgtuHemIZenWz7Hut
 lILfFBVF7eJW42t2bhDSY383Kp4R9XTu9JxPOBEu6ZkFkEelHw8hKBZIqe/9Ze5Eh1Cq
 /XbIMX2xCjReLDOj9Wa33MYfKpGmpC11juX/YQ9ncQa6fjFHfEjIS9R9Xwy83WnPUuB0
 tOMZrcebMM6ndoO4RmyR5cNv02pae+xDNNIOC2moyTI62DZjYt3gSLHRtaoq47NEoo3F
 W/r8rNu9UC3KjCnuvnUc3Njvn3htnNh8X6XIoByrdnxY/crKmZUd8gAchdnXiY2P7R3J
 JzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729899153; x=1730503953;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wp1HPOnz6KaDGaKZ01AnsiVak0lO4QvTbnFD63srZug=;
 b=RNo5Twtubga81BxGYSFwFJfIuZHLt6pTM4RfSA34nHA/nyyouNklQz2W0woFGeqSJI
 dNXZealxdH0GhzpFj/dRESZ2UtsSHRG4LZ9u75ZeQ7cME2nA5JN8hUpbIPEehzIurQut
 IaJy6hTMfBQl0shNtBUXm0f38u0w05rw23GYh1RRvYxZgMDDG7bSFc2kl09hvqtnztxB
 1EPy45oyjlpS9A4/WKLzlTwMgdYpAviWMpj6R8YRDR0QJ+X26cgWz4tzfiSV51xxIPqh
 mDTHyrEFbSsKQZ1ky6L1vJ/yABTUA+o3I4MoLQ/GE04SOERxwgsd/hR69XQnZs90iiXL
 Am9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8c3Q2cLemP9IlYSWApYofXaEaeYLQxPnZR8uLLFERC+znLKVRq4u4U02Hi35mfOz18bqHqzU/piTkSg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzvg3gJKQ1+bpN9Tvg15+yWcRvnuK4xodHej4lDcsTXC0d9pKcY
 uMmUQmDvGUSmFy5+mPwe0yk8IFbjf0dTTwtgyjSk/SySghVGnNdD
X-Google-Smtp-Source: AGHT+IFEMrLhc1Bg4iRCP4q4hozIJt6Sp7huOuGxcV+yJK49RmRzhj24Vshw5AfU6IcH7rJlxKNWYA==
X-Received: by 2002:a05:6a00:b54:b0:71d:fb29:9f07 with SMTP id
 d2e1a72fcca58-72062fc7c5dmr1589435b3a.15.1729899153356; 
 Fri, 25 Oct 2024 16:32:33 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72057931e2csm1641781b3a.63.2024.10.25.16.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 16:32:33 -0700 (PDT)
Date: Sat, 26 Oct 2024 07:32:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Message-ID: <lsy4wjdce3bhnqgpnu6ysby6ghlzro2ghp6z3jzmwu6vuisr5m@dbljy7b3dhgs>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025011000.244350-4-inochiama@gmail.com>
 <2b691bea-3b2a-469b-bf5f-5e80b9b9b9a8@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b691bea-3b2a-469b-bf5f-5e80b9b9b9a8@intel.com>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Jose Abreu <joabreu@synopsys.com>, Inochi Amaoto <inochiama@outlook.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 3/4] net: stmmac: platform: Add snps,
 dwmac-5.30a IP compatible string
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

On Fri, Oct 25, 2024 at 04:44:55PM +0200, Alexander Lobakin wrote:
> From: Inochi Amaoto <inochiama@gmail.com>
> Date: Fri, 25 Oct 2024 09:09:59 +0800
> 
> > Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
> > to define some platform data in the glue layer.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index ad868e8d195d..3c4e78b10dd6 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -555,7 +555,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
> >  	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
> >  	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
> >  	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
> > -	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
> > +	    of_device_is_compatible(np, "snps,dwmac-5.20") ||
> > +	    of_device_is_compatible(np, "snps,dwmac-5.30a")) {
> 
> Please convert this to a const char * const [] table with all these
> strings + one of_device_compatible_match().
> 

I will, this make the check more clear, thanks.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
