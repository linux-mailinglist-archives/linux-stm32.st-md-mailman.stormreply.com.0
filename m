Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B40600DD2
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Oct 2022 13:33:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6806DC63325;
	Mon, 17 Oct 2022 11:33:05 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01EB1C03FDA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 11:33:03 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id i3so10778340pfc.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 04:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KK+EXo53xH3teNZkrCGFVk1lVgEFpbXtxVfs298qg8I=;
 b=HTuAuT+sap6LyXtbF9CDJq/7i56C5laYDIbS8NJe5BA/8qOeb8n3sNwqunDQFR9hFW
 C2/BtSDsHgLdRs9WJC81iXFM0cYxf+DIkFQQ0XqmzBGsD6KxROYIpb67OIHtY6PiRDCO
 lNnLNFJ5ihblBr1VqDFpm80eth60CNzq6xRLEK+syBVKhDJh7YlpPg0j/8JFJaZWlfqt
 kzvtzegfot9Px//p1Ob7kbmI55ywHgz1vBtUBpptNIdH7muH85k5Sx+MLatACXt92xRh
 ineJtNidz1dn+yU+FHFUunXRA9rggp2WMU1jqwDY1avYurHV69Ic5SyjyBBfdCnQUkl2
 MUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KK+EXo53xH3teNZkrCGFVk1lVgEFpbXtxVfs298qg8I=;
 b=OCWKLVgWq8WhixkjDoPfjmlg306SnUmSSW6vlLte2O6AwcVFFn2HHpmKq7Vn7FQ3H8
 3RQqpoWoV4Ap2oLYfPM+NOK3NYu4PcjuZaMfDHJl6NtJu+H66QZdBH0jYKbY6IxSecDn
 eWBC5Kx9CHYakzuPRkMHJ6rS1OO6KjqRFF9XJg4K8XWp/1f3v9iXk4SZX8nD8QUIPNrf
 KsUyjmPSKmaYzq57fK1j5vIkKh+YwVaw4UXqb2E5W4dZkAEWRIUhST+bt/PT5CZpjhgb
 Gd2mPpvsERQDHh95nmaznFPI4r4auvlUJXQnkmbEvtZ84rO+0lI449nLAAj50s99I3ZK
 oh4Q==
X-Gm-Message-State: ACrzQf07jdMI1SEHhqL2Zxp8fhAVj0WRXRlhRLbERJiJWNsGE6tl7i3f
 Sp25O1DupRabNIrwAHOYiI5fDXrYRtLOl5CN7zhAww==
X-Google-Smtp-Source: AMsMyM5zMeFWy2lKl6Fz9ckb/XeM2zFIV36/AvksTHriobx/KjpX5Gwr1gl4rEOssMIUi1/8xahfsXVC8FrBys9OkjE=
X-Received: by 2002:a63:464d:0:b0:441:5968:cd0e with SMTP id
 v13-20020a63464d000000b004415968cd0emr10687642pgk.595.1666006382483; Mon, 17
 Oct 2022 04:33:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221013221242.218808-1-marex@denx.de>
In-Reply-To: <20221013221242.218808-1-marex@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Oct 2022 13:32:24 +0200
Message-ID: <CAPDyKFoLrxwjjrULD=6+jd4tWSffdmVr1X0z+kByid02tevNQg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: mmc: arm,
 pl18x: Document interrupt-names is ignored
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

On Fri, 14 Oct 2022 at 00:13, Marek Vasut <marex@denx.de> wrote:
>
> Due to inconsistency of existing DTs regarding the content of this IP
> interrupt-names DT property, document this such that interrupt-names
> is not used by this IP bindings.
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Yann Gautier <yann.gautier@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: Add deprecated:false to interrupts: description
> ---
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> index 1e69a5a42439b..1c96da04f0e53 100644
> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> @@ -95,7 +95,9 @@ properties:
>        PIO (polled I/O) interrupt and occurs when the FIFO needs to be
>        emptied as part of a bulk read from the card. Some variants have these
>        two interrupts wired into the same line (logic OR) and in that case
> -      only one interrupt may be provided.
> +      only one interrupt may be provided. The interrupt-names property is
> +      not used due to inconsistency of existing DTs regarding its content.
> +    deprecated: false
>      minItems: 1
>      maxItems: 2
>
> --
> 2.35.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
