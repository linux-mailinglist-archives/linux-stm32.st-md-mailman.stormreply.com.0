Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BA357D7B1
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Jul 2022 02:25:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BE30C03FEA;
	Fri, 22 Jul 2022 00:25:51 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8002BC03FD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Jul 2022 00:25:49 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id l24so2614114ion.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jul 2022 17:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5rm4BFsSvYv37lsR3SyeGRLmP7dFOqjTJ+9txhzXmzk=;
 b=NkvKIuK+DWsQoq1AaEUoVlGouBSZghbJyD3pAdYWU6YxmueABlaAsEu2Ixi8Njdwqp
 RSti4jJuYDUQNvVUd98CmflMHJ9nzYBSfJtheor5HZbbv0Bvr1wNmPbWG67gIwlgLajs
 Yn6fq4GsLPdvP08xH3GSBtZYMPNPo9rDb8EGKUkM5XhPXvGyS8aMR7aGaOezoeU3Cmv2
 a0MSI364KWeB+w42Bafx6JeIkjXC3WlTCQDre2Ot0XN3VaOkoDpAEpE+Bosn9FcxhtKY
 +1BKc58Pvkos+ybhoniRt0qvVRYUpb+wZ8np9+UnPagZP8SGqXT9VKVN69VgQnO91+it
 +NMw==
X-Gm-Message-State: AJIora8CV8i+pl8a36y085lhx9c9DV5nYM2jCbDASdJyXqLemKn8QX3C
 /qdYlNYcTNLvzV2Ki4KNlA==
X-Google-Smtp-Source: AGRyM1sU8bwcGjBEm0B3fkhvJdN7Glv0yQo9ZDLlq0aLwwezKmTVfOOZZ4cOs/i+bFBJvmc/Hb+Lgg==
X-Received: by 2002:a6b:fe13:0:b0:67c:3ed1:3cd0 with SMTP id
 x19-20020a6bfe13000000b0067c3ed13cd0mr381193ioh.53.1658449548266; 
 Thu, 21 Jul 2022 17:25:48 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 k83-20020a6bba56000000b0067beb49f801sm1498462iof.2.2022.07.21.17.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 17:25:47 -0700 (PDT)
Received: (nullmailer pid 2240200 invoked by uid 1000);
 Fri, 22 Jul 2022 00:25:46 -0000
Date: Thu, 21 Jul 2022 18:25:46 -0600
From: Rob Herring <robh@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20220722002546.GA2240166-robh@kernel.org>
References: <20220713120842.560902-1-fabrice.gasnier@foss.st.com>
 <20220713120842.560902-2-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713120842.560902-2-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 christophe.jaillet@wanadoo.fr, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 1/3] dt-bindings: usb: typec: add
 bindings for stm32g0 controller
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

On Wed, 13 Jul 2022 14:08:40 +0200, Fabrice Gasnier wrote:
> Add DT schema documentation for the STM32G0 Type-C PD (Power Delivery)
> controller.
> STM32G0 provides an integrated USB Type-C and power delivery interface.
> It can be programmed with a firmware to handle UCSI protocol over I2C
> interface. A GPIO is used as an interrupt line.
> It may be used as a wakeup source, so use optional "wakeup-source" and
> "power-domains" properties to support wakeup.
> The firmware itself may be flashed or later updated (optional). Choice is
> let to the application to allow firmware update. A default firmware could
> be already programmed in production and be customized (to not allow it).
> So the firmware-name is made optional to represent this option.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
> Changes in v3:
> - Add connector to the required properties as pointed out by Krzysztof.
>   Update commit message to explain why the firmware-name is optional.
> Changes in v2:
> - Krzysztof's review comments: update commit message, use ports, use
>   unevaluatedProperties: false for usb-connector schema, define maxItems
>   for power-domains, adopt generic node names, remove quotes
> ---
>  .../bindings/usb/st,typec-stm32g0.yaml        | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/st,typec-stm32g0.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
