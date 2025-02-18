Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B101EA39017
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 02:02:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5280BC78F69;
	Tue, 18 Feb 2025 01:02:21 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CD77C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 01:02:14 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7c0a5aa0f84so90511685a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 17:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739840533; x=1740445333;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Edn74AFcsuP9KsL9TiLXPO+mD82mDfRGLigRZWWQmH0=;
 b=NEZkK4PczIGAExlFoj6YW2OG/AtJX9Z8BobbsuX/LaYyAeh+RQSyT5LbLRPPbeF26U
 uyr+oa3DvTk/ruHZmrWEkfx6HwpSM4SKSgPNCIHuZFF+viQxJrbVgxEYdaMDueZ89V7c
 Ibc+9jE1rtBnsOoA7J9sSos3EQ4wCFRtE9GTcuAnPmUa4uvi47jgSsc8+aF8m2szF5MF
 KLtMa0rj0nIGURH9YFGb2sC1/VNt+JPdHggw0hqi0Lo6D+1D2PY//1tHsEx45UD8MDHm
 epaCfeF8BdWA3GgHlXF0CE/54crKv3hJYgp1O37SKjYyA6ysBWE/MO5AE/mciRZnZsi8
 XhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739840533; x=1740445333;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Edn74AFcsuP9KsL9TiLXPO+mD82mDfRGLigRZWWQmH0=;
 b=meaatsx5xSLNGvlJO0mk+rF1I14YP8Iuml7D+zyjD2tkdd5YaKmc2IoeF5NfAd/JvL
 oKuz1gyPL1M8YFns3r8Q5F+biK6Dacp5k5vy/GiY+WlSXML4UL9G6vFY8iKKtWdAPznz
 S+DGQR+Fvk7k5Ins+cCUKcuAaqgk0x4V7sfBlkTEQPjlcymC9MZxG8O/kgq2SUgIXXz3
 Rt2rPyHioAm0Hdj1wLudbN0m8xT+PCFoNG3mFoMN0gLwKfm29nAaOAmoMpYXWGrCTa9u
 ptCcQw1+xBz6MzmxZcoeNmTxWLkby2R8XckbfoJH7otcNDvDO4Wldolst+Z9XVzOYIwS
 ZUjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOhF9CpoBQ2CZyHJ7VhTIk3y5jy1+b7WgmbhDkkjUxnPx2gxab50337Afx4v9srsB7ohxjUJ5+kC38YA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxw60lVn47PK5rxJCOrs1ZSXX0aZc+sCTXpNS2TQJZ3IKYlZhjs
 Nmvt1EL4AnBNyjkr/s8tRTfVpojN7j+XjY5YUgw8nio7YN+i9/Ny
X-Gm-Gg: ASbGncuI+MYB76AAfUVzCzTUbaeBt3cSggc7d1Pqp8Z4Imc60yn2uREhMq13+NHXslh
 pqtWP4FCb/e81ObCF/rFqMaIm24yB1p+VHXEnH1hNFqyroTH5bNa5JYA3naoRt0JLq+h5b6R3PS
 frT3L0u+2EE30PtAx7PLKHrQ/gC+NED4/hktxPrrYkNnbe7CAdXvk2t8TfumWyq5XB+o3pGMFMJ
 iVVq6sV4abZ1ZG6qtYMABBN49ssOHQWbqaFRG9U39fxsR41o/GKfBrI9OffBlqUSAE=
X-Google-Smtp-Source: AGHT+IED0MT/Y3Zl2u3Z7wdGB5LOycEU5pxFY7tKuSKPsLRXNIGrw99KUylS24xgTBikaz1r1N9Tbw==
X-Received: by 2002:a05:620a:3729:b0:7ac:b95b:7107 with SMTP id
 af79cd13be357-7c07a892c13mr2798593385a.12.1739840532807; 
 Mon, 17 Feb 2025 17:02:12 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7c07c608291sm597329685a.43.2025.02.17.17.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 17:02:11 -0800 (PST)
Date: Tue, 18 Feb 2025 09:01:59 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Inochi Amaoto <inochiama@gmail.com>
Message-ID: <6obom7jyciq2kqw5iuqlugbzbsebgd7ymnq2crlm565ybbz7de@n7o3tcqn5idi>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-4-inochiama@gmail.com>
 <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
 <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
 <24eecc48-9061-4575-9e3b-6ef35226407a@lunn.ch>
 <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
 <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
 <Z7PEeGmNvlYD33rZ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z7PEeGmNvlYD33rZ@shell.armlinux.org.uk>
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

On Mon, Feb 17, 2025 at 11:21:28PM +0000, Russell King (Oracle) wrote:
> On Tue, Feb 18, 2025 at 06:50:24AM +0800, Inochi Amaoto wrote:
> > On Mon, Feb 17, 2025 at 02:10:50PM +0000, Russell King (Oracle) wrote:
> > > On Mon, Feb 17, 2025 at 02:25:33PM +0100, Andrew Lunn wrote:
> > > > > I am not sure all whether devices has this clock, but it appears in
> > > > > the databook. So I think it is possible to move this in the core so
> > > > > any platform with these clock can reuse it.
> > > > 
> > > > Great
> > > > 
> > > > The next problem will be, has everybody called it the same thing in
> > > > DT. Since there has been a lot of cut/paste, maybe they have, by
> > > > accident.
> > > 
> > > Tegra186: "tx"
> > > imx: "tx"
> > > intel: "tx_clk"
> > > rk: "clk_mac_speed"
> > > s32: "tx"
> > > starfive: "tx"
> > > sti: "sti-ethclk"
> > > 
> > 
> > The dwc-qos-eth also use clock name "tx", but set the clock with
> > extra calibration logic.
> 
> Yep, that's what I meant by "Tegra186" above.
> 
> > > so 50% have settled on "tx" and the rest are doing their own thing, and
> > > that horse has already bolted.
> > > 
> > 
> > The "rx" clock in s32 also uses the same logic. I think the core also
> > needs to take it, as this rx clock is also mentioned in the databook.
> 
> The "rx" clock on s32 seems to only be set to 125MHz, and the driver
> seems to be limited to RGMII.
> 
> This seems weird as the receive clock is supposed to be supplied by the
> PHY, and is recovered from the media (and thus will be 2.5, 25 or
> 125MHz as determined by the PHY.) So, I'm not sure that the s32 "rx"
> clock is really the clk_rx_i clock supplied to the DWMAC core.
> 
> Certainly on stm32mp151, it states that ETH_RX_CLK in RGMII mode will
> be 2.5, 25 or 125MHz provided by the PHY, and the clock tree indicates
> that ETH_RX_CLK in RGMII mode will be routed directly to the clk_rx_i
> input on the DWMAC(4) core.
> 

RGMII is not the problem. The databook says the RGMII clock (rx/tx)
follows this set rate logic. 

For other things, I agree with you. A fixed "rx" clock does reach the
limit of what I know. And the databook told nothing about it. As we
can not determine the rx clock of s32 and it may be set for the phy,
it will be better to not move it into the core.

> > > I have some ideas on sorting this out, and I'm working on some patches
> > > today.
> > 
> > Great, Could you cc me when you submit them? So I can take it and
> > change my series.
> 
> Will do - I'm almost at that point, I have three other cleanup patches
> I will be sending before hand, so I'll send those out and then this
> series as RFC.
> 
> The only platform drivers I've left with a call to rgmii_clock() are
> sti, imx (for imx93 only as that does extra fiddling after setting the
> clock and I'm not sure if there's an ordering dependency there) and
> the rk platforms.
> 
> Five platforms converted, three not, and hopefully your platform can
> also use the helper as well!
> 

I think my platform can fit. Thanks for your effort.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
