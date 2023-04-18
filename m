Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0756E6DB9
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Apr 2023 22:53:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5630EC6A608;
	Tue, 18 Apr 2023 20:53:23 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C2A9C69065
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 20:53:21 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 i10-20020a4ad68a000000b0053b8aa32089so4440717oot.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 13:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681851200; x=1684443200;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7OwgyFYxvUdy54LeDh4J8bkZyrATaQx+kfaOB/n8Aw=;
 b=aY5GiAxEyTQSaBIH8gX/Em0j0+5wkHE2THg/EGkw3dPbbTPu+4cFr+cFItSf2z7r8T
 FadiES789Eg8DR7L3Nq7VbpuBC3nqMn5uf2vL0eEKrKr6PuFk1/VEzs+IjlKDsVuEFRW
 YJK9M+uUaUde7HHVdW33BUfSXeDGH7xhmkcVVduUGlEKzqyj9LEh4YAtF7R3JKEqwue8
 MyDuU4Rk86znokFjYjMLDo3HxrWxKeMSqvc1wFRmSq7sGYScRFBBb/+cMPRCAa+UPUzm
 D0QmMBzXLf+vBr7Sn3cke2hWArk8MP30c1PJrlc9NZ5h71+lev4ikpkZVKuQx2tURm/8
 wEzA==
X-Gm-Message-State: AAQBX9cmlrSL3sWrp6E0vANg5J1rJcJxsE+K4P6ZSJyuL4jC2aA7teaT
 XY++Kj8mACLlQFew8Bmv4A==
X-Google-Smtp-Source: AKy350b/EDQ8ntn392NFJwpfJRHYL6UKPciQC7U7cGvat7A1qfFG6PLLKiTz+v/L8nLz3JGXjYYDtw==
X-Received: by 2002:a4a:410a:0:b0:542:59fb:949e with SMTP id
 x10-20020a4a410a000000b0054259fb949emr6393003ooa.2.1681851200085; 
 Tue, 18 Apr 2023 13:53:20 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m21-20020a056870a41500b0017b21991355sm6045739oal.20.2023.04.18.13.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 13:53:19 -0700 (PDT)
Received: (nullmailer pid 2322029 invoked by uid 1000);
 Tue, 18 Apr 2023 20:53:18 -0000
Date: Tue, 18 Apr 2023 15:53:18 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <168185119638.2321910.8021835045798003240.robh@kernel.org>
References: <20230414083311.12197-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230414083311.12197-1-krzysztof.kozlowski@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: display: mediatek: simplify
 compatibles syntax
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


On Fri, 14 Apr 2023 10:33:11 +0200, Krzysztof Kozlowski wrote:
> Lists (items) with one item should be just enum because it is shorter,
> simpler and does not confuse, if one wants to add new entry with a
> fallback.  Convert all of them to enums.  OTOH, leave unused "oneOf"
> entries in anticipation of further growth of the entire binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: angelogioacchino.delregno@collabora.com
> ---
>  .../bindings/display/mediatek/mediatek,ccorr.yaml   |  7 +++----
>  .../bindings/display/mediatek/mediatek,color.yaml   | 10 ++++------
>  .../bindings/display/mediatek/mediatek,dither.yaml  |  4 ++--
>  .../bindings/display/mediatek/mediatek,dsc.yaml     |  4 ++--
>  .../bindings/display/mediatek/mediatek,gamma.yaml   |  7 +++----
>  .../bindings/display/mediatek/mediatek,merge.yaml   |  7 +++----
>  .../bindings/display/mediatek/mediatek,od.yaml      |  7 +++----
>  .../bindings/display/mediatek/mediatek,ovl-2l.yaml  |  7 +++----
>  .../bindings/display/mediatek/mediatek,ovl.yaml     | 13 +++++--------
>  .../display/mediatek/mediatek,postmask.yaml         |  4 ++--
>  .../bindings/display/mediatek/mediatek,rdma.yaml    | 13 +++++--------
>  .../bindings/display/mediatek/mediatek,split.yaml   |  4 ++--
>  .../bindings/display/mediatek/mediatek,ufoe.yaml    |  4 ++--
>  .../bindings/display/mediatek/mediatek,wdma.yaml    |  4 ++--
>  14 files changed, 41 insertions(+), 54 deletions(-)
> 

Applied, thanks!

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
