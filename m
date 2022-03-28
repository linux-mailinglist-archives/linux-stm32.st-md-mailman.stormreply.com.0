Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 955524E95C9
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Mar 2022 13:54:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49508C5C842;
	Mon, 28 Mar 2022 11:54:10 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F2F9C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 11:54:08 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id qa43so28083466ejc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 04:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LKPrfvGWNCgTg4TyAaxCLaMtN2+t2qHlTsa1uVOq8pM=;
 b=kw5U/JCmxslxZizV2jLlmOBcIGssYEKq78XpVjnkGPlQXwgkdWAeFftd0yoAS+p3Es
 6bwRaMEB8Zw0+KWXTqe5xSm+v3FtPxgM1RwYnyrFhzLni/EoCXXr2a4ZaW4d9wU25zbe
 eoniOgU5G4dswNrq9JJELqXGcHi7pVp1q2vyKzlG9qqT6TMzxJDxKEKbi/+Gm1DeYjXV
 3UGggeaDhqV9rH/7fzTDT4rvoqsZCz8BOdcAeH6/X0BclpVxtXas1+/6ml1BvWFhOWRe
 yfEvE0l/ifZkZqpd8ktCUvFEOWyKT3gPWwBAnqgNkhDVlu40OBzAA6dNTFKzBXUmZGp/
 emUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LKPrfvGWNCgTg4TyAaxCLaMtN2+t2qHlTsa1uVOq8pM=;
 b=7doN+c81Slu0+O+38CXxRIg2MdjhtAs6P11XOkbh9t+OCnrM0lE2MucEKTbsp2cRa+
 wOZ35jxaR1ol/0cQrO+JfnAbf5SCQbdby3rR5bpXXBynEHIS3SVlfL35If4rTIJqJB1z
 dRLb4ZUkYKi/OMr7yEhv3u1ZMpkliLa9KOEEmssRoePJjRalXBK/anR8CY9+z4Eecz79
 SOoHzcLcMJMTPn+tbGejkIbCR0b3pDTsKx5SBZt95DUHCmNe5I5FmLYw7FmH4EScNaxv
 xv7B+F+XarFI6Gme8lM2FWouikTepj/JLFC5tqlBBpBRc0bi3PZBqk3wIC8/ybxkyH61
 TZTA==
X-Gm-Message-State: AOAM5339RHilzQnVhmVXb1Wr0BPTikEfbzuKM0zzO9/a/0WLeaK4kvUF
 fjtM5NoVNMXqhB7/OYxLoP0=
X-Google-Smtp-Source: ABdhPJxnuIkGxnuYGLZsxAfTPmW5TkGf54BmupZ2me5Tuu+k4VyUkun2Hg1gMwbCB0fty6ZgA/O4mQ==
X-Received: by 2002:a17:907:3f18:b0:6e0:df2d:c76a with SMTP id
 hq24-20020a1709073f1800b006e0df2dc76amr12117312ejc.55.1648468447864; 
 Mon, 28 Mar 2022 04:54:07 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it.
 [93.42.69.170]) by smtp.gmail.com with ESMTPSA id
 hs12-20020a1709073e8c00b006dfdfdac005sm5850462ejc.174.2022.03.28.04.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 04:54:07 -0700 (PDT)
Date: Mon, 28 Mar 2022 13:54:07 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <YkGh36h03EfUd3/q@Ansuel-xps.localdomain>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
 <c5eeca79-38b6-eb9f-1d78-1685aa1cca6c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5eeca79-38b6-eb9f-1d78-1685aa1cca6c@gmail.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-oxnas@groups.io
Subject: Re: [Linux-stm32] [RFC PATCH 1/1] ARM/arm64: categorize dts in arm
 dir and fix dependency in arm64
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

On Mon, Mar 28, 2022 at 12:47:46PM +0200, Matthias Brugger wrote:
> 
> 
> On 28/03/2022 02:09, Ansuel Smith wrote:
> > - Categorize every dts in arm directory in subdirectory
> > - Fix Makefile to address for the arm subdirectory
> > - Fix any arm64 dependency
> > 
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > ---
> [...]
> >   arch/arm/boot/dts/mediatek/Makefile           |   14 +
> >   .../boot/dts/{ => mediatek}/mt2701-evb.dts    |    0
> >   .../boot/dts/{ => mediatek}/mt2701-pinfunc.h  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt2701.dtsi  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6323.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt6580-evbp1.dts  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6580.dtsi  |    0
> >   .../mt6582-prestigio-pmt5008-3g.dts           |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6582.dtsi  |    0
> >   .../dts/{ => mediatek}/mt6589-aquaris5.dts    |    0
> >   .../{ => mediatek}/mt6589-fairphone-fp1.dts   |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6589.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt6592-evb.dts    |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt6592.dtsi  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7623.dtsi  |    0
> >   .../dts/{ => mediatek}/mt7623a-rfb-emmc.dts   |    0
> >   .../dts/{ => mediatek}/mt7623a-rfb-nand.dts   |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7623a.dtsi |    0
> >   .../mt7623n-bananapi-bpi-r2.dts               |    0
> >   .../dts/{ => mediatek}/mt7623n-rfb-emmc.dts   |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7623n.dtsi |    0
> >   .../boot/dts/{ => mediatek}/mt7629-rfb.dts    |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt7629.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt8127-moose.dts  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt8127.dtsi  |    0
> >   .../boot/dts/{ => mediatek}/mt8135-evbp1.dts  |    0
> >   arch/arm/boot/dts/{ => mediatek}/mt8135.dtsi  |    0
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Would it be possible to also script a fix for the MAINTAINERS file?
> 
> $ git grep "arch\/arm\/boot\/dts" MAINTAINERS |wc -l
> 
> 101
> 
> 
> Regards,
> Matthias

Totally forgot about the MAINTAINERS file! Yes will add to the script a
check to fix also that.

-- 
	Ansuel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
