Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3B9939EF6
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jul 2024 12:48:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4E17C6DD96;
	Tue, 23 Jul 2024 10:48:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5934FC6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jul 2024 10:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721731683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=is9xWIZrvGL56gb6eZbS8C1QxeZEh2O1wu5yRn9CgAE=;
 b=X24l/kxeg/RdlXJ0dsgX9ztzX/wqzipTQunTHuMZBLohc2k+OPmb+ANwMlXhOZbBxFrOAP
 IYDX7uhEdoovWbndO08FMo9zaL0X2vvFGWSs3Vt4FketUujJlQWXQfvIVGhxnIrvmGU3fT
 I42lEw3qW/gDG5mn9gp9hVKIfaIz9wg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-5ExD-AjjOTamCzdrJ-yF9Q-1; Tue, 23 Jul 2024 06:48:02 -0400
X-MC-Unique: 5ExD-AjjOTamCzdrJ-yF9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42660e2e147so3355445e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jul 2024 03:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721731681; x=1722336481;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=is9xWIZrvGL56gb6eZbS8C1QxeZEh2O1wu5yRn9CgAE=;
 b=javYE4H3Ti166CP1RKPar6JBcrJ0EUGFhR1KR0HbUdcIWGyu9howEFe1JoaQ2FOCba
 KpR4sezfBZayTjSbHpwhe1/iciL40CaCzlYsarxgXEp0nLaEWAg80DhSfh1fjTdKq96x
 mBqzVajS/RP021bwBW5JHBkuFPneTFc0KXuKElXXEFSylWGoxKPs0LlWmLpQaCQynZ/X
 w7OZWFXMjUxiB02STxJnKQTcSYLXVzcYxreXk9K18EQ272+8AH4m/R4ETMHdXb/rGI7L
 WAV/o5T9j2CBgGXDhd0ZofcS5oCkOhCn+eq6Z/mLFUubz/81n5dzxdf19VR+0KlxkFZZ
 i2fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLi40xvJcocNYKO/HLNgRZKalvZjIA20wv8YM9IPOLdmW+1Z1aqKlWMu0kMxSm/wHhdH+4zJWaJSbfWw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxWtS7OwnzhiXtClzbG0OYIyvDjx4eXBBVgK09gQePFapyqmAMq
 aX/livRex96WZ9rxUQAXiX/tEQIiFkJbsUwf2k8hEKxHGDFvA0iAVnP0UkNZF3GZf/SY+O3lcNH
 WljkjROxCAMybYLFwZ2Eojou8bvgzcehGEWXV1/EBqLer9rLY47P1wy+vQ8zql1kOUKfjaPJqsH
 XTJQ==
X-Received: by 2002:a5d:64aa:0:b0:35f:1edb:4695 with SMTP id
 ffacd0b85a97d-369b69b281cmr4252141f8f.6.1721731680711; 
 Tue, 23 Jul 2024 03:48:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE94TBZ+l9LWmG3AlUC+F3co0i3kwynKDwsEMBfPu08pu42j4GyNtxN5Bczw3XZRNRFgmnKqA==
X-Received: by 2002:a5d:64aa:0:b0:35f:1edb:4695 with SMTP id
 ffacd0b85a97d-369b69b281cmr4252128f8f.6.1721731680185; 
 Tue, 23 Jul 2024 03:48:00 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:173f:4f10::f71? ([2a0d:3344:173f:4f10::f71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878684225sm11265579f8f.9.2024.07.23.03.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 03:47:59 -0700 (PDT)
Message-ID: <b9517ec9-dbe1-43c6-879a-438defdc201f@redhat.com>
Date: Tue, 23 Jul 2024 12:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhouyi Zhou <zhouzhouyi@gmail.com>, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, mcoquelin.stm32@gmail.com, andrew@lunn.ch,
 linus.walleij@linaro.org, martin.blumenstingl@googlemail.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240720040027.734420-1-zhouzhouyi@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20240720040027.734420-1-zhouzhouyi@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: "zhili.liu" <zhili.liu@ucas.com.cn>,
 wangzhiqiang <zhiqiangwang@ucas.com.cn>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix the mistake of the
 device tree property string of reset gpio in stmmac_mdio_reset
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 7/20/24 06:00, Zhouyi Zhou wrote:
> From: "zhili.liu" <zhili.liu@ucas.com.cn>
> 
> According to Documentation/devicetree/bindings/net/snps,dwmac.yaml,
> the device tree property of PHY Reset GPIO should be "snps,reset-gpio".
> 
> Use string "snps,reset-gpio" instead of "snps,reset" in stmmac_mdio_reset
> when invoking devm_gpiod_get_optional.
> 
> Fixes: 7c86f20d15b7 ("net: stmmac: use GPIO descriptors in stmmac_mdio_reset")
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> Signed-off-by: wangzhiqiang <zhiqiangwang@ucas.com.cn>
> Signed-off-by: zhili.liu <zhili.liu@ucas.com.cn>

Apart from the more relevant concern raised from Andrew, please note 
that you should avoid empty lines in the tag area, between the 'fixes' 
tag and the SoB tag.

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
