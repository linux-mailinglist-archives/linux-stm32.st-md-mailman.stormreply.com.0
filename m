Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C43A5EFE8C
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Sep 2022 22:19:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE824C64100;
	Thu, 29 Sep 2022 20:19:29 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B6B9C640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 20:19:28 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 c13-20020a4ac30d000000b0047663e3e16bso881918ooq.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 13:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=oUJJ1b7lap06bTmVazhE0UVHNBGg3Stxn6xK3EbQtFw=;
 b=Yuhc64Ox3qztJ9DO+iB/vG+WmMkROeCAQ9UX0cJUNR2ZwSHyIOpmoKTh0VPbvYvtKy
 SIdkpSu1p9AB2xfhhXK168im817cBPDE3f2INW542b+DgWG3ja4BmBnB0K9lwMnogS3X
 74Hgb/2bhB4bqJpJ/yjGHw1u86a1egA7F3cuvdyDqYsytj8vw6DWKtFIJNuHw32jgHR6
 2BjTzyq2ZoQhf+sFlikVyMVRtWvKuUoZ8Q6LOg5ysUJ4lbT69YHYR7tkxWwMbIyOhV2z
 8jNfis4/5idHasSWn3q22qsqFxIaeafL9TiH5dyhr2/d38yiPFNJcVZ1q7Ck8TXa4dNN
 OFig==
X-Gm-Message-State: ACrzQf38CHNRlYCP/thUtA4HmIicy/oVJcfrZZfJjHF8qWx3uZFvcu5d
 PA/VSyhVrdpG9b9MIl3Dww==
X-Google-Smtp-Source: AMsMyM4hQ9E/GdknJ7QEniGYzaf35/OJYaDl7ZSslM6z1Qx76RrhpZxsPh4JLO49KagzVXfEH2zjxA==
X-Received: by 2002:a05:6830:1cc8:b0:65c:8e3:cfd with SMTP id
 p8-20020a0568301cc800b0065c08e30cfdmr2161084otg.28.1664482767384; 
 Thu, 29 Sep 2022 13:19:27 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u13-20020a056871058d00b001227148da8csm167887oan.36.2022.09.29.13.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 13:19:26 -0700 (PDT)
Received: (nullmailer pid 2670413 invoked by uid 1000);
 Thu, 29 Sep 2022 20:19:25 -0000
Date: Thu, 29 Sep 2022 15:19:25 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <166448276515.2670368.18048403536166255218.robh@kernel.org>
References: <20220925175209.1528960-1-dario.binacchi@amarulasolutions.com>
 <20220925175209.1528960-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925175209.1528960-2-dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH v4 1/5] dt-bindings: arm: stm32: add
 compatible for syscon gcan node
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

On Sun, 25 Sep 2022 19:52:05 +0200, Dario Binacchi wrote:
> Since commit ad440432d1f9 ("dt-bindings: mfd: Ensure 'syscon' has a
> more specific compatible")
> It is required to provide at least 2 compatibles string for syscon node.
> This patch documents the new compatible for stm32f4 SoC to support
> global/shared CAN registers access for bxCAN controllers.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
> (no changes since v1)
> 
>  .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
