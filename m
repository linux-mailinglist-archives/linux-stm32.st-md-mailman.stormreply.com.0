Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A40A74AC558
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 17:19:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A53CC5F1E6;
	Mon,  7 Feb 2022 16:19:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D027BC5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 16:19:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 214Ebxgf011945;
 Fri, 4 Feb 2022 16:42:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=1UBZ1HQMJGwj58sI+h9K8wE/T4Yj+VGIcEnThWRmLs0=;
 b=SZHUpTBe91uhtNz4Yw90DSS8oqBMB7FjuBQ8DhYZ5x4JUwaJ0mXFa9k/V/eHMHgjqcdg
 9pRCScPVnSVPxWOa4G3e01SM9nM/NV7UkPf6axX0kh9p/kL8pdN1WtJzUOpM8MKZ69E/
 lI/RdxoXOKTCDXzRQowACfiHc3HtGBwy/UnpJDmWRTbuDYnsNq2ZfxnWLIc5O6TbfVrG
 F8oQ4brpgyz8d5pZUQuO4hAM7z7SY3nZC5e3u9zE5zyXLKngQ08gg+Lp9S2yTxJ+WfCA
 8EagOzRcZ6LLc/Pbc9zpJGr4phBQdsy/zVUM+XECpDRYENAtthnmpjP/3Xhag2sH0+MC SQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e0ejjew8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 16:42:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE4BD10002A;
 Fri,  4 Feb 2022 16:41:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E59B9229A8C;
 Fri,  4 Feb 2022 16:41:59 +0100 (CET)
Received: from lmecxl0566.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 4 Feb
 2022 16:41:59 +0100
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220203171644.12231-1-erwan.leray@foss.st.com>
 <20220203171644.12231-2-erwan.leray@foss.st.com>
 <CAHp75VfxGj=3mKvjcRpQjyXBCM0szsidHVuJGdAL8yP5SmdBzw@mail.gmail.com>
From: Erwan LE RAY <erwan.leray@foss.st.com>
Message-ID: <cb09a49a-37f8-9e3f-168c-4c5dd62e2c07@foss.st.com>
Date: Fri, 4 Feb 2022 16:41:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfxGj=3mKvjcRpQjyXBCM0szsidHVuJGdAL8yP5SmdBzw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_07,2022-02-03_01,2021-12-02_01
Cc: "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gerald Baeza <gerald.baeza@st.com>, Jiri Slaby <jirislaby@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] serial: mctrl_gpio: add a new API to
 enable / disable wake_irq
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

SGkgQW5keSwKCk9uIDIvNC8yMiAxMDowNyBBTSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IAo+
IAo+IE9uIFRodXJzZGF5LCBGZWJydWFyeSAzLCAyMDIyLCBFcndhbiBMZSBSYXkgPGVyd2FuLmxl
cmF5QGZvc3Muc3QuY29tIAo+IDxtYWlsdG86ZXJ3YW4ubGVyYXlAZm9zcy5zdC5jb20+PiB3cm90
ZToKPiAKPiAgICAgQWRkIGEgbmV3IEFQSSB0byBlbmFibGUgLyBkaXNhYmxlIHdha2VfaXJxIGlu
IG9yZGVyIHRvIGVuYWJsZSBncGlvCj4gICAgIGlycXMgYXMKPiAgICAgd2FrZXVwIGlycXMgZm9y
IHRoZSB1YXJ0IHBvcnQuCj4gCj4gICAgIFNpZ25lZC1vZmYtYnk6IEVyd2FuIExlIFJheSA8ZXJ3
YW4ubGVyYXlAZm9zcy5zdC5jb20KPiAgICAgPG1haWx0bzplcndhbi5sZXJheUBmb3NzLnN0LmNv
bT4+Cj4gCj4gICAgIGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsX21jdHJs
X2dwaW8uYwo+ICAgICBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxfbWN0cmxfZ3Bpby5jCj4g
ICAgIGluZGV4IGM0MWQ4OTExY2U5NS4uMTY2M2IzYWZjM2EwIDEwMDY0NAo+ICAgICAtLS0gYS9k
cml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsX21jdHJsX2dwaW8uYwo+ICAgICArKysgYi9kcml2ZXJz
L3R0eS9zZXJpYWwvc2VyaWFsX21jdHJsX2dwaW8uYwo+ICAgICBAQCAtMjk5LDQgKzI5OSw0MiBA
QCB2b2lkIG1jdHJsX2dwaW9fZGlzYWJsZV9tcyhzdHJ1Y3QgbWN0cmxfZ3Bpb3MKPiAgICAgKmdw
aW9zKQo+ICAgICAgwqB9Cj4gICAgICDCoEVYUE9SVF9TWU1CT0xfR1BMKG1jdHJsX2dwaW9fZGlz
YWJsZV9tcyk7Cj4gCj4gICAgICt2b2lkIG1jdHJsX2dwaW9fZW5hYmxlX2lycV93YWtlKHN0cnVj
dCBtY3RybF9ncGlvcyAqZ3Bpb3MpCj4gICAgICt7Cj4gICAgICvCoCDCoCDCoCDCoGVudW0gbWN0
cmxfZ3Bpb19pZHggaTsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqBpZiAoIWdwaW9zKQo+ICAg
ICArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm47Cj4gICAgICsKPiAgICAgK8KgIMKgIMKg
IMKgaWYgKCFncGlvcy0+bWN0cmxfb24pCj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
dHVybjsKPiAgICAgKwo+ICAgICArwqAgwqAgwqAgwqBmb3IgKGkgPSAwOyBpIDwgVUFSVF9HUElP
X01BWDsgKytpKSB7Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmICghZ3Bpb3MtPmly
cVtpXSkKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29udGludWU7
Cj4gCj4gCj4gCj4gV2h5IG5vdCBzaW1wbHkKPiAKPiAgwqAgaWYgKGdwaW9zW10pCj4gIMKgIMKg
IGVuYWJsZV9pcnFfLi4uCj4gCj4gPwo+IAo+IEFuZCBzYW1lIGZvciBkaXNhYmxpbmcuCj4gCj4g
ICAgICsKPiAgICAgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZW5hYmxlX2lycV93YWtlKGdwaW9z
LT5pcnFbaV0pOwo+ICAgICArwqAgwqAgwqAgwqB9Cj4gICAgICt9Cj4gICAgICtFWFBPUlRfU1lN
Qk9MX0dQTChtY3RybF9ncGlvX2VuYWJsZV9pcnFfd2FrZSk7Cj4gICAgICsKPiAgICAgK3ZvaWQg
bWN0cmxfZ3Bpb19kaXNhYmxlX2lycV93YWtlKHN0cnVjdCBtY3RybF9ncGlvcyAqZ3Bpb3MpCj4g
ICAgICt7Cj4gICAgICvCoCDCoCDCoCDCoGVudW0gbWN0cmxfZ3Bpb19pZHggaTsKPiAgICAgKwo+
ICAgICArwqAgwqAgwqAgwqBpZiAoIWdwaW9zKQo+ICAgICArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqByZXR1cm47Cj4gICAgICsKPiAgICAgK8KgIMKgIMKgIMKgaWYgKCFncGlvcy0+bWN0cmxfb24p
Cj4gICAgICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybjsKPiAgICAgKwo+ICAgICArwqAg
wqAgwqAgwqBmb3IgKGkgPSAwOyBpIDwgVUFSVF9HUElPX01BWDsgKytpKSB7Cj4gICAgICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGlmICghZ3Bpb3MtPmlycVtpXSkKPiAgICAgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29udGludWU7Cj4gICAgICsKPiAgICAgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZGlzYWJsZV9pcnFfd2FrZShncGlvcy0+aXJxW2ldKTsKPiAgICAgK8Kg
IMKgIMKgIMKgfQo+ICAgICArfQo+ICAgICArRVhQT1JUX1NZTUJPTF9HUEwobWN0cmxfZ3Bpb19k
aXNhYmxlX2lycV93YWtlKTsKPiAgICAgKwo+ICAgICAgwqBNT0RVTEVfTElDRU5TRSgiR1BMIik7
Cj4gICAgIGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsX21jdHJsX2dwaW8u
aAo+ICAgICBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxfbWN0cmxfZ3Bpby5oCj4gICAgIGlu
ZGV4IGIxMzRhMGZmYzg5NC4uZmM3NjkxMGZiMTA1IDEwMDY0NAo+ICAgICAtLS0gYS9kcml2ZXJz
L3R0eS9zZXJpYWwvc2VyaWFsX21jdHJsX2dwaW8uaAo+ICAgICArKysgYi9kcml2ZXJzL3R0eS9z
ZXJpYWwvc2VyaWFsX21jdHJsX2dwaW8uaAo+ICAgICBAQCAtOTEsNiArOTEsMTYgQEAgdm9pZCBt
Y3RybF9ncGlvX2VuYWJsZV9tcyhzdHJ1Y3QgbWN0cmxfZ3Bpb3MgKmdwaW9zKTsKPiAgICAgIMKg
ICovCj4gICAgICDCoHZvaWQgbWN0cmxfZ3Bpb19kaXNhYmxlX21zKHN0cnVjdCBtY3RybF9ncGlv
cyAqZ3Bpb3MpOwo+IAo+ICAgICArLyoKPiAgICAgKyAqIEVuYWJsZSBncGlvIHdha2V1cCBpbnRl
cnJ1cHRzIHRvIGVuYWJsZSB3YWtlIHVwIHNvdXJjZS4KPiAgICAgKyAqLwo+ICAgICArdm9pZCBt
Y3RybF9ncGlvX2VuYWJsZV9pcnFfd2FrZShzdHJ1Y3QgbWN0cmxfZ3Bpb3MgKmdwaW9zKTsKPiAg
ICAgKwo+ICAgICArLyoKPiAgICAgKyAqIERpc2FibGUgZ3BpbyB3YWtldXAgaW50ZXJydXB0cyB0
byBlbmFibGUgd2FrZSB1cCBzb3VyY2UuCj4gICAgICsgKi8KPiAgICAgK3ZvaWQgbWN0cmxfZ3Bp
b19kaXNhYmxlX2lycV93YWtlKHN0cnVjdCBtY3RybF9ncGlvcyAqZ3Bpb3MpOwo+ICAgICArCj4g
ICAgICDCoCNlbHNlIC8qIEdQSU9MSUIgKi8KPiAKPiAgICAgIMKgc3RhdGljIGlubGluZQo+ICAg
ICBAQCAtMTQyLDYgKzE1MiwxNCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbWN0cmxfZ3Bpb19kaXNh
YmxlX21zKHN0cnVjdAo+ICAgICBtY3RybF9ncGlvcyAqZ3Bpb3MpCj4gICAgICDCoHsKPiAgICAg
IMKgfQo+IAo+ICAgICArc3RhdGljIGlubGluZSB2b2lkIG1jdHJsX2dwaW9fZW5hYmxlX2lycV93
YWtlKHN0cnVjdCBtY3RybF9ncGlvcwo+ICAgICAqZ3Bpb3MpCj4gICAgICt7Cj4gICAgICt9Cj4g
ICAgICsKPiAgICAgK3N0YXRpYyBpbmxpbmUgdm9pZCBtY3RybF9ncGlvX2Rpc2FibGVfaXJxX3dh
a2Uoc3RydWN0IG1jdHJsX2dwaW9zCj4gICAgICpncGlvcykKPiAgICAgK3sKPiAgICAgK30KPiAg
ICAgKwo+ICAgICAgwqAjZW5kaWYgLyogR1BJT0xJQiAqLwo+IAo+ICAgICAgwqAjZW5kaWYKPiAg
ICAgLS0gCj4gICAgIDIuMTcuMQo+IAo+IAo+IAo+IC0tIAo+IFdpdGggQmVzdCBSZWdhcmRzLAo+
IEFuZHkgU2hldmNoZW5rbwo+IAo+IAoKVGhhbmtzIGZvciB5b3VyIHJldmlldy4KSSBmdWxseSBh
Z3JlZSB3aXRoIHlvdXIgY29tbWVudCwgYnV0IEkgd3JvdGUgdGhpcyBjb2RlIGxpa2UgaXQgaXMg
dG8gCmtlZXAgdGhlIHNhbWUgc3RydWN0dXJlIHRoYW4gYWxsIHRoZSBvdGhlciBvcHMgb2Ygc2Vy
aWFsX21jcnRybF9ncGlvIApkcml2ZXIuIEkgcHJlZmVycmVkIGtlZXBpbmcgYW4gaG9tb2dlbmVv
dXMgY29kZSBpbiB0aGUgZHJpdmVyIHJhdGhlciAKdGhhbiBicmVha2luZyB0aGUgZHJpdmVyIGhv
bW9nZW5laXR5IHdpdGggdGhlIGFkZGl0aW9uIG9mIGFuIG9wdGltaXplZCBjb2RlLgoKR3JlZywg
Y2FuIHlvdSBwbGVhc2UgaW5kaWNhdGUgd2hpY2ggc29sdXRpb24geW91IHJlY29tbWVuZCA/CgpD
aGVlcnMsIEVyd2FuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
