Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 595DD7BBE1D
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Oct 2023 19:57:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C05EC6A613;
	Fri,  6 Oct 2023 17:57:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E44F5C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Oct 2023 17:56:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B4B4261173;
 Fri,  6 Oct 2023 17:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0AAFC433C8;
 Fri,  6 Oct 2023 17:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696615017;
 bh=M7cM0uzrZk4lKMKjA93C2oMjoATI9WLt5iEp4Pa0My4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ExVRjuA7T/H0LaeJ0jyf3NZMtrc0lM6wOK+ekvS3Hq8ZCLXMYeoBcRONIckkYnR9e
 R9KWM6wDzcE5q6jwvZF8lMhKkQ1lgD5XgMAmF7JJPxu8HLrXCruZvJdtW+N4EFMC/7
 +MgEyPdqIsG0GVwqs1Zo00lHWuag9pWExwjTRXjr6/1rfLAWPo85X4OULjN1ooa7MU
 QE2wvKipHSHuTUa2DvBuP+DGUrlVwrPA7dr5beW5tSBoKlXJNaQzu4hKecZwWebxPT
 cSOeYmHLA64elgkUGOYkMirnChTWEZcTn5lG+t94KgeZRNsGwZCdyYGcGdRGZ4Z1JF
 KS5ex2P3lOVhA==
Received: (nullmailer pid 70487 invoked by uid 1000);
 Fri, 06 Oct 2023 17:56:54 -0000
Date: Fri, 6 Oct 2023 12:56:54 -0500
From: Rob Herring <robh@kernel.org>
To: Martin Kaiser <martin@kaiser.cx>
Message-ID: <169661501435.70432.16755877986670034633.robh@kernel.org>
References: <20231006082247.3830719-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231006082247.3830719-1-martin@kaiser.cx>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: st,
	stm32: fix phandle-array warning
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


On Fri, 06 Oct 2023 10:22:48 +0200, Martin Kaiser wrote:
> make CHECK_DTBS=y st/stm32f469-disco.dtb
> 
> brings up a warning about a missing argument:
> 
> stm32f469-disco.dtb: pinctrl@40020000: st,syscfg:0: [21, 8] is too short
> 
> The description of the third entry indicates that this entry is optional.
> The code in stm32_pctrl_dt_setup_irq parses st,syscfg and treats the third
> entry as optional. It defaults to 0xf if not present in the devicetree.
> 
> Update the schema to require at least two entries, use the same syntax as
> the description of renesas,ipmmu-main in
> Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> 
> I tested the following cases, all of them returned the expected result:
> 
>    st,syscfg = <&syscfg>;              (too short)
>    st,syscfg = <&syscfg 0x8>;          (ok)
>    st,syscfg = <&syscfg 0x8 0x0>;      (ok)
>    st,syscfg = <&syscfg 0x8 0x0 0x0>;  (too long)
> 
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
