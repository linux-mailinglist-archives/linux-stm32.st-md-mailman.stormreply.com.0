Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3C26D4EC9
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 19:18:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7397C6A610;
	Mon,  3 Apr 2023 17:18:48 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8A28C6A60B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 17:18:46 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id iw3so28737814plb.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Apr 2023 10:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680542325;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3rW3em2VILxt0UnmLbwVBQSzkZ1Aze3c4iqs/OGaKgQ=;
 b=guWPpHelsN8D4CzukM+p9HwO+O0+t1EOvCaPqycmbYFVAXF5fCh073bwn6x3o4QTJ8
 nvtkG5glJFtW3S4SL/2DK7YRgBwk+QqDy3xPs4Kw6rNem+i65ZzqrnUrsjTndKoYZf59
 v4WwjYEg9iWwRy7SfoA6rNCTKPhWCa7iCNioJU2SCeYlNuZKbJSFkcVUAYhjUHoz2x0J
 AnVSZqfWtCrh0lphbxJh8bkGSrQTSw1DO0J5msp2Y4wJQjCsOBgFqh+MDN4w2+0wcb/w
 C/syvLGgPDe5gWG8EIACnyPSGNljH20EWGsAcw6+LaYSx+3o93zE2tnQXHcvuEZX+lWm
 xn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680542325;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3rW3em2VILxt0UnmLbwVBQSzkZ1Aze3c4iqs/OGaKgQ=;
 b=FmPPSD3UGCzhg6MDFEu49YipBEMZSc1+8I2fSgvKnI3oSobKc9tP5iXgjIf5/Nlcxz
 lkSlugQvgCBcs4IH9HtSu3tzJs/i56nMuAIVCxiY4gpXKUcYvAKg0OIpRWHgnzTKk+NO
 u1x/Gj70mwLIoGX8ePa7g2ouY//d2oGVfqO0h7EwyYJoK1aU81qzLcNTHO6a43dxqHx6
 X04E4cDUdrAYtYk2wXkKMqpGvv2DFNCJXprvdCUjEnBk7SF96FIMjLPub/gscvb4z5ge
 dyi12A5BJZCA/WW5VfKBiBaJKtczDFLQrxMVcXy+FQQnGjRNqZTCv1IRlPHjmh4DLu5s
 3k/A==
X-Gm-Message-State: AAQBX9ecp+rCORwSNOxESJfEN/vbY489ZbAe8V+TdgBevoBfmy4bQMiz
 5T1Z0F12IUkZqER6QvQmeinztw==
X-Google-Smtp-Source: AKy350bMB5zNEq0ZE1UFYbMQNdutHQBU+wTgTdP/JcPYscsdxGvNCxZ7pEDBeiPHb5YKMtqVT/ZR9Q==
X-Received: by 2002:a17:90b:1b09:b0:23f:b609:e707 with SMTP id
 nu9-20020a17090b1b0900b0023fb609e707mr43389916pjb.2.1680542325652; 
 Mon, 03 Apr 2023 10:18:45 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2a9e:349f:4c3:53c7])
 by smtp.gmail.com with ESMTPSA id
 3-20020a17090a174300b0023f545c055bsm9837249pjm.33.2023.04.03.10.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 10:18:45 -0700 (PDT)
Date: Mon, 3 Apr 2023 11:18:42 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20230403171842.GB3679607@p14s>
References: <20230403162423.3325968-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403162423.3325968-1-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: remoteproc: st,
	stm32-rproc: Typo fix
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

On Mon, Apr 03, 2023 at 06:24:23PM +0200, Arnaud Pouliquen wrote:
> Fix "communnication" typo error.
> 
> Fixes: aca8f94e5b69 ("dt-bindings: remoteproc: stm32-rproc: add new mailbox channel for detach")
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> updates vs V1: address Krzysztof comments
> - Add missing "st,stm32-rproc" device prefix in subject
> - Drop line break between "Fixes" and "Signed-off-by"
> - Add Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

And this one as well.

Thanks,
Mathieu

> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index 66b1e3efdaa3..ff95648f4967 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -72,9 +72,9 @@ properties:
>                ready for shutdown
>        - description: |
>            A channel (d) used by the local proc to notify the remote proc that it
> -          has to stop interprocessor communnication.
> +          has to stop interprocessor communication.
>            Unidirectional channel:
> -            - from local to remote, where ACK from the remote means that communnication
> +            - from local to remote, where ACK from the remote means that communication
>                as been stopped on the remote side.
>      minItems: 1
>  
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
