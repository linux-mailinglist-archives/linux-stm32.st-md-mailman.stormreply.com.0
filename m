Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF816E6E4E
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Apr 2023 23:35:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6730C6B442;
	Tue, 18 Apr 2023 21:35:52 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE837C6A5FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 21:35:51 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-187af4a5437so827450fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 14:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681853750; x=1684445750;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xiHSmFYNeiiWUCdJJE7awZ5CHROEiUdBDPkAp1lTJfE=;
 b=gBHqw/ucyMy8ANrN9LVy+BRQEXD2BLiOF/1KsmAs+4p7zmIO7kOjUklwxfJr4fp8ga
 RHsHB/NG0EXD++TXyCx4qiKlDWWZiZa0BZwUjVgfZcRpvuK1KfauyqVYdAg8irobh0uU
 kSOiLjy4mHCdFP2k7Yt1jmjge7gQJti3qm7HHqlb+3v6xLV/asB7uA9Q1y0MnDWJapSG
 aJVyyC8f9VAHjjYtXHnXHD/HI9C4pvvgiCZnZ27nHB6rT/1ALnIdCQQCexBPjO5keH5H
 8irrC2eUQTb5lpVSrPoFCbPCugRbl1/Lp3Fo7f2jScPxboKOd+K3Hx86afN2a/8WT6TR
 5g3Q==
X-Gm-Message-State: AAQBX9cuCvlN34na+yTm66duVbBr1dWWjc2KFEhpAy3jla0PRDp6Dyhv
 BKqT61T7AFmr0m+POfKEbA==
X-Google-Smtp-Source: AKy350b0ZSpKu/WLBKWeRVPeqxp22rfWdezk+dC0nuELJwJCvQMHKkxlU6SbBCluwnUHFd3X49U/OA==
X-Received: by 2002:a05:6870:9723:b0:188:1096:246f with SMTP id
 n35-20020a056870972300b001881096246fmr1619351oaq.29.1681853750572; 
 Tue, 18 Apr 2023 14:35:50 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k8-20020a4a9488000000b00524f381f681sm6317500ooi.27.2023.04.18.14.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 14:35:49 -0700 (PDT)
Received: (nullmailer pid 2372989 invoked by uid 1000);
 Tue, 18 Apr 2023 21:35:48 -0000
Date: Tue, 18 Apr 2023 16:35:48 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230418213548.GA2370489-robh@kernel.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <16d3bb91-af02-2504-1a8b-7805a2d30bb4@roeck-us.net>
 <abefdf2e-076c-6f0e-46e3-74dae3d068c1@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abefdf2e-076c-6f0e-46e3-74dae3d068c1@linaro.org>
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-stm32@st-md-mailman.stormreply.com, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: watchdog: drop
 duplicated GPIO watchdog bindings
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

On Sun, Apr 16, 2023 at 07:26:27PM +0200, Krzysztof Kozlowski wrote:
> On 16/04/2023 18:04, Guenter Roeck wrote:
> > On 4/15/23 02:51, Krzysztof Kozlowski wrote:
> >> Two conversions to DT schema of GPIO watchdog binding happened and came
> >> through different trees.  Merge them into one:
> >> 1. Combine maintainers,
> >> 2. Use more descriptive property descriptions and constraints from
> >>     gpio-wdt.yaml,
> >> 3. Switch to unevaluatedProperties:false, to allow generic watchdog
> >>     properties.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > 
> > For the series:
> > 
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > 
> > On a side note, the e-mail addresses in patchwork are messed up for
> > patches sent by you. As result, I can not reply to your e-mails after
> > pulling a patch from patchwork. This means that some replies get lost
> > if I did not keep the original e-mail.
> > 
> > That is how it looks like after I pull one of your patches from patchwork:
> > 
> > To:
> > +=?unknown-8bit?q?Wim_Van_Sebroeck_=3Cwim=40linux-watchdog=2Eorg=3E=2C_Gu?==?unknown-8bit?q?enter_Roeck_=3Clinux=40roeck-us=2Enet=3E=2C_Rob_Herring_?==?unknown-8bit?q?=3Crobh+dt=40kernel=2Eorg=3E=2C_Krzysztof_Kozlowski_=3Ckrz?==?unknown-8bit?q?yszt
> 
> (Trimmed cc list)
> 
> Thanks for letting me know, I wonder what's the problem. I am sending
> with send-email exactly the same way every day, but somehow this series
> have such header in Patchwork:
> https://patchwork.kernel.org/project/linux-watchdog/patch/20230415095112.51257-1-krzysztof.kozlowski@linaro.org/
> 
> Which I do not see in:
> 1. lore:
> https://lore.kernel.org/all/20230415095112.51257-1-krzysztof.kozlowski@linaro.org/
> 
> 2. Previous patches on Patchwork:
> https://patchwork.kernel.org/project/linux-watchdog/patch/20230310223012.315897-1-krzysztof.kozlowski@linaro.org/
> 
> Lore (1 above) points to possible unescaped UTF character for
> rafal@milecki.pl, but I wonder why send-email did not handle it.

Looks to me like Content-Type header is missing. Usually, I get a prompt 
from git-send-email with what encoding to use if it needs to use UTF8.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
