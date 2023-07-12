Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 751CC7501CB
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 10:38:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 369AFC6B459;
	Wed, 12 Jul 2023 08:38:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7F4DC6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 08:38:45 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1qJVMm-0000ZG-1x; Wed, 12 Jul 2023 10:38:32 +0200
Message-ID: <92f7f4cd-c9cc-8a1a-74c7-39eed955cd6a@pengutronix.de>
Date: Wed, 12 Jul 2023 10:38:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Sean Nyekjaer <sean@geanix.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230712062954.2194505-1-sean@geanix.com>
 <20230712062954.2194505-7-sean@geanix.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20230712062954.2194505-7-sean@geanix.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, dantuguf14105@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 7/8] dt-bindings: arm: stm32: add extra
 SiP compatible for oct, stm32mp157c-osd32-red
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

Hello Sean,

On 12.07.23 08:29, Sean Nyekjaer wrote:
> Add binding support for the Octavo OSD32MP1-RED development board.
> 
> General features:
>  - STM32MP157C
>  - 512MB DDR3
>  - CAN-FD
>  - HDMI
>  - USB-C OTG
>  - UART
> 
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Just a heads up: The LXA TAC, another OSD32MP1 board has been merged into
stm32-next yesterday, so applying your series onto that tree may result
in conflicts. You may want to rebase for v4.

Cheers,
Ahmad


> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 13e34241145b..55e45db1af26 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -143,7 +143,8 @@ properties:
>        - description: Octavo OSD32MP15x System-in-Package based boards
>          items:
>            - enum:
> -              - lxa,stm32mp157c-mc1 # Linux Automation MC-1
> +              - lxa,stm32mp157c-mc1       # Linux Automation MC-1
> +              - oct,stm32mp157c-osd32-red # Octavo OSD32MP1 RED board
>            - const: oct,stm32mp15xx-osd32
>            - enum:
>                - st,stm32mp157

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
