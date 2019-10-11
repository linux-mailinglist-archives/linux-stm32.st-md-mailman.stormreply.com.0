Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74126D3FC7
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Oct 2019 14:41:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 397ADC36B0C;
	Fri, 11 Oct 2019 12:41:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71C68C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 12:41:24 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D32B221D80
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 12:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570797683;
 bh=0ntoZW7nIQaS0RptBTqn8yRQKbcwYPW6mrTC+nExxQQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dR100AmRHlPwX27kUrp1Lauf3ohIZVPT1aokTFmN/cMb52PIZCHr7cnR8lnpbjLqj
 dicgfF0TpW4nEd2mwFBiZJjqOSCarxIGU+A6CE1Bvzn5Lxu1fFt6mtmei+4dyZVSSl
 CSrZCRsYHokj3EuztdAzqWaGGTOBWJxfSIjVmNCk=
Received: by mail-qk1-f173.google.com with SMTP id w2so8734494qkf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 05:41:22 -0700 (PDT)
X-Gm-Message-State: APjAAAVC72J3d8lJvAc+k50iU5DSGvZhy1gP3zQyILciG1i2B1SFS7CK
 RDnrlXcgFIpnkmSkgElR2x4+YQ9osVB3AdJHUQ==
X-Google-Smtp-Source: APXvYqxSOLHC3OhXJjaOJaRAYwJ7GF4/t7229zQiP9PqqmGtuF/Yddz3rOt3p/MLumF2OTaUmi8AujpP8UblZE39o8w=
X-Received: by 2002:a05:620a:12f1:: with SMTP id
 f17mr15407013qkl.152.1570797681944; 
 Fri, 11 Oct 2019 05:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191002151907.15986-1-benjamin.gaignard@st.com>
In-Reply-To: <20191002151907.15986-1-benjamin.gaignard@st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 11 Oct 2019 07:41:10 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+p6rYun-zOwK49=QSfuJGMpiXj5UfASdXhjmOX1cudWQ@mail.gmail.com>
Message-ID: <CAL_Jsq+p6rYun-zOwK49=QSfuJGMpiXj5UfASdXhjmOX1cudWQ@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: hwlock: Convert stm32
	hwspinlock bindings to json-schema
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

On Wed, Oct 2, 2019 at 10:19 AM Benjamin Gaignard
<benjamin.gaignard@st.com> wrote:
>
> Convert the STM32 hwspinlock binding to DT schema format using json-schema
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/hwlock/st,stm32-hwspinlock.txt        | 23 -----------
>  .../bindings/hwlock/st,stm32-hwspinlock.yaml       | 48 ++++++++++++++++++++++
>  2 files changed, 48 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
>  create mode 100644 Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
>
> diff --git a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
> deleted file mode 100644
> index adf4f000ea3d..000000000000
> --- a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -STM32 Hardware Spinlock Device Binding
> --------------------------------------
> -
> -Required properties :
> -- compatible : should be "st,stm32-hwspinlock".
> -- reg : the register address of hwspinlock.
> -- #hwlock-cells : hwlock users only use the hwlock id to represent a specific
> -       hwlock, so the number of cells should be <1> here.
> -- clock-names : Must contain "hsem".
> -- clocks : Must contain a phandle entry for the clock in clock-names, see the
> -       common clock bindings.
> -
> -Please look at the generic hwlock binding for usage information for consumers,
> -"Documentation/devicetree/bindings/hwlock/hwlock.txt"
> -
> -Example of hwlock provider:
> -       hwspinlock@4c000000 {
> -               compatible = "st,stm32-hwspinlock";
> -               #hwlock-cells = <1>;
> -               reg = <0x4c000000 0x400>;
> -               clocks = <&rcc HSEM>;
> -               clock-names = "hsem";
> -       };
> diff --git a/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
> new file mode 100644
> index 000000000000..64e169702515
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwlock/st,stm32-hwspinlock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Hardware Spinlock bindings
> +
> +maintainers:
> +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> +  - Fabien Dessenne <fabien.dessenne@st.com>
> +
> +properties:
> +  "#hwlock-cells": true

const: 1

> +
> +  compatible:
> +    const: st,stm32-hwspinlock
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Module Clock

Don't need a description for a single item.

maxItems: 1

> +
> +  clock-names:
> +    items:
> +      - const: hsem
> +
> +required:
> +  - "#hwlock-cells"
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

Add a:

additionalProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/stm32mp1-clks.h>
> +    hwspinlock@4c000000 {
> +        compatible = "st,stm32-hwspinlock";
> +        #hwlock-cells = <1>;
> +        reg = <0x4c000000 0x400>;
> +        clocks = <&rcc HSEM>;
> +        clock-names = "hsem";
> +    };
> +
> +...
> --
> 2.15.0
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
