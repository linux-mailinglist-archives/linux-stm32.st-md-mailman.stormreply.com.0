Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3222AC10D
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Nov 2020 17:37:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86FCFC3FAE2;
	Mon,  9 Nov 2020 16:37:38 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7425C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Nov 2020 16:37:35 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id t143so10821489oif.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Nov 2020 08:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tq7rUzr/gw10MEoyCZnSq/EiwnB2bInd24MzCsWxH8k=;
 b=Z8KEfN4dmx43TgNsiSzpGyUxIrMm1iTLDy4mswpX00mcmrCOy5is6s007lBwMIac6H
 k+7ip5UNPdoAWo7IPQkcZrZVo0M8ZikUaI/n1mmsgyVi5kbyS/SWK9v8/zozw6Jy8W+U
 uUaQhpl0Xo1+uOVvgk/M3NQWrDuvhtDSv8P+kn0aRa9MhAg/BCmeDtZNEwznmVxriLtr
 pC9LTYDsdnxRSlmLsmkkf8dz52mnh3ZH+CdivwOJry5CViyon7S6qczpMKaOSUDO3a5Y
 z8LqfohK5eAYYq5AbCU+WTWC6sbYPn9WHEsrQ8ubQrFngkhgO3ZEMO70rTrh6tuoO+Ta
 Likw==
X-Gm-Message-State: AOAM533Fbq+MFUXfNU9c0ekvCe4pCUIk8ERXH/ulruBQZV/IliRWILtm
 RQGO0ook/VtMP0A+GbdhYA==
X-Google-Smtp-Source: ABdhPJwLqQONMstaMXV/iyNOCJ8sCnMO9TUIGoYg1lmfIEQEeF/LXCOWXsWVAAtsy+AIrYmyia3DLQ==
X-Received: by 2002:a05:6808:b24:: with SMTP id
 t4mr8942748oij.93.1604939854580; 
 Mon, 09 Nov 2020 08:37:34 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e15sm1176458otj.43.2020.11.09.08.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 08:37:33 -0800 (PST)
Received: (nullmailer pid 1410944 invoked by uid 1000);
 Mon, 09 Nov 2020 16:37:33 -0000
Date: Mon, 9 Nov 2020 10:37:33 -0600
From: Rob Herring <robh@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20201109163733.GA1404197@bogus>
References: <20201104113932.30702-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104113932.30702-1-a.fatoum@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] dt-bindings: arm: stm32: lxa,
 stm32mp157c-mc1: add extra SiP compatible
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

On Wed, Nov 04, 2020 at 12:39:31PM +0100, Ahmad Fatoum wrote:
> The Linux Automation MC-1 is built around a SIP with CPU, RAM, PMIC,
> Oscillator and EEPROM. Add a further compatible identifying the SiP,
> so boot firmware can match against it to apply fixups if necessary.
> 
> To avoid intermittent dtbs_check breakage in the sole upstream device
> tree that uses that SiP, patch it here as well.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
> I know that bindings and device tree patches should be separate. Does
> this apply here as well? Should I split the dts change into a follow-up
> commit? 

Yes.

> Is it ok that dtbs_check will report an intermittent breakage?

If the binding comes first, it won't break.

But generally, 'dtbs_check' being warning free is not yet a requirement. 
That will probably first have to be per platform.

> ---
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 8 +++++++-
>  arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts              | 2 +-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> index 009b424e456e..9127094f0208 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
> @@ -40,7 +40,6 @@ properties:
>        - items:
>            - enum:
>                - arrow,stm32mp157a-avenger96 # Avenger96
> -              - lxa,stm32mp157c-mc1
>                - shiratech,stm32mp157a-iot-box # IoT Box
>                - shiratech,stm32mp157a-stinger96 # Stinger96
>                - st,stm32mp157c-ed1
> @@ -52,6 +51,13 @@ properties:
>            - const: st,stm32mp157c-ev1
>            - const: st,stm32mp157c-ed1
>            - const: st,stm32mp157
> +      - description: Octavo OSD32MP15x System-in-Package based boards
> +        items:
> +          - enum:
> +              - lxa,stm32mp157c-mc1 # Linux Automation MC-1
> +          - const: oct,stm32mp15xx-osd32

'oct' is not docuemnted in vendor-prefixes.yaml.

> +          - enum:
> +              - st,stm32mp157
>        - description: Odyssey STM32MP1 SoM based Boards
>          items:
>            - enum:
> diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> index 1e5333fd437f..cda8e871f999 100644
> --- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
> @@ -15,7 +15,7 @@
>  
>  / {
>  	model = "Linux Automation MC-1 board";
> -	compatible = "lxa,stm32mp157c-mc1", "st,stm32mp157";
> +	compatible = "lxa,stm32mp157c-mc1", "oct,stm32mp15xx-osd32", "st,stm32mp157";
>  
>  	aliases {
>  		ethernet0 = &ethernet0;
> -- 
> 2.28.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
