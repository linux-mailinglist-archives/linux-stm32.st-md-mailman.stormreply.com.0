Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EF0A9AF0E
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 15:33:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E035C78F68;
	Thu, 24 Apr 2025 13:33:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F168C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 13:33:35 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cee550af2so641345e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 06:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745501615; x=1746106415;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=UbmLFXgx+9vZ6ijebG1uGxW4ic4rHWH1tDchx00iFW0=;
 b=MhlaKDRPmDpeF9/4i36IuE4ZRA0dmS7pktkFKGcHhg76781uTJpXsed2EtYM1E5J1h
 aYGKYQeKaTwsOtIuXyD6UdWu9jmTEtWXZXNgSvlEDbRxIw24ZVawDANjVYVtXoKWqJAC
 Tjm8cw5xPfOuhQ7IhPIxr3FQM6Qohg49RB1V+BtKzT5wIr6IdOtbtkGXtiXL3x3bfPS/
 T/LBkWPGhQ+YvwvkwANYhXwV1221Yohwrdoxlvv8r/m0pw3pe3Am7PDSag3TDA9emw0+
 ANUYu/iMXIC89w+JnUqAzDXJmDl0FkoMnhh7S21LLe735VVpX0oOEdhYCG3WSMYc5uX3
 h8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745501615; x=1746106415;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UbmLFXgx+9vZ6ijebG1uGxW4ic4rHWH1tDchx00iFW0=;
 b=JIL0DtEQ5CMDPPZdNYCX967voQ9lbVP2JwPKKJeUcSgv2NB2O7DXDmrrYu/kRvNBBd
 9u3LbjF+mHd6RW2425BJga9LfDhekb38i86iRylZDxCWAcq++aRRpxgP6t8RUT/UhZvB
 82Ldlf04AjoAz2OidefwIXvJsUHdanKBpUAjfq8vMsLVUeLycJkMEUlLpj+6otbkwHr1
 RZpA+pyV2SM29Cgky407hmPTtKyY7fKsVtkyEjMdjZyM5BFMHIBvy8Owxlm5jQnE1zVJ
 kJk/v+X+7yVr3BeK+e3KT9B0hYBohXkxSJOCJqGh1XvZigKPF5Cltg2YAf3Z5FCd2uZP
 KTJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/VPO6ZGDwSQ6SFERJOANa2oXgaa3xocgnX9/ii9xd3z+Hbt1H/xYGn1lF+kWuQaRSlqK+5v/159oc+A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx/8UxAbgmvCoXeipsERUZA8kdnprGhJAyYmYCXA2Nlb50yLpR0
 EFS6jf43P2jDHvqhK5VvDoPykji0pYjtUJ94e9GVTbRI6b8kwDcvg1FZXNvnX4c=
X-Gm-Gg: ASbGncsj/Bb1fKDU8tTrzVxWHgZF3/3AOl/jGcn0A7cXr+Fzl5cT2pqpRsGRxkSSE7n
 YUAetu2q96P9Ys5GryRki5n1B4xxNNCsveb7UBPvH5jQrgIeB2BsFoksXs7HYpuBR/neHU01nXI
 04vkMn2OcDoGnIKow+EG+XhYRZ+6R0bmbsDkYQDCu39vn6p8x1zrZCmXavWvGWm0PagkVrJy5mD
 jO6aGCKnXsH9wnIxq8JkO9YX97z+sWlFI8W1OWaMFy+Go39Mmvs+9ntuENaxcNqXHMbWNlUfsHX
 ADyXQrra5y17Y1vTig1BESxIKE0+Z5kMl/qLCFz+AfMwA1EqXwyJlX5MT/w=
X-Google-Smtp-Source: AGHT+IHobLnqEdKEX69C7OFDDwylbOq1UzHJd/uP6bHKFs0BfgK/nGV9KzadE0I2ECUqe070spU4JA==
X-Received: by 2002:adf:ae0a:0:b0:3a0:7119:cefa with SMTP id
 ffacd0b85a97d-3a07119cf5bmr109427f8f.16.1745501614718; 
 Thu, 24 Apr 2025 06:33:34 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d4c0bfcsm2164111f8f.39.2025.04.24.06.33.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 06:33:34 -0700 (PDT)
Message-ID: <2c56553d-dbd1-4eda-bc5b-3a54c1152bef@linaro.org>
Date: Thu, 24 Apr 2025 15:33:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
References: <20250417151623.121109-1-daniel.lezcano@linaro.org>
 <20250417151623.121109-2-daniel.lezcano@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250417151623.121109-2-daniel.lezcano@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 S32@nxp.com, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Larisa.Grigore@nxp.com,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 thomas.fossati@linaro.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 ghennadi.procopciuc@nxp.com,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v5 1/2] dt-bindings: timer: Add NXP System
	Timer Module
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

On 17/04/2025 17:16, Daniel Lezcano wrote:
> Add the System Timer Module description found on the NXP s32 platform
> and the compatible for the s32g2 variant.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
