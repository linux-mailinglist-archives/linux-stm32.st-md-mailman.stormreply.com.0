Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C740F93DA2B
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jul 2024 23:29:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79C0EC78018;
	Fri, 26 Jul 2024 21:29:57 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28E86C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jul 2024 21:29:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43154C0002;
 Fri, 26 Jul 2024 21:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1722029389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hitksc1k8zJDuSSoX0yIY4W/4pfIXgyE3bly4t52hoE=;
 b=LngetdCkJslhLHvz9xsXex1d4COAgjbMr9zUWs7jqRjIgSlnINmoE9iLlETh1Tb9b05rQP
 MjhIwQPXdKysGD8NCwMZIHEpUv8GsRsBzwhTqfUyq1yP0uhyqM4d7jETvH/YmH+m6+Z//x
 ihYBcCUFIjIdXmqfG7PwDsdbhndxs0csN5jCVAEltvjHRkiLY0fWdeYiLNv3d/xvF7U6Bv
 A7TGIb7gVCLpwz0Gly/m3K+EY6Em4g2tZRe8bEhQOxN+PU0CvpaR5SYSiELClX4XLhLAbO
 dPiJUAbUq1Zh2T0kBvyFPkKSsosdv17u1iPwhLepc3443qtLRy0UbF5zSzLi2g==
Date: Fri, 26 Jul 2024 23:29:49 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20240726212949fc918694@mail.local>
References: <20240722160022.454226-1-valentin.caron@foss.st.com>
 <CACRpkdbphGF_2P+bezdaYLE4n_1Z5NYjJfcuCh01ysB6QHC=qQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdbphGF_2P+bezdaYLE4n_1Z5NYjJfcuCh01ysB6QHC=qQ@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/4] rtc: stm32: add pinctrl interface
 to handle RTC outs
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

SGVsbG8gTGludXMsCgpPbiAyNi8wNy8yMDI0IDIyOjM3OjIxKzAyMDAsIExpbnVzIFdhbGxlaWog
d3JvdGU6Cj4gT24gTW9uLCBKdWwgMjIsIDIwMjQgYXQgNjowMuKAr1BNIFZhbGVudGluIENhcm9u
Cj4gPHZhbGVudGluLmNhcm9uQGZvc3Muc3QuY29tPiB3cm90ZToKPiAKPiA+IFRoaXMgc2VyaWVz
IGFkZHMgYSBwaW5jdHJsL3Bpbm11eCBpbnRlcmZhY2UgdG8gY29udHJvbCBTVE0zMiBSVEMgb3V0
cHV0cy4KPiAKPiBJbnRlcmVzdGluZyEgSSB0aGluayBpdCBpcyB0aGUgZmlyc3QgcGluIGNvbnRy
b2xsZXIgb3V0c2lkZSBvbgo+IGRyaXZlcnMvcGluY3RybCBpbiB0aGUga2VybmVsIHRyZWUuCgpB
Y3R1YWxseSwgd2UgaGF2ZSBydGMtb21hcCB3aGljaCBkb2VzIHRoaXMgdG9vLiBJJ3ZlIGJlZW4g
cHVzaGluZyBmb3IKbW9yZSBSVEMgdG8gZG8gdGhpcyBpbnN0ZWFkIG9mIGRlZmluaW5nIGN1c3Rv
bSBkdCBiaW5kaW5ncyB0byBkbyB3aGF0CmJvaWxzIGRvd24gdG8gcGlubXV4aW5nLgoKPiAKPiBQ
bGVhc2UgaW5jbHVkZSBtZSBhbmQgdGhlIGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnIGxpc3Qg
aW4KPiBzdWJzZXF1ZW50IHBvc3RpbmdzLCBJIHdhbnQgdG8gYmUgc3VyZSB3aGF0IGdldHMgbWVy
Z2VkIGhlcmUKPiBhbmQgSSBvbmx5IG5vdGljZWQgdGhpcyBmcm9tIHRoZSBMV04gZHJpdmVyIHBh
dGNoZXMgc3VtbWFyeS4KCgpJJ2xsIGFsc28gZW5zdXJlIHlvdSBnZXQgY29waWVkIG9uIHBpbmN0
cmwgcmVsYXRlZCBwYXRjaGVzLgoKCi0tIApBbGV4YW5kcmUgQmVsbG9uaSwgY28tb3duZXIgYW5k
IENPTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBz
Oi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
