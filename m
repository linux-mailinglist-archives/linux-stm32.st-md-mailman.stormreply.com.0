Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C95099C2E83
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Nov 2024 17:30:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F1D3C6DD9D;
	Sat,  9 Nov 2024 16:30:53 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55DDEC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Nov 2024 16:30:46 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-20caea61132so28139915ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 09 Nov 2024 08:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731169845; x=1731774645;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+HFu6d4lO7rqvd9CtGtNgYr/2KPNT3OuXCo4vOZrFRY=;
 b=YaJcA7St5C984b5RBXfAw/gF/H3sCxlPhRQ/fqOCaxdzCMutdWSiUzw8qNc+iKVAuw
 Dt2e/IDciBrgVO4PdPSeGbgD8cdZ7OOeGDJVHiLiYK3+UlPV2KiQu54xUxV6lzomCA2Y
 08+L3jRXhreScfH882xBzweTZeZXLQhniAFuu0fQoA6/yJLDCSrWTJlA7XSPEpjr2Pzr
 w9r35fLBmuJZoWMNLBHo6V/6RXWjqtJbjRdcsMSF3cEsxOrLh49bvZCYa4TvYmxokfW6
 izn0R5qe2XmeuUdqF2d5GFrhFRZmqU65ybM8pHUkdlw1dpP/9JT+lt7ZGm4iWVlWNBDp
 gsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731169845; x=1731774645;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+HFu6d4lO7rqvd9CtGtNgYr/2KPNT3OuXCo4vOZrFRY=;
 b=CDgngB/Wk5SgKJfm0pwqTtoFSzmsMSvB9YC4iM7nTDYBfzq25gDt+0twCJMLmjb5RE
 T2QigZ/HlYIYJBLa6ZSPDjlQWKn2SolCOwvehgeJ9jRNB1sGeL7qhEAEv2VOoP1NIiDx
 on0PtF4dZvG4qpRuj9DOzJCAWPP/PeZfR+VcTodhNv9Vp0rKF/1RaOSU1DQgpHy+shfi
 kwqWrcJVS/hVLdWO1Jvp+b+ChnrW36YC1p+x00CBCGE/lHhujfID5u4W1i04tCpOd/aS
 oqHC96ZyO7xnvyme0eAhiLoNrMQ1vfljI56GXK+B3iugHatlSilBIxEkWZRZNZMhmXPL
 VQ3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9xvaf8Mb6eQceTRuM6nVpnDI46tr+wKT3i8OCFymFeUUJYs4DqBQE0U4/3ZNq/4iEKDblChbFVT5WRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzP67WZqH7487YN+xSvG2xfI7bP2X0ClUCPfGycu93BEXbDLdx2
 QQZXd0BCFOl8AbXQ6ggUJwx1G+xR88u7j4KnrgTYOWkhZvGswCt+
X-Google-Smtp-Source: AGHT+IGGs2S0yCDvHRz6lhphL26+ZgfU8grAgZs942pwHOPtldd6rtgtD1s1xn3JASfB0aCkY4pxLg==
X-Received: by 2002:a17:902:ea10:b0:210:fce4:11db with SMTP id
 d9443c01a7336-21183517ca8mr100546255ad.22.1731169844727; 
 Sat, 09 Nov 2024 08:30:44 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177e6a3f4sm47858475ad.234.2024.11.09.08.30.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Nov 2024 08:30:43 -0800 (PST)
Message-ID: <3be2547e-d987-4987-9d75-30bf81cfe6cd@gmail.com>
Date: Sat, 9 Nov 2024 08:30:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <1a44c5fc95616d64157d2f4a55f460476d382554.1730987047.git.ukleinek@kernel.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <1a44c5fc95616d64157d2f4a55f460476d382554.1730987047.git.ukleinek@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Yong Wu <yong.wu@mediatek.com>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-pm@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
 linux-mediatek@lists.infradead.org, Markus Mayer <mmayer@broadcom.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Georgi Djakov <djakov@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH] memory: Switch back to struct
	platform_driver::remove()
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

CgpPbiAxMS83LzIwMjQgNjo1NyBBTSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gQWZ0ZXIg
Y29tbWl0IDBlZGI1NTVhNjVkMSAoInBsYXRmb3JtOiBNYWtlIHBsYXRmb3JtX2RyaXZlcjo6cmVt
b3ZlKCkKPiByZXR1cm4gdm9pZCIpIC5yZW1vdmUoKSBpcyAoYWdhaW4pIHRoZSByaWdodCBjYWxs
YmFjayB0byBpbXBsZW1lbnQgZm9yCj4gcGxhdGZvcm0gZHJpdmVycy4KPiAKPiBDb252ZXJ0IGFs
bCBwbGF0Zm9ybSBkcml2ZXJzIGJlbG93IGRyaXZlcnMvbWVtb3J5IHRvIHVzZSAucmVtb3ZlKCks
IHdpdGgKPiB0aGUgZXZlbnR1YWwgZ29hbCB0byBkcm9wIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXI6
OnJlbW92ZV9uZXcoKS4gQXMKPiAucmVtb3ZlKCkgYW5kIC5yZW1vdmVfbmV3KCkgaGF2ZSB0aGUg
c2FtZSBwcm90b3R5cGVzLCBjb252ZXJzaW9uIGlzIGRvbmUKPiBieSBqdXN0IGNoYW5naW5nIHRo
ZSBzdHJ1Y3R1cmUgbWVtYmVyIG5hbWUgaW4gdGhlIGRyaXZlciBpbml0aWFsaXplci4KPiAKPiBB
IGZldyB3aGl0ZSBzcGFjZSBjaGFuZ2VzIGFyZSBpbmNsdWRlZCB0byBtYWtlIGluZGVudGlvbiBj
b25zaXN0ZW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWlu
ZS1rb2VuaWdAYmF5bGlicmUuY29tPgoKRm9yIHRoZSBicmNtc3RiIGRyaXZlcjoKClJldmlld2Vk
LWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmbG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbT4KLS0g
CkZsb3JpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
