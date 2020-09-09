Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FA0263738
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Sep 2020 22:19:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47B4FC3FAE2;
	Wed,  9 Sep 2020 20:19:34 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33FD7C36B33
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 20:19:29 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id d18so4577611iop.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Sep 2020 13:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RSxhAGvdVfCVr2cHc0lTJnW3lYIHBFlEXCul1r62/7Y=;
 b=WrYPj24KR/r/RH355ZU2biCT2q/PsnlIB6jFKOsdUlyp/zLyfsQtqUhled8pZ5kHmr
 SWLOX8QEWIH2ZuNj3ZZGlETLtZ3fPOGgi2KNoG9QcUi7q4PZY1mlz783YaEherekE7lq
 wGPPveqZPixGCFMAOb0mcf8lgOp692DfApK8su9QQmiOpwHKs1ILbVIE435ML4bZkMC3
 +aGqyZdxnuk/tPkMO9oQ7mZU7VkhGcB9MQMEI6xdxWeMeoJdV7isz9jiTXRhebsdRMeF
 sDamzetRxNqjmKUK0kcU97Vp26aRI3SNawqP+KKDLD7p4XmfYvZ0//5O3CFZw5AWQuQo
 qraQ==
X-Gm-Message-State: AOAM5314GauPiudidKVRb/y5S1TEk5yzGvk4yl0acwXfPkFSowWPN3G3
 FPX4vASmIARJ7gmGGMEduQ==
X-Google-Smtp-Source: ABdhPJwBKiVRr3c97gG/LCzkZs5UuOnxWgLTDtzzXrRD6aV8r7ZtsBq+rZPDQ3q6pulT0cX9C8fw0Q==
X-Received: by 2002:a6b:9309:: with SMTP id v9mr5087885iod.15.1599682768674;
 Wed, 09 Sep 2020 13:19:28 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id u89sm2049917ili.63.2020.09.09.13.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 13:19:27 -0700 (PDT)
Received: (nullmailer pid 2974124 invoked by uid 1000);
 Wed, 09 Sep 2020 20:19:20 -0000
Date: Wed, 9 Sep 2020 14:19:20 -0600
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <20200909201920.GA2973966@bogus>
References: <20200827072101.26588-1-arnaud.pouliquen@st.com>
 <20200827072101.26588-2-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200827072101.26588-2-arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Dessenne <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: arm: stm32: Add
 compatible for syscon tamp node
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

On Thu, 27 Aug 2020 09:20:59 +0200, Arnaud Pouliquen wrote:
> Since commit ad440432d1f9 ("dt-bindings: mfd: Ensure 'syscon' has a
> more specific compatible")
> It is required to provide at least 2 compatibles string for syscon node.
> This patch documents the new compatible for stm32 SoC to support
> TAMP registers access.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> ---
>  Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
