Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4F6221777
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jul 2020 00:03:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0AA4C36B29
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2020 22:03:56 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1524EC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2020 22:03:55 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id k6so3361129ili.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2020 15:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yHrzpTpE71ECQpRuBTkBYfolEU5GSatuGLtkblRjLXQ=;
 b=PntlIlVLz/xHzXfYmvQDME2uOrmogksYlan9+H+jvJs/8X+NoVWUg6FGPnY5qjAEI+
 BHmumJRFNJVvhprPRWjDcNuqZD2+gv4RYp5XTUPZavlvtzH+JrFfdQHnz76duA6CCsFL
 1hVPCuZOoIasVfpgzPFM37F2/ZJNlswhYPbQgcRzRyjHSVEL2gGTuviXNV8XF5HrCCFc
 9QhyFhdcifmbTHssyvRoD4D8kAHpfAhCxNG4cDzk8CTGDWSQqeVNvOUtFhwFhdEo+KBL
 uO7QhHdKcfHHkk+NW+X7Hkh/YoG99+WWXuhSM7S6brHPRRMCejHuN69u2xuuITIYJZLs
 K7fw==
X-Gm-Message-State: AOAM532Pg2uK1uIpYarCD1+uhvic9jltDLzY7JAGa0aycg/iH1eOQuLx
 BKTU4GyvB0jRuYjziiaaQw==
X-Google-Smtp-Source: ABdhPJwQfgtE3w4Fk0lEUwsl0trZOdpbFojfWp4McLV3EX5OCRGWVOQ+wQEZIn4mHN/f9ehOeeUbbw==
X-Received: by 2002:a92:d2c6:: with SMTP id w6mr1558062ilg.24.1594850634592;
 Wed, 15 Jul 2020 15:03:54 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id t21sm1794626ioc.0.2020.07.15.15.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 15:03:53 -0700 (PDT)
Received: (nullmailer pid 896331 invoked by uid 1000);
 Wed, 15 Jul 2020 22:03:52 -0000
Date: Wed, 15 Jul 2020 16:03:52 -0600
From: Rob Herring <robh@kernel.org>
To: Marcin Sloniewski <marcin.sloniewski@gmail.com>
Message-ID: <20200715220352.GA896275@bogus>
References: <20200706173353.20525-1-marcin.sloniewski@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200706173353.20525-1-marcin.sloniewski@gmail.com>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Manivannan Sadhasivam <mani@kernel.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, allen <allen.chen@ite.com.tw>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: vendor-prefixes: add
	Seeed Studio
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

On Mon, 06 Jul 2020 19:33:47 +0200, Marcin Sloniewski wrote:
> Add the "seeed" vendor prefix for Seeed Technology Co., Ltd
> Website: https://www.seeedstudio.com/
> 
> Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
