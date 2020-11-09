Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 054DA2ABF58
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Nov 2020 16:04:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9220EC3FAE2;
	Mon,  9 Nov 2020 15:04:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50BE2C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Nov 2020 15:04:06 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB5A4221F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Nov 2020 15:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604934244;
 bh=klOzq0fwls70xqZlUdJhI8p1HAh7xB/+hUm3hhvBTbc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zRkjX1fywCRc3cml6SgOLCjAP2nOhigBWN5i0+nDFKxkORwia7b0HsX9kYPgUg7jT
 rR/ga4f3KxVT4cND616QWDq5eHk5H3ps34SnJNgFSi/PN6cxg8R/FKQAn0OWaXk6sz
 7+l/AC0itXBgeHXQyXwhTYa7EbU//qSkwiYccBWw=
Received: by mail-ot1-f54.google.com with SMTP id 32so9203382otm.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Nov 2020 07:04:04 -0800 (PST)
X-Gm-Message-State: AOAM532ecasAPLqGVeuBKHVb6v0VbIjup8ggf76k98AXHv5Nvf17LvFA
 mANPvnIF+PRFcUhYJeLQ0bXmxh7EH4C28sPsVw==
X-Google-Smtp-Source: ABdhPJwVIajxUZd8pHgC4uOmEOHHpIlfzHZZGsTgFYCu33zI8wFT1W6B6OuaQFPH0g3XDgCIJq3bs4vnyzZR5TPU8Uo=
X-Received: by 2002:a05:6830:2259:: with SMTP id
 t25mr10977628otd.192.1604934243782; 
 Mon, 09 Nov 2020 07:04:03 -0800 (PST)
MIME-Version: 1.0
References: <20201106165805.31534-1-amelie.delaunay@st.com>
 <20201106165805.31534-2-amelie.delaunay@st.com>
In-Reply-To: <20201106165805.31534-2-amelie.delaunay@st.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 9 Nov 2020 09:03:52 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+A=nixpdrT3Omq7Osat=_Egb5g6VGao=gY4CEssOe+xQ@mail.gmail.com>
Message-ID: <CAL_Jsq+A=nixpdrT3Omq7Osat=_Egb5g6VGao=gY4CEssOe+xQ@mail.gmail.com>
To: Amelie Delaunay <amelie.delaunay@st.com>
Cc: devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Badhri Jagan Sridharan <badhri@google.com>, Jun Li <lijun.kernel@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v5 1/5] dt-bindings: connector: add
 typec-power-opmode property to usb-connector
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

On Fri, Nov 6, 2020 at 10:58 AM Amelie Delaunay <amelie.delaunay@st.com> wrote:
>
> Power operation mode may depends on hardware design, so, add the optional
> property typec-power-opmode for usb-c connector to select the power
> operation mode capability.
>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
> Hi Bahdri, Rob,
>
> I've added the exlusion with FRS property, but new FRS property name
> should be use here so, be careful.
>
> ---
>  .../bindings/connector/usb-connector.yaml     | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index 62781518aefc..a84464b3e1f2 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -93,6 +93,24 @@ properties:
>        - device
>        - dual
>
> +  typec-power-opmode:
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

Use the enums here. Unless you want to define it as actual current as
a numerical value.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
