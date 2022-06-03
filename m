Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0039D53C962
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jun 2022 13:34:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB654C5F1D3;
	Fri,  3 Jun 2022 11:34:33 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4A97C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jun 2022 11:34:31 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1nx5ZS-00059D-8m; Fri, 03 Jun 2022 13:34:26 +0200
Message-ID: <213e966d-ac69-b5be-52ad-4ab9f616565e@pengutronix.de>
Date: Fri, 3 Jun 2022 13:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: =?UTF-8?Q?Leonard_G=c3=b6hrs?= <l.goehrs@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20220603094422.2112746-1-l.goehrs@pengutronix.de>
 <20220603094422.2112746-2-l.goehrs@pengutronix.de>
Content-Language: en-US
In-Reply-To: <20220603094422.2112746-2-l.goehrs@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: correct vcc-supply
 for eeprom on stm32mp15xx-osd32
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

T24gMDMuMDYuMjIgMTE6NDQsIExlb25hcmQgR8O2aHJzIHdyb3RlOgo+IEFjY29yZGluZyB0byB0
aGUgT1NEMzJNUDEgUG93ZXIgU3lzdGVtIG92ZXJ2aWV3WzFdIHRoZSBFRVBST00gaXMgY29ubmVj
dGVkIHRvCj4gdGhlIFZERCBsaW5lIGFuZCBub3QgdG8gc29tZSBzaW5nbGUtcHVycG9zZSBmaXhl
ZCByZWd1bGF0b3IuCj4gU2V0IHRoZSBFRVBST00gc3VwcGx5IGFjY29yZGluZyB0byB0aGUgZGlh
Z3JhbSB0byBlbGltaW5hdGUgdGhpcyBwYXJlbnQtbGVzcwo+IHJlZ3VsYXRvci4KPiAKPiBbMV06
IGh0dHBzOi8vb2N0YXZvc3lzdGVtcy5jb20vYXBwX25vdGVzL29zZDMybXAxLXBvd2VyLXN5c3Rl
bS1vdmVydmlldy8jY29ubmVjdGlvbnMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBMZW9uYXJkIEfDtmhy
cyA8bC5nb2VocnNAcGVuZ3V0cm9uaXguZGU+CgpBY2tlZC1ieTogQWhtYWQgRmF0b3VtIDxhLmZh
dG91bUBwZW5ndXRyb25peC5kZT4KClRoYW5rcywKQWhtYWQKCj4gLS0tCj4gIGFyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMybXAxNXh4LW9zZDMyLmR0c2kgfCA4ICstLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtb3NkMzIuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNXh4LW9zZDMyLmR0c2kKPiBpbmRleCBlOTk3YzQ5NTNmZDEuLjkzNWI3MDg0YjVh
MiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1vc2QzMi5kdHNp
Cj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtb3NkMzIuZHRzaQo+IEBAIC01
MCwxMiArNTAsNiBAQCByZXRyYW06IHJldHJhbUAzODAwMDAwMCB7Cj4gIAkJCW5vLW1hcDsKPiAg
CQl9Owo+ICAJfTsKPiAtCj4gLQlyZWdfc2lwX2VlcHJvbTogcmVndWxhdG9yX2VlcHJvbSB7Cj4g
LQkJY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwo+IC0JCXJlZ3VsYXRvci1uYW1lID0g
InNpcF9lZXByb20iOwo+IC0JCXJlZ3VsYXRvci1hbHdheXMtb247Cj4gLQl9Owo+ICB9Owo+ICAK
PiAgJmkyYzQgewo+IEBAIC0yMDQsNyArMTk4LDcgQEAgcG1pY193YXRjaGRvZzogd2F0Y2hkb2cg
ewo+ICAKPiAgCXNpcF9lZXByb206IGVlcHJvbUA1MCB7Cj4gIAkJY29tcGF0aWJsZSA9ICJhdG1l
bCwyNGMzMiI7Cj4gLQkJdmNjLXN1cHBseSA9IDwmcmVnX3NpcF9lZXByb20+Owo+ICsJCXZjYy1z
dXBwbHkgPSA8JnZkZD47Cj4gIAkJcmVnID0gPDB4NTA+Owo+ICAJfTsKPiAgfTsKCgotLSAKUGVu
Z3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAg
IHwgaHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwgR2VybWFu
eSAgICAgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dl
cmljaHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIw
NjkxNy01NTU1IHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
