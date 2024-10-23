Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B623E9AE50F
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 14:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BCE2C78F79;
	Thu, 24 Oct 2024 12:39:13 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20D91C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 00:41:57 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20bb39d97d1so58250665ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 17:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729644116; x=1730248916;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8u3IDrYvAb9YyTBydXzxhlprUyGufXaL260iyoJVT84=;
 b=Z7HXhizYWeMIsgWgBD94p2bfkwgkKxDGuhTb+DP58mnbP7xnocgQDT3qSKoGyNjrqO
 f6Qe2XTasVEq//a26nQ73wabqMPGQJeXkru4FjKxetYFe6+bqy4G1/wE5QiFei9he03L
 yd2Jy1sFBmDHLpPYbfMb3vl4Zzi3kZKlnzswrqwoXxWRd+Hao9FmDAB50OIBzVI6ARVF
 0MrWyZz6a0LyVZA8wtl4r+jUqnWOV/HMOWBAWsCOzOmLt689OjQqsxlhl6IyaFhTEOke
 dYgtcM7VLJSofH64D+O/F0+D7YUFyEZtI0c55gjBdTYuW4PPksHJN7pqPP9/P+Hc6hJP
 6Lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729644116; x=1730248916;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8u3IDrYvAb9YyTBydXzxhlprUyGufXaL260iyoJVT84=;
 b=w9c1S4TdYuOpeTKi+BtxyXcgP6KoQVjFR35ZoQ6qLuY8YUmJQmkVh81vtXZW4TYikw
 +YCGVP+0FW+PupsEu1Rj1axCKFgtxONL8/qxwqlvyixgvY7qxrL5cIhTOLr58goBLb83
 jmv89TBL+fer2aAwlWRbJL5zAEDVNdRW26xkE4+eVO5OPMfZGUX80dZcKAVp6g1a0rFP
 EvZhcZ10s9g7Eq4l3sCDI/V7f5McdhwdSYQlKkYPNq/O4rOvwUejpCX+hToihnOM4mOC
 8zWl09e8z9svMMuS66loVjOpAqBUcmGMC8E3+cP4Qvv9FmWLF+ziAc+tDavtm5WGydw0
 Te+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5QeSfvQYWHrIRZAxajaZQJaR4Cs9N4un7DYO9hfCQvpbMlKCfpPcdl8Zz5GUJuhWm7C5zD72kTd6log==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxJ6E2en1Y7Pp0/lFiXCm/yFGgV7y3C/BmMZ0X3DFxTsPeBduoL
 M+CZhYsBc/B0TTS1YKleJUZPHLowc/Q1D9FKAu7QNy3JrXv7l0Tc
X-Google-Smtp-Source: AGHT+IFbhgz4UwAzkmEZqrLZ7CxJnIMNJeELmjeckUQEiAROOsXtNCu++sLO4TJ9d5G/mSS8vtF+Rg==
X-Received: by 2002:a17:903:1c6:b0:20e:95c9:4ed5 with SMTP id
 d9443c01a7336-20fa9de0cc3mr13205545ad.7.1729644115571; 
 Tue, 22 Oct 2024 17:41:55 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20e7f109c4fsm47993125ad.307.2024.10.22.17.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 17:41:55 -0700 (PDT)
Date: Wed, 23 Oct 2024 08:41:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <zum7n3656qonk4sdfu76owfs4jk2mkjrzayd57uuoqeb6iiris@635pw3mqymqd>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
 <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
 <gwtiuotmwj2x3d5rhfrploj7o763yjye4jj7vniomv77s7crqx@5jwrpwrlwn4s>
 <65720a16-d165-4379-a01f-54340fb907df@lunn.ch>
 <424erlm55tuorjvs2xgmanzpximvey22ufhzf3fli7trpimxih@st4yz53hpzzr>
 <66f35d1b-fd26-429b-bbf9-d03ed0c1edaf@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66f35d1b-fd26-429b-bbf9-d03ed0c1edaf@lunn.ch>
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

On Tue, Oct 22, 2024 at 03:51:08PM +0200, Andrew Lunn wrote:
> On Tue, Oct 22, 2024 at 06:21:49PM +0800, Inochi Amaoto wrote:
> > On Mon, Oct 21, 2024 at 03:27:18PM +0200, Andrew Lunn wrote:
> > > > It is related to the RGMII delay. On sg2044, when the phy 
> > > > sets rx-delay, the interal mac is not set the same delay, 
> > > > so this is needed to be set.
> > > 
> > > This is the wrong way to do it. Please look at how phy-mode should be
> > > used, the four different "rgmii" values. Nearly everybody gets this
> > > wrong, so there are plenty of emails from me in the netdev list about
> > > how it should be done.
> > > 
> > 
> > The phy-mode is alreay set to the "rgmii-id" and a rx delay is already
> > set (a default tx delay is set by the phy driver). In the scenario 
> > the extra bit is used to fix 2ns difference between the sampling clock
> > and data. It is more like an extra setting and the kernel can not handle
> > it by only setting the phy-mode.
> 
> This sounds wrong.
> 
> So in DT you have rgmii-id? You say the PHY is doing TX delay. So you
> pass PHY_INTERFACE_MODE_RGMII_TXID to the PHY? It is not clear from
> this patch, i don't see any code mentioning
> PHY_INTERFACE_MODE_RGMII_TXID. Could you point me at that code.
> 
> 	Andrew

The phy on the board I have is YT8531, The config code is here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/motorcomm.c#n868

As the syscon only has a config on rx delay. I have
already fix the code and only set the bit when the
mac is rgmii-rxid/id.

Regards,
Inochi.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
