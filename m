Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2AC19AE5D
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 16:56:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8742C36B0B;
	Wed,  1 Apr 2020 14:56:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22DF4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 14:56:58 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031EqsY1011855; Wed, 1 Apr 2020 16:56:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=EWMX4dUTXREC+QeK0mkhl2un1ScVfvreF/9iNkJ/5Po=;
 b=EqXV77Ep73eZP2cgb6Lj9cLoPU4qcrBy7L3S7hmXOlTtfCRsZXp+y6peR1F9Kt2uUucl
 rL9Ohb2+xh26Vji44m4fnag+UcTxRGGclg3p67s6rujUDJ2Q2BQYORfVJJIf6+CzmU2a
 de022IfAqZpjYUz4smduOYhweYdzsCP0Cqy96IwA7wvHh+xgxgpZV5IckpQ/gfwVsp4X
 PRygAtG2fEwkEtT8iO1NVg/mor/oLcPde8KpzJ6d09vf9rAKv8MoP6DpSYIzzbIRhXqT
 ynTeu5YKOGaQMZP35x97iOrNjUQqGb7WC3Wg7QvKpyp8zGMGsVvVPdrOS0kjV/1EnbIf rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y5401q9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 16:56:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E1CE10002A;
 Wed,  1 Apr 2020 16:56:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C4242B1899;
 Wed,  1 Apr 2020 16:56:44 +0200 (CEST)
Received: from lmecxl0923.lme.st.com (10.75.127.46) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 16:56:43 +0200
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20200325143409.13005-1-ludovic.barre@st.com>
 <20200325143409.13005-3-ludovic.barre@st.com>
 <CAPDyKFpO40Ois8pNwYOeqZrJbV9UeCLok=i8z4GWML+A7TP2-w@mail.gmail.com>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <734ef31d-5104-c7d4-bf14-6bb116484010@st.com>
Date: Wed, 1 Apr 2020 16:56:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpO40Ois8pNwYOeqZrJbV9UeCLok=i8z4GWML+A7TP2-w@mail.gmail.com>
Content-Language: fr
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_01:2020-03-31,
 2020-03-31 signatures=0
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 2/2] mmc: mmci: initialize
 pwr|clk|datactrl_reg with their hardware values
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

aGkgVWxmCgpMZSAzLzI2LzIwIMOgIDM6MjcgUE0sIFVsZiBIYW5zc29uIGEgw6ljcml0wqA6Cj4g
T24gV2VkLCAyNSBNYXIgMjAyMCBhdCAxNTozNCwgTHVkb3ZpYyBCYXJyZSA8bHVkb3ZpYy5iYXJy
ZUBzdC5jb20+IHdyb3RlOgo+Pgo+PiBJbiBtbWNpX3dyaXRlX3B3cnxjbGt8ZGF0YWN0cmxyZWcg
ZnVuY3Rpb25zLCBpZiB0aGUgZGVzaXJlZCB2YWx1ZQo+PiBpcyBlcXVhbCB0byBjb3JyZXNwb25k
aW5nIHZhcmlhYmxlIChwd3JfcmVnfGNsa19yZWd8ZGF0YWN0cmxfcmVnKSwKPj4gdGhlIHZhbHVl
IGlzIG5vdCB3cml0dGVuIGluIHRoZSByZWdpc3Rlci4KPj4KPj4gQXQgcHJvYmUgcHdyfGNsa3xk
YXRhY3RybF9yZWcgb2YgbW1jaV9ob3N0IHN0cnVjdHVyZSBhcmUgaW5pdGlhbGl6ZWQKPj4gdG8g
MCAoa3phbGxvYyBvZiBtbWNfYWxsb2NfaG9zdCkuIEJ1dCB0aGV5IGRvZXMgbm90IG5lY2Vzc2Fy
aWx5IHJlZmxlY3QKPj4gaGFyZHdhcmUgdmFsdWUgb2YgdGhlc2UgcmVnaXN0ZXJzLCBpZiB0aGV5
IGFyZSB1c2VkIHdoaWxlIGJvb3QgbGV2ZWwuCj4+IFRoaXMgaXMgcHJvYmxlbWF0aWMsIGlmIHdl
IHdhbnQgdG8gd3JpdGUgMCBpbiB0aGVzZSByZWdpc3RlcnMuCj4gCj4gSXQgY291bGQgYmUsIGJ1
dCBJIGRvbid0IHNlZSB0aGF0IHdlIGV2ZXIgbmVlZHMgdG8gZG8gdGhhdCAtIGF0IGxlYXN0Cj4g
bm90IGJlZm9yZSB3ZSBoYXZlIHdyaXR0ZW4gc29tZSBvdGhlciBub24temVybyB2YWx1ZXMgdG8g
dGhlbSAodGhyb3VnaAo+IHRoZSBoZWxwZXIgZnVuY3Rpb25zKS4KPiAKClRoZSBzZG1tYyB2YXJp
YW50IGlzIHNsaWdodGx5IGRpZmZlcmVudCBvbiBwd3JfY3RybCBmaWVsZApvZiBNTUNJUE9XRVIg
cmVnaXN0ZXIuCgpJbiBjbGFzc2ljIG1tY2kgd2UgaGF2ZSAzIG9yIDIgdmFsdWVzOgpNTUNJX1BX
Ul9PRkYoMHgwKSwgTU1DSV9QV1JfVVAoMHgyKW9wdGlvbmFsLCBNTUNJX1BXUl9PTigweDMpCi1X
aGVuIHlvdSBzd2l0Y2ggdGhlIGV4dGVybmFsIHBvd2VyIHN1cHBseSBvZmYsIHRoZSBzb2Z0d2Fy
ZSBzZXQKICBwb3dlci1vZmYgKDB4MCkuCgotV2hlbiB5b3Ugc3dpdGNoIHRoZSBleHRlcm5hbCBw
b3dlciBzdXBwbHkgb24sIHRoZSBzb2Z0d2FyZSBmaXJzdCBlbnRlcnMKICB0aGUgcG93ZXItdXAo
MHgyKSBwaGFzZSwgYW5kIHdhaXRzIHVudGlsIHRoZSBzdXBwbHkgb3V0cHV0IGlzIHN0YWJsZQog
IGJlZm9yZSBtb3ZpbmcgdG8gdGhlIHBvd2VyLW9uICgweDMpcGhhc2UuCgpPbiBzZG1tYyB3ZSBo
YXZlIDMgdmFsdWVzOgpNTUNJX1BXUl9PRkYoMHgwKSwgTUNJX1NUTTMyX1BXUl9DWUMoMHgyKSwg
TU1DSV9QV1JfT04oMHgzKQotV2hlbiB5b3Ugc3dpdGNoIHRoZSBleHRlcm5hbCBwb3dlciBzdXBw
bHkgb2ZmLCB0aGUgc29mdHdhcmUgbXVzdAogIE1DSV9TVE0zMl9QV1JfQ1lDKDB4MikgPT4gVGhp
cyB3aWxsIG1ha2UgdGhhdCB0aGUgU0RNTUNfRFs3OjBdLAogIFNETU1DX0NNRCBhbmQgU0RNTUNf
Q0sgYXJlIGRyaXZlbiBsb3csIHRvIHByZXZlbnQgdGhlIGNhcmQgZnJvbSBiZWluZwogIHN1cHBs
aWVkIHRocm91Z2ggdGhlIHNpZ25hbCBsaW5lcy4KCi1XaGVuIHlvdSBzd2l0Y2ggdGhlIGV4dGVy
bmFsIHBvd2VyIHN1cHBseSBvbiwgd2hlbiBzdXBwbHkgb3V0cHV0IGlzCiAgc3RhYmxlIHRoZSBN
TUNJX1BXUl9PRkYoMHgwKSBzdGF0ZSBjYW4gYmUgYXBwbHkgKG1pbmltdW0gMW1zKSA9PiBUaGUK
ICBTRE1NQ19EWzc6MF0sIFNETU1DX0NNRCBhbmQgU0RNTUNfQ0sgYXJlIHNldCB0byBkcml2ZSDi
gJwx4oCdLiBBZnRlcgogIE1NQ0lfUFdSX09OKDB4Mykgc3RhdCBjb3VsZCBiZSBzZXQuCgpJbiBm
YWN0IHRoZSBsYXN0IHZhbHVlIG9mIHBvd2VyIG9mZiBzZXF1ZW5jZSBpcyBkaWZmZXJlbnQgYmV0
d2VlbgpjbGFzc2ljIGFuZCBzZG1tYzoKVGhlIGNsYXNzaWMgbW1jaSBmaW5pc2ggdGhlIHBvd2Vy
IG9mZiBzZXF1ZW5jZSBieSAweDAsIEJ1dCB0aGUgc2RtbWMKZmluaXNoIGJ5IDB4MiwgYW5kIHdl
IG11c3Qgd3JpdGUgMHgwIGluIHBvd2VyIG9uIHNlcXVlbmNlIGJlZm9yZSBzZXQKTU1DSV9QV1Jf
T04uClRoZSAweDAgdmFsdWUgaXMgbm90IHdyaXR0ZW4gZHVlIHRvIGt6YWxsb2MgdmFsdWUgb2Yg
cHdyX3JlZwood2hpY2ggbm90IHJlZmxlY3QgaGFyZHdhcmUgdmFsdWUgb2YgcHdyIHJlZ2lzdGVy
KS4KCj4+Cj4+IFRoaXMgcGF0Y2ggaW5pdGlhbGl6ZXMgcHdyfGNsa3xkYXRhY3RybF9yZWcgdmFy
aWFibGVzIHdpdGggdGhlaXIKPj4gaGFyZHdhcmUgdmFsdWVzIHdoaWxlIHByb2JpbmcuCj4gCj4g
SG1tLCBzbyBpbiBwcmluY2lwbGUgdGhpcyBjaGFuZ2Ugc2VlbXMgcXVpdGUgb2theSwgYnV0IEkg
YW0gaGVzaXRhbnQKPiB0byBwaWNrIGl0IHVwIC0gdW5sZXNzIGl0IHJlYWxseSBhZGRyZXNzZXMg
YSBwcm9ibGVtIHRoYXQgeW91IGhhdmUKPiBvYnNlcnZlZC4KPiAKPiBUaGUgcmVhc29uIGlzLCB0
aGlzIGNoYW5nZSBtYXkgbGVhZCB0byBhdm9pZGluZyB0byByZS13cml0ZSB0aGUKPiByZWdpc3Rl
ciB3aXRoIHRoZSBzYW1lIHZhbHVlIGl0IGdvdCBkdXJpbmcgYm9vdCAtIGFuZCB3aG8ga25vd3Mg
d2hhdAo+IGlzIGJlc3QgaGVyZS4KCkkgdW5kZXJzdGFuZCB5b3VyIGhlc2l0YXRpb24uCklmIHlv
dSBwcmVmZXIsIEkgY2FuIG1vdmUgdGhlIHB3cl9yZWcgaW5pdGlhbGlzYXRpb24KaW4gc2RtbWNf
dmFyaWFudF9pbml0ID8KClJlZ2FyZHMKTHVkbwoKPiAKPiBLaW5kIHJlZ2FyZHMKPiBVZmZlCj4g
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEx1ZG92aWMgQmFycmUgPGx1ZG92aWMuYmFycmVAc3QuY29t
Pgo+PiAtLS0KPj4gICBkcml2ZXJzL21tYy9ob3N0L21tY2kuYyB8IDQgKysrKwo+PiAgIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1j
L2hvc3QvbW1jaS5jIGIvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMKPj4gaW5kZXggNjQ3NTY3ZGVm
NjEyLi5mMzc4YWUxOGQ1ZGMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbW1jaS5j
Cj4+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvbW1jaS5jCj4+IEBAIC0yMDg1LDYgKzIwODUsMTAg
QEAgc3RhdGljIGludCBtbWNpX3Byb2JlKHN0cnVjdCBhbWJhX2RldmljZSAqZGV2LAo+PiAgICAg
ICAgICBlbHNlIGlmIChwbGF0LT5vY3JfbWFzaykKPj4gICAgICAgICAgICAgICAgICBkZXZfd2Fy
bihtbWNfZGV2KG1tYyksICJQbGF0Zm9ybSBPQ1IgbWFzayBpcyBpZ25vcmVkXG4iKTsKPj4KPj4g
KyAgICAgICBob3N0LT5wd3JfcmVnID0gcmVhZGxfcmVsYXhlZChob3N0LT5iYXNlICsgTU1DSVBP
V0VSKTsKPj4gKyAgICAgICBob3N0LT5jbGtfcmVnID0gcmVhZGxfcmVsYXhlZChob3N0LT5iYXNl
ICsgTU1DSUNMT0NLKTsKPj4gKyAgICAgICBob3N0LT5kYXRhY3RybF9yZWcgPSByZWFkbF9yZWxh
eGVkKGhvc3QtPmJhc2UgKyBNTUNJREFUQUNUUkwpOwo+PiArCj4+ICAgICAgICAgIC8qIFdlIHN1
cHBvcnQgdGhlc2UgY2FwYWJpbGl0aWVzLiAqLwo+PiAgICAgICAgICBtbWMtPmNhcHMgfD0gTU1D
X0NBUF9DTUQyMzsKPj4KPj4gLS0KPj4gMi4xNy4xCj4+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
