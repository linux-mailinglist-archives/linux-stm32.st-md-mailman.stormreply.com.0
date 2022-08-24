Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA6959FA4E
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Aug 2022 14:47:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70294C6410D;
	Wed, 24 Aug 2022 12:47:46 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 792D7C0D2BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 12:47:45 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id z25so23862614lfr.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 05:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=HCkgWRsW68okr3HXj1aoAUOQtm+hBGu9v0QWmb8CPe0=;
 b=dWZ3lQkmAteiBhKIEs/l5SZZCUZ8+DJHs4otLWuEp1SbpTaZMfllrzHhq/mFEmZKV1
 LqkkfKqSJRt3ev3DV5xT0uCY+vPYIQIp2xelATaYKsNjcC2VaqaVDOZASKrYV9GUHk+u
 NGWbqEo00loFNO8FqKz67PHSIS+7q2nFag2WMRX0FmgX/xHr8hyE8ikCqrXNsOVl7Dhm
 w+MjdLXOUozbIBTCsOsIKDn2hZzsuTGZj30Dmtu/oASHN8wU5if4RptL8yPwWkzOIKB8
 90X5WJJaEXaeOLfBz+v5NGi0g0y4OCI9xibJAF2F53ib6vbc9eF/iI5ZRtzG3uaIsdMz
 LUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=HCkgWRsW68okr3HXj1aoAUOQtm+hBGu9v0QWmb8CPe0=;
 b=cveJ4rRRux+O+AW/IKvqcSKM4nT3cMKcwpezgnNGBhrmjqteLHmKVD6x+NOfDhUfrp
 EEhJAmeXE41/NsOioUxwovuRSUiWEpAZQUnUpRAMzFEHNzClB6Oxh8I3TlsKVhQQUaHp
 XKTUESMTCE4onUhzbPJ11Nq0ctw4n0SSCYE9yersWVAS6/5aUZzfIJavWlXXlJTg/L6e
 qjSsC42JgAN8DO732Ub611jl1pDJ4T8F0sIEuh2/fbP9XYWZgTYT7+0iCPeV2jI1Mahz
 +c7pcIuC2XB1mx4r6FbMFl3wZi4W9zU+lVu5Z0pbo7yb5K8KJk46u9/KWPxF9cB1PlBq
 hXoQ==
X-Gm-Message-State: ACgBeo03y8wxZydARUlKKkdCx7EIW79fivPVmxGl9S/EleXUINCCwBF6
 aeW291K/SI6qCGMZ+dj0J78kbg==
X-Google-Smtp-Source: AA6agR4eNUBQjn5HPo5JYDP4s9gU6xJOSJTUVA4FpSM9g3v69U0V1OpMhgoWrItrdVqemUex9AHSKQ==
X-Received: by 2002:a05:6512:2284:b0:492:ca50:d857 with SMTP id
 f4-20020a056512228400b00492ca50d857mr8249169lfu.209.1661345264775; 
 Wed, 24 Aug 2022 05:47:44 -0700 (PDT)
Received: from [10.243.4.185] ([194.157.23.230])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a056512138300b0048b07e82b8csm2996630lfa.55.2022.08.24.05.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 05:47:44 -0700 (PDT)
Message-ID: <91c2bf5f-8bbf-22be-bd57-a535bf4b95e0@linaro.org>
Date: Wed, 24 Aug 2022 15:47:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-spi@vger.kernel.org
References: <20220824082130.21934-1-wsa+renesas@sang-engineering.com>
 <20220824082130.21934-2-wsa+renesas@sang-engineering.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824082130.21934-2-wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Reinhold Mueller <reinhold.mueller@emtrion.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: argon: remove spidev
	node
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

On 24/08/2022 11:21, Wolfram Sang wrote:
> Commit 956b200a846e ("spi: spidev: Warn loudly if instantiated from DT
> as "spidev"") states that there should not be spidev nodes in DTs.
> Remove this non-HW description. There won't be a regression because it
> won't bind since 2015 anyhow.
> 
> Fixes: 16e3e44c5b87 ("ARM: dts: stm32: Add support for the emtrion emSBC-Argon")
> Cc: Reinhold Mueller <reinhold.mueller@emtrion.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
