Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24299AADDF5
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 14:02:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C027AC7A820;
	Wed,  7 May 2025 12:02:13 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFAF2C78F9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 May 2025 12:02:11 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6f545ae3c59so5007346d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 May 2025 05:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746619330; x=1747224130;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cB9Vli3Xxo4KwEG4QM0VC4PHMgHe2AYxc+yOmxy2QWQ=;
 b=AzvX+m41CnqqY03KjsoZrLJ3r3ka7w2cPLfm/XYiW2Ez5Wzml1Se6+sN/FDWIy8mNY
 TVx78ESzqu1Wkznyfecd/7Jqq8X7LagQs8xa2fkaQe53PEdxUAV/uBSFVlaAxAEqyFqT
 WbPh7NfohhuC0pan+CP7oHCLvoLxAtQCX3P0mzyBkqOkFYIbIH6j11eD7VXJkmAN1zZS
 MhjyOLMO4svsDz0hDgr7PRRmUKDgUREkkrQmiWSrn5DM+KrOV1JisFhKAX8c9PK4LQM7
 lIjAyfjAF8nL/ELiv8MvK90zegBTjTM6MCVwFPcXEv2Nv9vrUkY42QYaMaOG+RJj4J6q
 SVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746619330; x=1747224130;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cB9Vli3Xxo4KwEG4QM0VC4PHMgHe2AYxc+yOmxy2QWQ=;
 b=pcstTInyeKOztWzBnnF1GdJBSK+P2Yl0I6kOOQ0b2uOK8xV6qCutR8J81bGOYA3UKW
 kgrbz8mGLSa+jA7QdyZ3LeN8eNp+ESz/TRlXemC/T8kU+EPm8EhJVoPU/rf4CwmeCPLp
 pZcs+7UuX1t2hKvY3cN+ye/Z9FBbx5LsJURyhdYmv12LgNBhsgs1eX06jRTAmaRVFAKP
 tyEeIJoQVT/TFxTSoyneTQ+LNnxViMMTCYsmvjeBxIOjcuhG0njFfzPKAQfRcigAXU0j
 gT+FODphHmYpdOlkFyQLLaT32hDZCAm7D83fPKcSaZbOxPtyZfNEQUL+DM5jNAqwyPjO
 Ujnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUThAtHBZBwm9yHClZGoTY4KSL8NaDX1+qBszteU8+2utZOqV2DpXThbrTNjvHZPNuIp5mm/yDu4LqFlw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YydVuMt9P6VCb24fjq6Xu2ymBaFm4sZHbC3++TZkhDtFMbxiwq3
 RB44v2JTfyPdJZKgPLfLMAdGIqXhOVtI07pKzr6J44P38c7Crh21OovRRQ==
X-Gm-Gg: ASbGnctWQHuERDtniHFTEEnFRNFcWvjgXPUBC4ol579ktCvYk5Xq49hTLpkt//yVIAS
 P3neYSobcOyjufc5F8zO6eV9iEUoGtdJbyLGKmcjHT46Nw/XH/xwv5f2y9TQwNk0JKtnFv13QnZ
 ynR4C+QHAsnCWtdkvmDHHf/s6p47VAdY9unS5+O4nV+c++TYiBrUOAWtV38Ppkkvzfyqd43Vt6D
 d/BZQFCuL1JWk04K0iLbqMb1NRvgDPwGYOUAK5N3A0AIKrWB24Kxigv6oHJapI7EcgMrMiHUa0a
 EVZehwFCUr06yUmP
X-Google-Smtp-Source: AGHT+IGRl9BUi1WrHprzmvGHRtZmly2KUBbHCnPcITRG9+w3NMHRJoWIA8I9LxLmf29VDGt76SQFqg==
X-Received: by 2002:ad4:5dc3:0:b0:6e8:ede1:237 with SMTP id
 6a1803df08f44-6f542b31434mr45097126d6.43.1746619317492; 
 Wed, 07 May 2025 05:01:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6f542647e03sm13464756d6.29.2025.05.07.05.01.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 05:01:56 -0700 (PDT)
Date: Wed, 7 May 2025 20:01:29 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <2tu2mvwsnqdezjei5h43ko24vfave4c3ek2fjoatwsg72p6lpz@3vbtpmm7l73z>
References: <20250506093256.1107770-1-inochiama@gmail.com>
 <c7a8185e-07b7-4a62-b39b-7d1e6eec64d6@lunn.ch>
 <fgao5qnim6o3gvixzl7lnftgsish6uajlia5okylxskn3nrexe@gyvgrp72jvj6>
 <ffa044e2-ee9e-4a34-af6a-2e45294144f7@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ffa044e2-ee9e-4a34-af6a-2e45294144f7@lunn.ch>
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

On Wed, May 07, 2025 at 02:10:48AM +0200, Andrew Lunn wrote:
> On Wed, May 07, 2025 at 06:24:29AM +0800, Inochi Amaoto wrote:
> > On Tue, May 06, 2025 at 02:03:18PM +0200, Andrew Lunn wrote:
> > > On Tue, May 06, 2025 at 05:32:50PM +0800, Inochi Amaoto wrote:
> > > > The ethernet controller of SG2042 is Synopsys DesignWare IP with
> > > > tx clock. Add device id for it.
> > > > 
> > > > This patch can only be tested on a SG2042 x4 evb board, as pioneer
> > > > does not expose this device.
> > > 
> > > Do you have a patch for this EVB board? Ideally there should be a user
> > > added at the same time as support for a device.
> > > 
> > > 	Andrew
> > 
> > Yes, I have one for this device. And Han Gao told me that he will send
> > the board patch for the evb board. So I only send the driver.
> > And the fragment for the evb board is likes below, I think it is kind
> > of trivial:
> > 
> > &gmac0 {
> > 	phy-handle = <&phy0>;
> > 	phy-mode = "rgmii-txid";
> 
> And this is why i ask, because this is broken. For more information,
> please see:
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/
> 
> 	Andrew

You are right, the right phy-mode is "rgmii-id", the delay is not
added by the PCB. It seems to be better to ask for the vendor about
the hardware design before copying params for vendor dts. Anyway,
thanks for reviewing this.

Regards,
Inochi

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
