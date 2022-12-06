Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B5D6443E6
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Dec 2022 14:03:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C29E4C65E6F;
	Tue,  6 Dec 2022 13:03:08 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 473B7C65E6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 13:03:07 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 p24-20020a0568301d5800b0066e6dc09be5so9198683oth.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Dec 2022 05:03:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZsHz7oem0hvoy253pLElia6MFpzna6RsOWGgM/OIK/c=;
 b=j0enhOxWaSmUDHXiuQEbvTFEtUMXxCwiIHL1w+cxTJVMEa2beyOYJJYtXD4D1StIAF
 1S9AjgzeYBe59dJXjrA9A4maXZcUOXeD03+zYRTMr3f89OD558B9xFfX6X3qJeOuhwmY
 QWuxFrKSYuUln1ZZ7jaHs+XlEg9IjDHAO7Us/QKnl6aX6zx6NrwtOd6hfBFoBk+/XuZf
 lcuS6MeguFlED0eRr0TeLQbX1NVuBmj7rNgICrFRW2ezW/rZcDeFPzqAjQx5QKidFuq4
 QEjbk4gk6MoxdCg2s7HkkjfIo3um9SVJWAHyUQcyCf/N7ViMACOeCUlbfVz2mwFlw5Au
 FfIg==
X-Gm-Message-State: ANoB5plfgCCGEPYwsD+tpDU6cV6NTUh4W78C3f/QhGRj4Lyiod3KUIUa
 7s4mrt0ApT6kDxvZOaXmP5WGGczfTA==
X-Google-Smtp-Source: AA0mqf4yMjf4z/y/6VWpMK8yj5aLgyx2b7hfiA+lsr5PO0CdV8vmOyeAkgnmUv8+mjnlGm72eQ9eCg==
X-Received: by 2002:a05:6830:3499:b0:66e:6dc2:cc19 with SMTP id
 c25-20020a056830349900b0066e6dc2cc19mr13611372otu.28.1670331786082; 
 Tue, 06 Dec 2022 05:03:06 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q38-20020a056871082600b00144a3c526d9sm3252124oap.52.2022.12.06.05.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 05:03:04 -0800 (PST)
Received: (nullmailer pid 226253 invoked by uid 1000);
 Tue, 06 Dec 2022 13:03:03 -0000
Date: Tue, 6 Dec 2022 07:03:03 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167033178234.226181.8075242304535927739.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-5-krzysztof.kozlowski@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jeff Chase <jnchase@google.com>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Joe Tessler <jrt@google.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [Linux-stm32] [PATCH v2 4/9] media: dt-bindings: amlogic,
 meson-gx-ao-cec: reference common CEC properties
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


On Mon, 05 Dec 2022 16:18:40 +0100, Krzysztof Kozlowski wrote:
> Reference common HDMI CEC adapter properties to simplify the binding and
> have only one place of definition for common properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/media/cec/amlogic,meson-gx-ao-cec.yaml        | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
