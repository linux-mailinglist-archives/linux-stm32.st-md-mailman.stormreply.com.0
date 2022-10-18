Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A14DE602F46
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Oct 2022 17:14:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46072C64101;
	Tue, 18 Oct 2022 15:14:08 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE0C2C03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 15:14:06 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id w3so9806508qtv.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 08:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/0tz87iyY45bqj5DqEtZQtWaWRcCo2kTq3CFw9NaZCY=;
 b=X7C4HmaUGLTjcxzeQpZqhiCaLjTb8o08F4gdTV+gWvR/kkIYGcKXQzP+tK9VGsdf9o
 46t486c5w4H6cGbDKi8p43tfqymCjrcBmDE8cVq0KHAWIwR5KRF8ebZD5PMjy4XZrzeJ
 R3UKbf6G6klw/V+d/ODkStQmdSvxVRwc9uXX/QSjoUVBrOwnmb0vTwmuXpYLKjUDyLgY
 7ehO/yXFlKsd3vAXrszy+0QUiaSvBMTjgqQ5wPbNhiTkD5TeKP1Ya4xoEhS2snvT4N87
 yQ3VfZEuvoPh/rEUOcx7+PUlhARIOTpYsm40J1KXIRMfiCwW6Mq8xvABb+E7/8uq/f4C
 hlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/0tz87iyY45bqj5DqEtZQtWaWRcCo2kTq3CFw9NaZCY=;
 b=mk2rs4G8HQhMO4psaVbUDAq7a3nlneTGHV4rTAg6Q1eC5Rn9gvtKQje7ZmkorxTVEO
 /8E2/Dgbd6tb00StuTOuwucDpmDU3+yFVzRGVr/pYorKk+yRwRhpeuURpc7QxtrbYKsI
 HDiPhz8O1/HicWvVZV4w61l/P3B69ZVYvnL+ItzM5dLGgdUwXsfyfYruRELDrLc+sghv
 kmoF1dWEZmTOVwdr9nJHrtV/0azxzBdYEAUQz/vS7HgKp6nQYyWASK8QoOBP0q4PodXg
 ilyHVBZbFRPLimdQuHZ2vDzTJXHC4PDdeUlWQ1jXbhT8yNpXMInS2UWuQk0c84ptSUCl
 kivw==
X-Gm-Message-State: ACrzQf2EuAQTrNBR0Q5VQ/plLR3c8fUFxCeh/SVcYyTSAb5RK4YcEc5s
 CoMPv5awNZYVMFntQEtY0M5L0Q==
X-Google-Smtp-Source: AMsMyM4y6a9QV+VgqDAiandEJyJ29gp1A2BP8NYdjbnRg8qlCwyxInYLZhr4FbhQumxQLynUfr2sqQ==
X-Received: by 2002:a05:622a:1d4:b0:39c:ef9b:e77f with SMTP id
 t20-20020a05622a01d400b0039cef9be77fmr2433127qtw.529.1666106045583; 
 Tue, 18 Oct 2022 08:14:05 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net.
 [72.83.177.149]) by smtp.gmail.com with ESMTPSA id
 d18-20020a05620a241200b006bc192d277csm2639612qkn.10.2022.10.18.08.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 08:14:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Marek Vasut <marex@denx.de>,
	linux-arm-kernel@lists.infradead.org
Date: Tue, 18 Oct 2022 11:14:02 -0400
Message-Id: <166610603945.32199.12796181871708873749.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928181944.194808-1-marex@denx.de>
References: <20220928181944.194808-1-marex@denx.de>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: memory-controller: st,
	stm32: Split off MC properties
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

On Wed, 28 Sep 2022 20:19:44 +0200, Marek Vasut wrote:
> Split st,stm32-fmc2-ebi.yaml specific properties into st,stm32-fmc2-ebi-props.yaml ,
> split memory-controller bus peripheral properties into mc-peripheral-props.yaml ,
> reference the st,stm32-fmc2-ebi-props.yaml in mc-peripheral-props.yaml and
> reference the mc-peripheral-props.yaml in micrel,ks8851.yaml .
> 
> This way, the FMC2 controller properties in Micrel KSZ8851MLL ethernet
> controller node can be properly validated.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: memory-controller: st,stm32: Split off MC properties
      https://git.kernel.org/krzk/linux-mem-ctrl/c/895af530081df499c6308488eabf166a2f1deab8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
