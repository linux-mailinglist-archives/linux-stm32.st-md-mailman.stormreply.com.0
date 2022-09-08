Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F00ED5B1DEB
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Sep 2022 15:06:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F5B2C6410D;
	Thu,  8 Sep 2022 13:06:54 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78BA9C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 13:06:53 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id q21so13392913lfo.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Sep 2022 06:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=gOAXxPoSqwbSOG0ofk9DT91+7QBHKnohIB4quLfJkAk=;
 b=i+RfaVmr6TwYbrjKu2rs37bY30XQzhyA7yLm4s9A22Uu+/HQYoKfOy5Q03iILzxn65
 6NjhMKI92f/OlDQunY7TBeXo9SKKxkIw89N/07527phtr5Bp1ly67fDqatRR5S9spGBN
 mdYeT6DfN5K1a+fvCDD+94yXS/UAH2WXTnxZ17VjF6pW7Akk0qHnlLc+QKVHKiMFcrpP
 cPkFIMjqdfzWFGWn0ymj4wGf5NIFAvG+Z2078mv7kYKNBZtPQ9rAz86zbmlHA8F0U7Uz
 sb8k649vh0kUt6smBTqEHiugCuLgC4ZnJcji4aaAL/hQBUkyYZQv6DD7FWW4YpSYMHeJ
 mbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=gOAXxPoSqwbSOG0ofk9DT91+7QBHKnohIB4quLfJkAk=;
 b=1Nj3qf0foYJi3HlljNozBAZYgzrmlIJYhjdS98HrOeYHTgzX9oYns9y7wLUytfHtgH
 fFl9yhyDQu89xc1xhpsBx47qkPFJNeRRbwQ42Gn+8NJcGX+wF7GTucSWXoByDEM/mBPg
 hX2+j3aLDdOkyGSc5WiDCHD+yfBbQNbE3xfYIvyCekLNP+uOirpMLK33bUCT12iV0Dhl
 8ZiP/JVFAvM/e0dSX3rfbgiSNZYLfARBnojvzkP7SDwq+5WQt7Eo8oC2BGI+GjFIeIkA
 oL6MCCBifTspp67dx1hmqbAFo+DQV8+qmfj5dQK+1CCqRMferbN0aVO3/xnB0K2+Xk+K
 robQ==
X-Gm-Message-State: ACgBeo1TKqJEtYaifTpKEvJxVUSiT2nx36LVVydtquT//tmywLPlbfsL
 vwL3MIgdM6WWdp2D2pVkc9sHfA==
X-Google-Smtp-Source: AA6agR7AH0qv7axgXMrX7mRX46ybs/CgAIoyHustwbaI5FQqFhUa2Ora0+qrERSUdxYriHwxcymxYg==
X-Received: by 2002:a05:6512:3f90:b0:48a:826d:f727 with SMTP id
 x16-20020a0565123f9000b0048a826df727mr2541872lfa.281.1662642412767; 
 Thu, 08 Sep 2022 06:06:52 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 v7-20020a2e9247000000b00264bb2351e8sm1623322ljg.7.2022.09.08.06.06.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:06:52 -0700 (PDT)
Message-ID: <cfa357f6-ac12-c391-b3a4-0175167dd358@linaro.org>
Date: Thu, 8 Sep 2022 15:06:50 +0200
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
 <20220906084449.20124-2-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906084449.20124-2-nathan.lu@mediatek.com>
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 lancelot.wu@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v2 1/6] dt-bindings: mediatek: modify
 VDOSYS0 display device tree Documentations for MT8188
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
> modify VDOSYS0 display device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
