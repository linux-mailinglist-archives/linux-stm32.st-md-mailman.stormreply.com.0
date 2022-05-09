Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7EA5201DC
	for <lists+linux-stm32@lfdr.de>; Mon,  9 May 2022 18:04:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01710C5F1D3;
	Mon,  9 May 2022 16:04:45 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7156C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 May 2022 16:04:42 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id 204so9831832pfx.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 May 2022 09:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UdDrFvMTPlFEuDpVKn6UuLvbfztwhknrVS+8QAPpwmc=;
 b=J3EEQLp2oqp41altc+Q/q8W3s+Sp3eLTohaUdz2/+Rwdmd4uuvgFyd7339k5RbOF5J
 i0AaAoLjX0X1wJgDB49H/+8/KghhdbUfVuMXZ6wcyVjMekL1Y4tpKKCuRDSlVjO38mEI
 kqbccxnmKopU6x3mIy/nRdpyecpwLAQhFCSofqR1aHqCAmthMpMQ5pATK2xOQOOiA3t5
 kS0E483Ul9E+JueJIPeLdAW7+AqXJqBFvvA8X6iSYaWjtxkdccVYu/7JwmC5bb+fTWfl
 3bcuz8MH0oRmoCEcgkEZ+/fcai/GFTzVp9fGDggQyEr+sNilKVrNN0dXynuqcIzL0ed8
 WPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UdDrFvMTPlFEuDpVKn6UuLvbfztwhknrVS+8QAPpwmc=;
 b=CWudXuqUd4iJZzTUapFixbodF1x6WVVvA464CUc2XsLEcYumrrI7pJry+5VOIQtJl0
 1nL9MsAhycgnuFzjQ7vdzcNBlKLrNyXasgz9XVr7IJaOw4q82OUfl3Ctn8heqrMvt/CM
 vTnwc8t9w7C5L9QmrHgmwEt+oO319FoZYgJDAlVhxec8W8veQQQxPnqkXQPtqxx6e6QP
 8RYd1z1MWXceuYifVGulKTXs0d55n9rKKHXaWuuXTM57TQ/zzeiL1kPzlC5hrKIj+vGG
 2YzvNxe2pynHQ2+Is5C1qOqoYjZr04YG2DaoziMwHsAdipW7VyWWCPEtSWqOnCjCwwzI
 3uTw==
X-Gm-Message-State: AOAM530Og4ItEMyjk8mE+hkYoZLI5YI6onrLINr9qnOkZFL5fDSZ0ceF
 s1aPLx3pJfgcKAIa1wI+SHM3pQ==
X-Google-Smtp-Source: ABdhPJwMqknPNBUBGaG7wAm1Hvz84PnOG/5jowsuGzw29PwBE4WkdUvnp59PCpFdWkXcrI/bAl0vIA==
X-Received: by 2002:aa7:9085:0:b0:510:90d1:f445 with SMTP id
 i5-20020aa79085000000b0051090d1f445mr11764534pfa.67.1652112281331; 
 Mon, 09 May 2022 09:04:41 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a170902dac100b0015e8d4eb2dfsm7330090plx.297.2022.05.09.09.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 09:04:39 -0700 (PDT)
Date: Mon, 9 May 2022 10:04:37 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20220509160437.GA3043772@p14s>
References: <20220505113639.1344281-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505113639.1344281-1-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: remoteproc: st,
 stm32-rproc: Fix phandle-array parameters description
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

On Thu, May 05, 2022 at 01:36:39PM +0200, Arnaud Pouliquen wrote:
> Replace the FIXME by appropriate description.
> 
> Fixes: 39bd2b6a3783 ("dt-bindings: Improve phandle-array schemas")
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml      | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

I have applied this patch.

Thanks,
Mathieu

> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index be3d9b0e876b..da50f0e99fe2 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -43,8 +43,8 @@ properties:
>      items:
>        - items:
>            - description: Phandle of syscon block
> -          - description: FIXME
> -          - description: FIXME
> +          - description: The offset of the trust zone setting register
> +          - description: The field mask of the trust zone state
>  
>    interrupts:
>      description: Should contain the WWDG1 watchdog reset interrupt
> @@ -101,8 +101,8 @@ properties:
>      items:
>        - items:
>            - description: Phandle of syscon block
> -          - description: FIXME
> -          - description: FIXME
> +          - description: The offset of the power setting register
> +          - description: The field mask of the PDDS selection
>  
>    st,syscfg-m4-state:
>      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> @@ -111,8 +111,8 @@ properties:
>      items:
>        - items:
>            - description: Phandle of syscon block with the tamp register
> -          - description: FIXME
> -          - description: FIXME
> +          - description: The offset of the tamp register
> +          - description: The field mask of the Cortex-M4 state
>  
>    st,syscfg-rsc-tbl:
>      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> @@ -122,8 +122,8 @@ properties:
>      items:
>        - items:
>            - description: Phandle of syscon block with the tamp register
> -          - description: FIXME
> -          - description: FIXME
> +          - description: The offset of the tamp register
> +          - description: The field mask of the Cortex-M4 resource table address
>  
>    st,auto-boot:
>      $ref: /schemas/types.yaml#/definitions/flag
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
