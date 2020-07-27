Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F3E22F79D
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jul 2020 20:20:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A366C36B27
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jul 2020 18:20:10 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B19EC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 18:20:08 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id l17so3711651ilq.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 11:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hHBgGmP6C/aVsle80stjB2DOBTx6fwthJHeqJ4Q1g+o=;
 b=FyGQL4jJrEnWUD/VsJZti5U8cbBBDOcKnYYas3a+qoeuHek+tn0QkDIxrA6dC3EKhL
 r0wFnXg1bfklitqaymsynbBZQE0n66guFbWlEEhp32xkGfCElOPJ4pgjLLVaBmLsWl7X
 jxmvHxX3wV9bPcuzAOOG42hP3qsOoT7925QzGwFmAbqQCH9xXGCqHC5FZYfUYTwfShZP
 dnPHXOJ/hM7HVUvlK/H1Wvkyix7HPb04odCrJlFtYHwAJelmXfQyzUAT25RoOXBWV9Ud
 g84xYNIthSAHnaymtePFeoOC3WUJksK7b5iB4zqIuM/CZOSKp9s7OTt+KdQtkBhFgpwV
 HzXw==
X-Gm-Message-State: AOAM533NUB7wIyNkqd4//47wAd/nYdO9qAzC4OSFbgJI26vvR4dcIhOA
 zwhuGmxDTr15faUNphfV2A==
X-Google-Smtp-Source: ABdhPJxq32PaoZ9jSiA8/vCo90i5yc8YqkH0UXNfMZI00ZGSughQbvZqqe9FqCxIhQs7xH2up94QLA==
X-Received: by 2002:a92:1d1:: with SMTP id 200mr17557805ilb.71.1595874006899; 
 Mon, 27 Jul 2020 11:20:06 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id t14sm5756318ios.18.2020.07.27.11.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 11:20:06 -0700 (PDT)
Received: (nullmailer pid 649107 invoked by uid 1000);
 Mon, 27 Jul 2020 18:20:04 -0000
Date: Mon, 27 Jul 2020 12:20:04 -0600
From: Rob Herring <robh@kernel.org>
To: Marcin Sloniewski <marcin.sloniewski@gmail.com>
Message-ID: <20200727182004.GA648872@bogus>
References: <20200724145107.35772-1-marcin.sloniewski@gmail.com>
 <20200724145107.35772-2-marcin.sloniewski@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724145107.35772-2-marcin.sloniewski@gmail.com>
Cc: devicetree@vger.kernel.org, stephan@gerhold.net, mani@kernel.org,
 heiko.stuebner@theobroma-systems.com, broonie@kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 lkundrak@v3.sk, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 allen.chen@ite.com.tw, sam@ravnborg.org, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 2/3] dt-bindings: arm: stm32: document
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

On Fri, 24 Jul 2020 16:51:06 +0200, Marcin Sloniewski wrote:
> Document device tree bindings of Seeed SoM and carrier board.
> 
> Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
