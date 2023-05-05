Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D57A6F89D2
	for <lists+linux-stm32@lfdr.de>; Fri,  5 May 2023 21:51:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21E84C6A60D;
	Fri,  5 May 2023 19:51:04 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8363EC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 May 2023 19:51:02 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-18ef8aa1576so1853215fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 May 2023 12:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683316261; x=1685908261;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dguMNfMk4wcW3nSZUAYy0tuJ0r9bBR9l9tF40g9fY7I=;
 b=XE+dOf4U2mmtaEpw0ZfhdVshW8bBwfb77ik/9vzZp0BFEBEnApx+RX4zfLNiubV6nC
 /hgoHUcgqCgXJVSWpCj+iccyq+bbd74a3E8z7yDIV5GmKwk63A1W7KX4WNWJIGPql+NR
 PYkvH2JayCpXKTofE3/BjI2CHWta5Yde8/RnHOVVU07KX41U6nVYcPDEEA3Vv3y5lLwn
 dN1nQU6T9ZlJ63jDjjnHST7+5brLu4kA1gwi/Tk2j+EuH0TapwIDvCbi2M4x/zC037zw
 hp2T9FjHzR6C+ykCVhnRVci2tChYhViuNpvRgeuEJjtu4Jr5L7DJDAcsm58ZR8fL2xk4
 hY5Q==
X-Gm-Message-State: AC+VfDyBEWOywMxy2/aZVjRdFJHCe26XYvuIF+2OEeEQjf52yrj4baCl
 EasKXBNsqSaAN+00panFuw==
X-Google-Smtp-Source: ACHHUZ7b1sGcz+WaT+MXyYJMCCmoh/Da9MtxtY9aquw0oa5YHEQhZYwLP6Ds8cyve+AMTX6K19GXTw==
X-Received: by 2002:a05:6870:304:b0:187:85c1:8075 with SMTP id
 m4-20020a056870030400b0018785c18075mr1432649oaf.15.1683316261202; 
 Fri, 05 May 2023 12:51:01 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e1-20020a056870c34100b0018449ae08cesm2222138oak.13.2023.05.05.12.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 12:51:00 -0700 (PDT)
Received: (nullmailer pid 3459191 invoked by uid 1000);
 Fri, 05 May 2023 19:50:58 -0000
Date: Fri, 5 May 2023 14:50:58 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <168331625833.3459132.18047945812995754036.robh@kernel.org>
References: <20230427204540.3126234-1-dario.binacchi@amarulasolutions.com>
 <20230427204540.3126234-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230427204540.3126234-2-dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-can@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>,
 Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [Linux-stm32] [PATCH v2 1/5] dt-bindings: net: can: add "st,
 can-secondary" property
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


On Thu, 27 Apr 2023 22:45:36 +0200, Dario Binacchi wrote:
> On the stm32f7 Socs the can peripheral can be in single or dual
> configuration. In the dual configuration, in turn, it can be in primary
> or secondary mode. The addition of the 'st,can-secondary' property allows
> you to specify this mode in the dual configuration.
> 
> CAN peripheral nodes in single configuration contain neither
> "st,can-primary" nor "st,can-secondary".
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
> (no changes since v1)
> 
>  .../bindings/net/can/st,stm32-bxcan.yaml      | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
