Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B910C5AED68
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Sep 2022 16:35:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55F98C63326;
	Tue,  6 Sep 2022 14:35:15 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E3B5C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Sep 2022 14:35:13 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-11ee4649dfcso28696810fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Sep 2022 07:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=/kxQ4Wf8GnR3MVwBOujAJ+Hv9NvGQDMILNpayVx9ZUo=;
 b=GBrG0B4paEdzMSC0yrUZW3enFysqp6zFz3oI1duUaRrhl5h8GSo1nC9uks0XRiNGNf
 RtqjtFLA4nfejHEAceo7s2ytgKi7zO1a72NiP0HdnPMO/wyTzjlPwOivL+Dp2KtBvXZk
 NBIiIAAqYTlwZYaU/zqd27TQhi/XPyjrr6AwPGqCNabl6wW8XIDcpCLfkxsTeBW3lZL9
 b+WCwrWOBbjXhrQ/X0ogEwD9Is95JOg9hFtwiDYnULUmWHOXD3fb7XQNS93U1BaUXsLr
 jqW6PWVBrV5pFNtYC+0sur79Tgp35wZRrvAJqfT65GzHBwjLFo2PVAY1WRc9tG9Vx7aY
 jWcA==
X-Gm-Message-State: ACgBeo0xIHXu9kNmHECufR3B8Fc92Q9EDsSWvXp5iHRfLfBYTYoTY82C
 ePqMN99YJqflbOkwMFB83A==
X-Google-Smtp-Source: AA6agR6/8rkfV5hK1hzRmCIqS5PFSgyizUYdaaaJmNYKCFgBxD4OCF+1PwIGz3teG7GN32hHgOxiaw==
X-Received: by 2002:a05:6870:6314:b0:10b:9595:62db with SMTP id
 s20-20020a056870631400b0010b959562dbmr11632116oao.128.1662474912399; 
 Tue, 06 Sep 2022 07:35:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a3-20020a056870a18300b001278a63bfc9sm2169288oaf.1.2022.09.06.07.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 07:35:11 -0700 (PDT)
Received: (nullmailer pid 456502 invoked by uid 1000);
 Tue, 06 Sep 2022 14:35:10 -0000
Date: Tue, 6 Sep 2022 09:35:10 -0500
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee@kernel.org>
Message-ID: <20220906143510.GA454672-robh@kernel.org>
References: <20220823145649.3118479-4-robh@kernel.org>
 <YxYH+POIURB9RO7T@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YxYH+POIURB9RO7T@google.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chris Zhong <zyw@rock-chips.com>, linux-stm32@st-md-mailman.stormreply.com,
 Renner Berthing <kernel@esmil.dk>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
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

On Mon, Sep 05, 2022 at 03:37:15PM +0100, Lee Jones wrote:
> On Tue, 23 Aug 2022, Rob Herring wrote:
> 
> > In order to ensure only documented properties are present, node schemas
> > must have unevaluatedProperties or additionalProperties set to false
> > (typically).
> > 
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../mfd/allwinner,sun6i-a31-prcm.yaml         | 40 +++++++++++++++++++
> >  .../mfd/allwinner,sun8i-a23-prcm.yaml         | 10 +++++
> >  .../bindings/mfd/cirrus,lochnagar.yaml        |  5 +++
> >  .../devicetree/bindings/mfd/dlg,da9063.yaml   |  7 ++--
> >  .../bindings/mfd/gateworks-gsc.yaml           |  5 ++-
> >  .../bindings/mfd/maxim,max14577.yaml          |  1 +
> >  .../bindings/mfd/maxim,max77843.yaml          |  1 +
> >  .../bindings/mfd/rockchip,rk817.yaml          |  2 +
> >  .../bindings/mfd/silergy,sy7636a.yaml         |  1 +
> >  .../bindings/mfd/st,stm32-lptimer.yaml        |  4 ++
> >  .../bindings/mfd/st,stm32-timers.yaml         |  3 ++
> >  .../devicetree/bindings/mfd/st,stmfx.yaml     |  1 +
> >  .../bindings/mfd/stericsson,ab8500.yaml       | 22 ++++++++++
> >  .../devicetree/bindings/mfd/ti,tps65086.yaml  |  1 +
> >  .../bindings/mfd/x-powers,axp152.yaml         |  1 +
> >  15 files changed, 100 insertions(+), 4 deletions(-)
> 
> What are your plans for this set?
> 
> Want me to merge it?

Yes, please.

Rob

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
