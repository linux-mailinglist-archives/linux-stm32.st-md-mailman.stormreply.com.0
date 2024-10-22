Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC7C9AE50D
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 14:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5054DC78F75;
	Thu, 24 Oct 2024 12:39:13 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8580BC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 10:22:11 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2e2ed2230d8so4006790a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 03:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729592530; x=1730197330;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sI849jpnNtz3jUPY9JimvHmQMDeWZfkp6+41mM9VEbU=;
 b=AgSQn03zUrIUaWpIufrmSlmiSDfRWwk85Nt4awhD7mB7ChwZICziIN+F1wCqlswnG4
 wwJedUReYBuQsKW6m17kCixtw1aM7mlC5kYlvb7GeaAABTHRDYUbHSA4h7ELDhfP86TH
 cnPc2387YF1EyWbvw15LOI9++BNN/DBf+3YFUGaCoUzsjgTB7CQcWB+WInQDlW5vKBy6
 3WSi+hbX6tQEl+G5eTXjSzocxJ3iz4CurrhP/L6DYSsYq3VVslB033DzHjhGkGOB4hch
 pImzpsiszAEbuS0xQUKHjJf0lDColSx/cnoblQVbPU5o5g3oC7s1T54cWGQX9ICa4A+T
 m/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729592530; x=1730197330;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sI849jpnNtz3jUPY9JimvHmQMDeWZfkp6+41mM9VEbU=;
 b=UO5reDUnYAKPfBlCWGjvTvmU6zLIjRuGfn8G/ZH8RBZ8cISgNjF85iLaeXCu8nfFyP
 bXP96Nv+A/lLpu9z4Nk/4ICvU0TZGhwABbLFobKf4X9NHvjqSsU4rsNt14dsUsnBQR8Z
 QzqhBvwo2knFUpwJdZSxFvzPUl1hdFFG+Dyz7BsG6m+3A896KB/h1yzpmo7U0b1EmINJ
 oOHKTg2oTNwvk8HyuCJ/f4OtzTozs3jzxjTAtSUvBvnter3HW82eXnfdnhw/XbR6SsEC
 A5FUbrdMcsi0+g5Cc8/TLQeroC08s6d7nOz/GxdBiDUV1BqE4uFjI6I77/ckXvur3Rf5
 suBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrUyrSzYjWbIYBqCX+4WeV0SVDctSDXRUqmQdIADZmYK+IVEHuHLdXRywNfi4F+3ZOid7CvWEr1+AdWA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzwQt3KDKsY21E9zZUd5jMzHCZ96HikbERT4J/eDNs/lU8+qaWA
 djuWVyhZwyHg2rPmK+NhNtxh7sR+1u7+NMUwPxi2xNCpQdmBO566
X-Google-Smtp-Source: AGHT+IF0yrkWnZfHUykTJ4Fo4aQzxqBmdzqmVMi+fptihu1U4ST488NkYyut5AtEoorOS8tcNGE7TA==
X-Received: by 2002:a17:90a:740a:b0:2c8:65cf:e820 with SMTP id
 98e67ed59e1d1-2e5616c4202mr17264934a91.2.1729592530050; 
 Tue, 22 Oct 2024 03:22:10 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e5ad517911sm5728653a91.57.2024.10.22.03.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 03:22:09 -0700 (PDT)
Date: Tue, 22 Oct 2024 18:21:49 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <424erlm55tuorjvs2xgmanzpximvey22ufhzf3fli7trpimxih@st4yz53hpzzr>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
 <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
 <gwtiuotmwj2x3d5rhfrploj7o763yjye4jj7vniomv77s7crqx@5jwrpwrlwn4s>
 <65720a16-d165-4379-a01f-54340fb907df@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <65720a16-d165-4379-a01f-54340fb907df@lunn.ch>
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

On Mon, Oct 21, 2024 at 03:27:18PM +0200, Andrew Lunn wrote:
> > It is related to the RGMII delay. On sg2044, when the phy 
> > sets rx-delay, the interal mac is not set the same delay, 
> > so this is needed to be set.
> 
> This is the wrong way to do it. Please look at how phy-mode should be
> used, the four different "rgmii" values. Nearly everybody gets this
> wrong, so there are plenty of emails from me in the netdev list about
> how it should be done.
> 

The phy-mode is alreay set to the "rgmii-id" and a rx delay is already
set (a default tx delay is set by the phy driver). In the scenario 
the extra bit is used to fix 2ns difference between the sampling clock
and data. It is more like an extra setting and the kernel can not handle
it by only setting the phy-mode.

This is draft dts patch for the sg2044 gmac.
https://github.com/project-inochi/linux/commit/381cb6000044a89cb13d6d9c839e9bbc7b9d2e5a

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
