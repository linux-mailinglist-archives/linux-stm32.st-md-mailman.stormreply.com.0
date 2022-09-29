Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7265F0015
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Sep 2022 00:29:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25A8AC64100;
	Thu, 29 Sep 2022 22:29:09 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81FE5C640FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 22:29:08 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 k11-20020a4ab28b000000b0047659ccfc28so1079946ooo.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Sep 2022 15:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=eIYGb01iP1uQvHx/5dIICXkInZ12bMRqgZXdcsdsQ4Y=;
 b=p03PBqsVZxAkLxzkZvJj1JPAPQVk0HmZsW1vy7QNg+MR/DBRopMZ/JXcDc14Y1+vde
 gB8lM+HxCqWXCwb6MoonGTlgAMSSpTGfwrruSMYGJ+gFioTYAszYbA9jq/egOUrYBZje
 apFQahMsLftAJgpaRHgZD7MqbnKGt/OCotbfzFVFuJS7M9mujiZxrWyAI6fzXo7h34EA
 WWGYidl/qye1Yisdt6rk0315m5+KewuTpKF4cBx2fex5CmoJ1CKjElJwAIik9C9MH94r
 bXEiyAN8e1Jy2yKNsCY60QHi2N2B2fR9EhYOmnsJQxs42qo2nF4bJ8fX5s2Fkp4LjuEo
 ul6Q==
X-Gm-Message-State: ACrzQf0sMrWYP7hIj/brM0JH5znYEHm9XxJrzOg15m30Wxr2UbdzyZ63
 kU+7sc9KfL49Ew/MIckj9g==
X-Google-Smtp-Source: AMsMyM50FnMOFQvequxk7j7Nh7qAyE+AcDJlo33zrXe+tKrvwzRBMhdM+kIm70/KBE4j9TMMpbCaeg==
X-Received: by 2002:a05:6830:1d3:b0:65a:659:20c1 with SMTP id
 r19-20020a05683001d300b0065a065920c1mr2330171ota.113.1664490547266; 
 Thu, 29 Sep 2022 15:29:07 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h94-20020a9d2f67000000b0065932853f5esm205532otb.61.2022.09.29.15.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 15:29:06 -0700 (PDT)
Received: (nullmailer pid 2879517 invoked by uid 1000);
 Thu, 29 Sep 2022 22:29:06 -0000
Date: Thu, 29 Sep 2022 17:29:06 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <166449054453.2879455.4591283514406157909.robh@kernel.org>
References: <20220926234501.583115-1-marex@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220926234501.583115-1-marex@denx.de>
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: display: st,
 stm32-dsi: Handle data-lanes in DSI port node
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

On Tue, 27 Sep 2022 01:45:01 +0200, Marek Vasut wrote:
> Handle 'data-lanes' property of the DSI output endpoint, it is possible
> to describe DSI link with 1 or 2 data lanes this way.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  .../bindings/display/st,stm32-dsi.yaml          | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
