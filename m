Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45D493E08
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jan 2022 17:11:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38FEBC5AB61;
	Wed, 19 Jan 2022 16:11:57 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF921C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jan 2022 16:11:55 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 a10-20020a9d260a000000b005991bd6ae3eso3687720otb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jan 2022 08:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yxZXWG4kuGkH4QtIGEz0hxzGIdbCQIMxC9U+hYf13os=;
 b=5kd+0exP9JzNtiInE7lwaG5bzMLVxtEJpAikxVpmj7ZnmFqS4if4iiN5r9obC61esU
 h8POHsKMr7CHQGZKGPJL62UMRp9XDyesZfXmbdCCTPGH03YDgvCwlDAnEJWeCcx6NHy1
 Rl2HdSWJrSEHXdYbLIxxGy6SzukL7neHi0DEwNL2ml/wvnlFqH5idO1GZEe3zv/xcB8d
 0lVRh9LywEoBD12KMjEP6gGm1GD32wQ931fbwD5xCJFUgKK1oNAJAX7TcX7Ul40jdncL
 pb1H2AUAs2ykffAu2KDzjflJZ98Wnp8V9fD4hSvGxDSxf4Sbl3GmNEp123KUipkgeDCZ
 akNQ==
X-Gm-Message-State: AOAM530UK0qbUCgEFzumxD8VR9o9Xjx8CebYG70WxCgB1c0zQ/K3+h17
 qWsWj8G7gPrUhR169ZloYg==
X-Google-Smtp-Source: ABdhPJxSboUM1Fj6OIYLvk4siom4gYj2gwH03uAc7NeVEx8IDWPxnKRqWHzYBuv7pwhoEHMGeEkObA==
X-Received: by 2002:a05:6830:418a:: with SMTP id
 r10mr23507850otu.361.1642608714750; 
 Wed, 19 Jan 2022 08:11:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g16sm60885oti.3.2022.01.19.08.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 08:11:54 -0800 (PST)
Received: (nullmailer pid 3682300 invoked by uid 1000);
 Wed, 19 Jan 2022 16:11:53 -0000
Date: Wed, 19 Jan 2022 10:11:53 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <Yeg4Sba3eye24+LG@robh.at.kernel.org>
References: <20220106182518.1435497-7-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106182518.1435497-7-robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: rtc: st,
 stm32-rtc: Make each example a separate entry
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

On Thu, 06 Jan 2022 12:25:15 -0600, Rob Herring wrote:
> Each independent example should be a separate entry. This allows for
> 'interrupts' to have different cell sizes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/rtc/st,stm32-rtc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
