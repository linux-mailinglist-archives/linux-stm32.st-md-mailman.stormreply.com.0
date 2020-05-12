Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E566C1CEA46
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2020 03:51:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE67EC36B37;
	Tue, 12 May 2020 01:51:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AE9AC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 01:51:32 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93E5820746
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2020 01:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589248291;
 bh=TOxJQ8useNXlHqOGQiMvp/S/nDhqTDFghznaUa0/uIg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=p5IIt7uZkMwrIw0sfUSXF2EWssNrJlRS+SHD0jR/hO7hOYSHT/ZJyLQ4f9rlKVh3+
 h7SkEi+TrQHofsgPWS4jpxQtRfhnJA3ubSknMIlTXAcCkcSQ0m05Tf2Y6lbsTDnBdj
 K13Wv8z8EqcNsxZ9VuwLBz2N/+kxE8jv11ZFf+lM=
Received: by mail-oi1-f172.google.com with SMTP id 19so16909722oiy.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 18:51:31 -0700 (PDT)
X-Gm-Message-State: AGi0Pubucr6FtdZHnTol9g2lDJhbxlmTRsrBs7ryuWtLGiaxXbdiM6RH
 avd5KB9RX5wGq+VxQXXbJ970amCC9r6ZZNXI4A==
X-Google-Smtp-Source: APiQypL/XqEe5cfCkvX4wVesmS2480UqrH6RbZniT1cjmaBIpnKBFXu2MNZpbZugUwsCKTbKaMG1sKVIuRyWE3/GCoY=
X-Received: by 2002:a05:6808:24f:: with SMTP id
 m15mr22849330oie.152.1589248290884; 
 Mon, 11 May 2020 18:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200508134527.26555-1-etienne.carriere@linaro.org>
In-Reply-To: <20200508134527.26555-1-etienne.carriere@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 11 May 2020 20:51:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJVaWDYZWwRwotSQyaL5bOugM3judxipS9oKveV3FdK8w@mail.gmail.com>
Message-ID: <CAL_JsqJVaWDYZWwRwotSQyaL5bOugM3judxipS9oKveV3FdK8w@mail.gmail.com>
To: Etienne Carriere <etienne.carriere@linaro.org>
Cc: Etienne Carriere <etienne.carriere@st.com>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: nvmem: stm32: new property
	for data access
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

On Fri, May 8, 2020 at 8:47 AM Etienne Carriere
<etienne.carriere@linaro.org> wrote:
>
> From: Etienne Carriere <etienne.carriere@st.com>
>
> Introduce boolean property st,non-secure-otp for OTP data located
> in a factory programmed area that only secure firmware can access
> by default and that shall be reachable from the non-secure world.
>
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> ---
>  .../bindings/nvmem/st,stm32-romem.yaml          | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> index d84deb4774a4..c11c99f085d7 100644
> --- a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
> @@ -24,6 +24,18 @@ properties:
>        - st,stm32f4-otp
>        - st,stm32mp15-bsec
>
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    type: object
> +
> +    properties:
> +      st,non-secure-otp:
> +        description: |
> +          This property explicits a factory programmed area that both secure
> +          and non-secure worlds can access. It is needed when, by default, the
> +          related area can only be reached by the secure world.
> +        type: boolean
> +
>  required:
>    - "#address-cells"
>    - "#size-cells"
> @@ -41,6 +53,11 @@ examples:
>        calib@22c {
>          reg = <0x22c 0x2>;
>        };
> +
> +      mac_addr@e4 {
> +        reg = <0xe4 0x8>;
> +        st,non-secure-otp;

This fails validation. You need to drop 'additionalProperties' in nvmem.yaml.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
