Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF506372667
	for <lists+linux-stm32@lfdr.de>; Tue,  4 May 2021 09:16:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58DFCC59784;
	Tue,  4 May 2021 07:16:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 544CAC59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 May 2021 07:16:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1447CW2p009695; Tue, 4 May 2021 09:16:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=afUJ1/rQV4J1imx9Ghnfc7q+Lf/2kuHrWmKNabgOpLc=;
 b=nVaOHo3EnC0GDJ4dz7Yk7Zf1o4ABe2v755RO3PqIg1ok0rjh86+n1yJOrakIBJMOHeti
 0N+e9sS1fA+zO05mQK2oABqVCjXq33C69KQt0epK/VDs3WjXEa7eLuJ9+wvoP42xHxDY
 dguu3aAuJjz4SizwDvJsGV6G6LyfFQCQE7o8tO1V0sfafkDkMFNN4AzWG/76DQyUcpSR
 sw5VMFQxRyjRsPoH9PEKhxbaOVEkOcufj9Q1C86br/hw5hCLH/eojaA4E7pIYYpj1Bkm
 faknIItrA77RSQVs2gV9nqkdYZLwKZJ2aljbS0fxsfGdD35lTZbXGCxRjYDpvbPOyxjT Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38ar8djn9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 09:16:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0AF5A10002A;
 Tue,  4 May 2021 09:16:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EDF4520E5DD;
 Tue,  4 May 2021 09:16:11 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 4 May
 2021 09:16:11 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20210429080639.6379-1-arnaud.pouliquen@foss.st.com>
 <20210503174238.GD1699665@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <b2f6b9ca-9dc2-920b-941d-175779bc1034@foss.st.com>
Date: Tue, 4 May 2021 09:16:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210503174238.GD1699665@xps15>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_02:2021-05-04,
 2021-05-04 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] rpmsg: char: Remove useless includes
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGVsbG8gTWF0aGlldSwKCk9uIDUvMy8yMSA3OjQyIFBNLCBNYXRoaWV1IFBvaXJpZXIgd3JvdGU6
Cj4gT24gVGh1LCBBcHIgMjksIDIwMjEgYXQgMTA6MDY6MzlBTSArMDIwMCwgQXJuYXVkIFBvdWxp
cXVlbiB3cm90ZToKPj4gUmVtb3ZlIGluY2x1ZGVzIHRoYXQgYXJlIG5vdCByZXF1ZXN0ZWQgdG8g
YnVpbGQgdGhlIG1vZHVsZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQXJuYXVkIFBvdWxpcXVlbiA8
YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+IGFwcGxpZWQgd2l0aG91dCBp
c3N1ZSBvbiBCam9ybiBuZXh0IGJyYW5jaCAoZGMwZTE0ZmE4MzNiKQo+PiAtLS0KPj4gIGRyaXZl
cnMvcnBtc2cvcnBtc2dfY2hhci5jIHwgOSAtLS0tLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA5
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ycG1zZy9ycG1zZ19jaGFy
LmMgYi9kcml2ZXJzL3JwbXNnL3JwbXNnX2NoYXIuYwo+PiBpbmRleCAyYmViYzliMmQxNjMuLmU0
ZTU0ZjUxNWFmNiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ycG1zZy9ycG1zZ19jaGFyLmMKPj4g
KysrIGIvZHJpdmVycy9ycG1zZy9ycG1zZ19jaGFyLmMKPj4gQEAgLTEwLDE5ICsxMCwxMCBAQAo+
PiAgICogd2FzIGJhc2VkIG9uIFRJICYgR29vZ2xlIE9NWCBycG1zZyBkcml2ZXIuCj4+ICAgKi8K
Pj4gICNpbmNsdWRlIDxsaW51eC9jZGV2Lmg+Cj4+IC0jaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+
Cj4gCj4gVGhpcyBpcyB3aGVyZSB0aGUgZGVjbGFyYXRpb24gZm9yIHN0cnVjdCBkZXZpY2UgaXMg
YWxvbmcgd2l0aCBvdGhlciBnb29kaWVzIGxpa2UKPiBnZXQvcHV0X2RldmljZSgpLgo+IAo+PiAt
I2luY2x1ZGUgPGxpbnV4L2ZzLmg+Cj4gCj4gVGhhdCBpcyB3aGVyZSBzdHJ1Y3QgZmlsZSBpcyBk
ZWNsYXJlZC4KPiAKPj4gLSNpbmNsdWRlIDxsaW51eC9pZHIuaD4KPiAKPiBUaGlzIGlzIHdoZXJl
IHlvdSBnZXQgaWRhX3NpbXBsZV9nZXQoKSBhbmQgaWRhX3NpbXBsZV9yZW1vdmUoKSBmcm9tLgo+
IAo+PiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+PiAgI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPgo+PiAtI2luY2x1ZGUgPGxpbnV4L3BvbGwuaD4KPiAKPiBUaGlzIGlzIHdoZXJlIHN0cnVj
dCBwb2xsX3RhYmxlIGFuZCBwb2xsX3dhaXQoKSBjb21lcyBmcm9tLgo+IAo+PiAgI2luY2x1ZGUg
PGxpbnV4L3JwbXNnLmg+Cj4+ICAjaW5jbHVkZSA8bGludXgvc2tidWZmLmg+Cj4+IC0jaW5jbHVk
ZSA8bGludXgvc2xhYi5oPgo+IAo+IFRoaXMgZ2l2ZXMgeW91IGt6YWxsb2MoKSBhbmQga2ZyZWUo
KS4KPiAKPj4gLSNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4gCj4gVGhpcyBnaXZlcyB5b3Ug
Y29weV9mcm9tX3VzZXIoKS4KPiAKPj4gLSNpbmNsdWRlIDx1YXBpL2xpbnV4L3JwbXNnLmg+Cj4g
Cj4gVGhpcyBnaXZlcyB5b3UgUlBNU0dfQ1JFQVRFX0VQVF9JT0NUTCBhbmQgUlBNU0dfREVTVFJP
WV9FUFRfSU9DVEwuCj4gCj4+IC0KPj4gLSNpbmNsdWRlICJycG1zZ19pbnRlcm5hbC5oIgo+IAo+
IFRoYXQgb25lIEkgYWdyZWUgd2l0aC4KCkkgc3RhcnRlZCBieSB0aGlzIG9uZSBhbmQgdGhlbiBJ
IGdvdCBjYXJyaWVkIGF3YXkgdGVzdGVkIHRoZSBvdGhlciBpbmNsdWRlLi4uCllvdSBhcmUgcmln
aHQsIEkganVzdCBkb24ndCBmb2xsb3cgaGVyIHRoZSBmaXJzdCBydWxlIG9mIHRoZSAic3VibWl0
IGNoZWNrbGlzdCIKCiJJZiB5b3UgdXNlIGEgZmFjaWxpdHkgdGhlbiAjaW5jbHVkZSB0aGUgZmls
ZSB0aGF0IGRlZmluZXMvZGVjbGFyZXMgdGhhdApmYWNpbGl0eS4gRG9u4oCZdCBkZXBlbmQgb24g
b3RoZXIgaGVhZGVyIGZpbGVzIHB1bGxpbmcgaW4gb25lcyB0aGF0IHlvdSB1c2UuIgoKVGhhdCBz
YWlkIEkganVzdCBoYXZlIGEgZG91YnQgZm9yIHVhcGkvbGludXgvcnBtc2cuaCB0aGF0IHdpbGwg
YmUgaW5jbHVkZQpieSBycG1zZy5oWzJdLCBhcyB0aGVzZSBpbmNsdWRlcyBhcmUgcGFydCBvZiB0
aGUgcnBtc2cgZnJhbWV3b3JrIEFQSSwgc2hvdWxkIHdlCmtlZXAgYm90aCwgY29uc2lkZXJpbmcg
dGhlIHJ1bGUgYXMgc3RyaWN0PwoKWzFdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwv
bGF0ZXN0L3Byb2Nlc3Mvc3VibWl0LWNoZWNrbGlzdC5odG1sClsyXQpodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcmVtb3RlcHJvYy9wYXRjaC8yMDIxMDMxMTE0MDQx
My4zMTcyNS0zLWFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20vCgpUaGFua3MsCkFybmF1ZAoK
PiAKPiBUaGFua3MsCj4gTWF0aGlldQo+IAo+PiAgCj4+ICAjZGVmaW5lIFJQTVNHX0RFVl9NQVgJ
KE1JTk9STUFTSyArIDEpCj4+ICAKPj4gLS0gCj4+IDIuMTcuMQo+PgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
