Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D115751129
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 21:25:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0617DC6B44D;
	Wed, 12 Jul 2023 19:25:38 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CFE2C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 19:25:36 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-9891c73e0fbso250395166b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 12:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689189936; x=1691781936;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qlC2xd+LWkAw6VtZI/SCBHO2xi/vQf/CwDed84n3xeQ=;
 b=lTzQAFm0UwnXd24PWylRYpcU0F457aHyP9KciWJkMJEWnnNM1CDllzQ4uWcH8EfUQv
 cbZrg8V55iXV0C8nY+uTF7hJl5aPxJnjV9T0geZilx5Ca0xXAKbU8yDrCIYeYYezeCTD
 LnK9GtarHRZDKWRyLhJztJPJDs+bfLXXFymXnErXhGDmgjYgkmbbsy/yjPESTQGA3IC6
 vPSBfHKsAR+Iq642bz+6uTsci/xNYrGfUkpeK2n05ltckLJGjCXRJl8BxhYPr4qqUNuo
 TvOd0aQSG1GkKzUTsXpwujhkrVkL1VFqLHYH/P+us70BQ1E3IzzJGKKGQjUMsylhYQgF
 MJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689189936; x=1691781936;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qlC2xd+LWkAw6VtZI/SCBHO2xi/vQf/CwDed84n3xeQ=;
 b=KASNBpyWx4GqloCDB6U8skQMBhCEZFXwiLkMggZxDE8MEzvcyA/ACjqjQYfujr0SaB
 GzTMs9JIsAs0yfcYc3623Va6wIc5pcAv8osuGi/yklF8QMLT0SFe4NCUyFFzFEu80UeS
 jzhsrqo9WwH4LEa9nCaZGrLD+4RVA6ORbih+iI/1c4UurD6X+rzgBS5wpjSMCEJxAcoQ
 3nJD6MLDJyzbVTtDxHaZrtaZj/W9CSAxzHz77XjOz1yZ4n8JIQ7BkIGS5ms7cy1qwT2i
 tw4Qqdw1Y0EYZSkLakvWRqbexdxnqaUWzDtl1t6DhLbgGC2bFpJ7GXqdlzS5yH4TStn9
 TWRA==
X-Gm-Message-State: ABy/qLZkAXpDS66a2W45zHUkRz39SCxYJ+w4uyv7RcGcSg5RgM9WnDp5
 SLru7v5Blyf2hVsoP4uobdfCYg==
X-Google-Smtp-Source: APBJJlGsZdGD7bEjsV+5Ybs5t0WWeawP39YFnwraXzAZG+K1Jg6V4qqvtL+9S5NUbMA6Ge3qBEZgnA==
X-Received: by 2002:a17:906:1053:b0:992:8d96:4de3 with SMTP id
 j19-20020a170906105300b009928d964de3mr4213382ejj.24.1689189935773; 
 Wed, 12 Jul 2023 12:25:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a170906661300b009920e9a3a73sm2929510ejp.115.2023.07.12.12.25.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 12:25:35 -0700 (PDT)
Message-ID: <aa05bcd6-140d-d951-2c7f-c09abf7f49f7@linaro.org>
Date: Wed, 12 Jul 2023 21:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: p.paillet@foss.st.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230712142432.1885162-1-p.paillet@foss.st.com>
 <20230712142432.1885162-5-p.paillet@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712142432.1885162-5-p.paillet@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH 4/4] ARM: multi_v7_defconfig: Add SCMI
	regulator support
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

On 12/07/2023 16:24, p.paillet@foss.st.com wrote:
> From: Pascal Paillet <p.paillet@foss.st.com>
> 
> Enable ARM SCMI regulator support.
> 

This we see from the diff. Please explain why, e.g. which boards use it.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
