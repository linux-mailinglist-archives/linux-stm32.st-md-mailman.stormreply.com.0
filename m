Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E08968AC8
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2024 17:20:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 594CBC71292;
	Mon,  2 Sep 2024 15:20:50 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F29DEC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2024 15:20:42 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7a7f86026a0so299325185a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Sep 2024 08:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1725290442; x=1725895242;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xiBpNTd7P01i/u+Ss9hpT6kKoKywqkPJFpIHasijFy0=;
 b=Cjr3Zam2vW0ZSL/+FTM76faTz09+VDfEbtUBihdcNakbFpgluPFX0SI9QHbJ0AyxYj
 7M5/phQ2jfA0VrP0Qe2uNvLuUeT2JAb8a2aNiIqI/L+9kHPXFwdbk1PqOrfWqE67RIdB
 1lrPVEATM8QVDyZ3G3MORJRPZj8hVsxPriWtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725290442; x=1725895242;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xiBpNTd7P01i/u+Ss9hpT6kKoKywqkPJFpIHasijFy0=;
 b=jbnBM7kf2+eMG7EuZBNQuFfzEgCQG3w7kLQzHwR6oxKTlI+Dh8h2LyufxMBqwhnANA
 reErUGnLfWE0RpLRIbhPLBm9pM9asT5HG+6AD/wGq5v0nyPgxrmdiuU4Pr7jjH9s8UFZ
 Dk9l6RgIoFg6K5ikRZ9hllaj0H7xk0czJYwGiOaY4XkkPhipFeo85WqrxtqQZsCOBGPd
 fMBu3g/eRaLMyxC/lTe+Eg8mqa6jHK+R1plWd6DTgJkPZRHlB1Nj0EJS2kzVz1S5jXbF
 FS7cogzNV6gEGFdJATfvQhHw3IRuVYthM1I3EU/66Bml3GdXczbrbddtrQNOfey/ncm9
 lxOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWUNrj49ODe0t3lEu+YoMzIyuIzTjIPy5fGkh9DJp7FVk4/KvDUECL4kag0CrgHWgwKjCW0RV0dIKBHg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YycrnndE0tQNDrUwUBPn+LGM9Hg6UABRUt/RgIR5Aln+FWh0UGo
 H3lDxUNUknKzhT3LSTRQz32iFHYWzC1FCZZ7CPc/axoepQdAzYWtU+QDGM6gVg==
X-Google-Smtp-Source: AGHT+IEGddCxgqRqe+vE7jpwRTDhsJODyWT1+afqzlrLtqCjBLp9OyPB0x/+8hLyKZ1oIF+izd420A==
X-Received: by 2002:a05:6214:451e:b0:6c3:54a4:eea1 with SMTP id
 6a1803df08f44-6c3551c8ecdmr88033546d6.9.1725290441597; 
 Mon, 02 Sep 2024 08:20:41 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45682c82715sm40718581cf.7.2024.09.02.08.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 08:20:40 -0700 (PDT)
Message-ID: <1e92f33b-9900-4834-80e1-dcbb48cd8394@broadcom.com>
Date: Mon, 2 Sep 2024 08:20:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Li Zetao <lizetao1@huawei.com>, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, heiko@sntech.de, yisen.zhuang@huawei.com,
 salil.mehta@huawei.com, hauke@hauke-m.de, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, wellslutw@gmail.com,
 radhey.shyam.pandey@amd.com, michal.simek@amd.com,
 ajay.kathat@microchip.com, claudiu.beznea@tuxon.dev, kvalo@kernel.org,
 u.kleine-koenig@pengutronix.de, jacky_chou@aspeedtech.com
References: <20240831021334.1907921-1-lizetao1@huawei.com>
 <20240831021334.1907921-2-lizetao1@huawei.com>
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
In-Reply-To: <20240831021334.1907921-2-lizetao1@huawei.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 01/12] net: dsa: bcm_sf2: Convert
 using devm_clk_get_optional_enabled() in bcm_sf2_sw_probe()
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



On 8/30/2024 7:13 PM, Li Zetao wrote:
> Use devm_clk_get_optional_enabled() instead of devm_clk_get_optional() +
> clk_prepare_enable(), which can make the clk consistent with the device
> life cycle and reduce the risk of unreleased clk resources. Since the
> device framework has automatically released the clk resource, there is
> no need to execute clk_disable_unprepare(clk) on the error path, drop
> the out_clk_mdiv and out_clk labels, and the original error process can
> be returned directly.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
