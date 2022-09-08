Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CC95B1A2E
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Sep 2022 12:39:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0AA2C6334A;
	Thu,  8 Sep 2022 10:39:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36739C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 10:39:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D084261C50;
 Thu,  8 Sep 2022 10:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA85C433C1;
 Thu,  8 Sep 2022 10:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662633568;
 bh=GH13TrqmEr3vTznd3WCSEhXe4hhEBAQz+sg6JAdayE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e89c3+pKTqDeklmZK0N4PF/vOxkOzLt14Tg1ks02yS0BEvrP5tw9mAaQPjYBj9xvi
 c9KvLhqszrJNsjLC0zzV60vwJPzoWTJVs3rlpmInO6Y9LNws7j96BzqyEoU7kKmfDL
 nuTCTM+5f6UlQcvkFOP/BM3UF4RqmdjVhe1ik4abZ4F8suhlaH3mYKuTgkY+/pbrLL
 cWhXKpnjvXYGmEzIiJt9lM9ZMcgGeghVu47Fm3NHMz1PQQDvPD0VdjucFdzEynxCM5
 LOMcTl9jCkVNsluei77YR/kcVzZepG4MJYzzIF9C9P4+pH6Y3QTslwWZk1q5Hz+iFr
 cPanu1sFXQNAg==
Date: Thu, 8 Sep 2022 11:39:21 +0100
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Message-ID: <YxnGWRIrabWTKwxk@google.com>
References: <YxeS1BK2OBH1P/kO@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YxeS1BK2OBH1P/kO@google.com>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] mfd: stmpe: switch to using gpiod API
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

T24gVHVlLCAwNiBTZXAgMjAyMiwgRG1pdHJ5IFRvcm9raG92IHdyb3RlOgoKPiBUaGlzIHBhdGNo
IHN3aXRjaGVzIHRoZSBkcml2ZXIgYXdheSBmcm9tIGxlZ2FjeSBncGlvL29mX2dwaW8gQVBJIHRv
Cj4gZ3Bpb2QgQVBJLCBhbmQgcmVtb3ZlcyB1c2Ugb2Ygb2ZfZ2V0X25hbWVkX2dwaW9fZmxhZ3Mo
KSB3aGljaCBJIHdhbnQgdG8KPiBtYWtlIHByaXZhdGUgdG8gZ3Bpb2xpYi4KPiAKPiBXZSBhbHNv
IG5lZWQgdG8gcGF0Y2ggcmVsZXZhbnQgRFRTIGZpbGVzLCBhcyB0aGUgb3JpZ2luYWwgY29kZSBy
ZWxpZWQgb24KPiB0aGUgZmFjdCB0aGF0IG9mX2dldF9uYW1lZF9ncGlvX2ZsYWdzKCkgd291bGQg
ZmV0Y2ggYW55IGRhdGEgZW5jb2RlZCBpbgo+IEdQSU8gZmxhZ3MsIGV2ZW4gaWYgaXQgZG9lcyBu
b3QgcmVmbGVjdCB2YWxpZCBmbGFncyBmb3IgYSBHUElPLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERt
aXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4KPiAtLS0KPiAKPiB2MS0+
djI6Cj4gIC0gYWRkIERUUyBjaGFuZ2VzLCBhcyBub3RpY2VkIGJ5IEZyYW5jZXNjbyBEb2xjaW5p
Lgo+IAo+IEkgZ3Vlc3Mgd2UgY291bGQgZG8gYSBkYW5jZSBvZiBjaGFuZ2luZyBzdG1wZSB0byBj
aGVjayB0aGUgZmxhZ3MgY29taW5nCj4gZnJvbSBEVFMgYW5kIHRyeSB0byBkaXN0aW5ndWlzaCBJ
UlEgZmxhZ3MgZnJvbSBwcm9wZXIgR1BJTyBmbGFncywgdGhlbgo+IGhhdmUgYSBzZXBhcmF0ZSBw
YXRjaCBjaGFuZ2luZyBEVFNlcywgYW5kIGZpbmFsbHkgYSAybmQgcGF0Y2ggdG8gc3RtcGUKPiB0
byB1c2UgR1BJT0QgQVBJLCBidXQgSSBhbSBob3Bpbmcgd2UgY291bGQgYXBwbHkgdGhpcyBpbiBv
bmUgZ28uLi4KPiAKPiAgYXJjaC9hcm0vYm9vdC9kdHMvdGVncmEzMC1hcGFsaXMtdjEuMS5kdHNp
IHwgIDIgKy0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvdGVncmEzMC1hcGFsaXMuZHRzaSAgICAgIHwg
IDIgKy0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvdGVncmEzMC1jb2xpYnJpLmR0c2kgICAgIHwgIDIg
Ky0KPiAgZHJpdmVycy9tZmQvc3RtcGUuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgMzYgKysr
KysrKystLS0tLS0tLS0tLS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyks
IDI2IGRlbGV0aW9ucygtKQoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBKb25lcyBb5p2O55C8
5pavXQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
