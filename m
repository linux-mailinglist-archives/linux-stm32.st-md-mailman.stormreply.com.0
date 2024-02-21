Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBBD85EBA6
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 23:12:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57EF3C6B45E;
	Wed, 21 Feb 2024 22:12:54 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD259C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 22:12:52 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dc6d9a8815fso7088294276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 14:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708553571; x=1709158371;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zvHohG/osJUUJ6MrbAQ8TEaNGcUB4t0Qr7/JkHGHUIo=;
 b=GBRSd1fCpig8Fgg+hVyiVv6wM+PWkZJKhXoGatsMDCXU9ndY6RCpwoBNsky+68VcPJ
 GTMj0e0RitMG83bE+F29a7V+LHNeyWwXQ8dqqStXwIL4W0GR4sRGrvcoiNTmZnUm6iuQ
 Ro1B8xXBGGIMYL/G+Am03Ua6hMqjh2aa4NhTJj8HHjZN2Na68peR+zvS1tzSQFj1i5BB
 YVGtzyYLakj9RVJQw46jmw7fYf4w3WZwvo3d8F8aHC85ZuMUHDWw1Do8pt5JxNfvNCYf
 Rng6IV/ZJMb1NvNv3uKjtkJIU9quT2VD9tZrYWYFzKOf1gawSKTsi1N+nyDb97Mj57KN
 dVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708553571; x=1709158371;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zvHohG/osJUUJ6MrbAQ8TEaNGcUB4t0Qr7/JkHGHUIo=;
 b=qcCjQedH0um1RfVz/5GxLpDzWtWvn4lq5ywdveqKY5Q1HzjX4CtAZ+XYdwiNAfBCuF
 lYrXK6cClq9oZ6Ppqd/jZT2K54jNDt4uym9dEz/rfB+cGqyh3M7ZkjJ5fwOg2RXSpakw
 /RE4+sQt5XlEXmwuwRHul8UW4xrUvHV4PDRPDsnw9W+vzN0h9Nhjfw0+iddf30rwJtjp
 g4pv3TyMvehnr7YOXdX2iA+0i5NAyArI/PqXFno4A7//+vKsum3hOoIFW8iVbGcDnMPS
 fyjdxcuK6V4Drmaa/6x7G6cmbJFgJDJfjt5wSquuc0+s7DONNDN/GvJ506zhqO3tBTVD
 KONQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwn7tBt0nnTI0jTLBbBGDfOczfQc2w0Z/wSoRRRjWi6fnTpTdsttGUpHePWs8m20ItbRj54kwYDS6Fvvcs0miwj/fOKvnTNset0+KpmxrfTh1YWZzYUGDM
X-Gm-Message-State: AOJu0YyOGascc/MzCGoeP72JMEy/T56MmRiCHoohmT3rdN2idusmBJB4
 pBz00nczkQ9fZ6kDjfRQqEM1/RBoE9xC51/Wh0YWHjaxm7qix1sE
X-Google-Smtp-Source: AGHT+IF7kP+13CFMgvNV4rXPEp1sBAjlnfLwnWDRvHGUt3wwBoE4opoEpDnOPFhvcnuSrbWo1HtsDQ==
X-Received: by 2002:a25:9346:0:b0:dcc:76a0:503b with SMTP id
 g6-20020a259346000000b00dcc76a0503bmr692068ybo.13.1708553571608; 
 Wed, 21 Feb 2024 14:12:51 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 i19-20020a05620a405300b007858c17df9csm4712295qko.96.2024.02.21.14.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 14:12:50 -0800 (PST)
Message-ID: <69a0df59-7d27-406b-b0a0-3e43f18b20bf@gmail.com>
Date: Wed, 21 Feb 2024 14:12:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] phy: constify of_phandle_args in xlate
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

On 2/17/24 01:39, Krzysztof Kozlowski wrote:
> The xlate callbacks are supposed to translate of_phandle_args to proper
> provider without modifying the of_phandle_args.  Make the argument
> pointer to const for code safety and readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com> #Broadcom
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
