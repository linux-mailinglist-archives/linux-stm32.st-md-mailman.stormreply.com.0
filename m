Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6B3734E64
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 10:46:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8605C6B458;
	Mon, 19 Jun 2023 08:46:53 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40CFFC64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 13:48:26 +0000 (UTC)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686923305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8oK/JD/VfQBaYnT9KJx8BUomsRwXIR/Wq47zzH/xURI=;
 b=N95uKDkFRvrLUoacdiLx3mrcBstb+8fwzdVsf2ul7uf6Ax64ehU/HuBfHioTUQcfai6VdU
 QwWC6u36IDmXlt5k2bwHon2DQo6M+6hGsv5SI0s4cnNnhHxYWbqtb5uQDl8vlNcZl7M5Ys
 yJGDB8+0+hmhrF+Im+MswNcoH7a7Od/7ytGcjOSSFddRP6HI/C8zFDDXUjQZ6iAzRtLk4k
 CddbTmcvec/b2kFDxlFnPJmRiwjw8z27pXSbRLm/erjIHp5vdUW2uuKBJXVeZKt94/gqYj
 9ytK2pvllhb7xJ3erhfBiNnX0Ui+FN5TQaCxqRLEC/4YNaaRhwbK6qk1BrREog==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9A18FF806;
 Fri, 16 Jun 2023 13:48:21 +0000 (UTC)
Message-ID: <71492ab7-9d6b-e41c-e392-1bee04860f18@bootlin.com>
Date: Fri, 16 Jun 2023 15:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
To: Simon Horman <simon.horman@corigine.com>
References: <20230616100409.164583-1-alexis.lothore@bootlin.com>
 <20230616100409.164583-4-alexis.lothore@bootlin.com>
 <ZIxkyfRIuVcmCzmD@corigine.com>
Content-Language: en-US
From: =?UTF-8?Q?Alexis_Lothor=c3=a9?= <alexis.lothore@bootlin.com>
In-Reply-To: <ZIxkyfRIuVcmCzmD@corigine.com>
X-Mailman-Approved-At: Mon, 19 Jun 2023 08:46:47 +0000
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/8] net: stmmac: move PTP
 interrupt handling to IP-specific DWMAC file
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

SGVsbG8gU2ltb24sCgpPbiA2LzE2LzIzIDE1OjM0LCBTaW1vbiBIb3JtYW4gd3JvdGU6Cj4gT24g
RnJpLCBKdW4gMTYsIDIwMjMgYXQgMTI6MDQ6MDRQTSArMDIwMCwgYWxleGlzLmxvdGhvcmVAYm9v
dGxpbi5jb20gd3JvdGU6Cj4+IEZyb206IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+Cj4+Cj4+IEFzIGZvciBhdXhpbGlhcnkgc25hcHNob3QgdHJpZ2dlcnMgY29u
ZmlndXJhdGlvbiwgcmVhZGluZyBzbmFwc2hvdHMgZGVwZW5kcwo+PiBvbiBzcGVjaWZpYyByZWdp
c3RlcnMgYWRkcmVzc2VzIGFuZCBsYXlvdXQuIEFzIGEgY29uc2VxdWVuY2UsIG1vdmUKPj4gUFRQ
LXNwZWNpZmljIHBhcnQgb2Ygc3RtbWFjIGludGVycnVwdCBoYW5kbGluZyB0byBzcGVjaWZpYyBE
V01BQyBJUCBmaWxlCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+Cj4gCj4gSGkgQWxleGlzLAo+IAo+IHRoYW5rcyBmb3IgeW91
ciBwYXRjaC4KPiAKPiAuLi4KPiAKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL2R3bWFjNF9jb3JlLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYzRfY29yZS5jCj4+IGluZGV4IDAxYzA4MjJkMzdlNi4uYjM2ZmJiMGZh
NWRhIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
d21hYzRfY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L2R3bWFjNF9jb3JlLmMKPiAKPiAuLi4KPiAKPj4gK3N0YXRpYyB2b2lkIGR3bWFjNF9wdHBfaXNy
KHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdikKPj4gK3sKPj4gKwl1MzIgbnVtX3NuYXBzaG90LCB0
c19zdGF0dXM7Cj4+ICsJc3RydWN0IHB0cF9jbG9ja19ldmVudCBldmVudDsKPj4gKwl1bnNpZ25l
ZCBsb25nIGZsYWdzOwo+PiArCXU2NCBwdHBfdGltZTsKPj4gKwlpbnQgaTsKPiAKPiBQbGVhc2Ug
dXNlIHJldmVyc2UgeG1hcyB0cmVlIC0gbG9uZ2VzdCBsaW5lIHRvIHNob3J0ZXN0IC0gZm9yIG5l
dwo+IE5ldHdvcmtpbmcgY29kZS4KPiAKPiAJc3RydWN0IHB0cF9jbG9ja19ldmVudCBldmVudDsK
PiAJdTMyIG51bV9zbmFwc2hvdCwgdHNfc3RhdHVzOwo+IAl1bnNpZ25lZCBsb25nIGZsYWdzOwo+
IAl1NjQgcHRwX3RpbWU7Cj4gCWludCBpOwo+IApBQ0sKPiAuLi4KPiAKPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wdHAuaCBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wdHAuaAo+PiBpbmRleCA5ZTBm
ZjJjZWMzNTIuLjkyZWQ0MjE3MDJiOSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3B0cC5oCj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wdHAuaAo+PiBAQCAtMjMsOSArMjMsNiBAQAo+PiAg
I2RlZmluZQlQVFBfU1RTVVIJMHgxMAkvKiBTeXN0ZW0gVGltZSDigJMgU2Vjb25kcyBVcGRhdGUg
UmVnICovCj4+ICAjZGVmaW5lCVBUUF9TVE5TVVIJMHgxNAkvKiBTeXN0ZW0gVGltZSDigJMgTmFu
b3NlY29uZHMgVXBkYXRlIFJlZyAqLwo+PiAgI2RlZmluZQlQVFBfVEFSCQkweDE4CS8qIFRpbWVz
dGFtcCBBZGRlbmQgUmVnICovCj4+IC0jZGVmaW5lCVBUUF9BQ1IJCTB4NDAJLyogQXV4aWxpYXJ5
IENvbnRyb2wgUmVnICovCj4gCj4gVW5mb3J0dW5hdGVseSB0aGlzIHNlZW1zIHRvIGJyZWFrIHRo
ZSBidWlsZCBvZgo+IGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWlu
dGVsLmMKPiBvbiBhbiB4ODZfNjQgYWxsbG9kY29uZmlnLCBhcyBQVFBfQUNSIGlzIHVzZWQgaW4g
dGhhdCBmaWxlLgo+IAo+PiAtI2RlZmluZQlQVFBfQVROUgkweDQ4CS8qIEF1eGlsaWFyeSBUaW1l
c3RhbXAgLSBOYW5vc2Vjb25kcyBSZWcgKi8KPj4gLSNkZWZpbmUJUFRQX0FUU1IJMHg0YwkvKiBB
dXhpbGlhcnkgVGltZXN0YW1wIC0gU2Vjb25kcyBSZWcgKi8KPj4gIAo+PiAgI2RlZmluZQlQVFBf
U1ROU1VSX0FERFNVQl9TSElGVAkzMQo+PiAgI2RlZmluZQlQVFBfRElHSVRBTF9ST0xMT1ZFUl9N
T0RFCTB4M0I5QUNBMDAJLyogMTBlOS0xIG5zICovCgpPdWNoLiB0aGFua3MgZm9yIHNwb3R0aW5n
IHRoZSBpc3N1ZSBhbmQgdGhlIHByb3ZpZGluZyBidWlsZCBkZXRhaWxzLCBJJ2xsIGZpeAp0aGlz
IGFuZCB3YWl0IGEgYml0IGZvciBtb3JlIGNvbW1lbnRzIGJlZm9yZSBzZW5kaW5nIHYyCj4gCj4g
LS0KPiBwdy1ib3Q6IGNoYW5nZXMtcmVxdWVzdGVkCj4gCgotLSAKQWxleGlzIExvdGhvcsOpLCBC
b290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290
bGluLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
