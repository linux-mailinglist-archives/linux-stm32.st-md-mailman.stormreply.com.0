Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FA48C69DB
	for <lists+linux-stm32@lfdr.de>; Wed, 15 May 2024 17:37:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40C7BC6B47A;
	Wed, 15 May 2024 15:37:58 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DAC3C030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2024 15:37:51 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F32A6881AA;
 Wed, 15 May 2024 17:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715787470;
 bh=QH26ByvOQZ5ZvIRm4mwmie0PurCQOytE1O9vcfqJ7k8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hI4XAogIvydq71jAdp08CBhPXS3m3P45/HoF02g4iTbrSheJNW/Zp8eGZ1oQRfKBc
 UtmW7wklwTQ2jFCTDNB219iKjDGkt9AL6SRMznHGQPyoSRPx4pI18nAZ70KRe8+jXu
 QZImy6IttJEy5Aaxi7YmUUpzImBYEedjfAp//N/91wuZk1W7UsYIFpmaa7FJPBtGNx
 yrj9DHFCr5jSQagbTNXdRiJyJBTASF5v39ABuVzMZDYsbG5W2pwu0/leGos124s92o
 O3LFifmce9U5HSDhs19+2aL8+OmYC2bfFrHUn7quk7jeEbZJda4yMyfifo2EMEEbvY
 48SIjCeugEoTw==
Message-ID: <9de93cbb-5868-473e-8b32-a6b6f50e128e@denx.de>
Date: Wed, 15 May 2024 17:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Conor Dooley <conor@kernel.org>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
References: <20240513095605.218042-1-patrick.delaunay@foss.st.com>
 <20240513115601.v3.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
 <615dfdcb-cbda-426f-895e-810f03a8ce60@denx.de>
 <20240513-stabilize-proofread-81f0f9ee38b9@spud>
 <d73d4435-75d6-4cea-b38e-07c7ceae3980@foss.st.com>
 <20240514-entryway-idealize-fcd5ed0e1de7@spud>
 <0c97408c-422d-46b3-8017-da9ebb0767e1@foss.st.com>
 <20240515-monsoon-starfish-0dc59707e843@spud>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240515-monsoon-starfish-0dc59707e843@spud>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Pascal Paillet <p.paillet@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: regulator: st,
 stm32mp1-pwr-reg: add compatible for STM32MP13
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

T24gNS8xNS8yNCA1OjM1IFBNLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gV2VkLCBNYXkgMTUs
IDIwMjQgYXQgMDQ6MzM6MjJQTSArMDIwMCwgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPj4gd2l0
aAo+Pgo+PiAgwqAgY29tcGF0aWJsZToKPj4gIMKgwqDCoCBvbmVPZjoKPj4gIMKgwqDCoMKgwqDC
oMKgIC0gaXRlbXM6Cj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBzdCxzdG0zMm1w
MSxwd3ItcmVnCj4+ICDCoMKgwqDCoMKgwqDCoCAtIGl0ZW1zOgo+PiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLSBjb25zdDogc3Qsc3RtMzJtcDEzLXB3ci1yZWcKPj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC0gY29uc3Q6IHN0LHN0bTMybXAxLHB3ci1yZWcKPiAKPiBPdGhlciB0aGFuIHRoZSBleHRy
YSAscyB0aGlzIGxvb2tzIG9rYXksIHRoYW5rcy4KCkkgdGhpbmsgdGhlIGV4dHJhICxzIGFyZSBh
Y3R1YWxseSBjb3JyZWN0LCB0aG9zZSBhcmUgdGhlIG9uZXMgZnJvbSB0aGUgCm9yaWdpbmFsIGNv
bXBhdGlibGUgd2hpY2ggaGFkIFRXTyAscyAoaXQgZG9lcyBsb29rIGEgYml0IHVudXN1YWwpLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
