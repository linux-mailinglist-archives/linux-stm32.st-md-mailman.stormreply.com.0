Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD06F228485
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 18:02:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E226C36B2A
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jul 2020 16:02:57 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F55FC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 16:02:56 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id y2so21982552ioy.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jul 2020 09:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YwalK1RQnq3CwXPePKJZqsfuaCdWC1+FyIER6ijuGx4=;
 b=n2jxy/6hyXaPLpqJTf7J9V67nst1quVjModTj5I9bLBoUKmVn03d9IDE7tKTwnNx60
 CjMqjEGcs+2viq/BOHgfWlZctiHwnQuAFimPc0j/mmPyGSaPRLsOfEgZSR/LMdAeS6C9
 kdKz2rI1Ix5LjRX/c2fF0vMbCOvsi32qJKNJn1PoOmw6Xd0Ky1R4Leg4X7wlW2rG8cg1
 V3494izeVh4qR59MBRAjNEx6PHmhRgKXpqj5HNqSrvQ6wztpVRjLGlNRImhrARPrfBsl
 0yaKV/mCdI+7/o8m9mqmfQTu791ju2yaftDXgT+w3VbuxtSnk+kyzOMt1im6hliM1Zpl
 i1Yg==
X-Gm-Message-State: AOAM530Zy6waAorJDNTafooBdQMmsfsN4KAFKTQCH0viqwHsFTKAru00
 Q4jGt0p9FDmqWI2AkgRPRQ==
X-Google-Smtp-Source: ABdhPJwd72ipD4E8/OySWEaZwXAbNXJiZHx1bqKEq3A2mBDY1mlkJrHxS8eBEz7M3yC39Zddd7TShQ==
X-Received: by 2002:a05:6638:601:: with SMTP id
 g1mr33001644jar.137.1595347374981; 
 Tue, 21 Jul 2020 09:02:54 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id y12sm10759945iot.49.2020.07.21.09.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:02:52 -0700 (PDT)
Received: (nullmailer pid 378076 invoked by uid 1000);
 Tue, 21 Jul 2020 16:02:49 -0000
Date: Tue, 21 Jul 2020 10:02:49 -0600
From: Rob Herring <robh@kernel.org>
To: Marcin Sloniewski <marcin.sloniewski@gmail.com>
Message-ID: <20200721160249.GA377907@bogus>
References: <20200721152015.11608-1-marcin.sloniewski@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721152015.11608-1-marcin.sloniewski@gmail.com>
Cc: devicetree@vger.kernel.org, stephan@gerhold.net, mani@kernel.org,
 allen.chen@ite.com.tw, broonie@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, lkundrak@v3.sk, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, heiko.stuebner@theobroma-systems.com,
 sam@ravnborg.org, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: vendor-prefixes: add
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

On Tue, 21 Jul 2020 17:20:13 +0200, Marcin Sloniewski wrote:
> Add the "seeed" vendor prefix for Seeed Technology Co., Ltd
> Website: https://www.seeedstudio.com/
> 
> Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
