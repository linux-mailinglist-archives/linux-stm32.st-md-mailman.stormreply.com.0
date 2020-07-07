Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2061B217372
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 18:14:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBF77C36B2A;
	Tue,  7 Jul 2020 16:14:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E470C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 16:14:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 067G9tuq013325; Tue, 7 Jul 2020 18:13:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=3Afx2BNI/P16pD98uz+SOHXGDbHLupUEHpZV47RnCLo=;
 b=m0RDiPDM/I0GpRhFENOsWoTXnVZkezWbT606WIGk0x7Xb+EFofzEb2CVNsxRsVQZPOmn
 pcxx2qga7NiCGHC2R7cjLdTLilLXsTAxkGAeqbjIOV4wSdoORuPzla/Cbt4O2ZGes8eV
 ++U+L1KwWGpudPuBgiNvBURVoiDpQZyPRrU0k1bx0emIqFTMywBaz0N3e/zKpoXeDAM0
 QLgh7n0FPxYt82pPLNWStz4xt+Zbk61ujtXaRes35hbq8IIs99aDgzCFtaFSQRunSefk
 pwxFxO4hjamTB1qTT7O31I8DsvylAHIsJnakrhk8lyTyttvKgXU/cUu8Op4Rrf/C5Kau Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 322gnfhyr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 18:13:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA37E10002A;
 Tue,  7 Jul 2020 18:13:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C8ABB2C5AAF;
 Tue,  7 Jul 2020 18:13:48 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 7 Jul
 2020 18:13:48 +0200
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20200616140717.28465-2-amelie.delaunay@st.com>
 <20200704174219.612060-1-martin.blumenstingl@googlemail.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <05a81997-5ddb-ea81-7a89-8078b8a2b610@st.com>
Date: Tue, 7 Jul 2020 18:13:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200704174219.612060-1-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_08:2020-07-07,
 2020-07-07 signatures=0
Cc: "balbi@kernel.org" <balbi@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "hminas@synopsys.com" <hminas@synopsys.com>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/3] usb: dwc2: override PHY input signals
 with usb role switch support
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

SGkgTWFydGluLAoKT24gNy80LzIwIDc6NDIgUE0sIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6
Cj4gSGVsbG8gQW1lbGllLAo+IAo+IHRoYW5rIHlvdSBmb3IgdGhpcyBwYXRjaCAtIEkgYW0gaG9w
aW5nIHRoYXQgaXQgd2lsbCBoZWxwIHVzIG9uIEFtbG9naWMKPiBNZXNvbjgsIE1lc29uOGIsIE1l
c29uOG0yIGFuZCBHWEJCIFNvQ3MgYXMgd2VsbC4KPiBPbiB0aGVzZSBTb0NzIHRoZSBJRCBkZXRl
Y3Rpb24gaXMgcGVyZm9ybWVkIGJ5IHRoZSBQSFkgSVAgYW5kIG5lZWRzIHRvCj4gYmUgcG9sbGVk
Lgo+IEkgdGhpbmsgdXNiX3JvbGVfc3dpdGNoIGlzIHRoZSBwZXJmZWN0IGZyYW1ld29yayBmb3Ig
dGhpcyBvbiBkd2MyIHNpZGUuCj4gRm9yIHRoZSBQSFkgZHJpdmVyIEknbSBnb2luZyB0byBpbXBs
ZW1lbnQgdGhlIGNhYmxlIHN0YXRlIHVzaW5nIHRoZQo+IGV4dGNvbiBmcmFtZXdvcmsgYW5kIHRo
ZW4gaGF2aW5nIGEgbmV3IHVzYi1jb25uLWV4dGNvbiBkcml2ZXIuIFRoaXMgaXMKPiBqdXN0IHRv
IGdpdmUgeW91IGFuIG92ZXJ2aWV3IHdoeSBJJ20gaW50ZXJlc3RlZCBpbiB0aGlzLgo+IAoKSSdt
IHdvbmRlcmluZywgd2h5IHVzZSBleHRjb24gZnJhbWV3b3JrIGFuZCBub3QgdGhlIHVzYiByb2xl
IHN3aXRjaCBBUEkgCj8gVGhpcyBwYXRjaCBvbiBkd2MyIGlzIHRlc3RlZCBvbiBTVE0zMk1QMTU3
Qy1ESzIgYm9hcmQgd2l0aCBTVFVTQjE2MHggClR5cGUtQyBjb250cm9sbGVyIGRyaXZlciByZWNl
bnRseSBwdXNoZWQgd2l0aCB1c2Igcm9sZSBzd2l0Y2guIFlvdSBjYW4gCmhhdmUgYSBsb29rIGhl
cmUgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzEyNTYyMzgvLgoKPiBb
Li4uXQo+PiArc3RhdGljIGludCBkd2MyX2RyZF9yb2xlX3N3X3NldChzdHJ1Y3QgdXNiX3JvbGVf
c3dpdGNoICpzdywgZW51bSB1c2Jfcm9sZSByb2xlKQo+PiArewo+PiArwqDCoMKgwqAgc3RydWN0
IGR3YzJfaHNvdGcgKmhzb3RnID0gdXNiX3JvbGVfc3dpdGNoX2dldF9kcnZkYXRhKHN3KTsKPj4g
K8KgwqDCoMKgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4+ICsKPj4gK8KgwqDCoMKgIC8qIFNraXAg
c2Vzc2lvbiBub3QgaW4gbGluZSB3aXRoIGRyX21vZGUgKi8KPj4gK8KgwqDCoMKgIGlmICgocm9s
ZSA9PSBVU0JfUk9MRV9ERVZJQ0UgJiYgaHNvdGctPmRyX21vZGUgPT0gVVNCX0RSX01PREVfSE9T
VCkgfHwKPj4gK8KgwqDCoMKgwqDCoMKgwqAgKHJvbGUgPT0gVVNCX1JPTEVfSE9TVCAmJiBoc290
Zy0+ZHJfbW9kZSA9PSBVU0JfRFJfTU9ERV9QRVJJUEhFUkFMKSkKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gKwo+PiArwqDCoMKgwqAgLyogU2tpcCBzZXNz
aW9uIGlmIGNvcmUgaXMgaW4gdGVzdCBtb2RlICovCj4+ICvCoMKgwqDCoCBpZiAocm9sZSA9PSBV
U0JfUk9MRV9OT05FICYmIGhzb3RnLT50ZXN0X21vZGUpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkZXZfZGJnKGhzb3RnLT5kZXYsICJDb3JlIGlzIGluIHRlc3QgbW9kZVxuIik7Cj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FQlVTWTsKPj4gK8KgwqDCoMKgIH0K
Pj4gKwo+PiArwqDCoMKgwqAgc3Bpbl9sb2NrX2lycXNhdmUoJmhzb3RnLT5sb2NrLCBmbGFncyk7
Cj4gZHVlIHRvIHRoaXMgc3Bpbl9sb2NrX2lycXNhdmUoKSAuLi4KPiAKPj4gK8KgwqDCoMKgIGlm
IChyb2xlID09IFVTQl9ST0xFX0hPU1QpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoZHdjMl9vdnJfYXZhbGlkKGhzb3RnLCB0cnVlKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byB1bmxvY2s7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoaHNvdGctPmRyX21vZGUgPT0gVVNCX0RSX01PREVfT1RHKQo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogVGhpcyB3aWxsIHJhaXNlIGEgQ29ubmVj
dG9yIElEIFN0YXR1cyBDaGFuZ2UKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIEludGVycnVwdCAtIGNvbm5JRCBBCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZHdjMl9mb3JjZV9tb2RlKGhzb3RnLCB0cnVlKTsKPiAuLi4gd2UgY2Fu
bm90IHNsZWVwIGluIGhlcmUuIHRoZSBjYWxsIGZsb3cgaXM6Cj4gZHdjMl9kcmRfcm9sZV9zd19z
ZXQKPiAgwqAgc3Bpbl9sb2NrX2lycXNhdmUKPiAgwqAgZHdjMl9mb3JjZV9tb2RlCj4gIMKgwqDC
oCBkd2MyX3dhaXRfZm9yX21vZGUKPiAgwqDCoMKgwqDCoCB1c2xlZXBfcmFuZ2UKPiAKCkluIGZh
Y3QsIHdpdGggdGhlIGF2YWxpZCBvciBidmFsaWQgb3ZlcnJpZGluZyArIHRoZSBkZWJvdW5jZSBm
aWx0ZXIgCmJ5cGFzcywgR0lOVFNUU19DVVJNT0QgaXMgYWxyZWFkeSBpbiB0aGUgZXhwZWN0ZWQg
bW9kZSwgc28gdGhhdCB3ZSBleGl0IAp0aGUgbG9vcCBkaXJlY3RseSwgd2l0aG91dCBydW5uaW5n
IGludG8gdXNsZWVwX3JhbmdlLgoKPj4gK8KgwqDCoMKgIH0gZWxzZSBpZiAocm9sZSA9PSBVU0Jf
Uk9MRV9ERVZJQ0UpIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZHdjMl9vdnJf
YnZhbGlkKGhzb3RnLCB0cnVlKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZ290byB1bmxvY2s7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoaHNvdGctPmRyX21vZGUgPT0gVVNCX0RSX01PREVfT1RHKQo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICogVGhpcyB3aWxsIHJhaXNlIGEgQ29ubmVjdG9yIElEIFN0YXR1
cyBDaGFuZ2UKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IEludGVycnVwdCAtIGNvbm5JRCBCCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKi8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZHdjMl9mb3JjZV9tb2RlKGhzb3RnLCBmYWxzZSk7Cj4gKHNhbWUgc2xlZXBpbmcgaXNzdWUg
aGVyZSkKPiAKPiBbLi4uXQo+ICtpbnQgZHdjMl9kcmRfaW5pdChzdHJ1Y3QgZHdjMl9oc290ZyAq
aHNvdGcpCj4gK3sKPiArwqDCoMKgwqDCoMKgIHN0cnVjdCB1c2Jfcm9sZV9zd2l0Y2hfZGVzYyBy
b2xlX3N3X2Rlc2MgPSB7MH07Cj4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3QgdXNiX3JvbGVfc3dpdGNo
ICpyb2xlX3N3Owo+ICvCoMKgwqDCoMKgwqAgaW50IHJldDsKPiArCj4gK8KgwqDCoMKgwqDCoCBp
ZiAoIWRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woaHNvdGctPmRldiwgInVzYi1yb2xlLXN3aXRj
aCIpKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+IHNob3VsZCB3
ZSBhbHNvIHJldHVybiBlYXJseSBoZXJlIGlmIGRyX21vZGUgIT0gIm90ZyI/Cj4gCgpObywgYmVj
YXVzZSB3aGVuIFZCVVMgaXMgbm90IGNvbm5lY3RlZCB0byB0aGUgY29udHJvbGxlciwgeW91IGFs
c28gbmVlZCAKdG8gZ2V0IHRoZSB1c2Jfcm9sZV9ub25lIGZyb20gdGhlIHVzYi1yb2xlLXN3aXRj
aCB0byBjYXRjaCB0aGUgCnVuYXR0YWNoZWQgc3RhdGUgKGFsc28gaW4gUGVyaXBoZXJhbCBvciBI
b3N0IG9ubHkgbW9kZSkuCgo+IFsuLi5dCj4gQEAgLTUzMiw2ICs1MzQsMTMgQEAgc3RhdGljIGlu
dCBkd2MyX2RyaXZlcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlIAo+ICpkZXYpCj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGR3YzJfd3JpdGVsKGhzb3RnLCBnZ3Bpbywg
R0dQSU8pOwo+ICDCoMKgwqDCoMKgwqDCoMKgIH0KPiAKPiArwqDCoMKgwqDCoMKgIHJldHZhbCA9
IGR3YzJfZHJkX2luaXQoaHNvdGcpOwo+ICvCoMKgwqDCoMKgwqAgaWYgKHJldHZhbCkgewo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXR2YWwgIT0gLUVQUk9CRV9ERUZFUikK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2Vyciho
c290Zy0+ZGV2LCAiZmFpbGVkIHRvIGluaXRpYWxpemUgCj4gZHVhbC1yb2xlXG4iKTsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycm9yX2luaXQ7Cj4gK8KgwqDCoMKgwqDC
oCB9Cj4gKwo+ICDCoMKgwqDCoMKgwqDCoMKgIGlmIChoc290Zy0+ZHJfbW9kZSAhPSBVU0JfRFJf
TU9ERV9IT1NUKSB7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHZhbCA9
IGR3YzJfZ2FkZ2V0X2luaXQoaHNvdGcpOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAocmV0dmFsKQo+IEkgdGhpbmsgZHdjMl9kcml2ZXJfcHJvYmUoKSBuZWVkcyBhIG5l
dyBsYWJlbCAoZm9yIGV4YW1wbGUgbmFtZWQKPiBlcnJvcl9kcmQpIHdoaWNoIHRoZW4gY2FsbHMg
ZHdjMl9kcmRfZXhpdC4gU2VlIFswXSB3aGljaCBJIGhhdmUKPiBzdWJtaXR0ZWQgYXMgYSBwYXRj
aCBmb3IgTGludXggNS44LCBzbyBpdCdzIG5vdCBpbiB1c2ItbmV4dCB5ZXQuCj4gCgpJIGFncmVl
LgoKPiBBbHNvIGluIGdlbmVyYWwgSSB0aGluayB5b3UgbmVlZCB0byBzdWJtaXQgYSBkdC1iaW5k
aW5ncyBwYXRjaCB0aGF0Cj4gZG9jdW1lbnRzIHRoZSB1c2Itcm9sZS1zd2l0Y2ggcHJvcGVydHku
IFBlcnNvbmFsbHkgSSB3b3VsZCB1c2UKPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvdXNiL3JlbmVzYXMsdXNiMy1wZXJpLnlhbWwgYXMKPiByZWZlcmVuY2UgZm9yIHRoYXQuCj4g
CgpTdXJlLiBXaWxsIGJlIGRvbmUgaW4gVjIgd2l0aCBuZXcgbGFiZWwgZm9yIGRyZF9leGl0IGlu
IHByb2JlIGZhaWx1cmUgCnBhdGguIEknbGwgcmViYXNlIG15IHBhdGNoIG9uIHlvdXJzIHRvIGF2
b2lkIGNvbmZsaWN0cy4KCj4gQ2FuIHlvdSBwbGVhc2Uga2VlcCBtZSBDYydlZCBvbiBhIHYyIGJl
Y2F1c2UgSSdtIG5vdCBzdWJzY3JpYmVkIHRvIHRoZQo+IGxpbnV4LXVzYiBtYWlsaW5nIGxpc3Q/
CgpPSy4gVGhhbmtzIGZvciB5b3VyIHJldmlldyBhbmQgZnV0dXJlIHRlc3RzIQpSZWdhcmRzLApB
bWVsaWUKCj4gSSBhbSBnb2luZyB0byB0ZXN0IHRoaXMgb24gQW1sb2dpYyBTb0NzIC0gb25jZSBJ
IG1hZGUgImV2ZXJ5dGhpbmcgZWxzZSIKPiB3b3JrIEkgY2FuIGdpdmUgbXkgVGVzdGVkLWJ5IGFz
IHdlbGwuCj4gCj4gCj4gVGhhbmsgeW91IQo+IE1hcnRpbgo+IAo+IAo+IFswXSBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExNjQyOTU3LwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
