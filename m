Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF6F5B1DFA
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Sep 2022 15:07:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B07AAC6410D;
	Thu,  8 Sep 2022 13:07:33 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B185C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 13:07:32 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id x14so12256021lfu.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Sep 2022 06:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=hkN5lSEGT0XqyIIogV66h42SfZYhfXdkQkWQQNDRmT8=;
 b=OnaGsfvOCLtQSBc0ze/XDCrjMs3fvJ8z2lVuT/jXY3Zah6Btqr6O8o+Y/xzaDCsGFQ
 aNTn+Tad04itVfSFKUheRnqoKDIPvs74oU2qn5UXwtbVp9MdLGGK6UrfiaX6oPKzYM8L
 iYiuJO/B/2FMpIuTMicaPRvUzM4uu8CFTorze+v9/JExL4YuwKOPfuy6SmY9LzTKN3CC
 pOusfnV2vFIqyVn2EG9BhUNURJE49a21kmlxwOCnqQMWVvSI4x43iNTbzaWm6ldSo8Ko
 WQZV7wfAXQ5YPo0rxq7Unw5lA+FF7KNsezgXrt5Tt4RBUggcRZQtMFdwwyg+X23ERZoC
 FFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=hkN5lSEGT0XqyIIogV66h42SfZYhfXdkQkWQQNDRmT8=;
 b=uUyucEF1EFWwIVD1Z0k583br1CUyJjxWYIYYO8ElTqPtN5iL+/af8pkP8LtjqcOcXV
 p7brogET+48N8rBj2TEciTsszEkp5/S4Rnv6AygcPM5cUvysInpQigMN2CUxnBIE025R
 a1aqa90FRzwGSnu85D9+csDuGoTBbcdgrsem/xuXMIs/ZPIx16citP60zhCahtlj4HgB
 lMib5yy9V0/7lg8UiLCIkLZ0+zm6JBeto78vutblHwYpjORVN4m3TlEU9fMimDdKFP29
 T4FrDmvFuxhxbz1EHoeEzJiZ2iQTUFGM+R931EfRB/2z3qAac9gHecuesEpZeBPVNV+s
 zOvQ==
X-Gm-Message-State: ACgBeo2pdTy961MQnNZdlnLHaa8GsMhRij8bKkKct1MXGZXfco4gZyo4
 vSAtrgGCvcSFOA7xLxPsgaN1Vg==
X-Google-Smtp-Source: AA6agR57T3t8+MMpI2KHy8mvLQohvoJxFPM7ZK6FI697GqmZFiRdAtbnPNIFqulD/7k9bQHxePp8gA==
X-Received: by 2002:ac2:5107:0:b0:497:adac:7305 with SMTP id
 q7-20020ac25107000000b00497adac7305mr1643133lfb.32.1662642451447; 
 Thu, 08 Sep 2022 06:07:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 o10-20020ac25e2a000000b004976809d6a7sm1697850lfg.283.2022.09.08.06.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:07:30 -0700 (PDT)
Message-ID: <55f76b33-fa27-d8bd-8fe2-9aaeacf2c9f9@linaro.org>
Date: Thu, 8 Sep 2022 15:07:29 +0200
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
 <20220906084449.20124-4-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906084449.20124-4-nathan.lu@mediatek.com>
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 lancelot.wu@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v2 3/6] dt-bindings: mediatek: modify
 VDOSYS0 mutex device tree Documentations for MT8188
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
> modify VDOSYS0 mutex device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
