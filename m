Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5279621DE19
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jul 2020 19:01:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0595EC36B29;
	Mon, 13 Jul 2020 17:01:21 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53233C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2020 17:01:19 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id t27so11768178ill.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jul 2020 10:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u+ATDfebf9MV39yazJSR2REjUJRTM5Ietg8G+hjq9hs=;
 b=C/97Y3NZXz2IaAv/S416jX5LJcouSwzxJcILGoaaTQBF0q7SAvKgygl7/dTxtczDgo
 8PAA2+Fs1qtBdsukzAqQvB5HCAaop5pPrFfB6x2zpucKcgzwXCsbFGShthPnVwaHJJTy
 0BGIaBGvUDZerNvZmL7kKm9dt9Yx0gW4uhfB4VJZMqpcVrgFU3saZLy201dBMRqIvUCe
 n03u+GtjfL5rtZd3y/7tFbAFu/C8NXuYH40g5QY2Dx1AVLAK4LZ1QZYxOiME5wpxs3dj
 WcR98xWsgVS2btP3W9IuwAff3PsMwG9ujWzqW4LhBuSTwQYGZKMVAADXkufhZraosSYp
 OkdQ==
X-Gm-Message-State: AOAM531Bo8ROihWDHyhUWbhWonPkKes3QySbuooy8Sg+1+jxIR9UJwI0
 8+ZuhMhLVgFRAWVQeyNWTA==
X-Google-Smtp-Source: ABdhPJz8Xnzy5VMGLC1oVbharKqEmV8XouNZObzNUKUHDywbuYQ837jCWWk9uWJgtsZ2IZZCJw3hPw==
X-Received: by 2002:a92:9892:: with SMTP id a18mr656663ill.60.1594659678061;
 Mon, 13 Jul 2020 10:01:18 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id w4sm7909214ioc.23.2020.07.13.10.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 10:01:17 -0700 (PDT)
Received: (nullmailer pid 384200 invoked by uid 1000);
 Mon, 13 Jul 2020 17:01:16 -0000
Date: Mon, 13 Jul 2020 11:01:16 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200713170116.GA364356@bogus>
References: <20200701132523.32533-1-benjamin.gaignard@st.com>
 <20200701132523.32533-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701132523.32533-2-benjamin.gaignard@st.com>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org, tomase@xilinx.com,
 mcoquelin.stm32@gmail.com, stefano.stabellini@xilinx.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/5] dt-bindings: bus: Add firewall
	bindings
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

On Wed, Jul 01, 2020 at 03:25:19PM +0200, Benjamin Gaignard wrote:
> Add schemas for firewall consumer and provider.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/bus/stm32/firewall-consumer.yaml      | 36 ++++++++++++++++++++++
>  .../bindings/bus/stm32/firewall-provider.yaml      | 18 +++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/stm32/firewall-consumer.yaml
>  create mode 100644 Documentation/devicetree/bindings/bus/stm32/firewall-provider.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/stm32/firewall-consumer.yaml b/Documentation/devicetree/bindings/bus/stm32/firewall-consumer.yaml
> new file mode 100644
> index 000000000000..d3d76f99b38d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/stm32/firewall-consumer.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/stm32/firewall-consumer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common Bus Firewall consumer binding

I'm all for common bindings, but I want to see more than 1 user before 
accepting this. There's been some other postings for similar h/w 
(AFAICT) recently.

> +
> +description: |
> +  Firewall properties provide the possible firewall bus controller
> +  configurations for a device.
> +  Bus firewall controllers are typically used to control if a hardware
> +  block can perform read or write operations on bus.
> +  The contents of the firewall bus configuration properties are defined by
> +  the binding for the individual firewall controller device.
> +
> +  The first configuration 'firewall-0' or the one named 'default' is
> +  applied before probing the device itself.

This is a Linux implementation detail and debatable whether the core 
should do this or drivers.

> +
> +maintainers:
> +  - Benjamin Gaignard <benjamin.gaignard@st.com>
> +
> +# always select the core schema
> +select: true
> +
> +properties:
> +  firewall-0: true
> +
> +  firewall-names: true
> +
> +patternProperties:
> +  "firewall-[0-9]":
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"

So I guess multiple properties is to encode all the modes into DT like 
pinctrl does. Is that really necessary? I don't think so as I wouldn't 
expect modes to be defined by the consumer, but by the provider in this 
case. To use pinctrl as a example, we could have pad setting per MMC 
speed. That has to be in the consumer side as the pinctrl knows nothing 
about MMC.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
