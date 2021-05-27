Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F8F39281D
	for <lists+linux-stm32@lfdr.de>; Thu, 27 May 2021 09:02:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCC39C57B5B;
	Thu, 27 May 2021 07:02:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78C03C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 May 2021 07:02:07 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14R6qG8u004364; Thu, 27 May 2021 09:01:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=m5LUVeVAx0H7+efdYUrqUWDIzqQfwVOfhaTcVb+GW5A=;
 b=ChTJS68yGPIcxkI0k67wVFxq00xNvLuS8K7qe1etRjlMXWmo2bBvZJubcW+JZRwJQ1e8
 5pglsZMtkeQYit0AJVLDoW0fcdlKRkj4erYa7Ne64IKNY1/szESr/sspaVFk/k6U+WCS
 5wJ5J48jIGynjdXiZ2/LlFAyY8Qhi5sYeSTY5pw42EC7FOXg3S4YpF0n/AgiasWp+jKn
 6to0oYcMhiEc1cntBw1eJM7+x7fiYUGTs/LQukcNJaL+nE7wSCi4HRmBlhFhUtyzKj7C
 58r6sF8Wcmv0FCEpedo26nYe4R+sj4fVvGEkBk8RL1+2DRUEx7UQX5qM4FnAx/PEUrv3 Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38t0x91mr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 May 2021 09:01:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C869610002A;
 Thu, 27 May 2021 09:01:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AE683212FC0;
 Thu, 27 May 2021 09:01:57 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 09:01:57 +0200
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20210526153016.32653-1-patrice.chotard@foss.st.com>
 <20210526174224.2b8714fc@xps13>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <bbfc7b31-c49c-e52d-0ea6-20ec81317cac@foss.st.com>
Date: Thu, 27 May 2021 09:01:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210526174224.2b8714fc@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-27_02:2021-05-26,
 2021-05-27 signatures=0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] mtd: spinand: add spi nand mtd resume handler
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

SGkgTWlxdWVsCgpPbiA1LzI2LzIxIDU6NDIgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGVs
bG8sCj4gCj4gPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4gd3JvdGUgb24gV2VkLCAyNiBN
YXkgMjAyMSAxNzozMDoxNiArMDIwMDoKPiAKPj4gRnJvbTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxj
aHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4gCj4gV291bGQgeW91IG1pbmQgdG8gdXNl
ICJhZGQgU1BJLU5BTkQgTVREIHJlc3VtZSBoYW5kbGVyIiBhcyB0aXRsZT8gKHdpdGgKPiB1cHBl
ciBjYXNlIGxldHRlcnMpCgpPawoKPiAKPj4gQWZ0ZXIgcG93ZXIgdXAsIGFsbCBTUEkgTkFORCdz
IGJsb2NrcyBhcmUgbG9ja2VkLiBPbmx5IHJlYWQgb3BlcmF0aW9ucwo+PiBhcmUgYWxsb3dlZCwg
d3JpdGUgYW5kIGVyYXNlIG9wZXJhdGlvbnMgYXJlIGZvcmJpZGRlbi4KPj4gVGhlIFNQSSBOQU5E
IGZyYW1ld29yayB1bmxvY2tzIGFsbCB0aGUgYmxvY2tzIGR1cmluZyBpdHMgaW5pdGlhbGl6YXRp
b24uCj4+Cj4+IER1cmluZyBhIHN0YW5kYnkgbG93IHBvd2VyLCB0aGUgbWVtb3J5IGlzIHBvd2Vy
ZWQgZG93biwgbG9zaW5nIGl0cwo+PiBjb25maWd1cmF0aW9uLgo+PiBEdXJpbmcgdGhlIHJlc3Vt
ZSwgdGhlIFFTUEkgZHJpdmVyIHN0YXRlIGlzIHJlc3RvcmVkIGJ1dCB0aGUgU1BJIE5BTkQKPj4g
ZnJhbWV3b3JrIGRvZXMgbm90IHJlY29uZmlndXJlZCB0aGUgbWVtb3J5Lgo+Pgo+PiBUaGlzIHBh
dGNoIGFkZHMgc3BpIG5hbmQgbXRkIFBNIGhhbmRsZXJzIGZvciByZXN1bWUgb3BzLgo+IAo+IGRp
dHRvICAgICAgICAgICAgIF5eXl5eXl5eXl5eXgoKT2sKCj4gCj4+IFNQSSBOQU5EIHJlc3VtZSBv
cCByZS1pbml0aWFsaXplcyBTUEkgTkFORCBmbGFzaCB0byBpdHMgcHJvYmVkIHN0YXRlLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0Bm
b3NzLnN0LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNo
b3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5j
IHwgNTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNo
YW5nZWQsIDU2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+PiBpbmRleCAxN2Y2
M2Y5NWY0YTIuLjZhYmFmODc0ZWIzZiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9z
cGkvY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+PiBAQCAtMTA3
NCw2ICsxMDc0LDYxIEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9kZXRlY3Qoc3RydWN0IHNwaW5hbmRf
ZGV2aWNlICpzcGluYW5kKQo+PiAgCXJldHVybiAwOwo+PiAgfQo+PiAgCj4+ICtzdGF0aWMgdm9p
ZCBzcGluYW5kX210ZF9yZXN1bWUoc3RydWN0IG10ZF9pbmZvICptdGQpCj4+ICt7Cj4+ICsJc3Ry
dWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kID0gbXRkX3RvX3NwaW5hbmQobXRkKTsKPj4gKwlz
dHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQgPSBtdGRfdG9fbmFuZGRldihtdGQpOwo+PiArCXN0cnVj
dCBkZXZpY2UgKmRldiA9ICZzcGluYW5kLT5zcGltZW0tPnNwaS0+ZGV2Owo+PiArCWludCByZXQs
IGk7Cj4+ICsKPj4gKwlyZXQgPSBzcGluYW5kX3Jlc2V0X29wKHNwaW5hbmQpOwo+PiArCWlmIChy
ZXQpCj4+ICsJCXJldHVybjsKPj4gKwo+PiArCXJldCA9IHNwaW5hbmRfaW5pdF9xdWFkX2VuYWJs
ZShzcGluYW5kKTsKPj4gKwlpZiAocmV0KSB7Cj4+ICsJCWRldl9lcnIoZGV2LAo+PiArCQkJIkZh
aWxlZCB0byBpbml0aWFsaXplIHRoZSBxdWFkIHBhcnQgKGVyciA9ICVkKVxuIiwKPiAKPiBxdWFk
IHBhcnQ/IHdoYXQgYWJvdXQgIkZhaWxlZCB0byByZXN1bWUgdGhlIHF1YWQgc3RhdGUiIG9yIHNv
bWV0aGluZwo+IGFsaWtlPwoKQWdyZWUsIGkgd2lsbCB1cGRhdGUgdGhpcwoKPiAKPj4gKwkJCXJl
dCk7Cj4+ICsJCXJldHVybjsKPj4gKwl9Cj4+ICsKPj4gKwlyZXQgPSBzcGluYW5kX3VwZF9jZmco
c3BpbmFuZCwgQ0ZHX09UUF9FTkFCTEUsIDApOwo+PiArCWlmIChyZXQpIHsKPj4gKwkJZGV2X2Vy
cihkZXYsCj4+ICsJCQkiRmFpbGVkIHRvIHVwZHRhZSB0aGUgT1RQIChlcnIgPSAlZClcbiIsCj4g
Cj4gdXBkYXRlCgpvawoKPiAKPj4gKwkJCXJldCk7Cj4+ICsJCXJldHVybjsKPj4gKwl9Cj4+ICsK
Pj4gKwlyZXQgPSBzcGluYW5kX21hbnVmYWN0dXJlcl9pbml0KHNwaW5hbmQpOwo+PiArCWlmIChy
ZXQpIHsKPj4gKwkJZGV2X2VycihkZXYsCj4+ICsJCQkiRmFpbGVkIHRvIGluaXRpYWxpemUgdGhl
IFNQSSBOQU5EIGNoaXAgKGVyciA9ICVkKVxuIiwKPj4gKwkJCXJldCk7Cj4+ICsJCXJldHVybjsK
Pj4gKwl9Cj4+ICsKPj4gKwkvKiBBZnRlciBwb3dlciB1cCwgYWxsIGJsb2NrcyBhcmUgbG9ja2Vk
LCBzbyB1bmxvY2sgdGhlbSBoZXJlLiAqLwo+PiArCWZvciAoaSA9IDA7IGkgPCBuYW5kLT5tZW1v
cmcubnRhcmdldHM7IGkrKykgewo+PiArCQlyZXQgPSBzcGluYW5kX3NlbGVjdF90YXJnZXQoc3Bp
bmFuZCwgaSk7Cj4+ICsJCWlmIChyZXQpIHsKPj4gKwkJCWRldl9lcnIoZGV2LAo+PiArCQkJCSJG
YWlsZWQgdG8gc2VsZWN0IHRoZSB0YXJnZXQgKGVyciA9ICVkKVxuIiwKPj4gKwkJCQlyZXQpOwo+
PiArCQkJcmV0dXJuOwo+PiArCQl9Cj4+ICsKPj4gKwkJcmV0ID0gc3BpbmFuZF9sb2NrX2Jsb2Nr
KHNwaW5hbmQsIEJMX0FMTF9VTkxPQ0tFRCk7Cj4+ICsJCWlmIChyZXQpIHsKPj4gKwkJCWRldl9l
cnIoZGV2LAo+PiArCQkJCSJGYWlsZWQgdG8gdW5sb2NrIGJsb2NrIChlcnIgPSAlZClcbiIsCj4+
ICsJCQkJcmV0KTsKPj4gKwkJCXJldHVybjsKPj4gKwkJfQo+PiArCX0KPiAKPiBJIGJldCB0aGlz
IHdvdWxkIGRlc2VydmUgYSBoZWxwZXIgYXMgdGhpcyBpcyB0aGUgZXhhY3Qgc2FtZSBwZWFjZSBv
Zgo+IGNvZGUgdGhhdCBpcyBiZWluZyBydW4gaW4gc3Bpbm5hbmRfaW5pdCgpPwoKSSB3aWxsIGFk
ZCBhIG5ldyBmdW5jdGlvbiBzcGluYW5kX2Jsb2NrX3VubG9jayhzdHJ1Y3Qgc3BpbmFuZF9kZXZp
Y2UgKnNwaW5hbmQpCgo+IAo+IEF0IHRoZSB2ZXJ5IGxlYXN0IEkgdGhpbmsgdGhhdCBzcGluYW5k
X2VjY19lbmFibGUoc3BpbmFuZCwgZmFsc2UpOwo+IHNob3VsZCBiZSBjYWxsZWQuCkkgd2lsbCBh
ZGQgaXQuIAoKPiAKPiBJZGVhbGx5LCBhIHJlc3VtZSBvcGVyYXRpb24gc2hvdWxkIGJlIHByb3Zp
ZGVkIGJ5IEVDQyBlbmdpbmVzLCBidXQgdGhhdAo+IGNhbiBiZSBhZGRlZCBsYXRlci4KPiAKPj4g
K30KPj4gKwo+PiAgc3RhdGljIGludCBzcGluYW5kX2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNl
ICpzcGluYW5kKQo+PiAgewo+PiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZzcGluYW5kLT5zcGlt
ZW0tPnNwaS0+ZGV2Owo+PiBAQCAtMTE2Nyw2ICsxMjIyLDcgQEAgc3RhdGljIGludCBzcGluYW5k
X2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+PiAgCW10ZC0+X2Jsb2NrX2lz
cmVzZXJ2ZWQgPSBzcGluYW5kX210ZF9ibG9ja19pc3Jlc2VydmVkOwo+PiAgCW10ZC0+X2VyYXNl
ID0gc3BpbmFuZF9tdGRfZXJhc2U7Cj4+ICAJbXRkLT5fbWF4X2JhZF9ibG9ja3MgPSBuYW5kZGV2
X210ZF9tYXhfYmFkX2Jsb2NrczsKPj4gKwltdGQtPl9yZXN1bWUgPSBzcGluYW5kX210ZF9yZXN1
bWU7Cj4+ICAKPj4gIAlpZiAobmFuZC0+ZWNjLmVuZ2luZSkgewo+PiAgCQlyZXQgPSBtdGRfb29i
bGF5b3V0X2NvdW50X2ZyZWVieXRlcyhtdGQpOwo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gClRo
YW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
