Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A747A4CD80B
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Mar 2022 16:37:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 707CEC5F1EF;
	Fri,  4 Mar 2022 15:37:38 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4FDDC5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Mar 2022 15:37:36 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 l21-20020a056830239500b005afd2a7eaa2so7749991ots.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Mar 2022 07:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r+7LdT2y9uXyeXQDCwlxps28MTYEq5fDPijsqcJwyto=;
 b=ZmriI0IAsR1gIKynxfhj2Cu24y76vgw4LEpO2l4HusD93bwTCMSG0hL14FwrCbDueY
 F7eFcxpYqnmm11BUm/Rt5UW907y8kAcIL+p7wHDl3fdRyQsc9YKGSBrnuE/0XJEkBnvP
 X9cN1t0KrutYyDsw9HmzhqkqKOzXYouh4okur+OEuSAAWw9wwz7FmbCWofw01AR/+kJl
 /JoonTq9ig9CkmmhZli9Ja3QdX6kPAYwuBTSWxkQFB3DcDGQsqPk3gqQt7+2MVaGDMGT
 JH8/tHW2PQ1Apth6a+SFvtuj0SUIlE39Ksp/ncTdqKNriBqsyWtxAuRXxkmtjpe0lvVT
 AbKQ==
X-Gm-Message-State: AOAM5333AvWJdKDmea2QKZqykN6wrBJue35o3hR4x81a938mVKLJmv2J
 1iO/Rynhk/xuwE+HExd7fw==
X-Google-Smtp-Source: ABdhPJyS8IcggXZIQLqNgBK43mnyO4KB0rLd++CNegRmXhAPHh2bGQ7UVv06ZazIdvDbkatuCV33kw==
X-Received: by 2002:a05:6830:33cf:b0:5af:4018:fc2a with SMTP id
 q15-20020a05683033cf00b005af4018fc2amr22847666ott.161.1646408255646; 
 Fri, 04 Mar 2022 07:37:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056830054d00b005a3cce351a1sm2577422otb.28.2022.03.04.07.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:37:34 -0800 (PST)
Received: (nullmailer pid 3984240 invoked by uid 1000);
 Fri, 04 Mar 2022 15:37:33 -0000
Date: Fri, 4 Mar 2022 09:37:33 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <YiIyPUGsH5bxapMS@robh.at.kernel.org>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220304095458.12409-3-angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie, jason-jh.lin@mediatek.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, ck.hu@mediatek.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] dt-bindings: display: mediatek,
 ovl: Fix 'iommu' required property typo
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

On Fri, 04 Mar 2022 10:54:57 +0100, AngeloGioacchino Del Regno wrote:
> The property is called 'iommus' and not 'iommu'. Fix this typo.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
