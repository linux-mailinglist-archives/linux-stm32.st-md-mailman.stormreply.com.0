Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE884FB1FB
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Apr 2022 04:51:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67E08C628A2;
	Mon, 11 Apr 2022 02:51:48 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F71BC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 02:51:46 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso3313761pjb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 10 Apr 2022 19:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rXMHDZ/wjPIXvL9nqfsrxMZkzmm8UuxVAONDINflarg=;
 b=AE76w0buips1IavXt8IqZhb/mkmazdyXyCp/cggM8TOunNklvkgT4lSsRzujLmLdE3
 476Yi8o85rpPXFHnov+x/BLI3qBaqVaaP6I4k4iLECAwuzFym8qZNIZbEP/WaSKDg6Zg
 Q3gO1XTRhmNyxHLz71bDze79BuvYZ4M53fsVYrBMjvPRw4FZhhWJB6p04pI8WUQU1wUF
 VS6JxUiB5uS9NezIa01SRAz5HYjTn9xC4rSa4gCrxokcMgDrVexzZAX9iJXsx6xLW0TK
 CSo+qBkDUpOfw17IEGKJH3+MaferjZI/1prH9OTR0qLrgBsw9ADJ367gVGLHIl088MBE
 6bVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rXMHDZ/wjPIXvL9nqfsrxMZkzmm8UuxVAONDINflarg=;
 b=winSzihd6QafRBND+iT+ieHEN6LSl8iN8943m31teKwz/br7n1BesGtZPPyrKa/drR
 4cJApdHy2DBTKb/IL01h/b5F+3weOaXQz7ykzJE27SDgJk74Hvm355DAoc2EqSd1JCEp
 0kpvdY8shShKW3/CS0w8CFxJieEmTM4/LAP0sEc+KYPuui2c1WaVPkc0qVbkjhCK7gHr
 PgAi5sJrkUbwwyRU4sGSN2gSskBCa6Z50LKWwekEFp2G2aAuMdnVg0Emp13eGCKjwHSj
 W4a2vWro1tSSkgZ+aWPJ7bHXp0xgamco+ZMyiW2RhFwzM2XDrDwMqGy7TdJ+1oJrP1JJ
 k/og==
X-Gm-Message-State: AOAM532xrcPaoYJPSvutqfeZyL9/+0Cqn0AAznOaBw5F3p+ATiqtnQcF
 Assvq4buH/wAqXCB3UIcklElcw==
X-Google-Smtp-Source: ABdhPJzGVKQR6w8pMxMmb2S23wGUZsQuhLLg7iNaBj4HpD8z37EDF1Ky46L9XugLcAZWFBAiFvYfIA==
X-Received: by 2002:a17:90b:4a4e:b0:1ca:c996:20dc with SMTP id
 lb14-20020a17090b4a4e00b001cac99620dcmr35062125pjb.98.1649645505104; 
 Sun, 10 Apr 2022 19:51:45 -0700 (PDT)
Received: from localhost ([223.184.83.228]) by smtp.gmail.com with ESMTPSA id
 d8-20020aa78688000000b00505793566f7sm9440536pfo.211.2022.04.10.19.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 19:51:44 -0700 (PDT)
Date: Mon, 11 Apr 2022 08:21:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20220411025142.uhdllnknn232h26f@vireshk-i7>
References: <20220407143027.294678-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220407143027.294678-1-krzysztof.kozlowski@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, arm@kernel.org,
 Viresh Kumar <vireshk@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Olof Johansson <olof@lixom.net>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: align SPI NOR node name with
	dtschema
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

On 07-04-22, 16:30, Krzysztof Kozlowski wrote:
> The node names should be generic and SPI NOR dtschema expects "flash".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/spear1310-evb.dts              | 2 +-
>  arch/arm/boot/dts/spear1340-evb.dts              | 2 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
