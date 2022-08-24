Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3C359F9F5
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Aug 2022 14:30:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76239C6410D;
	Wed, 24 Aug 2022 12:30:05 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBD57C0D2BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 12:30:04 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id ca13so21950083ejb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 05:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=A4ebziFGIGKWedk4/E9Y9YHWqlnnQT7eJEB+itOg6jY=;
 b=JV4NxLJrrSRlvhdBCQR0BmBXWvBPD2WWY57yL9lQtZiNURXqJpW+V5TxKtgglU8sfr
 8h0saIQScUeus/RY4HdeNiEsA6CqBZsV5Z9pDrACaY0tZcAxGuVb7q083EomrLNDC40e
 odwPYLn28lzNGxZNRAjiuAPURDYf9lpPS9WKBAGU5Ly214gBijHGAUB5XOWefa2WXJTh
 I4V+h/62ngM8TNNQUcvs4g16JwsYe9ZtdRvwBVyGQqgULED08G3uMVf1nyDa14i+tesK
 7IHifg30XF+EjhDYcPgPLX+unpTE3yx0aumKCsZoelIzFF3+cnpPGECjoTxRKYH5Khuq
 e3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=A4ebziFGIGKWedk4/E9Y9YHWqlnnQT7eJEB+itOg6jY=;
 b=w/LOWce6e8u7t3KJICqIiH+Vlov+jan5ICTbE8AqRTM/zEnwid4bD4BlR03iupgM+8
 TTuTALdRnteXsGknjkt4UR/CMqGLIsYP8kuIqbHt6BkJfp5w3tQZzqxTlqzLt9/8tbj8
 7J9X/ob7DYQ6mfM23XgFcd/kkpjFVFwrTyRVe+MpxGxHzwCWcx2mF6hrX2FQdoH49ROi
 Rd3GrnJjaqSyAT9KW5DEsQkhmDpFa40z1js+T3vXWsS4LyJ0a+RY5D2t/Toh3c01jTHg
 oxMspZYxsVLVHDGTB88/jc2gzmTBdj9OD6CtNEqyReI84sHx87aLcoVT68EzsqyGEExQ
 csKQ==
X-Gm-Message-State: ACgBeo26nnSGcDG6or3BWJMRD2LEaivAZUzM8x189vnenavf8RuORIoK
 Q3ymcVlD4+hL5BniZILX3mS4phNuzpAKwzZsdp3hSA==
X-Google-Smtp-Source: AA6agR4y8IkROVTTFYuvJGLyuFpJlX7rUg/lBd9WKIqzPf1600ZmKhkQ1tKmij2PmJr9CSFfVIP2c0YYAvxPH8SXo4Y=
X-Received: by 2002:a17:907:6293:b0:73d:b27b:e594 with SMTP id
 nd19-20020a170907629300b0073db27be594mr2746905ejc.526.1661344204322; Wed, 24
 Aug 2022 05:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220823145649.3118479-4-robh@kernel.org>
In-Reply-To: <20220823145649.3118479-4-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 24 Aug 2022 14:29:52 +0200
Message-ID: <CACRpkdb28sHn3XOEJD_rqYRWU1GxWGX1udMpk8Cdu3Qn-rxS0g@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chris Zhong <zyw@rock-chips.com>, linux-stm32@st-md-mailman.stormreply.com,
 Renner Berthing <kernel@esmil.dk>, Samuel Holland <samuel@sholland.org>,
 Lee Jones <lee@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Alistair Francis <alistair@alistair23.me>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tim Harvey <tharvey@gateworks.com>, Zhang Qing <zhangqing@rock-chips.com>,
 Maxime Ripard <mripard@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-arm-kernel@lists.infradead.org, Robert Jones <rjones@gateworks.com>,
 - <patches@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Steve Twiss <stwiss.opensource@diasemi.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: Add missing
 (unevaluated|additional)Properties on child nodes
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

On Tue, Aug 23, 2022 at 4:57 PM Rob Herring <robh@kernel.org> wrote:

> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
