Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FF9298F7A
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Oct 2020 15:37:00 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B822C36B37;
	Mon, 26 Oct 2020 14:37:00 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2125C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 14:36:58 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id k27so10657102oij.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 07:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3tEkDqcCTG0IzQXPAwhJWmsvNZknIocrF7E2OMjuhE0=;
 b=AaIKkVgF85IgK21d+3Xelvn5p1/rIMCfpy3wPEa9fcvHYColn9pu2GFAFpbc/9iNzC
 Koy7nJ3/jBCqrVtlX0q7BxCAHPuo7vihCHAfX2DHjVDOcT8kj9Z+FZtsii897dZCJFU1
 NWxpl4f5RoHmnwKmeaFMF9NJCoGl3QOILKWvyuH/tpiDt4X3CMpyLpl6zM3Vo+bbBJqz
 8o4pqHmDtEho/KhdztNaOwzRIM/SFGi0w2mTVJWl8c2vaNY+jOqdi0lDiXdQR8+B88U0
 FW6hsStdtNNQTS4EtXNF7cw3E96wouMVcEQ932S/p8RHoAtVdEBxxJsvLlJC+3zPRk2h
 6VYg==
X-Gm-Message-State: AOAM530x/8l4MnZ8K/x7kyydNqcYYwWuQMU7kue7mCV8rQck9Qhkcxw5
 8+Gx+XeFHF3KKupdvKUU8Fh6IDoCew==
X-Google-Smtp-Source: ABdhPJzBqpRozB+mA8uEtko0jSmowYbYh7fKvDh0onqyFGNDBAaBRoW4U6MOniEhL45Ri9gx/NcHRQ==
X-Received: by 2002:aca:a893:: with SMTP id r141mr10621763oie.50.1603723017545; 
 Mon, 26 Oct 2020 07:36:57 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s27sm2574459otg.80.2020.10.26.07.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:36:56 -0700 (PDT)
Received: (nullmailer pid 121443 invoked by uid 1000);
 Mon, 26 Oct 2020 14:36:56 -0000
Date: Mon, 26 Oct 2020 09:36:56 -0500
From: Rob Herring <robh@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <20201026143656.GA118160@bogus>
References: <20201021102855.18026-1-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021102855.18026-1-a.fatoum@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: arm: stm32: add
 simple-mfd compatible for tamp node
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

On Wed, Oct 21, 2020 at 12:28:55PM +0200, Ahmad Fatoum wrote:
> The stm32mp1 TAMP (Tamper and backup registers) does tamper detection
> and features 32 backup registers that, being in the RTC domain, may
> survive even with Vdd switched off.
> 
> This makes it suitable for use to communicate a reboot mode from OS
> to bootloader via the syscon-reboot-mode binding. Add a "simple-mfd"
> to support probing such a child node. The actual reboot mode
> node could then be defined in a board.dts or fixed up by the bootloader.

'simple-mfd' implies there is no dependency on the parent node for the 
child (such as the regmap perhaps). Is that the case here?

> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
> v1 available here:
> https://lore.kernel.org/linux-arm-kernel/20200916142216.25142-1-a.fatoum@pengutronix.de/
> 
> v1 -> v2:
>  - new patch, rebased on top of
>    https://lore.kernel.org/r/20201014125441.2457-1-arnaud.pouliquen@st.com
> ---
>  .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml       | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index 6634b3e0853e..4684017a42e4 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -19,8 +19,11 @@ properties:
>                - st,stm32mp151-pwr-mcu
>                - st,stm32-syscfg
>                - st,stm32-power-config
> -              - st,stm32-tamp
>            - const: syscon
> +      - items:
> +          - const: st,stm32-tamp
> +          - const: syscon
> +          - const: simple-mfd
>  
>    reg:
>      maxItems: 1
> -- 
> 2.28.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
