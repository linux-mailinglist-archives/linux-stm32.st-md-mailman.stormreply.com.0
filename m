Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAF1631C3E
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 10:00:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC11EC6507D;
	Mon, 21 Nov 2022 09:00:30 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 995C8C6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 09:00:28 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D3067660038D;
 Mon, 21 Nov 2022 09:00:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669021228;
 bh=OLC5n8rMO8cL4cOzXJeaC3lc4DpogYcvqSb8tEpen0I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nDaQPn9KqSX5P/x90vSUwqTmUcmVXixAl7jdAg/b3MxtJlHikebrgJhT0Jp/IsZ5c
 8qD6K29wrxtlRkg2gxZXAHIuRHac7eOQwpBy3jmiDR9RGfXsoOWykzAMcqQM9QuvIL
 CPjelZ3d2GC/Ca1WdW9cNflME7M8jeO2YHl0vus43KwCzb5FRrwwSV7mo4J9Au7Tse
 KAbv3/+FD8RPawQqP0Uf+nxCQuvczzhsu4ilpoVlSFGVogQEllxlOcDmfOnZbO1f/Z
 4haR662w/esT40sNsdvujn80pf89UQUK8z9qCDN3fMkJijeiwqjFgJ9DpMtvUmFgs1
 LvPAmkko9t4cg==
Message-ID: <9135f1ea-5896-391c-12fc-849bea3b93cc@collabora.com>
Date: Mon, 21 Nov 2022 10:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-7-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221121015451.2471196-7-bero@baylibre.com>
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 6/9] ARM: dts: mediatek: Remove
	pins-are-numbered property
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
ZW1vdmUgdGhlIHVubmVjZXNzYXJ5IHBpbnMtYXJlLW51bWJlcmVkIHByb3BlcnR5IGZyb20KPiBN
ZWRpYXRlayBBUk0gRGV2aWNlVHJlZXMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuaGFyZCBSb3Nl
bmtyw6RuemVyIDxiZXJvQGJheWxpYnJlLmNvbT4KClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2No
aW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
