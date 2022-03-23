Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8164F4E57F2
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Mar 2022 18:55:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 332CCC5F1EF;
	Wed, 23 Mar 2022 17:55:44 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DABCBC5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Mar 2022 17:55:42 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-d6ca46da48so2441624fac.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Mar 2022 10:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G9nuSpDKEgw7Nx+8QlyFC8zKvObs8NIU6xkxgQTrJ2g=;
 b=hd4NmcdharBsi7UerF0mThKBpIcuP5Zv/txH7KsT2HOxb0zFfv63DOwaKPaXDonT4W
 F2wv0Gsyzbck9wutnpX5bOud0r9SBNKJPf4ujKb/H0TNBnaW1MnDQVpChyY7snokqBgM
 x7VeXfg+DAW/Fu3cLMD4UsnQ1otgjkGjLJ5+7+uR2ZtYhuVoOGbhMqsc/BUXP2kjjgOx
 2ku0fx17IHSaCzqGptj4kdaEqhHqABHInyaAzVFKI6V5V+a+tyfCTO9tmkoLXqZD7VBU
 qGIYHzp5jbC5QD61S0I1hR0Pm3WsTOMZ81vcvTZdRioSvkYXAmPuJADUl7ZoQ+DZKc6s
 0vwg==
X-Gm-Message-State: AOAM5323IO08QO1AJbQrPA+xUaiCa0M2NDkkBtXfSjlV8HN8ufKW4Ops
 uQbNKsr8Mm+Ka4sjG2rXXg==
X-Google-Smtp-Source: ABdhPJwaB9MUC7QokIP99uc9L6Wq+ettpIdTaw8OrMyNbqh3zU3dXgYv87+41FqCM7ufTf7BjMESnw==
X-Received: by 2002:a05:6870:95a4:b0:d7:18b5:f927 with SMTP id
 k36-20020a05687095a400b000d718b5f927mr559577oao.45.1648058141804; 
 Wed, 23 Mar 2022 10:55:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z82-20020aca3355000000b002ef73b018absm234689oiz.9.2022.03.23.10.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:55:41 -0700 (PDT)
Received: (nullmailer pid 163348 invoked by uid 1000);
 Wed, 23 Mar 2022 17:55:40 -0000
Date: Wed, 23 Mar 2022 12:55:40 -0500
From: Rob Herring <robh@kernel.org>
To: Yannick Brosseau <yannick.brosseau@gmail.com>
Message-ID: <YjtfHEh8wUe0FZul@robh.at.kernel.org>
References: <20220314012634.1176231-1-yannick.brosseau@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220314012634.1176231-1-yannick.brosseau@gmail.com>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] clk: stm32: Fix typo in comment
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

On Sun, 13 Mar 2022 21:26:33 -0400, Yannick Brosseau wrote:
> s/Documentatoin/Documentation/ in path to the doc file
> 
> Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>
> ---
>  include/dt-bindings/clock/stm32fx-clock.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
