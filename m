Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C10349DC5
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Mar 2021 01:29:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C84EFC57B60;
	Fri, 26 Mar 2021 00:29:03 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CAD3C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Mar 2021 00:29:01 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id e8so3747366iok.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Mar 2021 17:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HqP361nCuW7IrybuNXs/MVht6WlPAUMBMTJUt5NbOBY=;
 b=NUqkKf8GhSiMtVK2h4JagUwMzWh4nKPs07NZmz9DxfvO0t7rne1rPSWSDAwTXszFLt
 PKfoGINe8wah1P3rvPycLRTbK/oKBg/0hwo+dKzryqSlewQGDgOTW8R9ycXW2LFn/mRc
 uDB+2bYCt16LIetcoUz3Og1XAu71WFuHJGGK2xGKz6zE719H6BGKd/SP9/gK6155lgO3
 gzS1QtE/PqAuzdCOUZ/KGfoXH1Osi5Xj6VTzDHwvmGO8b8JZSSTUxXEKAnlukiO/seam
 Y19NROm4EqqN7AYRR43VGr7wvpTmtbuPT7kCENCV6FT5TY+QvVRishXyRs5T/cFKK17S
 rfig==
X-Gm-Message-State: AOAM530aEp5GWbkfxpYKcSGwR8elQd3BYUk4TCDGePsQq667Dzo1nYRf
 3tWNpzQcxfT27lbhr/563Q==
X-Google-Smtp-Source: ABdhPJw6W3NHdAqO/y5OThYoAM4qmj7MMyJPG3HX8vVwI93D07pwvhmlBcQDFuiXigdabDHe9NnU5Q==
X-Received: by 2002:a6b:7c4a:: with SMTP id b10mr8401982ioq.170.1616718540205; 
 Thu, 25 Mar 2021 17:29:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id k7sm3417611ils.35.2021.03.25.17.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 17:28:59 -0700 (PDT)
Received: (nullmailer pid 2033074 invoked by uid 1000);
 Fri, 26 Mar 2021 00:28:51 -0000
Date: Thu, 25 Mar 2021 18:28:51 -0600
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <20210326002851.GA2031564@robh.at.kernel.org>
References: <20210317160954.15487-1-amelie.delaunay@foss.st.com>
 <20210317160954.15487-2-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210317160954.15487-2-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] dt-bindings: phy: add vbus-supply
 optional property to phy-stm32-usbphyc
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

On Wed, Mar 17, 2021 at 05:09:53PM +0100, Amelie Delaunay wrote:
> This patch adds vbus-supply optional property to phy sub-nodes.
> A regulator for USB VBUS may be needed for host mode.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
> index 018cc1246ee1..ad2378c30334 100644
> --- a/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml
> @@ -71,6 +71,9 @@ patternProperties:
>        phy-supply:
>          description: regulator providing 3V3 power supply to the PHY.
>  
> +      vbus-supply:
> +        description: regulator providing 5V Vbus to the USB connector.

Unless Vbus is powering the phy, then this only belongs in the USB 
connector node.

> +
>        "#phy-cells":
>          enum: [ 0x0, 0x1 ]
>  
> -- 
> 2.17.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
