Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C3F6C1C61
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 17:45:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 785CCC6A602;
	Mon, 20 Mar 2023 16:45:53 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABBF9C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 16:45:52 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id eg48so49117651edb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 09:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679330752;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K3T1LPv1K70J3JuBzIbTNRHXgTwj8NY1hYmQMPryDkg=;
 b=pHM15ySsN+x1vypUH4DKrKjtcuCi+sDsrUICtxNGaQ9WMBPB1Mr5pJl1rYYgraURQ0
 vNDsyf48UgmQcrUsVvC4ao72qGIoEuaCF2rMx1OoQxCAmogaNS4Hfnu+kVDAl4jZCOW5
 TGmheZof1cmBVQD9fsXZF+HjhbKu9JeIc0LdN31haZlnWf86mucFK5epnkUfKRZgZk30
 3SCIYErCFvCPfXADnlS+YiW+NXOkLxfCdfrqvJg/alj0tIQeYE4mAgAyGsdFH68Elc1n
 dgILrbXL7d/41Na1uRoH4tPhB3reW/K7giz5vf5gFreiucW+flAGUoXS6p+twVxxeoyB
 Ey2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679330752;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K3T1LPv1K70J3JuBzIbTNRHXgTwj8NY1hYmQMPryDkg=;
 b=pGo2MuvAR1WLMs5ot89n5Z+gP1es6bZ9xq5hR1QF5X1DCx0UMbyXRFw7vZmrowERG5
 qPrPoGrNpDVevV/GM3jmnmhXz/kuaAQsfNV66mIs/+nKs0WVqR9Vs96SdUXh8QVEoa21
 SJGZcT+nKABoE7p3EtYPmpUJ9mVSMUoNZDi/MAB7SmUxbepSqZpiT6bowgVabxSoaBlx
 +YXZ6MNk7aB4KiSkXU87aUzLsTgvnUdyyyuVUmCdVvyAITaBXMVVRzFaSFBlNp64aQdo
 yNFBhqtsMv5i23G0QGe/JK0O4cW+1v19/q/kMD65ravoqjHClpto3IYlCxcM9RuntZU7
 YmWw==
X-Gm-Message-State: AO0yUKUiiiXeuBXr95KZ8QjlTzVK0l+gxilYJcYL+dqCHBwr39Og53T6
 OYVDDjFIU0MUhGsMLh8UN+n1Zw==
X-Google-Smtp-Source: AK7set9JkBaxsjpNVS4TqrKVAg5N+Zo9mzzcVIk7zoedDZNpbcE9LmYckt7ZGz+KLpSbMaB8GaPd4Q==
X-Received: by 2002:a17:906:590c:b0:932:2874:cc5 with SMTP id
 h12-20020a170906590c00b0093228740cc5mr9239993ejq.16.1679330752142; 
 Mon, 20 Mar 2023 09:45:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:458e:64e7:8cf1:78b0?
 ([2a02:810d:15c0:828:458e:64e7:8cf1:78b0])
 by smtp.gmail.com with ESMTPSA id
 bu6-20020a170906a14600b00933c52c2a0esm2043336ejb.173.2023.03.20.09.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:45:51 -0700 (PDT)
Message-ID: <7426cf61-957e-077a-120e-5c3747ee0e20@linaro.org>
Date: Mon, 20 Mar 2023 17:45:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230320132755.2150384-1-s.trumtrar@pengutronix.de>
 <20230320132755.2150384-9-s.trumtrar@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320132755.2150384-9-s.trumtrar@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v5 08/10] dt-bindings: arm: stm32: Add
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

On 20/03/2023 14:27, Steffen Trumtrar wrote:
> The Phytec STM32MP1 based SoMs feature up to 1 GB DDR3LP RAM, up to
> 1 GB eMMC, up to 16 MB QSPI and up to 128 GB NAND flash.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
