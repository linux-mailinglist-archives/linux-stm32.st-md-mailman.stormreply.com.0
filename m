Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C8B3C7526
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jul 2021 18:43:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 929BAC57B6F;
	Tue, 13 Jul 2021 16:43:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5362BC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 16:43:46 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16DGgCqI002362; Tue, 13 Jul 2021 18:43:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=NrBQl9PQESREt4QlXIBNF8Tt2SNqFzKjdzUeXCZXIRY=;
 b=g7e3iRqhdFQEddPfNK0dM1UQChXrP5M37p1BMCh2j9rGdpkH7ChYwy1rRP+PvoVDM3Dl
 tNXCU3hNLoqoD0XIMxjGbPkc0mGKLNpsAcoQFL8JHUZHQlLlV3n9scAOGJjZLmbV5kmk
 Me1m6bLcHupFxfalQX9/1dfZKh2LGTR36cIx+UyPM2SkSxzfywaT3djBimJjTpdRxZTB
 m69F8bK8eiqfPaVwg+QguAhgdaLhDKFvPBMvDpfaxCIynTa19S2tBuCBOriodn04O61W
 ERVwPNTYo4GXEYrY+mfTh/QcsPofk3ejA1Kjw5Ae3Ewj/GnF6ALVDb3wkSuNR13+brXg SA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39sdk40ar1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 18:43:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 18EAD10002A;
 Tue, 13 Jul 2021 18:43:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D34CF248EC3;
 Tue, 13 Jul 2021 18:43:28 +0200 (CEST)
Received: from lmecxl0993.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Jul
 2021 18:43:28 +0200
To: Jagan Teki <jagan@amarulasolutions.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
References: <20210704135914.268308-1-jagan@amarulasolutions.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <9008c9b8-ae48-588c-cfb4-cda7323e15dd@foss.st.com>
Date: Tue, 13 Jul 2021 18:43:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704135914.268308-1-jagan@amarulasolutions.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_10:2021-07-13,
 2021-07-13 signatures=0
Cc: linux-arm-kernel@lists.infradead.org, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: Silence -EPROBE_DEFER till
	bridge attached
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

SGkgSmFnYW4sCgpPbiA3LzQvMjEgMzo1OSBQTSwgSmFnYW4gVGVraSB3cm90ZToKPiBBcyBkdy1t
aXBpLWRzaSBzdXBwb3J0ZWQgYWxsIHBvc3NpYmxlIHdheXMgdG8gZmluZCB0aGUgRFNJCj4gZGV2
aWNlcy4gSXQgY2FuIHRha2UgbXVsdGlwbGUgaXRlcmF0aW9ucyBmb3IgbHRkYyB0byBmaW5kCj4g
YWxsIGNvbXBvbmVudHMgYXR0YWNoZWQgdG8gdGhlIERTSSBicmlkZ2UuCj4gCj4gVGhlIGN1cnJl
bnQgbHRkYyBkcml2ZXIgZmFpbGVkIHRvIGZpbmQgdGhlIGVuZHBvaW50IGFzCj4gaXQgcmV0dXJu
ZWQgLUVJTlZBTCBmb3IgdGhlIGZpcnN0IGl0ZXJhdGlvbiBpdHNlbGYuIFRoaXMgbGVhZHMKPiB0
byBmb2xsb3dpbmcgZXJyb3I6Cj4gCj4gWyDCoCDCoDMuMDk5Mjg5XSBbZHJtOmx0ZGNfbG9hZF0g
KkVSUk9SKiBpbml0IGVuY29kZXIgZW5kcG9pbnQgMAo+IAo+IFNvLCBjaGVjayB0aGUgcmV0dXJu
IHZhbHVlIGFuZCBjbGVhbnVwIHRoZSBlbmNvZGVyIG9ubHkgaWYgaXQncwo+IG5vdCAtRVBST0JF
X0RFRkVSLiBUaGlzIG1ha2UgYWxsIGNvbXBvbmVudHMgaW4gdGhlIGF0dGFjaGVkIERTSQo+IGJy
aWRnZSBmb3VuZCBwcm9wZXJseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWdhbiBUZWtpIDxqYWdh
bkBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9zdG0vbHRk
Yy5jIHwgOCArKysrKy0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+IGluZGV4IDA4YjcxMjQ4MDQ0ZC4uOTVlOTgz
ZDNmZmI1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKPiBAQCAtMTEyMiw4ICsxMTIyLDkgQEAgc3RhdGlj
IGludCBsdGRjX2VuY29kZXJfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGRldiwgc3RydWN0IGRy
bV9icmlkZ2UgKmJyaWRnZSkKPiAgIAo+ICAgCXJldCA9IGRybV9icmlkZ2VfYXR0YWNoKGVuY29k
ZXIsIGJyaWRnZSwgTlVMTCwgMCk7Cj4gICAJaWYgKHJldCkgewo+IC0JCWRybV9lbmNvZGVyX2Ns
ZWFudXAoZW5jb2Rlcik7Cj4gLQkJcmV0dXJuIC1FSU5WQUw7Cj4gKwkJaWYgKHJldCAhPSAtRVBS
T0JFX0RFRkVSKQo+ICsJCQlkcm1fZW5jb2Rlcl9jbGVhbnVwKGVuY29kZXIpOwoKTWFueSB0aGFu
a3MgZm9yIHlvdXIgcGF0Y2guCgpUaGlzIG1lYW5zIHRoYXQgd2UgYXJlIGNvdW50aW5nIG9uIHRo
ZSBmdXR1cmUgc3VjY2VzcyBvZiB0aGUgZGVmZXJyZWQgCnByb2JlIGJlY2F1c2Ugd2UgZG8gbm90
IGNsZWFuIHRoZSBlbmNvZGVyLi4uCkhvd2V2ZXIsIFlhbm5pY2sgZ2F2ZSBoaXMgIlRlc3RlZC1i
eSIgYW5kIHRoaXMgcGF0Y2ggc2VlbXMgdXNlZnVsIHNvCgpBY2tlZC1ieTogUGhpbGlwcGUgQ29y
bnUgPHBoaWxpcHBlLmNvcm51QGZvc3Muc3QuY29tPgoKSSB3aWxsIG1lcmdlIGl0IGZyaWRheSBv
ciBlYXJseSBuZXh0IHdlZWssCgpUaGFuayB5b3UKUGhpbGlwcGUgOi0pCgoKPiArCQlyZXR1cm4g
cmV0Owo+ICAgCX0KPiAgIAo+ICAgCURSTV9ERUJVR19EUklWRVIoIkJyaWRnZSBlbmNvZGVyOiVk
IGNyZWF0ZWRcbiIsIGVuY29kZXItPmJhc2UuaWQpOwo+IEBAIC0xMjY2LDcgKzEyNjcsOCBAQCBp
bnQgbHRkY19sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2KQo+ICAgCQlpZiAoYnJpZGdlKSB7
Cj4gICAJCQlyZXQgPSBsdGRjX2VuY29kZXJfaW5pdChkZGV2LCBicmlkZ2UpOwo+ICAgCQkJaWYg
KHJldCkgewo+IC0JCQkJRFJNX0VSUk9SKCJpbml0IGVuY29kZXIgZW5kcG9pbnQgJWRcbiIsIGkp
Owo+ICsJCQkJaWYgKHJldCAhPSAtRVBST0JFX0RFRkVSKQo+ICsJCQkJCURSTV9FUlJPUigiaW5p
dCBlbmNvZGVyIGVuZHBvaW50ICVkXG4iLCBpKTsKPiAgIAkJCQlnb3RvIGVycjsKPiAgIAkJCX0K
PiAgIAkJfQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
