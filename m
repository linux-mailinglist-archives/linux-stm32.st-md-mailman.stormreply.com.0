Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF0435C762
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 15:19:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65D83C57B79;
	Mon, 12 Apr 2021 13:19:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7E94C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 13:19:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13CDIDTg018924; Mon, 12 Apr 2021 15:19:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8R7d3CTMS2VKwKA9wDvlbwBP8USe1r/2dAXdVNGhj58=;
 b=6fb+lsRSyKi7xpqxY5M+nTSIlLJpJIZIKGK8vAjyHYE0g+ipDxI7sK732PlF6x3LB7sr
 JNODjUKwTXg6g3dMuq2EihQ7P/pe+jsI/jZimGi5QTngn/nDH9GE8OIXsuCsd/8mb4wQ
 HAHxcaGP91cf/wYv96jatFG6NwFupwfb67+cFP0Dic26yKhQxGLQcIL+IiUO7nN5Zzjd
 GWNDO5JeJapY/812tAvK+2tihqzfrAR0L1YTv4gaNk6J7kIagTRpGKv+qWiK2vz+nwQp
 idIK+G1c+yIFS2IJBoXlQDrLDVrOCB16LIJmXkbW+tXHyLj6p9fnrYEWP3WjrX6EHfB+ Jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37v3a5nhak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 15:19:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25FBA10002A;
 Mon, 12 Apr 2021 15:19:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12DB1248EE1;
 Mon, 12 Apr 2021 15:19:29 +0200 (CEST)
Received: from lmecxl0566.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 12 Apr
 2021 15:19:28 +0200
To: dillon min <dillon.minfei@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
References: <1618202061-8243-1-git-send-email-dillon.minfei@gmail.com>
 <YHPgGI6EmTzmVH7g@kroah.com>
 <CAL9mu0Lt-3_O7V5HLxd5Hbt9afx9ryBUzWqmsc+2n3SP7JS6ig@mail.gmail.com>
 <YHQEA9jn5uXQCtrN@kroah.com>
 <CAL9mu0+hi5eYEder1Mj2yjUN+eicJ9qG8Kr4GTC2mqfY405Jkg@mail.gmail.com>
From: Erwan LE RAY <erwan.leray@foss.st.com>
Message-ID: <f3985d70-4f00-7442-de4e-e382b19e3e50@foss.st.com>
Date: Mon, 12 Apr 2021 15:19:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0+hi5eYEder1Mj2yjUN+eicJ9qG8Kr4GTC2mqfY405Jkg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-12_10:2021-04-12,
 2021-04-12 signatures=0
Cc: linux-serial@vger.kernel.org,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, jirislaby@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] serial: stm32: optimize spin lock usage
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

SGkgRGlsbG9uLAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoLgoKQ291bGQgeW91IHBsZWFzZSBlbGFi
b3JhdGUgdGhlIHVzZSBjYXNlIGluIHlvdXIgY29tbWl0IG1lc3NhZ2UgPwoKQmVzdCBSZWdhcmRz
LCBFcndhbi4KCk9uIDQvMTIvMjEgMTA6NTQgQU0sIGRpbGxvbiBtaW4gd3JvdGU6Cj4gSGkgR3Jl
ZywKPiAKPiBPbiBNb24sIEFwciAxMiwgMjAyMSBhdCA0OjI1IFBNIEdyZWcgS0ggPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPj4KPj4gT24gTW9uLCBBcHIgMTIsIDIwMjEgYXQg
MDI6NTA6MjBQTSArMDgwMCwgZGlsbG9uIG1pbiB3cm90ZToKPj4+IEhpIEdyZWfvvIwKPj4+Cj4+
PiBUaGFua3MgZm9yIHRoZSBxdWljayByZXNwb25zZSwgcGxlYXNlIGlnbm9yZSB0aGUgbGFzdCBw
cml2YXRlIG1haWwuCj4+Pgo+Pj4gT24gTW9uLCBBcHIgMTIsIDIwMjEgYXQgMTo1MiBQTSBHcmVn
IEtIIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4+Pj4KPj4+PiBPbiBNb24s
IEFwciAxMiwgMjAyMSBhdCAxMjozNDoyMVBNICswODAwLCBkaWxsb24ubWluZmVpQGdtYWlsLmNv
bSB3cm90ZToKPj4+Pj4gRnJvbTogZGlsbG9uIG1pbiA8ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20+
Cj4+Pj4+Cj4+Pj4+IFRvIGF2b2lkIHBvdGVudGlhbCBkZWFkbG9jayBpbiBzcGluX2xvY2sgdXNh
Z2UsIGNoYW5nZSB0byB1c2UKPj4+Pj4gc3Bpbl9sb2NrX2lycXNhdmUoKSwgc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgpIGluIHByb2Nlc3ModGhyZWFkX2ZuKSBjb250ZXh0Lgo+Pj4+PiBzcGluX2xv
Y2soKSwgc3Bpbl91bmxvY2soKSB1bmRlciBoYW5kbGVyIGNvbnRleHQuCj4+Pj4+Cj4+Pj4+IHJl
bW92ZSB1bnVzZWQgbG9jYWxfaXJxX3NhdmUvcmVzdG9yZSBjYWxsLgo+Pj4+Pgo+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBkaWxsb24gbWluIDxkaWxsb24ubWluZmVpQGdtYWlsLmNvbT4KPj4+Pj4gLS0t
Cj4+Pj4+IFdhcyB2ZXJpZmllZCBvbiBzdG0zMmY0NjktZGlzY28gYm9hcmQuIG5lZWQgbW9yZSB0
ZXN0IG9uIHN0bTMybXAgcGxhdGZvcm0uCj4+Pj4+Cj4+Pj4+ICAgZHJpdmVycy90dHkvc2VyaWFs
L3N0bTMyLXVzYXJ0LmMgfCAyNyArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPj4+Pj4gICAx
IGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYyBiL2RyaXZl
cnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCj4+Pj4+IGluZGV4IGIzNjc1Y2YyNWE2OS4uYzRj
ODU5YjM0MzY3IDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNh
cnQuYwo+Pj4+PiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYwo+Pj4+PiBA
QCAtMjE0LDcgKzIxNCw3IEBAIHN0YXRpYyB2b2lkIHN0bTMyX3VzYXJ0X3JlY2VpdmVfY2hhcnMo
c3RydWN0IHVhcnRfcG9ydCAqcG9ydCwgYm9vbCB0aHJlYWRlZCkKPj4+Pj4gICAgICAgIHN0cnVj
dCB0dHlfcG9ydCAqdHBvcnQgPSAmcG9ydC0+c3RhdGUtPnBvcnQ7Cj4+Pj4+ICAgICAgICBzdHJ1
Y3Qgc3RtMzJfcG9ydCAqc3RtMzJfcG9ydCA9IHRvX3N0bTMyX3BvcnQocG9ydCk7Cj4+Pj4+ICAg
ICAgICBjb25zdCBzdHJ1Y3Qgc3RtMzJfdXNhcnRfb2Zmc2V0cyAqb2ZzID0gJnN0bTMyX3BvcnQt
PmluZm8tPm9mczsKPj4+Pj4gLSAgICAgdW5zaWduZWQgbG9uZyBjOwo+Pj4+PiArICAgICB1bnNp
Z25lZCBsb25nIGMsIGZsYWdzOwo+Pj4+PiAgICAgICAgdTMyIHNyOwo+Pj4+PiAgICAgICAgY2hh
ciBmbGFnOwo+Pj4+Pgo+Pj4+PiBAQCAtMjc2LDkgKzI3NiwxNyBAQCBzdGF0aWMgdm9pZCBzdG0z
Ml91c2FydF9yZWNlaXZlX2NoYXJzKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQsIGJvb2wgdGhyZWFk
ZWQpCj4+Pj4+ICAgICAgICAgICAgICAgIHVhcnRfaW5zZXJ0X2NoYXIocG9ydCwgc3IsIFVTQVJU
X1NSX09SRSwgYywgZmxhZyk7Cj4+Pj4+ICAgICAgICB9Cj4+Pj4+Cj4+Pj4+IC0gICAgIHNwaW5f
dW5sb2NrKCZwb3J0LT5sb2NrKTsKPj4+Pj4gKyAgICAgaWYgKHRocmVhZGVkKQo+Pj4+PiArICAg
ICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnBvcnQtPmxvY2ssIGZsYWdzKTsKPj4+
Pj4gKyAgICAgZWxzZQo+Pj4+PiArICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZwb3J0LT5sb2Nr
KTsKPj4+Pgo+Pj4+IFlvdSBzaG91bGRuJ3QgaGF2ZSB0byBjaGVjayBmb3IgdGhpcywgc2VlIHRo
ZSBvdGhlciBwYXRjaGVzIG9uIHRoZSBsaXN0Cj4+Pj4gcmVjZW50bHkgdGhhdCBmaXhlZCB0aGlz
IHVwIHRvIG5vdCBiZSBhbiBpc3N1ZSBmb3IgaXJxIGhhbmRsZXJzLgo+Pj4gQ2FuIHlvdSBoZWxw
IHRvIGdpdmUgbW9yZSBoaW50cywgb3IgdGhlIGNvbW1pdCBpZCBvZiB0aGUgcGF0Y2ggd2hpY2gK
Pj4+IGZpeGVkIHRoaXMuIHRoYW5rcy4KPj4+Cj4+PiBJJ20gc3RpbGwgY29uZnVzZWQgd2l0aCB0
aGlzLgo+Pj4KPj4+IFRoZSBzdG0zMl91c2FydF90aHJlYWRlZF9pbnRlcnJ1cHQoKSBpcyBhIGt0
aHJlYWQgY29udGV4dCwgb25jZQo+Pj4gcG9ydC0+bG9jayBob2xkcyBieSB0aGlzIGZ1bmN0aW9u
LCBhbm90aGVyIHNlcmlhbCBpbnRlcnJ1cHRzIHJhaXNlZCwKPj4+IHN1Y2ggYXMgVVNBUlRfU1Jf
VFhFLHN0bTMyX3VzYXJ0X2ludGVycnVwdCgpIGNhbid0IGdldCB0aGUgbG9jaywKPj4+IHRoZXJl
IHdpbGwgYmUgYSBkZWFkbG9jay4gaXNuJ3QgaXQ/Cj4+Pgo+Pj4gICBTbywgc2hvdWxkbid0IEkg
dXNlIHNwaW5fbG9ja3tfaXJxc2F2ZX0gYWNjb3JkaW5nIHRvIHRoZSBjYWxsZXIncyBjb250ZXh0
ID8KPj4KPj4gUGxlYXNlIHNlZSA4MWUyMDczYzE3NWIgKCJnZW5pcnE6IERpc2FibGUgaW50ZXJy
dXB0cyBmb3IgZm9yY2UgdGhyZWFkZWQKPj4gaGFuZGxlcnMiKSBmb3Igd2hlbiB0aHJlYWRlZCBp
cnEgaGFuZGxlcnMgaGF2ZSBpcnFzIGRpc2FibGVkLCBpc24ndCB0aGF0Cj4+IHRoZSBjYXNlIHlv
dSBhcmUgdHJ5aW5nIHRvICJwcm90ZWN0IiBmcm9tIGhlcmU/Cj4+Cj4+IFdoeSBpcyB0aGUgInRo
cmVhZGVkIiBmbGFnIHVzZWQgYXQgYWxsPyAgVGhlIGRyaXZlciBzaG91bGQgbm90IGNhcmUuCj4+
Cj4+IEFsc28gc2VlIDliYWVkYjdiYWVkYSAoInNlcmlhbDogaW14OiBkcm9wIHdvcmthcm91bmQg
Zm9yIGZvcmNlZCBpcnEKPj4gdGhyZWFkaW5nIikgaW4gbGludXgtbmV4dCBmb3IgYW4gZXhhbXBs
ZSBvZiBob3cgdGhpcyB3YXMgZml4ZWQgdXAgaW4gYQo+PiBzZXJpYWwgZHJpdmVyLgo+Pgo+PiBk
b2VzIHRoYXQgaGVscD8KPj4KPiBZZXMsIGl0J3MgcmVhbGx5IGhlbHBmdWwuIGFuZCA4MWUyMDcz
YzE3NWIgc2hvdWxkIGJlIGhpZ2hsaWdodGVkIGluIGEgZG9jLgo+IEluIG15IHBhc3Qga25vd2xl
ZGdlLCB3ZSBzaG91bGQgY2FyZSBhYm91dCBoYXJkIGlycSAmIHRocmVhZF9mbiBsb2NrIGNvbmZs
aWN0Lgo+IFRoaXMgcGF0Y2ggaGFzIHRvdGFsbHkgYXZvaWRlZCBwYXRjaGluZyBjb2RlIGluIHRo
ZSBzZXBhcmF0ZSBkcml2ZXIgc2lkZS4KPiB0aGFua3MuCj4gCj4gSSB3aWxsIGp1c3Qga2VlcCB0
aGUgY2hhbmdlcyBpbiBzdG0zMl91c2FydF9jb25zb2xlX3dyaXRlKCksIHJlbW92ZQo+IHRoZXNl
IGNvZGUgaW4KPiB0aHJlYWRfZm4uIHVwZGF0ZSB2ZXJzaW9uIDIgZm9yIHlvdS4KPiAKPiB0aGFu
a3MuCj4gCj4gRGlsbG9uLAo+PiB0aGFua3MsCj4+Cj4+IGdyZWcgay1oCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKPiBMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4gaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
