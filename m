Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5642DA04823
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 18:26:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02264C78022;
	Tue,  7 Jan 2025 17:26:24 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35CF7C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 17:26:16 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2163bd70069so41510785ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jan 2025 09:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1736270775; x=1736875575;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=a2x6Czl6GO65kHVW9zAO9v64ouXW8ETVJWZJ2hxoejQ=;
 b=V0hSAF0L6Z8EXET20Fu00j+kkqX8dbd0pLBTxu3wFO435vPZde1wBiusmPFFJnpyHn
 y7xlt2fxbPsO7pz2s+WTkqfJohyLP9S+IIFqaY5mUIvqV8dmkeYEwT+LEJ+WVY/LV6Fd
 mIAXxA3MLmfcisg3PX2S44hVyb99hzih/tNu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736270775; x=1736875575;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a2x6Czl6GO65kHVW9zAO9v64ouXW8ETVJWZJ2hxoejQ=;
 b=Vd6dpVk2rxamcqoQQ5Maw7Is6KVgy4Y2L47wz3x7CaRRW652jrc44Rb2Yy0oBYWqc5
 3REpOW/PCFIUZGg68fSy7PueAORuPBZf6vRmZdJtNYFv+hFiohdhBIoHrjqcbNI8lF/z
 M309afrlBDiS6hVFjenvQAyx3Xfws9YZSpU5yv1qNDoeTt5SzgfEsT4HexCqoQMRX0E5
 TXMAqV4ubJn8iX0qLCpsAAEIAkS/UKxV+1pLGmGfuBC71ZBMkSMMTWs0jIn6Xyi0cTrp
 uYoVZgczrgJaIsjs/EAnagqtft64BUcSZAiqPERZvbKlQrldR1U7V4JBVIk7xZpWfPg/
 xBuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhpow4RI/ecwrzxgJHxrxhU7T75+tbi6dZ/nrODHvTDh9k9TkikxrO54k0bfZw88AQsK+Tnykwcu++/g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxyUlPuKq4PHzQcCUnmyTKpLlo+WS3bg0x9kkR52jhkRqa/Kgm5
 jfSHoO0wuY3H91KZEw5HJUcVhiWn61m0/DaXjSLrAOyqpvqiuDH9MfLI4apkWw==
X-Gm-Gg: ASbGncsN0VJv93Bx9YDFWJaeZGACYV3iUIjN+oP1TMWjZbtAXi8cqzT2aDFVCJH3+H6
 plPOEhb4n4c87EB6jAG02l96tlaT3Cew7pOy69C6YzXXK+XEKeeUGdyfDtZwKVJLjmRLOlpy+/w
 335EiBBuBcvjtdY8Bho5HWinFSEohxenPZPpp8CAhUQxiEr65Hg9qiuy8aLkGVCuDooGQvhJoEx
 I4RtAAGHUSGjcmD0gJVITismVvMWvpCI1wu2LYrpgWM46Xi+mI0PBsSf+g/2SMIH8A+1DBvE0n+
 BXP6+4LzWhJ6NTvqwB3J
X-Google-Smtp-Source: AGHT+IFzu1VIJT9VJiC2aXWDy+NgNyxkD0g/GqwTMrp+Om0AwR+ht03XX6NjXXazKeHe7i80AzxoTg==
X-Received: by 2002:a17:902:e886:b0:216:5e6e:68cb with SMTP id
 d9443c01a7336-219e6e9fd95mr929686065ad.16.1736270774736; 
 Tue, 07 Jan 2025 09:26:14 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9716b3sm314412505ad.90.2025.01.07.09.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 09:26:14 -0800 (PST)
Message-ID: <901992c2-4c48-4534-bbfb-7b6b70d15d48@broadcom.com>
Date: Tue, 7 Jan 2025 09:26:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Doug Berger <opendmb@gmail.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Marc Kleine-Budde
 <mkl@pengutronix.de>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kalle Valo <kvalo@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>,
 Dario Binacchi <dariobin@libero.it>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Brian Norris <briannorris@chromium.org>, Frank Li <Frank.Li@nxp.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-wireless@vger.kernel.org
References: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH net-next] dt-bindings: net: Correct
 indentation and style in DTS example
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

On 1/7/25 04:56, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/net/amlogic,meson-dwmac.yaml     | 14 +--
>   .../devicetree/bindings/net/asix,ax88178.yaml |  4 +-
>   .../bindings/net/brcm,bcmgenet.yaml           | 32 +++----
>   .../bindings/net/brcm,mdio-mux-iproc.yaml     | 46 ++++-----

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com> # net/brcm,*
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
