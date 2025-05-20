Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3036BABE39C
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 21:25:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC388C7A822;
	Tue, 20 May 2025 19:25:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78D1FC7A821
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 19:25:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7EE2A629E5;
 Tue, 20 May 2025 19:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCD4C4CEE9;
 Tue, 20 May 2025 19:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747769105;
 bh=/YQuD/zXoYuchGtOXAaMXzL86e5ZTR1Z9Yg6aUdHmaE=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=Pm03hirfXqvWbK011PvyDZTeKD4xh9DP40C0ABh/Ysw6K4+tq4abcOoIoCf0F1gGc
 82Fb5HnxBy+bQUH3IAzfuz7EN9Eawm4UUWq11H8MUAh9KZiAY5m8NovoXz4SzLnNK1
 wpxVLlCHpD9kfgNJOyrsuhqRgJipU4kGxs+WJxB/8/ZeA31BTTxj3ICMMZgXuUUXrF
 Adh5Gst1HVJ3QHntXwLLmU0CdobimUXECalSIWjuUQxydJ9lr7Nkcmc207/6o6AQgk
 K8Vp1fJwqpaY+pGsUqiWunkC3ZR6CajLGe+VGkn02DtTXzO9niJ0MdzAePbONXYh2F
 WLiAll5knHuOw==
Date: Tue, 20 May 2025 14:25:03 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250520-hdp-upstream-v2-1-53f6b8b5ffc8@foss.st.com>
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
 <20250520-hdp-upstream-v2-1-53f6b8b5ffc8@foss.st.com>
Message-Id: <174776907517.1215979.15639504513287893325.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/8] dt-bindings: pinctrl: stm32:
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

Ck9uIFR1ZSwgMjAgTWF5IDIwMjUgMTc6MDI6MjggKzAyMDAsIENsw6ltZW50IExlIEdvZmZpYyB3
cm90ZToKPiAnSERQJyBzdGFuZHMgZm9yIEhhcmR3YXJlIERlYnVnIFBvcnQsIGl0IGlzIGFuIGhh
cmR3YXJlIGJsb2NrIGluCj4gU1RNaWNyb2xlY3Ryb25pY3MnIE1QVXMgdGhhdCBsZXQgdGhlIHVz
ZXIgZGVjaWRlIHdoaWNoIGludGVybmFsIFNvQydzCj4gc2lnbmFsIHRvIG9ic2VydmUuCj4gSXQg
cHJvdmlkZXMgOCBwb3J0cyBhbmQgZm9yIGVhY2ggcG9ydCB0aGVyZSBpcyB1cCB0byAxNiBkaWZm
ZXJlbnQKPiBzaWduYWxzIHRoYXQgY2FuIGJlIG91dHB1dC4KPiBTaWduYWxzIGFyZSBkaWZmZXJl
bnQgZm9yIGVhY2ggTVBVLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8
Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL3BpbmN0
cmwvc3Qsc3RtMzItcGluY3RybC1oZHAueWFtbCAgICAgfCAxODggKysrKysrKysrKysrKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxODggaW5zZXJ0aW9ucygrKQo+IAoKTXkgYm90IGZvdW5k
IGVycm9ycyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6Cgp5
YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6CgpkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOgpE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9zdCxzdG0zMi1waW5jdHJs
LWhkcC5leGFtcGxlLmR0YjogL2V4YW1wbGUtMC9waW5jdHJsQDU0MDkwMDAwOiBmYWlsZWQgdG8g
bWF0Y2ggYW55IHNjaGVtYSB3aXRoIGNvbXBhdGlibGU6IFsnc3Qsc3RtMzJtcDE1LWhkcCddCgpk
b2MgcmVmZXJlbmNlIGVycm9ycyAobWFrZSByZWZjaGVja2RvY3MpOgoKU2VlIGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9kZXZpY2V0cmVlLWJpbmRpbmdzL3BhdGNoLzIwMjUw
NTIwLWhkcC11cHN0cmVhbS12Mi0xLTUzZjZiOGI1ZmZjOEBmb3NzLnN0LmNvbQoKVGhlIGJhc2Ug
Zm9yIHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMxLiBBIGRpZmZlcmVudCBk
ZXBlbmRlbmN5CnNob3VsZCBiZSBub3RlZCBpbiAqdGhpcyogcGF0Y2guCgpJZiB5b3UgYWxyZWFk
eSByYW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlCmVy
cm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2No
ZW1hIGlzIHVwIHRvCmRhdGU6CgpwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlCgpQbGVh
c2UgY2hlY2sgYW5kIHJlLXN1Ym1pdCBhZnRlciBydW5uaW5nIHRoZSBhYm92ZSBjb21tYW5kIHlv
dXJzZWxmLiBOb3RlCnRoYXQgRFRfU0NIRU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8geW91ciBzY2hl
bWEgZmlsZSB0byBzcGVlZCB1cCBjaGVja2luZwp5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVz
dCBiZSB1bnNldCB0byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXIgc2NoZW1hLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
