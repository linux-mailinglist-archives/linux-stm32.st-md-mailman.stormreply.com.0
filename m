Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D777383A9
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 14:24:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 472C0C6907C;
	Wed, 21 Jun 2023 12:24:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2713EC5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 12:24:00 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-3f9b258f3d8so28222365e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 05:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687350239; x=1689942239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HyrN9ABo7D1rMAlVWp90E4oDQOUS70PYpdgdCcfeHQs=;
 b=GJMQOelCjgjeElOgF/yRWW/zmO45PI4Z4cqDmYnmNbJkmD+s9SIl7CvuFMxKx1tp65
 XsSiqjvxOgs1pBN3DLPy7Voxvpwa+tfV70z9MQm3GBmUiZGmjBr38brOWf1KNvokVkr2
 co1v+fyyCXhUYsd5I0Z+aHXPCJFvScUZ3c2K4Nrma9KR9yNFbECsnahIXRs5iEnuWyyd
 nIAzoSHdP7oNSxm3cNol4d7nYfah0PqjY/qL9jqmWLfSheZ/Q6hx7mkPFuwnWZOiQY6y
 2Ze9c0hZ4IN+GNLPgQZSDl5ZiL2eRmZTILgO9qIM7219PTbnEfLfN2Qktntl2C3esxWd
 mGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687350239; x=1689942239;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HyrN9ABo7D1rMAlVWp90E4oDQOUS70PYpdgdCcfeHQs=;
 b=WJdaG3kNVcoySruka/RON3whqFRdCcH8xqPND2fzG8f4dF0UfhNZCiNZjg2wJCK4s6
 esrlo3sSm4fBjnpO9jL1RzflevdIC/P2AMcboqMto6GmQLzwlHNHjDK9P4bA0Pi3M/+g
 4wXdnQ8PbK0eEX4FjUSvRWvb+yfDUIg3dQ7WmXd7DsmzsVQZqut822Y0Q8u373f7rQtz
 bjNG4mfC+sM2BMRbtdNeA84Z2dTBz9LDj/y9m9csftmFrvtmbviT3lZBdjDpoJQ1cmrQ
 go/PTsZ9CzjN9GazT7K3dc65ShP+tue3mlsJlyp9ExWPQUAp8Au+C2XFiCLuD0EH6fQ5
 ZHGw==
X-Gm-Message-State: AC+VfDxX9WKASZP6nXzLU1iQAPOLTKiChz0MjCXPxpblP8XqSmVH8Crt
 zhMbXNp8lYGmOFY/RQp3Vae07A==
X-Google-Smtp-Source: ACHHUZ7255jwlQugIpETOZOq8b8AyBKGM97MqOJ58i/4Ig868aZxMEtz1PGHvaVgiHV435PiSRz48w==
X-Received: by 2002:a05:600c:b59:b0:3f9:b3e3:bc9b with SMTP id
 k25-20020a05600c0b5900b003f9b3e3bc9bmr6461662wmr.4.1687350239519; 
 Wed, 21 Jun 2023 05:23:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a1ccc19000000b003f42158288dsm15939950wmb.20.2023.06.21.05.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 05:23:58 -0700 (PDT)
Message-ID: <819ae31d-7837-105d-6781-c5c48765c919@linaro.org>
Date: Wed, 21 Jun 2023 14:23:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Valentin Caron <valentin.caron@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230621115523.923176-1-valentin.caron@foss.st.com>
 <20230621115523.923176-3-valentin.caron@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230621115523.923176-3-valentin.caron@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] spi: dt-bindings: stm32: do not
 disable spi-slave property for stm32f4-f7
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

On 21/06/2023 13:55, Valentin Caron wrote:
> STM32F4-F7 are, from hardware point of view, capable to handle device mode.
> So this property should not be forced at false in dt-bindings.
> 
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
