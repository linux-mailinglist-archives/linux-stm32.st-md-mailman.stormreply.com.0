Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5534D31556F
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Feb 2021 18:56:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EBCCC57B55;
	Tue,  9 Feb 2021 17:56:21 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2418C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Feb 2021 17:56:18 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id g46so4452268ooi.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Feb 2021 09:56:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vBG1WNZ+VYDg58Hj0p0C8XiVqBI5eXydWO/NFf/WXAw=;
 b=SjoFNQZ44iav3SvDVg6UamXzz+1A4N9o7a9axy822DbJKCVOqfJsStB23FbX4GIjMq
 Alyq3B1/uHVaGZCSR4rW7r1rYKlzOwYPw1Fj052T0gqezgqcuRQary6nk1rJq2HJinAX
 tgI6DoCWdByiEy8Et2BjpFVfCK6mnuMCotNbPgrfbKtcJjhkIVUI1K2e4JAX8gyYtZ/C
 GmSerPldgpEVHgDj4/rqCFs2LWu+RCd9bf4iUP4DhQbX4u9odkWYlqgyUcxQp//XtkVZ
 0PMAr9smlzcwFZ2vIbv9Dw9SjKuevrozHBfnQKJhUyqJTc4vDa3P9rLuskCoia/j9TBK
 KeoQ==
X-Gm-Message-State: AOAM532bjG0o+bT9c2rtnkm67AjNuNxYJKhK9j4iCzuLDhI0OFq0htUb
 MWwQHx5IG1rnxO03fnwjfA==
X-Google-Smtp-Source: ABdhPJwDyWG7JxVSQrPKKUjAO9gUPF8tm8MuPSOj8dj3+6IQC3cBmate/FqH6XfP1vsC+kwAHHQdBA==
X-Received: by 2002:a4a:c489:: with SMTP id f9mr16497336ooq.49.1612893377147; 
 Tue, 09 Feb 2021 09:56:17 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a63sm4498903otc.75.2021.02.09.09.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 09:56:15 -0800 (PST)
Received: (nullmailer pid 4039705 invoked by uid 1000);
 Tue, 09 Feb 2021 17:56:14 -0000
Date: Tue, 9 Feb 2021 11:56:14 -0600
From: Rob Herring <robh@kernel.org>
To: gabriel.fernandez@foss.st.com
Message-ID: <20210209175614.GA4039647@robh.at.kernel.org>
References: <20210126090120.19900-1-gabriel.fernandez@foss.st.com>
 <20210126090120.19900-14-gabriel.fernandez@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126090120.19900-14-gabriel.fernandez@foss.st.com>
Cc: marex@denx.de, Etienne Carriere <etienne.carriere@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 13/14] dt-bindings: clock: stm32mp1 new
 compatible for secure rcc
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

On Tue, 26 Jan 2021 10:01:19 +0100, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> 
> Introduce new compatible string "st,stm32mp1-rcc-secure" for
> stm32mp1 clock driver when the device is configured with RCC
> security support hardened.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../devicetree/bindings/clock/st,stm32mp1-rcc.yaml          | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
