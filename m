Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E411DA02C
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2020 21:00:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1910CC36B22;
	Tue, 19 May 2020 19:00:24 +0000 (UTC)
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A6B9C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2020 19:00:22 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id m6so483648ilq.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2020 12:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CigNBiFGguISDYdSjZo6JK7yGCkqs8bnsK3pMxkFnS0=;
 b=hPYmBDX9wvhBd+/Lbgzc9/2dbc0kp7b5b+J6Yhv3EIzwunhIgr1WRvF/gsQKPJ/1nG
 cHBvnVOEMxSCTc874V4NmMZAZHSrqWWKGVSKxr9HYIhAap1SdiE5T4I5UW3sCmVbmQGC
 fTB9OiA1LLCoLunb7qul5fVhjW2mBZZ7m17ZQF7tWkjsAMP4j/lI0LKiRhs3ThD41//i
 yVtJhHvQeRflMLUJHwL2KSoOfyyrxC+MAEXvCrV4VPmIa0IxXCHITl2vdgDvlFKXyxno
 9+m8MnRCNaoh+QTmulUc9+VEQb+yhpjMSfPIHxt010pn+75vbMKncN0HLVuJ0Ebln9n9
 ezBw==
X-Gm-Message-State: AOAM532DS2Ia2obhnN4Huvx7Mzb3LDpGLb7RpEry73ZQrhvjT7h8LINa
 50E+tYMXZUee82pwCHVhMg==
X-Google-Smtp-Source: ABdhPJx7GM4OuG3FNL/RP90uFPgLl2sZetDsvHbDfXe9ifMm1+a3LfvTd1zFF24wU8jDuhFOpm62mA==
X-Received: by 2002:a05:6e02:cc5:: with SMTP id
 c5mr472948ilj.152.1589914820957; 
 Tue, 19 May 2020 12:00:20 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id b8sm130937iln.47.2020.05.19.12.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 12:00:20 -0700 (PDT)
Received: (nullmailer pid 478222 invoked by uid 1000);
 Tue, 19 May 2020 19:00:19 -0000
Date: Tue, 19 May 2020 13:00:19 -0600
From: Rob Herring <robh@kernel.org>
To: Etienne Carriere <etienne.carriere@linaro.org>
Message-ID: <20200519190019.GA478168@bogus>
References: <20200512131334.1750-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512131334.1750-1-etienne.carriere@linaro.org>
Cc: Etienne Carriere <etienne.carriere@st.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 srinivas.kandagatla@linaro.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: nvmem: stm32: new
 property for data access
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

On Tue, 12 May 2020 15:13:34 +0200, Etienne Carriere wrote:
> From: Etienne Carriere <etienne.carriere@st.com>
> 
> Introduce boolean property st,non-secure-otp for OTP data located
> in a factory programmed area that only secure firmware can access
> by default and that shall be reachable from the non-secure world.
> 
> This change also allows additional properties for NVMEM nodes that
> were forbidden prior this change.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
> ---
> Changes since v1:
>   Change nvmem.yaml to allow additional properties in NVMEM nodes.
> 
> Link to v1:
>   https://lore.kernel.org/patchwork/patch/1239028/
> 
>  .../devicetree/bindings/nvmem/nvmem.yaml        |  2 --
>  .../bindings/nvmem/st,stm32-romem.yaml          | 17 +++++++++++++++++
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
