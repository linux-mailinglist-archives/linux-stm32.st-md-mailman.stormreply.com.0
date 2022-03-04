Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E79494CD818
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Mar 2022 16:39:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4D06C5F1F1;
	Fri,  4 Mar 2022 15:39:42 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5E89C5F1EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 15:39:41 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 h16-20020a4a6f10000000b00320507b9ccfso9779887ooc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Mar 2022 07:39:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IO1zrbMJCIdW27ZYcLkomHz9MZD/3xTBxiCCeGbY4nY=;
 b=q6qJo9wdmnWfe0m6UIIZGGy1ZWm104SnJUpBSlNdZBVj+PM0oUe/8x1MVb8XsbboPs
 qIw1Ze4Q7ZWWHalFCkb7RAFH9Dofw3jsWTQtxhxOw+tVM+xOFXlYjyk1hxgMEPLEo7L3
 nJz3/hDit0jyahrcvSq0J7JqyKRnbsLYU08q0NJon9ydIbwSCWdC+Ffl9B0kiA2EaHCC
 vsOK8z0cW3VTPsPVLAcmAeJax+XFGFnTQUd0Vw/vfnElclA0cpVW4XlNnPBYaQCK5D4q
 sOp6Rxi4FRj6Mh40h3coc7tmwb3XvrwSXYNMuoyOqPQmfd5preJi6cBitnS21bjnYPQu
 1+lQ==
X-Gm-Message-State: AOAM5320XszuaUhl9X3Kth7eqPxfBG1sjcqTZuZu4RBK267Z98fWGS0N
 r5XxNHz53XlIbn76+q7Z8g==
X-Google-Smtp-Source: ABdhPJzV3nnvTE6V/swPLdnnc8Rt2egbCzhY1OPkkrIIw8e54gAgN9Xe2bv5Gl3lRvSRncaFjcChng==
X-Received: by 2002:a05:6870:248c:b0:d7:19f3:a52c with SMTP id
 s12-20020a056870248c00b000d719f3a52cmr8397016oaq.149.1646408380509; 
 Fri, 04 Mar 2022 07:39:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 35-20020a9d0026000000b005ad363440a2sm2376353ota.64.2022.03.04.07.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:39:39 -0800 (PST)
Received: (nullmailer pid 3987557 invoked by uid 1000);
 Fri, 04 Mar 2022 15:39:38 -0000
Date: Fri, 4 Mar 2022 09:39:38 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <YiIyupjEgdiaj0Dv@robh.at.kernel.org>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220304095458.12409-4-angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, daniel@ffwll.ch,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de, ck.hu@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] dt-bindings: display: mediatek: Fix
 examples on new bindings
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

On Fri, 04 Mar 2022 10:54:58 +0100, AngeloGioacchino Del Regno wrote:
> To avoid failure of dt_binding_check perform a slight refactoring
> of the examples: the main block is kept, but that required fixing
> the address and size cells, plus the inclusion of missing dt-bindings
> headers, required to parse some of the values assigned to various
> properties.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,aal.yaml        | 24 +++--
>  .../display/mediatek/mediatek,ccorr.yaml      | 23 +++--
>  .../display/mediatek/mediatek,color.yaml      | 23 +++--
>  .../display/mediatek/mediatek,dither.yaml     | 23 +++--
>  .../display/mediatek/mediatek,dpi.yaml        |  3 +-
>  .../display/mediatek/mediatek,dsc.yaml        | 23 +++--
>  .../display/mediatek/mediatek,ethdr.yaml      | 99 ++++++++++---------
>  .../display/mediatek/mediatek,gamma.yaml      | 23 +++--
>  .../display/mediatek/mediatek,merge.yaml      | 49 +++++----
>  .../display/mediatek/mediatek,mutex.yaml      | 25 +++--
>  .../display/mediatek/mediatek,od.yaml         | 14 ++-
>  .../display/mediatek/mediatek,ovl-2l.yaml     | 26 +++--
>  .../display/mediatek/mediatek,ovl.yaml        | 26 +++--
>  .../display/mediatek/mediatek,postmask.yaml   | 23 +++--
>  .../display/mediatek/mediatek,rdma.yaml       | 28 ++++--
>  .../display/mediatek/mediatek,split.yaml      | 17 +++-
>  .../display/mediatek/mediatek,ufoe.yaml       | 19 ++--
>  .../display/mediatek/mediatek,wdma.yaml       | 26 +++--
>  18 files changed, 316 insertions(+), 178 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
