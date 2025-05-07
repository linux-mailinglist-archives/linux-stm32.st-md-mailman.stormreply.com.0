Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ABAAADF87
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 14:45:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 718FFC7A820;
	Wed,  7 May 2025 12:45:46 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 317F4C78F9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 May 2025 12:45:45 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7c53b9d66fdso1028234585a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 May 2025 05:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746621944; x=1747226744;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M2zV074M+6nwcpFqf4vrNr7jLnOtispGdjqzYB/cGTY=;
 b=ft9eGDp8IbUgiIDUTyOjHgmLTbUsahbOOPeb0VRMbdM/R6cslAIm0fWyIsan6gPuLf
 Di4tfbPC0+nqTPUxHI77O3dFlBxNhOo4Wjylvsp9sGIwUjmEIe8CSGUUMlx/3juNWRGj
 uLP9yWkrxH1uDT+uMURbv5cC2Cn5mt2GxzPsGZsETHW9efsAlrdvExWZGljwPmkBLcZX
 wfUhs2xzqvdpITjyE+WGNLSn9QYTFgcX1tDvnXS7N23heiOCkovtooLo1pyvLKVEwuzt
 I5+Kazjvm2xhKYPOl2dS9ODgYNjs4QmtFbl0cneHeeEVnbBwynb9jRLX/Le5mDSMWPwn
 U04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746621944; x=1747226744;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2zV074M+6nwcpFqf4vrNr7jLnOtispGdjqzYB/cGTY=;
 b=Clz2xspElpj3Pvue5srLAijsTWgN5FeRLLtsGaQjE8vnvN7K6ZmTCqIlBBRGv42XsB
 1CvVAat1hMIIHx50bOMXJ7UCcUx5/8dEuZFonk5Mpx+vyRt+ERVXJ1h8VjsPE2clmMmS
 OilrEjScOUd/aCfjz7t4IcRSpJaE6RZ5NfaDP/RdclB8Ws9SKZs9hXGb7gxZU/3tMgAP
 +FKkPXUC0dxIzb+RHg6h/rJFHrtUhEzoYRBCK/SpvYk0XuORDx5ZT1j2iR7NJUYBLL+b
 Eovqkpar3cagmg0ytOuKw+N0UfaVM13sM+j/IMCWoLc0NvFRaCjGe0aLBTRjKVBj7x5h
 7j7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvlPU46SkwUge5sA7BX+0nBBBAm484sZkxK6QGnqjFaYKBlZGeSanFGMPKKiUsYJkxvIiFtaXn8t20iQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxHae42cetWxzY+BFUiWGiyaDb/qvO97JimDg9F6I3ZItGTJf/Z
 kSfpa44Sx3sxs2gP/oUVT/L2V95yO2v82Kn7mp0eomBvNdwphHC6
X-Gm-Gg: ASbGncvpBrHbrzmm8Kox9bMe8VHn7siC6hTTdQUnmFQH8T5/FAUK7msZAq2aEplca4D
 ZLmD7uiehyLwkIZpGG0eu9zQXaqJ5+ExXYQwBeyC7bG7MNx1LL91AYAkRGqMRhK4dtbLaLUCPjH
 /hXU505pGdvI1lsPG95XHzYFhFtjNXPTlrRQG7VYLYsUkFgTXLBRiuPu28xt66hUsOYw4nM+dtL
 Dd0qTJgQCFM+LqZHbOmT+GeJb13Q+YulcNTl6I38iWp3Ny3ESXz1tRACzEtsmfkiZvie32F024g
 29efC442+u38G3iW
X-Google-Smtp-Source: AGHT+IFe4p/E5mc6ZXdUskO144UfSWaGztqfNqrlmQcNmUMrZJzV/ph5M+fDa1Vi9KU3agPcMIiCzQ==
X-Received: by 2002:a05:620a:40c7:b0:7c7:bbc9:aba0 with SMTP id
 af79cd13be357-7caf73fcfb1mr554734385a.35.1746621943769; 
 Wed, 07 May 2025 05:45:43 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7caf75b3a6esm145729385a.89.2025.05.07.05.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 05:45:43 -0700 (PDT)
Date: Wed, 7 May 2025 20:45:18 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <tgqngwc7mteczfzhuyguy3jojnqhdi3ecaqhupuq5lhhhn3ve4@n2gb4w3pc7va>
References: <20250506093256.1107770-1-inochiama@gmail.com>
 <c7a8185e-07b7-4a62-b39b-7d1e6eec64d6@lunn.ch>
 <fgao5qnim6o3gvixzl7lnftgsish6uajlia5okylxskn3nrexe@gyvgrp72jvj6>
 <ffa044e2-ee9e-4a34-af6a-2e45294144f7@lunn.ch>
 <2tu2mvwsnqdezjei5h43ko24vfave4c3ek2fjoatwsg72p6lpz@3vbtpmm7l73z>
 <b4ce3e35-9255-4fc7-9c8d-4078b24ac3fa@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4ce3e35-9255-4fc7-9c8d-4078b24ac3fa@lunn.ch>
Cc: Longbin Li <looong.bin@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Chen Wang <unicorn_wang@outlook.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 sophgo@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lothar Rubusch <l.rubusch@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 0/4] riscv: sophgo: Add ethernet
 support for SG2042
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

On Wed, May 07, 2025 at 02:37:15PM +0200, Andrew Lunn wrote:
> On Wed, May 07, 2025 at 08:01:29PM +0800, Inochi Amaoto wrote:
> > On Wed, May 07, 2025 at 02:10:48AM +0200, Andrew Lunn wrote:
> > > On Wed, May 07, 2025 at 06:24:29AM +0800, Inochi Amaoto wrote:
> > > > On Tue, May 06, 2025 at 02:03:18PM +0200, Andrew Lunn wrote:
> > > > > On Tue, May 06, 2025 at 05:32:50PM +0800, Inochi Amaoto wrote:
> > > > > > The ethernet controller of SG2042 is Synopsys DesignWare IP with
> > > > > > tx clock. Add device id for it.
> > > > > > 
> > > > > > This patch can only be tested on a SG2042 x4 evb board, as pioneer
> > > > > > does not expose this device.
> > > > > 
> > > > > Do you have a patch for this EVB board? Ideally there should be a user
> > > > > added at the same time as support for a device.
> > > > > 
> > > > > 	Andrew
> > > > 
> > > > Yes, I have one for this device. And Han Gao told me that he will send
> > > > the board patch for the evb board. So I only send the driver.
> > > > And the fragment for the evb board is likes below, I think it is kind
> > > > of trivial:
> > > > 
> > > > &gmac0 {
> > > > 	phy-handle = <&phy0>;
> > > > 	phy-mode = "rgmii-txid";
> > > 
> > > And this is why i ask, because this is broken. For more information,
> > > please see:
> > > 
> > > https://patchwork.kernel.org/project/netdevbpf/patch/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/
> > > 
> > > 	Andrew
> > 
> > You are right, the right phy-mode is "rgmii-id", the delay is not
> > added by the PCB. It seems to be better to ask for the vendor about
> > the hardware design before copying params for vendor dts. Anyway,
> > thanks for reviewing this.
> 
> Please do figure this out. Since you are adding a new compatible, you
> have a bit more flexibility. If the MAC driver is doing something
> wrong, you can change its behaviour based on this new compatible
> without breaking other users of the driver using other compatibles.
> 

Thanks, I will check it out. And adapt the driver if needed.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
