Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A9C7EF49F
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Nov 2023 15:35:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39DF8C6DD60;
	Fri, 17 Nov 2023 14:35:34 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2F0DC6C85F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Nov 2023 08:46:49 +0000 (UTC)
Received: from [100.116.125.19] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: andrzej.p)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7DCCC6607386;
 Fri, 17 Nov 2023 08:46:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700210809;
 bh=5caSPJBGYhsQEF1EZDAOJRHFGV6votwg14qOswGuAnM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RNfFtqCQlAxG520Rpz0DzWapTBIvMSYJVEMLa9P+3imrUbG5T6IEgTh0c7WR+yVlT
 jMmDJwR430lCXjdUf7xwPdpZsn1DGBNoCbWAvAs6eOHLe8pAMgRNiALxUNreMKrhyO
 lkftocCUlYCYLZxOkPExx4mBIJ4cB0T0YpeEBN/wq9tIhBhnlyEkFzmlr1trxHyssP
 DZS7cBco4JPxjucmgukDQX/XiuTZlnN28bMPPv7X1xUf6Ds9mtE+MdkYo8/FZEezh9
 yZtGW3RL6QQm54nLDK3b5WAQCCzAOXWKDIqcDZpxuAulhWG4P2jZTlG3LAeCYxBrnV
 IVFyutX4/BCBw==
Message-ID: <aea36e0b-216a-44a1-ac64-ca45b0ce0f85@collabora.com>
Date: Fri, 17 Nov 2023 09:46:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20231116154816.70959-1-andrzej.p@collabora.com>
 <20231116154816.70959-5-andrzej.p@collabora.com>
 <CAGXv+5Hag=-JqYAKOgNUyFSjuwBu6ij1Rsv1cp==duGjY8w42A@mail.gmail.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <CAGXv+5Hag=-JqYAKOgNUyFSjuwBu6ij1Rsv1cp==duGjY8w42A@mail.gmail.com>
X-Mailman-Approved-At: Fri, 17 Nov 2023 14:35:32 +0000
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [RFC 4/6] media: verisilicon: Update H1 register
	definitions
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

SGksCgpXIGRuaXUgMTcuMTEuMjAyMyBvwqAwNzo1NiwgQ2hlbi1ZdSBUc2FpIHBpc3plOgo+IE9u
IFRodSwgTm92IDE2LCAyMDIzIGF0IDExOjQ44oCvUE0gQW5kcnplaiBQaWV0cmFzaWV3aWN6Cj4g
PGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPj4KPj4gQWRkIGRlZmluaXRpb24gb2Yg
cmVnaXN0ZXIgYXQgb2Zmc2V0IDB4MDBjLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBp
ZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb19oMV9yZWdzLmggfCA5ICsrKysrKysr
Kwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX2gxX3JlZ3MuaCBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX2gxX3JlZ3MuaAo+PiBpbmRl
eCBjMWM2NmM5MzRhMjQuLmVmYjQ2ZGEyM2VhYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9faDFfcmVncy5oCj4+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX2gxX3JlZ3MuaAo+PiBAQCAtMjMsNiAr
MjMsMTUgQEAKPj4gICAjZGVmaW5lICAgICBIMV9SRUdfQVhJX0NUUkxfSU5QVVRfU1dBUDMyICAg
ICAgICAgICAgICAgQklUKDIpCj4+ICAgI2RlZmluZSAgICAgSDFfUkVHX0FYSV9DVFJMX09VVFBV
VF9TV0FQOCAgICAgICAgICAgICAgIEJJVCgxKQo+PiAgICNkZWZpbmUgICAgIEgxX1JFR19BWElf
Q1RSTF9JTlBVVF9TV0FQOCAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgwKQo+PiArI2RlZmlu
ZSBIMV9SRUdfREVWSUNFX0NUUkwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDBjCj4+
ICsjZGVmaW5lICAgICBIMV9SRUdfREVWSUNFX0NUUkxfU0NBTEVfT1VUUFVUX1NXQVA4ICAgICAg
QklUKDI3KQo+PiArI2RlZmluZSAgICAgSDFfUkVHX0RFVklDRV9DVFJMX1NDQUxFX09VVFBVVF9T
V0FQMTYgICAgIEJJVCgyNikKPj4gKyNkZWZpbmUgICAgIEgxX1JFR19ERVZJQ0VfQ1RSTF9TQ0FM
RV9PVVRQVVRfU1dBUDMyICAgICBCSVQoMjUpCj4+ICsjZGVmaW5lICAgICBIMV9SRUdfREVWSUNF
X0NUUkxfTVZfT1VUUFVUX1NXQVA4ICAgICAgICAgQklUKDI0KQo+PiArI2RlZmluZSAgICAgSDFf
UkVHX0RFVklDRV9DVFJMX01WX09VVFBVVF9TV0FQMTYgICAgICAgICAgICAgICAgQklUKDIzKQo+
PiArI2RlZmluZSAgICAgSDFfUkVHX0RFVklDRV9DVFJMX01WX09VVFBVVF9TV0FQMzIgICAgICAg
ICAgICAgICAgQklUKDIyKQo+PiArI2RlZmluZSAgICAgSDFfUkVHX0RFVklDRV9DVFJMX0lOUFVU
X1JFQURfMU1CICAgICAgICAgIEJJVCgyMSkKPj4gKyNkZWZpbmUgICAgIEgxX1JFR19ERVZJQ0Vf
Q1RSTF9BWElfRFVBTF9DSEFOTkVMICAgICAgICAgICAgICAgIEJJVCgyMCkKPiAKPiBBY2NvcmRp
bmcgdG8gdGhlIGkuTVg4TSBNaW5pIHJlZmVyZW5jZSBtYW51YWwsIHRoaXMgYml0IGlzIGEgImRp
c2FibGUiCj4gY29udHJvbCwgaS5lLiBzZXR0aW5nIHRoaXMgYml0IGRpc2FibGVzIGR1YWwgY2hh
bm5lbCBBWEkuIEkgdGhpbmsgdGhlCj4gbWFjcm8gc2hvdWxkIGV4cGxpY2l0bHkgc3RhdGUgdGhp
cyBpbiB0aGUgbmFtaW5nLCBzbyBzb21ldGhpbmcgbGlrZQo+IEgxX1JFR19ERVZJQ0VfQ1RSTF9E
SVNBQkxFX0FYSV9EVUFMX0NIKEFOTkVMKS4KCkdvb2QgcG9pbnQsIHRoYW5rcy4KCkFuZHJ6ZWoK
Cj4gCj4gT3RoZXIgYml0cyBtYXRjaGVzIHRoZSByZWZlcmVuY2UgbWFudWFsLgo+IAo+PiAgICNk
ZWZpbmUgSDFfUkVHX0FERFJfT1VUUFVUX1NUUkVBTSAgICAgICAgICAgICAgICAgICAgICAweDAx
NAo+PiAgICNkZWZpbmUgSDFfUkVHX0FERFJfT1VUUFVUX0NUUkwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDB4MDE4Cj4+ICAgI2RlZmluZSBIMV9SRUdfQUREUl9SRUZfTFVNQSAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDB4MDFjCj4+IC0tCj4+IDIuMjUuMQo+Pgo+Pgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gS2VybmVsIG1haWxp
bmcgbGlzdCAtLSBrZXJuZWxAbWFpbG1hbi5jb2xsYWJvcmEuY29tCj4gVG8gdW5zdWJzY3JpYmUg
c2VuZCBhbiBlbWFpbCB0byBrZXJuZWwtbGVhdmVAbWFpbG1hbi5jb2xsYWJvcmEuY29tCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
