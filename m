Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E99CC6BC843
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 09:08:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0811C6904F;
	Thu, 16 Mar 2023 08:08:52 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1549AC6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 08:08:51 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id h8so4146091ede.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 01:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678954130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jqgjNRTTYxXEBu4RgHLIKOV2OMvEZgDykND/jjBfs/c=;
 b=XTd0nL85CNSMECdA4C0i9h2sZ1dQYnlDTfsrFcWMv+qzAfAn7WxJzdm1xCKhhE7S7J
 Ech53iIFir39KilPHOrlU/+sIwThxbSkxKevwxwJgQrUV8y//OufCdPPpOZDwSGwQtae
 gmvkUUH9eR4WIvKMhs0lRFEHq3gJpzoUb2IlQmQfbvQjhmk6vIXnWesO+7eMbatY8Lt/
 +ZNN4lZnwWFvJ2jEUDajXhf/6Lt/mpOZYn4mdwuJGbe0aUkZqbNAuOqFtcfOo12lrnoz
 B0A36PWIIW2NzOd+lKVvXDoKQYzM37r0ZhJGJEcPuau22/2e/aOb+QqbAmamRkWoV+gp
 VHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678954130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jqgjNRTTYxXEBu4RgHLIKOV2OMvEZgDykND/jjBfs/c=;
 b=vqFXlDYY3TpwHx5pFggPHwE08jQHe73YylqSvdhEcue02dUUkB56s2bf7AqKH9h/X7
 iexmF1zxWLGXGQ3BvA9UR2hE+tB1BOBX4TTVotHtfDFjOtDsC2X16gnUuOJfHOhUj3av
 nY1YaTB99uIbSi0HFFroq+QSUXfOESXGkoRNDkBo3GvAsvabyUlpsOPLHNz+PxcjBD4S
 E6alUCFQTMga6akMy0VQ0OdbTldwL5ihkjK3pE+Y8+NZM7aNBgeatxO5GQbZV+5OWpSH
 zhn8/O3ch4MCDOdsyl5Ktt079/B4AE6/cEq922yOss6fhvBdaUkPvW4SvCOr8NFxhuJs
 TTEw==
X-Gm-Message-State: AO0yUKWjEeopvmkqTlWJAV+AY0TwVkzlP/cBUVLwXrZjenL82+NMpxLj
 uTs44MXfTSbiAO+CJo+2I+T6cA==
X-Google-Smtp-Source: AK7set/VThqElekS4hBXOwTeyPSy1a3TkMzQZlRz5q5wXZ64tA34znN1il3ES/tPjl0A/Zuqi4OL+A==
X-Received: by 2002:a17:906:8248:b0:8b1:2614:fbf2 with SMTP id
 f8-20020a170906824800b008b12614fbf2mr9306868ejx.70.1678954130576; 
 Thu, 16 Mar 2023 01:08:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a170906d19100b008e57b5e0ce9sm3519551ejz.108.2023.03.16.01.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 01:08:50 -0700 (PDT)
Message-ID: <cee5e3d7-132c-2c6a-de11-c02ca6499231@linaro.org>
Date: Thu, 16 Mar 2023 09:08:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joao Pinto <Joao.Pinto@synopsys.com>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-14-Sergey.Semin@baikalelectronics.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313225103.30512-14-Sergey.Semin@baikalelectronics.ru>
X-Topics: 
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 13/16] dt-bindings: net: dwmac:
 Fix MTL Tx Queue props description
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

On 13/03/2023 23:51, Serge Semin wrote:
> Invalid MTL Tx Queues DT-properties description was added right at the
> initial DCB/AVB features patch. Most likely due to copy-paste mistake the
> text currently matches to what is specified for the AXI-bus config
> properties. Let's fix that by providing correct descriptions for MTL Tx
> Queue DT-properties utilized for the AVB feature (CBS algorithm) tuning.
> 
> Fixes: 19d918731797 ("net: stmmac: configuration of CBS in case of a TX AVB queue")

Fixes must be first in the patchset.

> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
