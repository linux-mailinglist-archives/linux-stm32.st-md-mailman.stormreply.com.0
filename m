Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 601218D257E
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 22:09:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06ADCC6B47E;
	Tue, 28 May 2024 20:09:11 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3041FCFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 20:09:03 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-701ae8698d8so1001586b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 13:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716926942; x=1717531742;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xA96EipLEsw2OGrKZRs6fY4D8prbnQiUmnEE7uuFffo=;
 b=bk+OMvhajF/vvGKJQ/Xh0vbcZOk5mwY0mhQwIQkKGGJr+Wdllld6XgYqA0ef2DoLG0
 C7O6GKHguXu1WBWJqDWt2j3jsKoSyPjfqzpZ/vNC0JUXY99UR6MKNCFnf1sWrr5Hmoyb
 dQQJY7cDep//V/QcDn9uoox9/IP4DGOfXE3EECoBBsfWXKCKBfZR0yZK/rghEyu++5xn
 NtBYHu7FEja2rGQKl8SASJd13tJAcuIJwJzh4+xm0AoHEETkhg1fnRrDApgBSHLhcsBh
 M2lWVNt1Aa5Ev5Tm5QTsEPnPUuQEtpLQp60jyLVksrxfmOYwOyWXom4AdSPyJN8AQVJR
 +goA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716926942; x=1717531742;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xA96EipLEsw2OGrKZRs6fY4D8prbnQiUmnEE7uuFffo=;
 b=K37B2PiYXsHYvQsv2zm+uWHZXl1nbcZHoTzq6wlnJz99p9af2oSkxYn3f3bd07noqm
 5m9U4UQ5/+SVIR6OEXdGtXxLWyZo4feui7hDzEWyEQ1z2YLnvsBiNfSCA4Urxgj7CApK
 07QEg8+i791sRxw0mnN8HjqucH4SE1JXkJS28dGirW5zMqrvSxBsJzE4y3mDB3TpCJxj
 HUVfhEhRFJl65hH9lobJzh8qHlDOkSbo2k4qK201/8l5p6LA2j2HpQKourFjLalcniE4
 l25e7sY6H/mdegu0wdozxbCF43Rum2tATH2na4+eO4ba1TfdFU/+TXAPRXFVfG7N2Dvz
 fCaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgHx1fVK10ua9I7pFR/4soemOZaNVFVShoVIRUFkp7cxB1SC7QDtfXUI26t2g1HQ19sfC9dX/jOC4SaOBhv90dGCJnohWVtKL7DNMnbRfuzrtmj4foyl/T
X-Gm-Message-State: AOJu0YyoBwyzj117gGJTr6S4H6ZFRwd6a4a8Ie2FwKqfglFFBwMORQlb
 bzLM4CnBTG7XnMXvIhzgvBGUEeEQGJ9gUSCorK3tsUAA+zCNMpif8ryqdYYPMYY=
X-Google-Smtp-Source: AGHT+IFPVNyBNZy5PIGcWn6L7NKMnCn3b8L3Z1jh5Va5V2SFfi/lSDvuB1Ekq1vIgeuAW0XCfwjb8A==
X-Received: by 2002:a05:6a21:4987:b0:1a9:c4cc:721d with SMTP id
 adf61e73a8af0-1b212f64a6fmr13050339637.57.1716926941624; 
 Tue, 28 May 2024 13:09:01 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4c7:2691:aa4a:e6b7])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fcbeb128sm6786029b3a.135.2024.05.28.13.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:09:01 -0700 (PDT)
Date: Tue, 28 May 2024 14:08:58 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <ZlY52iq2oVIi9I1k@p14s>
References: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
 <20240521081001.2989417-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240521081001.2989417-3-arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 2/7] dt-bindings: remoteproc: Add
 compatibility for TEE support
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

On Tue, May 21, 2024 at 10:09:56AM +0200, Arnaud Pouliquen wrote:
> The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
> where the Cortex-M4 firmware is loaded by the Trusted execution Environment
> (TEE).
> For instance, this compatible is used in both the Linux and OP-TEE
> device-tree:
> - In OP-TEE, a node is defined in the device tree with the
>   st,stm32mp1-m4-tee to support signed remoteproc firmware.
>   Based on DT properties, OP-TEE authenticates, loads, starts, and stops
>   the firmware.

I don't see how firmware can be started and stopped.  Please rework.

> - On Linux, when the compatibility is set, the Cortex-M resets should not
>   be declared in the device tree.

This is a description of "what" is happening and not "why".

More comments to come shortly.

Thanks,
Mathieu

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 51 ++++++++++++++++---
>  1 file changed, 43 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index 370af61d8f28..36ea54016b76 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -16,7 +16,12 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: st,stm32mp1-m4
> +    enum:
> +      - st,stm32mp1-m4
> +      - st,stm32mp1-m4-tee
> +    description:
> +      Use "st,stm32mp1-m4" for the Cortex-M4 coprocessor management by non-secure context
> +      Use "st,stm32mp1-m4-tee" for the Cortex-M4 coprocessor management by secure context
>  
>    reg:
>      description:
> @@ -142,21 +147,41 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - resets
>  
>  allOf:
>    - if:
>        properties:
> -        reset-names:
> -          not:
> -            contains:
> -              const: hold_boot
> +        compatible:
> +          contains:
> +            const: st,stm32mp1-m4
>      then:
> +      if:
> +        properties:
> +          reset-names:
> +            not:
> +              contains:
> +                const: hold_boot
> +      then:
> +        required:
> +          - st,syscfg-holdboot
> +      else:
> +        properties:
> +          st,syscfg-holdboot: false
> +        required:
> +          - reset-names
>        required:
> -        - st,syscfg-holdboot
> -    else:
> +        - resets
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp1-m4-tee
> +    then:
>        properties:
>          st,syscfg-holdboot: false
> +        reset-names: false
> +        resets: false
>  
>  additionalProperties: false
>  
> @@ -188,5 +213,15 @@ examples:
>        st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
>        st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>      };
> +  - |
> +    #include <dt-bindings/reset/stm32mp1-resets.h>
> +    m4@10000000 {
> +      compatible = "st,stm32mp1-m4-tee";
> +      reg = <0x10000000 0x40000>,
> +            <0x30000000 0x40000>,
> +            <0x38000000 0x10000>;
> +      st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
> +      st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
> +    };
>  
>  ...
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
