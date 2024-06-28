Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D3691B4BF
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 03:49:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B89DC71287;
	Fri, 28 Jun 2024 01:49:30 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBB90C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 01:49:22 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8C3D88857D;
 Fri, 28 Jun 2024 03:49:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719539362;
 bh=lEqCfZeQ2BvI/k8Vx1CwsIkf9UwS08wiOmZwPTnBmQw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hXvOp4lzudUV3HQogSAMA7PNeqKDl0cs5KRO5jKIhTsy1TdrkltiL7kQY9w+qShBa
 f386+lXDgN5JsnKNKM3O1C5D9bGlr71azKWE5Qsb+BgbW84jvVLk3msM2+OnzAvLR3
 7aDYCAhhvLz/wADMKPe0f+99eOZH+b6//GVSJm0V5X/X5caS++UUAhUNPbzvnb9Tps
 KTCZm5b7QpB/iYLWV5nSCVlNg13PfS5Bq8y7mPJFidqmsViaBiPCTdM5FXvvib/b4l
 UNv99MkU2UpDggYY1oAqq7FcskxTRmteQ1njgaXl6S8K0UniilAS9fJIhr2sQs7yKP
 riYAcpYCjQjqQ==
Message-ID: <a1529d38-ce85-43e9-929e-017a42628b64@denx.de>
Date: Fri, 28 Jun 2024 02:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240623191602.67424-1-marex@denx.de>
 <8fb70911-a278-43b3-bcaf-c88b43bddb73@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <8fb70911-a278-43b3-bcaf-c88b43bddb73@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add phandle to nvmem
 efuse into STM32MP13xx ethernet DT node
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

T24gNi8yNy8yNCAyOjEzIFBNLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+IEhpIE1hcmVrCgpI
aSwKCj4gT24gNi8yMy8yNCAyMToxNSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IFRoZSBlZnVzZXMg
b24gU1RNMzJNUDEzeHggY2FuIGJlIHBvcHVsYXRlZCB3aXRoIGV0aGVybmV0IE1BQyBhZGRyZXNz
Lgo+PiBBZGQgdGhlIG52bWVtLWNlbGxzL252bWVtLWNlbGwtbmFtZSBEVCBwcm9wZXJ0aWVzIHRv
IGV0aGVybmV0IE1BQyBEVAo+PiBub2RlcyB0byBkZXNjcmliZSB0aGUgcGxhY2VtZW50IG9mIGJv
dGggTUFDIGFkZHJlc3MgZmllbGRzIHdpdGhpbiB0aGUKPj4gZWZ1c2VzLCBzbyB0aGUgZXRoZXJu
ZXQgTUFDIGRyaXZlciBjYW4gYWNjZXNzIHRoZSBlZnVzZXMgYW5kIHBvcHVsYXRlCj4+IHRoZSBj
b3JyZWN0IE1BQyBhZGRyZXNzIGludG8gdGhlIGhhcmR3YXJlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4gLS0tCj4+IENjOiBBbGV4YW5kcmUgVG9y
Z3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPgo+PiBDYzogQ2hyaXN0b3BoZSBSb3Vs
bGllciA8Y2hyaXN0b3BoZS5yb3VsbGllckBmb3NzLnN0LmNvbT4KPj4gQ2M6IENvbm9yIERvb2xl
eSA8Y29ub3IrZHRAa2VybmVsLm9yZz4KPj4gQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsr
ZHRAa2VybmVsLm9yZz4KPj4gQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdt
YWlsLmNvbT4KPj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+IENjOiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZwo+PiBDYzoga2VybmVsQGRoLWVsZWN0cm9uaWNzLmNvbQo+
PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IENjOiBsaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+IC0tLQo+PiDCoCBhcmNoL2FybS9i
b290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kgfCAyICsrCj4+IMKgIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0L3N0bTMybXAxMzMuZHRzaSB8IDIgKysKPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAx
MzEuZHRzaSAKPj4gYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMxLmR0c2kKPj4gaW5k
ZXggZjQxNTA4MTk1ZWI1MS4uNTVmNDE1MDUyNGYzYyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvc3Qvc3RtMzJtcDEzMS5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
L3N0bTMybXAxMzEuZHRzaQo+PiBAQCAtMTUyOCw2ICsxNTI4LDggQEAgZXRoZXJuZXQxOiBldGhl
cm5ldEA1ODAwYTAwMCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDwmcmNjIEVUSDFSWD4sCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDwmcmNjIEVUSDFTVFA+LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCA8JnJjYyBFVEgxQ0tfSz47Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbnZtZW0tY2VsbC1uYW1lcyA9ICJtYWMtYWRkcmVzcyI7Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnZtZW0tY2VsbHMgPSA8JmV0aGVybmV0X21hYzFf
YWRkcmVzcz47Cj4gCj4gSXQgc2hvdWxkIG5vdCBiZSBkZWZpbmVkIGluIHNvYyBkdHNpIGZpbGUg
YnV0IHJhdGhlciBpbiBib2FyZCBmaWxlLiBPVFAgCj4gYXJlIHByb3Zpc2lvbmVkIGJ5IHRoZSBl
bmQgY3VzdG9tZXIgbm90IGJ5IFNULiBJZiB5b3Ugb3JkZXIgYSBTb0MgdG8gU1QgCj4gaXQgd2ls
bCBub3QgYmUgcHJvdmlzaW9uZWQgT1RQIE1BQyBhZGRyIHdpbGwgYmUgc2V0IHRvIDAuCgpUaGF0
J3MgcmlnaHQsIGJ1dCBhdCBsZWFzdCB0aGUgTUFDIGFkZHJlc3Mgd2lsbCBiZSBpbiB0aGUgc2Ft
ZSBsb2NhdGlvbnMgCmluIE9UUCwgYW5kIGlmIHRoZSBNQUMgZnJvbSBPVFAgaXMgYWxsIHplcm9l
cywgdGhhbiBpdCB3b3VsZG4ndCBiZSAKY29uc2lkZXJlZCBhIHZhbGlkIE1BQyBhZGRyZXNzLgoK
SW4gYW55IGNhc2UsIEknbGwgZG8gYm9hcmQgc3BlY2lmaWMgVjIgc2hvcnRseS4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
