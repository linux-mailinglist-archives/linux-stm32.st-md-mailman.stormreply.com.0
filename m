Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F944CD808
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Mar 2022 16:37:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C609C5F1EF;
	Fri,  4 Mar 2022 15:37:24 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA272C5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 15:37:22 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id j2so8162169oie.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Mar 2022 07:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PACe0xmx6r81EAuaFyvZQyZNTfONIujSTfg4d0qd68c=;
 b=4X660TvFiih5Z6I8nfcKkdO3WAof9J3bs0UAv0+IGK4GrJkASg2tjPI1BRNibZ3LLJ
 lxydTq3VqWLjTmdi5eGSZ0kBxF+TMdc4md9omP3W+NErFkpwT4dxXgjp4kSxhlNGCaLz
 F69wq7CEx+6fwXhIpYVOwLyJxoLyGJXe5vbwpMoOTPjHLF4JizAZVuZ6/lZrwTtB/l3a
 4f45sRhe4S8kZXEbHc9aa/2VTgSYfDwRJ0hx3asqNhNFKgaBUwXGB2WMVR/dR5y8j0uO
 Sv/NCxON9mizzMGvqVAjC9csSdaULklfBknkEszsPrZ00v4lfcWOHpJnrBekR2oYICMC
 AjBw==
X-Gm-Message-State: AOAM533bw6Vpgd8XTO01o74JqbQE23W46/E2qnZOzBSLF0wcxCfZybuo
 K5T5pyXd8H2gi/ZTiRspRA==
X-Google-Smtp-Source: ABdhPJyof2S988VwMuNZcB9U5XecU80emaNMSFoZxgT+mxIr6cGyJM+vro5tIuRKk2C7lcM5e49grw==
X-Received: by 2002:a05:6808:1301:b0:2d5:4226:87e4 with SMTP id
 y1-20020a056808130100b002d5422687e4mr9716207oiv.136.1646408241690; 
 Fri, 04 Mar 2022 07:37:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 m26-20020a05680806da00b002d797266870sm2690848oih.9.2022.03.04.07.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:37:21 -0800 (PST)
Received: (nullmailer pid 3983773 invoked by uid 1000);
 Fri, 04 Mar 2022 15:37:19 -0000
Date: Fri, 4 Mar 2022 09:37:19 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <YiIyL+Vd1zWiDKbm@robh.at.kernel.org>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220304095458.12409-2-angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, daniel@ffwll.ch,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alexandre.torgue@foss.st.com, ck.hu@mediatek.com, devicetree@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: display: mediatek,
 mutex: Fix mediatek, gce-events type
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

On Fri, 04 Mar 2022 10:54:56 +0100, AngeloGioacchino Del Regno wrote:
> The mediatek,gce-events property needs as value an array of uint32
> corresponding to the CMDQ events to listen to, and not any phandle.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,mutex.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
