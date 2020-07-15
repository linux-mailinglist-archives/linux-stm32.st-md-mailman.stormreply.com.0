Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45999221422
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2020 20:19:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4857C36B29;
	Wed, 15 Jul 2020 18:19:20 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DFF2C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2020 18:19:18 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id c16so3239636ioi.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2020 11:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8qir7BYEt1ePlYcSc9kQBoolo/NmI427EpRk3jCnc0E=;
 b=jt2lahm0xpuzewyIIwvGa2N+TcsX1DdTO9DBiQE0Euj1bdjlMPMSGIvoThiBx2TvkK
 JMJHpUnL5MuKmXenymxzU8c8JLoNXmL4+6PVvPaYG6teP/zMQ8FL0AnhunyT1CgZYyIc
 1xVGhSOy6/mOXfTZzvmv4dB0Gm/7JVcKtGk6Idcltka+tp1fdRnmfCSVvuRZ2Ju2n+j7
 b1AsFebgF+oIlvsDb1gx9UbsZXkTlbgug7HsURhLAeQh9hGvYYAwZv+8d66X2JyOVuVp
 o1fQh8cZP7M9SnYtj12H231A2Kxbt9HqaJW0UVtEAQzKnnHGb2Y9ikLRvtGR6DgXF30g
 OYtQ==
X-Gm-Message-State: AOAM533G1viO/CUxOHUvQ+x3zMDc1CiVoPeVcTuAl6lOBFHFL20hBJ96
 mCcmGhrqG2TlWMa1+JTbyA==
X-Google-Smtp-Source: ABdhPJy+MnYJTQwPRpfYQ3APxYiqsDRIvjF899R10bA6VgiAK98fT5sRURp5v0MVa13LsRx2/1boXA==
X-Received: by 2002:a5d:8ac3:: with SMTP id e3mr575726iot.9.1594837157634;
 Wed, 15 Jul 2020 11:19:17 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id t11sm1437942ils.3.2020.07.15.11.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 11:19:17 -0700 (PDT)
Received: (nullmailer pid 557898 invoked by uid 1000);
 Wed, 15 Jul 2020 18:19:16 -0000
Date: Wed, 15 Jul 2020 12:19:16 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20200715181916.GA551920@bogus>
References: <20200615161512.19150-1-amelie.delaunay@st.com>
 <20200615161512.19150-2-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615161512.19150-2-amelie.delaunay@st.com>
Cc: devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: connector: add
 power-opmode optional property to usb-connector
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

On Mon, Jun 15, 2020 at 06:15:07PM +0200, Amelie Delaunay wrote:
> Power operation mode may depends on hardware design, so, add the optional
> property power-opmode for usb-c connector to select the power operation
> mode capability.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  .../devicetree/bindings/connector/usb-connector.yaml  | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 9bd52e63c935..cd7feb2d4984 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -88,6 +88,17 @@ properties:
>        - device
>        - dual
>  
> +  power-opmode:
> +    description: Determines the power operation mode that the Type C connector
> +      will support.
> +    allOf:
> +      - $ref: /schemas/types.yaml#definitions/string
> +    enum:
> +      - default

Wouldn't this just be no property?

> +      - 1.5A
> +      - 3.0A

You'll need to explain these better.

> +      - usb_power_delivery

I would have thought 'default' would be USB-PD. Though I thought Type-C 
was always USB-PD. 

> +
>    # The following are optional properties for "usb-c-connector" with power
>    # delivery support.
>    source-pdos:
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
