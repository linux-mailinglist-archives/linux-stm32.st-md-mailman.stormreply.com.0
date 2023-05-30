Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC68715F3E
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 14:27:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69DFFC6A613;
	Tue, 30 May 2023 12:27:41 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F9A3C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 12:27:40 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-973f8dbcc02so440270466b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 05:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685449660; x=1688041660;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Mlnk799/MfyB54DQ8/eLtl8DYJIH7QAdWviYq7D2W+E=;
 b=yabZWQjhxV76ieZOcwL1QgqGXFdbyAPcvg4gA6AvveAl2Iz8NAKMYmReuySiJmc1Cg
 tE0SupZtraraFkF2PWWdUNgvLks4oInKExm0cvA3IZ4I026dgvWUKK4VfvqYB3Xq0al1
 YaWqyGUpOXyHXL/gAFpld4uzzD8RPMllYPjgO3JKnvEAKr9ENX218gDzbIm5rfcWfLvC
 owmyR6u/rHAZn1MAg8F6nq6wD7ZnR0nWIE+BUCNrHaHRpPUpLaPeMB1NV7SgKxm5xfaZ
 aYJcg6CnwtfvmjcnEt4ZC2xAL47yxCWJwpltUMT7TuHqkPy0TRpN4Xm18NsWllBZzzQK
 99bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685449660; x=1688041660;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mlnk799/MfyB54DQ8/eLtl8DYJIH7QAdWviYq7D2W+E=;
 b=XXLUdPH7EtjhzmDQ7wzT/dk8EkJbKUqVeIC6tzUfJgPG7NIV4lS9YBLTYo/LZS5YoP
 WSjMP3MhHjc6vHtX/rnCF44SDIU6tjaKzRtsb2Lw3D3tlhOu/hLYUDkX7VQ7rYNF0W7m
 Nd4x3A7j6lMqProBBSHG0s9gGrxeQESkZnf6ggvZCWOLwg1KBgEZpqIXqRrTZr7KPD8k
 qwQK6s6R+k1FYox5p4Uj5wspDRdhGjvb6hTSOXeTymoih4ED+1BUy4FZs0tvOr751SS5
 yfqeZa5DjzBogemaSvYvKU46rBaUjMbrrJB47UWPrGXTdJ5YCLWjEMMaZTy7TnY3vy0S
 p2FQ==
X-Gm-Message-State: AC+VfDyRxvcu5PfUVdW3E943O2ZtFMEyh2OlgKBC7a6cyO05ZWOR1TEi
 4I+APGg5Yqxp3oZr3RGKOM6OJw==
X-Google-Smtp-Source: ACHHUZ4FRtZtGdub5NQDntPy9nGyeS/bwj7mFnRDmzYb5VuO1PJh2E+P8gVT3nDseQEkWbZm/MnbqQ==
X-Received: by 2002:a17:907:318d:b0:961:69a2:c8d6 with SMTP id
 xe13-20020a170907318d00b0096169a2c8d6mr2552988ejb.69.1685449660040; 
 Tue, 30 May 2023 05:27:40 -0700 (PDT)
Received: from krzk-bin ([178.197.199.204]) by smtp.gmail.com with ESMTPSA id
 f18-20020a170906049200b009661484e84esm7356444eja.191.2023.05.30.05.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 05:27:39 -0700 (PDT)
Date: Tue, 30 May 2023 14:27:36 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20230530122736.tflfu5cugbd7ooup@krzk-bin>
References: <20230529091359.71987-1-raphael.gallais-pou@foss.st.com>
 <20230529091359.71987-3-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230529091359.71987-3-raphael.gallais-pou@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/4] dt-bindings: display: st,
 stm32-dsi: Remove unnecessary fields
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

On Mon, 29 May 2023 11:13:57 +0200, Raphael Gallais-Pou wrote:
> "#address-cells" and "#size-cells" are two properties that are not
> mandatory. For instance, the DSI could refer to a bridge outside the scope
> of the node rather than include a 'panel@0' subnode. By doing so, address
> and size fields become then unnecessary, creating a warning at build time.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Marek Vasut <marex@denx.de>
> ---
>  Documentation/devicetree/bindings/display/st,stm32-dsi.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1787034


dsi@40016c00: Unevaluated properties are not allowed ('panel-dsi@0' was unexpected)
	arch/arm/boot/dts/stm32f469-disco.dtb

dsi@5a000000: Unevaluated properties are not allowed ('panel-dsi@0' was unexpected)
	arch/arm/boot/dts/stm32mp157c-ev1.dtb
	arch/arm/boot/dts/stm32mp157c-ev1-scmi.dtb
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
