Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8BA2216BF
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jul 2020 23:03:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BC01C36B29;
	Wed, 15 Jul 2020 21:03:21 +0000 (UTC)
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B29F5C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2020 21:03:19 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t18so3243497ilh.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jul 2020 14:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GWDZepDoncsEaTMC4EtAIVPS29rg6+akZDaq58u8hqs=;
 b=XArvTqmDy99pYUNykfSBOALeKBXjd67wNKxpfyU1ALZo2C+NtJ09OYg7HXXzg8/nsj
 oWiPc47l4YPN7IQEX8ruKFXQ6DQE3Jz57ny9A9ZAIfF1SswgfEO3mpKVonmHNxJJ8RgQ
 lRJUo1596T9sH8CVI1OWJoh6CNo2Y4gYXtwI9yV2b6mJEFOoPp2xaxSLHwBJWhr5LJ6H
 oAgtnbdKAI2cF+Uglkb0E4IgfB7LdpF37td75Liwu/x1h/Op8VzSXsYw+C3L6Zhk0BlA
 l6M1bdds+7x8zkGObtvmBiaXYV1eKa16kP8+eSpOy9u1mjyb8lWFB5j7EfMj1u+ntvJo
 Fxww==
X-Gm-Message-State: AOAM530l9PB9WojXUArhkIx57ImFX1bIZ/AsQWvDPFfNarTCQ0RQEPg4
 59IHiAf7GEdMRezwnGIQxg==
X-Google-Smtp-Source: ABdhPJwBYLdvUXEXFEUAVM6usSlJJ9M/lybrTM4uUutDaLWTKuqsiNxb1k9dpnNAJ8CbXwx8r57ECw==
X-Received: by 2002:a92:cf51:: with SMTP id c17mr1328712ilr.122.1594846998231; 
 Wed, 15 Jul 2020 14:03:18 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id y2sm1721651iox.22.2020.07.15.14.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 14:03:17 -0700 (PDT)
Received: (nullmailer pid 811841 invoked by uid 1000);
 Wed, 15 Jul 2020 21:03:16 -0000
Date: Wed, 15 Jul 2020 15:03:16 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Message-ID: <20200715210316.GA811477@bogus>
References: <20200703095520.30264-1-benjamin.gaignard@st.com>
 <20200703095520.30264-2-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703095520.30264-2-benjamin.gaignard@st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mcoquelin.stm32@gmail.com, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/5] dt-bingings: arm: stm32: Add
 compatibles for syscon nodes
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

On Fri, 03 Jul 2020 11:55:16 +0200, Benjamin Gaignard wrote:
> Since commit ad440432d1f9 ("dt-bindings: mfd: Ensure 'syscon' has a more specific compatible")
> it is required to provide at least 2 compatibles string for syscon node.
> This patch document the missing compatibles for stm32 SoCs.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml     | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 

Typo in the subject, otherwise:

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
