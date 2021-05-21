Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 730B838BC35
	for <lists+linux-stm32@lfdr.de>; Fri, 21 May 2021 04:03:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1884CC57B60;
	Fri, 21 May 2021 02:03:31 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83D45C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 May 2021 02:03:29 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id b25so18356436oic.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 19:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WhAeh+dZi9+3yK3kntKir0Vq+lwI30Bn7MsSEyHVbZU=;
 b=tlR0j/W5Z17REHOXCJ5y/Uf9EWesN0YwWges0JY4ijQoN3G+POmqYVkRbcWWxkeRF1
 AowgxfzKU/n1bioggJx8KhtqShY4CBgz0/18qaEV9t9vhptgErc8RFkpXXLdcDJdWDxp
 f062oQaBWH6LrUEuGo8OuOs2BNVb+HFy3M6afVUp1t2RpY2uKLevmcWABVHQdkDdrkTy
 2UmpjVy/lr8oM3euvefL6D5AV6/f1EplmSfOVKA9kdCYVJ1Wu+7JRrRztMmfC1osbA9b
 82NIi9jpT2XPZ5rRgsw9t6pREfC1mHOgFyeDvWzxm3jukxvSGscc7QB3/FZa2cEXtbTc
 cXAw==
X-Gm-Message-State: AOAM5301JRvr2qpGK6WeSK0cCNIWl155cpeLPcR4bH/BQMpIx+GqweTA
 UXWrUCqy/EiD/H+01qj8lQ==
X-Google-Smtp-Source: ABdhPJyQqDX59bgvgmDRWgwVJcOyJeV8oVHeEjcOjQRXCo0m49J2PqCCHAFfmM3cT0row6pVQGk9MA==
X-Received: by 2002:a05:6808:f90:: with SMTP id
 o16mr315450oiw.163.1621562607986; 
 Thu, 20 May 2021 19:03:27 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e21sm919703oie.32.2021.05.20.19.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 19:03:27 -0700 (PDT)
Received: (nullmailer pid 2505823 invoked by uid 1000);
 Fri, 21 May 2021 02:03:26 -0000
Date: Thu, 20 May 2021 21:03:26 -0500
From: Rob Herring <robh@kernel.org>
To: dillon.minfei@gmail.com
Message-ID: <20210521020326.GA2505733@robh.at.kernel.org>
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
 <1621508727-24486-3-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621508727-24486-3-git-send-email-dillon.minfei@gmail.com>
Cc: gnurou@gmail.com, mcoquelin.stm32@gmail.com, devicetree@vger.kernel.org,
 sboyd@kernel.org, hugues.fruchet@foss.st.com, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, mchehab+huawei@kernel.org, robh+dt@kernel.org,
 pihsun@chromium.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
 ezequiel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/7] media: dt-bindings: media: add
 document for STM32 DMA2D bindings
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

On Thu, 20 May 2021 19:05:22 +0800, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> This adds documentation of device tree bindings for the STM32 DMA2D
> 
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---
>  .../devicetree/bindings/media/st,stm32-dma2d.yaml  | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-dma2d.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
