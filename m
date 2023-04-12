Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 560BA6DF947
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Apr 2023 17:03:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3BDBC69063;
	Wed, 12 Apr 2023 15:03:54 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11E5AC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 15:03:52 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 39-20020a9d04aa000000b006a1370e214aso3868390otm.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Apr 2023 08:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681311831; x=1683903831;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Sli1ujJHYCJfuFT3afLYp4TXGvKZ5csEjqsQF+EWkM=;
 b=M1XTDWKEbEtG5qIEgUWLqeKJv2DyN6Jd2VNbB5ZDZYMDrxqiRarBBCxnb4Mx2fwIuZ
 zsn6VetE5U9fb/R2WxDlOwpuO7+Hpd+pe07USdHRfEx3J1MyhHnGnPw+s6EOL7oCGeYU
 6wZgsxWE53ZqadUvyVSEs9YBCXBb3BX5SzZHN7KeBrWA34i7MNMmLGnrJduLZNrNNMkB
 nJBMPZP2xonZ5x+INQ8+9WUDtPGZpT3Cw7mr3Ilv63320UcH2DrCEz/jbMr8jZ4RKMyI
 E2Scrb9HEUDN05Qtgqe5q3pqIYYCx8x8ut0T4cRI00fs8Zl4qRY1waZMtSR3aniZksdr
 gx8w==
X-Gm-Message-State: AAQBX9eeFsV7kaGXSB8attFsnBhfREkFiAXRYKWKshLIsBPB33kICBcF
 ws+EVywELGBPp4KT2CJP4w==
X-Google-Smtp-Source: AKy350Zwe/o1P0qbgECgXkd6AaWJzSa0pHXPD83+bo8PJc2hRV6u+FN474DAvwV32gL3QcZhJuBjKA==
X-Received: by 2002:a05:6830:195:b0:6a4:2d62:d3c9 with SMTP id
 q21-20020a056830019500b006a42d62d3c9mr37626ota.10.1681311831372; 
 Wed, 12 Apr 2023 08:03:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l9-20020a9d7349000000b006a2ddc13c46sm6441097otk.78.2023.04.12.08.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 08:03:50 -0700 (PDT)
Received: (nullmailer pid 2369790 invoked by uid 1000);
 Wed, 12 Apr 2023 15:03:50 -0000
Date: Wed, 12 Apr 2023 10:03:50 -0500
From: Rob Herring <robh@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20230412150350.GA2361252-robh@kernel.org>
References: <20230407201235.1.I483a676579cc7e3ac07e1db649091553743fecc8@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230407201235.1.I483a676579cc7e3ac07e1db649091553743fecc8@changeid>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: stm32: Fix STM32F4 DT
	include file
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

On Fri, Apr 07, 2023 at 08:12:43PM +0200, Patrick Delaunay wrote:
> Minor cosmetic change, aligned with file in U-Boot:
> - remove extra space

extra blank line really.

Please make the subject reflect what the change is. This doesn't really 
'Fix' anything and it's so generic it could be any change. Just 'Remove 
double blank line' would be much better and defines the exact change.

> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  include/dt-bindings/mfd/stm32f4-rcc.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/dt-bindings/mfd/stm32f4-rcc.h b/include/dt-bindings/mfd/stm32f4-rcc.h
> index 309e8c79f27b..36448a5619a1 100644
> --- a/include/dt-bindings/mfd/stm32f4-rcc.h
> +++ b/include/dt-bindings/mfd/stm32f4-rcc.h
> @@ -34,7 +34,6 @@
>  #define STM32F4_AHB1_RESET(bit) (STM32F4_RCC_AHB1_##bit + (0x10 * 8))
>  #define STM32F4_AHB1_CLOCK(bit) (STM32F4_RCC_AHB1_##bit)
>  
> -
>  /* AHB2 */
>  #define STM32F4_RCC_AHB2_DCMI	0
>  #define STM32F4_RCC_AHB2_CRYP	4
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
