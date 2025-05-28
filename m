Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3447CAC6BA9
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 16:29:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9163C36B36;
	Wed, 28 May 2025 14:29:35 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03C34C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 14:29:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0A21DA49E4C;
 Wed, 28 May 2025 14:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70CBFC4CEE3;
 Wed, 28 May 2025 14:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748442573;
 bh=ubMRziPv811a1c4W27GNJyX/xyPJhyiu/AXagdFgPWI=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=I7laG2ypimp7SHSqxMa5Zv8dK5qj7rZUUI7/nErluXMBjhHHMSEtM6yvXCbavNUhJ
 ey5iPZkBWJFk8SdpyOmPE4kc14L+AahhnxT82ig5yydt8ZG7426O9eTfU0PgtGGVRe
 xxUm5obNaIxguw+DGXasu5SNYMHJKYo3ZwA+moZEIC0Zh1EYIv/kuGIZpD27Mc3PFs
 S/T8x6XVxdLiEpgBzOnm7N4RHNl+O3rbxGrGNaiysI7sIoqd0AJeh3oRi0giO6QTLq
 5vjtSN63MVbmCnUuTtCt2hed50uiXtRzJcJndBPHYw5f+w44UAcfR7sRFzPy5iAn6o
 F4Q1/RWE7qBow==
Date: Wed, 28 May 2025 09:29:31 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250528-hdp-upstream-v4-2-7e9b3ad2036d@foss.st.com>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
 <20250528-hdp-upstream-v4-2-7e9b3ad2036d@foss.st.com>
Message-Id: <174844257180.4036102.7091043043619447480.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/9] dt-bindings: pinctrl: stm32:
	Introduce HDP
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

Ck9uIFdlZCwgMjggTWF5IDIwMjUgMTU6MzA6NTUgKzAyMDAsIENsw6ltZW50IExlIEdvZmZpYyB3
cm90ZToKPiAnSERQJyBzdGFuZHMgZm9yIEhhcmR3YXJlIERlYnVnIFBvcnQsIGl0IGlzIGFuIGhh
cmR3YXJlIGJsb2NrIGluCj4gU1RNaWNyb2xlY3Ryb25pY3MnIE1QVXMgdGhhdCBsZXQgdGhlIHVz
ZXIgZGVjaWRlIHdoaWNoIGludGVybmFsIFNvQydzCj4gc2lnbmFsIHRvIG9ic2VydmUuCj4gSXQg
cHJvdmlkZXMgOCBwb3J0cyBhbmQgZm9yIGVhY2ggcG9ydCB0aGVyZSBpcyB1cCB0byAxNiBkaWZm
ZXJlbnQKPiBzaWduYWxzIHRoYXQgY2FuIGJlIG91dHB1dC4KPiBTaWduYWxzIGFyZSBkaWZmZXJl
bnQgZm9yIGVhY2ggTVBVLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8
Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+IC0tLQo+ICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3N0LHN0bTMyLWhkcC55YW1sICB8IDE4NyArKysrKysr
KysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE4NyBpbnNlcnRpb25zKCspCj4gCgpN
eSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgZHRfYmluZGluZ19jaGVjaycgb24geW91
ciBwYXRjaDoKCnlhbWxsaW50IHdhcm5pbmdzL2Vycm9yczoKCmR0c2NoZW1hL2R0YyB3YXJuaW5n
cy9lcnJvcnM6Ci9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kvbGludXgvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzItaGRwLnlhbWw6ICRpZDog
Q2Fubm90IGRldGVybWluZSBiYXNlIHBhdGggZnJvbSAkaWQsIHJlbGF0aXZlIHBhdGgvZmlsZW5h
bWUgZG9lc24ndCBtYXRjaCBhY3R1YWwgcGF0aCBvciBmaWxlbmFtZQogCSAkaWQ6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3BpbmN0cmwvc3Qsc3RtMzItcGluY3RybC1oZHAueWFtbAog
CWZpbGU6IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3Qsc3RtMzItaGRwLnlhbWwKCmRvYyByZWZl
cmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNrZG9jcyk6CgpTZWUgaHR0cHM6Ly9wYXRjaHdvcmsu
b3psYWJzLm9yZy9wcm9qZWN0L2RldmljZXRyZWUtYmluZGluZ3MvcGF0Y2gvMjAyNTA1MjgtaGRw
LXVwc3RyZWFtLXY0LTItN2U5YjNhZDIwMzZkQGZvc3Muc3QuY29tCgpUaGUgYmFzZSBmb3IgdGhl
IHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIGxhdGVzdCByYzEuIEEgZGlmZmVyZW50IGRlcGVuZGVu
Y3kKc2hvdWxkIGJlIG5vdGVkIGluICp0aGlzKiBwYXRjaC4KCklmIHlvdSBhbHJlYWR5IHJhbiAn
bWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQgZGlkbid0IHNlZSB0aGUgYWJvdmUKZXJyb3Iocyks
IHRoZW4gbWFrZSBzdXJlICd5YW1sbGludCcgaXMgaW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEgaXMg
dXAgdG8KZGF0ZToKCnBpcDMgaW5zdGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUKClBsZWFzZSBjaGVj
ayBhbmQgcmUtc3VibWl0IGFmdGVyIHJ1bm5pbmcgdGhlIGFib3ZlIGNvbW1hbmQgeW91cnNlbGYu
IE5vdGUKdGhhdCBEVF9TQ0hFTUFfRklMRVMgY2FuIGJlIHNldCB0byB5b3VyIHNjaGVtYSBmaWxl
IHRvIHNwZWVkIHVwIGNoZWNraW5nCnlvdXIgc2NoZW1hLiBIb3dldmVyLCBpdCBtdXN0IGJlIHVu
c2V0IHRvIHRlc3QgYWxsIGV4YW1wbGVzIHdpdGggeW91ciBzY2hlbWEuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
