Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9665531D4
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jun 2022 14:20:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26297C5EC6B;
	Tue, 21 Jun 2022 12:20:52 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 807ABC03FC0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 12:20:50 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id lw20so4756223ejb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jun 2022 05:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WGElSp8mpEadMRBQCrftcGEEprjog0OtBAkkb6JBrzw=;
 b=Zhlo8AWG/JtH6eAN1M+0taZxVbHr91fpNFwkRqNZpJlzI5i92G0MtqE7rJ3RViC9jQ
 06ujZCYLIN+ptWjGA7jQv9eeqvKJnfg6uEh9aA5pbygLEf+wFOy9dj8utQODrzfANhjr
 zzvDfYokR5rPo+FzIcQwjWndLxsa1eQYZG4XIcakxMsQnP8tdFbO4Py7wjD2KiVUv5A6
 ZuXBlObMW7sAF5fdoVoOX7DDd767QbtUkm6HUegxNmnLZzWgQ1qE9GwQDZANFcX4L1Sb
 cM6XPkqUE5xTDgJoqXCFbjJ/ay3DOUiX1FEvxoTmxdMPTWDHBxoSao4aGLhqkrMePfRx
 rPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WGElSp8mpEadMRBQCrftcGEEprjog0OtBAkkb6JBrzw=;
 b=1YWVtQ1/D72gqi69Pgw1sbTmn+uE7UauRA/MEzGM6qHI02/+qtFWaQn4evidIElzCj
 2NZhRZrVrSFHNQ0bHnyoGC5GQtfq4XuNfvirBEKcNgVgQfL2j0+L3pBWk27EAMxlSLXh
 HK4tOwriLAozs8f6lqlqZ0HzV0r9VmgAi2yeu5pi1YI1SsNx1aQqTcWkXnz/Byk94wPv
 JPEjkc4Nl0dzEn1A0NOvATZW7nCOFGrxKdjfqtGK1sJoAuaW5jkmVC2zO/9G+SMQ8f/O
 THIIer8aR0U4D8tuC4+T4O33FLNWZL740omhTgesqAvwhELQ+why9g3W9ES+2NXcNFUb
 FtQA==
X-Gm-Message-State: AJIora/UJ2a/gmqbxNPgOmTCABjHL5I1MMgbcEhzeLh+EoFiDhoOw5v/
 mEYsFFjl3a0/rvLFtEwMOr0Jog==
X-Google-Smtp-Source: AGRyM1v18K38uZKglk9Uk1W0TWPjruBF48xlJG0nVmclpeTnMAdW2VyrwDvDExZv59wwNP7bHRKlAA==
X-Received: by 2002:a17:907:7295:b0:71e:bc93:496a with SMTP id
 dt21-20020a170907729500b0071ebc93496amr17061727ejc.698.1655814050167; 
 Tue, 21 Jun 2022 05:20:50 -0700 (PDT)
Received: from [192.168.0.220] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 cf9-20020a170906b2c900b00711d5bc20d5sm7508698ejb.221.2022.06.21.05.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 05:20:49 -0700 (PDT)
Message-ID: <63b563ba-8030-798b-a0ab-84fe30efecec@linaro.org>
Date: Tue, 21 Jun 2022 14:20:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20220621101538.481143-1-s.trumtrar@pengutronix.de>
 <20220621101538.481143-3-s.trumtrar@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220621101538.481143-3-s.trumtrar@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v3 3/3] dt-bindings: arm: stm32: Add
	Phytec STM32MP1 board
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

On 21/06/2022 12:15, Steffen Trumtrar wrote:
> The Phytec STM32MP1 based SoMs feature up to 1 GB DDR3LP RAM, up to 1 GB eMMC,
> up to 16 MB QSPI and up to 128 GB NAND flash.

This is also not wrapped according to Linux style.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
