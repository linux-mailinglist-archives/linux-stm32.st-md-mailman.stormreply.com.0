Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4504CC4E16
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 19:30:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E146C01E77;
	Tue, 16 Dec 2025 18:30:15 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3912C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 18:30:13 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-477632d9326so30062765e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 10:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765909813; x=1766514613;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O2qwyKoiSE4y0S7R/sYbAU8Ep9J/DNr0jxtlpXQRjF8=;
 b=TJuFZPaYxyR6Ce83jI8N4BXLBNfOnkZrYjYv0pJTGOpcWDToO10NVuRk3r0J8W3i2F
 LIQUxHq5sM4T+drZK296F4SPrw9nTxQ5GCKoaH7gG8KO8InIVdKC0Ea+Qm0GloZ6l/5O
 5j4WWdA/kJZ3PHKSxHSzMiK1ijYww4iQBm4hNIn173aPiDjih2+siVTxBoyygKB0GcZw
 jQD9Z981Hau8XCXGfi54NSyOKP4FBLPu17ixTEaVjdnf8Vaz97qyLUrBrNokzWcS/mbM
 iSWrqh/fFKn6MoauCIbUJdBPwl4Hm17Uxzkg7amn6vogOu27JlklXfCa7ZaymoKD7qek
 OExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765909813; x=1766514613;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O2qwyKoiSE4y0S7R/sYbAU8Ep9J/DNr0jxtlpXQRjF8=;
 b=Y6Y+v0SfL4b80BDGfjqtfePTdX6WEcZjN3sTrpkR78NHexC8N+svDjcrLme3vqnJJ7
 SFFcpJlAzUGqAxVjUijM6LtrMjDhSipC6FJK8+WFuWf2eBsz4F6+OWonw+1aMatfxqTI
 flWqPaWGLe8mNppsv0g2K1nuapBNG22tCvCSjfnb2tIi1MfJsOBhff+IFJ2Ip+LyZ71b
 i9mgv/gubIaCxCUZ7eIPJOS0frKgQ5O46Ln9f86YbM1FOZI5GOQ1VsCGFJoHbjTBv87W
 i3BIXJhU2r0aEyXMSru06TPQNoNHUZ8VRuBEFfUlkMioB6wbxfcsjGyCymfxA1yBWLJN
 d7bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0dXqx8TNNjrBpmuWGFbxDY8h2sQOw9FoZW0COatbbNSTcMeKNEMEMXPtZz2f89Rqv0WYC3+a5wNeNQA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwwxTx9Ivav2ThVg11epA3oYc6C47ANY9JBL1WddIZoZ0ZnMhu8
 3OW7FR+KAbLiSThI44A8tHh0LivnaThfETwhOAiRh958C/xnSpJSx+3nsd1HCW7rL74=
X-Gm-Gg: AY/fxX7Sx6ShP5PDgv5uY8KBtbWLRB9OkeO7ss4C+ou9YV52iWEuS1pu7k1EzNaRDeg
 Q0Jhj7dLEAphv4k0/brPKxdVL0RmElpyaBdJ2WLVEdflMHMS7LLKH81LsaYRUATBYHH2WXbnyO1
 Uf179AZBGKqkYA0Ilga3srMnmAa55rG1g6wdFf6QHfY263Ip+7XLp3BYnko5BaYNgXJA3VJY1pW
 o/gernPegIKUevFMzeouP6kFu/rCqrmmc4jKCE9QqkwXe4PYgX9sUf55eMkuThod52Y+0vf0Yqw
 MBB/1K/juTpVAJ53Q+IUfZVzI3avJaYuKfe68HwdgN6g4YkZ2PaDJ5JMA+Kl68Uf6e+zIv+tScF
 UbOQfQfhGeqj+I9hWrvOjY7MpPPOmXaPebmVBahBHjEGk/rKoi0i0O2HyXDauYtR1uXnojQzAPF
 L+tPH9lc41EmWU9+Wx
X-Google-Smtp-Source: AGHT+IF+nY/k4C/6P18u9JysznJj/Z5B3Y6A+1aqCm2cbh7pc65+FeNcv1ODeP4J/8ke38+irCHPGg==
X-Received: by 2002:a05:600c:45c9:b0:479:3a87:2eeb with SMTP id
 5b1f17b1804b1-47a8f91515amr130008935e9.37.1765909812657; 
 Tue, 16 Dec 2025 10:30:12 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bdc23c2b0sm2187435e9.15.2025.12.16.10.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 10:30:12 -0800 (PST)
Date: Tue, 16 Dec 2025 21:30:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Message-ID: <aUGlMP7J19L_AHF2@stanley.mountain>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
 <aUAvwRmIZBC0W6ql@lizhi-Precision-Tower-5810>
 <aUBUkuLf7NHtLSl1@stanley.mountain>
 <aUBha2/xiZsIF/o5@lizhi-Precision-Tower-5810>
 <aUBrV2_Iv4oTPkC4@stanley.mountain>
 <aUB4pFEwmMBzW52T@lizhi-Precision-Tower-5810>
 <aUEQkuzSZXFs5nqr@stanley.mountain>
 <aUFvvmDUai9QrhZ2@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aUFvvmDUai9QrhZ2@lizhi-Precision-Tower-5810>
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linaro-s32@linaro.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 0/4] s32g: Use a syscon for GPR
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

On Tue, Dec 16, 2025 at 09:42:06AM -0500, Frank Li wrote:
> > >
> > > Why not implement standard phy interface,
> > > phy_set_mode_ext(PHY_MODE_ETHERNET, RGMII);
> > >
> > > For example:  drivers/pci/controller/dwc/pci-imx6.c
> > >
> > > In legency platform, it use syscon to set some registers. It becomes mess
> > > when more platform added.  And it becomes hard to convert because avoid
> > > break compatibltiy now.
> > >
> > > It doesn't become worse since new platforms switched to use standard
> > > inteface, (phy, reset ...).
> > >
> >
> > This happens below that layer, this is just saying where the registers
> > are found.  The GMAC_0_CTRL_STS is just one register in the GPR region,
> > most of the others are unrelated to PHY.
> 
> The other register should work as other function's providor with mfd.
> 

Syscons are a really standard way to do register accesses.  The
pci-imx6.c driver you mentioned earlier does it that way...  The only
thing which my code does differently is I put the offset into the
phandle, but that's not so unusual and it's arguably a cleaner way
because now both the base address and offset are in the same file.

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
