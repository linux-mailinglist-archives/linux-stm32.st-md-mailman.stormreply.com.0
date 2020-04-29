Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 283831BD836
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 11:28:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA050C36B0D;
	Wed, 29 Apr 2020 09:28:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48739C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 09:28:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T9CQf8021661; Wed, 29 Apr 2020 11:27:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=QHQmACS4JkGdXe2F2AdzPzvqSzi1Ni+9J4M+JTLtdlI=;
 b=Co9D5tuYwBeP3sLw4po3/lTa0MJYvSHte6qIVIDWbVmIW7gM5bhiWyYzm5iOaoEhmikg
 foOAy+hpnzUF7ucZG+q0gXvErcqRBinVnovqegS8iMz9Se2fnesBV0Dh0uIVH+4JIjMP
 VpgxJjuLan5zTEvBP/GH1wDAb/wOZ0D/1XiOo8KfB/LyveB5TvxZ+1mQJ5BrJ+WDnAmF
 rvCzuT3Ksrlc4mnUF1FIAgYACGpSahxaB6DVikZ94wkGTEBgglSreAnI/HnuPpNjigXw
 Wut5HQDizB668deaGthT/ASl/M1cee6F1zZ8kAfiXih961GTZIJQD0u2L2fo6PK7S/NF Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhjwwe2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 11:27:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BF5D4100034;
 Wed, 29 Apr 2020 11:27:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A0DB7207569;
 Wed, 29 Apr 2020 11:27:46 +0200 (CEST)
Received: from [10.211.9.35] (10.75.127.46) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Apr
 2020 11:27:44 +0200
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-7-git-send-email-christophe.kerello@st.com>
 <20200427202212.0235d987@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <0e2c9a6a-aa21-7814-9af8-629de6568fab@st.com>
Date: Wed, 29 Apr 2020 11:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200427202212.0235d987@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_03:2020-04-28,
 2020-04-29 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 06/12] mtd: rawnand: stm32_fmc2: use
 FMC2_TIMEOUT_MS for timeouts
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

SGkgTWlxdcOobCwKCk9uIDQvMjcvMjAgODoyMiBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBDaHJpc3RvcGhlLAo+IAo+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxv
QHN0LmNvbT4gd3JvdGUgb24gV2VkLCAxNSBBcHIKPiAyMDIwIDE3OjU3OjMwICswMjAwOgo+IAo+
PiBUaGlzIHBhdGNoIHJlbW92ZXMgdGhlIGNvbnN0YW50IEZNQzJfVElNRU9VVF9VUy4KPj4gRk1D
Ml9USU1FT1VUX01TIGlzIHNldCB0byA1IHNlY29uZHMgYW5kIHRoaXMgY29uc3RhbnQgaXMgdXNl
ZAo+PiBlYWNoIHRpbWUgdGhhdCB3ZSBuZWVkIHRvIHdhaXQgKGV4Y2VwdCB3aGVuIHRoZSB0aW1l
b3V0IHZhbHVlCj4+IGlzIHNldCBieSB0aGUgZnJhbWV3b3JrKQo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0BzdC5jb20+Cj4+IC0tLQo+
PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jIHwgMTEgKysrKystLS0t
LS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+PiBpbmRleCBhYjUzMzE0
Li5mMTU5YzM5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMy
X25hbmQuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+
PiBAQCAtMzcsOCArMzcsNyBAQAo+PiAgIC8qIE1heCBFQ0MgYnVmZmVyIGxlbmd0aCAqLwo+PiAg
ICNkZWZpbmUgRk1DMl9NQVhfRUNDX0JVRl9MRU4JCShGTUMyX0JDSERTUlNfTEVOICogRk1DMl9N
QVhfU0cpCj4+ICAgCj4+IC0jZGVmaW5lIEZNQzJfVElNRU9VVF9VUwkJCTEwMDAKPj4gLSNkZWZp
bmUgRk1DMl9USU1FT1VUX01TCQkJMTAwMAo+PiArI2RlZmluZSBGTUMyX1RJTUVPVVRfTVMJCQk1
MDAwCj4+ICAgCj4+ICAgLyogVGltaW5ncyAqLwo+PiAgICNkZWZpbmUgRk1DMl9USElaCQkJMQo+
PiBAQCAtNTI1LDkgKzUyNCw5IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9oYW1fY2FsY3VsYXRl
KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHU4ICpkYXRhLAo+PiAgIAl1MzIgc3IsIGhl
Y2NyOwo+PiAgIAlpbnQgcmV0Owo+PiAgIAo+PiAtCXJldCA9IHJlYWRsX3JlbGF4ZWRfcG9sbF90
aW1lb3V0KGZtYzItPmlvX2Jhc2UgKyBGTUMyX1NSLAo+PiAtCQkJCQkgc3IsIHNyICYgRk1DMl9T
Ul9OV1JGLCAxMCwKPj4gLQkJCQkJIEZNQzJfVElNRU9VVF9NUyk7Cj4+ICsJcmV0ID0gcmVhZGxf
cmVsYXhlZF9wb2xsX3RpbWVvdXRfYXRvbWljKGZtYzItPmlvX2Jhc2UgKyBGTUMyX1NSLAo+PiAr
CQkJCQkJc3IsIHNyICYgRk1DMl9TUl9OV1JGLCAxLAo+PiArCQkJCQkJMTAwMCAqIEZNQzJfVElN
RU9VVF9NUyk7Cj4gCj4gSXMgdGhlIF9hdG9taWMgc3VmZml4IG5lZWRlZCBoZXJlPyBJZiB5ZXMg
aXQgd291bGQgZGVzZXJ2ZSBhIHNlcGFyYXRlCj4gcGF0Y2ggd2l0aCBGaXhlcy9TdGFibGUgdGFn
cy4KPiAKCkkgaGF2ZSBjdXJyZW50bHkgbm90IHNlZW4gYW55IGlzc3Vlcy4gU28sIEkgd2lsbCBy
ZW1vdmUgdGhpcyAKbW9kaWZpY2F0aW9uIGFzIHdlIHdpbGwgbW92ZSB0byByZWdtYXBfcmVhZF9w
b2xsX3RpbWVvdXQgaW4gcGF0Y2ggMTAuCgo+PiAgIAlpZiAocmV0KSB7Cj4+ICAgCQlkZXZfZXJy
KGZtYzItPmRldiwgImhhbSB0aW1lb3V0XG4iKTsKPj4gICAJCXJldHVybiByZXQ7Cj4+IEBAIC0x
MzE1LDcgKzEzMTQsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfd2FpdHJkeShzdHJ1Y3QgbmFu
ZF9jaGlwICpjaGlwLCB1bnNpZ25lZCBsb25nIHRpbWVvdXRfbXMpCj4+ICAgCS8qIENoZWNrIGlm
IHRoZXJlIGlzIG5vIHBlbmRpbmcgcmVxdWVzdHMgdG8gdGhlIE5BTkQgZmxhc2ggKi8KPj4gICAJ
aWYgKHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0X2F0b21pYyhmbWMyLT5pb19iYXNlICsgRk1D
Ml9TUiwgc3IsCj4+ICAgCQkJCQkgICAgICBzciAmIEZNQzJfU1JfTldSRiwgMSwKPj4gLQkJCQkJ
ICAgICAgRk1DMl9USU1FT1VUX1VTKSkKPj4gKwkJCQkJICAgICAgMTAwMCAqIEZNQzJfVElNRU9V
VF9NUykpCj4+ICAgCQlkZXZfd2FybihmbWMyLT5kZXYsICJXYWl0cmR5IHRpbWVvdXRcbiIpOwo+
PiAgIAo+PiAgIAkvKiBXYWl0IHRXQiBiZWZvcmUgUi9CIyBzaWduYWwgaXMgbG93ICovCj4gCj4g
WW91IGNoYW5nZSB0aGUgdGltZW91dHMgZnJvbSAxbXMgdG8gNXMuCj4gCj4gTWF5YmUgNXMgaXMg
YSBsaXR0bGUgYml0IHRvbyBtdWNoIElNSE8gYnV0IHdlIGRvbid0IHJlYWxseSBjYXJlIGFzIHRo
aXMKPiBpcyBhIHRpbWVvdXQuIEhvd2V2ZXIgMW1zIGlzIHRpZ2h0LiBJZiB5b3UgYXJlIGNoYW5n
aW5nIHRoaXMgdmFsdWUKPiBiZWNhdXNlIGl0IHRyaWdnZXJzIGVycm9yIChlZy4gd2hlbiB0aGUg
bWFjaGluZSBpcyBsb2FkZWQpLCB0aGVuIGl0IGlzCj4gYSBmaXggYW5kIHNob3VsZCBhcHBlYXIg
bGlrZSBpdC4KPiAKPiBUaGFua3MsCj4gTWlxdcOobAo+IAoKTm8gZXJyb3JzIGN1cnJlbnRseSBo
YXBwZW5zLgpEdXJpbmcgb3VyIHN0cmVzcyB0ZXN0cywgaW4gYSBvdmVybG9hZGVkIHN5c3RlbSwg
d2UgaGF2ZSBzZWVuIHRoYXQgd2UgCmNvdWxkIGJlIGNsb3NlIHRvIDEgc2Vjb25kLCBldmVuIGlm
IHdlIG5ldmVyIG1ldCB0aGlzIHZhbHVlLgpTbywgdG8gYmUgc2FmZSwgSSBoYXZlIHNldCB0aGlz
IHRpbWVvdXQgdG8gNSBzZWNvbmRzLgpBcyBpdCBpcyBqdXN0IGEgdGltZW91dCB2YWx1ZSwgSSBo
YXZlIG5vdCBzZWVuIGFueSBzaWRlIGVmZmVjdC4KSSBhbSB1c2luZyB0aGUgc2FtZSB0aW1lb3V0
IGNvbnN0YW50IHRvIGF2b2lkIHRvIGhhdmUgb25lIHRpbWVvdXQgcGVyIApjYXNlcy4KClJlZ2Fy
ZHMsCkNocmlzdG9waGUgS2VyZWxsby4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
