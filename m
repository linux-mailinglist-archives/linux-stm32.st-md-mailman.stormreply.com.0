Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A08B0EDC8
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 10:57:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 983B9C36B36;
	Wed, 23 Jul 2025 08:57:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D8C0C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 08:57:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N8uM65028510;
 Wed, 23 Jul 2025 10:56:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 phZtJJljKEJOK6MlgZrPZlmrH/bqjB9NJkz8RgXJGMQ=; b=b3dTttzLcyGu3faH
 8GZs7OjxwijhA4DA3LtAQaSGpnn4V4apeeWcMp9oPqhcdBD0esOHs3d5NQdnvChE
 Xt5I/sfbV7Cjm2x8iTd6rrGfGpbXqkJne3dZdJocYLmZic5eh5nlrQKjL+rtvsWH
 b3HIbW/UcIrElRkku/YmkCuu1DEx3Dr8BjLZ+16790OsH9ccM73I5Nm6FP/Xo0hh
 q3e0kNj88tnViO0DzcuMlWauZUYY7KTZdiAEcUtqc7+uZvcR5T0Qp0OPTQ4nyY7+
 8Vu5OcxGOp+c8/dFtrDBWaZ8dQDC6meg0yzFA+W0qQGkn2UK7YJunWCPVeIjCBgX
 X0P60Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48028gae19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jul 2025 10:56:48 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 930794005B;
 Wed, 23 Jul 2025 10:55:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 249447530A7;
 Wed, 23 Jul 2025 10:53:57 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 10:53:56 +0200
Message-ID: <9c9499e3-10c9-4245-938a-65831fe10c05@foss.st.com>
Date: Wed, 23 Jul 2025 10:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
 <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
 <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
 <5a2e0cd8-6d20-4f5a-a3a0-9010305509e3@foss.st.com>
Content-Language: en-US
In-Reply-To: <5a2e0cd8-6d20-4f5a-a3a0-9010305509e3@foss.st.com>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tristram Ha <Tristram.Ha@microchip.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/4] dt-bindings: net: document
 st, phy-wol property
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

CgpPbiA3LzIzLzI1IDEwOjUwLCBHYXRpZW4gQ0hFVkFMTElFUiB3cm90ZToKPiAKPiAKPiBPbiA3
LzIyLzI1IDIyOjIwLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgd3JvdGU6Cj4+IE9uIFR1ZSwgSnVs
IDIyLCAyMDI1IGF0IDAzOjQwOjE2UE0gKzAyMDAsIEFuZHJldyBMdW5uIHdyb3RlOgo+Pj4gSSBr
bm93IFJ1c3NlbGwgaGFzIGFsc28gcmVwbGllZCBhYm91dCBpc3N1ZXMgd2l0aCBzdG1tYWMuIFBs
ZWFzZQo+Pj4gY29uc2lkZXIgdGhhdCB3aGVuIHJlYWRpbmcgd2hhdCBpIHNheS4uLiBJdCBtaWdo
dCBiZSBub3QgYXBwbGljYWJsZS4KPj4+Cj4+Pj4gU2VlbXMgbGlrZSBhIGZhaXIgYW5kIGxvZ2lj
YWwgYXBwcm9hY2guIEl0IHNlZW1zIHJlYXNvbmFibGUgdGhhdCB0aGUKPj4+PiBNQUMgZHJpdmVy
IHJlbGllcyBvbiB0aGUgZ2V0X3dvbCgpIEFQSSB0byBrbm93IHdoYXQncyBzdXBwb3J0ZWQuCj4+
Pj4KPj4+PiBUaGUgdHJpY2t5IHRoaW5nIGZvciB0aGUgUEhZIHVzZWQgaW4gdGhpcyBwYXRjaHNl
dCBpcyB0byBnZXQgdGhpcwo+Pj4+IGluZm9ybWF0aW9uOgo+Pj4+Cj4+Pj4gRXh0cmFjdCBmcm9t
IHRoZSBkb2N1bWVudGF0aW9uIG9mIHRoZSBMQU44NzQyQSBQSFk6Cj4+Pj4gIlRoZSBXb0wgZGV0
ZWN0aW9uIGNhbiBiZSBjb25maWd1cmVkIHRvIGFzc2VydCB0aGUgbklOVCBpbnRlcnJ1cHQgcGlu
Cj4+Pj4gb3IgblBNRSBwaW4iCj4+Pgo+Pj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3dha2V1cC1zb3VyY2UudHh0Cj4+
Pgo+Pj4gSXQgaXMgYSBiaXQgbWVzc3ksIGJ1dCBpbiB0aGUgZGV2aWNlIHRyZWUsIHlvdSBjb3Vs
ZCBoYXZlOgo+Pj4KPj4+IMKgwqDCoMKgIGludGVycnVwdHMgPSA8JnNpcnEgMCBJUlFfVFlQRV9M
RVZFTF9MT1c+Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmcG1pYyA0
MiBJUlFfVFlQRV9MRVZFTF9MT1c+Owo+Pj4gwqDCoMKgwqAgaW50ZXJydXB0LW5hbWVzID0gIm5J
TlQiLCAid2FrZSI7Cj4+PiDCoMKgwqDCoCB3YWtldXAtc291cmNlCj4+Pgo+Pj4gWW91IGNvdWxk
IGFsc28gaGF2ZToKPj4+Cj4+PiDCoMKgwqDCoCBpbnRlcnJ1cHRzID0gPCZzaXJxIDAgSVJRX1RZ
UEVfTEVWRUxfTE9XPjsKPj4+IMKgwqDCoMKgIGludGVycnVwdC1uYW1lcyA9ICJ3YWtlIjsKPj4+
IMKgwqDCoMKgIHdha2V1cC1zb3VyY2UKPj4+Cj4+PiBJbiB0aGUgZmlyc3QgZXhhbXBsZSwgc2lu
Y2UgdGhlcmUgYXJlIHR3byBpbnRlcnJ1cHRzIGxpc3RlZCwgaXQgbXVzdAo+Pj4gYmUgdXNpbmcg
dGhlIG5QTUUuIEZvciB0aGUgc2Vjb25kLCBzaW5jZSB0aGVyZSBpcyBvbmx5IG9uZSwgaXQgbXVz
dCBiZQo+Pj4gdXNpbmcgbklOVC4KPj4+Cj4+PiBXaGVyZSB0aGlzIGRvZXMgbm90IHdvcmsgc28g
d2VsbCBpcyB3aGVuIHlvdSBoYXZlIGEgYm9hcmQgd2hpY2ggZG9lcwo+Pj4gbm90IGhhdmUgbklO
VCB3aXJlZCwgYnV0IGRvZXMgaGF2ZSBuUE1FLiBUaGUgcGh5bGliIGNvcmUgd2lsbCBzZWUKPj4+
IHRoZXJlIGlzIGFuIGludGVycnVwdCBhbmQgcmVxdWVzdCBpdCwgYW5kIGRpc2FibGUgcG9sbGlu
Zy4gQW5kIHRoZW4KPj4+IG5vdGhpbmcgd2lsbCB3b3JrLiBXZSBtaWdodCBiZSBhYmxlIHRvIGRl
bGF5IHNvbHZpbmcgdGhhdCB1bnRpbCBzdWNoIGEKPj4+IGJvYXJkIGFjdHVhbGx5IGV4aXN0cz8K
Pj4KPj4gKE9mZmljaWFsbHksIEknbSBzdGlsbCBvbiB2YWNhdGlvbi4uLikKPj4KPj4gQXQgdGhp
cyBwb2ludCwgSSdkIGxpa2UgdG8ga2ljayBvZmYgYSBkaXNjdXNzaW9uIGFib3V0IFBIWS1iYXNl
ZAo+PiB3YWtldXAgdGhhdCBpcyByZWxldmFudCB0byB0aGlzIHRocmVhZC4KPj4KPj4gVGhlIGtl
cm5lbCBoYXMgZGV2aWNlLWJhc2VkIHdha2V1cCBzdXBwb3J0LiBXZSBoYXZlOgo+Pgo+PiAtIGRl
dmljZV9zZXRfd2FrZXVwX2NhcGFibGUoZGV2LCBmbGFnKSAtIGluZGljYXRlcyB0aGF0IHRoZSBp
cwo+PiDCoMKgIGNhcGFibGUgb2Ygd2FraW5nIHRoZSBzeXN0ZW0gZGVwZW5kaW5nIG9uIHRoZSBm
bGFnLgo+Pgo+PiAtIGRldmljZV9zZXRfd2FrZXVwX2VuYWJsZShkZXYsIGZsYWcpIC0gaW5kaWNh
dGVzIHdoZXRoZXIgImRldiIKPj4gwqDCoCBoYXMgaGFkIHdha2UtdXAgZW5hYmxlZCBvciBkaXNh
YmxlZCBkZXBlbmRpbmcgb24gdGhlIGZsYWcuCj4+Cj4+IC0gZGV2Kl9wbV9zZXRfd2FrZV9pcnEo
ZGV2LCBpcnEpIC0gaW5kaWNhdGVzIHRvIHRoZSB3YWtlIGNvcmUgdGhhdAo+PiDCoMKgIHRoZSBp
bmRpY2F0ZWQgSVJRIGlzIGNhcGFibGUgb2Ygd2FraW5nIHRoZSBzeXN0ZW0sIGFuZCB0aGUgY29y
ZQo+PiDCoMKgIHdpbGwgaGFuZGxlIGVuYWJsaW5nL2Rpc2FibGluZyBpcnEgd2FrZSBjYXBhYmls
aXRpZXMgb24gdGhlIElSUQo+PiDCoMKgIGFzIGFwcHJvcHJpYXRlIChkZXBlbmRlbnQgb24gZGV2
aWNlX3NldF93YWtldXBfZW5hYmxlKCkpLiBPdGhlcgo+PiDCoMKgIGZ1bmN0aW9ucyBhcmUgYXZh
aWxhYmxlIGZvciB3YWtldXAgSVJRcyB0aGF0IGFyZSBkZWRpY2F0ZWQgdG8KPj4gwqDCoCBvbmx5
IHdha2luZyB1cCB0aGUgc3lzdGVtIChlLmcuIHRoZSBXT0xfSU5UIHBpbiBvbiBBUjgwMzEpLgo+
Pgo+PiBJc3N1ZSAxLiBJbiBzdG1tYWNfaW5pdF9waHkoKSwgd2UgaGF2ZSB0aGlzIGNvZGU6Cj4+
Cj4+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFwcml2LT5wbGF0LT5wbXQpIHsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGV0aHRvb2xfd29saW5mbyB3b2wgPSB7IC5j
bWQgPSBFVEhUT09MX0dXT0wgfTsKPj4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcGh5bGlua19ldGh0b29sX2dldF93b2wocHJpdi0+cGh5bGluaywgJndvbCk7Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldmljZV9zZXRfd2FrZXVwX2NhcGFibGUocHJp
di0+ZGV2aWNlLCAKPj4gISF3b2wuc3VwcG9ydGVkKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZGV2aWNlX3NldF93YWtldXBfZW5hYmxlKHByaXYtPmRldmljZSwgISF3b2wu
d29sb3B0cyk7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgfQo+Pgo+PiBUaGlzIHJlYWRzIHRoZSBXb0wg
c3RhdGUgZnJvbSB0aGUgUEhZIChhIGRpZmZlcmVudCBzdHJ1Y3QgZGV2aWNlKQo+PiBhbmQgc2V0
cyB0aGUgd2FrZXVwIGNhcGFiaWxpdHkgYW5kIGVuYWJsZSBzdGF0ZSBmb3IgdGhlIF9zdG1tYWNf
Cj4+IGRldmljZSBhY2NvcmRpbmdseSwgYnV0IGluIHRoZSBjYXNlIG9mIFBIWSBiYXNlZCBXb0ws
IGl0J3MgdGhlIFBIWQo+PiBkb2luZyB0aGUgd2FrZXVwLCBub3QgdGhlIE1BQy4gU28gdGhpcyBz
ZWVtcyB3cm9uZyBvbiB0aGUgZmFjZSBvZgo+PiBpdC4KPiAKPiAyIGNlbnRzOiBNYXliZSBldmVu
IHJlbW92ZSBpbiBzdG1tYWNfc2V0X3dvbCgpIGlmICFwcml2LT5wbGF0LT5wbXQuCj4gCgpTb3Jy
eSwgdGhhdCdzIG5vdCB2ZXJ5IGNsZWFyLiBJIHdhcyB0aGlua2luZyBvZiByZW1vdmluZzoKZGV2
aWNlX3NldF93YWtldXBfZW5hYmxlKHByaXYtPmRldmljZSwgISF3b2wtPndvbG9wdHMpOyBpbgpz
dG1tYWNfc2V0X3dvbCgpCgo+Pgo+PiBJc3N1ZSAyLiBubyBkcml2ZXIgaW4gcGh5bGliLCBub3Ig
dGhlIGNvcmUsIGV2ZXIgdXNlcyBhbnkgb2YgdGhlCj4+IGRldmljZV9zZXRfd2FrZXVwXyooKSBm
dW5jdGlvbnMuIEFzIFBIWXMgb24gdGhlaXIgb3duIGFyZSBjYXBhYmxlCj4+IG9mIFdvTCwgaXNu
J3QgdGhpcyBhbiBvdmVyc2lnaHQ/IFNob3VsZG4ndCBwaHlsaWIgYmUgc3VwcG9ydGluZwo+PiB0
aGlzIHJhdGhlciB0aGFuIGxlYXZpbmcgaXQgdG8gTUFDIGRyaXZlcnMgdG8gZmlndXJlIHNvbWV0
aGluZyBvdXQ/Cj4+Cj4+IElzc3VlIDMuIHNob3VsZCBwaW5zIGxpa2UgV09MX0lOVCBvciBuUE1F
IGJlIHJlcHJlc2VudGVkIGFzIGFuCj4+IGludGVycnVwdCwgYW5kIGRldl9wbV9zZXRfZGVkaWNh
dGVkX3dha2VfaXJxKCkgdXNlZCB0byBtYW5hZ2UgdGhhdAo+PiBpbnRlcnJ1cHQgc2lnbmFsIGlm
IGxpc3RlZCBhcyBhbiBJUlEgaW4gdGhlIFBIWSdzIERUIGRlc2NyaXB0aW9uPwo+Pgo+PiAoU2lk
ZSBub3RlOiBJIGhhdmUgdHJpZWQgV29MIG9uIHRoZSBKZXRzb24gWGF2aWVyIE5YIGJvYXJkIEkg
aGF2ZQo+PiB3aGljaCB1c2VzIHN0bW1hYy1iYXNlZCBXb0wsIGJ1dCBpdCBzZWVtcyBub24tZnVu
Y3Rpb25hbC4gSSd2ZQo+PiBkcm9wcGVkIGEgcHJpdmF0ZSBlbWFpbCB0byBKb24gYW5kIFRoaWVy
cnkgdG8gc2VlIHdoZXRoZXIgdGhpcyBpcwo+PiBleHBlY3RlZCBvciBzb21ldGhpbmcgdGhhdCBu
ZWVkcyBmaXhpbmcuIEknbSBpbnRlbmRpbmcgdG8gY29udmVydAo+PiBzdG1tYWMgdG8gdXNlIGNv
cmUgd2FrZWlycSBzdXBwb3J0LCByYXRoZXIgdGhhbiBtYW5hZ2luZwo+PiB0aGUgZW5hYmxlX2ly
cV93YWtlKCkvZGlzYWJsZV9pcnFfd2FrZSgpIGJ5IGl0c2VsZi4pCj4+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
