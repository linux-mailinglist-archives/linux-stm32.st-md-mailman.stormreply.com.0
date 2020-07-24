Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E03AA22C1F4
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jul 2020 11:20:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98339C36B27;
	Fri, 24 Jul 2020 09:20:27 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15E00C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 09:20:26 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1jytsP-00047h-Im; Fri, 24 Jul 2020 11:20:25 +0200
To: Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200723193737.190291-1-marcin.sloniewski@gmail.com>
 <20200723193737.190291-2-marcin.sloniewski@gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <b1bfc804-5bb3-b703-684e-8d9bb2b44fad@pengutronix.de>
Date: Fri, 24 Jul 2020 11:20:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200723193737.190291-2-marcin.sloniewski@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: robh@kernel.org, stephan@gerhold.net, mani@kernel.org,
 heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, lkundrak@v3.sk, devicetree@vger.kernel.org,
 robh+dt@kernel.org, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 allen.chen@ite.com.tw, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 2/3] dt-bindings: arm: stm32: document
 Odyssey compatible
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

Hi,

On 7/23/20 9:37 PM, Marcin Sloniewski wrote:
> Document device tree bindings of Seeed SoM and carrier board.
> 
> Signed-off-by: Marcin Sloniewski <marcin.sloniewski@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 790e6dd48e34..22b9aaa75eee 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -39,6 +39,8 @@ properties:
>            - enum:
>                - arrow,stm32mp157a-avenger96 # Avenger96
>                - lxa,stm32mp157c-mc1
> +              - seeed,stm32mp157c-odyssey
> +              - seeed,stm32mp157c-odyssey-som

Did you run dtbs_check over it? I think this should fail.

You want something like:

# Odyssey SoM boards
- items:
  - enum:
     - seeed,stm32mp157c-odyssey
  - const: seeed,stm32mp157c-odyssey-som
  - const: st,stm32mp157

(Note 3 items vs 2 in yours)

>                - shiratech,stm32mp157a-iot-box # IoT Box
>                - shiratech,stm32mp157a-stinger96 # Stinger96
>                - st,stm32mp157c-ed1
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
