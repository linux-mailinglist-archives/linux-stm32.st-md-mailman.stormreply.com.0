Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C15E18D8532
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 16:36:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B24DC6B47E;
	Mon,  3 Jun 2024 14:36:07 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01627C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2024 14:35:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 574B3CE0B03;
 Mon,  3 Jun 2024 14:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EBEC2BD10;
 Mon,  3 Jun 2024 14:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717425355;
 bh=CqpiIEY0jUYpxZBkg+/zP23MGObqx0ALYW+Tv52LcX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OQ9MhxV/czJfHAJDX9p8R4lCsPJSaqEO/MuihWFvW7bASDSvJjLQgE2YbFomuKZg+
 Pg35xYo1x84qJAChiaCl334NvQxvoizQPoXW+xyGdGqKZ7A2Sd6hkNIc8NQMXQw4Ud
 /UG0ffOCyUKC8RicTezLqXg8ydyrmIjD0b0mrsdTTy5IbmFsgNAnGxa9ttN2IZ9Yfc
 GZWid1iqiNfmVItya0eFEDZVqbZPeGj7dEPtri75WiaYy1gVOO1CyjshHwoNFSyUO6
 t5DGDVpqspGrPdL5ePtcjA6THAWpaopvEhyvbub257TlFDam+SxYSXRPoHypIUOh5H
 UTVOy9VO/4glg==
Date: Mon, 3 Jun 2024 09:35:53 -0500
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20240603143553.GA391578-robh@kernel.org>
References: <20240521122458.3517054-1-arnaud.pouliquen@foss.st.com>
 <20240521122458.3517054-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240521122458.3517054-4-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 op-tee@lists.trustedfirmware.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v5 3/7] dt-bindings: remoteproc:
 Add processor identifier property
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

On Tue, May 21, 2024 at 02:24:54PM +0200, Arnaud Pouliquen wrote:
> Add the "st,proc-id" property allowing to identify the remote processor.
> This ID is used to define an unique ID, common between Linux, U-boot and
> OP-TEE to identify a coprocessor.
> This ID will be used in request to OP-TEE remoteproc Trusted Application
> to specify the remote processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml     | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> index 36ea54016b76..409123cd4667 100644
> --- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
> @@ -48,6 +48,10 @@ properties:
>            - description: The offset of the hold boot setting register
>            - description: The field mask of the hold boot
>  
> +  st,proc-id:
> +    description: remote processor identifier
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
>    st,syscfg-tz:
>      deprecated: true
>      description:
> @@ -182,6 +186,8 @@ allOf:
>          st,syscfg-holdboot: false
>          reset-names: false
>          resets: false
> +      required:
> +        - st,proc-id

New required properties are an ABI break. If that is okay, explain why 
in the commit message.

>  
>  additionalProperties: false
>  
> @@ -220,6 +226,7 @@ examples:
>        reg = <0x10000000 0x40000>,
>              <0x30000000 0x40000>,
>              <0x38000000 0x10000>;
> +      st,proc-id = <0>;
>        st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
>        st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
>      };
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
