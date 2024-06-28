Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 252FA91BEFD
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 14:47:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0FD0C71289;
	Fri, 28 Jun 2024 12:47:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 714A2C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 12:47:06 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S8sB1T016273;
 Fri, 28 Jun 2024 14:46:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 qGjl6eaDmBGNoa5xPDUSWRlAlN5BydjJMGHNZtDEO74=; b=JtSd36/MXla3MJZo
 gL09bV0JtR3H1M4bdIwLdPzXRVxItr+zIDlXR7LdtOzuJWiY0WZPkSRkWHnfaPLy
 IQhqqknX6cOpVYDIzpVon3cBZkH3CbZ0p7OGJ42WVBUvfPxU04ckZfdoELqn4qzO
 1tReypOqHYbSB/LFGWv9PwRUv04NUEpAfzLjGTdVTGgjGFwUxIRAMbiWsPnLzcqQ
 TcRDpjs0w7vPxixS+h78M0BkR1iTzOieLHpKCAkKyNGrOJQ4VCUYMSkGCb3wIFtp
 e3eI/q64fR/j2LmaI7xy5FvP//16Gg4l2/3eDwTXkjgNKcFQ7dk1Rv95Rmk3w6+a
 9+cIKQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yx860yxds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 14:46:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 839E74002D;
 Fri, 28 Jun 2024 14:46:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DDD6B2248DA;
 Fri, 28 Jun 2024 14:45:35 +0200 (CEST)
Received: from [10.48.86.145] (10.48.86.145) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 28 Jun
 2024 14:45:35 +0200
Message-ID: <422a643f-1035-6be1-607c-85c43e2cf148@foss.st.com>
Date: Fri, 28 Jun 2024 14:45:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Yannick FERTRE <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20240226-lvds-v6-0-15e3463fbe70@foss.st.com>
 <20240226-lvds-v6-3-15e3463fbe70@foss.st.com>
 <7cdeaaab-ab8f-4b0c-89ec-cb61764a4abb@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <7cdeaaab-ab8f-4b0c-89ec-cb61764a4abb@foss.st.com>
X-Originating-IP: [10.48.86.145]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_08,2024-06-28_01,2024-05-17_01
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

Ck9uIDYvMjEvMjQgMTY6NTUsIFlhbm5pY2sgRkVSVFJFIHdyb3RlOgo+IEhpIFJhcGhhw6tsLAo+
IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCwgaXQgd2lsbCBub3QgbWVyZ2VkIGR1ZSB0byBhIG5l
dyBjbG9jayBtYW5hZ2VtZW50Lgo+IAo+IFBoaWxpcHBlLAo+IAo+IHRoaXMgcGF0Y2ggd2lsbCBi
ZSByZXBsYWNlZCBieSBhbm90aGVyIHdoaWNoIG1hbmFnZXMgYWxsIGNsb2NrcyB0aGF0IHRoZSAK
PiBkaXNwbGF5IGNvbnRyb2xsZXIKPiAKPiAgwqB3aWxsIG5lZWQgKHBpeGVsIGNsb2NrLCBidXMg
Y2xvY2sgcmVmZXJlbmNlIGNsb2NrKS4KCkhpIFJhcGhhw6tsICYgWWFubmljaywKSSBhcHBsaWVk
IDEgJiAyIG9uIGRybS1taXNjLW5leHQuCk1hbnkgdGhhbmtzLApQaGlsaXBwZSA6LSkKCgo+IAo+
IAo+IEJlc3QgcmVnYXJkcwo+IAo+IAo+IExlIDI2LzAyLzIwMjQgw6AgMTE6NDgsIFJhcGhhZWwg
R2FsbGFpcy1Qb3UgYSDDqWNyaXTCoDoKPj4gVGhlIFNUTTMyTVAyNXggZGlzcGxheSBzdWJzeXN0
ZW0gcHJlc2VudHMgYSBtdXggd2hpY2ggZmVlZHMgdGhlIGxvb3BiYWNrCj4+IHBpeGVsIGNsb2Nr
IG9mIHRoZSBjdXJyZW50IGJyaWRnZSBpbiB1c2UgaW50byB0aGUgTFREQy4gVGhpcyBtdXggaXMg
b25seQo+PiBhY2Nlc3NpYmxlIHRocm91Z2ggc3lzY29uZmlnIHJlZ2lzdGVycyB3aGljaCBpcyBu
b3QgeWV0IGF2YWlsYWJsZSBpbiB0aGUKPj4gU1RNMzJNUDI1eCBjb21tb24gY2xvY2sgZnJhbWV3
b3JrLgo+Pgo+PiBXaGlsZSB3YWl0aW5nIGZvciBhIGNvbXBsZXRlIHVwZGF0ZSBvZiB0aGUgY2xv
Y2sgZnJhbWV3b3JrLCB0aGlzIHdvdWxkCj4+IGFsbG93IHRvIHVzZSB0aGUgTFZEUy4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBm
b3NzLnN0LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVy
dHJlQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gwqDCoMKgwqAtIEZp
eGVkIG15IGFkZHJlc3MKPj4gwqDCoMKgwqAtIEZpeGVkIHNtYXRjaCB3YXJuaW5nCj4+IC0tLQo+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysK
Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmggfMKgIDEgKwo+PiDCoCAyIGZpbGVzIGNo
YW5nZWQsIDIwIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9zdG0vbHRkYy5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKPj4gaW5kZXggNTU3NmZk
YWU0OTYyLi4yMzAxMWE4OTEzYmQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0v
bHRkYy5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4+IEBAIC04MzgsNiAr
ODM4LDEyIEBAIGx0ZGNfY3J0Y19tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPj4g
wqDCoMKgwqDCoCBpbnQgdGFyZ2V0X21heCA9IHRhcmdldCArIENMS19UT0xFUkFOQ0VfSFo7Cj4+
IMKgwqDCoMKgwqAgaW50IHJlc3VsdDsKPj4gK8KgwqDCoCBpZiAobGRldi0+bHZkc19jbGspIHsK
Pj4gK8KgwqDCoMKgwqDCoMKgIHJlc3VsdCA9IGNsa19yb3VuZF9yYXRlKGxkZXYtPmx2ZHNfY2xr
LCB0YXJnZXQpOwo+PiArwqDCoMKgwqDCoMKgwqAgRFJNX0RFQlVHX0RSSVZFUigibHZkcyBwaXhj
bGsgcmF0ZSB0YXJnZXQgJWQsIGF2YWlsYWJsZSAlZFxuIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHRhcmdldCwgcmVzdWx0KTsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gwqDC
oMKgwqDCoCByZXN1bHQgPSBjbGtfcm91bmRfcmF0ZShsZGV2LT5waXhlbF9jbGssIHRhcmdldCk7
Cj4+IMKgwqDCoMKgwqAgRFJNX0RFQlVHX0RSSVZFUigiY2xrIHJhdGUgdGFyZ2V0ICVkLCBhdmFp
bGFibGUgJWRcbiIsIHRhcmdldCwgCj4+IHJlc3VsdCk7Cj4+IEBAIC0xODk2LDYgKzE5MDIsOCBA
QCB2b2lkIGx0ZGNfc3VzcGVuZChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldikKPj4gwqDCoMKgwqDC
oCBEUk1fREVCVUdfRFJJVkVSKCJcbiIpOwo+PiDCoMKgwqDCoMKgIGNsa19kaXNhYmxlX3VucHJl
cGFyZShsZGV2LT5waXhlbF9jbGspOwo+PiArwqDCoMKgIGlmIChsZGV2LT5sdmRzX2NsaykKPj4g
K8KgwqDCoMKgwqDCoMKgIGNsa19kaXNhYmxlX3VucHJlcGFyZShsZGV2LT5sdmRzX2Nsayk7Cj4+
IMKgIH0KPj4gwqAgaW50IGx0ZGNfcmVzdW1lKHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2KQo+PiBA
QCAtMTkxMCw2ICsxOTE4LDEzIEBAIGludCBsdGRjX3Jlc3VtZShzdHJ1Y3QgZHJtX2RldmljZSAq
ZGRldikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIERSTV9FUlJPUigiZmFpbGVkIHRvIGVuYWJsZSBw
aXhlbCBjbG9jayAoJWQpXG4iLCByZXQpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJl
dDsKPj4gwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqAgaWYgKGxkZXYtPmx2ZHNfY2xrKSB7Cj4+ICvC
oMKgwqDCoMKgwqDCoCBpZiAoY2xrX3ByZXBhcmVfZW5hYmxlKGxkZXYtPmx2ZHNfY2xrKSkgewo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbGtfZGlzYWJsZV91bnByZXBhcmUobGRldi0+cGl4
ZWxfY2xrKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX0VSUk9SKCJVbmFibGUgdG8g
cHJlcGFyZSBsdmRzIGNsb2NrXG4iKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FTk9ERVY7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqAgfQo+PiDCoMKgwqDCoMKg
IHJldHVybiAwOwo+PiDCoCB9Cj4+IEBAIC0xOTgxLDYgKzE5OTYsMTAgQEAgaW50IGx0ZGNfbG9h
ZChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gwqDC
oMKgwqDCoCB9Cj4+ICvCoMKgwqAgbGRldi0+bHZkc19jbGsgPSBkZXZtX2Nsa19nZXQoZGV2LCAi
bHZkcyIpOwo+PiArwqDCoMKgIGlmIChJU19FUlIobGRldi0+bHZkc19jbGspKQo+PiArwqDCoMKg
wqDCoMKgwqAgbGRldi0+bHZkc19jbGsgPSBOVUxMOwo+PiArCj4+IMKgwqDCoMKgwqAgcnN0YyA9
IGRldm1fcmVzZXRfY29udHJvbF9nZXRfZXhjbHVzaXZlKGRldiwgTlVMTCk7Cj4+IMKgwqDCoMKg
wqAgbXV0ZXhfaW5pdCgmbGRldi0+ZXJyX2xvY2spOwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3N0bS9sdGRjLmggYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuaAo+PiBpbmRleCA5
ZDQ4ODA0M2ZmZGIuLjRhNjBjZTViNjEwYyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3N0bS9sdGRjLmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmgKPj4gQEAgLTQ0
LDYgKzQ0LDcgQEAgc3RydWN0IGx0ZGNfZGV2aWNlIHsKPj4gwqDCoMKgwqDCoCB2b2lkIF9faW9t
ZW0gKnJlZ3M7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+PiDCoMKgwqDC
oMKgIHN0cnVjdCBjbGsgKnBpeGVsX2NsazvCoMKgwqAgLyogbGNkIHBpeGVsIGNsb2NrICovCj4+
ICvCoMKgwqAgc3RydWN0IGNsayAqbHZkc19jbGs7wqDCoMKgIC8qIGx2ZHMgcGl4ZWwgY2xvY2sg
Ki8KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgbXV0ZXggZXJyX2xvY2s7wqDCoMKgIC8qIHByb3RlY3Rp
bmcgZXJyb3Jfc3RhdHVzICovCj4+IMKgwqDCoMKgwqAgc3RydWN0IGx0ZGNfY2FwcyBjYXBzOwo+
PiDCoMKgwqDCoMKgIHUzMiBpcnFfc3RhdHVzOwo+PgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
