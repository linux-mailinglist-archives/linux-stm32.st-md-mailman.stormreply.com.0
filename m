Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E1F114936
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2019 23:27:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE147C36B0B;
	Thu,  5 Dec 2019 22:27:28 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CD68C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2019 22:27:28 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id x3so4053580oto.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2019 14:27:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=651QbfFxHbn+gIg6TglJPaA7sVi2egQeAs/aiyii6jY=;
 b=mTlODftXng/ykrzxMJ1nLAyn4hKluPqRu7FPvDkZbGw9xaPAL3IL9jlZFQ6qoFJehz
 XXYFJ0vNcU8OBPa9nKfYl59QLE5eLvn4eyk5mc73FzgvHMGqAUWhsdhU2mJlDPynbEaz
 2oNvEccfT7HG9UZcBFP9MXdqfQiUxkID5wySbEqvzCGSd8QHUTpD4QhsN2b7gZnZLzf+
 4/81yGkNNy7WFV+VeEli8x+GrzYIVcUpkjoLwhHVGicTuLVfn1z+4JEIFhQZr0BLIHO4
 3YFGiC/wfp6ffYBbim6BxXVX4bnu7NrZU3nwgRfPLotpE+xQ8S2H3XYA+sdfTB1QN5d3
 9rGQ==
X-Gm-Message-State: APjAAAVvq+RqWLMS9fVLoNHEYm8o8AKH0cDtzWlB6dVsvahooGzHvBUN
 OH0db4HD6DMbNG5yasFItg==
X-Google-Smtp-Source: APXvYqw/PZNA3vwmc6UK37QzPywxm/gn6jJclg5Apod62JI2XI7Q9MTrj8/GmqtdSYdOOs7l2iZ8IQ==
X-Received: by 2002:a05:6830:16c6:: with SMTP id
 l6mr8879987otr.186.1575584846734; 
 Thu, 05 Dec 2019 14:27:26 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w203sm2009701oia.12.2019.12.05.14.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 14:27:25 -0800 (PST)
Date: Thu, 5 Dec 2019 16:27:25 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20191205222725.GA7547@bogus>
References: <20191127171642.6014-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191127171642.6014-1-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 pmeerw@pmeerw.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 knaack.h@gmx.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: iio: adc: convert sd
 modulator to json-schema
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

On Wed, Nov 27, 2019 at 06:16:42PM +0100, Olivier Moysan wrote:
> Convert the sigma delta modulator bindings
> to DT schema format using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
>  .../iio/adc/sigma-delta-modulator.txt         | 13 -------
>  .../iio/adc/sigma-delta-modulator.yaml        | 35 +++++++++++++++++++
>  2 files changed, 35 insertions(+), 13 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt
> deleted file mode 100644
> index 59b92cd32552..000000000000
> --- a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.txt
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Device-Tree bindings for sigma delta modulator
> -
> -Required properties:
> -- compatible: should be "ads1201", "sd-modulator". "sd-modulator" can be use
> -	as a generic SD modulator if modulator not specified in compatible list.
> -- #io-channel-cells = <0>: See the IIO bindings section "IIO consumers".
> -
> -Example node:
> -
> -	ads1202: adc {
> -		compatible = "sd-modulator";
> -		#io-channel-cells = <0>;
> -	};
> diff --git a/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
> new file mode 100644
> index 000000000000..8967c6f06d9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/sigma-delta-modulator.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/sigma-delta-modulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Device-Tree bindings for sigma delta modulator
> +
> +maintainers:
> +  - Arnaud Pouliquen <arnaud.pouliquen@st.com>
> +
> +properties:
> +  compatible:
> +    description: |
> +      "sd-modulator" can be used as a generic SD modulator,
> +      if the modulator is not specified in the compatible list.
> +    enum:
> +      - sd-modulator
> +      - ads1201
> +
> +  '#io-channel-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - '#io-channel-cells'

Add:

additionalProperties: false

> +
> +examples:
> +  - |
> +    ads1202: adc@0 {

No reg, so drop the unit-address.

> +      compatible = "sd-modulator";
> +      #io-channel-cells = <0>;
> +    };
> +
> +...
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
