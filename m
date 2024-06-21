Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A57179128A1
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 16:57:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C6EDC7128E;
	Fri, 21 Jun 2024 14:57:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB7B3C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 14:57:09 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LBQoF1027665;
 Fri, 21 Jun 2024 16:56:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 KIQrxrtnC2DYhTRvoRD8OWvHXgA1BQjlsrCrREKJO/M=; b=bWH5QlR/N8zwS7LT
 /nSDcp38Zye2Kq7q1AnYNmoI5AGfF8AosL/P++/bYXMgSSbw47eRo9AfyCYLYdVS
 inF3Opx5XXVdpIOTeq4lRZqukPUaZo/g7yKHnffoKbDueLmIoKo8bdl3LAm+qNwT
 webf4XcX9gVPosLgNgoOo93FPj+5X0/nRo8Kqn4lTrRMQhc0Uz7u+wqs6kZdlgWx
 PJRgHTq08kZI+4pdes42oPnBUVWi129seKFbQSLXiX5TJsHde75iwz2tPGh/2dx7
 +D8E/PAsObYLf3ewmeJNmdZ0x0dQJIa8vVNCTjHNpbuiSBNPWB8juiwmQcbvsB9K
 A6zzJA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yvrkgv64p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jun 2024 16:56:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 245514002D;
 Fri, 21 Jun 2024 16:56:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8876522365A;
 Fri, 21 Jun 2024 16:55:44 +0200 (CEST)
Received: from [10.48.87.177] (10.48.87.177) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 21 Jun
 2024 16:55:43 +0200
Message-ID: <7cdeaaab-ab8f-4b0c-89ec-cb61764a4abb@foss.st.com>
Date: Fri, 21 Jun 2024 16:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20240226-lvds-v6-0-15e3463fbe70@foss.st.com>
 <20240226-lvds-v6-3-15e3463fbe70@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20240226-lvds-v6-3-15e3463fbe70@foss.st.com>
X-Originating-IP: [10.48.87.177]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_06,2024-06-21_01,2024-05-17_01
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 3/3] drm/stm: ltdc: add lvds pixel clock
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

SGkgUmFwaGHDq2wsCgpUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIGl0IHdpbGwgbm90IG1lcmdlZCBk
dWUgdG8gYSBuZXcgY2xvY2sgbWFuYWdlbWVudC4KClBoaWxpcHBlLAoKdGhpcyBwYXRjaCB3aWxs
IGJlIHJlcGxhY2VkIGJ5IGFub3RoZXIgd2hpY2ggbWFuYWdlcyBhbGwgY2xvY2tzIHRoYXQgdGhl
IApkaXNwbGF5IGNvbnRyb2xsZXIKCiDCoHdpbGwgbmVlZCAocGl4ZWwgY2xvY2ssIGJ1cyBjbG9j
ayByZWZlcmVuY2UgY2xvY2spLgoKCkJlc3QgcmVnYXJkcwoKCkxlIDI2LzAyLzIwMjQgw6AgMTE6
NDgsIFJhcGhhZWwgR2FsbGFpcy1Qb3UgYSDDqWNyaXTCoDoKPiBUaGUgU1RNMzJNUDI1eCBkaXNw
bGF5IHN1YnN5c3RlbSBwcmVzZW50cyBhIG11eCB3aGljaCBmZWVkcyB0aGUgbG9vcGJhY2sKPiBw
aXhlbCBjbG9jayBvZiB0aGUgY3VycmVudCBicmlkZ2UgaW4gdXNlIGludG8gdGhlIExUREMuIFRo
aXMgbXV4IGlzIG9ubHkKPiBhY2Nlc3NpYmxlIHRocm91Z2ggc3lzY29uZmlnIHJlZ2lzdGVycyB3
aGljaCBpcyBub3QgeWV0IGF2YWlsYWJsZSBpbiB0aGUKPiBTVE0zMk1QMjV4IGNvbW1vbiBjbG9j
ayBmcmFtZXdvcmsuCj4KPiBXaGlsZSB3YWl0aW5nIGZvciBhIGNvbXBsZXRlIHVwZGF0ZSBvZiB0
aGUgY2xvY2sgZnJhbWV3b3JrLCB0aGlzIHdvdWxkCj4gYWxsb3cgdG8gdXNlIHRoZSBMVkRTLgo+
Cj4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBv
dUBmb3NzLnN0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyZSA8eWFubmljay5m
ZXJ0cmVAZm9zcy5zdC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAJLSBGaXhlZCBteSBh
ZGRyZXNzCj4gCS0gRml4ZWQgc21hdGNoIHdhcm5pbmcKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9zdG0vbHRkYy5jIHwgMTkgKysrKysrKysrKysrKysrKysrKwo+ICAgZHJpdmVycy9ncHUvZHJt
L3N0bS9sdGRjLmggfCAgMSArCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9zdG0vbHRkYy5jCj4gaW5kZXggNTU3NmZkYWU0OTYyLi4yMzAxMWE4OTEzYmQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vc3RtL2x0ZGMuYwo+IEBAIC04MzgsNiArODM4LDEyIEBAIGx0ZGNfY3J0Y19tb2RlX3ZhbGlk
KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAgIAlpbnQgdGFyZ2V0X21heCA9IHRhcmdldCArIENM
S19UT0xFUkFOQ0VfSFo7Cj4gICAJaW50IHJlc3VsdDsKPiAgIAo+ICsJaWYgKGxkZXYtPmx2ZHNf
Y2xrKSB7Cj4gKwkJcmVzdWx0ID0gY2xrX3JvdW5kX3JhdGUobGRldi0+bHZkc19jbGssIHRhcmdl
dCk7Cj4gKwkJRFJNX0RFQlVHX0RSSVZFUigibHZkcyBwaXhjbGsgcmF0ZSB0YXJnZXQgJWQsIGF2
YWlsYWJsZSAlZFxuIiwKPiArCQkJCSB0YXJnZXQsIHJlc3VsdCk7Cj4gKwl9Cj4gKwo+ICAgCXJl
c3VsdCA9IGNsa19yb3VuZF9yYXRlKGxkZXYtPnBpeGVsX2NsaywgdGFyZ2V0KTsKPiAgIAo+ICAg
CURSTV9ERUJVR19EUklWRVIoImNsayByYXRlIHRhcmdldCAlZCwgYXZhaWxhYmxlICVkXG4iLCB0
YXJnZXQsIHJlc3VsdCk7Cj4gQEAgLTE4OTYsNiArMTkwMiw4IEBAIHZvaWQgbHRkY19zdXNwZW5k
KHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2KQo+ICAgCj4gICAJRFJNX0RFQlVHX0RSSVZFUigiXG4i
KTsKPiAgIAljbGtfZGlzYWJsZV91bnByZXBhcmUobGRldi0+cGl4ZWxfY2xrKTsKPiArCWlmIChs
ZGV2LT5sdmRzX2NsaykKPiArCQljbGtfZGlzYWJsZV91bnByZXBhcmUobGRldi0+bHZkc19jbGsp
Owo+ICAgfQo+ICAgCj4gICBpbnQgbHRkY19yZXN1bWUoc3RydWN0IGRybV9kZXZpY2UgKmRkZXYp
Cj4gQEAgLTE5MTAsNiArMTkxOCwxMyBAQCBpbnQgbHRkY19yZXN1bWUoc3RydWN0IGRybV9kZXZp
Y2UgKmRkZXYpCj4gICAJCURSTV9FUlJPUigiZmFpbGVkIHRvIGVuYWJsZSBwaXhlbCBjbG9jayAo
JWQpXG4iLCByZXQpOwo+ICAgCQlyZXR1cm4gcmV0Owo+ICAgCX0KPiArCWlmIChsZGV2LT5sdmRz
X2Nsaykgewo+ICsJCWlmIChjbGtfcHJlcGFyZV9lbmFibGUobGRldi0+bHZkc19jbGspKSB7Cj4g
KwkJCWNsa19kaXNhYmxlX3VucHJlcGFyZShsZGV2LT5waXhlbF9jbGspOwo+ICsJCQlEUk1fRVJS
T1IoIlVuYWJsZSB0byBwcmVwYXJlIGx2ZHMgY2xvY2tcbiIpOwo+ICsJCQlyZXR1cm4gLUVOT0RF
VjsKPiArCQl9Cj4gKwl9Cj4gICAKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiBAQCAtMTk4MSw2ICsx
OTk2LDEwIEBAIGludCBsdGRjX2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRkZXYpCj4gICAJCX0K
PiAgIAl9Cj4gICAKPiArCWxkZXYtPmx2ZHNfY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgImx2ZHMi
KTsKPiArCWlmIChJU19FUlIobGRldi0+bHZkc19jbGspKQo+ICsJCWxkZXYtPmx2ZHNfY2xrID0g
TlVMTDsKPiArCj4gICAJcnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlKGRl
diwgTlVMTCk7Cj4gICAKPiAgIAltdXRleF9pbml0KCZsZGV2LT5lcnJfbG9jayk7Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5oIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9s
dGRjLmgKPiBpbmRleCA5ZDQ4ODA0M2ZmZGIuLjRhNjBjZTViNjEwYyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRk
Yy5oCj4gQEAgLTQ0LDYgKzQ0LDcgQEAgc3RydWN0IGx0ZGNfZGV2aWNlIHsKPiAgIAl2b2lkIF9f
aW9tZW0gKnJlZ3M7Cj4gICAJc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+ICAgCXN0cnVjdCBjbGsg
KnBpeGVsX2NsazsJLyogbGNkIHBpeGVsIGNsb2NrICovCj4gKwlzdHJ1Y3QgY2xrICpsdmRzX2Ns
azsJLyogbHZkcyBwaXhlbCBjbG9jayAqLwo+ICAgCXN0cnVjdCBtdXRleCBlcnJfbG9jazsJLyog
cHJvdGVjdGluZyBlcnJvcl9zdGF0dXMgKi8KPiAgIAlzdHJ1Y3QgbHRkY19jYXBzIGNhcHM7Cj4g
ICAJdTMyIGlycV9zdGF0dXM7Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
