Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8819AE510
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 14:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79C02C78F7B;
	Thu, 24 Oct 2024 12:39:13 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B249C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 07:21:59 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-20c7edf2872so4381825ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 00:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729668118; x=1730272918;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3JpW5l4cHfObYzl7+2svJ3Qk3MetE1pLsV3fZ39aook=;
 b=gk6Q3lKeJn/LauPb9jVH+PFjX/TarQYzqINJSArNTaouZUO68poroiDiLqzfQt59WU
 UWdJwtan3KIlsyo++D4a3V+R8NvuPnV7tcEnErE3DAgKatbHhO4o8qNbR081UbIaMxtr
 ON1lfAGS1OHm0MBrDVTykJ8+p1Zy/N1BaF2eQ101PICmRD4RbC0yq+kI0vt4nhohGEsW
 D0oCSmHcm1eOEMCKSrgHb9VEH6cMZrrESveEIh4hBw4jVtiNub1zTgJbcLHYF54JrUdB
 f1SxwhaKfAyzkQfxitiiHxANXehwxIRU2FS+fQXTfLLwhYnrlRnQFo0Aad04vMVBzfoK
 SxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729668118; x=1730272918;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3JpW5l4cHfObYzl7+2svJ3Qk3MetE1pLsV3fZ39aook=;
 b=pWOrCBVeuXkblYx2PBKwH7yXa24a9zfAn2HA+aKVBG4eeXwHnQJzE73Fqy6uw/yHlZ
 gFJxOIuCwOG1Xn/6rRGedBDB3LkRF/iB7JXJ/D5Oe7KBiJbPyQMLu74lp76UBI9Hv5Tc
 V1WhveKgJqjO2Jfl66/FnIL+b6m9qhUtgP+IdZHHSVadfc2B2k4Fq12N4jk6Hap8dX/M
 YUpCN19IfyNWuEiZqw2UJHS2yQayyu6cOp4mggHzMYNNA9dIx7/XytjOl13b9VpXYJjr
 mQOx5AhF8PRRV+mpcGND2+jFroz4akMEoId6EFk0WC8HQf2QbfFkeSfC0Xz7Nu/N1C9G
 tQ9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuikuptbTIibXwlY7xsxXaKM2xAlq2utPXG6pNhZ84G2GCIL31l9R+xXndPYUX6l5SoI+0da9OFC/c/A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwVRnMmZGQ5QSbOlqp25GecGzrxKU1SPj5SFNPo2Ug5iTu2auaz
 aVjNZ8OoOqi2Q/WS0QXRIB0lrn+/bXnYEwbcfMjPIQzGqIhoEHFM
X-Google-Smtp-Source: AGHT+IFtrw0bTSDjOUHwOCouu0KJSU1+vA+nX8p6eBupMmcRvLXscxMVgLjlJ5OaperPpo2phGpacw==
X-Received: by 2002:a17:903:244a:b0:205:8763:6c2d with SMTP id
 d9443c01a7336-20fa9ea22f1mr30676555ad.9.1729668117790; 
 Wed, 23 Oct 2024 00:21:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20e7eeef535sm52795975ad.44.2024.10.23.00.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 00:21:57 -0700 (PDT)
Date: Wed, 23 Oct 2024 15:21:36 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <amg64lxjjetkzo5bpi7icmsfgmt5e7jmu2z2h3duqy2jcloj7s@nma2hjk4so5b>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
 <227daa87-1924-4b0b-80db-77507fc20f19@lunn.ch>
 <gwtiuotmwj2x3d5rhfrploj7o763yjye4jj7vniomv77s7crqx@5jwrpwrlwn4s>
 <65720a16-d165-4379-a01f-54340fb907df@lunn.ch>
 <424erlm55tuorjvs2xgmanzpximvey22ufhzf3fli7trpimxih@st4yz53hpzzr>
 <66f35d1b-fd26-429b-bbf9-d03ed0c1edaf@lunn.ch>
 <zum7n3656qonk4sdfu76owfs4jk2mkjrzayd57uuoqeb6iiris@635pw3mqymqd>
 <d691a687-c0e2-48a9-bf76-d0a086aa7870@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d691a687-c0e2-48a9-bf76-d0a086aa7870@lunn.ch>
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

On Wed, Oct 23, 2024 at 03:08:52AM +0200, Andrew Lunn wrote:
> On Wed, Oct 23, 2024 at 08:41:36AM +0800, Inochi Amaoto wrote:
> > On Tue, Oct 22, 2024 at 03:51:08PM +0200, Andrew Lunn wrote:
> > > On Tue, Oct 22, 2024 at 06:21:49PM +0800, Inochi Amaoto wrote:
> > > > On Mon, Oct 21, 2024 at 03:27:18PM +0200, Andrew Lunn wrote:
> > > > > > It is related to the RGMII delay. On sg2044, when the phy 
> > > > > > sets rx-delay, the interal mac is not set the same delay, 
> > > > > > so this is needed to be set.
> > > > > 
> > > > > This is the wrong way to do it. Please look at how phy-mode should be
> > > > > used, the four different "rgmii" values. Nearly everybody gets this
> > > > > wrong, so there are plenty of emails from me in the netdev list about
> > > > > how it should be done.
> > > > > 
> > > > 
> > > > The phy-mode is alreay set to the "rgmii-id" and a rx delay is already
> > > > set (a default tx delay is set by the phy driver). In the scenario 
> > > > the extra bit is used to fix 2ns difference between the sampling clock
> > > > and data. It is more like an extra setting and the kernel can not handle
> > > > it by only setting the phy-mode.
> > > 
> > > This sounds wrong.
> > > 
> > > So in DT you have rgmii-id? You say the PHY is doing TX delay. So you
> > > pass PHY_INTERFACE_MODE_RGMII_TXID to the PHY? It is not clear from
> > > this patch, i don't see any code mentioning
> > > PHY_INTERFACE_MODE_RGMII_TXID. Could you point me at that code.
> > > 
> > > 	Andrew
> > 
> > The phy on the board I have is YT8531, The config code is here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/motorcomm.c#n868
> 
> This PHY should be able to do rgmii-id, so there is no need for the
> MAC to add delays. We encourage that setup in linux, so all RGMII
> MAC/PHY pairs are the same, the PHY add the delays.
> 

Yes, this is what I have done at the beginning. At first I only
set up the phy setting and not set the config in the syscon. 
But I got a weird thing: the phy lookback test is timeout. 
Although the datasheet told it just adds a internal delay for 
the phy, I suspect sophgo does something more to set this delay.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
