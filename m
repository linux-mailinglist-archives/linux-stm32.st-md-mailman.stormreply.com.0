Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C399BFDDC7
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 20:31:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA139C5E2D8;
	Wed, 22 Oct 2025 18:31:32 +0000 (UTC)
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com
 [209.85.215.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D598C55586
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 18:31:31 +0000 (UTC)
Received: by mail-pg1-f227.google.com with SMTP id
 41be03b00d2f7-b67684e2904so5127038a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 11:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761157890; x=1761762690;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xI+rhvxEBxqKNkYgkKodZ5I5aGcum/RfIbS5GB+RU9o=;
 b=UhQIZa1djg1NenrKvqXn2rhBIfST0a1hKIsjE+qA6TP2t9fHNQxxM+07yWiCmxgWHm
 7Um338YjRay54AaXVj4lFfd1fChzy6roYilESygiJ91vQZ9eWuqjSB0XxWPJAMDCIq0b
 iabGqPzLQyJ+6CdeUN5xsj+O8LCimLKDXKaONK2rPofsktNzC/m6kEXi+6fQ2PjG3JkN
 cMzM7Ac4U00yzIR7T8b6T5fKrV/dpuTOU69rsLfY0+fieE4x/3Is2Tc47JqbqXfMKwOn
 XpalLTQG2zHLzn4DMGHzuGz9M4PVkHIIjcy9/s5+3NLC8NvZV2zvEH7xQlyAsJM0o4by
 wDbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyLf0R6gHg0EKqltnCkjcSBXctWNpDuZInH2ozptyQbIAjBryRVRr7jUZ8+EJ5z1AvlOkspjUg9gw8vw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyVnaJvf6Mj0Mp+xmzlZntQgzPeOscf5KVFUtcIz1S2z0e9tEjj
 oK49OxFcuv/egiO4E9n0dYMDAdvF7KFwoF1g8EVU2CvNxz5XTZAUXFPUNeMgnFHv61IxJ2xpWcD
 HqL9G2fHYRQe/RxEjhjr/hygPoJLoOcw2EGsjWnAYX6Irf4ZxkGL13iS/ytcQCB9ep9WNqct5Zg
 0FLlgLPvMbCAwuQoEa3+0aQXn1omFWpqEgATvAAgkbmR7XVrDR2Ip9C8Yic7YcRJk1BhSP961ok
 SXFplUeSiShhjd4SkrQprAbvM2G430H2q2db8m4
X-Gm-Gg: ASbGncuxLV7E0Dr8GYSFNxW8UAbfjc0m177U2v/6FpggAgtdHQsJ88IloGww0B0cRhT
 quuyAtwsPTdAYX0QtanYrbUK8AdgGonY/qvQUE1yevnKA4avhbv/SZjnn3qz40kZutX6XxB7wTQ
 fWaDMRoroqIMSE1t7UmbI8JD0oWVNcF9wqYYDmnYbCobsiCqnjfxbRB6SC6yFEsqBhx7UntZpJQ
 ff6cIfZP7Mxq2u0SB1+YS4JH8ulqatir700WcPax8wPRA5LhR9tbQ8VXvVMTAdEALpBBHtgW5ft
 0QISFn0ERHuBV7RTCRe7s1Kqdofb6wpd3J2ihquegJpw8ufjNh7NIcvD0GfAE6enDEUq27NKRPk
 +UBoQ+512vRw+TFRIGeR45sCPSqNoEQ92qZNHpbxsXFi1QZWSeBb6QWFEe7aNFQhZDxdJ1IJfLS
 16a+O80FinqB7aicYE4cF0Jmf/KEdXQou1L9P5yIMdxg==
X-Google-Smtp-Source: AGHT+IF5FaAvDrAOa7p1yT9I1YL97//Vmzc6JiPTK2N9paZ0RDetNIRLIiWn6EroJxzzfelcLFdUc66+QwkG
X-Received: by 2002:a17:90b:3d87:b0:33b:ba64:8a2c with SMTP id
 98e67ed59e1d1-33bcf8f97e5mr25700398a91.25.1761157889557; 
 Wed, 22 Oct 2025 11:31:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-124.dlp.protect.broadcom.com. [144.49.247.124])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-33e20919af1sm130985a91.1.2025.10.22.11.31.29
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Oct 2025 11:31:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-290e4fade70so56451175ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 11:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1761157888; x=1761762688;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xI+rhvxEBxqKNkYgkKodZ5I5aGcum/RfIbS5GB+RU9o=;
 b=R1E+WBI7WsE9t3yY/y7dv/+sOD/NcH16RTaX8P+DFQxgp+uenlDB1Nwlyn+Otj+U/e
 a367nKWAXEsephdE9FtH0202tM0C6npppipxORt/6Z+2zICIzFtK9L3wSB+GPQlNS8h0
 9/+AICvM2S3/IvnKi5+8Q4PAyIxwE1H93ZF8s=
X-Forwarded-Encrypted: i=1;
 AJvYcCV3b3cpKoaOkRQGAaiTMjTt60GhwNbvpKmJTiFffcMjYuywDRyKpD3ij7N+yrolJL7MAObCA/1VY4TWvg==@st-md-mailman.stormreply.com
X-Received: by 2002:a17:902:dac6:b0:25c:ae94:f49e with SMTP id
 d9443c01a7336-290ca30e40cmr257832435ad.37.1761157887709; 
 Wed, 22 Oct 2025 11:31:27 -0700 (PDT)
X-Received: by 2002:a17:902:dac6:b0:25c:ae94:f49e with SMTP id
 d9443c01a7336-290ca30e40cmr257832015ad.37.1761157887301; 
 Wed, 22 Oct 2025 11:31:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29246ebccf3sm145602945ad.1.2025.10.22.11.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 11:31:25 -0700 (PDT)
Message-ID: <a6882bfa-866e-4079-b38a-ca2ed30609b9@broadcom.com>
Date: Wed, 22 Oct 2025 11:31:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
 <ad16837d-6a30-4b3d-ab9a-99e31523867f@bootlin.com>
 <aPkgeuOAX98aT-T7@shell.armlinux.org.uk>
Content-Language: en-US, fr-FR
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
In-Reply-To: <aPkgeuOAX98aT-T7@shell.armlinux.org.uk>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/6] net: phy: add
	phy_may_wakeup()
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

On 10/22/25 11:20, Russell King (Oracle) wrote:
> On Wed, Oct 22, 2025 at 03:43:20PM +0200, Maxime Chevallier wrote:
>> Hi Russell,
>>
>> That's not exactly what's happening, this suggest this is merely a
>> wrapper around device_may_wakeup().
>>
>> I don't think it's worth blocking the series though, but if you need to
>> respin maybe this could be reworded.
>>
>> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> I've updated the description as I think patch 4 needs a repost:
> 
> +/**
> + * phy_may_wakeup() - indicate whether PHY has wakeup enabled
> + * @phydev: The phy_device struct
> + *
> + * Returns: true/false depending on the PHY driver's device_set_wakeup_enabled()
> + * setting if using the driver model, otherwise the legacy determination.
> + */
> +bool phy_may_wakeup(struct phy_device *phydev);
> +
> 
> Do you want me to still add your r-b?

Yes, I saw that comment, should have mentioned this applied to your 
revision. Thanks!
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
