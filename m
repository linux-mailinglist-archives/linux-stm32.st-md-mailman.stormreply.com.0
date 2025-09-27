Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BEEBA637E
	for <lists+linux-stm32@lfdr.de>; Sat, 27 Sep 2025 23:04:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BB54C32E8F;
	Sat, 27 Sep 2025 21:04:29 +0000 (UTC)
Received: from mail-pf1-f227.google.com (mail-pf1-f227.google.com
 [209.85.210.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B9DDC32E8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Sep 2025 21:04:26 +0000 (UTC)
Received: by mail-pf1-f227.google.com with SMTP id
 d2e1a72fcca58-782a77b5ec7so229917b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Sep 2025 14:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759007065; x=1759611865;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oc5vo+Rb9ClONgmTiHxfZM7CLOGpUGWCRjHz3GTHRlQ=;
 b=U1A/VMvY343eR5aqDimRws62SXHQYvXhU1PTk/AF0f3puJgg99IaSLogXdIFDOO/nq
 TXUPxZwbqJO24PeaKZon0Z2TaNe5JnkgqBem22eTlDpGyYHNjSCO0/cCQALOy0RmIC/9
 Hugjgma0t4THNN9wFAEPaqOZTpirowW3xZJIcuRvb5/7l/F0ATsbOjTjVBklbDRoCNs4
 tNnlXkkz0hYagwW/CRn3nz9ES8CQM+++hh2SVlyxqb6RdbDS8bjKUNRsgm6EdunAe7yW
 NepcVEzt1JhyWzulnD2biAiJuzCu3nh0aRmj51xOeVab7xxOgH4veaQFVHW7jpaA9YTa
 RzmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+4IZQy/LLRmiD4A1T3CObamDJ7LhpIA5W+687St9HQ5+C7ZRZ3cUGBPnKp9Hd71j67OVAix3llRvCwQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx1zF9XmmEZ78aQ7iwd7BP+qgWYeDHqF/ZBbg1Q3FUJB1+qUCuh
 H/+X3/MN1cfgFrekMeZRDKy7SkpBoTdqGKZk6aF7CcZJDV9tMz+xBSysadr1wlV0vIsJyXzqvZr
 FsQeLC8X/yYcMumdq/l3rKP14ZEY5jiw5tWAFS1/rFTtdkDP5jjf7e2HPsY58fTUMyR+n6x79Vr
 OPWncOJUU/3sv3fo/a5dZTizwsGp3KGAfRCHFooRzQ5JwP6IiodR89wphcv9CeXT5t736P9dWSB
 U64G+qcF3slJcY3dHVlFgl29wsriFZhBY+kM+iG
X-Gm-Gg: ASbGnctu155yZadJ5I186/l8+dfovdJCjlD+8nAvO4euy7NszHcqQXk54HUgZMFA8vy
 UFxR14FtEz6+bg2eMtwt6XZagLKCdP4f/vFyCCmmFsMKaeDAUVFbctu28g7+8x4c+sm6SsXdrUV
 tO0Ss0CLy7C3985WjB4UY8scisYMAtDb8kIuCJn1KRTRuG6OoqyfOc52/YbHNnfdY0+xat/x/DF
 gQe1o0oia22K6WqyJ5v9q2vDmz6B0PZCl6JY+elX6qPcG6K3cjLctlIPOa2SiVcoAN7ed7tgjyL
 HO+Tm7A/cOz8cjkCCQ+qiUR/HVxi5ZPcELDkGo7kjhosqIBeE4OSF6qoj1PEbBQY+E0doxit/xH
 YHWBPOXour15hIAXWLsEqvVotyZXIHDolkbKk3u+J4YIwGEowuBtJ5zN46otx1hkJqgUoSmR2k2
 u5aDwfUdc=
X-Google-Smtp-Source: AGHT+IEmlvVLoOFWPCk1S3xl4+tMdmLolgOWWntG0iddO9xsVC/tjoOgHpuDi6zblJ94ug0aFhHCmeNyMb7f
X-Received: by 2002:a05:6a20:7f90:b0:2cb:93ab:7edb with SMTP id
 adf61e73a8af0-2e7bfc1d5demr14174602637.4.1759007065411; 
 Sat, 27 Sep 2025 14:04:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
 by smtp-relay.gmail.com with ESMTPS id
 41be03b00d2f7-b57c55d9712sm348455a12.17.2025.09.27.14.04.25
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Sep 2025 14:04:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3305c08d975so3702772a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 27 Sep 2025 14:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1759007063; x=1759611863;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:from:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=oc5vo+Rb9ClONgmTiHxfZM7CLOGpUGWCRjHz3GTHRlQ=;
 b=Hw+iuBn6R8QGfRfcLwlkvsxiiWlrKJvqNZA2o0/9lVpQ8kdDEuKKhELA+3gIRkBQ8K
 hx29Aao9aK8Y6V70528fUE87yD0XvSlWyUZ7IgF/hjcDraTCR01oLkjRuWJ8/p/rzfCU
 IsZkgy7/UfUQaYIYVN5FXi9X2ybzgT4HK8v7M=
X-Forwarded-Encrypted: i=1;
 AJvYcCUrk/XuuJ5JXajUjI9RyAiephebwus/zgvBEiB4mS/4ZkSkdsk49WJOrw9Ov27/Gy6xjdwwVjx3L01x6g==@st-md-mailman.stormreply.com
X-Received: by 2002:a17:90b:55c6:b0:330:84dc:d11b with SMTP id
 98e67ed59e1d1-3342a2bed9dmr11453772a91.18.1759007063475; 
 Sat, 27 Sep 2025 14:04:23 -0700 (PDT)
X-Received: by 2002:a17:90b:55c6:b0:330:84dc:d11b with SMTP id
 98e67ed59e1d1-3342a2bed9dmr11453750a91.18.1759007062992; 
 Sat, 27 Sep 2025 14:04:22 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a3afe09sm4481311a91.1.2025.09.27.14.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Sep 2025 14:04:21 -0700 (PDT)
Message-ID: <34478e1c-b3ba-4da3-839a-4cec9ac5f51e@broadcom.com>
Date: Sat, 27 Sep 2025 14:04:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-2-105f5eb89b7f@foss.st.com>
 <aMriVDAgZkL8DAdH@shell.armlinux.org.uk>
 <aNbUdweqsCKAKJKl@shell.armlinux.org.uk>
 <a318f055-059b-44a4-af28-2ffd80a779e6@broadcom.com>
Content-Language: en-US
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
In-Reply-To: <a318f055-059b-44a4-af28-2ffd80a779e6@broadcom.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tristram Ha <Tristram.Ha@microchip.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/4] net: stmmac: stm32: add
 WoL from PHY support
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA5LzI2LzIwMjUgMTI6MDUgUE0sIEZsb3JpYW4gRmFpbmVsbGkgd3JvdGU6Cj4gCj4gCj4g
T24gOS8yNi8yMDI1IDEwOjU5IEFNLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgd3JvdGU6Cj4+IE9u
IFdlZCwgU2VwIDE3LCAyMDI1IGF0IDA1OjMxOjE2UE0gKzAxMDAsIFJ1c3NlbGwgS2luZyAoT3Jh
Y2xlKSB3cm90ZToKPj4+IE9uIFdlZCwgU2VwIDE3LCAyMDI1IGF0IDA1OjM2OjM3UE0gKzAyMDAs
IEdhdGllbiBDaGV2YWxsaWVyIHdyb3RlOgo+Pj4+IElmIHRoZSAic3QscGh5LXdvbCIgcHJvcGVy
dHkgaXMgcHJlc2VudCBpbiB0aGUgZGV2aWNlIHRyZWUgbm9kZSwKPj4+PiBzZXQgdGhlIFNUTU1B
Q19GTEFHX1VTRV9QSFlfV09MIGZsYWcgdG8gdXNlIHRoZSBXb0wgY2FwYWJpbGl0eSBvZgo+Pj4+
IHRoZSBQSFkuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0
aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqAgZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RtMzIuYyB8IDUgKysrKysKPj4+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RtMzIuYyBiLyAKPj4+PiBk
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdG0zMi5jCj4+Pj4gaW5k
ZXggCj4+Pj4gNzdhMDRjNDU3OWM5ZGJhZTg4NmEwYjM4N2Y2OTYxMGE5MzJiN2I5ZS4uNmYxOTc3
ODljYzJlODAxOGQ2OTU5MTU4Yjc5NWU0YmNhNDY4NjljNSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdG0zMi5jCj4+Pj4gKysrIGIv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RtMzIuYwo+Pj4+IEBA
IC0xMDYsNiArMTA2LDcgQEAgc3RydWN0IHN0bTMyX2R3bWFjIHsKPj4+PiDCoMKgwqDCoMKgIHUz
MiBzcGVlZDsKPj4+PiDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBzdG0zMl9vcHMgKm9wczsKPj4+
PiDCoMKgwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRldjsKPj4+PiArwqDCoMKgIGJvb2wgcGh5X3dv
bDsKPj4+PiDCoCB9Owo+Pj4+IMKgIHN0cnVjdCBzdG0zMl9vcHMgewo+Pj4+IEBAIC00MzMsNiAr
NDM0LDggQEAgc3RhdGljIGludCBzdG0zMl9kd21hY19wYXJzZV9kYXRhKHN0cnVjdCAKPj4+PiBz
dG0zMl9kd21hYyAqZHdtYWMsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+PiDCoMKgwqDC
oMKgIH0KPj4+PiArwqDCoMKgIGR3bWFjLT5waHlfd29sID0gb2ZfcHJvcGVydHlfcmVhZF9ib29s
KG5wLCAic3QscGh5LXdvbCIpOwo+Pj4+ICsKPj4+PiDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+
Pj4gwqAgfQo+Pj4+IEBAIC01NTcsNiArNTYwLDggQEAgc3RhdGljIGludCBzdG0zMl9kd21hY19w
cm9iZShzdHJ1Y3QgCj4+Pj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Pj4+IMKgwqDCoMKgwqAg
cGxhdF9kYXQtPmJzcF9wcml2ID0gZHdtYWM7Cj4+Pj4gwqDCoMKgwqDCoCBwbGF0X2RhdC0+c3Vz
cGVuZCA9IHN0bTMyX2R3bWFjX3N1c3BlbmQ7Cj4+Pj4gwqDCoMKgwqDCoCBwbGF0X2RhdC0+cmVz
dW1lID0gc3RtMzJfZHdtYWNfcmVzdW1lOwo+Pj4+ICvCoMKgwqAgaWYgKGR3bWFjLT5waHlfd29s
KQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBwbGF0X2RhdC0+ZmxhZ3MgfD0gU1RNTUFDX0ZMQUdfVVNF
X1BIWV9XT0w7Cj4+Pgo+Pj4gSSB3b3VsZCBtdWNoIHJhdGhlciB3ZSBmb3VuZCBhIGRpZmZlcmVu
dCBhcHByb2FjaCwgcmF0aGVyIHRoYW4gYWRkaW5nCj4+PiBjdXN0b20gcGVyLWRyaXZlciBEVCBw
cm9wZXJ0aWVzIHRvIGZpZ3VyZSB0aGlzIG91dC4KPj4+Cj4+PiBBbmRyZXcgaGFzIHByZXZpb3Vz
bHkgc3VnZ2VzdGVkIHRoYXQgTUFDIGRyaXZlcnMgc2hvdWxkIGFzayB0aGUgUEhZCj4+PiB3aGV0
aGVyIFdvTCBpcyBzdXBwb3J0ZWQsIGJ1dCB0aGlzIHByZS1zdXBwb3NlcyB0aGF0IFBIWSBkcml2
ZXJzIGFyZQo+Pj4gY29kZWQgY29ycmVjdGx5IHRvIG9ubHkgcmVwb3J0IFdvTCBjYXBhYmlsaXRp
ZXMgaWYgdGhleSBhcmUgcmVhbGx5Cj4+PiBjYXBhYmxlIG9mIHdha2luZyB0aGUgc3lzdGVtLiBB
cyBzaG93biBpbiB5b3VyIHNtc2MgUEhZIGRyaXZlciBwYXRjaCwKPj4+IHRoaXMgbWF5IG5vdCBi
ZSB0aGUgY2FzZS4KPj4+Cj4+PiBHaXZlbiB0aGF0IHdlIGhhdmUgaGlzdG9yaWNhbGx5IGhhZCBQ
SFkgZHJpdmVycyByZXBvcnRpbmcgV29MCj4+PiBjYXBhYmlsaXRpZXMgd2l0aG91dCBiZWluZyBh
YmxlIHRvIHdha2UgdGhlIHN5c3RlbSwgd2UgY2FuJ3QKPj4+IGltcGxlbWVudCBBbmRyZXcncyBz
dWdnZXN0aW9uIGVhc2lseS4KPj4+Cj4+PiBUaGUgb25seSBhcHByb2FjaCBJIGNhbiB0aGluayB0
aGF0IHdvdWxkIGFsbG93IHVzIHRvIHRyYW5zaXRpb24gaXMKPj4+IHRvIGFkZDoKPj4+Cj4+PiBz
dGF0aWMgaW5saW5lIGJvb2wgcGh5X2Nhbl93YWtldXAoc3RydWN0IHBoeV9kZXZpY2UgKnBoeV9k
ZXYpCj4+PiB7Cj4+PiDCoMKgwqDCoHJldHVybiBkZXZpY2VfY2FuX3dha2V1cCgmcGh5X2Rldi0+
bWRpby5kZXYpOwo+Pj4gfQo+Pj4KPj4+IHRvIGluY2x1ZGUvbGludXgvcGh5LmgsIGFuZCBhIGNv
cnJlc3BvbmRpbmcgd3JhcHBlciBmb3IgcGh5bGluay4KPj4+IFRoaXMgY2FuIHRoZW4gYmUgdXNl
ZCB0byBkZXRlcm1pbmUgd2hldGhlciB0byBhdHRlbXB0IHRvIHVzZSBQSFktYmFzZWQKPj4+IFdv
bCBpbiBzdG1tYWNfZ2V0X3dvbCgpIGFuZCBydGw4MjExZl9zZXRfd29sKCksIGZhbGxpbmcgYmFj
ayB0bwo+Pj4gUE1ULWJhc2VkIFdvTCBpZiBzdXBwb3J0ZWQgYXQgdGhlIE1BQy4KPj4+Cj4+PiBT
bywgbWF5YmUgc29tZXRoaW5nIGxpa2U6Cj4+Pgo+Pj4gc3RhdGljIHUzMiBzdG1tYWNfd29sX3N1
cHBvcnQoc3RydWN0IHN0bW1hY19wcml2ICpwcml2KQo+Pj4gewo+Pj4gwqDCoMKgwqB1MzIgc3Vw
cG9ydCA9IDA7Cj4+Pgo+Pj4gwqDCoMKgwqBpZiAocHJpdi0+cGxhdC0+cG10ICYmIGRldmljZV9j
YW5fd2FrZXVwKHByaXYtPmRldmljZSkpIHsKPj4+IMKgwqDCoMKgwqDCoMKgIHN1cHBvcnQgPSBX
QUtFX1VDQVNUOwo+Pj4gwqDCoMKgwqDCoMKgwqAgaWYgKHByaXYtPmh3X2NhcF9zdXBwb3J0ICYm
IHByaXYtPmRtYV9jYXAucG10X21hZ2ljX2ZyYW1lKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdXBwb3J0IHw9IFdBS0VfTUFHSUM7Cj4+PiDCoMKgwqDCoH0KPj4+Cj4+PiDCoMKgwqDCoHJl
dHVybiBzdXBwb3J0Owo+Pj4gfQo+Pj4KPj4+IHN0YXRpYyB2b2lkIHN0bW1hY19nZXRfd29sKHN0
cnVjdCBuZXRfZGV2aWNlICpkZXYsIHN0cnVjdCAKPj4+IGV0aHRvb2xfd29saW5mbyAqd29sKQo+
Pj4gewo+Pj4gwqDCoMKgwqBzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYgPSBuZXRkZXZfcHJpdihk
ZXYpOwo+Pj4gwqDCoMKgwqBpbnQgZXJyOwo+Pj4KPj4+IMKgwqDCoMKgLyogQ2hlY2sgU1RNTUFD
X0ZMQUdfVVNFX1BIWV9XT0wgZm9yIGxlZ2FjeSAqLwo+Pj4gwqDCoMKgwqBpZiAocGh5bGlua19j
YW5fd2FrZXVwKHByaXYtPnBoeWxpbmspIHx8Cj4+PiDCoMKgwqDCoMKgwqDCoCBwcml2LT5wbGF0
LT5mbGFncyAmIFNUTU1BQ19GTEFHX1VTRV9QSFlfV09MKSB7Cj4+PiDCoMKgwqDCoMKgwqDCoCBl
cnIgPSBwaHlsaW5rX2V0aHRvb2xfZ2V0X3dvbChwcml2LT5waHlsaW5rLCB3b2wpOwo+Pj4gwqDC
oMKgwqDCoMKgwqAgaWYgKGVyciAhPSAwICYmIGVyciAhPSAtRU9QTk9UU1VQUCkKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4gwqDCoMKgwqB9Cj4+Pgo+Pj4gwqDCoMKgwqB3
b2wtPnN1cHBvcnRlZCB8PSBzdG1tYWNfd29sX3N1cHBvcnQocHJpdik7Cj4+Pgo+Pj4gwqDCoMKg
wqAvKiBBIHJlYWQgb2YgcHJpdi0+d29sb3B0cyBpcyBzaW5nbGUtY29weSBhdG9taWMuIExvY2tp
bmcKPj4+IMKgwqDCoMKgICogZG9lc24ndCBhZGQgYW55IGJlbmVmaXQuCj4+PiDCoMKgwqDCoCAq
Lwo+Pj4gwqDCoMKgwqB3b2wtPndvbG9wdHMgfD0gcHJpdi0+d29sb3B0czsKPj4+IH0KPj4+Cj4+
PiBzdGF0aWMgaW50IHN0bW1hY19zZXRfd29sKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsIHN0cnVj
dCAKPj4+IGV0aHRvb2xfd29saW5mbyAqd29sKQo+Pj4gewo+Pj4gwqDCoMKgwqBzdHJ1Y3Qgc3Rt
bWFjX3ByaXYgKnByaXYgPSBuZXRkZXZfcHJpdihkZXYpOwo+Pj4gwqDCoMKgwqB1MzIgc3VwcG9y
dCwgd29sb3B0czsKPj4+IMKgwqDCoMKgaW50IGVycjsKPj4+Cj4+PiDCoMKgwqDCoHdvbG9wdHMg
PSB3b2wtPndvbG9wdHM7Cj4+Pgo+Pj4gwqDCoMKgwqAvKiBDaGVjayBTVE1NQUNfRkxBR19VU0Vf
UEhZX1dPTCBmb3IgbGVnYWN5ICovCj4+PiDCoMKgwqDCoGlmIChwaHlsaW5rX2Nhbl93YWtldXAo
cHJpdi0+cGh5bGluaykgfHwKPj4+IMKgwqDCoMKgwqDCoMKgIHByaXYtPnBsYXQtPmZsYWdzICYg
U1RNTUFDX0ZMQUdfVVNFX1BIWV9XT0wpIHsKPj4+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBldGh0
b29sX3dvbGluZm8gdzsKPj4+Cj4+PiDCoMKgwqDCoMKgwqDCoCBlcnIgPSBwaHlsaW5rX2V0aHRv
b2xfc2V0X3dvbChwcml2LT5waHlsaW5rLCB3b2wpOwo+Pj4gwqDCoMKgwqDCoMKgwqAgaWYgKGVy
ciAhPSAtRU9QTk9UU1VQUCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsK
Pj4+Cj4+PiDCoMKgwqDCoMKgwqDCoCAvKiBSZW1vdmUgdGhlIFdvTCBtb2RlcyB0aGF0IHRoZSBQ
SFkgaXMgaGFuZGxpbmcgKi8KPj4+IMKgwqDCoMKgwqDCoMKgIGlmICghcGh5bGlua19ldGh0b29s
X2dldF93b2wocHJpdi0+cGh5bGluaywgJncpKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3
b2xvcHRzICY9IH53LndvbG9wdHM7Cj4+PiDCoMKgwqDCoH0KPj4+Cj4+PiDCoMKgwqDCoHN1cHBv
cnQgPSBzdG1tYWNfd29sX3N1cHBvcnQocHJpdik7Cj4+Pgo+Pj4gwqDCoMKgwqBtdXRleF9sb2Nr
KCZwcml2LT5sb2NrKTsKPj4+IMKgwqDCoMKgcHJpdi0+d29sb3B0cyA9IHdvbG9wdHMgJiBzdXBw
b3J0Owo+Pj4gwqDCoMKgwqBkZXZpY2Vfc2V0X3dha2V1cF9lbmFibGUocHJpdi0+ZGV2aWNlLCAh
IXByaXYtPndvbG9wdHMpOwo+Pj4gwqDCoMKgwqBtdXRleF91bmxvY2soJnByaXYtPmxvY2spOwo+
Pj4KPj4+IMKgwqDCoMKgcmV0dXJuIDA7Cj4+PiB9Cj4+Pgo+Pj4gLi4uIGFuZCBub3cgSSdtIHdv
bmRlcmluZyB3aGV0aGVyIHRoaXMgY29tcGxleGl0eSBpcyBzb21ldGhpbmcgdGhhdAo+Pj4gcGh5
bGluayBzaG91bGQgaGFuZGxlIGludGVybmFsbHksIHByZXNlbnRpbmcgYSBtYWNfc2V0X3dvbCgp
IG1ldGhvZAo+Pj4gdG8gY29uZmlndXJlIHRoZSBNQUMtc2lkZSBXb0wgc2V0dGluZ3MuIFdoYXQg
bWFrZXMgaXQgZGlmZmljdWx0IHRvCj4+PiBqdXN0IG1vdmUgaW50byBwaHlsaW5rIGlzIHRoZSBT
VE1NQUNfRkxBR19VU0VfUEhZX1dPTCBmbGFnLCBidXQKPj4+IHRoYXQgY291bGQgYmUgYSAiZm9y
Y2VfcGh5X3dvbCIgZmxhZyBpbiBzdHJ1Y3QgcGh5bGlua19jb25maWcgYXMKPj4+IGEgdHJhbnNp
dGlvbmFyeSBtZWFzdXJlLi4uIHNvIGxvbmcgYXMgUEhZIGRyaXZlcnMgZ2V0IGZpeGVkLgo+Pgo+
PiBJIGNhbWUgdXAgd2l0aCB0aGlzIGFzIGFuIGV4cGVyaW1lbnQgLSBJIGhhdmVuJ3QgdGVzdGVk
IGl0IGJleW9uZAo+PiBydW5uaW5nIGl0IHRocm91Z2ggdGhlIGNvbXBpbGVyIChkaWRuJ3QgbGV0
IGl0IGdldCB0byB0aGUgbGluayBzdGFnZQo+PiB5ZXQuKSBIYXZlbid0IGV2ZW4gZG9uZSBhbnl0
aGluZyB3aXRoIGl0IGZvciBzdG1tYWMgeWV0Lgo+Pgo+IAo+IEkgbGlrZSB0aGUgZGlyZWN0aW9u
IHRoaXMgaXMgZ29pbmcsIHdlIGNvdWxkIHByb2JhYmx5IHRha2Ugb25lIHN0ZXAgCj4gZnVydGhl
ciBhbmQgZXh0cmFjdCB0aGUgbG9naWMgcHJlc2VudCBpbiBiY21nZW5ldF93b2wuYyBhbmQgbWFr
ZSB0aG9zZSAKPiBoZWxwZXIgZnVuY3Rpb25zIGZvciBvdGhlciBkcml2ZXJzIHRvIGdldCB0aGUg
b3ZlcmxheSBvZiBQSFkrTUFDIFdvTCAKPiBvcHRpb25zL3Bhc3N3b3JkIGNvbnNpc3RlbnQgYWNy
b3NzIGFsbCBkcml2ZXJzLiBXaGF0IGRvIHlvdSB0aGluaz8KCisJCWlmICh3b2xvcHRzICYgV0FL
RV9NQUdJQykKKwkJCWNoYW5nZWQgfD0gISFtZW1jbXAod29sLT5zb3Bhc3MsIHBsLT53b2xfc29w
YXNzLAorCQkJCQkgICAgc2l6ZW9mKHdvbC0+c29wYXNzKSk7CgoKU2hvdWxkIG5vdCB0aGUgaHVu
ayBhYm92ZSBiZSB3b2xvcHRzICYgV0FLRV9NQUdJQ1NFQ1VSRT8KCi0tIApGbG9yaWFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
