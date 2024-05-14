Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E188C4D87
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 10:12:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67CA4C5E2D1;
	Tue, 14 May 2024 08:12:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE97BC5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2024 08:12:17 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44E86TOX006213;
 Tue, 14 May 2024 10:11:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=lThsbPGMcYjilyPz6OizppQDy6cRiA+jMAQjjoltJrU=; b=Fl
 m7kXu14EIS5QV8SYKupYVmoGvNh1cB1ld+zKPVmt5FzlcvYwOuaRCM6LrZjrm0LX
 W9H0Vu/8CoaIzlz29wB76g1hTsjHkJdfsCEFN/gVEttGy1su1uwUveXzljpVWICw
 RH3jiDX5kTCngHUnrpCPsbiJjqyhVXEcqPn5vTqDzOhHkq3l1JRHunwvvP9Q5oVX
 q4zMEDhUTPDoIvJuHiuD22Y+l9HxeAxT8p+SxQf5S3UnWPBBQazLT9qisy8oiw1Z
 DHe0qWq1gzrGEj48Uf9/ZeElTqmNf5sV9JM7HLjbVXeNXE2ijsqpOb1aDZR0a3fL
 qpXU672qnJ1jmV4Rmdtg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y1y8na1yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 May 2024 10:11:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CB34440044;
 Tue, 14 May 2024 10:11:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34B1D20DD7C;
 Tue, 14 May 2024 10:10:26 +0200 (CEST)
Received: from [10.48.87.204] (10.48.87.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 14 May
 2024 10:10:25 +0200
Message-ID: <b2d0dfcb-37d6-4375-a4ad-ca96a5339840@foss.st.com>
Date: Tue, 14 May 2024 10:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-crypto@vger.kernel.org>
References: <20240513220349.183568-1-marex@denx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20240513220349.183568-1-marex@denx.de>
X-Originating-IP: [10.48.87.204]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_03,2024-05-10_02,2023-05-22_02
Cc: Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] [RFC] clk: stm32mp1: Keep RNG1 clock
	always running
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

SGkgTWFyZWssCgpTdHJhbmdlIGluZGVlZC4KQSBwb3RlbnRpYWwgcmVhc29uIHRoYXQgY29tZXMg
dG8gbXkgbWluZCB3b3VsZCBiZSB0aGF0IHNvbWV0aGluZyB0cmllcyAKdG8gZ2V0IGEgcmFuZG9t
IG51bWJlciBhZnRlciB0aGUgZHJpdmVyIHN1c3BlbmRlZCBhbmQgZmFpbHMgdG8gZG8gc28uCkVs
c2UgaXQgbWlnaHQganVzdCBiZSBhIGJhZCBjbG9jayBiYWxhbmNlLgoKQ2FuIHlvdSBkZXNjcmli
ZSB0aGUgc29mdHdhcmUgZWNvc3lzdGVtIHRoYXQgeW91J3JlIHJ1bm5pbmcgcGxlYXNlPwooU0NN
SS9ubyBTQ01JKT8KCkRvIHlvdSBoYXZlIHRoZSAzIGZpeGVzIG9mIHN0bTMyX3JuZy5jIHRoYXQg
eW91J3ZlIHNlbnQgcmVjZW50bHkgaW4geW91cgpzb2Z0d2FyZSB3aGVuIHRlc3Rpbmc/CgpXaGF0
IGlmIHlvdSBhZGQgYSB0cmFjZSBpbiBhIHJhbmRvbSBnZW5lcmF0aW9uIGZ1bmN0aW9uIGluIHJh
bmRvbS5jPwoKQWZ0ZXIgdGhpcywgSSdsbCB0cnkgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZS4KClRo
YW5rcywKR2F0aWVuCgoKT24gNS8xNC8yNCAwMDowMiwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gSW4g
Y2FzZSBvZiBTVE0zMk1QMTV4Qy9GIFNvQywgaW4gY2FzZSB0aGUgUk5HMSBpcyBlbmFibGVkIGlu
IERULCB0aGUgUk5HMQo+IGNsb2NrIGFyZSBtYW5hZ2VkIGJ5IHRoZSBkcml2ZXIuIFRoZSBSTkcx
IGNsb2NrIGFyZSB0b2dnbGVkIG9mZiBvbiBlbnRyeQo+IHRvIHN1c3BlbmQgYW5kIGJhY2sgb24g
b24gcmVzdW1lLiBGb3IgcmVhc29uIHRodXMgZmFyIHVua25vd24gKGNvdWxkIHRoaXMKPiBiZSBz
b21lIGNoaXAgaXNzdWU/KSwgd2hlbiB0aGUgc3lzdGVtIGdvZXMgdGhyb3VnaCByZXBlYXRlZCBz
dXNwZW5kL3Jlc3VtZQo+IGN5Y2xlcywgdGhlIHN5c3RlbSBldmVudHVhbGx5IGhhbmdzIGFmdGVy
IGEgZmV3IHN1Y2ggY3ljbGVzLgo+IAo+IFRoaXMgY2FuIGJlIHJlcHJvZHVjZWQgd2l0aCBDT05G
SUdfUE1fREVCVUcgJ3BtX3Rlc3QnIHRoaXMgd2F5Ogo+ICIKPiBlY2hvIGNvcmUgPiAvc3lzL3Bv
d2VyL3BtX3Rlc3QKPiB3aGlsZSB0cnVlIDsgZG8KPiAgICAgIGVjaG8gbWVtID4gL3N5cy9wb3dl
ci9zdGF0ZQo+ICAgICAgc2xlZXAgMiA7Cj4gZG9uZQo+ICIKPiBUaGUgc3lzdGVtIGxvY2tzIHVw
IGFmdGVyIGFib3V0IGEgbWludXRlIGFuZCBpZiBXRFQgaXMgYWN0aXZlLCByZXNldHMuCj4gCj4g
SWYgdGhlIFJORzEgY2xvY2sgYXJlIGtlcHQgZW5hYmxlZCBhY3Jvc3Mgc3VzcGVuZC9yZXN1bWUs
IGVpdGhlciB1c2luZwo+IHRoaXMgY2hhbmdlLCBvciBieSBrZWVwaW5nIHRoZSBjbG9jayBlbmFi
bGVkIGluIFJORyBkcml2ZXIgc3VzcGVuZC9yZXN1bWUKPiBjYWxsYmFja3MsIHRoZSBzeXN0ZW0g
ZG9lcyBub3QgbG9jayB1cC4KPiAKPiBOT1RFOiBUaGlzIHBhdGNoIGlzIGEgd29ya2Fyb3VuZC4g
SXQgd291bGQgYmUgZ29vZCB0byBrbm93IHdoeSBkb2VzIHRoaXMKPiAgICAgICAgY2hhbmdlIG1h
a2UgdGhlIGhhbmcgZ28gYXdheSwgd2hldGhlciB0aGlzIGlzIGEgY2hpcCBpc3N1ZSBvciBzb21l
Cj4gICAgICAgIG90aGVyIHByb2JsZW0gPwo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0
IDxtYXJleEBkZW54LmRlPgo+IC0tLQo+IENjOiAiVXdlIEtsZWluZS1Lw7ZuaWciIDx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRy
ZS50b3JndWVAZm9zcy5zdC5jb20+Cj4gQ2M6IEdhYnJpZWwgRmVybmFuZGV6IDxnYWJyaWVsLmZl
cm5hbmRlekBmb3NzLnN0LmNvbT4KPiBDYzogR2F0aWVuIENoZXZhbGxpZXIgPGdhdGllbi5jaGV2
YWxsaWVyQGZvc3Muc3QuY29tPgo+IENjOiBIZXJiZXJ0IFh1IDxoZXJiZXJ0QGdvbmRvci5hcGFu
YS5vcmcuYXU+Cj4gQ2M6IE1heGltZSBDb3F1ZWxpbiA8bWNvcXVlbGluLnN0bTMyQGdtYWlsLmNv
bT4KPiBDYzogTWljaGFlbCBUdXJxdWV0dGUgPG10dXJxdWV0dGVAYmF5bGlicmUuY29tPgo+IENj
OiBPbGl2aWEgTWFja2FsbCA8b2xpdmlhQHNlbGVuaWMuY29tPgo+IENjOiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgo+IENjOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+Cj4g
Q2M6IFlhbmcgWWluZ2xpYW5nIDx5YW5neWluZ2xpYW5nQGh1YXdlaS5jb20+Cj4gQ2M6IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1jbGtAdmdlci5rZXJu
ZWwub3JnCj4gQ2M6IGxpbnV4LWNyeXB0b0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IC0tLQo+ICAgZHJpdmVycy9jaGFyL2h3
X3JhbmRvbS9zdG0zMi1ybmcuYyB8IDIgKysKPiAgIGRyaXZlcnMvY2xrL3N0bTMyL2Nsay1zdG0z
Mm1wMS5jICAgfCAyICstCj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3N0bTMy
LXJuZy5jIGIvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1ybmcuYwo+IGluZGV4IDdkMGRl
OGFiNWU3ZjUuLmVjMDMxNGYwNWZmM2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jaGFyL2h3X3Jh
bmRvbS9zdG0zMi1ybmcuYwo+ICsrKyBiL2RyaXZlcnMvY2hhci9od19yYW5kb20vc3RtMzItcm5n
LmMKPiBAQCAtNDAzLDYgKzQwMyw3IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3RtMzJf
cm5nX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgCj4gICAJd3JpdGVsX3JlbGF4ZWQo
cHJpdi0+cG1fY29uZi5jciwgcHJpdi0+YmFzZSArIFJOR19DUik7Cj4gICAKPiArCS8vIEtlZXBp
bmcgdGhlIGNsb2NrIGVuYWJsZWQgYWNyb3NzIHN1c3BlbmQvcmVzdW1lIGhlbHBzIHRvbwo+ICAg
CWNsa19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5jbGspOwo+ICAgCj4gICAJcmV0dXJuIDA7Cj4g
QEAgLTQzNCw2ICs0MzUsNyBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0bTMyX3JuZ19y
ZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgCWludCBlcnI7Cj4gICAJdTMyIHJlZzsKPiAg
IAo+ICsJLy8gS2VlcGluZyB0aGUgY2xvY2sgZW5hYmxlZCBhY3Jvc3Mgc3VzcGVuZC9yZXN1bWUg
aGVscHMgdG9vCj4gICAJZXJyID0gY2xrX3ByZXBhcmVfZW5hYmxlKHByaXYtPmNsayk7Cj4gICAJ
aWYgKGVycikKPiAgIAkJcmV0dXJuIGVycjsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc3Rt
MzIvY2xrLXN0bTMybXAxLmMgYi9kcml2ZXJzL2Nsay9zdG0zMi9jbGstc3RtMzJtcDEuYwo+IGlu
ZGV4IDdlMjMzNzI5NzQwMmEuLjFhNmU4NTNkOTM1ZmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9j
bGsvc3RtMzIvY2xrLXN0bTMybXAxLmMKPiArKysgYi9kcml2ZXJzL2Nsay9zdG0zMi9jbGstc3Rt
MzJtcDEuYwo+IEBAIC0yMDAwLDcgKzIwMDAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGNsb2Nr
X2NvbmZpZyBzdG0zMm1wMV9jbG9ja19jZmdbXSA9IHsKPiAgIAlLQ0xLKFNETU1DM19LLCAic2Rt
bWMzX2siLCBzZG1tYzNfc3JjLCAwLCBHX1NETU1DMywgTV9TRE1NQzMpLAo+ICAgCUtDTEsoRk1D
X0ssICJmbWNfayIsIGZtY19zcmMsIDAsIEdfRk1DLCBNX0ZNQyksCj4gICAJS0NMSyhRU1BJX0ss
ICJxc3BpX2siLCBxc3BpX3NyYywgMCwgR19RU1BJLCBNX1FTUEkpLAo+IC0JS0NMSyhSTkcxX0ss
ICJybmcxX2siLCBybmdfc3JjLCAwLCBHX1JORzEsIE1fUk5HMSksCj4gKwlLQ0xLKFJORzFfSywg
InJuZzFfayIsIHJuZ19zcmMsIENMS19JU19DUklUSUNBTCwgR19STkcxLCBNX1JORzEpLAo+ICAg
CUtDTEsoUk5HMl9LLCAicm5nMl9rIiwgcm5nX3NyYywgMCwgR19STkcyLCBNX1JORzIpLAo+ICAg
CUtDTEsoVVNCUEhZX0ssICJ1c2JwaHlfayIsIHVzYnBoeV9zcmMsIDAsIEdfVVNCUEhZLCBNX1VT
QlBIWSksCj4gICAJS0NMSyhTVEdFTl9LLCAic3RnZW5fayIsIHN0Z2VuX3NyYywgQ0xLX0lTX0NS
SVRJQ0FMLCBHX1NUR0VOLCBNX1NUR0VOKSwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
