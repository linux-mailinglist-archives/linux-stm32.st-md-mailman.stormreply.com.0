Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16665631C3C
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 10:00:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDD8DC65065;
	Mon, 21 Nov 2022 09:00:29 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00C91C6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 09:00:27 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E1D83660037C;
 Mon, 21 Nov 2022 09:00:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669021227;
 bh=MXlDWXncLIFxW00lPLdUcN0Z8H99/RrA2zO5uQrPlb8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VrdNhm+rAY63uTKkMeau0NTxhjrMRh1EGlc7d43oN0AvYTS7aIvRPrb5lkyrMpchA
 KpsJtDnvrptvp0CWSF+BIF/zqeLLm3Bf18ZNHPiZjs+PV2poQeDOs397vxQHLJxP0K
 o7WbxncC0kMmb9ahghXjJVfAGlAJ5ButnSDBMqT7aucMkURsIQMNpfSfJVewUGe899
 jZabptcS5ddhXRUdBMEaZ4ZMJoFBSptUBns1D6VXO4fmUxjoVvN0IAht5i+HQjls4Y
 r70EJd1hgVLILCX5GjNzqpSR/jz3ghrJZYrMo91ejFGpEMTGTbTUObyj7hLQzZ4zF3
 hhjEzcF7tNe9Q==
Message-ID: <945d26a8-5074-80fd-0918-717d127f9224@collabora.com>
Date: Mon, 21 Nov 2022 10:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-6-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221121015451.2471196-6-bero@baylibre.com>
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/9] arm64: dts: mediatek: Remove
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
ZW1vdmUgdGhlIHVubmVjZXNzYXJ5IHBpbnMtYXJlLW51bWJlcmVkIHByb3BlcnR5IGZyb20KPiBh
cm02NCBNZWRpYXRlayBEZXZpY2VUcmVlcwo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5oYXJkIFJv
c2Vua3LDpG56ZXIgPGJlcm9AYmF5bGlicmUuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2Fj
Y2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
