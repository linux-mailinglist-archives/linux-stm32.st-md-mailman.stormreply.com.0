Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC6C5531CF
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jun 2022 14:20:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10E1DC03FC0;
	Tue, 21 Jun 2022 12:20:34 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75608C03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 12:20:32 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id fu3so27085028ejc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 05:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FqXRBoWYjZEUDh9NP8NDg9hGa7Z+YCO68X9tbRPRfAY=;
 b=U2psEGjiEB6aDgr4BC2Pvn4cA98M35o8czCPFGOoQ0kv0jNBOKMsd4in3lJIya44Nc
 UqP13NIyjBiN3+HQG2sGzKR04QF++cozPZObBscKTi+dNbQuQMJ6U3ZHOe86Dmewvl2m
 ceOPy7gQRTgCWiQ168F5z9za/Y3Lhvaf9RUzCAHRXz9N3MoDvaY3Ooa3ElYbwUWu2hPl
 8sOuMP9fok3rdSWwfrTFwS2nkOvVQv/tAmrPD71w3E1DXMT/ysgIY2zTtcVcPEo+zMgz
 B9t+ftUEp+C3subGkT2MwJQcafLieUrmeFF2lZPeSODzkR8LFOAfJxDM1q78SoyF0DHs
 eaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FqXRBoWYjZEUDh9NP8NDg9hGa7Z+YCO68X9tbRPRfAY=;
 b=tDw3zaJpxh1aHPx2hMErgUxbdNBDIq4q7benzjAy6AWziOIrLMb5aMHTHN1EWAAW49
 s5VOIjh05vJEKkeN+2f1dUx0VkNfiWPZxAy66v8+1bXPI6NSoLx5m7JT3I56/vilV9z8
 cC5ViWD8Qx9S72vOZRGn9i82p7GpavJ6HpTrZZu6VZaLAhr5S2eBUYE/lHjH/llLdXXq
 5HnccPMqBzx0dPqLUVQ7HXWbv1JlT8zrzxh9BaYEvti9LDTXjpbNybPrTU7mnFmzps4N
 OgkvCcba+JLJ2N2OvdPCJsXkZx1fTbn00MQLH/UaSdR7UmY93dM1czDJPnFK+OMaFZeZ
 s/tg==
X-Gm-Message-State: AJIora/ZofIjnnLCKsEy8ZLa5uSgmwSsrjojsXh74cSxgj0FviAYa4Lf
 c7See+cRXDyZi6Zc6DcPXm21GZxVeYHymg==
X-Google-Smtp-Source: AGRyM1uAz2TCiWXc4bm0hIjEoI/vEDZwkP9e/hQxnyf2PwWpbtubuPKMpAhnsMet2JbboOPhk5rQXQ==
X-Received: by 2002:a17:907:3d8a:b0:70e:6b1:b004 with SMTP id
 he10-20020a1709073d8a00b0070e06b1b004mr26052667ejc.61.1655814032028; 
 Tue, 21 Jun 2022 05:20:32 -0700 (PDT)
Received: from [192.168.0.220] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 cf20-20020a170906b2d400b006f3ef214e42sm7593503ejb.168.2022.06.21.05.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 05:20:31 -0700 (PDT)
Message-ID: <4097c29a-0630-d4a1-e5bb-f8446aa54d73@linaro.org>
Date: Tue, 21 Jun 2022 14:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20220621101538.481143-1-s.trumtrar@pengutronix.de>
 <20220621101538.481143-2-s.trumtrar@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220621101538.481143-2-s.trumtrar@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v3 2/3] ARM: dts: stm32: add
	STM32MP1-based Phytec board
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

On 21/06/2022 12:15, Steffen Trumtrar wrote:
> Add the Phytec STM32MP1-3 Dev board. The devboard uses a Phytec stm32m15-som.

Use Linux coding style.

> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  .../dts/stm32mp157c-phycore-stm32mp1-3.dts    | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
> 
> diff --git a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
> new file mode 100644
> index 000000000000..e91c0ef499c9
> --- /dev/null
> +++ b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp1-3.dts
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) Phytec GmbH 2019-2020 - All Rights Reserved
> + * Author: Dom VOVARD <dom.vovard@linrt.com>.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/pinctrl/stm32-pinfunc.h>
> +#include "stm32mp157.dtsi"
> +#include "stm32mp15xc.dtsi"
> +#include "stm32mp15xxac-pinctrl.dtsi"
> +#include "stm32mp157c-phycore-stm32mp15-som.dtsi"
> +
> +/ {
> +	model = "PHYTEC phyCORE-STM32MP1-3 Dev Board";
> +	compatible = "phytec,phycore-stm32mp1-3", "st,stm32mp157";

Confusing approach. Either this is Som or dev board. If this is Som,
name it (so not "Dev Board"), although usually SoMs cannot boot by
themself, so this is a board.

If this is board, then phytec,phycore-stm32mp1-3 compatible is not
enough - you should have:
1. board compatible
2. SoM compatible
3. SoC compatible

> +};
> +
> +&cryp1 {
> +	status = "okay";
> +};
> +
> +&dts {
> +	status = "okay";
> +};
> +
> +&fmc {
> +	status = "disabled";
> +};
> +
> +&gpu {
> +	status = "okay";
> +	contiguous-area = <&gpu_reserved>;
> +};
> +
> +&i2c4_eeprom {
> +	status = "okay";
> +};
> +
> +&i2c4_rtc {
> +	status = "okay";
> +};
> +
> +&qspi {
> +	status = "okay";
> +};
> +
> +&sdmmc1 {
> +	secure-status = "disabled";
> +};
> +
> +&sdmmc2 {
> +	status = "okay";
> +	secure-status = "disabled";
> +};

Which proves that aliases for MMC should be here.


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
