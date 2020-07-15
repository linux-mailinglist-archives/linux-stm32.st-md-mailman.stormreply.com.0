Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0302D22177C
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jul 2020 00:04:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0BE3C36B29
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2020 22:04:15 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6462C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2020 22:04:14 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id e64so3901626iof.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2020 15:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E37MfxaXBonMzoJ0Y6eNBX3gbAQt9fHjppNBFmFe8vc=;
 b=Fh7HL4QNbUqXkcR7sKOklmXI1BWvRMc+U6VWObJU5LezAyx3dG9/Zj+os0RX1w4x9E
 2sf97dAHRwmV/s0FeWsCHRRZjERrh945fNHO1mY+Iwig8CIuO5CbNBf4yFBf4T+VpEoW
 OZ6zwl1+Fa8UBWP5qY3M/3M2AHO012ts/IWypCKzAT+I9B+ouiteqDLtUZ4sdhIPLpHS
 ehSv1Ud326tJU73RyfcfuH95NmCCELiJ66lQJpGkiT7leW8FJYE++n0psenwFMt4pZsi
 tqe/A+UDVUDnMWNVh0Yct5ERDkjGszcDjwdrxPQpPXtAngItwaVCP/iUgbfH9F746GVR
 pCqg==
X-Gm-Message-State: AOAM531D6yGPZzuFJKjISxbQ4zLRGomvLqiGVVcPhUfJnfMPwV/2nRov
 ADEx9ph7hmIfOVMKWlMCwg==
X-Google-Smtp-Source: ABdhPJzouTdezAv7Crm966GCqFA5Lv1wlXaFJfHLEjYkjPNUu4yL/+ft5CjlkhuuO+xKMTd6IFC6zA==
X-Received: by 2002:a05:6602:1491:: with SMTP id
 a17mr1427701iow.198.1594850653650; 
 Wed, 15 Jul 2020 15:04:13 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id x12sm1826088iov.43.2020.07.15.15.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 15:04:12 -0700 (PDT)
Received: (nullmailer pid 896818 invoked by uid 1000);
 Wed, 15 Jul 2020 22:04:10 -0000
Date: Wed, 15 Jul 2020 16:04:10 -0600
From: Rob Herring <robh@kernel.org>
To: Marcin Sloniewski <marcin.sloniewski@gmail.com>
Message-ID: <20200715220410.GA896770@bogus>
References: <20200706173353.20525-1-marcin.sloniewski@gmail.com>
 <20200706173353.20525-2-marcin.sloniewski@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200706173353.20525-2-marcin.sloniewski@gmail.com>
Cc: devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 allen <allen.chen@ite.com.tw>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] dt-bindings: arm: stm32: document
	Odyssey compatible
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

On Mon, 06 Jul 2020 19:33:48 +0200, Marcin Sloniewski wrote:
> Document device tree bindings of Seeed SoM and carrier board.
> 
> Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
