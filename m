Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F778C43BB
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 17:06:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA16CC6C83A;
	Mon, 13 May 2024 15:06:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CD53C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 15:06:50 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id AD39D882ED;
 Mon, 13 May 2024 17:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715612809;
 bh=YhXmpuQMSBlWuqvNlqebAMChQCjfvMpYn7wSLo1Cbdw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FzGVcKZCVERzROGGwpxMg9kiTbE8/p+IQYQLDbtuLDUIaHDOYfn8Un7/qT30EgVbm
 io1mW0ZEzY3A/1toRYEeiFrHh8mOpghp5A/+6dJ2/s+vIXSG/wvN0JmZDwkp654ARH
 Bc5d3r/+XrdNapW2lYTjqjqs8ae4ZxX/m1/uwHuqVoaBbHM8nCnarfTsqOxhwAbtk2
 05QvdApfQR1mYm4Gv6YfA4M7zXa2fYwalYemwuxJeLZY+b0gxMgw3vvItTRkhUL0up
 dN2cq+njdvptMZuZFT9PRzFnC2jinvFHoN957Q5PZiadJLgBLhlKmWoH+tF+aU8OAd
 4Thv1bK0VM0vg==
Message-ID: <2b1ed649-ab05-4cfe-86be-96e1a96ec76f@denx.de>
Date: Mon, 13 May 2024 16:23:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe ROULLIER <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240426125707.585269-1-christophe.roullier@foss.st.com>
 <20240426125707.585269-4-christophe.roullier@foss.st.com>
 <56f2d023-82d5-4910-8c4e-68e9d62bd1fe@denx.de>
 <4da0ce80-2120-4d67-aaaa-7dbf13b1da73@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4da0ce80-2120-4d67-aaaa-7dbf13b1da73@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 03/11] net: stmmac: dwmac-stm32: rework
 glue to simplify management
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

T24gNS8xMy8yNCAyOjQ4IFBNLCBDaHJpc3RvcGhlIFJPVUxMSUVSIHdyb3RlOgo+IEhpCj4gCj4g
T24gNC8yNi8yNCAxNjo1MywgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDQvMjYvMjQgMjo1NiBQ
TSwgQ2hyaXN0b3BoZSBSb3VsbGllciB3cm90ZToKPj4+IENoYW5nZSBnbHVlIHRvIGJlIG1vcmUg
Z2VuZXJpYyBhbmQgbWFuYWdlIGVhc2lseSBuZXh0IHN0bTMyIHByb2R1Y3RzLgo+Pj4gVGhlIGdv
YWwgb2YgdGhpcyBjb21taXQgaXMgdG8gaGF2ZSBvbmUgc3RtMzJtcDFfc2V0X21vZGUgZnVuY3Rp
b24gd2hpY2gKPj4+IGNhbiBtYW5hZ2UgZGlmZmVyZW50IFNUTTMyIFNPQy4gU09DIGNhbiBoYXZl
IGRpZmZlcmVudCBTWVNDRkcgcmVnaXN0ZXIKPj4+IGJpdGZpZWxkcy4gc28gaW4gcG1jc2V0ciB3
ZSBkZWZpbmVkIHRoZSBiaXRmaWVsZHMgY29ycmVzcG9uZGluZyB0byAKPj4+IHRoZSBTT0MuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBSb3VsbGllciA8Y2hyaXN0b3BoZS5yb3Vs
bGllckBmb3NzLnN0LmNvbT4KPj4+IC0tLQo+Pj4gwqAgLi4uL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYy1zdG0zMi5jIHwgNzYgKysrKysrKysrKysrKy0tLS0tLQo+Pj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdG0z
Mi5jIAo+Pj4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdG0z
Mi5jCj4+PiBpbmRleCBjOTJkZmM0ZWNmNTcuLjY4YTAyZGUyNWFjNyAxMDA2NDQKPj4+IC0tLSBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0bTMyLmMKPj4+ICsr
KyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0bTMyLmMKPj4+
IEBAIC0yMywxMCArMjMsNiBAQAo+Pj4gwqAgwqAgI2RlZmluZSBTWVNDRkdfTUNVX0VUSF9NQVNL
wqDCoMKgwqDCoMKgwqAgQklUKDIzKQo+Pj4gwqAgI2RlZmluZSBTWVNDRkdfTVAxX0VUSF9NQVNL
wqDCoMKgwqDCoMKgwqAgR0VOTUFTSygyMywgMTYpCj4+PiAtI2RlZmluZSBTWVNDRkdfUE1DQ0xS
Ul9PRkZTRVTCoMKgwqDCoMKgwqDCoCAweDQwCj4+PiAtCj4+PiAtI2RlZmluZSBTWVNDRkdfUE1D
Ul9FVEhfQ0xLX1NFTMKgwqDCoMKgwqDCoMKgIEJJVCgxNikKPj4+IC0jZGVmaW5lIFNZU0NGR19Q
TUNSX0VUSF9SRUZfQ0xLX1NFTMKgwqDCoCBCSVQoMTcpCj4+PiDCoCDCoCAvKiBDTE9DSyBmZWVk
IHRvIFBIWSovCj4+PiDCoCAjZGVmaW5lIEVUSF9DS19GXzI1TcKgwqDCoCAyNTAwMDAwMAo+Pj4g
QEAgLTQ2LDkgKzQyLDYgQEAKPj4+IMKgwqAgKiBSTUlJwqAgfMKgwqAgMcKgwqDCoMKgIHzCoMKg
IDDCoMKgwqDCoMKgIHzCoMKgIDDCoMKgwqDCoMKgwqAgfMKgIG4vYcKgIHwKPj4+IMKgwqAgKi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4gwqDCoCAqLwo+Pj4g
LSNkZWZpbmUgU1lTQ0ZHX1BNQ1JfRVRIX1NFTF9NSUnCoMKgwqDCoMKgwqDCoCBCSVQoMjApCj4+
PiAtI2RlZmluZSBTWVNDRkdfUE1DUl9FVEhfU0VMX1JHTUlJwqDCoMKgIEJJVCgyMSkKPj4+IC0j
ZGVmaW5lIFNZU0NGR19QTUNSX0VUSF9TRUxfUk1JScKgwqDCoCBCSVQoMjMpCj4+PiDCoCAjZGVm
aW5lIFNZU0NGR19QTUNSX0VUSF9TRUxfR01JScKgwqDCoCAwCj4+PiDCoCAjZGVmaW5lIFNZU0NG
R19NQ1VfRVRIX1NFTF9NSUnCoMKgwqDCoMKgwqDCoCAwCj4+PiDCoCAjZGVmaW5lIFNZU0NGR19N
Q1VfRVRIX1NFTF9STUlJwqDCoMKgwqDCoMKgwqAgMQo+Pj4gQEAgLTkwLDE5ICs4MywzMyBAQCBz
dHJ1Y3Qgc3RtMzJfZHdtYWMgewo+Pj4gwqDCoMKgwqDCoCBpbnQgZXRoX3JlZl9jbGtfc2VsX3Jl
ZzsKPj4+IMKgwqDCoMKgwqAgaW50IGlycV9wd3Jfd2FrZXVwOwo+Pj4gwqDCoMKgwqDCoCB1MzIg
bW9kZV9yZWc7wqDCoMKgwqDCoMKgwqDCoCAvKiBNQUMgZ2x1ZS1sb2dpYyBtb2RlIHJlZ2lzdGVy
ICovCj4+PiArwqDCoMKgIHUzMiBtb2RlX21hc2s7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCByZWdt
YXAgKnJlZ21hcDsKPj4+IMKgwqDCoMKgwqAgdTMyIHNwZWVkOwo+Pj4gwqDCoMKgwqDCoCBjb25z
dCBzdHJ1Y3Qgc3RtMzJfb3BzICpvcHM7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRl
djsKPj4+IMKgIH07Cj4+PiDCoCArc3RydWN0IHN0bTMyX3N5c2NmZ19wbWNzZXRyIHsKPj4+ICvC
oMKgwqAgdTMyIGV0aDFfY2xrX3NlbDsKPj4+ICvCoMKgwqAgdTMyIGV0aDFfcmVmX2Nsa19zZWw7
Cj4+PiArwqDCoMKgIHUzMiBldGgxX3NlbG1paTsKPj4+ICvCoMKgwqAgdTMyIGV0aDFfc2VsX3Jn
bWlpOwo+Pj4gK8KgwqDCoCB1MzIgZXRoMV9zZWxfcm1paTsKPj4+ICvCoMKgwqAgdTMyIGV0aDJf
Y2xrX3NlbDsKPj4+ICvCoMKgwqAgdTMyIGV0aDJfcmVmX2Nsa19zZWw7Cj4+PiArwqDCoMKgIHUz
MiBldGgyX3NlbF9yZ21paTsKPj4+ICvCoMKgwqAgdTMyIGV0aDJfc2VsX3JtaWk7Cj4+PiArfTsK
Pj4KPj4gWy4uLl0KPj4KPj4+IEBAIC00ODcsOCArNTAyLDE5IEBAIHN0YXRpYyBzdHJ1Y3Qgc3Rt
MzJfb3BzIHN0bTMybXAxX2R3bWFjX2RhdGEgPSB7Cj4+PiDCoMKgwqDCoMKgIC5zdXNwZW5kID0g
c3RtMzJtcDFfc3VzcGVuZCwKPj4+IMKgwqDCoMKgwqAgLnJlc3VtZSA9IHN0bTMybXAxX3Jlc3Vt
ZSwKPj4+IMKgwqDCoMKgwqAgLnBhcnNlX2RhdGEgPSBzdG0zMm1wMV9wYXJzZV9kYXRhLAo+Pj4g
LcKgwqDCoCAuc3lzY2ZnX2V0aF9tYXNrID0gU1lTQ0ZHX01QMV9FVEhfTUFTSywKPj4+IC3CoMKg
wqAgLmNsa19yeF9lbmFibGVfaW5fc3VzcGVuZCA9IHRydWUKPj4+ICvCoMKgwqAgLmNsa19yeF9l
bmFibGVfaW5fc3VzcGVuZCA9IHRydWUsCj4+PiArwqDCoMKgIC5zeXNjZmdfY2xyX29mZiA9IDB4
NDQsCj4+PiArwqDCoMKgIC5wbWNzZXRyID0gewo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5ldGgxX2Ns
a19zZWzCoMKgwqDCoMKgwqDCoCA9IEJJVCgxNiksCj4+PiArwqDCoMKgwqDCoMKgwqAgLmV0aDFf
cmVmX2Nsa19zZWzCoMKgwqAgPSBCSVQoMTcpLAo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5ldGgxX3Nl
bG1pacKgwqDCoMKgwqDCoMKgID0gQklUKDIwKSwKPj4+ICvCoMKgwqDCoMKgwqDCoCAuZXRoMV9z
ZWxfcmdtaWnCoMKgwqDCoMKgwqDCoCA9IEJJVCgyMSksCj4+PiArwqDCoMKgwqDCoMKgwqAgLmV0
aDFfc2VsX3JtaWnCoMKgwqDCoMKgwqDCoCA9IEJJVCgyMyksCj4+PiArwqDCoMKgwqDCoMKgwqAg
LmV0aDJfY2xrX3NlbMKgwqDCoMKgwqDCoMKgID0gMCwKPj4+ICvCoMKgwqDCoMKgwqDCoCAuZXRo
Ml9yZWZfY2xrX3NlbMKgwqDCoCA9IDAsCj4+PiArwqDCoMKgwqDCoMKgwqAgLmV0aDJfc2VsX3Jn
bWlpwqDCoMKgwqDCoMKgwqAgPSAwLAo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5ldGgyX3NlbF9ybWlp
wqDCoMKgwqDCoMKgwqAgPSAwCj4+PiArwqDCoMKgIH0KPj4+IMKgIH07Cj4+Cj4+IElzIHRoaXMg
c3RydWN0dXJlIHJlYWxseSBuZWNlc3NhcnkgPwo+Pgo+IEkgcHJlZmVyIHRvIGtlZXAgdGhpcyBp
bXBsZW1lbnRhdGlvbiBmb3IgdGhlIG1vbWVudCwgYXMgaXQgaXMgd29ya2luZyAKPiBmaW5lLiBN
YXliZSBhdCBhIGxhdGVyIHN0YWdlLCBJIHdpbGwgc2VuZCBzb21lIG9wdGltaXphdGlvbnMuCgpC
SVQoKSBhbmQgbGVmdCBzaGlmdCBieSA4IHdvcmtzIGFsbCB0aGUgc2FtZSwgd2l0aG91dCBhbGwg
dGhpcyAKY29tcGxleGl0eSBhbmQgbmV3IHN0cnVjdHVyZXMsIHNpbmNlIGFsbCB5b3UgcmVhbGx5
IGhhdmUgb24gTVAxMyBhcmUgdHdvIAppZGVudGljYWwgYml0ZmllbGRzIChvbmUgYXQgb2Zmc2V0
IDE2LCB0aGUgb3RoZXIgYXQgb2Zmc2V0IDI0KSB3aXRoIHRoZSAKc2FtZSBiaXRzIGluIHRoZW0s
IHNvIHdoeSBub3QgbWFrZSB0aGlzIHNpbXBsZSA/Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
