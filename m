Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0669C860F
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2024 10:27:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEEA1C78F9D;
	Thu, 14 Nov 2024 09:27:07 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7628C78F9C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 09:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731576420;
 bh=R1UuyuwvMBWD8gJ/Fcy+U58DhFWCQIj7bRdSdDaqNf0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ocg8pOXB/RFjyyLYKOx0U8otxoGt1VOSJt2PixWnbqJ+7x3kZRzCsSWpXnJZr3xtb
 Fa8DwpRljft0AsOCd4WxjR9i+8xIeHkgjrlv5j9AmmgZGB1MVSzq7PAkwMcBdnmuTl
 yM34YZG/egcITIYOH2mBP/Peh4K1RWXeNIEKV6stKkVCN4g9vmc68JDELT5NqOt1Ib
 aB68Pqq4ohEF+q3/1xUF1IcCFWEdXoWx8bx+HGKUM9S9W+ZzkVwtl8PcBy1sWEuctz
 g8YcoFA45nsmqcGKj4nsspQqx25NGJNx2W5bh0h2LX/AYRv26xSA96p7YHzlhIWByT
 kgGqZ3D8yUHrQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5217817E1574;
 Thu, 14 Nov 2024 10:26:59 +0100 (CET)
Message-ID: <224443e5-2ba0-49e5-9d59-2b37c2d0ac4a@collabora.com>
Date: Thu, 14 Nov 2024 10:26:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andrew Halaney <ahalaney@redhat.com>, Simon Horman <horms@kernel.org>
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
 <20241109-mediatek-mac-wol-noninverted-v2-1-0e264e213878@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241109-mediatek-mac-wol-noninverted-v2-1-0e264e213878@collabora.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] net: stmmac: dwmac-mediatek: Fix
 inverted handling of mediatek, mac-wol
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

SWwgMDkvMTEvMjQgMTY6MTYsIE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86Cj4g
VGhlIG1lZGlhdGVrLG1hYy13b2wgcHJvcGVydHkgaXMgYmVpbmcgaGFuZGxlZCBiYWNrd2FyZHMg
dG8gd2hhdCBpcwo+IGRlc2NyaWJlZCBpbiB0aGUgYmluZGluZzogaXQgY3VycmVudGx5IGVuYWJs
ZXMgUEhZIFdPTCB3aGVuIHRoZSBwcm9wZXJ0eQo+IGlzIHByZXNlbnQgYW5kIHZpY2UgdmVyc2Eu
IEludmVydCB0aGUgZHJpdmVyIGxvZ2ljIHNvIGl0IG1hdGNoZXMgdGhlCj4gYmluZGluZyBkZXNj
cmlwdGlvbi4KPiAKPiBGaXhlczogZmQxZDYyZDgwZWJjICgibmV0OiBzdG1tYWM6IHJlcGxhY2Ug
dGhlIHVzZV9waHlfd29sIGZpZWxkIHdpdGggYSBmbGFnIikKPiBTaWduZWQtb2ZmLWJ5OiBOw61j
b2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+CgpSZXZpZXdlZC1i
eTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9A
Y29sbGFib3JhLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
