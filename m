Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC43CBF713
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Dec 2025 19:34:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFAACC35E2B;
	Mon, 15 Dec 2025 18:34:00 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC2F4C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 18:33:59 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4779a637712so25737625e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 10:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765823639; x=1766428439;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8ivCXo0tlAhX6SrgNkqQcm5Kx6Z8sjaJXC/TK9cEdNg=;
 b=V9xP5qsxZ9ls6EhoFWJfnYIvTjO0lETngCNpLtghmJIzuGbXVBJ/38vAvVVO7mwybh
 MqMu4KK6R/czgyzsOKi9Jx5sKMYA9wulcQGLs1gQAlMmeoCcJyhm4UB/yGZhKfghnIbi
 q4QqV/IvGJ7m66CbbD6/LCW7BIzZgQC8V48JvP0W3qSP+TZymY67/T62+2mYnfUXM55G
 /+IX9ZGSZtbkMpZX0LDVg5Eq9wfz54v91Qj25RpzV5oMckqlq92aM3s5dXsyvDVCNOGp
 h8bI50/zR2abwYJ9iDl6BGJ2REkua+L8MOHUUIbOhbo5SU+SbzHivcyt9hIPjLDhB6Az
 QauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765823639; x=1766428439;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ivCXo0tlAhX6SrgNkqQcm5Kx6Z8sjaJXC/TK9cEdNg=;
 b=cPKElgEe8gnkTQGYZ1QtS/giPCez3IewkQJyBJJU/SvDc2sgurKmRJyECGPjMhd0dy
 sd6nGKSqkcCw7D7fRkBwftiWfmvbsPOku8fKjuO435PDCBZAdCPybUJhofh69Ml4Sy18
 XbM6IQt8LlwP/JoUTlyJznNJMoTpMnCwQ9hboK8UghM1osk+hUMrN6Ca3fX3aWJ9ftHI
 jFp1k0GjWGZXXoTVdq6DShX4MNrOrCSWIwGo9y5Q8bHkyC/4QSkZTmHpY8dNjXV30nWa
 1Oox3u7Wm2cJzEOS7t9Ppgv26dfG1CbTg5ObwP5DUmS5CRcyUpiazv4b9MuWkqwUk5r9
 8MNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXygFTuCh/b0oQMzIzlI/C0o8nrmpA3YW5NvLlJaNH3m/jbr4YBrb8Zh62zDs2e3DxjlwAEbSlQByHruw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwLKbocx9PcsPFb1f3lJlLXNbS+qGP4H9PsjNeNam5ZgU9cEUEE
 PKxWnoBGRBVtVSJLSaCoBfDqoJmftOL+j3E3uhgOhcmXzjU349GNwQzdGXN0DDB5sqM=
X-Gm-Gg: AY/fxX43vo4TXCgpjBdOD+sq+BdZyHtyk8vu24KZsb9njdAry7RHqJy2iT9OH1T4gfj
 CLplesq9c+9Y1nKFoxx1uRU9vCh/Sk49l1zNRFwI01tLB3HEDVdlKKt5NLFhlLK/mwWrcNQb2bH
 tA1jhVgI2Civ+TdTCY0njXe+SVJZjsxZubLD08W+JkkAJmN3CWcfzAmDDeqg8IhPOrO72evYc/C
 Tadk8uL03xazh0VTxSrlWPDorlFSPtTf+jYamttpIKsKBPQUlreBQayAO2Dz2enPm9viftY9lVt
 kt3cQu4+RIrmOWRDfaxRHCoapjP4mAw+9VL7wnYJQl94aprqByM3bB3fw+i6fYrIFkXtzBnsqkU
 lzD+nZINcshb/+P6Pa5qVw7K8k4hjnjsev8XlSgZC63bEN2zN5CBeojE8PkX6pw5bC5dtcoYUAj
 y4jlqVKrB1cmAstfbe
X-Google-Smtp-Source: AGHT+IGD9iih4mWv4BLSj82m0Ympx0mGmlL43wh+neFiQaKbjBxHvTG8uww0J8sP/od0z1H7q0uRNg==
X-Received: by 2002:a05:600c:5252:b0:477:76cb:4812 with SMTP id
 5b1f17b1804b1-47a8f708ebamr117215125e9.0.1765823638856; 
 Mon, 15 Dec 2025 10:33:58 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f280cf05sm16491842f8f.7.2025.12.15.10.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 10:33:58 -0800 (PST)
Date: Mon, 15 Dec 2025 21:33:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Message-ID: <aUBUkuLf7NHtLSl1@stanley.mountain>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
 <aUAvwRmIZBC0W6ql@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aUAvwRmIZBC0W6ql@lizhi-Precision-Tower-5810>
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

On Mon, Dec 15, 2025 at 10:56:49AM -0500, Frank Li wrote:
> On Mon, Dec 15, 2025 at 05:41:43PM +0300, Dan Carpenter wrote:
> > The s32g devices have a GPR register region which holds a number of
> > miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
> > anything from there and we just add a line to the device tree to
> > access that GMAC_0_CTRL_STS register:
> >
> >                         reg = <0x4033c000 0x2000>, /* gmac IP */
> >                               <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> >
> > We still have to maintain backwards compatibility to this format,
> > of course, but it would be better to access these through a syscon.
> > First of all, putting all the registers together is more organized
> > and shows how the hardware actually is implemented.  Secondly, in
> > some versions of this chipset those registers can only be accessed
> > via SCMI, if the registers aren't grouped together each driver will
> > have to create a whole lot of if then statements to access it via
> > IOMEM or via SCMI,
> 
> Does SCMI work as regmap? syscon look likes simple, but missed abstract
> in overall.
> 

The SCMI part of this is pretty complicated and needs discussion.  It
might be that it requires a vendor extension.  Right now, the out of
tree code uses a nvmem vendor extension but that probably won't get
merged upstream.

But in theory, it's fairly simple, you can write a regmap driver and
register it as a syscon and everything that was accessing nxp,phy-sel
accesses the same register but over SCMI.

> You still use regmap by use MMIO. /* GMAC_0_CTRL_STS */
> 
> regmap = devm_regmap_init_mmio(dev, sts_offset, &regmap_config);
> 

You can use have an MMIO syscon, or you can create a custom driver
and register it as a syscon using of_syscon_register_regmap().

> So all code can use regmap function without if-then statements if SCMI work
> as regmap.
> 

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
