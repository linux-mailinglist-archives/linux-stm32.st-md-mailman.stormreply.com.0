Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD173EEA2C
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Aug 2021 11:44:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39A27C57B60;
	Tue, 17 Aug 2021 09:44:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8C8ECFAC42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Aug 2021 09:44:11 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17H9Pqpa013375; Tue, 17 Aug 2021 11:43:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : subject : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iQBg0AS6zUIUk6stFAs5jtKKe3PmvtRCEODGkgVmoNc=;
 b=aJ5izF7+gl64fItY6ngezbpPsIixaPydAqMvgnaPmpjJuHEqtjtuibZJTQJsr11vpzU0
 K1RVbPIXoSCTzmT7enfhhOkSrHfLw4YA0oYVrjo12yWX08HK2XSSkGrhNkAMR7UezVkb
 3vU3+P/DUja06o95Y23dKRAJ8TRF54QhbjC/AUkkocuxNWKlhGcKELCNeeVLeh8BreM4
 Nfsn0+phqzjBbe1Gw5K7GOLfgt6RBgCB84oKxeXdXKb2tBgxEy6IHJh4tCzqAEdKJXM4
 1xFEYhjBvilS8ES2nZqkt7THcBRyRyDQnWu4SnC0kKhV3S110yFUxdQJTYVFpjPnNMvD qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3afx6junxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 11:43:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8914910002A;
 Tue, 17 Aug 2021 11:43:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 75DA722AFE7;
 Tue, 17 Aug 2021 11:43:44 +0200 (CEST)
Received: from lmecxl0557.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 17 Aug
 2021 11:43:43 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Marek Vasut <marex@denx.de>
References: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
 <420e243d-7541-a07e-177b-d2db11c26aef@denx.de>
 <3bb823e4-4724-7072-fe9f-7b8a355c8e50@foss.st.com>
 <5d65ca80-4f94-49e1-5de1-cf29e8231a6a@denx.de>
Message-ID: <629b6666-74b3-91f0-5c6c-e26d55ea62d8@foss.st.com>
Date: Tue, 17 Aug 2021 11:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5d65ca80-4f94-49e1-5de1-cf29e8231a6a@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-17_03:2021-08-16,
 2021-08-17 signatures=0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: improve pm_runtime to stop
	clocks
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

Ck9uIDcvMi8yMSA4OjA3IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA3LzIvMjEgMTE6MjMg
QU0sIFJhcGhhZWwgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4+IEhlbGxvIE1hcmVrLAo+Cj4gSGksCj4K
Pj4gU29ycnkgZm9yIHRoZSBsYXRlIGFuc3dlci4KPgo+IE5vIHdvcnJpZXMsIHRha2UgeW91ciB0
aW1lCj4KPj4gT24gNi8zMC8yMSAyOjM1IEFNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4+IE9uIDYv
MjkvMjEgMTo1OCBQTSwgUmFwaGFlbCBHQUxMQUlTLVBPVSAtIGZvc3Mgd3JvdGU6Cj4+Pgo+Pj4g
Wy4uLl0KPj4+Cj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKPj4+PiBAQCAt
NDI1LDEwICs0MjUsMTcgQEAgc3RhdGljIHZvaWQgbHRkY19jcnRjX2F0b21pY19lbmFibGUoc3Ry
dWN0IGRybV9jcnRjICpjcnRjLAo+Pj4+IMKgIHsKPj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBsdGRj
X2RldmljZSAqbGRldiA9IGNydGNfdG9fbHRkYyhjcnRjKTsKPj4+PiDCoMKgwqDCoMKgIHN0cnVj
dCBkcm1fZGV2aWNlICpkZGV2ID0gY3J0Yy0+ZGV2Owo+Pj4+ICvCoMKgwqAgaW50IHJldDsKPj4+
PiDCoCDCoMKgwqDCoMKgIERSTV9ERUJVR19EUklWRVIoIlxuIik7Cj4+Pj4gwqAgLcKgwqDCoCBw
bV9ydW50aW1lX2dldF9zeW5jKGRkZXYtPmRldik7Cj4+Pj4gK8KgwqDCoCBpZiAoIXBtX3J1bnRp
bWVfYWN0aXZlKGRkZXYtPmRldikpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gcG1fcnVu
dGltZV9nZXRfc3luYyhkZGV2LT5kZXYpOwo+Pj4KPj4+IEFsbCB0aGVzZSBpZiAoIXBtX3J1bnRp
bWVfYWN0aXZlKCkpIHRoZW4gcG1fcnVudGltZV9nZXRfc3luYygpIGNhbGxzIGxvb2sgbGlrZSB3
b3JrYXJvdW5kIGZvciBzb21lIGxhcmdlciBpc3N1ZS4gU2hvdWxkbid0IHRoZSBwbV9ydW50aW1l
IGRvIHNvbWUgcmVmY291bnRpbmcgb24gaXRzIG93biAsIHNvIHRoaXMgc2hvdWxkbid0IGJlIG5l
ZWRlZCA/Cj4+Cj4+Cj4+IFRoaXMgcHJvYmxlbSBwdXJlbHkgY29tZXMgZnJvbSB0aGUgZHJpdmVy
IGludGVybmFscywgc28gSSBkb24ndCB0aGluayBpdCBpcyBhIHdvcmthcm91bmQuCj4+Cj4+IEJl
Y2F1c2Ugb2YgdGhlICJsdGRjX2NydGNfbW9kZV9zZXRfbm9mYiIgZnVuY3Rpb24gd2hpY2ggZG9l
cyBub3QgaGF2ZSBhbnkgInN5bW1ldHJpY2FsIiBjYWxsLCBzdWNoIGFzIGVuYWJsZS9kaXNhYmxl
IGZ1bmN0aW9ucywgdGhlcmUgd2FzIHR3byBjYWxscyB0byBwbV9ydW50aW1lX2dldF9zeW5jIGFn
YWluc3Qgb25lIGNhbGwgdG8gcG1fcnVudGltZV9wdXRfc3luYy4KPj4KPj4gVGhpcyBpbnN0YWJp
bGl0eSByZXN1bHRlZCBpbiB0aGUgTFREQyBjbG9ja3MgYmVpbmcgYWx3YXlzIGVuYWJsZWQsIGV2
ZW4gd2hlbiB0aGUgcGVyaXBoZXJhbCB3YXMgZGlzYWJsZWQuIFRoaXMgY291bGQgYmUgc2VlbiBp
biB0aGUgY2xrX3N1bW1hcnkgYXMgZXhwbGFpbmVkIGluIHRoZSBwYXRjaCBzdW1tYXJ5IGFtb25n
IG90aGVyIHRoaW5ncy4KPj4KPj4gQnkgZG9pbmcgc28sIHdlIGZpcnN0IGNoZWNrIGlmIHRoZSBj
bG9ja3MgYXJlIG5vdCBhbHJlYWR5IGFjdGl2YXRlZCwgYW5kIGluIHRoYXQgY2FzZSB3ZSBjYWxs
IHBtX3J1bnRpbWVfZ2V0X3N5bmMuCj4KPiBJIGp1c3QgaGF2ZSB0byB3b25kZXIsIGhvdyBjb21l
IG90aGVyIGRyaXZlcnMgZG9uJ3QgbmVlZCB0aGVzZSBpZiAoIXBtX3J1bnRpbWVfYWN0aXZlKCkp
IHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSBjb25kaXRpb25zLiBJIHRoaW5rIHRoZXkganVzdCBnZXQv
cHV0IHRoZSBydW50aW1lIFBNIHdpdGhpbiBhIGNhbGwgaXRzZWxmLCBub3QgYWNyb3NzIGZ1bmN0
aW9uIGNhbGxzLiBNYXliZSB0aGF0IGNvdWxkIGJlIHRoZSByaWdodCBmaXggaGVyZSB0b28gPwoK
CkhlbGxvIE1hcmVrLAoKCkkndmUgcnVuIGEgZGVlcGVyIGFuYWx5c2lzIG92ZXIgdGhpcyBpbXBs
ZW1lbnRhdGlvbi4KCklmIEkgbWF5IHRha2Ugcm9ja2NoaXAncyAicm9ja2NoaXBfZHJtX3ZvcC5j
IiBkcml2ZXIsIHRoZXJlIGlzIGFuIGJvb2xlYW4gImlzX2VuYWJsZWQiIHNldCB0byB0cnVlIHdo
ZW4gY3J0Y19hdG9taWNfZW5hYmxlIGlzIGNhbGxlZC4KClRoZSBhYm92ZSBpbXBsZW1lbnRhdGlv
biBjb3VsZCBzYXZlIHVzIGZyb20gYWRkaW5nIHN1Y2ggZmllbGQgaW4gdGhlIGx0ZGNfZGV2IHN0
cnVjdHVyZS4KCkFub3RoZXIgc29sdXRpb24gY291bGQgYmUgaW4gb3JkZXIgdG8gc2ltcGx5IGNh
bGwgcG1fcnVudGltZV9nZXRfc3luYygpIGluIGx0ZGNfY3J0Y19tb2RlX3NldF9ub2ZiKCkgYW5k
IGJ5IHJlbW92aW5nIHRoaXMgY29uZGl0aW9uIGluIGx0ZGNfYXRvbWljX2NydGNfZGlzYWJsZSgp
IHRoZSBkcml2ZXIgYmVoYXZlcyBqdXN0IGxpa2UgdGhlIGZpcnN0IHZlcnNpb24gb2YgdGhpcyBw
YXRjaC4KCkluIHRoaXMgd2F5LCBpdCBhdm9pZHMgc3VjaCBjb25kaXRpb25zIGFuZCBzZWVtcyBt
b3JlIHRvIGdldCBhbG9uZyB3aXRoIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLgoKClJlZ2Fy
ZHMsCgpSYXBoYcOrbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
