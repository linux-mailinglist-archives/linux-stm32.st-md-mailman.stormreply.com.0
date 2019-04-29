Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ACCED30
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2019 01:13:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3189EC35E04
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Apr 2019 23:13:20 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0650DC35E03
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 23:13:19 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id a10so1444171otl.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 16:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1O8sBEArMyrhqwTcVLODqVK500uIwj8t/3xZEzr2rlE=;
 b=cgb0Hco/+7N1P6e5bCrDOwoHThjDtm89i1crKYp80P/bFKQ9+POLYk+zuZa8Ao8Q54
 LsNCJEu7aRBr86137+3sN2kpwl9GJEsIYGcu7/F3hg3Q4M2SOYBNkNstolQrxSS/v1oo
 qeYJAOj+8LRwb477zNkOEBqYI7askJzHv1/5qvNXN3YFKPnhaZRgSXcpLCedmynaTXY9
 jbkNVq7kuSnN5rnX21vgL/OKNyvdQfSYhwm7VjExvwiy+y8pfbKC8Be8w5++HvwtuKeF
 a4VOFSK5wZrHUKK2tBk2ixxwx8xFzcz1FOkndfH50qQvKbrCJHY3mxOZcWasnptfrV/N
 qHuQ==
X-Gm-Message-State: APjAAAVHFaqIP40dXdM1ORVgSGIreZVyfxyupg5zcpUxO99RX0R4vvrB
 AtQBy0YYRpRSrRhirAnmiw==
X-Google-Smtp-Source: APXvYqxfp5Q4JJdPQJwax02hjhdCKb3p3RdL1zNagDD5a7+FoN+9hkK7/OqHSYTKoeE7c2kOZMmk9A==
X-Received: by 2002:a05:6830:20c4:: with SMTP id
 z4mr1561007otq.27.1556579597678; 
 Mon, 29 Apr 2019 16:13:17 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f18sm13702399otl.51.2019.04.29.16.13.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 16:13:16 -0700 (PDT)
Date: Mon, 29 Apr 2019 18:13:16 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Dessenne <fabien.dessenne@st.com>
Message-ID: <20190429231316.GA13995@bogus>
References: <1555426699-5340-1-git-send-email-fabien.dessenne@st.com>
 <1555426699-5340-2-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1555426699-5340-2-git-send-email-fabien.dessenne@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/8] dt-bindings: stm32: add bindings
 for ML-AHB interconnect
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

On Tue, Apr 16, 2019 at 04:58:12PM +0200, Fabien Dessenne wrote:
> Document the ML-AHB interconnect for stm32 SoCs.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  .../devicetree/bindings/arm/stm32/mlahb.txt        | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/stm32/mlahb.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/mlahb.txt b/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
> new file mode 100644
> index 0000000..a36458a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/stm32/mlahb.txt
> @@ -0,0 +1,37 @@
> +ML-AHB interconnect bindings
> +
> +These bindings describe the STM32 SoCs ML-AHB interconnect bus which connects
> +a Cortex-M subsystem with dedicated memories.
> +The MCU SRAM and RETRAM memory parts can be accessed through different addresses
> +(see "RAM aliases" in [1]) using different buses (see [2]) : balancing the
> +Cortex-M firmware accesses among those ports allows to tune the system
> +performance.
> +
> +[1]: https://www.st.com/resource/en/reference_manual/dm00327659.pdf
> +[2]: https://wiki.st.com/stm32mpu/wiki/STM32MP15_RAM_mapping
> +
> +Required properties:
> +- compatible: should be "simple-bus"
> +- dma-ranges: describes memory addresses translation between the local CPU and
> +	   the remote Cortex-M processor. Each memory region, is declared with
> +	   3 parameters:
> +		 - param 1: device base address (Cortex-M processor address)
> +		 - param 2: physical base address (local CPU address)
> +		 - param 3: size of the memory region.
> +
> +The Cortex-M remote processor accessed via the mlahb interconnect is described
> +by a child node.
> +
> +Example:
> +mlahb {
> +	compatible = "simple-bus";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	dma-ranges = <0x00000000 0x38000000 0x10000>,
> +		     <0x10000000 0x10000000 0x60000>,
> +		     <0x30000000 0x30000000 0x60000>;
> +
> +	m4_rproc: m4@0 {

'0' is a cpu address given there's no 'ranges' now for translating cpu 
addresses. I think you want it to be 0x38000000 instead. 

> +		...
> +	};
> +};
> -- 
> 2.7.4
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
