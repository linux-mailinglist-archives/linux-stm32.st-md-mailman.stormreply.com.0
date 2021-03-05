Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DF332EEC2
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Mar 2021 16:26:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0734BC57B7E;
	Fri,  5 Mar 2021 15:26:08 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9EBD9C57B7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Mar 2021 15:26:06 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id z12so67604ooh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 05 Mar 2021 07:26:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UGAA0VPbUBDV2qLusFPRZCr8HQGQiMTQXTjHRkiKM9U=;
 b=KFHD+VSqGS0wGLQbOMlTX5fqw8jKBirBlQKwvAmuplMZOx9OSaVg8DLsts2W0D9pAE
 rseWLTwy0SmLnmxTYHMVAaIYaqxaroIKi/GMZHFcIFfu5N6o4/V9uuIji9TtmjU1lwky
 lZ08l3ybBDOKqlNmBvRTuodrwqf1spBWNjuefaaA6DibANrhErSbsnP579TiS29+WX5X
 spMT57zrXOHl1TsY8EGfwgmtHbYKdGhyP3KAz6QToNyVbIX/um8L9HWYLB1jYMP+HaFS
 Gqkft/S3Oep2kDNlq9RxsWqfZEdG/M10taJl2gUUlce0CtqkfnKAHGko8hxw1m8xMy6Y
 qzag==
X-Gm-Message-State: AOAM533xb0/Pu+LzGwJsogXMSLFiAtGz9fVJrR4QJtROlU5ygyA5iPQ1
 ersKhVB5swnwUCV7oxc9sw==
X-Google-Smtp-Source: ABdhPJx3lV/XmuOxRe9jwX3wFlzW99kU6evn3a/1b6kGViDLbxlbZSot1vM6FZNCeizVp/3t0bzTyw==
X-Received: by 2002:a4a:3901:: with SMTP id m1mr8185039ooa.60.1614957964956;
 Fri, 05 Mar 2021 07:26:04 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c2sm575653ooo.17.2021.03.05.07.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:26:03 -0800 (PST)
Received: (nullmailer pid 185595 invoked by uid 1000);
 Fri, 05 Mar 2021 15:26:01 -0000
Date: Fri, 5 Mar 2021 09:26:01 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Message-ID: <20210305152601.GA185123@robh.at.kernel.org>
References: <20210228154323.76911-1-jagan@amarulasolutions.com>
 <20210228154323.76911-2-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210228154323.76911-2-jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 01/10] dt-bindings: arm: stm32: Add
 Engicam MicroGEA STM32MP1 MicroDev 2.0
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

On Sun, 28 Feb 2021 21:13:14 +0530, Jagan Teki wrote:
> MicroGEA STM32MP1 is a STM32MP157A based Micro SOM.
> 
> MicroDev 2.0 is a general purpose miniature carrier board with CAN,
> LTE and LVDS panel interfaces.
> 
> MicroGEA STM32MP1 needs to mount on top of this MicroDev 2.0 board
> for creating complete MicroGEA STM32MP1 MicroDev 2.0 Carrier board.
> 
> Add bindings for it.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - updated commit message
> Changes for v2:
> - none
> 
>  Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
