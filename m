Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 581DD3BF01
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 23:57:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C2A4D1DEA4
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 21:57:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D76BD1DEA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 21:57:56 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 200ED2145D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 21:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560203875;
 bh=g4mY100w2qgQoqrm9iHtxlwWj9iN/wYo4Hcn8OgqS8Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fO8OzSFz3yf/+buoGxsLocyYpw/2kZwneLtrMzQ05YDjIRyc2CdUqR1PIhjOLP5x/
 jvFdH7X9Uqd/8QErrXxULrDRJNIS7T+v9WXbPRP/d7ScW5DXaSbbrO3WHycdhZxgdR
 lftNaJOTMYM6k3XwuF9LnSP3XL1HG4cbXSzsrReg=
Received: by mail-qt1-f178.google.com with SMTP id y57so12206142qtk.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 14:57:55 -0700 (PDT)
X-Gm-Message-State: APjAAAVY8xO3CLW62w73GeQA+FJpYyWh0TyJCPUtpxr9HAfdZTfYFpCy
 LYaQv/BE4Gi0gM4I5WQLWyxPFIzpf7cjJ+QoVQ==
X-Google-Smtp-Source: APXvYqw1cfkjGTbC0jdIEGlyRcw4f3LBrmMrdCPBXItz9JGMvlPjCnQIatnqWLCFa+L6qVlKCb97ojLPMStDgnodVi8=
X-Received: by 2002:a0c:8a43:: with SMTP id 3mr13015726qvu.138.1560203874386; 
 Mon, 10 Jun 2019 14:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190531063849.26142-1-manivannan.sadhasivam@linaro.org>
 <20190531063849.26142-3-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20190531063849.26142-3-manivannan.sadhasivam@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 10 Jun 2019 15:57:43 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+N7NA7m+dp+zpwFeZLM6B+OwRrqZdzKkJp2TRWi_e3Mw@mail.gmail.com>
Message-ID: <CAL_Jsq+N7NA7m+dp+zpwFeZLM6B+OwRrqZdzKkJp2TRWi_e3Mw@mail.gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: devicetree@vger.kernel.org, loic pallardy <loic.pallardy@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 2/4] dt-bindings: arm: stm32: Convert
 STM32 SoC bindings to DT schema
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

On Fri, May 31, 2019 at 12:39 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> This commit converts STM32 SoC bindings to DT schema using jsonschema.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../devicetree/bindings/arm/stm32/stm32.yaml  | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/stm32/stm32.yaml

Converting implies removal of something. The schema looks fine though.

>
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> new file mode 100644
> index 000000000000..f53dc0f2d7b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/stm32/stm32.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Platforms Device Tree Bindings
> +
> +maintainers:
> +  - Alexandre Torgue <alexandre.torgue@st.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: st,stm32f429
> +
> +      - items:
> +          - const: st,stm32f469
> +
> +      - items:
> +          - const: st,stm32f746
> +
> +      - items:
> +          - const: st,stm32h743
> +
> +      - items:
> +          - const: st,stm32mp157
> +...
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
