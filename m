Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF4A77765A
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 12:57:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1964C6B469;
	Thu, 10 Aug 2023 10:57:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C7C5C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 10:57:23 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37A7foE3008014; Thu, 10 Aug 2023 12:57:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=Yhm0/CwbeZ+3TGRcWoO3L2e1JDXPY/xgDeY05lQwYYY=; b=sJ
 8cYy8ConmwDBQCvljl1mS7dc31mGcXcYy8q/k2OOtT8GLuj7ZktCyRULYWxENMgP
 T2sj5OrgtaCSaf9BRAZETuNRefGLOAyzPC+p+S1dDp++KorVHyAEt52h3OHCYTR5
 bQ+PZ0P+2D38jjTSmtZdtIerum2JdSLdzzl2iTut+2AhLQc7hTDeosRIb8pUh+Mh
 tr/v7L6NamCk2+Dg5KuASIzn6nrTvaZaco40P++Gsapbrwg3m7KGrZUJrhKbq36p
 DUtLv8glsfTFcR8Gmln7+3l2B8VkvgXrihK/bnnvvS0cZPyyQAnP8Se0xp21RM34
 0uXgbJ02M2wPQn04ddVg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3scdv7nhgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Aug 2023 12:57:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DB39100053;
 Thu, 10 Aug 2023 12:56:59 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6671821683F;
 Thu, 10 Aug 2023 12:56:59 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 10 Aug
 2023 12:56:58 +0200
Message-ID: <969ebe6f-997b-7cb9-2bae-025f73a8a61e@foss.st.com>
Date: Thu, 10 Aug 2023 12:56:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20230805093203.3988194-1-dario.binacchi@amarulasolutions.com>
 <20230805093203.3988194-4-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20230805093203.3988194-4-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_10,2023-08-10_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v7 3/3] ARM: dts: stm32: support
 display on stm32f746-disco board
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

SGkgRGFyaW8KClNvcnJ5IGZvciBteSBsYXRlIGFuc3dlci4KCk9uIDgvNS8yMyAxMTozMiwgRGFy
aW8gQmluYWNjaGkgd3JvdGU6Cj4gQWRkIHN1cHBvcnQgdG8gUm9ja3RlY2ggUkswNDNGTjQ4SCBk
aXNwbGF5IG9uIHN0bTMyZjc0Ni1kaXNjbyBib2FyZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJp
byBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gUmV2aWV3
ZWQtYnk6IFJhcGhhw6tsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3Qu
Y29tPgo+IAo+IC0tLQo+IAo+IENoYW5nZXMgaW4gdjc6Cj4gLSBBZGQgJ1Jldmlld2VkLWJ5JyB0
YWcgSSBmb3Jnb3QgaW4gdjYuCj4gICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJt
LWtlcm5lbC8yMDIzMDYyOTA4MzcyNi44NDkxMC0xLWRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1
dGlvbnMuY29tL1QvCj4gCj4gQ2hhbmdlcyBpbiB2NjoKPiAtIFJlbW92ZSBkbWEgbm9kZXMgZnJv
bSBzdG0zMmY3NDYtZGlzY28uZHRzLCB0aGV5IGFyZSBub3QgdXNlZCBieSBMVERDLAo+ICAgIHNv
IHRoZXJlIGlzIG5vIG5lZWQgdG8gZW5hYmxlIHRoZW0uCj4gCj4gQ2hhbmdlcyBpbiB2NToKPiBJ
IGFtIGNvbmZpZGVudCB0aGF0IGZyYW1lYnVmZmVyIHNpemluZyBpcyBhIHJlYWwgcmVxdWlyZW1l
bnQgZm9yIFNUTTMyIGJvYXJkcywKPiBidXQgSSBuZWVkIHNvbWUgdGltZSB0byB1bmRlcnN0YW5k
IGlmIGFuZCBob3cgdG8gaW50cm9kdWNlIHRoaXMgZnVuY3Rpb25hbGl0eS4KPiBUaGVyZWZvcmUs
IEkgZHJvcCB0aGUgZm9sbG93aW5nIHBhdGNoZXMgdG8gYWxsb3cgdGhlIHNlcmllcyB0byBiZSBm
dWxseSBtZXJnZWQ6Cj4gICAtIFs0LzZdIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBzdG0zMi1sdGRj
OiBhZGQgb3B0aW9uYWwgc3QsZmItYnBwIHByb3BlcnR5Cj4gICAtIFs1LzZdIEFSTTogZHRzOiBz
dG0zMjogc2V0IGZyYW1lYnVmZmVyIGJpdCBkZXB0aCBvbiBzdG0zMmY3NDYtZGlzY28KPiAgIC0g
WzYvNl0gZHJtL3N0bTogc2V0IGZyYW1lYnVmZmVyIGJpdCBkZXB0aCB0aHJvdWdoIERUUyBwcm9w
ZXJ0eQo+IAo+IENoYW5nZXMgaW4gdjQ6Cj4gLSBVc2UgRFRTIHByb3BlcnR5IGluc3RlYWQgb2Yg
bW9kdWxlIHBhcmFtZXRlciB0byBzZXQgdGhlIGZyYW1lYnVmZmVyIGJpdCBkZXB0aC4KPiAKPiBD
aGFuZ2VzIGluIHYzOgo+IC0gZHJvcCBbNC82XSBkdC1iaW5kaW5nczogZGlzcGxheTogc2ltcGxl
OiBhZGQgUm9ja3RlY2ggUkswNDNGTjQ4SAo+ICAgIEFwcGxpZWQgdG8gaHR0cHM6Ly9hbm9uZ2l0
LmZyZWVkZXNrdG9wLm9yZy9naXQvZHJtL2RybS1taXNjLmdpdCAoZHJtLW1pc2MtbmV4dCk6Cj4g
ICAgaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MvY29tbWl0Lz9pZD1j
NDJhMzdhMjdjNzc3ZDYzOTYxZGQ2MzRhMzBmN2M4ODc5NDk0OTFhCj4gLSBkcm9wIFs1LzZdIGRy
bS9wYW5lbDogc2ltcGxlOiBhZGQgc3VwcG9ydCBmb3IgUm9ja3RlY2ggUkswNDNGTjQ4SCBwYW5l
bAo+ICAgIEFwcGxpZWQgdG8gaHR0cHM6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9naXQvZHJt
L2RybS1taXNjLmdpdCAoZHJtLW1pc2MtbmV4dCkKPiAgICBodHRwczovL2NnaXQuZnJlZWRlc2t0
b3Aub3JnL2RybS9kcm0tbWlzYy9jb21taXQvP2lkPTEzY2RkMTJhOWY5MzQxNThmNGVjODE3Y2Yw
NDhmY2I0Mzg0YWE5ZGMKPiAKPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc0Ni1kaXNj
by5kdHMgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA0
MyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0
bTMyZjc0Ni1kaXNjby5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY3NDYtZGlzY28u
ZHRzCj4gaW5kZXggYzExNjE2ZWQ1ZmM2Li5jMDBkMzQxNzllMmUgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJmNzQ2LWRpc2NvLmR0cwo+ICsrKyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0L3N0bTMyZjc0Ni1kaXNjby5kdHMKPiBAQCAtNjAsMTAgKzYwLDQxIEBAIG1lbW9y
eUBjMDAwMDAwMCB7Cj4gICAJCXJlZyA9IDwweEMwMDAwMDAwIDB4ODAwMDAwPjsKPiAgIAl9Owo+
ICAgCj4gKwlyZXNlcnZlZC1tZW1vcnkgewo+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsJ
CSNzaXplLWNlbGxzID0gPDE+Owo+ICsJCXJhbmdlczsKPiArCj4gKwkJbGludXgsY21hIHsKPiAr
CQkJY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwo+ICsJCQluby1tYXA7Cj4gKwkJCXNp
emUgPSA8MHg4MDAwMD47Cj4gKwkJCWxpbnV4LGRtYS1kZWZhdWx0Owo+ICsJCX07Cj4gKwl9Owo+
ICsKPiAgIAlhbGlhc2VzIHsKPiAgIAkJc2VyaWFsMCA9ICZ1c2FydDE7Cj4gICAJfTsKPiAgIAo+
ICsJYmFja2xpZ2h0OiBiYWNrbGlnaHQgewo+ICsJCWNvbXBhdGlibGUgPSAiZ3Bpby1iYWNrbGln
aHQiOwo+ICsJCWdwaW9zID0gPCZncGlvayAzIEdQSU9fQUNUSVZFX0hJR0g+Owo+ICsJCXN0YXR1
cyA9ICJva2F5IjsKPiArCX07Cj4gKwo+ICsJcGFuZWxfcmdiOiBwYW5lbC1yZ2Igewo+ICsJCWNv
bXBhdGlibGUgPSAicm9ja3RlY2gscmswNDNmbjQ4aCI7Cj4gKwkJYmFja2xpZ2h0ID0gPCZiYWNr
bGlnaHQ+Owo+ICsJCWVuYWJsZS1ncGlvcyA9IDwmZ3Bpb2kgMTIgR1BJT19BQ1RJVkVfSElHSD47
Cj4gKwkJc3RhdHVzID0gIm9rYXkiOwo+ICsJCXBvcnQgewo+ICsJCQlwYW5lbF9pbl9yZ2I6IGVu
ZHBvaW50IHsKPiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbHRkY19vdXRfcmdiPjsKPiArCQkJ
fTsKPiArCQl9Owo+ICsJfTsKPiArCgpJIGdvdCB0aGlzIGJpbmRpbmdzIGlzc3VlOgouLi9hcmNo
L2FybS9ib290L2R0cy9zdC9zdG0zMmY3NDYtZGlzY28uZHRiOiBwYW5lbC1yZ2I6ICdwb3dlci1z
dXBwbHknIAppcyBhIHJlcXVpcmVkIHByb3BlcnR5Cglmcm9tIHNjaGVtYSAkaWQ6IApodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3BhbmVsL3BhbmVsLXNpbXBsZS55YW1sIwoK
RG8gSSBtaXNzIGEgZHQtYmluZGluZ3MgcGF0Y2ggPwoKcmVnYXJkcwpBbGV4CgoKPiAgIAl1c2Jv
dGdfaHNfcGh5OiB1c2ItcGh5IHsKPiAgIAkJI3BoeS1jZWxscyA9IDwwPjsKPiAgIAkJY29tcGF0
aWJsZSA9ICJ1c2Itbm9wLXhjZWl2IjsKPiBAQCAtOTksNiArMTMwLDE4IEBAICZpMmMxIHsKPiAg
IAlzdGF0dXMgPSAib2theSI7Cj4gICB9Owo+ICAgCj4gKyZsdGRjIHsKPiArCXBpbmN0cmwtMCA9
IDwmbHRkY19waW5zX2E+Owo+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPiArCXN0YXR1
cyA9ICJva2F5IjsKPiArCj4gKwlwb3J0IHsKPiArCQlsdGRjX291dF9yZ2I6IGVuZHBvaW50IHsK
PiArCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5lbF9pbl9yZ2I+Owo+ICsJCX07Cj4gKwl9Owo+
ICt9Owo+ICsKPiAgICZzZGlvMSB7Cj4gICAJc3RhdHVzID0gIm9rYXkiOwo+ICAgCXZtbWMtc3Vw
cGx5ID0gPCZtbWNfdmNhcmQ+OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
