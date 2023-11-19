Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 697117F0722
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Nov 2023 16:24:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1877EC6B46B;
	Sun, 19 Nov 2023 15:24:00 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFC14C6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Nov 2023 15:23:58 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-6d33298f8fdso2201615a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Nov 2023 07:23:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700407437; x=1701012237;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JvBH+EWY74pgOdnostfTvFXJoA0rOQwdXiujVZ07pTs=;
 b=JccG0vQq0oXtwI3wzV0sC9mugMQXl3itiUVkZZJvKFEFENHGjxBGgabD9sMeZBangh
 R24LZmyLNAnm/I+0ffr4+raP13JJF7GSpkj5TSFPnDzzL437UV255I+HThIxJPd61gcQ
 YLCCKNGzmfFB33kIl3l18GesZiFL4VbceZgTJuTTZ1MONSR39/owB4Fhnpuhs0di5fVB
 AdT9nXlryWIRau0gr/qyYB7aVXie+FSYAhRruAGrnWGeX9lXQiMibEvViIzH5akzCow6
 YLyWJ3uQ9Bh+w7ZzQv8fkHhWFn/LcQVQlvGfMv0n3PkkocVkRjoMMYf+IT9YzkH8XJ2r
 l4zw==
X-Gm-Message-State: AOJu0YzuaXGwwkuBZkrbMLDT5cqsn8oZC+Py/5GNzLAlFY+HxSoWoqZZ
 n22MKeVPQry5TK3DT1KMdA==
X-Google-Smtp-Source: AGHT+IGDY8KITDzwXPPX6dbv/Syq98ERWXvGlyDk+aFKC8MDHNnswIHQzkscF5GiPJ//Dn3zZ0QfQw==
X-Received: by 2002:a05:6870:af05:b0:1f4:a48d:d32f with SMTP id
 ux5-20020a056870af0500b001f4a48dd32fmr5682063oab.25.1700407437363; 
 Sun, 19 Nov 2023 07:23:57 -0800 (PST)
Received: from herring.priv ([2607:fb90:45e3:889f:15b4:1348:6d64:224b])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a056830090900b006d64f51a94bsm899932ott.34.2023.11.19.07.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 07:23:56 -0800 (PST)
Received: (nullmailer pid 223586 invoked by uid 1000);
 Sun, 19 Nov 2023 15:23:54 -0000
Date: Sun, 19 Nov 2023 09:23:54 -0600
From: Rob Herring <robh@kernel.org>
To: gabriel.fernandez@foss.st.com
Message-ID: <20231119152354.GA216405-robh@kernel.org>
References: <20231116154952.1206705-1-gabriel.fernandez@foss.st.com>
 <20231116154952.1206705-4-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231116154952.1206705-4-gabriel.fernandez@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/5] dt-bindings: stm32: add clocks and
 reset binding for stm32mp25 platform
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

On Thu, Nov 16, 2023 at 04:49:50PM +0100, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Adds clock and reset binding entries for STM32MP25 SoC family
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../bindings/clock/st,stm32mp25-rcc.yaml      |  72 +++
>  include/dt-bindings/clock/st,stm32mp25-rcc.h  | 492 ++++++++++++++++++
>  include/dt-bindings/reset/st,stm32mp25-rcc.h  | 165 ++++++
>  3 files changed, 729 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
>  create mode 100644 include/dt-bindings/clock/st,stm32mp25-rcc.h
>  create mode 100644 include/dt-bindings/reset/st,stm32mp25-rcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
> new file mode 100644
> index 000000000000..1bdcfacd62d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/st,stm32mp25-rcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32MP25 Reset Clock Controller
> +
> +maintainers:
> +  - Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> +
> +description: |
> +  The RCC hardware block is both a reset and a clock controller.
> +  RCC makes also power management (resume/supend).
> +
> +  See also::
> +    include/dt-bindings/clock/st,stm32mp25-rcc.h
> +    include/dt-bindings/reset/st,stm32mp25-rcc.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp25-rcc
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  clocks:
> +    description: Specifies oscillators.
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: hse
> +      - const: hsi
> +      - const: msi
> +      - const: lse
> +      - const: lsi

No idea what these TLAs are... Define them in clocks:

clocks:
  items:
    - description: what hse is
    - ...

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
