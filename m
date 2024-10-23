Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D8D9AE511
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 14:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B7F6C78F7D;
	Thu, 24 Oct 2024 12:39:13 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8F87C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 22:36:28 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2e3d523a24dso290749a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729722987; x=1730327787;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eDwSkxF7WJ4kfN02Vjn7/1ATHMtONFtEuwuiRviy10s=;
 b=Ttzg+zglr4OAIl931wGBjp3MZryVXgyf/kW9qyqJOx53D+geFl6dul1gP3EFk1ci84
 zkceYiw5br9+zHwPDvHEy53ATjW1vDZFrw8tojOih9JjAT4XnSlh9+pCWOWlMQJzaOSp
 R1kRCseHrSuQGurohDqkcizjMlzDmZNawBhwfs/xjQ6vhkxF/IpESyNI0Bm7NNZETUdC
 ih4SSaVwLnn+uhwvWkKWx3KOIGDidAuyPFxWquV277EU4KZWBl2f3ANiwfDAoHG7/GtJ
 qhVRMq92BR3IcsqIubhwQ3CpHB89cMbuWAvtu7OTv6Sxme+zRuC9NAwoaCqKGD8f6JmL
 4p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729722987; x=1730327787;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eDwSkxF7WJ4kfN02Vjn7/1ATHMtONFtEuwuiRviy10s=;
 b=CowbKaDZ07aH7ztirZCM4WYJ8BKfGc/pURaBi5A8SNaS5cgt81g75WJ35zF4YQTm2S
 e7I658k5QOLezdyvuVSgvuJUWAeUnq/Nmdya864XG20A7j/CCMSDll8qRUgZ7cuRVz2r
 PoAV/KkEbHI2xW1n/wB4QVXe29jq9EOgXP0wlZl29KI9MDmcP6AF2PUNm5cZ8lsXy/q0
 M0SAgt59V6OCcY7BfR8cxM5JQXaKTzrmsVw/8lKlublsz3dAiMW59R6uoHbS3Va1DlG3
 tCb6yogKkR6vOzoyAmYIRGxbeS0FX54pavfDPtzJvfdLdmaJ4rTFpH+5+sLzdmFGwXs+
 rIuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBExMuOiDAB4WaWU/chJeOcvqKGdTm3+bSq9nNUpB+CPesx0SCC6U1SC9DTuxYiRZO6WmSPWgYe0mcOw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxrGrYF7ed/54YAvgpw9EKJmjomoD1S1Tg0sLKsjANFWDZIiuSO
 T+c8Tk+S7nRngg4xYSopfwFfiC4sFCsKAL/VWaici0G9grzg85FY
X-Google-Smtp-Source: AGHT+IHZHuIwRxG7OAHNulcO6fIJfRQUcZc5T2JQxQu8pU9oJ4gNvzh822T/LibfUXWlnPRbU4LzEg==
X-Received: by 2002:a17:90a:9f8c:b0:2db:89f0:99a3 with SMTP id
 98e67ed59e1d1-2e76b6d7175mr4285461a91.26.1729722987343; 
 Wed, 23 Oct 2024 15:36:27 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e76ddc9e6dsm2033227a91.0.2024.10.23.15.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 15:36:26 -0700 (PDT)
Date: Thu, 24 Oct 2024 06:36:06 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <uzlmckuziavq5qeybvfm7htycprzogvkfdqj2pxrjmdkuovfut@5euc5nou7aly>
References: <20241021103617.653386-5-inochiama@gmail.com>
 <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
 <gwtiuotmwj2x3d5rhfrploj7o763yjye4jj7vniomv77s7crqx@5jwrpwrlwn4s>
 <65720a16-d165-4379-a01f-54340fb907df@lunn.ch>
 <424erlm55tuorjvs2xgmanzpximvey22ufhzf3fli7trpimxih@st4yz53hpzzr>
 <66f35d1b-fd26-429b-bbf9-d03ed0c1edaf@lunn.ch>
 <zum7n3656qonk4sdfu76owfs4jk2mkjrzayd57uuoqeb6iiris@635pw3mqymqd>
 <d691a687-c0e2-48a9-bf76-d0a086aa7870@lunn.ch>
 <amg64lxjjetkzo5bpi7icmsfgmt5e7jmu2z2h3duqy2jcloj7s@nma2hjk4so5b>
 <79f9b971-8b3f-4f31-ab42-42a31d505607@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79f9b971-8b3f-4f31-ab42-42a31d505607@lunn.ch>
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

On Wed, Oct 23, 2024 at 02:42:16PM +0200, Andrew Lunn wrote:
> > Yes, this is what I have done at the beginning. At first I only
> > set up the phy setting and not set the config in the syscon. 
> > But I got a weird thing: the phy lookback test is timeout. 
> > Although the datasheet told it just adds a internal delay for 
> > the phy, I suspect sophgo does something more to set this delay.
> 
> You need to understand what is going on here. Just because it works
> does not mean it is correct.
> 

It seems like there is a missing info in the SG2044 doc: setting the
syscon internal delay bit is not enabling the internal mac delay, but
disable it. Now everything seems like normal: the mac adds no delay,
and the phy adds its delay. 

The sophgo have already confirmed this is a firmware issue that does 
not set up the mac delay correctly and will fix this in the firmware,
so the kernal can always have not mac delay. Since this will be fixed
in the firmware and this interface is not exposed to the kernel, I will
remove the code setting the syscon bit.

Thanks for your effort on this.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
