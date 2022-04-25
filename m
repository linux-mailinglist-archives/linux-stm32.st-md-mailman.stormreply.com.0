Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0769350E937
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 21:11:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0F44C60462;
	Mon, 25 Apr 2022 19:11:17 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC7A8C5F1EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 19:11:15 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 i3-20020a056830010300b00605468119c3so11434220otp.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 12:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KfvsdaNrqzE1BZExO2gpU9gM5Zw3mrEmzjGsDm/IN7Y=;
 b=FvFyTzdXctHvnseMBDXeHXND3VNirJwt8SlsepIjCHJPyAQVPSD0tgO1cm8oN2FVlr
 /VhkW1qOeN5Q6/+EEnLOKKrA3gX+5cnbiy3LAPyqXYRw8u45jggJXoCc48R9EXFXdlzt
 y+O35Zw3HKpID8a51hY78aV5bR6nK4L/Dqz1fl/1GTJNdNTZm5/xwEZMFoiFddbfmbkc
 yAzo5DUk5BL6mVDl+g/KmM4Iag3KHu5xbj3oY6EJS7A3+55ErRteRfK6DlaVl67rtPUn
 kaGVtTNLmgkhR3+eT4n20fCEq7vCiob8FbJy2IOv3LVLc7gKxJy28+tYbIs9yknitqUh
 6FjA==
X-Gm-Message-State: AOAM533OgJflLjbMrtQXgH9jIKqiCjbxvjnKcZiVfDAGlmtbCoRUmaNv
 ONiNpdSFUPiFTDvzT3bgrQ==
X-Google-Smtp-Source: ABdhPJw9uxpUO9LKnG040QuMwHyOzS4tHc0WimyBmaTy2/e4n1V3ST1BXyUY9YaMQrHV8DrvaiVaAQ==
X-Received: by 2002:a05:6830:18f:b0:605:433b:c568 with SMTP id
 q15-20020a056830018f00b00605433bc568mr6954877ota.46.1650913874611; 
 Mon, 25 Apr 2022 12:11:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e26-20020a056820061a00b0035e46250f56sm4020495oow.13.2022.04.25.12.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 12:11:14 -0700 (PDT)
Received: (nullmailer pid 83469 invoked by uid 1000);
 Mon, 25 Apr 2022 19:11:13 -0000
Date: Mon, 25 Apr 2022 14:11:13 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <YmbyUc5uTXoTD/nt@robh.at.kernel.org>
References: <20220422150952.20587-1-alexandre.torgue@foss.st.com>
 <20220422150952.20587-3-alexandre.torgue@foss.st.com>
 <dd48a7b5-ce08-5fb2-8236-8802ac91d827@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd48a7b5-ce08-5fb2-8236-8802ac91d827@denx.de>
Cc: etienne.carriere@st.com, devicetree@vger.kernel.org, arnd@arndb.de,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, soc@kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/8] dt-bindings: clock: stm32mp1:
 describes clocks if "st, stm32mp1-rcc-secure"
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

On Fri, Apr 22, 2022 at 06:31:25PM +0200, Marek Vasut wrote:
> On 4/22/22 17:09, Alexandre Torgue wrote:
> > In case of "st,stm32mp1-rcc-secure" (stm32mp1 clock driver with RCC
> > security support hardened), "clocks" and "clock-names" describe oscillators
> > and are required.
> > 
> > Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> > index 7a251264582d..bb0e0b92e907 100644
> > --- a/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml
> > @@ -58,14 +58,8 @@ properties:
> >             - st,stm32mp1-rcc-secure
> >             - st,stm32mp1-rcc
> >         - const: syscon
> > -
> > -  clocks:
> > -    description:
> > -      Specifies the external RX clock for ethernet MAC.
> > -    maxItems: 1
> > -
> > -  clock-names:
> > -    const: ETH_RX_CLK/ETH_REF_CLK
> > +  clocks: true
> > +  clock-names: true
> 
> It looks like this should rather be a property than a compatible string --
> the compatible string is used by the OS to determine which hardware is
> represented by a node, but here it is the same hardware in either case,
> "st,stm32mp1-rcc" and "st,stm32mp1-rcc-secure", it is still the same
> STM32MP1 RCC block, just configured differently by some bootloader stage.
> 
> So why not just add one-liner property of the RCC block like ?
> st,rcc-in-secure-configuration

Because using compatible was already decided.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
