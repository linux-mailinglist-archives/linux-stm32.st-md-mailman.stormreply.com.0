Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDD6A39CC0
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 14:03:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FFF0C78F8B;
	Tue, 18 Feb 2025 13:03:28 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6494CC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 13:03:27 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7c0a1677aebso154420085a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 05:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739883806; x=1740488606;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=shcHVe5ScV+KF73Cqgadpco0XHdM/Pvt/zjUdwF7k8A=;
 b=EkRfQLArJe/STjAhk0KCX64GDvw1DzJqlf0mtDJAoZfsfYvQfweMC9133TS0zKX93J
 ItSFtkXzfXeeBMYTilstgm4sSyl1e15vBZmFrQ1j2/G0RAQhclVU3f7Ix8VN06lSp0+G
 Tbvq8paUDEhXVsP/YIl93KSGtJ7tYajNUNtjc5jsfMVsYA2Li4sAuzxIHopJFG9Qtxhr
 SxzkhyQf/cRWDb8Mh6xJVD7+Cy54kKnrXP5GH6eTSKVTtn4zEfFoJ7MLPaoL1hxaD/xR
 lCPUgYESUlyMD5Rg7LrYU5nJvo4dM6ZI9oOu2LpZ030TG1UBwNvd5RaGbIGQr9JsPv1C
 j+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739883806; x=1740488606;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=shcHVe5ScV+KF73Cqgadpco0XHdM/Pvt/zjUdwF7k8A=;
 b=gqzQfVRV8r/HjSmyt+C8pq57R8RuJ+WbhoL8m+K8BFX6LwjSrCtS7wGDMdQ9b1S1AX
 HedT+Od5hQck7Gh6mn6sNZXScDmTouQX8y67RA07FOpI7AeKe4SrkbuVynUFQw0muiX1
 SoIkIZpNjZqPmohDpFCRHJBaY6BDRumNbAhrtNr11jrOwAoDnI9yWGYyuasREFDOi8IR
 ksRXRdD+rKnj/CTXczaYUEfGjg/Ir+4XGqldpxHj9gftuRTLIvUK1xlkCnqThXtOzp+8
 r8uDvKiWyqw5coRBUMfmMWx6z6j/bZOINW0m/yUgSTwoMGiYaQnyQ8eqhuQ/6eKuKkHu
 pJyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBF8hAtf6sdR0ZlYK8s9J6HectXITDpmK5TK7zUFuGeyHUcDHaq1eXACVNra0p9HaO3kQoNhDFBLhgyQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxBYKA1IfZc3o9SyshUWpQRH2thUUxr8Yd7MInZM4e5IS1bhy8z
 byG3gtIMV1ugZa7w1/R9+jeT2yogpBbkgpBttkLAiKLn4sFXh7hG
X-Gm-Gg: ASbGncvS/v3IgZuCTJIliEM9LdDXT5u41uUAmYPfEtitI7HIt3oUQ3yDznNpSxIxNMP
 RhSJ1x1oxZBN8ywlp2I61YeZGT6IIT6jkH4wq2nlD3v/w3qwDV0ioz/VBq98bcFz1oG9oPfPjEo
 3LyXrMQfSaMYg4JU9IXvbnu+hGDLFImzUNijmfxaGGyyWM/IYTKeTKJguZQ+ZZN7SWQn8WojKZS
 7NpL559F6hvzxP0O7GExF0302Gc+0o1Q/lL3FCeZ3xHuzCXtshS07tMDr6E1067lp8=
X-Google-Smtp-Source: AGHT+IHMvBa2pdrsPXBeOhKSDCxofcBeoktPP7uW0o0YVj6yGzgsaMY5yizsS+ID7z1U76ykO/2aOg==
X-Received: by 2002:a05:620a:31a2:b0:7c0:7ca3:b123 with SMTP id
 af79cd13be357-7c08aa98cdfmr1890605085a.46.1739883806193; 
 Tue, 18 Feb 2025 05:03:26 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7c0a28e8700sm189185085a.113.2025.02.18.05.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 05:03:25 -0800 (PST)
Date: Tue, 18 Feb 2025 21:03:13 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Inochi Amaoto <inochiama@gmail.com>
Message-ID: <rkcf6tmgv44uxof3oxsmzqduvc4bumtnsjlkvenxezu2tjrp6l@vy5rbr4p7f3d>
References: <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
 <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
 <24eecc48-9061-4575-9e3b-6ef35226407a@lunn.ch>
 <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
 <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
 <Z7PEeGmNvlYD33rZ@shell.armlinux.org.uk>
 <6obom7jyciq2kqw5iuqlugbzbsebgd7ymnq2crlm565ybbz7de@n7o3tcqn5idi>
 <Z7Rjjo5nZ0gnCbzq@shell.armlinux.org.uk>
 <thc5oknaqaw54wghyxpx6nr4kbykxvpgkgvpqsnsp2osjlxgwv@dekgtkxoywrm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <thc5oknaqaw54wghyxpx6nr4kbykxvpgkgvpqsnsp2osjlxgwv@dekgtkxoywrm>
Cc: Andrew Lunn <andrew@lunn.ch>, Longbin Li <looong.bin@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>,
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
 Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Hariprasad Kelam <hkelam@marvell.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

On Tue, Feb 18, 2025 at 07:34:47PM +0800, Inochi Amaoto wrote:
> On Tue, Feb 18, 2025 at 10:40:14AM +0000, Russell King (Oracle) wrote:
> > On Tue, Feb 18, 2025 at 09:01:59AM +0800, Inochi Amaoto wrote:
> > > On Mon, Feb 17, 2025 at 11:21:28PM +0000, Russell King (Oracle) wrote:
> > > > On Tue, Feb 18, 2025 at 06:50:24AM +0800, Inochi Amaoto wrote:
> > > > > On Mon, Feb 17, 2025 at 02:10:50PM +0000, Russell King (Oracle) wrote:
> > > > > > On Mon, Feb 17, 2025 at 02:25:33PM +0100, Andrew Lunn wrote:
> > > > > > > > I am not sure all whether devices has this clock, but it appears in
> > > > > > > > the databook. So I think it is possible to move this in the core so
> > > > > > > > any platform with these clock can reuse it.
> > > > > > > 
> > > > > > > Great
> > > > > > > 
> > > > > > > The next problem will be, has everybody called it the same thing in
> > > > > > > DT. Since there has been a lot of cut/paste, maybe they have, by
> > > > > > > accident.
> > > > > > 
> > > > > > Tegra186: "tx"
> > > > > > imx: "tx"
> > > > > > intel: "tx_clk"
> > > > > > rk: "clk_mac_speed"
> > > > > > s32: "tx"
> > > > > > starfive: "tx"
> > > > > > sti: "sti-ethclk"
> > > > > > 
> > > > > 
> > > > > The dwc-qos-eth also use clock name "tx", but set the clock with
> > > > > extra calibration logic.
> > > > 
> > > > Yep, that's what I meant by "Tegra186" above.
> > > > 
> > > > > > so 50% have settled on "tx" and the rest are doing their own thing, and
> > > > > > that horse has already bolted.
> > > > > > 
> > > > > 
> > > > > The "rx" clock in s32 also uses the same logic. I think the core also
> > > > > needs to take it, as this rx clock is also mentioned in the databook.
> > > > 
> > > > The "rx" clock on s32 seems to only be set to 125MHz, and the driver
> > > > seems to be limited to RGMII.
> > > > 
> > > > This seems weird as the receive clock is supposed to be supplied by the
> > > > PHY, and is recovered from the media (and thus will be 2.5, 25 or
> > > > 125MHz as determined by the PHY.) So, I'm not sure that the s32 "rx"
> > > > clock is really the clk_rx_i clock supplied to the DWMAC core.
> > > > 
> > > > Certainly on stm32mp151, it states that ETH_RX_CLK in RGMII mode will
> > > > be 2.5, 25 or 125MHz provided by the PHY, and the clock tree indicates
> > > > that ETH_RX_CLK in RGMII mode will be routed directly to the clk_rx_i
> > > > input on the DWMAC(4) core.
> > > > 
> > > 
> > > RGMII is not the problem. The databook says the RGMII clock (rx/tx)
> > > follows this set rate logic. 
> > 
> > Sorry, I find this ambiguous. "This" doesn't tell me whether you are
> > referring to either what s32 does (setting the "rx" clock to 125MHz
> > only) or what RGMII spec says about RX_CLK (which is that it comes from
> > the PHY and is 2.5/25/125MHz) which stm32mp151 agrees with and feeds
> > the PHY's RX_CLK to the clk_rx_i inputs on the DWMAC in RGMII, GMII
> > and MII modes.
> > 
> 
> What I said follows the second, the clock is set at 2.5/25/125MHz
> with speed at 10/100/1000Mbps. The only thing I can refer to is the
> ip databook.
> 
> > clk_rx_i comes through a bunch of muxes on stm32mp151. When the clock
> > tree is configured for RMII mode, the rate on clk_rx_i depends on the
> > MAC speed (10/100Mbps).
> > 
> 
> OK, I have no problem and find some descriptions related to this in
> the databook.
> 
> > This suggests as far as the core is concerned, the clock supplied as
> > clk_rx_i isn't a fixed rate clock but depends on the speed just like
> > the transmit clock.
> > 
> 
> This is what I want to say. clk_rx_i is not fixed but the
> s32 uses it as a fixed one (This is the thing I felt weird).
> 

> In fact, Non-fixed clk_rx_i is why I suggested adding the rx
> clock to the core at first. Since the drive may not use rx
> clock as the databook says, it is good to leave it alone.

Please ignore my wrong point, I mistake the direction of the
rx clock. It is not provided by the mac, but the phy.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
