Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A92EF29F043
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 16:40:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64246C3FAD5;
	Thu, 29 Oct 2020 15:40:21 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65E76C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 15:40:19 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id n15so2620275otl.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 08:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pFK119oKBHUlA5FZkroLBkkbquLP5uElSERBD9V0akk=;
 b=qddSXPFSdDyuusGECmiOuE8CDVLAUrf3tQykrVYmdIyej86RcsSzttUO83KsqIQNAS
 FpT3RwAaF6RXe7gvlBOUdzmzx3+dcZt0GTvIz3EcOydf+ve0XdyLhJH4Zp9sIBEAz2Br
 njjyDbOIR/bMDYArSeCgp7HfLeQsPZSIr7fx6b6+ElhpzeNYidX+EV8B+SzcME+7WFoA
 qSkLcUrXB9FL6Yo85GBeGiKS9QDRLj1VkD9EUD74Nbq9ej6n912NK9GnNVizlslFCKWk
 8GoPc9BCdsxx1z7huTUKYu8U7sxUDC9twWaadQHR55aT/8yyiCa0F7Fji3iE34tY8yep
 ksDw==
X-Gm-Message-State: AOAM5323ldcFzcqsSs+3FQL/Muja2f3uCOapgUmhwir+ceRvjuM9q7Gs
 Ilb4dy0LDlwXPtLEWoTV4Q==
X-Google-Smtp-Source: ABdhPJz/JkJ8C9MRVeRTN9L11T1V3txCS2mQ0fPKSM+XS8DvNISSelFbI4vfJlW1k1+tqtbj0oK9SA==
X-Received: by 2002:a05:6830:4033:: with SMTP id
 i19mr3841436ots.127.1603986017758; 
 Thu, 29 Oct 2020 08:40:17 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 76sm681405oty.15.2020.10.29.08.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 08:40:17 -0700 (PDT)
Received: (nullmailer pid 1920595 invoked by uid 1000);
 Thu, 29 Oct 2020 15:40:16 -0000
Date: Thu, 29 Oct 2020 10:40:16 -0500
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20201029154016.GA1917373@bogus>
References: <20201029095806.10648-1-amelie.delaunay@st.com>
 <20201029095806.10648-2-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029095806.10648-2-amelie.delaunay@st.com>
Cc: devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v3 1/4] dt-bindings: connector: add
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

On Thu, Oct 29, 2020 at 10:58:03AM +0100, Amelie Delaunay wrote:
> Power operation mode may depends on hardware design, so, add the optional
> property power-opmode for usb-c connector to select the power operation
> mode capability.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>  .../bindings/connector/usb-connector.yaml      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 728f82db073d..200d19c60fd5 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -93,6 +93,24 @@ properties:
>        - device
>        - dual
>  
> +  power-opmode:

I've acked this version:

https://lore.kernel.org/r/20201020093627.256885-2-badhri@google.com

Please ack it if you are okay with it.

Rob


> +    description: Determines the power operation mode that the Type C connector
> +      will support and will advertise through CC pins when it has no power
> +      delivery support.
> +      - "default" corresponds to default USB voltage and current defined by the
> +        USB 2.0 and USB 3.2 specifications, 5V 500mA for USB 2.0 ports and
> +        5V 900mA or 1500mA for USB 3.2 ports in single-lane or dual-lane
> +        operation respectively.
> +      - "1.5A" and "3.0A", 5V 1.5A and 5V 3.0A respectively, as defined in USB
> +        Type-C Cable and Connector specification, when Power Delivery is not
> +        supported.
> +    allOf:
> +      - $ref: /schemas/types.yaml#definitions/string
> +    enum:
> +      - default
> +      - 1.5A
> +      - 3.0A
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
