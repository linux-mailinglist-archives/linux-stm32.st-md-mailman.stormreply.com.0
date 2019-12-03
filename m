Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85798111F0F
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2019 00:09:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 360C9C36B0B;
	Tue,  3 Dec 2019 23:09:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A0D5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2019 23:09:22 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BAF082080F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2019 23:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575414560;
 bh=K6IMMvz7VrhBT/r4elDKy+T8OufjAAZQT6Bk0nA+v8I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nXbO+PKWt82VvDfa008aPfRPCljM7YrhQqDUK+tbjsJ8YOMRJOaiZNLw2wHoDr7rG
 p17jQRp/hnlEheJZZFeuvn9Fwzggq9tiUsZahKgCfJHAMjPQAXCmAlZQOsG7fBmTZP
 Kvs+fZaygNwtEdjM1kmXmtDdkg+7WWnbFtCPL7xA=
Received: by mail-qv1-f46.google.com with SMTP id c2so2298890qvp.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Dec 2019 15:09:20 -0800 (PST)
X-Gm-Message-State: APjAAAU/N/zk4kuXzJNcCQuGc7qEZ56IAMY/OhTw5F8Bqi1yIQIoSi5C
 l+0rF/P8YskAUJO+imcJ5LXU/nb/dzVvlmP6ag==
X-Google-Smtp-Source: APXvYqxWbn3HAd6F5z+7jJVFqPmGA3wry5wZeoXSEFBoX0HCQMPI5HWXhzetnpmuOaPsqKjXxoFDMW5qwot8ObEg0+w=
X-Received: by 2002:a0c:f6cd:: with SMTP id d13mr144958qvo.20.1575414559852;
 Tue, 03 Dec 2019 15:09:19 -0800 (PST)
MIME-Version: 1.0
References: <20191203134910.26470-1-p.paillet@st.com>
In-Reply-To: <20191203134910.26470-1-p.paillet@st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 3 Dec 2019 17:09:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJOWgB1mC3TwkpzfsAViB2tF9At1z1rtFQZqWEEJ5VnPQ@mail.gmail.com>
Message-ID: <CAL_JsqJOWgB1mC3TwkpzfsAViB2tF9At1z1rtFQZqWEEJ5VnPQ@mail.gmail.com>
To: Pascal Paillet <p.paillet@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] regulator: Convert stm32-pwr regulator to
	json-schema
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

On Tue, Dec 3, 2019 at 7:49 AM Pascal Paillet <p.paillet@st.com> wrote:
>
> Convert the stm32-pwr regulator binding to DT schema format using
> json-schema.
>
> Signed-off-by: Pascal Paillet <p.paillet@st.com>
> ---
>  .../regulator/st,stm32mp1-pwr-reg.txt         | 43 ------------
>  .../regulator/st,stm32mp1-pwr-reg.yaml        | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
>
> diff --git a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt
> deleted file mode 100644
> index e372dd3f0c8a..000000000000
> --- a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -STM32MP1 PWR Regulators
> ------------------------
> -
> -Available Regulators in STM32MP1 PWR block are:
> -  - reg11 for regulator 1V1
> -  - reg18 for regulator 1V8
> -  - usb33 for the swtich USB3V3
> -
> -Required properties:
> -- compatible: Must be "st,stm32mp1,pwr-reg"
> -- list of child nodes that specify the regulator reg11, reg18 or usb33
> -  initialization data for defined regulators. The definition for each of
> -  these nodes is defined using the standard binding for regulators found at
> -  Documentation/devicetree/bindings/regulator/regulator.txt.
> -- vdd-supply: phandle to the parent supply/regulator node for vdd input
> -- vdd_3v3_usbfs-supply: phandle to the parent supply/regulator node for usb33
> -
> -Example:
> -
> -pwr_regulators: pwr@50001000 {
> -       compatible = "st,stm32mp1,pwr-reg";
> -       reg = <0x50001000 0x10>;
> -       vdd-supply = <&vdd>;
> -       vdd_3v3_usbfs-supply = <&vdd_usb>;
> -
> -       reg11: reg11 {
> -               regulator-name = "reg11";
> -               regulator-min-microvolt = <1100000>;
> -               regulator-max-microvolt = <1100000>;
> -       };
> -
> -       reg18: reg18 {
> -               regulator-name = "reg18";
> -               regulator-min-microvolt = <1800000>;
> -               regulator-max-microvolt = <1800000>;
> -       };
> -
> -       usb33: usb33 {
> -               regulator-name = "usb33";
> -               regulator-min-microvolt = <3300000>;
> -               regulator-max-microvolt = <3300000>;
> -       };
> -};
> diff --git a/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
> new file mode 100644
> index 000000000000..f661728ebdeb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/st,stm32mp1-pwr-reg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32MP1 PWR voltage regulators
> +
> +maintainers:
> +  - Pascal Paillet <p.paillet@st.com>
> +
> +allOf:
> +  - $ref: "regulator.yaml#"

This doesn't belong here as it applied to regulator nodes like you have below.

> +
> +properties:
> +  compatible:
> +    const: st,stm32mp1,pwr-reg
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Input supply phandle(s) for vdd input
> +
> +  vdd_3v3_usbfs-supply:
> +    description: Input supply phandle(s) for vdd_3v3_usbfs input
> +
> +patternProperties:
> +  "^(reg11|reg18|usb33)":

Needs a '$' on the end.

> +    type: object
> +
> +    allOf:
> +      - $ref: "regulator.yaml#"
> +
> +required:
> +   - compatible
> +   - reg

Should be 2 not 3 space indent.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pwr@50001000 {
> +      compatible = "st,stm32mp1,pwr-reg";
> +      reg = <0x50001000 0x10>;
> +      vdd-supply = <&vdd>;
> +      vdd_3v3_usbfs-supply = <&vdd_usb>;
> +
> +      reg11 {
> +        regulator-name = "reg11";
> +        regulator-min-microvolt = <1100000>;
> +        regulator-max-microvolt = <1100000>;
> +      };
> +
> +      reg18 {
> +        regulator-name = "reg18";
> +        regulator-min-microvolt = <1800000>;
> +        regulator-max-microvolt = <1800000>;
> +      };
> +
> +      usb33 {
> +        regulator-name = "usb33";
> +        regulator-min-microvolt = <3300000>;
> +        regulator-max-microvolt = <3300000>;
> +      };
> +    };
> +...
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
