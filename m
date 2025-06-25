Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEE0AE8E29
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 21:12:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 491D3C30883;
	Wed, 25 Jun 2025 19:12:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ED3FC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 19:12:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EFDBE4B26A;
 Wed, 25 Jun 2025 19:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC099C4CEEE;
 Wed, 25 Jun 2025 19:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750878747;
 bh=+qriwj9qU4FY/kuIp4wDLlM/t8OqijQo1R2YW3zdLuU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jQXCQmT8D2h0EMiy0LeKaMVgq4MMLwiB5Ojl9jxZUv3lfWTMXOdg/Ik0UrDQyUSjL
 4MyfWPrrhsFgzVudtvHgpM62ZTCCpPxy35fmIvUUFQNGqTyaa+MlvHiuIsfLG1LPq7
 DqO/X6euoQBAnIVWUFCtnMvL/ngetC26Gn7NfJVTg6zqih6MrgmXqtLPNUAMhF8Dyl
 MqUCjuQmArTDzS7IxOthC7s73wiH1W/851Whej89BlsJAhXIvMsYOcLLDNVEoVpD4k
 IO0k5pr5rxMRmHCfbJBy4JwocPtv2E4fPF/CDD2INuRNUBPSpXrHi/aKwXrLqj48Gf
 MZhLmOg8QqPSA==
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Valentin Caron <valentin.caron@foss.st.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Erwan Leray <erwan.leray@foss.st.com>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
References: <20250616-spi-upstream-v1-0-7e8593f3f75d@foss.st.com>
Message-Id: <175087874236.261602.8727707950137724434.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 20:12:22 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-08c49
Cc: devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/6] Add few updates to the STM32 SPI
	driver
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gTW9uLCAxNiBKdW4gMjAyNSAxMToyMTowMSArMDIwMCwgQ2zDqW1lbnQgTGUgR29mZmljIHdy
b3RlOgo+IFRoaXMgc2VyaWVzIGFpbXMgdG8gaW1wcm92ZSB0aGUgU1RNMzIgU1BJIGRyaXZlciBp
biBkaWZmZXJlbnQgYXJlYXMuCj4gSXQgYWRkcyBTUElfUkVBRFkgbW9kZSwgZml4ZXMgYW4gaXNz
dWUgcmFpc2VkIGJ5IGEga2VybmVsIGJvdCwKPiBhZGQgdGhlIGFiaWxpdHkgdG8gdXNlIERNQS1N
RE1BIGNoYWluaW5nIGZvciBSWCBhbmQgZGVwcmVjYXRlIGFuIFNUIGJpbmRpbmdzCj4gdmVuZG9y
IHByb3BlcnR5Lgo+IAo+IAoKQXBwbGllZCB0bwoKICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9zcGkuZ2l0IGZvci1uZXh0CgpUaGFua3Mh
CgpbMS82XSBzcGk6IHN0bTMyOiBBZGQgU1BJX1JFQURZIG1vZGUgdG8gc3BpIGNvbnRyb2xsZXIK
ICAgICAgY29tbWl0OiBlNGZlZWZhNWM3MTkxMmViZmNiOTdhM2RiZTJiMDIxZmQxY2VhOWQxClsy
LzZdIHNwaTogc3RtMzI6IENoZWNrIGZvciBjZmcgYXZhaWxhYmlsaXR5IGluIHN0bTMyX3NwaV9w
cm9iZQogICAgICBjb21taXQ6IDIxZjFjODAwZjY2MjBlNDNmMzFkZmQ3NjcwOWRiYWM4ZWJhYTVh
MTYKWzMvNl0gZHQtYmluZGluZ3M6IHNwaTogc3RtMzI6IHVwZGF0ZSBiaW5kaW5ncyB3aXRoIFNQ
SSBSeCBETUEtTURNQSBjaGFpbmluZwogICAgICBjb21taXQ6IGJkNjBmOTRhM2ViNGY4MGNiNjZj
OTY4N2Q2NDA1NTRmZDBjNTc5ZDAKWzQvNl0gc3BpOiBzdG0zMjogdXNlIFNUTTMyIERNQSB3aXRo
IFNUTTMyIE1ETUEgdG8gZW5oYW5jZSBERFIgdXNlCiAgICAgIGNvbW1pdDogZDE3ZGQyZjFkOGEx
ZDkxOWUzOWM2MzAyYjAyNGYxMzVhMmY5MDc3MwpbNS82XSBzcGk6IHN0bTMyOiBkZXByZWNhdGUg
YHN0LHNwaS1taWRpLW5zYCBwcm9wZXJ0eQogICAgICBjb21taXQ6IDQ5NTZiZjQ0NTI0Mzk0MjEx
Y2E4MGFhMDRkMGM5ZTFlOWJiMDIxOWQKWzYvNl0gZHQtYmluZGluZ3M6IHNwaTogc3RtMzI6IGRl
cHJlY2F0ZSBgc3Qsc3BpLW1pZGktbnNgIHByb3BlcnR5CiAgICAgIGNvbW1pdDogOWE5NDQ0OTRj
Mjk5ZmFiZjNjYzc4MTc5OGViN2MwMmEwYmVjZTM2NAoKQWxsIGJlaW5nIHdlbGwgdGhpcyBtZWFu
cyB0aGF0IGl0IHdpbGwgYmUgaW50ZWdyYXRlZCBpbnRvIHRoZSBsaW51eC1uZXh0CnRyZWUgKHVz
dWFsbHkgc29tZXRpbWUgaW4gdGhlIG5leHQgMjQgaG91cnMpIGFuZCBzZW50IHRvIExpbnVzIGR1
cmluZwp0aGUgbmV4dCBtZXJnZSB3aW5kb3cgKG9yIHNvb25lciBpZiBpdCBpcyBhIGJ1ZyBmaXgp
LCBob3dldmVyIGlmCnByb2JsZW1zIGFyZSBkaXNjb3ZlcmVkIHRoZW4gdGhlIHBhdGNoIG1heSBi
ZSBkcm9wcGVkIG9yIHJldmVydGVkLgoKWW91IG1heSBnZXQgZnVydGhlciBlLW1haWxzIHJlc3Vs
dGluZyBmcm9tIGF1dG9tYXRlZCBvciBtYW51YWwgdGVzdGluZwphbmQgcmV2aWV3IG9mIHRoZSB0
cmVlLCBwbGVhc2UgZW5nYWdlIHdpdGggcGVvcGxlIHJlcG9ydGluZyBwcm9ibGVtcyBhbmQKc2Vu
ZCBmb2xsb3d1cCBwYXRjaGVzIGFkZHJlc3NpbmcgYW55IGlzc3VlcyB0aGF0IGFyZSByZXBvcnRl
ZCBpZiBuZWVkZWQuCgpJZiBhbnkgdXBkYXRlcyBhcmUgcmVxdWlyZWQgb3IgeW91IGFyZSBzdWJt
aXR0aW5nIGZ1cnRoZXIgY2hhbmdlcyB0aGV5CnNob3VsZCBiZSBzZW50IGFzIGluY3JlbWVudGFs
IHVwZGF0ZXMgYWdhaW5zdCBjdXJyZW50IGdpdCwgZXhpc3RpbmcKcGF0Y2hlcyB3aWxsIG5vdCBi
ZSByZXBsYWNlZC4KClBsZWFzZSBhZGQgYW55IHJlbGV2YW50IGxpc3RzIGFuZCBtYWludGFpbmVy
cyB0byB0aGUgQ0NzIHdoZW4gcmVwbHlpbmcKdG8gdGhpcyBtYWlsLgoKVGhhbmtzLApNYXJrCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
