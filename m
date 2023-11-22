Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE6B7F4782
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Nov 2023 14:17:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98A8CC6B475;
	Wed, 22 Nov 2023 13:17:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C08FC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Nov 2023 13:17:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AM8fMaL011963; Wed, 22 Nov 2023 14:17:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=fZ6GXyH9BtvRyRHrxIXBbPXxpTXF//vxZ1bNd11Jjrs=; b=VR
 DaNnfkAFtenUrC8uAdgX4V/yDHed02d35k9J9nvlWXtUMRCBV/n6L60JHyraUMON
 tYpLdcEIJX9UOpq4ynMa5UY503pdfMbWul9LR4qB6L37zk63J7VpbJOonvJnoodw
 iNAf9NV3GGx8ph3sRPcwoz5tuuohZtLu50AVl5Jwvm4JgPmF8Nz5jrZgnbTg1qtp
 CenAoS78jW8iBYXHp7mTajKwr2uOmeLCzPFbkeynI70lI4w6imuAqjAextMYG+Vp
 x4mzA0CUwlTpn5OLBwFVwaroqOfq/WSPTQ4VPWz3OG+K13wVblH7iIazvolRCizd
 G7CD1HXa2UYVOSkAsfAQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uen1pdd8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Nov 2023 14:17:29 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F52810003E;
 Wed, 22 Nov 2023 14:17:28 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8AD57229A85;
 Wed, 22 Nov 2023 14:17:28 +0100 (CET)
Received: from [10.201.21.240] (10.201.21.240) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 22 Nov
 2023 14:17:27 +0100
Message-ID: <0750a835-65d9-4de3-be73-3e40554d4fa2@foss.st.com>
Date: Wed, 22 Nov 2023 14:17:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20231116154952.1206705-1-gabriel.fernandez@foss.st.com>
 <20231116154952.1206705-4-gabriel.fernandez@foss.st.com>
 <20231119152354.GA216405-robh@kernel.org>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20231119152354.GA216405-robh@kernel.org>
X-Originating-IP: [10.201.21.240]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_09,2023-11-22_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 3/5] dt-bindings: stm32: add clocks and
 reset binding for stm32mp25 platform
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

SGkgUm9iLCB0aGFua3MgZm9yIHlvdXIgcmV2aWV3CgoKT24gMTEvMTkvMjMgMTY6MjMsIFJvYiBI
ZXJyaW5nIHdyb3RlOgo+IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDA0OjQ5OjUwUE0gKzAxMDAs
IGdhYnJpZWwuZmVybmFuZGV6QGZvc3Muc3QuY29tIHdyb3RlOgo+PiBGcm9tOiBHYWJyaWVsIEZl
cm5hbmRleiA8Z2FicmllbC5mZXJuYW5kZXpAZm9zcy5zdC5jb20+Cj4+Cj4+IEFkZHMgY2xvY2sg
YW5kIHJlc2V0IGJpbmRpbmcgZW50cmllcyBmb3IgU1RNMzJNUDI1IFNvQyBmYW1pbHkKPj4KPj4g
U2lnbmVkLW9mZi1ieTogR2FicmllbCBGZXJuYW5kZXogPGdhYnJpZWwuZmVybmFuZGV6QGZvc3Mu
c3QuY29tPgo+PiAtLS0KPj4gICAuLi4vYmluZGluZ3MvY2xvY2svc3Qsc3RtMzJtcDI1LXJjYy55
YW1sICAgICAgfCAgNzIgKysrCj4+ICAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdCxzdG0z
Mm1wMjUtcmNjLmggIHwgNDkyICsrKysrKysrKysrKysrKysrKwo+PiAgIGluY2x1ZGUvZHQtYmlu
ZGluZ3MvcmVzZXQvc3Qsc3RtMzJtcDI1LXJjYy5oICB8IDE2NSArKysrKysKPj4gICAzIGZpbGVz
IGNoYW5nZWQsIDcyOSBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMjUtcmNjLnlhbWwK
Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdCxzdG0z
Mm1wMjUtcmNjLmgKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9y
ZXNldC9zdCxzdG0zMm1wMjUtcmNjLmgKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMjUtcmNjLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc3Qsc3RtMzJtcDI1LXJjYy55YW1sCj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMWJkY2ZhY2Q2MmQ1
Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Nsb2NrL3N0LHN0bTMybXAyNS1yY2MueWFtbAo+PiBAQCAtMCwwICsxLDcyIEBACj4+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkK
Pj4gKyVZQU1MIDEuMgo+PiArLS0tCj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL2Nsb2NrL3N0LHN0bTMybXAyNS1yY2MueWFtbCMKPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+PiArCj4+ICt0aXRsZTogU1RNMzJN
UDI1IFJlc2V0IENsb2NrIENvbnRyb2xsZXIKPj4gKwo+PiArbWFpbnRhaW5lcnM6Cj4+ICsgIC0g
R2FicmllbCBGZXJuYW5kZXogPGdhYnJpZWwuZmVybmFuZGV6QGZvc3Muc3QuY29tPgo+PiArCj4+
ICtkZXNjcmlwdGlvbjogfAo+PiArICBUaGUgUkNDIGhhcmR3YXJlIGJsb2NrIGlzIGJvdGggYSBy
ZXNldCBhbmQgYSBjbG9jayBjb250cm9sbGVyLgo+PiArICBSQ0MgbWFrZXMgYWxzbyBwb3dlciBt
YW5hZ2VtZW50IChyZXN1bWUvc3VwZW5kKS4KPj4gKwo+PiArICBTZWUgYWxzbzo6Cj4+ICsgICAg
aW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zdCxzdG0zMm1wMjUtcmNjLmgKPj4gKyAgICBpbmNs
dWRlL2R0LWJpbmRpbmdzL3Jlc2V0L3N0LHN0bTMybXAyNS1yY2MuaAo+PiArCj4+ICtwcm9wZXJ0
aWVzOgo+PiArICBjb21wYXRpYmxlOgo+PiArICAgIGVudW06Cj4+ICsgICAgICAtIHN0LHN0bTMy
bXAyNS1yY2MKPj4gKwo+PiArICByZWc6Cj4+ICsgICAgbWF4SXRlbXM6IDEKPj4gKwo+PiArICAn
I2Nsb2NrLWNlbGxzJzoKPj4gKyAgICBjb25zdDogMQo+PiArCj4+ICsgICcjcmVzZXQtY2VsbHMn
Ogo+PiArICAgIGNvbnN0OiAxCj4+ICsKPj4gKyAgY2xvY2tzOgo+PiArICAgIGRlc2NyaXB0aW9u
OiBTcGVjaWZpZXMgb3NjaWxsYXRvcnMuCj4+ICsgICAgbWF4SXRlbXM6IDUKPj4gKwo+PiArICBj
bG9jay1uYW1lczoKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0gY29uc3Q6IGhzZQo+PiArICAg
ICAgLSBjb25zdDogaHNpCj4+ICsgICAgICAtIGNvbnN0OiBtc2kKPj4gKyAgICAgIC0gY29uc3Q6
IGxzZQo+PiArICAgICAgLSBjb25zdDogbHNpCj4gTm8gaWRlYSB3aGF0IHRoZXNlIFRMQXMgYXJl
Li4uIERlZmluZSB0aGVtIGluIGNsb2NrczoKPgo+IGNsb2NrczoKPiAgICBpdGVtczoKPiAgICAg
IC0gZGVzY3JpcHRpb246IHdoYXQgaHNlIGlzCj4gICAgICAtIC4uLgo+Cm9rwqAgaSB3aWxsIHNl
bmQgYSB2MwoKCkJlc3QgUmVnYXJkcwoKR2FicmllbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
