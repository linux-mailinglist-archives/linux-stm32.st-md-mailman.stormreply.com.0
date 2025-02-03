Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD705A258F0
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 13:05:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85153C78F7C;
	Mon,  3 Feb 2025 12:05:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA183C7802B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 12:05:01 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513B5mKr027354;
 Mon, 3 Feb 2025 13:04:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 trAJpNigM/p/7CDqNVkhgXtOYUHb2njJXY7wSKnvEw8=; b=U2qqKZKUQh20Q7XV
 GYoP+i+o1iiEc6U8QGvRD0STaaCcMx36GXROeLAs0fvw2sKwlYbykZx13Vfm87dm
 /2JXHHrt7oExDJ6/Xw9kIBRvDllq+Z1Dbk9ncbX4KrM1ZhKYtNUT35I/LB7oUJXc
 pX54KOw5/dRfPyBlVtAeCvBzlXF0y82r/z5PTHdoXmIc66x0qUI/xOqaSej1V7Pq
 FzyzPtVXwCICnw8lvLRFFt1MxbiFxcQZq0XUJslTT0RfRL6RIcH6NwHr2qZx0xpf
 ITVP1K7m2rw9j0AoadaZORfS9L82W2DozDHtVlw39RnjMTXP7hEb+QFfxAjdCyj0
 Rc+oEw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44jn0fhx1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2025 13:04:50 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 378B440048;
 Mon,  3 Feb 2025 13:03:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE7BE263541;
 Mon,  3 Feb 2025 13:02:08 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Feb
 2025 13:02:08 +0100
Message-ID: <0fade761-2485-465b-9fb1-d0e4dabdb189@foss.st.com>
Date: Mon, 3 Feb 2025 13:02:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_05,2025-01-31_02,2024-11-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kernel@pengutronix.de,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH stm32-next v3 0/2] ARM: dts: stm32:
 lxa-fairytux2: add gen{1, 2} boards
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

SGkgTWFyYwoKT24gMS8yMS8yNSAxMjoxNCwgTWFyYyBLbGVpbmUtQnVkZGUgd3JvdGU6Cj4gSGVs
bG8sCj4gCj4gdGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgTGludXggQXV0b21hdGlv
biBHbWJIIEZhaXJ5VHV4Mgo+IGJvYXJkcyBnZW5lcmF0aW9uIDEgYW5kIDIuCj4gCj4gVGhlIEZh
aXJ5VHV4MiBpcyBhIHNtYWxsIExpbnV4IGRldmljZSBiYXNlZCBvbiBhbiBPY3Rhdm8gU3lzdGVt
cwo+IE9TRDMyTVAxNTNjIFNpUCwgdGhhdCBvY2N1cGllcyBqdXN0IHR3byBzbG90cyBvbiBhIERJ
TiByYWlsLgo+IAo+IHJlZ2FyZHMsCj4gTWFyYwo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmMgS2xl
aW5lLUJ1ZGRlIDxta2xAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MzoKPiAt
IDIvMjogZml4IHVzZSBnZW5lcmljIG5vZGUgbmFtZXMgZm9yIGV4dGVybmFsIEdQSU8gYW5kIFVT
QiBUeXBlLUMgY29udHJvbGxlciAodGhhbmtzIEtyenlzenRvZikKPiAtIDIvMjogTEVEczogcmVw
bGFjZSBsYWJlbCBieSBjb2xvciBhbmQgZnVuY3Rpb24gcHJvcGVydHkgKHRoYW5rcyBLcnp5c3p0
b2YpCj4gLSAyLzI6IGdlbjI6IHNvcnQgbm9kZXMgb2YgaTJjMSBieSBhZGRyZXNzICh0aGFua3Mg
S3J6eXN6dG9mKQo+IC0gTGluayB0byB2MjogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjUw
MTIwLWx4YS1mYWlyeXR1eC12Mi0wLTk1ZjRhMGVhYTQ0ZEBwZW5ndXRyb25peC5kZQo+IAo+IENo
YW5nZXMgaW4gdjI6Cj4gLSAxLzI6IEFkZGVkIEtyenlzenRvZidzIEFja2VkLWJ5Cj4gLSAyLzI6
IGZpeCBhbGlnbm1lbnQgZm9yIGdwaW8tbGluZS1uYW1lcyAodGhhbmtzIEtyenlzenRvZikKPiAt
IDIvMjogb25seSB1c2UgY29sb3I6ZnVuY3Rpb24gZm9yIExFRCBsYWJlbHMgKHRoYW5rcyBLcnp5
c3p0b2YpCj4gLSAyLzI6IHVzZSBnZW5lcmljIG5vZGUgbmFtZXMgZm9yIGV4dGVybmFsIEdQSU8g
YW5kIFVTQiBUeXBlLUMgY29udHJvbGxlcgo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaC5t
c2dpZC5saW5rLzIwMjQxMjEwLWx4YS1mYWlyeXR1eC12MS0wLTlhZWEwMWNkYjgzZUBwZW5ndXRy
b25peC5kZQo+IAo+IC0tLQo+IExlb25hcmQgR8O2aHJzICgyKToKPiAgICAgICAgZHQtYmluZGlu
Z3M6IGFybTogc3RtMzI6IGFkZCBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIExpbnV4IEF1dG9tYXRp
b24gR21iSCBMWEEgRmFpcnlUdXggMgo+ICAgICAgICBBUk06IGR0czogc3RtMzI6IGx4YS1mYWly
eXR1eDI6IGFkZCBMaW51eCBBdXRvbWF0aW9uIEdtYkggRmFpcnlUdXggMgo+IAo+ICAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwgICAgICAgfCAgIDIgKwo+ICAg
YXJjaC9hcm0vYm9vdC9kdHMvc3QvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgfCAgIDIg
Kwo+ICAgLi4uL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTNjLWx4YS1mYWlyeXR1eDItZ2VuMS5kdHMg
fCAxMDMgKysrKysrCj4gICAuLi4vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1M2MtbHhhLWZhaXJ5dHV4
Mi1nZW4yLmR0cyB8IDE0NyArKysrKysrKwo+ICAgLi4uL2FybS9ib290L2R0cy9zdC9zdG0zMm1w
MTUzYy1seGEtZmFpcnl0dXgyLmR0c2kgfCAzOTcgKysrKysrKysrKysrKysrKysrKysrCj4gICA1
IGZpbGVzIGNoYW5nZWQsIDY1MSBpbnNlcnRpb25zKCspCj4gLS0tCj4gYmFzZS1jb21taXQ6IGI3
ZWJmYjg0YTA5ZGU2YjQ0NDkyOTc0MzM5NjU0ZDhmZmM1YWQ5ZTEKPiBjaGFuZ2UtaWQ6IDIwMjQx
MjEwLWx4YS1mYWlyeXR1eC1lNzMwOTc5ZDNkM2YKPiAKPiBCZXN0IHJlZ2FyZHMsCgpTZXJpZXMg
YXBwbGllZCBvbiBzdG0zMi1uZXh0LgoKVGhhbmtzCkFsZXgKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
