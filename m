Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A0BA39B11
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Feb 2025 12:35:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0EC0C78F87;
	Tue, 18 Feb 2025 11:35:10 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD04CC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 11:35:03 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-471f686642cso13027731cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2025 03:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739878502; x=1740483302;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=afaSq1n/9Zx2C/a6yp1UZpzU8FTiNXOckROl9W+xe1U=;
 b=Wetu+jABCo6go46qgnIHzNELnFflZ2o5y+L2ozdZ/syVMRXlu99keN6zaHoRIc9ILZ
 ycPMjz8P+aK3JG3sfrOnxiswGgiPuLcWre+E+scP2JWCpypOKj6YGah0aQ83Fsub2CG4
 vpGxIRRo1APs6a/CXkrT23NsfdFj5mCUUj7EvQb4HBi3yBw/z25kT3Bi8Zsi4n9sVche
 9gVEWSo8CS1QH4tpqy2rTwUxUZu9z+R+IHqtXvUXouyaHYjxpBGk/yKYniNdyViGGaJx
 ChVknF9zBYHX4NfKVERYAZ0askch7rb27jD738yzPUaA24qBi6OaqQEnEqfSiO/sOiSw
 ojSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739878502; x=1740483302;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=afaSq1n/9Zx2C/a6yp1UZpzU8FTiNXOckROl9W+xe1U=;
 b=B03WVWOB1XqEywjdIpPVNEbkhh+07ZiOTF6TuPOV+jO4U2tnUmLQlA/uN6IFRqRW39
 F7EoXfcQKWRUdyU+WpmuN/5pj3IVpLCVzky83AWsC5RAfi2RLwRthxZMcyt6x1+wrnMD
 b7avcAQ8O4xSGMW6jXdVXy9NeaueHbbOmcfvxtb65aP0mDyFgn4YUOwB54TM5GJ/cLgH
 gOj+p48J1kpTq34ZFS1Xfyr7mHDdtXB/EGewyG8d+3jsjr8YGZp6VE2OgVQIPbzoEExE
 kjGacjNQe8GYPKQxHqJPXGwrZw1AcF0oseXLJQDye6QUOwfBB/tXaqFAtj8FBl4hFN7l
 OqYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkKqRwtMWxuNLROm+wkqd5qSzmEEMXct7piaY9hvlfTGTOa2IrMWrTD5HWF9MIrqImyivvG3Keu1sKiA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyFtWkpHTSEce2jJcyBvvR2WR1NTSpiTJmiqe8RhZKKuD+qe/DL
 CoWdQUbO+oFGJDEQ5ZbkYyRbSqRTk3wqEYn5IUhDhT4H8ZgnyPME
X-Gm-Gg: ASbGncvvUxHwMm/Uaknc31zchUNus/VtR2r5JGGVPq0TqbPcxACkYPjayxTEMQ/Fh2D
 C6kjEqkQbAU8uNo9hShewBZhcFGyRPXtjcRhiDrvy9GGKNgcbBF/35h4itLiWiTYvg/YV288vhM
 ZtX9gqm8M3xR+Gzw5++VXxgADs3sOd+D5p8jEans/1kZNM4BKwxPrr45n8g7h7+rHvdqfmRzURI
 AfukZFKhoILYUsgD1lA8HMuc5kpAqhaVu++B50jNUlMT8nAgA6C8TU288K9yGr9ogo=
X-Google-Smtp-Source: AGHT+IFe6C/gSNnzxL8kV6UCXZr3P6tf9lX30/uxdZgxSpgJktrmUiTn4Zw2m+FrVeltIJ8PDsdvvQ==
X-Received: by 2002:a05:622a:1803:b0:471:9cba:ad2c with SMTP id
 d75a77b69052e-471dbcc2e05mr196823821cf.11.1739878502351; 
 Tue, 18 Feb 2025 03:35:02 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 d75a77b69052e-471f2b0476dsm19857671cf.28.2025.02.18.03.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 03:35:01 -0800 (PST)
Date: Tue, 18 Feb 2025 19:34:47 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Inochi Amaoto <inochiama@gmail.com>
Message-ID: <thc5oknaqaw54wghyxpx6nr4kbykxvpgkgvpqsnsp2osjlxgwv@dekgtkxoywrm>
References: <20250216123953.1252523-4-inochiama@gmail.com>
 <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
 <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
 <24eecc48-9061-4575-9e3b-6ef35226407a@lunn.ch>
 <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
 <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
 <Z7PEeGmNvlYD33rZ@shell.armlinux.org.uk>
 <6obom7jyciq2kqw5iuqlugbzbsebgd7ymnq2crlm565ybbz7de@n7o3tcqn5idi>
 <Z7Rjjo5nZ0gnCbzq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z7Rjjo5nZ0gnCbzq@shell.armlinux.org.uk>
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

On Tue, Feb 18, 2025 at 10:40:14AM +0000, Russell King (Oracle) wrote:
> On Tue, Feb 18, 2025 at 09:01:59AM +0800, Inochi Amaoto wrote:
> > On Mon, Feb 17, 2025 at 11:21:28PM +0000, Russell King (Oracle) wrote:
> > > On Tue, Feb 18, 2025 at 06:50:24AM +0800, Inochi Amaoto wrote:
> > > > On Mon, Feb 17, 2025 at 02:10:50PM +0000, Russell King (Oracle) wrote:
> > > > > On Mon, Feb 17, 2025 at 02:25:33PM +0100, Andrew Lunn wrote:
> > > > > > > I am not sure all whether devices has this clock, but it appears in
> > > > > > > the databook. So I think it is possible to move this in the core so
> > > > > > > any platform with these clock can reuse it.
> > > > > > 
> > > > > > Great
> > > > > > 
> > > > > > The next problem will be, has everybody called it the same thing in
> > > > > > DT. Since there has been a lot of cut/paste, maybe they have, by
> > > > > > accident.
> > > > > 
> > > > > Tegra186: "tx"
> > > > > imx: "tx"
> > > > > intel: "tx_clk"
> > > > > rk: "clk_mac_speed"
> > > > > s32: "tx"
> > > > > starfive: "tx"
> > > > > sti: "sti-ethclk"
> > > > > 
> > > > 
> > > > The dwc-qos-eth also use clock name "tx", but set the clock with
> > > > extra calibration logic.
> > > 
> > > Yep, that's what I meant by "Tegra186" above.
> > > 
> > > > > so 50% have settled on "tx" and the rest are doing their own thing, and
> > > > > that horse has already bolted.
> > > > > 
> > > > 
> > > > The "rx" clock in s32 also uses the same logic. I think the core also
> > > > needs to take it, as this rx clock is also mentioned in the databook.
> > > 
> > > The "rx" clock on s32 seems to only be set to 125MHz, and the driver
> > > seems to be limited to RGMII.
> > > 
> > > This seems weird as the receive clock is supposed to be supplied by the
> > > PHY, and is recovered from the media (and thus will be 2.5, 25 or
> > > 125MHz as determined by the PHY.) So, I'm not sure that the s32 "rx"
> > > clock is really the clk_rx_i clock supplied to the DWMAC core.
> > > 
> > > Certainly on stm32mp151, it states that ETH_RX_CLK in RGMII mode will
> > > be 2.5, 25 or 125MHz provided by the PHY, and the clock tree indicates
> > > that ETH_RX_CLK in RGMII mode will be routed directly to the clk_rx_i
> > > input on the DWMAC(4) core.
> > > 
> > 
> > RGMII is not the problem. The databook says the RGMII clock (rx/tx)
> > follows this set rate logic. 
> 
> Sorry, I find this ambiguous. "This" doesn't tell me whether you are
> referring to either what s32 does (setting the "rx" clock to 125MHz
> only) or what RGMII spec says about RX_CLK (which is that it comes from
> the PHY and is 2.5/25/125MHz) which stm32mp151 agrees with and feeds
> the PHY's RX_CLK to the clk_rx_i inputs on the DWMAC in RGMII, GMII
> and MII modes.
> 

What I said follows the second, the clock is set at 2.5/25/125MHz
with speed at 10/100/1000Mbps. The only thing I can refer to is the
ip databook.

> clk_rx_i comes through a bunch of muxes on stm32mp151. When the clock
> tree is configured for RMII mode, the rate on clk_rx_i depends on the
> MAC speed (10/100Mbps).
> 

OK, I have no problem and find some descriptions related to this in
the databook.

> This suggests as far as the core is concerned, the clock supplied as
> clk_rx_i isn't a fixed rate clock but depends on the speed just like
> the transmit clock.
> 

This is what I want to say. clk_rx_i is not fixed but the
s32 uses it as a fixed one (This is the thing I felt weird).

In fact, Non-fixed clk_rx_i is why I suggested adding the rx
clock to the core at first. Since the drive may not use rx
clock as the databook says, it is good to leave it alone.

At last, it seems like that I need to improve my statement.
I am sorry for it.

> > For other things, I agree with you. A fixed "rx" clock does reach the
> > limit of what I know. And the databook told nothing about it. As we
> > can not determine the rx clock of s32 and it may be set for the phy,
> > it will be better to not move it into the core.
> 
> I'm intending to leave s32's rx clock alone for this reason as it does
> not match what I expect. Maybe on s32 there is a bunch of dividers
> which are selected by the mac_speed_o signals from the core to divide
> the 125MHz clock down to 25 or 2.5MHz for 100 and 10Mbps respectively.
> As I don't know, it's safer that I leave it alone as that means the
> "rx" clock used there is not clk_rx_i.
> 

Thanks for your explanation. This is OK for me.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
