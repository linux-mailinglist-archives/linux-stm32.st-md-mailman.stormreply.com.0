Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2900A1BAC5F
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2020 20:22:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD2A6C36B0C;
	Mon, 27 Apr 2020 18:22:19 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24BDBC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 18:22:17 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6483A20005;
 Mon, 27 Apr 2020 18:22:13 +0000 (UTC)
Date: Mon, 27 Apr 2020 20:22:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20200427202212.0235d987@xps13>
In-Reply-To: <1586966256-29548-7-git-send-email-christophe.kerello@st.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-7-git-send-email-christophe.kerello@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 06/12] mtd: rawnand: stm32_fmc2: use
 FMC2_TIMEOUT_MS for timeouts
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

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0
LmNvbT4gd3JvdGUgb24gV2VkLCAxNSBBcHIKMjAyMCAxNzo1NzozMCArMDIwMDoKCj4gVGhpcyBw
YXRjaCByZW1vdmVzIHRoZSBjb25zdGFudCBGTUMyX1RJTUVPVVRfVVMuCj4gRk1DMl9USU1FT1VU
X01TIGlzIHNldCB0byA1IHNlY29uZHMgYW5kIHRoaXMgY29uc3RhbnQgaXMgdXNlZAo+IGVhY2gg
dGltZSB0aGF0IHdlIG5lZWQgdG8gd2FpdCAoZXhjZXB0IHdoZW4gdGhlIHRpbWVvdXQgdmFsdWUK
PiBpcyBzZXQgYnkgdGhlIGZyYW1ld29yaykKPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhl
IEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRk
L25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jIHwgMTEgKysrKystLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+IGluZGV4IGFiNTMzMTQuLmYxNTljMzkgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMKPiArKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+IEBAIC0zNyw4ICszNyw3IEBACj4g
IC8qIE1heCBFQ0MgYnVmZmVyIGxlbmd0aCAqLwo+ICAjZGVmaW5lIEZNQzJfTUFYX0VDQ19CVUZf
TEVOCQkoRk1DMl9CQ0hEU1JTX0xFTiAqIEZNQzJfTUFYX1NHKQo+ICAKPiAtI2RlZmluZSBGTUMy
X1RJTUVPVVRfVVMJCQkxMDAwCj4gLSNkZWZpbmUgRk1DMl9USU1FT1VUX01TCQkJMTAwMAo+ICsj
ZGVmaW5lIEZNQzJfVElNRU9VVF9NUwkJCTUwMDAKPiAgCj4gIC8qIFRpbWluZ3MgKi8KPiAgI2Rl
ZmluZSBGTUMyX1RISVoJCQkxCj4gQEAgLTUyNSw5ICs1MjQsOSBAQCBzdGF0aWMgaW50IHN0bTMy
X2ZtYzJfaGFtX2NhbGN1bGF0ZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBjb25zdCB1OCAqZGF0
YSwKPiAgCXUzMiBzciwgaGVjY3I7Cj4gIAlpbnQgcmV0Owo+ICAKPiAtCXJldCA9IHJlYWRsX3Jl
bGF4ZWRfcG9sbF90aW1lb3V0KGZtYzItPmlvX2Jhc2UgKyBGTUMyX1NSLAo+IC0JCQkJCSBzciwg
c3IgJiBGTUMyX1NSX05XUkYsIDEwLAo+IC0JCQkJCSBGTUMyX1RJTUVPVVRfTVMpOwo+ICsJcmV0
ID0gcmVhZGxfcmVsYXhlZF9wb2xsX3RpbWVvdXRfYXRvbWljKGZtYzItPmlvX2Jhc2UgKyBGTUMy
X1NSLAo+ICsJCQkJCQlzciwgc3IgJiBGTUMyX1NSX05XUkYsIDEsCj4gKwkJCQkJCTEwMDAgKiBG
TUMyX1RJTUVPVVRfTVMpOwoKSXMgdGhlIF9hdG9taWMgc3VmZml4IG5lZWRlZCBoZXJlPyBJZiB5
ZXMgaXQgd291bGQgZGVzZXJ2ZSBhIHNlcGFyYXRlCnBhdGNoIHdpdGggRml4ZXMvU3RhYmxlIHRh
Z3MuCgo+ICAJaWYgKHJldCkgewo+ICAJCWRldl9lcnIoZm1jMi0+ZGV2LCAiaGFtIHRpbWVvdXRc
biIpOwo+ICAJCXJldHVybiByZXQ7Cj4gQEAgLTEzMTUsNyArMTMxNCw3IEBAIHN0YXRpYyBpbnQg
c3RtMzJfZm1jMl93YWl0cmR5KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHVuc2lnbmVkIGxvbmcg
dGltZW91dF9tcykKPiAgCS8qIENoZWNrIGlmIHRoZXJlIGlzIG5vIHBlbmRpbmcgcmVxdWVzdHMg
dG8gdGhlIE5BTkQgZmxhc2ggKi8KPiAgCWlmIChyZWFkbF9yZWxheGVkX3BvbGxfdGltZW91dF9h
dG9taWMoZm1jMi0+aW9fYmFzZSArIEZNQzJfU1IsIHNyLAo+ICAJCQkJCSAgICAgIHNyICYgRk1D
Ml9TUl9OV1JGLCAxLAo+IC0JCQkJCSAgICAgIEZNQzJfVElNRU9VVF9VUykpCj4gKwkJCQkJICAg
ICAgMTAwMCAqIEZNQzJfVElNRU9VVF9NUykpCj4gIAkJZGV2X3dhcm4oZm1jMi0+ZGV2LCAiV2Fp
dHJkeSB0aW1lb3V0XG4iKTsKPiAgCj4gIAkvKiBXYWl0IHRXQiBiZWZvcmUgUi9CIyBzaWduYWwg
aXMgbG93ICovCgpZb3UgY2hhbmdlIHRoZSB0aW1lb3V0cyBmcm9tIDFtcyB0byA1cy4KCk1heWJl
IDVzIGlzIGEgbGl0dGxlIGJpdCB0b28gbXVjaCBJTUhPIGJ1dCB3ZSBkb24ndCByZWFsbHkgY2Fy
ZSBhcyB0aGlzCmlzIGEgdGltZW91dC4gSG93ZXZlciAxbXMgaXMgdGlnaHQuIElmIHlvdSBhcmUg
Y2hhbmdpbmcgdGhpcyB2YWx1ZQpiZWNhdXNlIGl0IHRyaWdnZXJzIGVycm9yIChlZy4gd2hlbiB0
aGUgbWFjaGluZSBpcyBsb2FkZWQpLCB0aGVuIGl0IGlzCmEgZml4IGFuZCBzaG91bGQgYXBwZWFy
IGxpa2UgaXQuCgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
