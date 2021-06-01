Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3203139714A
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Jun 2021 12:20:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89C93C57B5A;
	Tue,  1 Jun 2021 10:20:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18A79C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jun 2021 10:20:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151A7eWx009015; Tue, 1 Jun 2021 12:19:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : subject : to
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=fp2rZiFbJHmMj1veiCA0AXV7LlRmE6SizObFbCHhGkA=;
 b=FFFM2iPg4Q9bxynK+9dR80EmiV2uHj+aet/XcDds3uP6mdMYETCEvRVtIXbBe7tR/3cd
 AMT2bhhFWcZE9g9Cv/XTl8DUFdTFUfm2BNJ3tMQoQaAJtMDJ8suFZYEYsIWtPqNKYbJ4
 +sPdFtVHTdgFVeV3atGgo+tYwf/AOtGxR1xOhfPObtTV4pHEAfCwYFLT+Rw36sUB5p9B
 bWGyDw5xpR8k87ndn531lQOg1NfSA+LQEejGAei0gWf+ri/RceiVeLyYrrNu46cI4jtH
 /GTAt3wgNy3FhqOyZaTgrsT+uRj8gIh6qMZc0d0uvuFQexGy7rfEhbm93AGG+LB7w0Y4 BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38wjdg080t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 12:19:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 73DA110002A;
 Tue,  1 Jun 2021 12:19:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57BDA21B330;
 Tue,  1 Jun 2021 12:19:53 +0200 (CEST)
Received: from lmecxl0993.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 1 Jun
 2021 12:19:52 +0200
From: Philippe CORNU <philippe.cornu@foss.st.com>
To: yannick Fertre <yannick.fertre@foss.st.com>, Antonio Borneo
 <antonio.borneo@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@st.com>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Marek Vasut" <marex@denx.de>
References: <20210528080513.8168-1-yannick.fertre@foss.st.com>
 <7f99af28-f4ef-303b-2844-89dc266d1ace@foss.st.com>
Message-ID: <d5ed22bc-3c28-f8a0-946b-6c82c16f03e1@foss.st.com>
Date: Tue, 1 Jun 2021 12:19:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7f99af28-f4ef-303b-2844-89dc266d1ace@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_05:2021-05-31,
 2021-06-01 signatures=0
Subject: Re: [Linux-stm32] [PATCH] drm/stm: Remove usage of
	drm_display_mode_to_videomode()
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

SGkgTWFyZWssCgpNYW55IHRoYW5rcyBmb3IgeW91ciBwYXRjaCBhbmQgc29ycnkgZm9yIHRoZSBk
ZWxheSByZWdhcmRpbmcgdGhpcyAibGFzdCAKQ2hyaXN0bWFzIiBwYXRjaCAoRGVjLiAyNCwgMjAy
MCksIGxvc3QgaW4gbXkgaW5ib3ggOigKCkNvdWxkIHlvdSBwbGVhc2UgcmVzZW5kIGl0IChhcyBJ
IGRpZCBub3Qgc3VjY2VlZCB0byBhcHBseSBpdCBkaXJlY3RseSk/CgpwYXRjaHdvcmsgcmVmZXJl
bmNlIApodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvNDA5OTY4Lz9zZXJp
ZXM9ODUyMjIKCk1hbnkgdGhhbmtzLApQaGlsaXBwZSA6LSkKCgpPbiA1LzI4LzIxIDQ6MDEgUE0s
IHlhbm5pY2sgRmVydHJlIHdyb3RlOgo+IAo+IEhpIFBoaWxpcHBlLAo+IEkgaGF2ZSBhbHJlYWR5
IHJldmlld2VkIHRoaXMgcGF0Y2ggb24gSmFudWFyeSA3LCAyMDIwLgo+IChodHRwczovL2xvcmUu
a2VybmVsLm9yZy9kcmktZGV2ZWwvMGFiNGVlNDUtNDQzNy0zYjAyLWNmNjMtMGUzYjFiNTM5MjBm
QHN0LmNvbS8pIAo+IAo+IENvdWxkIHlvdSBwbGVhc2UgcmV2aWV3IGl0IGFuZCBtZXJnZSBpdD8K
PiAKPiBCZXN0IHJlZ2FyZHMKPiAKPiBZYW5uaWNrCj4gCj4gT24gNS8yOC8yMSAxMDowNSBBTSwg
WWFubmljayBGZXJ0cmUgd3JvdGU6Cj4+IFRoZXJlIGlzIG5vdCBtdWNoIHZhbHVlIGluIHRoZSBl
eHRyYSBjb252ZXJzaW9uIHN0ZXAsIHRoZSBjYWxjdWxhdGlvbnMKPj4gcmVxdWlyZWQgZm9yIHRo
ZSBMVERDIElQIGFyZSBkaWZmZXJlbnQgdGhhbiB3aGF0IGlzIHVzZWQgaW4gdGhlCj4+IGRybV9k
aXNwbGF5X21vZGVfdG9fdmlkZW9tb2RlKCksIHNvIGp1c3QgZG8gdGhlIHJpZ2h0IG9uZXMgaW4g
dGhlIExUREMKPj4gZHJpdmVyIHJpZ2h0IGF3YXkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVr
IFZhc3V0IDxtYXJleEBkZW54LmRlPgo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyZSA8
eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0v
c3RtL2x0ZGMuYyB8IDMyICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVycy9ncHUvZHJtL3N0
bS9sdGRjLmMKPj4gaW5kZXggZTk5NzcxYjk0N2I2Li5kMTEzYjliZTEyYzAgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9z
dG0vbHRkYy5jCj4+IEBAIC01NzAsMzEgKzU3MCwzMyBAQCBzdGF0aWMgdm9pZCBsdGRjX2NydGNf
bW9kZV9zZXRfbm9mYihzdHJ1Y3QgCj4+IGRybV9jcnRjICpjcnRjKQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgfQo+PiDCoMKgwqDCoMKgIH0KPj4gLcKgwqDCoCBkcm1fZGlzcGxheV9tb2RlX3RvX3Zp
ZGVvbW9kZShtb2RlLCAmdm0pOwo+PiAtCj4+IMKgwqDCoMKgwqAgRFJNX0RFQlVHX0RSSVZFUigi
Q1JUQzolZCBtb2RlOiVzXG4iLCBjcnRjLT5iYXNlLmlkLCBtb2RlLT5uYW1lKTsKPj4gLcKgwqDC
oCBEUk1fREVCVUdfRFJJVkVSKCJWaWRlbyBtb2RlOiAlZHglZCIsIHZtLmhhY3RpdmUsIHZtLnZh
Y3RpdmUpOwo+PiArwqDCoMKgIERSTV9ERUJVR19EUklWRVIoIlZpZGVvIG1vZGU6ICVkeCVkIiwg
bW9kZS0+aGRpc3BsYXksIAo+PiBtb2RlLT52ZGlzcGxheSk7Cj4+IMKgwqDCoMKgwqAgRFJNX0RF
QlVHX0RSSVZFUigiIGhmcCAlZCBoYnAgJWQgaHNsICVkIHZmcCAlZCB2YnAgJWQgdnNsICVkXG4i
LAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZtLmhmcm9udF9wb3JjaCwgdm0uaGJhY2tf
cG9yY2gsIHZtLmhzeW5jX2xlbiwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2bS52ZnJv
bnRfcG9yY2gsIHZtLnZiYWNrX3BvcmNoLCB2bS52c3luY19sZW4pOwo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG1vZGUtPmhzeW5jX3N0YXJ0IC0gbW9kZS0+aGRpc3BsYXksCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbW9kZS0+aHRvdGFsIC0gbW9kZS0+aHN5bmNfZW5kLAo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vZGUtPmhzeW5jX2VuZCAtIG1vZGUtPmhzeW5jX3N0
YXJ0LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vZGUtPnZzeW5jX3N0YXJ0IC0gbW9k
ZS0+dmRpc3BsYXksCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbW9kZS0+dnRvdGFsIC0g
bW9kZS0+dnN5bmNfZW5kLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vZGUtPnZzeW5j
X2VuZCAtIG1vZGUtPnZzeW5jX3N0YXJ0KTsKPj4gwqDCoMKgwqDCoCAvKiBDb252ZXJ0IHZpZGVv
IHRpbWluZ3MgdG8gbHRkYyB0aW1pbmdzICovCj4+IC3CoMKgwqAgaHN5bmMgPSB2bS5oc3luY19s
ZW4gLSAxOwo+PiAtwqDCoMKgIHZzeW5jID0gdm0udnN5bmNfbGVuIC0gMTsKPj4gLcKgwqDCoCBh
Y2N1bV9oYnAgPSBoc3luYyArIHZtLmhiYWNrX3BvcmNoOwo+PiAtwqDCoMKgIGFjY3VtX3ZicCA9
IHZzeW5jICsgdm0udmJhY2tfcG9yY2g7Cj4+IC3CoMKgwqAgYWNjdW1fYWN0X3cgPSBhY2N1bV9o
YnAgKyB2bS5oYWN0aXZlOwo+PiAtwqDCoMKgIGFjY3VtX2FjdF9oID0gYWNjdW1fdmJwICsgdm0u
dmFjdGl2ZTsKPj4gLcKgwqDCoCB0b3RhbF93aWR0aCA9IGFjY3VtX2FjdF93ICsgdm0uaGZyb250
X3BvcmNoOwo+PiAtwqDCoMKgIHRvdGFsX2hlaWdodCA9IGFjY3VtX2FjdF9oICsgdm0udmZyb250
X3BvcmNoOwo+PiArwqDCoMKgIGhzeW5jID0gbW9kZS0+aHN5bmNfZW5kIC0gbW9kZS0+aHN5bmNf
c3RhcnQgLSAxOwo+PiArwqDCoMKgIHZzeW5jID0gbW9kZS0+dnN5bmNfZW5kIC0gbW9kZS0+dnN5
bmNfc3RhcnQgLSAxOwo+PiArwqDCoMKgIGFjY3VtX2hicCA9IG1vZGUtPmh0b3RhbCAtIG1vZGUt
PmhzeW5jX3N0YXJ0IC0gMTsKPj4gK8KgwqDCoCBhY2N1bV92YnAgPSBtb2RlLT52dG90YWwgLSBt
b2RlLT52c3luY19zdGFydCAtIDE7Cj4+ICvCoMKgwqAgYWNjdW1fYWN0X3cgPSBhY2N1bV9oYnAg
KyBtb2RlLT5oZGlzcGxheTsKPj4gK8KgwqDCoCBhY2N1bV9hY3RfaCA9IGFjY3VtX3ZicCArIG1v
ZGUtPnZkaXNwbGF5Owo+PiArwqDCoMKgIHRvdGFsX3dpZHRoID0gbW9kZS0+aHRvdGFsIC0gMTsK
Pj4gK8KgwqDCoCB0b3RhbF9oZWlnaHQgPSBtb2RlLT52dG90YWwgLSAxOwo+PiDCoMKgwqDCoMKg
IC8qIENvbmZpZ3VyZXMgdGhlIEhTLCBWUywgREUgYW5kIFBDIHBvbGFyaXRpZXMuIERlZmF1bHQg
QWN0aXZlIAo+PiBMb3cgKi8KPj4gwqDCoMKgwqDCoCB2YWwgPSAwOwo+PiAtwqDCoMKgIGlmICh2
bS5mbGFncyAmIERJU1BMQVlfRkxBR1NfSFNZTkNfSElHSCkKPj4gK8KgwqDCoCBpZiAobW9kZS0+
ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX1BIU1lOQykKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHZhbCB8
PSBHQ1JfSFNQT0w7Cj4+IC3CoMKgwqAgaWYgKHZtLmZsYWdzICYgRElTUExBWV9GTEFHU19WU1lO
Q19ISUdIKQo+PiArwqDCoMKgIGlmIChtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfUFZTWU5D
KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsIHw9IEdDUl9WU1BPTDsKPj4gwqDCoMKgwqDCoCBp
ZiAoYnVzX2ZsYWdzICYgRFJNX0JVU19GTEFHX0RFX0xPVykKPj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
