Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAE75F1432
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Sep 2022 22:53:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E713C64104;
	Fri, 30 Sep 2022 20:53:08 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E72D1C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Sep 2022 20:53:07 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id q10so5924729oib.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Sep 2022 13:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=pdQtcuPWzJHziwzHWj7zq1PATGkvPQqGjwa4TYtqohI=;
 b=vpveisjspdQcQtVJiv00rmqcMLRiD3vx1IfMqmFTJ3v4FwuZ0XD1QoP4kud8uXe9xz
 O8YuxTkQ/aiZq7Ggf3fkPrpD+l4Y7WIOVOO0tMWDnbzzrJjF+jmvPwW4B3N6OaYnG75q
 6oBFE7zJp27D43FfidzEq1WFU/WZVIlFtRpdajFPMK2ownHOjtRmV27jXQusCOdPvXhH
 0PcifrcBvWXdQbrbMXzSF67Nscohp7ELrTn9qBMfhYHKxvyejGClEg9ZtYXqwKHr64l6
 8a8v0y/YBMbwAX9wAs8G5sbV7QJ5/rg/TjvKfPdPFnx5KaNbeZVJI23ayMwhBKkziQrp
 H42Q==
X-Gm-Message-State: ACrzQf3+sc2o515vMmV7rwzziL1JEHO+GJR7ku4buSwxjEDZ6g7dXlwn
 UURX4LKMZ56iNfTIUHchQg==
X-Google-Smtp-Source: AMsMyM7jjjDlKG2yZa8i/Yj525zSkuezIrskRqr1rNMpBgIMgYY5Sbe4ucB39AboCIJ3Oxgfsmyeqw==
X-Received: by 2002:a05:6808:13c8:b0:350:37b4:c4a with SMTP id
 d8-20020a05680813c800b0035037b40c4amr47958oiw.90.1664571186666; 
 Fri, 30 Sep 2022 13:53:06 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 6-20020aca0506000000b003509cc4ad4esm748527oif.39.2022.09.30.13.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 13:53:05 -0700 (PDT)
Received: (nullmailer pid 912599 invoked by uid 1000);
 Fri, 30 Sep 2022 20:53:04 -0000
Date: Fri, 30 Sep 2022 15:53:04 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <166457118273.912532.12800717415641115634.robh@kernel.org>
References: <20220929145416.16336-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220929145416.16336-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3] dt-bindings: media: st,
 stmipid02: Convert the text bindings to YAML
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

On Thu, 29 Sep 2022 16:54:16 +0200, Marek Vasut wrote:
> Convert the text STMIPID02 DT bindings to YAML DT format to permit
> validation of DTs using this I2C CSI-2 to CPI bridge.
> 
> Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: - Update YAML DT schema maintainers, add Benjamin and Sylvain, drop myself
>     - Update MAINTAINERS file, replace st,st-mipid02.txt to st,st-mipid02.yaml
>     - Fix bus-width to be 6,7,8,10,12 and drop default:
>     - Require port@2 and either or both port@0 or port@1
> V3: - Add RB from Benjamin
>     - Fix lane-polarity property name to lane-polarities
>     - Fill in newlines
>     - Replace clock-names: subnodes with plain "const: xclk"
> ---
>  .../bindings/media/i2c/st,st-mipid02.txt      |  82 --------
>  .../bindings/media/i2c/st,st-mipid02.yaml     | 176 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 177 insertions(+), 83 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
