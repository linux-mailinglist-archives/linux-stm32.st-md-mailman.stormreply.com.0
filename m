Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 407AD53AE6D
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Jun 2022 23:11:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCB68C03FC4;
	Wed,  1 Jun 2022 21:11:17 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6B45C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jun 2022 21:11:16 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 f5-20020a4aa685000000b0040e7e819183so574084oom.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Jun 2022 14:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MZLHOX4bmimahp0SDeHpXF9tGrFqsKasgM8yt8qeVgo=;
 b=hhOn9/ns2tztBBOHjUskhehJWYDIsEM9iPWOyu9Z5BkmYpc37u9kypNUkjo1N5p/iQ
 n06xX2L3lNycdhOBBTl4XkdSJV2rBJNLFnU2B1U5ZvwY5S2ZGb0KMX0d+J1GcoynSMai
 CyvvLgZRzuIp3k1Vyc7oBcwpkgJLcnal9LmhZ3ZRngNg8/oaZIzGCBlCiMV755aWdglL
 XoIe/Q/zvSF2QBztm9xILMw6anVdfSFK5t/EXj6Ii1++y5r7XeYzx5vgiJy+jacPo0V8
 DIV39b9g1mLvHdV9R/qr+bwmd72mXN+Qw69ws8/0FzGSx8mj3ZSojcwUizfBkHM1KLQe
 DMHQ==
X-Gm-Message-State: AOAM5336jxFnng1x58ZReVRHKqSXgi5nGZWAKCuiyLyBIiwLaC6KPDay
 KBEea6jKuyK14lpE+ShyfA==
X-Google-Smtp-Source: ABdhPJz2LPu4gMLK693bAspnXDF9c38YPHEwnsvvFTNQY5+HaBoFcmfSXGmb12imELa+bBPNr6nhlw==
X-Received: by 2002:a4a:b307:0:b0:324:c7f2:386 with SMTP id
 m7-20020a4ab307000000b00324c7f20386mr772216ooo.18.1654117875593; 
 Wed, 01 Jun 2022 14:11:15 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 ec29-20020a0568708c1d00b000f1c2847f8csm1163384oab.32.2022.06.01.14.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 14:11:15 -0700 (PDT)
Received: (nullmailer pid 460531 invoked by uid 1000);
 Wed, 01 Jun 2022 21:11:14 -0000
Date: Wed, 1 Jun 2022 16:11:14 -0500
From: Rob Herring <robh@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20220601211114.GA460497-robh@kernel.org>
References: <20220519162838.695404-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519162838.695404-1-u.kleine-koenig@pengutronix.de>
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: mfd: stm32-timers:
 Document how to specify interrupts
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, 19 May 2022 18:28:37 +0200, Uwe Kleine-K=F6nig wrote:
> The timer units in the stm32mp1 CPUs have interrupts, depending on the
> timer flavour either one "global" or four dedicated ones. Document how
> to formalize these in a device tree.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Changes since v3:
>   - Do the things Rob suggested in reqly to v1 which I didn't notice
>     until Fabrice told me in reply to v3.
> =

>  .../devicetree/bindings/mfd/st,stm32-timers.yaml  | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> =


Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
