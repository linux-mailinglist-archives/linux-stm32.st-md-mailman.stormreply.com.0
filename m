Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6913E35A2D1
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Apr 2021 18:18:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18643C5718B;
	Fri,  9 Apr 2021 16:18:01 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38DB2C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 16:17:59 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 s16-20020a0568301490b02901b83efc84a0so6158656otq.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Apr 2021 09:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nPXWno11S4Od5PcOam+OVspUYzqe84Gw2wWYNw5BBRg=;
 b=acf+R5yIrzkLrSuefVnJo9HBjqZEjwaOM5JLjLkJHSFQv9M+bhucXodwuqBG348m5M
 vj+hHgp1wIfcNlc8ZsELfs4aDIcFHS9cW9Ejq6SU1jbpRrtXSWxOrRXyn5C8Id3NmcNU
 K6cTSP+89SEBoaWHyY9pWNcGWSqY8hkLr9YkFwgoBFTRKExiHKGB4J3JODrgT2iB55Pd
 MS86F/iGw8aMFH6weh2Vxq3WaFEeLNM77CkbX8AXh8ZVkPkVBTyFFIfUhX8xu6BtTEA2
 Tgn4Rv9S3IisOiQ/45qiUp99FJEcDUWFbgFrv0xhVN5BwSPRTxYukti4c+MIZ/jeBGYh
 X1RA==
X-Gm-Message-State: AOAM530ODehVLD+O3WEbeEP2mX0y0R+h4ApDTwPrGoyY2HqNu/NLLEwV
 6XOtaCw+LO8jcRpQVKatlw==
X-Google-Smtp-Source: ABdhPJwf5uML2LSRjZqxpDpvqc9tar6P33ne+FS3tnIzgi6Q+uhrWPe9XI2nGzLTXRfg7kzTMa0uyg==
X-Received: by 2002:a9d:7342:: with SMTP id l2mr5141154otk.175.1617985077974; 
 Fri, 09 Apr 2021 09:17:57 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w1sm37517otq.75.2021.04.09.09.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 09:17:57 -0700 (PDT)
Received: (nullmailer pid 3749394 invoked by uid 1000);
 Fri, 09 Apr 2021 16:17:55 -0000
Date: Fri, 9 Apr 2021 11:17:55 -0500
From: Rob Herring <robh@kernel.org>
To: Erwan Le Ray <erwan.leray@foss.st.com>
Message-ID: <20210409161755.GA3745930@robh.at.kernel.org>
References: <20210406072122.27384-1-erwan.leray@foss.st.com>
 <20210406072122.27384-2-erwan.leray@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406072122.27384-2-erwan.leray@foss.st.com>
Cc: devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: serial: stm32: add fifo
 threshold configuration
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

On Tue, Apr 06, 2021 at 09:21:21AM +0200, Erwan Le Ray wrote:
> Add two optional DT properties, to configure RX and TX fifo threshold:
> - st,rx-fifo-threshold-bytes
> - st,tx-fifo-threshold-bytes
> 
> This patch depends on patch ("dt-bindings: serial: Add rx-tx-swap to stm32-usart").
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>
> 
> diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> index c69f8464cdf3..e163449bf39e 100644
> --- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
> @@ -65,6 +65,22 @@ properties:
>    linux,rs485-enabled-at-boot-time: true
>    rs485-rx-during-tx: true
>  
> +  st,rx-fifo-threshold-bytes:
> +    description:
> +      RX FIFO threshold configuration in bytes.
> +      If value is set to 1, RX FIFO threshold is disabled.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4, 8, 12, 14, 16]
> +    default: 8
> +
> +  st,tx-fifo-threshold-bytes:
> +    description:
> +      TX FIFO threshold configuration in bytes.
> +      If value is set to 1, TX FIFO threshold is disabled.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4, 8, 12, 14, 16]
> +    default: 8

We already have 'tx-threshold' for 8250, so reuse that and add 
'rx-threshold'.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
