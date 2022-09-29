Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AEE5EFE90
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Sep 2022 22:20:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DD6FC64100;
	Thu, 29 Sep 2022 20:20:25 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB538C640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 20:20:22 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-131de9fddbaso2102113fac.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 13:20:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=lA+NSHyxjLzjJuiTqQbaeBr4bD4+BZYVTUZyg3a+e6I=;
 b=7Zi+W/gAJYRzTpACLz3gJ/2Tr1TnsqfeG3GvH4zWOgVgHBPcd5SglGawUdj2T9rEos
 IvYt01t+fTw5rjYIxQn/qQfc1ONeofBFCLvLe0RLjqbmtzzt2zUwX8fXHNNi/u+UwJrX
 tUOVth4YEdzaeAx5T4aFz7MpDoxzI0aV4KvA3WVCzAaLtAwr0CSgyCHO94+KhUow4JEb
 WnqFLhpAAmchii8fHFBsi3WF5/QA5oxph+arwU1D9VTaEE5H68aV6DFQJDaglf7UKJUy
 HMVtHdVYmV62VcFPOS4sN1ytJzSG/TDBeJylQ3+7OW5v7bB6WhtvxivGSsLKypHDE7dx
 Y0Yg==
X-Gm-Message-State: ACrzQf1cMYT14gVvNx6PiQIFFIxeddLOiqTyvZuMBs53/V/gyYyoFlOM
 +W4kmTvwteT+duDoljWrlA==
X-Google-Smtp-Source: AMsMyM4kgp3WdXEV9mKyTY9xUcZODIn8D7eADYuFc6yei1RBdOy+dXpm4bfqNeZy/1en2rI3CJPohA==
X-Received: by 2002:a05:6870:e886:b0:131:c8fe:1b60 with SMTP id
 q6-20020a056870e88600b00131c8fe1b60mr2881971oan.248.1664482821737; 
 Thu, 29 Sep 2022 13:20:21 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h94-20020a9d2f67000000b0065932853f5esm143270otb.61.2022.09.29.13.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 13:20:21 -0700 (PDT)
Received: (nullmailer pid 2671518 invoked by uid 1000);
 Thu, 29 Sep 2022 20:20:20 -0000
Date: Thu, 29 Sep 2022 15:20:20 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <166448281995.2671458.4285477773516650346.robh@kernel.org>
References: <20220925175209.1528960-1-dario.binacchi@amarulasolutions.com>
 <20220925175209.1528960-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925175209.1528960-3-dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, michael@amarulasolutions.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH v4 2/5] dt-bindings: net: can: add
 STM32 bxcan DT bindings
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

On Sun, 25 Sep 2022 19:52:06 +0200, Dario Binacchi wrote:
> Add documentation of device tree bindings for the STM32 basic extended
> CAN (bxcan) controller.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v4:
> - Remove "st,stm32f4-bxcan-core" compatible. In this way the can nodes
>  (compatible "st,stm32f4-bxcan") are no longer children of a parent
>   node with compatible "st,stm32f4-bxcan-core".
> - Add the "st,gcan" property (global can memory) to can nodes which
>   references a "syscon" node containing the shared clock and memory
>   addresses.
> 
> Changes in v3:
> - Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
> - Add description to the parent of the two child nodes.
> - Move "patterProperties:" after "properties: in top level before "required".
> - Add "clocks" to the "required:" list of the child nodes.
> 
> Changes in v2:
> - Change the file name into 'st,stm32-bxcan-core.yaml'.
> - Rename compatibles:
>   - st,stm32-bxcan-core -> st,stm32f4-bxcan-core
>   - st,stm32-bxcan -> st,stm32f4-bxcan
> - Rename master property to st,can-master.
> - Remove the status property from the example.
> - Put the node child properties as required.
> 
>  .../bindings/net/can/st,stm32-bxcan.yaml      | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
