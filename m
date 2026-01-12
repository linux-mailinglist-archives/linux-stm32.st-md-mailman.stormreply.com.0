Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC07FD1177E
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 10:23:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69DE4C3F945;
	Mon, 12 Jan 2026 09:23:14 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18D5CC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 09:23:12 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so41869155e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 01:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768209792; x=1768814592;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pH7l/IngScfdGsuBC+TU2Q1UG3VpnMUzYFClpTkwAAs=;
 b=hpNGD9FTZYi/c029XiFStTR9LsRhOkwmCBOtzfnRW5fFScrYnV7qtNwZhQ1nxhV782
 1WkN8VjC0S+2QD3PmA1+p31XzBq6hpt6lttVvlXrjWmtWEkaQEMADguGMfEhDiE0Q3W0
 i/uc4nNGOef75aByn+W11RQGXNPg/y1M6UbpRLv6iQPuMHxex69k8r89LBUCDF1MFqE3
 aG/S37+kh1SoKs4Dj0pQt4paagtD05eqeDF8j9+2nI0Ufh/wvqveOHxXPUPp2Ct5RwDo
 vgkF0UAaBFjoIO2U6koH6JursWW7Dt8VaUCphI9frDA7GAp6R016nJdcV3jmv0iY5II5
 6zTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768209792; x=1768814592;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pH7l/IngScfdGsuBC+TU2Q1UG3VpnMUzYFClpTkwAAs=;
 b=s/lbAuevFVZ/wXk0P+gQdlfmeZLXySSDDXDMo3JRjbeV9ei2PrCcEhuVCjSjl019++
 F6ogiS8F8YXZTIjIHr3WP64CpjmDyw0AtX0cP/NsCM6lHyn1ncxFNQPpsygxrjxWgbD9
 aALLgariwgIqnDR0JBIA6mfWKUepB4Em4v0CGIfKzdxY8Lwl2ICdsRavCL0IrUFbBRGe
 izGpXf8KbAuiXYBdAh+D6GBWwavH2PP/id72M7IaAIDmhiOMyWnraL8ApcxdeGKTIO5F
 /Kt9N4nGpOAy/GFF03ADE3ZkZG1WQZQcP71cHgE0jqlBog9ZVTJpOVHURhS18Q5X1LKd
 1l7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkvkE1s0rvGTaPUONm7QhJZykmRmh+Xzv9pFygkvT1a4yUWVgSROEh8kl1vZNKVzTzq+c5ApMATJxLyA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyxMXvzyWN02eUTZniO946uEGlpwQhkwX6jox9P63V2KR2lIObG
 0CSU4Xc1ZJivN/zVkCJ8ozDMOGmu41LVPdmnK7Zrpys24gys2VVn9UlI
X-Gm-Gg: AY/fxX4tMJJQie/iZ7l3KaRjlRovbqSpha/ggiweht9U51KrHATsDnApR2GXJZWiFqB
 AiAA3mZhDaGZXPZz+lIKfDJfZaA7nego+dxbasXZ5oHQS9ohneW3+N90GIeb5jwGBrGOjhDRuME
 cyJ91CfNa+G3A+PsYesFIDENin1Dxs9BADw1XHMqLy+FUEbyaxCA8/hz3Aw/ctp+/jJKq6dTBhf
 EuOU3gqznMZ4CUgT7+8sue0wCChFvk0PJrON3c+KjV4nnMwb6k7mgaWSLhnnHIUweu0tXlX8oSq
 cYqMFy7ujTy7MdN5HJLyKW01+KFs7pJKdiKNqErJ0xobdPppz7wLw0RUf0a0DH81wORKd8amtOe
 mlS4jVjnhCi0FWJut8raiVnC9rxzEYTtiICehAvEzRH9/OUFbZPOxG0T/cOv7mdk/HA7ARGYRK9
 4dwMNyxeuYh2s=
X-Google-Smtp-Source: AGHT+IEgPar+mXM5tZEw8XTR8zGlfzWecvjpL3x+Bjt2enom7FVlV7Q9qKVKAMWvUj+uzL/JY/TX0A==
X-Received: by 2002:a05:600c:1d0c:b0:471:700:f281 with SMTP id
 5b1f17b1804b1-47d84b4093cmr171075305e9.25.1768209792166; 
 Mon, 12 Jan 2026 01:23:12 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:6091:7b62:54d8:ee9e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f41eb3bsm357831195e9.7.2026.01.12.01.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 01:23:11 -0800 (PST)
Date: Mon, 12 Jan 2026 10:23:09 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aWS9fbfvuayJpo3a@eichest-laptop>
References: <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
 <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
 <aVv7wD2JFikGkt3F@eichest-laptop> <aWC_ZDu0HipuVhQS@eichest-laptop>
 <8f70bd9d-747f-4ffa-b0f2-1020071b5adc@bootlin.com>
 <aWJXNSiDLHLFGV8F@eichest-laptop>
 <aWJ0iV6-_4XqpeHD@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWJ0iV6-_4XqpeHD@shell.armlinux.org.uk>
Cc: robh@kernel.org, Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, imx@lists.linux.dev, festevam@gmail.com,
 s.hauer@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 francesco.dolcini@toradex.com, andrew+netdev@lunn.ch, edumazet@google.com,
 kernel@pengutronix.de, netdev@vger.kernel.org, kuba@kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, pabeni@redhat.com,
 shawnguo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND net-next v2] net: stmmac: dwmac:
 Add a fixup for the Micrel KSZ9131 PHY
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

On Sat, Jan 10, 2026 at 03:47:21PM +0000, Russell King (Oracle) wrote:
> On Sat, Jan 10, 2026 at 02:42:13PM +0100, Stefan Eichenberger wrote:
> > Hi Maxime,
> > 
> > Not problem, thanks a lot for the feedback and the discussion. I will
> > then proceed with the current approach and send a new version with an
> > updated commit message.
> 
> We could add a flag to:
> 
> /* Generic phy_device::dev_flags */
> #define PHY_F_NO_IRQ            0x80000000
> #define PHY_F_RXC_ALWAYS_ON     0x40000000
> 
> indicating that the MAC requires the full preamble, which the PHY can
> then test for and configure appropiately.
> 
> The question is, whether the requirement for the full preamble applies
> to many MACs, and whether there are PHYs that default to producing
> short preambles.
> 
> Looking at Marvell 88e151x, the only control it has is to pad odd
> nibbles of preambles on copper (page 2, register 16, bit 6.)
> 
> AR8035 seems to make no mention of preamble for the MII interfaces, so
> I guess it has no control over it.
> 
> I've not looked further than that.

From what I have seen only the S32 and i.MX8MP MAC require the full
preamble because of the errata. I also checked the i.MX93 and i.MX8DX,
they don't mention the errata, so I assume they are not affected.

Not sure if adding the flag would be a bit overkill. However, assuming
we would do it that way. Would ndo_open be the right place to set the
flag in the mac so that the phy knows about it?

I would think about something like:
- Add a flag STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD to stmmac.h
- Add a flag PHY_F_KEEP_PREAMBLE_BEFORE_SFD to phy.h
- Add STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD to priv->plat->flags in the
  mac driver platform probe (e.g. dwmac-imx.c).
- Set PHY_F_KEEP_PREAMBLE_BEFORE_SFD in stmmac_init_phy (during
  ndo_open) if STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD is set under
  priv->plat->flags.
- If PHY_F_KEEP_PREAMBLE_BEFORE_SFD is set in the phy driver keep the
  full preamble if the phy supports it during config_init.

I could send the next version doing it that way, to see if that's the
better approach.

Regards,
Stefan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
