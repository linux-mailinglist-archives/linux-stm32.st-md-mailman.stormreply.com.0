Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0209EE8B3
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2024 15:26:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F21B2C7129D;
	Thu, 12 Dec 2024 14:26:51 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8036C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 14:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734013609;
 bh=WY0yDhTwQaObU/ZfX3CIya5sYXTBGAfaLA5EU3pTQ/g=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=Ki6Yq+XBhKrYI1rehEH6ytA9Zy5LsJve0243a/H1kgdh5r9VQxQ5sjhbywMqqTeP1
 rPwi8Slb9DH+S6KoCiN/I+u+E5C5drtfFpxl4iyX12dj2+8Hxx0fkVGVlg+hqgqhmI
 y4BhvNawe5Wkjzqt3bhUVU3un0N8mU2d68pDWp/gi0fLQIWWL52wqkLSeXw2NvhVcA
 7jZhVdElyEg9xGU2wVzsTW2lxLczo3ImvfS/Bq8qd9t6HHCfnNQFkCGCiEsFd5M9ng
 HqxkpOnjpvO5lHijAHxNQfSjk69JGcW3DyixIDfkCFzyrYk2bxzgWsZA6d/4y1LH/i
 VppIFbE0CthQg==
Received: from nicolas-tpx395.localdomain (unknown
 [IPv6:2606:6d00:15:862e::7a9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: nicolas)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id ACFA617E3767;
 Thu, 12 Dec 2024 15:26:47 +0100 (CET)
Message-ID: <2b5a496fc2c114ae40b4d623ac8ad0884d334b60.camel@collabora.com>
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Fritz Koenig	 <frkoenig@chromium.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,  Daniel Almeida
 <daniel.almeida@collabora.com>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 12 Dec 2024 09:26:46 -0500
In-Reply-To: <20241120110105.244413-4-hugues.fruchet@foss.st.com>
References: <20241120110105.244413-1-hugues.fruchet@foss.st.com>
 <20241120110105.244413-4-hugues.fruchet@foss.st.com>
Organization: Collabora
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
MIME-Version: 1.0
Subject: Re: [Linux-stm32] [PATCH v2 3/3] media: verisilicon: postproc: 4K
	support
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

TGUgbWVyY3JlZGkgMjAgbm92ZW1icmUgMjAyNCDDoCAxMjowMSArMDEwMCwgSHVndWVzIEZydWNo
ZXQgYSDDqWNyaXTCoDoKPiBTdXBwb3J0IGlucHV0IGxhcmdlciB0aGFuIDQwOTZ4MjA0OCB1c2lu
ZyBleHRlbmRlZCBpbnB1dCB3aWR0aC9oZWlnaHQKPiBmaWVsZHMgb2Ygc3dyZWc5Mi4KPiBUaGlz
IGlzIG5lZWRlZCB0byBkZWNvZGUgbGFyZ2UgV2ViUCBvciBKUEVHIHBpY3R1cmVzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEh1Z3VlcyBGcnVjaGV0IDxodWd1ZXMuZnJ1Y2hldEBmb3NzLnN0LmNvbT4K
ClJldmlld2VkLWJ5OiBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9y
YS5jb20+CgpUaGlzIGNhbiBsaWtlbHkgYmUgcGlja2VkIGluZGVwZW5kZW50bHkgYXMgaXQgYWxy
ZWFkeSBpbXByb3ZlIEpQRUcgc3VwcG9ydC4KCk5pY29sYXMKCj4gLS0tCj4gIGRyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvLmggICAgICAgICAgfCAyICsrCj4gIGRyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX2cxX3JlZ3MuaCAgfCAyICstCj4g
IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX3Bvc3Rwcm9jLmMgfCA2
ICsrKysrLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9o
YW50cm8uaCBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvLmgKPiBp
bmRleCA4MTEyNjBkYzNjNzcuLmQxMzM3Zjc3NDJlNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyby5oCj4gKysrIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm8uaAo+IEBAIC0zMjEsNiArMzIxLDggQEAgc3RydWN0
IGhhbnRyb19wb3N0cHJvY19yZWdzIHsKPiAgCXN0cnVjdCBoYW50cm9fcmVnIG91dHB1dF9mbXQ7
Cj4gIAlzdHJ1Y3QgaGFudHJvX3JlZyBvcmlnX3dpZHRoOwo+ICAJc3RydWN0IGhhbnRyb19yZWcg
ZGlzcGxheV93aWR0aDsKPiArCXN0cnVjdCBoYW50cm9fcmVnIGlucHV0X3dpZHRoX2V4dDsKPiAr
CXN0cnVjdCBoYW50cm9fcmVnIGlucHV0X2hlaWdodF9leHQ7Cj4gIH07Cj4gIAo+ICBzdHJ1Y3Qg
aGFudHJvX3ZwOV9kZWNvZGVkX2J1ZmZlcl9pbmZvIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9fZzFfcmVncy5oIGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9fZzFfcmVncy5oCj4gaW5kZXggZTdkNGRiNzg4
ZTU3Li5mNmU1YmJlYjE5MTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92
ZXJpc2lsaWNvbi9oYW50cm9fZzFfcmVncy5oCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS92ZXJpc2lsaWNvbi9oYW50cm9fZzFfcmVncy5oCj4gQEAgLTM1MSw3ICszNTEsNyBAQAo+ICAj
ZGVmaW5lICAgICBHMV9SRUdfUFBfQ09OVFJPTF9PVVRfV0lEVEgodikgKCgodikgPDwgNCkgJiBH
RU5NQVNLKDE0LCA0KSkKPiAgI2RlZmluZSBHMV9SRUdfUFBfTUFTSzFfT1JJR19XSURUSAlHMV9T
V1JFRyg4OCkKPiAgI2RlZmluZSAgICAgRzFfUkVHX1BQX09SSUdfV0lEVEgodikJKCgodikgPDwg
MjMpICYgR0VOTUFTSygzMSwgMjMpKQo+IC0jZGVmaW5lIEcxX1JFR19QUF9ESVNQTEFZX1dJRFRI
CQlHMV9TV1JFRyg5MikKPiArI2RlZmluZSBHMV9SRUdfUFBfRElTUExBWV9XSURUSF9JTl9FWFQJ
RzFfU1dSRUcoOTIpCj4gICNkZWZpbmUgRzFfUkVHX1BQX0ZVU0UJCQlHMV9TV1JFRyg5OSkKPiAg
Cj4gICNlbmRpZiAvKiBIQU5UUk9fRzFfUkVHU19IXyAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19wb3N0cHJvYy5jIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9fcG9zdHByb2MuYwo+IGluZGV4IDIzMmM5
M2VlYTdlZS4uODRjOGUyODc0NzBkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vdmVyaXNpbGljb24vaGFudHJvX3Bvc3Rwcm9jLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19wb3N0cHJvYy5jCj4gQEAgLTQ5LDcgKzQ5LDkgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBoYW50cm9fcG9zdHByb2NfcmVncyBoYW50cm9fZzFfcG9zdHBy
b2NfcmVncyA9IHsKPiAgCS5pbnB1dF9mbXQgPSB7RzFfUkVHX1BQX0NPTlRST0wsIDI5LCAweDd9
LAo+ICAJLm91dHB1dF9mbXQgPSB7RzFfUkVHX1BQX0NPTlRST0wsIDI2LCAweDd9LAo+ICAJLm9y
aWdfd2lkdGggPSB7RzFfUkVHX1BQX01BU0sxX09SSUdfV0lEVEgsIDIzLCAweDFmZn0sCj4gLQku
ZGlzcGxheV93aWR0aCA9IHtHMV9SRUdfUFBfRElTUExBWV9XSURUSCwgMCwgMHhmZmZ9LAo+ICsJ
LmRpc3BsYXlfd2lkdGggPSB7RzFfUkVHX1BQX0RJU1BMQVlfV0lEVEhfSU5fRVhULCAwLCAweGZm
Zn0sCj4gKwkuaW5wdXRfd2lkdGhfZXh0ID0ge0cxX1JFR19QUF9ESVNQTEFZX1dJRFRIX0lOX0VY
VCwgMjYsIDB4N30sCj4gKwkuaW5wdXRfaGVpZ2h0X2V4dCA9IHtHMV9SRUdfUFBfRElTUExBWV9X
SURUSF9JTl9FWFQsIDI5LCAweDd9LAo+ICB9Owo+ICAKPiAgYm9vbCBoYW50cm9fbmVlZHNfcG9z
dHByb2MoY29uc3Qgc3RydWN0IGhhbnRyb19jdHggKmN0eCwKPiBAQCAtMTAzLDYgKzEwNSw4IEBA
IHN0YXRpYyB2b2lkIGhhbnRyb19wb3N0cHJvY19nMV9lbmFibGUoc3RydWN0IGhhbnRyb19jdHgg
KmN0eCkKPiAgCUhBTlRST19QUF9SRUdfV1JJVEUodnB1LCBvdXRwdXRfaGVpZ2h0LCBjdHgtPmRz
dF9mbXQuaGVpZ2h0KTsKPiAgCUhBTlRST19QUF9SRUdfV1JJVEUodnB1LCBvcmlnX3dpZHRoLCBN
Ql9XSURUSChjdHgtPmRzdF9mbXQud2lkdGgpKTsKPiAgCUhBTlRST19QUF9SRUdfV1JJVEUodnB1
LCBkaXNwbGF5X3dpZHRoLCBjdHgtPmRzdF9mbXQud2lkdGgpOwo+ICsJSEFOVFJPX1BQX1JFR19X
UklURSh2cHUsIGlucHV0X3dpZHRoX2V4dCwgTUJfV0lEVEgoY3R4LT5kc3RfZm10LndpZHRoKSA+
PiA5KTsKPiArCUhBTlRST19QUF9SRUdfV1JJVEUodnB1LCBpbnB1dF9oZWlnaHRfZXh0LCBNQl9I
RUlHSFQoY3R4LT5kc3RfZm10LmhlaWdodCA+PiA4KSk7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQg
ZG93bl9zY2FsZV9mYWN0b3Ioc3RydWN0IGhhbnRyb19jdHggKmN0eCkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
