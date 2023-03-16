Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 501B66BC82F
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 09:05:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AAB0C6904F;
	Thu, 16 Mar 2023 08:05:41 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19FA5C6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 08:05:40 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id w9so4208398edc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 01:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678953939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wpdl6Hym6twdRzfQa/IkeBqu6gYYM8UrFNFsPRmwB8I=;
 b=IDzW58RrWaHqufejS6WN1YFrco5gEFPtyGkiZ6YE0CDTQTPwYhs45+ZqtCzWUUdndM
 6myppwrXVRw6oXj+TzALfVZBgQhx4shJvxNpNybLLaiylBykdsTB7itAyIA0aNbOAxqR
 4C4WQjyy68GyxyaKDcIH9lfLf/SOedIgOGQ37aj0cw5ka42aEjIBL2uinWwLbxw1pg8L
 IZ3w0w3/jnIdTtUyO+evRRXfWVG7ZWOEEKA5Lz7VFDs6a6SWyDF0dkNjtY2sAK6HhfoE
 wzZ6ze80MCad4+48Er3tSShfnKhTP/9FKxesL6UXcrg7VQwQV5EGD60wDbaBjXUX1P9n
 22rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678953939;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wpdl6Hym6twdRzfQa/IkeBqu6gYYM8UrFNFsPRmwB8I=;
 b=RQfal6BOwVLsOMkgn3vkb2APXa6mNV1kKPRUWfoQmBwjG1hmkJVk+YVZjG4H7pvyhR
 phsEosg6L3iX4XwTStmXj0kDVsjtyKsajCvtDK0IKdcIqlbPoagBJQZlXG3zEj4VLu8v
 lVtZhjhF9K/T4YvaH9zxZ6PDLWu3UFkFENyxoV+5YmXfrBQDNyidvcOqQ/DChxlXQk4N
 W4qF3K7LnIlImD5QGUjAEcRfYuDd7rf2BcjH7tfMGF/pKEN7c4UpGVrR+uKBYhNpz8Ww
 oi4eOBBfi5ZkVNW1HvJZN+yfYz9UcuRzSclkhCK4aYj4mmmYQGZBK6rwJQgUiNQSy7C5
 F3bQ==
X-Gm-Message-State: AO0yUKUKJ1fnDmbcO8xFHLmKloFRAE37ePurBLJ8htSMmotbvPwvk1cl
 xbP1nDhtuO0CRB+Fe+6DUQvRgA==
X-Google-Smtp-Source: AK7set/iRPVqQNT1Z7S1buHPT0nh8+U/sneb6I0D/7hqFeN8kjEEcNpRmmsfQ1g69NTOISJI6yFYfw==
X-Received: by 2002:a17:906:3c44:b0:8af:2fa1:5ae5 with SMTP id
 i4-20020a1709063c4400b008af2fa15ae5mr8454247ejg.53.1678953939596; 
 Thu, 16 Mar 2023 01:05:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
 by smtp.gmail.com with ESMTPSA id
 jj17-20020a170907985100b009300424a2fdsm793608ejc.144.2023.03.16.01.05.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 01:05:39 -0700 (PDT)
Message-ID: <08925242-4c2c-e149-39e5-6ee16ba17cbd@linaro.org>
Date: Thu, 16 Mar 2023 09:05:37 +0100
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230313225103.30512-1-Sergey.Semin@baikalelectronics.ru>
 <20230313225103.30512-9-Sergey.Semin@baikalelectronics.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230313225103.30512-9-Sergey.Semin@baikalelectronics.ru>
X-Topics: 
Cc: devicetree@vger.kernel.org, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 08/16] dt-bindings: net: dwmac:
 Drop prop names from snps, axi-config description
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

On 13/03/2023 23:50, Serge Semin wrote:
> The property is supposed to contain a phandle reference to the DT-node
> with the AXI-bus parameters. Such DT-node is described in the same
> DT-bindings schema by means of the sub-node with the name
> "stmmac-axi-config". Similarly to MTL Tx/Rx config phandle properties
> let's drop the target DT-node properties list from the "snps,axi-config"
> property description since having that duplicate is not only pointless,
> but also worsens the bindings maintainability by causing a need to support
> the two identical lists. Instead the reference to the target DT-node is
> added to the description.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
