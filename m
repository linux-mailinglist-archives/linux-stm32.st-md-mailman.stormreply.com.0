Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C88CF5B1DF2
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Sep 2022 15:07:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BB8CC6410D;
	Thu,  8 Sep 2022 13:07:07 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4939C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 13:07:06 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id z25so27655870lfr.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Sep 2022 06:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=5u6/MtXpxn1tTwAaduJUsG0IZt/fBpU15ZKPc1fiE2o=;
 b=ehPfB6s0nVoR+tfYmVzHTZew8S0nkhf/njyDNfgALVDMbGOdgHuGGmQui0Pd7WnIsF
 I3JDjrelF0pvS8dBTeBTtCZc8FneI1LHcuAFJCg8RicNTf6nRpUjcfWcM0AR0EpgScdJ
 yvtWWmj6+anIcTY/ll1vMJZV+kHOAn+Bso7lm/mzGAZKtTDAdHRmZzAglSa9AOo/5Lgv
 ftsdKfEsM8lFNMy8ljTbmhzHftdY9nEWVi0dkpR1/FoN2XMM3756dODbS4srP5aCoeko
 JN0omm9q5QGOZhll2wwXkOHiCqv66gb6+/Ad+QJz5I62NEGPizwF0b+PJmcqGwlIHj4I
 JExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5u6/MtXpxn1tTwAaduJUsG0IZt/fBpU15ZKPc1fiE2o=;
 b=2uYqMwGgzoLzDkNXrUA89cwnVzTTUOHgyY3oMkkayTHeYOzMJ/J4MLwmc+KpikJ9dL
 1ImclpvcrlaSu4mWmRh2/MXtxwm+z3xSTHaW+XwuhyPL+ck0K7s13tpIawBaMHrd/myP
 DnVn7AoegdRsCC7hYJ1BpyN64fggAO0vNjNtJSqDQxugZ7JDt6FUezC73pMFayTwnFV4
 Tw4UXUFrtiP7nXmAQnHpTUf49/CV92kXDNUnqwKQV669Sao+jbkjUr/gohiYtt5d+8Vz
 yBlaqYAaE8dW8GZ6kyWb0onF8J6yt1BnojDPIwT4ItBp0J7lTWRkR1YQIVfwszsIiHOb
 ONgg==
X-Gm-Message-State: ACgBeo2Ao654aIMCHxFyROUULAaQQsmoMgZ+Memy/HeR+2Z0kIfGS6Pd
 lUiiqOVLgIP40t5/2PiCVCnqQA==
X-Google-Smtp-Source: AA6agR6wXnCQ6Vkqjjc03U6QxWxuJlZ7Fdfx0r4tDx4eRfk3Kfg7iqmZkdEZRBaoTN09hgyUFzPdFQ==
X-Received: by 2002:a05:6512:10d0:b0:494:7811:e673 with SMTP id
 k16-20020a05651210d000b004947811e673mr2559502lfg.400.1662642426042; 
 Thu, 08 Sep 2022 06:07:06 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 a25-20020a196619000000b00497cb9f95a0sm319728lfc.51.2022.09.08.06.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 06:07:05 -0700 (PDT)
Message-ID: <603072dc-3595-ed54-53de-e88a0579d78f@linaro.org>
Date: Thu, 8 Sep 2022 15:07:04 +0200
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
 <20220906084449.20124-3-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906084449.20124-3-nathan.lu@mediatek.com>
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 lancelot.wu@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/6] dt-bindings: mediatek: modify
 VDOSYS0 mmsys device tree Documentations for MT8188
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
> modify VDOSYS0 mmsys device tree Documentations for MT8188.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
