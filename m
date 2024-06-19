Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCD790F26E
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 17:42:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBAF5C6B460;
	Wed, 19 Jun 2024 15:42:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83342C5E2D0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 15:42:12 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JClcrJ002573;
 Wed, 19 Jun 2024 17:41:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 67yqfpKh56AKrK0vIV+pIDS3OpXEowZR1XSlRO6rTac=; b=eXGjNNvcd2mXSjDp
 UWD9btAjEvQpIl3yBRvUBR8hSvsWtCfce/5+b6ro9bOFl5YMg4SHSly61PaMmlRJ
 odXbdM38FA9MQnHx/UanvJClFwxiKQX47XY00k3/x7CKZkzpOBmIcO40SyUZbVUS
 /ky3ZwZux2w1aIex5ruBccs8nGwxx3GdDsHSuD4ONWtugWdwqbLiQRsLa0w1JTi5
 Tsm80xBb93M5ZBA09XFjUv8RKa0Au8oHvjighR0Oj/jy1TpRwmyf/BmRFI/WnC/0
 DNWoSnGRrO9H7Oqgv/zN0/UT0ND0IB2rUUhH6hoCKqFWilOP/j2xD2mFqpI712c3
 qBPreg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yuj9n4av8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jun 2024 17:41:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 74ADE4004B;
 Wed, 19 Jun 2024 17:41:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8A446221EB2;
 Wed, 19 Jun 2024 17:40:22 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 19 Jun
 2024 17:40:21 +0200
Message-ID: <01e435a5-3a69-49a5-9d5e-ab9af0a2af7b@foss.st.com>
Date: Wed, 19 Jun 2024 17:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
 <richardcochran@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20240614130812.72425-1-christophe.roullier@foss.st.com>
 <20240614130812.72425-3-christophe.roullier@foss.st.com>
 <4c2f1bac-4957-4814-bf62-816340bd9ff6@denx.de>
 <09010b02-fb55-4c4b-9d0c-36bd0b370dc8@foss.st.com>
 <39d35f6d-4f82-43af-883b-a574b8a67a1a@denx.de>
 <8c3f1696-d67c-4960-ad3a-90461c896aa5@foss.st.com>
 <3dee3c8a-12f0-42bd-acdf-8008da795467@denx.de>
 <aee3f6d2-6a44-4de6-9348-f83c4107188f@foss.st.com>
 <c74f393d-7d0a-4a34-8e72-553ccf273a41@denx.de>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <c74f393d-7d0a-4a34-8e72-553ccf273a41@denx.de>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [net-next,
 PATCH 2/2] net: stmmac: dwmac-stm32: stm32: add management of
 stm32mp25 for stm32
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

Ck9uIDYvMTkvMjQgMTU6MTQsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDYvMTkvMjQgOTo0MSBB
TSwgQ2hyaXN0b3BoZSBST1VMTElFUiB3cm90ZToKPgo+IEhpLAo+Cj4+Pj4+Pj4+ICtzdGF0aWMg
aW50IHN0bTMybXAyX2NvbmZpZ3VyZV9zeXNjZmcoc3RydWN0IAo+Pj4+Pj4+PiBwbGF0X3N0bW1h
Y2VuZXRfZGF0YSAqcGxhdF9kYXQpCj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0
IHN0bTMyX2R3bWFjICpkd21hYyA9IHBsYXRfZGF0LT5ic3BfcHJpdjsKPj4+Pj4+Pj4gK8KgwqDC
oCB1MzIgcmVnID0gZHdtYWMtPm1vZGVfcmVnOwo+Pj4+Pj4+PiArwqDCoMKgIGludCB2YWwgPSAw
Owo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICvCoMKgwqAgc3dpdGNoIChwbGF0X2RhdC0+bWFjX2ludGVy
ZmFjZSkgewo+Pj4+Pj4+PiArwqDCoMKgIGNhc2UgUEhZX0lOVEVSRkFDRV9NT0RFX01JSToKPj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+Pj4+Cj4+Pj4+Pj4gZHdtYWMtPmVuYWJs
ZV9ldGhfY2sgZG9lcyBub3QgYXBwbHkgdG8gTUlJIG1vZGUgPyBXaHkgPwo+Pj4+Pj4KPj4+Pj4+
IEl0IGlzIGxpa2UgTVAxIGFuZCBNUDEzLCBub3RoaW5nIHRvIHNldCBpbiBzeXNjZmcgcmVnaXN0
ZXIgZm9yIAo+Pj4+Pj4gY2FzZSBNSUkgbW9kZSB3byBjcnlzdGFsLgo+Pj4+Pgo+Pj4+PiBIYXZl
IGEgbG9vayBhdCBTVE0zMk1QMTV4eCBSTTA0MzYgRmlndXJlIDgzLiBQZXJpcGhlcmFsIGNsb2Nr
IAo+Pj4+PiBkaXN0cmlidXRpb24gZm9yIEV0aGVybmV0Lgo+Pj4+Pgo+Pj4+PiBJZiBSQ0MgKHRv
cC1sZWZ0IGNvcm5lciBvZiB0aGUgZmlndXJlKSBnZW5lcmF0ZXMgMjUgTUh6IE1JSSBjbG9jayAK
Pj4+Pj4gKHllbGxvdyBsaW5lKSBvbiBldGhfY2xrX2ZiICh0b3AtcmlnaHQgY29ybmVyKSwgY2Fu
IEkgc2V0IAo+Pj4+PiBFVEhfUkVGX0NMS19TRUwgdG8gcG9zaXRpb24gJzEnIGFuZCBFVEhfU0VM
WzJdIHRvICcwJyBhbmQgZmVlZCBFVEggCj4+Pj4+IChyaWdodCBzaWRlKSBjbGtfcnhfaSBpbnB1
dCB3aXRoIDI1IE1IeiBjbG9jayB0aGF0IHdheSA/Cj4+Pj4+Cj4+Pj4+IEkgc2VlbXMgbGlrZSB0
aGlzIHNob3VsZCBiZSBwb3NzaWJsZSwgYXQgbGVhc3QgdGhlb3JldGljYWxseS4gQ2FuIAo+Pj4+
PiB5b3UgY2hlY2sgd2l0aCB0aGUgaGFyZHdhcmUvc2lsaWNvbiBwZW9wbGUgPwo+Pj4+IE5vIGl0
IGlzIG5vdCBwb3NzaWJsZSAoaXQgd2lsbCB3b3JrIGlmIHNwZWVkIChhbmQgZnJlcXVlbmN5KSBp
cyAKPj4+PiBmaXhlZCAyNU1oej0xMDBNYnBzLCBidXQgZm9yIHNwZWVkIDEwTWJwcyAoMiw1TUh6
KSBpdCB3aWxsIG5vdCB3b3JrLgo+Pj4KPj4+IENvdWxkIHRoZSBwbGw0X3BfY2sgb3IgcGxsM19x
X2NrIGdlbmVyYXRlIGVpdGhlciAyNSBNSHogb3IgMi41IE1IeiAKPj4+IGFzIG5lZWRlZCBpbiB0
aGF0IGNhc2UgPyBUaGVuIGl0IHdvdWxkIHdvcmssIHJpZ2h0ID8KPj4KPj4gWWVzIHlvdSBjYW4g
c2V0IGZyZXF1ZW5jeSB5b3Ugd2FudCBmb3IgcGxsNCBvciBwbGwzLCBpZiB5b3Ugc2V0IDI1TUh6
IAo+PiBhbmQgYXV0by1uZWdvdGlhdGlvbiBvZiBzcGVlZCBpcyAxMDBNYnBzIGl0IHNob3VsZCB3
b3JrIChwYWQgRVRIX0NLIAo+PiBvZiAyNU1IeiBjbG9jayB0aGUgUEhZIGFuZCBldGhfY2xrX2Zi
IHNldCB0byAyNU1IeiBmb3IgY2xrX1JYKQo+Pgo+PiBidXQgaWYgYXV0b25lZyBvZiBzcGVlZCBp
cyAxME1icHMsIHRoZW4gMi41TUh6IGlzIG5lZWRlZCBmb3IgY2xrX1JYIAo+PiAoeW91IHdpbGwg
cHJvdmlkZSAyNU1oeikKPgo+IFdoYXQgaWY6Cj4KPiAtIEFuZWcgaXMgMTAgTWJwcwo+IC0gUExM
NF9QX0NLL1BMTDNfUV9DSyA9IDIuNSBNSHoKPiAtIEVUSF9SRUZfQ0xLX1NFTCA9IDEKPiAtIEVU
SF9TRUxbMl0gPSAwCj4KPiA/Cj4KPiBUaGVuLCBjbGtfcnhfaSBpcyAyLjUgTUh6LCByaWdodCA/
ClllcyB0aGF0IHJpZ2h0Cj4KPiBEb2VzIHRoaXMgY29uZmlndXJhdGlvbiB3b3JrID8KRm9yIG1l
IG5vLCBiZWNhdXNlIFBIWSBFdGhlcm5ldCBPc2NpbGxhdG9yL2NyaXN0YWwgbmVlZCBpbiBQQUQg
MjVNaHogb3IgCjUwTWh6LCBJIHRoaW5rIGl0IGlzIGRvZXMgbm90IHdvcmsgaWYgb3NjaWxsYXRv
ciBmcmVxdWVuY3kgcHJvdmlkZWQgaXMgCjIuNU1IeiAoVG8gbXkga25vd2xlZGdlIHRoZXJlIGlz
IG5vIEV0aGVybmV0IFBIWSB3aGljaCBoYXZlIG9zY2lsbGF0b3IgCndvcmtpbmcgdG8gMi41TUh6
KQo+Cj4+IC4gRm9yIFJNSUkgY2FzZSwgZnJlcXVlbmN5IGZyb20gcGxsIChldGhfY2xrX2ZiKSBp
cyBhdXRvbWF0aWNhbGx5IAo+PiBhZGp1c3QgaW4gZnVuY3Rpb24gb2Ygc3BlZWQgdmFsdWUsIHRo
YW5rcyB0byBkaXZpc2VyIC8yLCAvMjAgd2l0aCAKPj4gbWFjX3NwZWVkX28uCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
