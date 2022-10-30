Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33232612D34
	for <lists+linux-stm32@lfdr.de>; Sun, 30 Oct 2022 23:03:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3C4AC57183;
	Sun, 30 Oct 2022 22:03:13 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FF26C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Oct 2022 22:03:12 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 k59-20020a9d19c1000000b0066c45cdfca5so1472601otk.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Oct 2022 15:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j6RoJ9OKbLkpnZky8aWx+SuJhSHiYeWvTuobl/R4hbY=;
 b=x7lwC16q/L3daENRbZ4bdim23yDJ5nUUg1Tsi61c6hJOIDfyEq0D1u2/zEZ+BqMZZf
 zfI+qdIya28OcBCCRi500OEa0FQeD9o1t6ZujYrt6U/56xSUxQmtPlohOmoeNrVfF1ve
 hafSvSZZrEm/fSY16Qy3xKXwCm7FGxioHA2RyA2OPueGXmgBpzrZ4AVZOuskew9bLa/e
 7nDTeEC6obCUwOY791UJ6GNZvP936/xfvGax20SIrpZUZq6kVm1IF/a50014eG4s3jaa
 /mUikWtCfuYdlA5qLzoWnWoSd315bAhKxij02siSnga+ETOfxShzmHa0wMPX55HMJDHc
 TBQA==
X-Gm-Message-State: ACrzQf0a02sbLgmNQJI+KSXgOag92ow/K7BqCX/CoR/PAGj9j4nlG5Or
 4jtiExmzTtJhH5Nwga+JSQ==
X-Google-Smtp-Source: AMsMyM6X8g79Ijv6psybb64KEd/NRuDVR7gMsp2VRHu88yJE4MegteReCbn9Y9VeH8/xRUR6Qkvnug==
X-Received: by 2002:a9d:73cf:0:b0:668:2f96:c3ac with SMTP id
 m15-20020a9d73cf000000b006682f96c3acmr5019966otk.184.1667167391313; 
 Sun, 30 Oct 2022 15:03:11 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i17-20020a544091000000b0035a0badf1dfsm388575oii.20.2022.10.30.15.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 15:03:10 -0700 (PDT)
Received: (nullmailer pid 1570811 invoked by uid 1000);
 Sun, 30 Oct 2022 22:03:12 -0000
Date: Sun, 30 Oct 2022 17:03:12 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <166716737315.1570500.9301715619999020296.robh@kernel.org>
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

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
