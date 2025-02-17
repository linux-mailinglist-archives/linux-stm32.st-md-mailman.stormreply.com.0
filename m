Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D08D3A38F42
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2025 23:50:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B8C2C78F69;
	Mon, 17 Feb 2025 22:50:45 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46403C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 22:50:37 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7c07b65efeeso401936185a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 14:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739832636; x=1740437436;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GuRB9Jwf6lkVtrT6vIlRJUWZnFJbbxQGyG8tssiDsGY=;
 b=iwfUzPUG2ee78U4x1Yq9DMcUq56asCYC1BGxgPDF20qRzd1GCQV2pym37WpKQLT/NT
 lCHV/+I4pMuSWuv+w/U0vdWKuhqn9qAgo4mg4RX5iuPQ5w0J9CO6zNf0v3PWcw5qwQM2
 HC/rxqjKDsDh6ChnsgxqpJ27eaZBw6D8LMu41QwNBcp2B9ZOoOSNIT6MgLP9wo99fmjN
 EeIkFpvyQH1lgr9FjnqaqTVuRuc9hu3sB/nM75iJG0WOokyCr4Iji7KSILQib1zyd3zL
 Hp0JbJNSgcqFa53MZajsl+R4LzwcGGV/fl7FzFrMzrQPf3ko6taglNJ2imu+ga9Yk5hB
 OzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739832636; x=1740437436;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GuRB9Jwf6lkVtrT6vIlRJUWZnFJbbxQGyG8tssiDsGY=;
 b=FngMsrENpm4lYPfijbzXtzD+Y/OuWa5uJW3iOuUK560qu7EDTPtjEr0rlUiXFR8L6z
 MN2DGBdCT06MBXv8JFKxiRWptHRtuLSO8EHN9fInOSKzxS6L1p6WBzJJw2TUXTL9rmIO
 Z6HEFTg4u3AM3F5/yVlvSfordTRqNrhqPMj0WFUoVNUptEyEQEWD0l34DUFsy5DM5pK2
 4ynE3YgUwcy+7EcFuV9Q40x5fDf57AwWULM1UUsWoSYxnUakqNB/P+XYSQTw36zCSzbC
 KLmxut6GYWFTTp3QjB86etUUol0ywy1eO2f+F3ZjFhAPxUAdXZTvGTwUYmnFiwqKoN5v
 qjUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+IGv4jtFJOO0OG2deahTjc6dJZA08scdpca3JnEm69v/vNGDBX5j8Kj+kH3vya9L31v96q+odprpdiA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyxwTLLgNsitPfmWG59eRgDO+A+MAUDqmgnFcP4ndfsZDyX3qMC
 WnZlVtAwb42sS/m+Oxe9X1qSFOOYiC0Ff6brKmdxDwPl+N3v+mCc
X-Gm-Gg: ASbGnctJK3tYBaltoHzOFIig2r2iJ/l0iyVluZnaMc8NpXb1mCpGPRHxeP0A3XR3Hhm
 6TFadTvPW4JcvzbX3kK4Gr45tuCet1iQKJJqLWeRqqaEJakZhElwXF5DlvW0rvv7ntMGKUDsD3w
 /c3b2wnQKDkzSDpewtW78NmfOPoNMJxzKxw2Nf0ORgUbs2HMvuwUOX7qpJiZlimEsrOpBzku6K+
 bPgpK/0Vj0VMGhFtbgd+qCAhAEPkjv0s1+NJa841MOxcFwpfo3kuHYo+SiVZrNw8kM=
X-Google-Smtp-Source: AGHT+IE77k8p+mAi1BZHXw2Af6ibqX9QoECI2nv0Dz4rUPqmmgRmUNBBDIKtrBxkEobOVjl1YJiisg==
X-Received: by 2002:a05:620a:44c7:b0:7b6:d97a:2608 with SMTP id
 af79cd13be357-7c08a9a6481mr1561011085a.17.1739832636093; 
 Mon, 17 Feb 2025 14:50:36 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7c0971334f0sm208792885a.56.2025.02.17.14.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 14:50:35 -0800 (PST)
Date: Tue, 18 Feb 2025 06:50:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 Andrew Lunn <andrew@lunn.ch>
Message-ID: <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-4-inochiama@gmail.com>
 <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
 <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
 <24eecc48-9061-4575-9e3b-6ef35226407a@lunn.ch>
 <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
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
 Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Hariprasad Kelam <hkelam@marvell.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
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

On Mon, Feb 17, 2025 at 02:10:50PM +0000, Russell King (Oracle) wrote:
> On Mon, Feb 17, 2025 at 02:25:33PM +0100, Andrew Lunn wrote:
> > > I am not sure all whether devices has this clock, but it appears in
> > > the databook. So I think it is possible to move this in the core so
> > > any platform with these clock can reuse it.
> > 
> > Great
> > 
> > The next problem will be, has everybody called it the same thing in
> > DT. Since there has been a lot of cut/paste, maybe they have, by
> > accident.
> 
> Tegra186: "tx"
> imx: "tx"
> intel: "tx_clk"
> rk: "clk_mac_speed"
> s32: "tx"
> starfive: "tx"
> sti: "sti-ethclk"
> 

The dwc-qos-eth also use clock name "tx", but set the clock with
extra calibration logic.

> so 50% have settled on "tx" and the rest are doing their own thing, and
> that horse has already bolted.
> 

The "rx" clock in s32 also uses the same logic. I think the core also
needs to take it, as this rx clock is also mentioned in the databook.

> I have some ideas on sorting this out, and I'm working on some patches
> today.

Great, Could you cc me when you submit them? So I can take it and
change my series.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
