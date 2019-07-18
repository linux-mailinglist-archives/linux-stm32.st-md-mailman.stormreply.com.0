Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0699C6D1F5
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jul 2019 18:22:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5AC8C5EE67
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jul 2019 16:21:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF16FC5EE63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jul 2019 16:21:58 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6IGLNUQ000649; Thu, 18 Jul 2019 18:21:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=AJq7HWOmdf4Eh8zS82EF7sEz8rhFjyGqo/y3JZirMqI=;
 b=G1wdX6NO76pAIFagRCQrnHZbuzJMOAUmmpauADX9rWCew3aFMlqZ2oMHn019kBT1aRQy
 BK6bBd0BmcT9DORQXdXCqM74mSKNunuyJyJXLXaE9tnZei3TcQhf/76oDx2BXNFht5Vv
 tjk2f5mkOZjz+Y1xA9adly3Nxx4G6jRdkWQzHA5fEfr9hn5+vcUcaeZ+7L6Tb5OxINCa
 M3+2DJSCQe/1xp54dsy3D1Fhh+J/7AfKm83XCRLLZVvaETiZVRhGX/LWytUHHfbo6p7E
 GpgAIGOpS+PQyJSCUz6gcvg+LQr+do8Li/dRM8blgU/fJ5NzZdP3ow1EDNNhSU+F9P41 fA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tsdeppr0w-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 18 Jul 2019 18:21:50 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB8D734;
 Thu, 18 Jul 2019 16:21:49 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 98AC85344;
 Thu, 18 Jul 2019 16:21:49 +0000 (GMT)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 18 Jul
 2019 18:21:48 +0200
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
References: <20190716215618.29757-1-robh@kernel.org>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <634fce00-182d-80b8-b435-0cbdae57913c@st.com>
Date: Thu, 18 Jul 2019 18:21:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190716215618.29757-1-robh@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-18_08:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: stm32: Fix missing
 'clocks' property in examples
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Rob

On 7/16/19 11:56 PM, Rob Herring wrote:
> Now that examples are validated against the DT schema, an error with
> required 'clocks' property missing is exposed:
> 
> Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
> pinctrl@40020000: gpio@0: 'clocks' is a required property
> Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
> pinctrl@50020000: gpio@1000: 'clocks' is a required property
> Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
> pinctrl@50020000: gpio@2000: 'clocks' is a required property
> 
> Add the missing 'clocks' properties to the examples to fix the errors.
> 
> Fixes: 2c9239c125f0 ("dt-bindings: pinctrl: Convert stm32 pinctrl bindings to json-schema")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Alexandre TORGUE <alexandre.torgue@st.com>

Thanks
Alex


> ---
>   .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml         | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 3ac5d2088e49..91d3e78b3395 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -197,6 +197,7 @@ required:
>   examples:
>     - |
>       #include <dt-bindings/pinctrl/stm32-pinfunc.h>
> +    #include <dt-bindings/mfd/stm32f4-rcc.h>
>       //Example 1
>         pinctrl@40020000 {
>                 #address-cells = <1>;
> @@ -210,6 +211,7 @@ examples:
>                         #gpio-cells = <2>;
>                         reg = <0x0 0x400>;
>                         resets = <&reset_ahb1 0>;
> +                      clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOA)>;
>                         st,bank-name = "GPIOA";
>                 };
>          };
> @@ -227,6 +229,7 @@ examples:
>                         #gpio-cells = <2>;
>                         reg = <0x1000 0x400>;
>                         resets = <&reset_ahb1 0>;
> +                      clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOB)>;
>                         st,bank-name = "GPIOB";
>                         gpio-ranges = <&pinctrl 0 0 16>;
>                 };
> @@ -236,6 +239,7 @@ examples:
>                         #gpio-cells = <2>;
>                         reg = <0x2000 0x400>;
>                         resets = <&reset_ahb1 0>;
> +                      clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOC)>;
>                         st,bank-name = "GPIOC";
>                         ngpios = <5>;
>                         gpio-ranges = <&pinctrl 0 16 3>,
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
