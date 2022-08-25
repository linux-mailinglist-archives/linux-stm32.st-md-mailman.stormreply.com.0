Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5565A08D7
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Aug 2022 08:30:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 059AAC5EC76;
	Thu, 25 Aug 2022 06:30:12 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1C12C08D1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 06:30:10 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id bq23so17881465lfb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 23:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=06xW1jLI62seO9Abhqf7FvVwnPtCd5zQbyZloWjUVF8=;
 b=Xp1VJitjfneppA5ItyJbrwobLKiJktUPWTA3Y1e1m8wRQrWcEUDLziByK6pc4otLjj
 WfLxaGtsT9q2g+Pf/M9H6mCz9mwaVGySTC2KCsil15m19xi0KzeJQmmaZGg1evoc5IxO
 mcuVCcZ8H+ZAksS/LnZNZGjsOdf4mrk7+wtqUvSsD2XfExoNatAshEygSvmYd90xKNyC
 +73IxW2mSkX/spKZzU80B48EZ5YPWpnVhbUVx7VjEMGb9FMeRVsOQiMv3r5ueN9aPhMP
 JhpO2ZCNHy80Dk8qZgubo0tF1HwcqmaaCDZ05OX01xcbFrXXR9bFHiGdzTRrvaqfH3yM
 /GwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=06xW1jLI62seO9Abhqf7FvVwnPtCd5zQbyZloWjUVF8=;
 b=eNzFav7cORrtZxRWW78aVVkOD3utqEr3Vcjks48vYbBADimXIjuNpzNSNezkMiRErY
 uMMkG+Whzvc0n/flLV2/YIDK3HKOAVENoSduQwfPHDXbH14YDMNqLSoyagjDrV5pt84O
 60nAtS7VQlRF707mUgc7o+MGmSCYAwqYLuhylFpcGQXBEi5f7Psl4F+K2uvQE0M2+F8/
 uzD7/A1yexbH6Z5sZQ+E/NQedAnnjCW5n1APGXDcEncLXARzerqDtua9Ac663cLkq/1x
 iF52PhC4fXNRTm3R68PXbZVV/5aklIpSmJeWbjXQZxK3C8jZ0Duk+GkrIB6RIpb9AC3k
 i9jA==
X-Gm-Message-State: ACgBeo3gWCuYvotIJnO4VkelmQmnbiyg5sNvll6k8hR0/A6VbiXwA4Jy
 sucOn2pSXshtM40yoWI1JTWloQ==
X-Google-Smtp-Source: AA6agR5voLFMZFTTgJvhNlxJQbRcDTQfj4hRCUGwRZmiTfWs0TLDdpCmpd7u6VEOeHEanOx6DfWmwA==
X-Received: by 2002:a05:6512:c12:b0:48d:231c:3099 with SMTP id
 z18-20020a0565120c1200b0048d231c3099mr634468lfu.462.1661409010359; 
 Wed, 24 Aug 2022 23:30:10 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 x4-20020ac24884000000b00492c2394ea5sm321001lfc.165.2022.08.24.23.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 23:30:09 -0700 (PDT)
Message-ID: <7c502652-983b-f282-f989-b224942f27bb@linaro.org>
Date: Thu, 25 Aug 2022 09:30:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sowjanya D <lakshmi.sowjanya.d@intel.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andy Teng <andy.teng@mediatek.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>
References: <20220823145649.3118479-6-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823145649.3118479-6-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: pinctrl: Add missing
 (unevaluated|additional)Properties on child nodes
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

On 23/08/2022 17:56, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 
> Signed-off-by: Rob Herring <robh@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
