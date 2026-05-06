Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJDDEBZe+2kuaQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 17:28:22 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D14F84DD35C
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 17:28:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 812D1C8F289;
	Wed,  6 May 2026 15:28:21 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 655BAC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 15:28:20 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-44e1860558fso2440487f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 May 2026 08:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778081300; x=1778686100;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CGs4aXiGfe9FWzGIQNV1c8scbxohD/REqUQGlNaM17Q=;
 b=edBUEEiI/f9uRSMIB7FBcHqGtDQ0VQKjkxtNiz9vgRv0qhbRWYF6x9eZ7YtU3eYdgL
 oDjZ9MMx1/8l0YAswYjEsSlyg6gz61rpsKFzzHgRBvWhnVPuABiS1nBvM2nDNeG28kuz
 Jb6NSxHV4wV/0IqTKySlMXLQWCXjdyy0X/eC2WVixJWwyOuXmQ31ezPfnKseAqPlhZTM
 yj3iWcz17ReRkaB2GvuFUlNom2d082/4zlz5BGI3qlXjc69dvV83s8s7tA4eM/J+O5iZ
 vHgNboOpEIsO+5aus6WOdSPlsaC3+4fcEEXfAK4YSVjT3XUfibUJ77dRkjMjnMItcsFj
 NK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778081300; x=1778686100;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CGs4aXiGfe9FWzGIQNV1c8scbxohD/REqUQGlNaM17Q=;
 b=HfO37lrmhJpqKhryDuFyx35UsLoUkRxH4XiPL/CIZSHeiRgr2Ku1Nnma/ulqP18K1Y
 GJQa0zxryek2+Rj2v6ig3jIOTDin/8aGpAmYGLuhJX2I+Mlg5jb2JuX80ZEaBKGKeOxQ
 OKx+SThsr9/KSA+qMQXJu6WhvxDGqwU3qBwIRTUTfNrC0tgc4rjjKKW1jvly+rEN70Zd
 8N9Vm5yO+wieTNm7tsUhMRVB74QEwYoTY359oa2hS97mqOPzwWeRiadOXPQ7V5Z8mIWc
 2laJFpj9LWKWvGnn3I727EkaDhvR0ByspemqQ8GvAY/sqxDcJF1fCAsJcMTvYdzd1tvR
 kgjQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9m69tThA0anDHEjQPBuCOGEyUqCjJTH8gouY6P5kJgAdJFAF3Mnaf/znFeV1BUrPf09SiCwXKcIJm28g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz+0w7q3zaS+/qVZ7MyiROKgo68CT5ntsJTOoFiFl3kuG8KUjlq
 xRtkaL/ZARbLrv8jxRFillxX1ujOxtyYLOq+rjd+0WhgqE2hRE8SCV3nX7Bmlo2Llhk=
X-Gm-Gg: AeBDievH1aE7CvGbjTiSZA/UrTo/qTubQWq99JNtBC9yWKQeL6LxWodq3xhnUzvmvOP
 x8JZhn0EPT+tywnsFtdqoUpE/uTtKZu7RPtnENxG9AYDL5aKM7xq1RdoE8G3Sy6sqqCiK9h88qs
 fxJUoovSDC8Lnsb3HOSeCJEAmi6/jBJb0GOmtpRCg9aOpD2H7QlC2d7+H3RuDO1usZWMNNuR6vY
 Emf/5aV3TQ8d4cf+ISOI1hvKIJkd6MC7GhCzk9INLGUF+Mz4M/oAJ8zULeTXdoAzh1rJJUzUQZf
 L9kZTE0gzW7AEK/7nZpO7HDwOCPoBcZX5ZOcvo7X4SEtHtogx1vDdfKd/Dd6VQ8xN0UzT4XDlYN
 pIorOD+SHMLdfYyrx7z/WzJNHR+MsyB+10us/QwtBg5xuM92NsqT7WF3uJPlhXzyA1FNCIc5877
 3Pqo8EBxwBmpPKijbLzrZFHFOszNHXB/NThJwKXVmkou75LqdzK3eBvgo5ZNMQ+QSGgnS6j11gN
 IUpXHL8fgNXSLvCRaKyp4BuFZdYHPFcrYzWY1e5T7v+Y7/knrVeyLrkSUWPdvjJmOE4AMUjlSa+
 eQwPRqRuTcTQ6ML4FuU=
X-Received: by 2002:a05:6000:2405:b0:44e:902f:e341 with SMTP id
 ffacd0b85a97d-4515cf11ce9mr6889250f8f.20.1778081299271; 
 Wed, 06 May 2026 08:28:19 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45055960902sm14773996f8f.28.2026.05.06.08.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 08:28:18 -0700 (PDT)
Date: Wed, 6 May 2026 16:28:15 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <afteD2d8d87Nyvl7@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <224E233C593EF171+8c8a43dd-5061-40f8-9eb7-f360eabf2ecc@radxa.com>
 <4015f47a-af62-441d-b1b8-a8598f963970@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4015f47a-af62-441d-b1b8-a8598f963970@lunn.ch>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 chenchuangyu@xiaomi.com, edumazet@google.com, netdev@vger.kernel.org,
 Xilin Wu <sophon@radxa.com>, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 Alex Elder <elder@riscstar.com>, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linusw@kernel.org, a0987203069@gmail.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, andersson@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 10/12] net: stmmac: tc956x: add
 TC956x/QPS615 support
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
X-Rspamd-Queue-Id: D14F84DD35C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:sophon@radxa.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:elder@riscstar.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kerne
 l.org,m:a0987203069@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,xiaomi.com,google.com,radxa.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,riscstar.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[50];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,aspen.lan:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]

On Wed, May 06, 2026 at 04:19:54PM +0200, Andrew Lunn wrote:
> On Wed, May 06, 2026 at 08:59:01PM +0800, Xilin Wu wrote:
> > On 5/1/2026 11:54 PM, Alex Elder wrote:
> > > +	/* AXI Configuration */
> > > +	axi = &td->axi;
> > > +	axi->axi_lpi_en = 1;
> > > +	axi->axi_wr_osr_lmt = 31;
> > > +	axi->axi_rd_osr_lmt = 31;
> > > +	/* All sizes (2^2..2^8) are supported */
> > > +	axi->axi_blen_regval = DMA_AXI_BLEN_MASK;
> > > +	plat->axi = axi;
> > > +
> > > +	plat->mac_port_sel_speed = speed;
> > > +	plat->flags = STMMAC_FLAG_MULTI_MSI_EN | STMMAC_FLAG_TSO_EN;
> >
> > I got WoL working only after adding STMMAC_FLAG_USE_PHY_WOL here. I guess
> > it's required, since the driver clocks down the MAC/PMA/XPCS in its suspend
> > hook?
>
> Nice to see somebody testing WoL.

Absolutely!

We recently stripped out the (obviously broken and partially ported)
WoL support we had in tc956x-pci.c. We planned to bring it back later.
Hadn't realized it could be so easy.


> In your testing, is it the PHY doing the WoL, or the MAC? I assume
> PHY.
>
> If i remember the DT correctly, the PHY interrupt is connected to a
> SoC GPIO, not a GPIO of this chip.

On RB3Gen2 (and I think also the QPS615 reference design) the phy
interrupt is routed twice. It is connected both to the TC9564 GPIO
block and to the host SoC.


> So for your board, it is the SoCs
> GPIO controllers ability to perform the wake which is
> important. However, where the PHY interrupt is connected is a board
> design issue. Could the PHY interrupt be connected to the chip? Would
> the chip be able to wake the system? Should STMMAC_FLAG_USE_PHY_WOL be
> conditional?

I couldn't think of any reason to use the TC9564 GPIO block for the
interrupts on RB3gen2 so I left it unused and the DT describes the SoC
routing only.

However if TC9564 were to be mounted on a real PCIe card then we'd have
to use the TC9564 GPIO instead and would have to leave enough of the
TC9564 enabled to handle the interrupt (and also to load a firmware to
catch the interrupt and drive the PCI wake up signal).

However such systems would need extensions to the current driver. We
have done all we can to make it possible to add those extensions in the
future but we would not be able to test them: not only do would a real
PCIe card need extra driver features to play nice with ACPI but the
card would also need an I2C EEPROM. We don't have that EEPROM on
RB3gen2 (and again, we'd need firmware to read it).

TL;DR - there are conceivable (and sane) hardware designs where the
interrupt goes only to the TC9564 GPIO, but they are too different to
RB3gen2 (and related SBC designs) for them to be supported before
they exist!


Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
