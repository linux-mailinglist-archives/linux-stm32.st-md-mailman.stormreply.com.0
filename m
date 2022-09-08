Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 880725B1E48
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Sep 2022 15:14:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 203B3C6410E;
	Thu,  8 Sep 2022 13:14:12 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34875C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 13:14:10 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id f11so13646487lfa.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Sep 2022 06:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=d6L8J87aB1v86b8RgudDsS+xKsHjOOrMMFG5XtkLsqo=;
 b=KHawKIkFgPkUxVPkrjS1pBxHZgetgHTNXzqxeOnAcSGLyIQMDySoPJY0z20Bkyivns
 RPFgcCuGjz4+xShlNPgjCl+R9EueMyB2ktLSK2dZpqECBuL0feaVHYpwNepFy7K7tYSu
 2KvMpZD6jpzhfIwYGIZKHCxFgYI5bGqvoTmZWHyH8sMHA5ne2vHmdeHMcUdzXfZxdrrB
 DrvjEFNw6NB0C4OcfJ7W298bdxJKmhSiODQpTt1GczHtkKhnZfrsDf26fCWUok8Y0zbT
 DyXGnZFjOllz5290Yz1gzA/LcwKkLPd4YWczB9p99j3HJhONBxS5BBuVJOE3kBfLtayx
 ge8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=d6L8J87aB1v86b8RgudDsS+xKsHjOOrMMFG5XtkLsqo=;
 b=0kdacu0rxotQmmNzelrCwvs8ooJhmF0oElORwWgjJcLwohmq5xQPZweZ2XYINrrPfF
 Pwbv/KiqKitSRadDE0iN+UOKHW0TpT2z4PdENu87KlV6is9A5ZLbBPRV2iFG/zY7n+4k
 palEMGLHwOtWv63DoP+b3lh48wGUJcAytYsN7LmGM0b+oE7bAe+CsCJ0zsNXy5Eti8MW
 Wp+4Xppvi6woRT8rNNaY5R6kHvBlb+CqZ9TrcuANCvANJXxLLer0AfJfSKGOPAYV+iTw
 76mAjpoTyxn3j43b2yBQNI7dt1QCsbnxzpN/YTy3qzaCtgclbclR2CLSQJoaH0QcmQkZ
 uROw==
X-Gm-Message-State: ACgBeo0Lk7TH3TOEwEPZSGSc2f4zvf+zt3M/VQIY+LVazNMKundTP8PV
 aHoe8EPK/agUzNZAeeWmrJvZ1g==
X-Google-Smtp-Source: AA6agR4avfuGtI4mV/LW9eH4t+t9Zcbij4SZp+wKUzY4VSoj42JgpHx8sPN67mwk8vwBWDoNPbikJg==
X-Received: by 2002:a05:6512:3f05:b0:497:9e06:255b with SMTP id
 y5-20020a0565123f0500b004979e06255bmr2549468lfa.175.1662642849511; 
 Thu, 08 Sep 2022 06:14:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 w22-20020a0565120b1600b004946d1f3cc4sm3028045lfu.164.2022.09.08.06.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:14:09 -0700 (PDT)
Message-ID: <cd896ff3-47b7-43eb-c821-8c5fb53c6ae6@linaro.org>
Date: Thu, 8 Sep 2022 15:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906084449.20124-1-nathan.lu@mediatek.com>
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 lancelot.wu@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v2 0/6] Add first version mt8188 vdosys0
	driver
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

On 06/09/2022 10:44, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> This path is based on [1] and [2]
> [1] Add MediaTek SoC(vdosys1) support for mt8195
>     - https://patchwork.kernel.org/project/linux-mediatek/list/?series=658416
> [2] Add MediaTek SoC DRM (vdosys1) support for mt8195
>     - https://patchwork.kernel.org/project/linux-mediatek/list/?series=665269
> 

Can you stop ccing internal/fake/non-existing email addresses?

Your message couldn't be delivered to wsd_upstream@mediatek.com because
the remote server is misconfigured. See the technical details below for
more information.


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
