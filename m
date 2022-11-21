Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35995631C40
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 10:00:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3190C6507F;
	Mon, 21 Nov 2022 09:00:31 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25CE2C6507B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 09:00:30 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5DEDE66003EF;
 Mon, 21 Nov 2022 09:00:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669021229;
 bh=GjoD6+ESt/0nC7WvRsDYNODjgEOQgbj3D/vo0DNgFs8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GX7ndQFc90mDHy9IVvkFjC11UQildBuY3gKGx5XKCYxu2dnDae9C9I1haWu3O3clb
 4P3a5dBkRdW9cUo2QValv+k2lr27sWD6c6kEzfLFYfAHlxpEuyx+Gvkc84pyA/1K5z
 ab+Y6oXZmDDujBGsEOpK6zDF44lpnE6mKZyxB/3xqXdHA4LIMSkqmipcFYDysdadNL
 Qt18/u7pLXy2ASnjC1lm9jpJhu8hJOm7f8thB9Zf4b785JWYXYY0jsOu5M60YcZ/3L
 j3bOvJV4YFLR7wm8Naa3B6kHbgKY/OSRNdm6Sk2CBiKcvEWdRZmd3CU6QgAPLog6mT
 VjY7470Ij803Q==
Message-ID: <0ccc4c54-c60f-72eb-6efe-31915b6277d7@collabora.com>
Date: Mon, 21 Nov 2022 10:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-2-bero@baylibre.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221121015451.2471196-2-bero@baylibre.com>
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/9] pinctrl: mediatek: common: Remove
 check for pins-are-numbered
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

SWwgMjEvMTEvMjIgMDI6NTQsIEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIgaGEgc2NyaXR0bzoKPiBS
ZW1vdmUgdGhlIGNoZWNrIGZvciB0aGUgdW5uZWNlc3NhcnkgcGlucy1hcmUtbnVtYmVyZWQgRGV2
aWNldHJlZSBwcm9wZXJ0eS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nlbmtyw6Ru
emVyIDxiZXJvQGJheWxpYnJlLmNvbT4KClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERl
bCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
