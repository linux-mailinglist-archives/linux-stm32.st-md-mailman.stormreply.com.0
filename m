Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD23A6E46C
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Mar 2025 21:31:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E778C78F65;
	Mon, 24 Mar 2025 20:31:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89DC1C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 20:31:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9E7C361590;
 Mon, 24 Mar 2025 20:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC1FC4CEDD;
 Mon, 24 Mar 2025 20:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742848275;
 bh=XZ2Yktl6mmKJfiTNy+Z4/IvVxFgIZo5WawcMrRO2Vbw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KFuZW06FF/l/+XccYW9mOLm0/T/y+rQ5Qey1sx5gf4IDaXAPgVGHQnHICkOj2UmZU
 PDykSuBwUEVADe6TdOjuKw5QO577NinlTsZimjhVNndV+uT/QF2NWLD0KNSrhsi0MI
 KO6BpOsq9Hl8egajcNvUPEudOv9SNJhFWRHqJQFRyzT1WHtvDIrlMg9stNwULybj+M
 BrUElG7Trs8lG1eluh+AtsXNGzvNnGeOi0P7Dlji1cjRBLjpqvGDXDk+yLmDF92QVM
 HY89MNPoMV56QNAw8di8kHyUcASHkvgva7nx0zVefH0OjCTcc2EeKbkkR51Kcbzo7D
 YfL6AJQifexgw==
Date: Mon, 24 Mar 2025 15:31:14 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <174284827311.819192.14616231717400662961.robh@kernel.org>
References: <20250324125313.82226-1-krzysztof.kozlowski@linaro.org>
 <20250324125313.82226-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250324125313.82226-2-krzysztof.kozlowski@linaro.org>
Cc: linux-iio@vger.kernel.org, Petre Rodan <petre.rodan@subdimension.ro>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Anshul Dalal <anshulusr@gmail.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>,
 Robert Budai <robert.budai@analog.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Andreas Klinger <ak@it-klinger.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] dt-bindings: iio: Use
 unevaluatedProperties for SPI devices
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


On Mon, 24 Mar 2025 13:53:13 +0100, Krzysztof Kozlowski wrote:
> SPI devices should use unevaluatedProperties:false instead of
> additionalProperties:false, to allow any SPI device properties listed in
> spi-peripheral-props.yaml.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/iio/dac/adi,ad3552r.yaml      | 2 +-
>  Documentation/devicetree/bindings/iio/dac/adi,ltc2664.yaml      | 2 +-
>  Documentation/devicetree/bindings/iio/dac/adi,ltc2672.yaml      | 2 +-
>  .../devicetree/bindings/iio/dac/microchip,mcp4821.yaml          | 2 +-
>  Documentation/devicetree/bindings/iio/dac/rohm,bd79703.yaml     | 2 +-
>  Documentation/devicetree/bindings/iio/imu/adi,adis16550.yaml    | 2 +-
>  .../devicetree/bindings/iio/pressure/honeywell,hsc030pa.yaml    | 2 +-
>  .../devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
