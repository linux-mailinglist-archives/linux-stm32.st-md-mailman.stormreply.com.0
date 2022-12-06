Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7ED644400
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Dec 2022 14:04:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BD9BC65E6F;
	Tue,  6 Dec 2022 13:04:59 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55E2EC65E6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 13:04:58 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-143ffc8c2b2so17330842fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Dec 2022 05:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7PA9L06FReN9gMJW1BhOEhzIMLjiatd9la6VdvyM95E=;
 b=1++dOmIGg3IhiwdR9hIJZnttLA9V+WlneGuaamzKr0hoYXF0Hn+nlVGCk6oADEwpGG
 ze98U2tztP8Bc/QwdhA1LTYNdnMfxHw8IZqUB+WoX2/1jM9U5Nn8f+15OQm9t/8CgJyx
 Wsx+vnkR5TBwGAuR10dOber8thyeAJ3MUwBc3ARHEDhSY0OlYfa8lhCoqooYEhKA3sTE
 rPyDBaz879uBchOOyK2x7CbdVrqH3xQQXPUINqkbVs/rM8s6ilzQX0K6AnihPAtvL0yy
 TLvwwt+kEk1rTqXVqGU+E6RPvO+m24ZmQ1lgjLaxZEPz1mIRn7kqRFFSpoB6eGe1y6wZ
 CjaQ==
X-Gm-Message-State: ANoB5pnoSJMFInxkasACR6k8EXFA95dopjytOtb1omxsJc3w1D47JDYS
 VFm6dz8rZnUYh1AvY6eP/A==
X-Google-Smtp-Source: AA0mqf4OD6Dy3yFsVoldxMcqJvPGCgCh+F/7YTzrJMkOhg4PXj2JwTNX9wO+2Gqu7sAuwvEhtKG/Hw==
X-Received: by 2002:a05:6871:410d:b0:144:4557:320a with SMTP id
 la13-20020a056871410d00b001444557320amr9285238oab.112.1670331896981; 
 Tue, 06 Dec 2022 05:04:56 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j20-20020a056830271400b0066e80774203sm6638956otu.43.2022.12.06.05.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 05:04:56 -0800 (PST)
Received: (nullmailer pid 229159 invoked by uid 1000);
 Tue, 06 Dec 2022 13:04:55 -0000
Date: Tue, 6 Dec 2022 07:04:55 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167033189469.229101.10106957833693362255.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-8-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-8-krzysztof.kozlowski@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jeff Chase <jnchase@google.com>,
 Joe Tessler <jrt@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [Linux-stm32] [PATCH v2 7/9] media: dt-bindings: cec-gpio:
	convert to DT schema
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


On Mon, 05 Dec 2022 16:18:43 +0100, Krzysztof Kozlowski wrote:
> Convert HDMI CEC GPIO bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../devicetree/bindings/media/cec-gpio.txt    | 42 -----------
>  .../bindings/media/cec/cec-gpio.yaml          | 73 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 74 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/cec-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
