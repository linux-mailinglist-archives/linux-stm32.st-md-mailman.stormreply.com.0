Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9681C9652B9
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 00:16:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4228AC6DD9A;
	Thu, 29 Aug 2024 22:16:56 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB3DCC6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 22:16:48 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-498d14b9b8cso365420137.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2024 15:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724969807; x=1725574607;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=AdhyFIR6wG8Nk99mcJa0o/LUoEn4VFkj70K4F1UtVdU=;
 b=UaQwyC1m3j1SFu5/LDJE2tHBXT1dNQx4/Py1WIj6urTuMXqciGFWP5xAuad0JXsg9a
 COeA1gybD5noQiNPmsbdBkmriAJv5WO6NUgPj+spKqunZ9GglVwfvvXaLpZvHAKLdjp1
 itLCrO35H8gaeZ+4NJlMp4A84YM9EPiG5E9M0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724969807; x=1725574607;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AdhyFIR6wG8Nk99mcJa0o/LUoEn4VFkj70K4F1UtVdU=;
 b=LwNnNmQts7r7x95xMdPZz0fnFYSpyihdA8dOqM6Q3SkrRXex7YtZvMo6/f3XIMctYh
 zHJxPMZ6cuR/Xd/Gy+xVWHHnhXzrF78RXFEyHK0Y2vmHfbxqf2PE9wSm84ydPSoLM36J
 SHBXls10i2vxfKKCuN+L9rEHJ0eymA6Lf4mXJn4/8k2vWYw+qeUpk8osS2Yl88JXRy99
 mSdW3Pzz2nq92K4dv/j3qpGOr+Yaf7u4tNw8LLdSayRxWVsWb3erC+t9XL5HDz09/6E1
 urc7wukBxWKKGqBJkVSnMJUEZ2m2IW21P/87xd4/578468j43uS3vi/BGtIUrgxqQ+3G
 rk3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvCGJKhn2sxdHj+6rQPLGr0wxzJ3oYYpO0MUMBHt4d/owQFKnZtL0eFJzU7vGuA27cAoWBt/NjdYOeIg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyqRcTyi7pQBrlUwHxy94plHhJfXXW8OUaDP0fDOFuZR0BSI8YV
 OW2ncQ+xDr4zZB22UKvZH6GIwqLZxR3rj+FqDtkvwKDlzG4h+LzEfn7kYQH6ag==
X-Google-Smtp-Source: AGHT+IF/GKad4GoNSJTieXZ4HSfQQ6Emya12RNEV/ApIr1wHYt03Uq4P4o4Bzr4FyKoeCXEIVSEvwQ==
X-Received: by 2002:a05:6102:32d0:b0:493:b3d8:bd8d with SMTP id
 ada2fe7eead31-49a5af78a2fmr4761465137.26.1724969807417; 
 Thu, 29 Aug 2024 15:16:47 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c340c96aa3sm9033706d6.103.2024.08.29.15.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 15:16:46 -0700 (PDT)
Message-ID: <1b701803-748a-47dd-a847-57a04488d692@broadcom.com>
Date: Thu, 29 Aug 2024 15:16:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jinjie Ruan <ruanjinjie@huawei.com>, woojung.huh@microchip.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linus.walleij@linaro.org, alsi@bang-olufsen.dk,
 justin.chen@broadcom.com, sebastian.hesselbarth@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, mcoquelin.stm32@gmail.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, ansuelsmth@gmail.com,
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 krzk@kernel.org, jic23@kernel.org
References: <20240829063118.67453-1-ruanjinjie@huawei.com>
 <20240829063118.67453-13-ruanjinjie@huawei.com>
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
In-Reply-To: <20240829063118.67453-13-ruanjinjie@huawei.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 12/13] net: bcmasp: Simplify
 with scoped for each OF child loop
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

On 8/28/24 23:31, 'Jinjie Ruan' via BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> Use scoped for_each_available_child_of_node_scoped() when
> iterating over device nodes to make code a bit simpler.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
