Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA9C573AF3
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jul 2022 18:14:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A208C640FE;
	Wed, 13 Jul 2022 16:14:59 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 107B5C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 16:14:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8FE4EB8208B;
 Wed, 13 Jul 2022 16:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F714C341C0;
 Wed, 13 Jul 2022 16:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657728896;
 bh=gQk38Tovd/97VewdZYhK8DXuDAR70xdR3qj+gN5TMgI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QcH0BYnPExpm1LS39IcYTOWfPoGQDLY/XvzXyaDrIE/SzvAh5dCB5YlBvT4H1mX8q
 ScvN6XEYtq6z7Q3Y7ZXnaB7gxKNUelkWZ3/Dm+++oSxTdU3nyhNNDpH2Odp58Rw0u2
 6HXeKb0i0j2jjS6FpSxBE8L4MWFAyYnnjy7nySUVg0C597PL4/6u+qH5dCm+iRSsuV
 JXcLqIW2OCxNmF8XlvfR7x9ingo/AgR6OOAdCiaabfExl7LHvy9QYm+h3NFeifto1b
 Dr/RmoTBG+vCMbYFn0ANtk84KvtwxaZcBT9sLsWtxlBA5EcTWJ/8kF46DaNdAY5rOM
 kXoicS1/TPpDw==
Date: Wed, 13 Jul 2022 17:24:43 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Message-ID: <20220713172443.00ab80b2@jic23-huawei>
In-Reply-To: <20220712163345.445811-5-francesco.dolcini@toradex.com>
References: <20220712163345.445811-1-francesco.dolcini@toradex.com>
 <20220712163345.445811-5-francesco.dolcini@toradex.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/5] dt-bindings: iio: adc: stmpe:
 Remove node name requirement
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

On Tue, 12 Jul 2022 18:33:44 +0200
Francesco Dolcini <francesco.dolcini@toradex.com> wrote:

> STMPE driver does not require a specific node name anymore, only the
> compatible is checked, update binding according to this.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
I'm assuming this will go through mfd (or at least some tree that isn't
IIO :)  Shout if I should pick this up in the IIO tree.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml
> index 9049c699152f..333744a2159c 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml
> @@ -13,8 +13,7 @@ description:
>    This ADC forms part of an ST microelectronics STMPE multifunction device .
>    The ADC is shared with the STMPE touchscreen. As a result some ADC related
>    settings are specified in the parent node.
> -  The node name myst be stmpe_adc and should be a child node of the stmpe node
> -  to which it belongs.
> +  The node should be a child node of the stmpe node to which it belongs.
>  
>  properties:
>    compatible:

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
