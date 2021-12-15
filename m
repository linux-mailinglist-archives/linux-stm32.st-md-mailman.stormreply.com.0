Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE93D4755C5
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Dec 2021 11:05:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62E30C5EC6C;
	Wed, 15 Dec 2021 10:05:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89BACC5E2C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 10:05:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BF8xctf015267;
 Wed, 15 Dec 2021 11:05:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3BmR+IunfXlXTt4gyyNN854tdQIgeq49/tg0NzOw1sQ=;
 b=l2jYnSVWXey8pRiDuQw4YH4DuQVxXo3jqJkwJcbVK37Le0q8hwUdzuj+kUf96Jk/3LK1
 FvrSsXTIWQkMEneDrNoPNbFsj3hibP6w38qdfACestZ6GG37qqD4oL6D+MoBLbqzVvKH
 utgoDUvyMx6jeB2KOsjmxv7xsHcIwNk8UW2V7gPJngmAOEJevFFEMBkNdIuib4EJZxmA
 ZqnTKuMR5RnK0pcymYxpRuUKGMCLmQa42Jp+2bNRbWywQsRGw3wwal1vaK2DpMHmQfmm
 X6K+JWxk9845ZMqJ9HDWbQA8nKWM0QffWdZqUfNT+4peTTiS1e74aLaNnpKC9dlo3njN BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cxrthxptn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 11:05:33 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5B75B10002A;
 Wed, 15 Dec 2021 11:05:32 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE06222682C;
 Wed, 15 Dec 2021 11:05:27 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 15 Dec
 2021 11:05:27 +0100
To: Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
References: <20211214170646.25775-1-arnaud.pouliquen@foss.st.com>
 <3fc784f1-5985-1553-c39f-8472cb63b1af@kernel.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <250fd384-1dde-e800-2bac-ca37e53d50a2@foss.st.com>
Date: Wed, 15 Dec 2021 11:05:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <3fc784f1-5985-1553-c39f-8472cb63b1af@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_07,2021-12-14_01,2021-12-02_01
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2] tty: rpmsg: Fix race condition
	releasing tty port
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

CgpPbiAxMi8xNS8yMSA3OjQ5IEFNLCBKaXJpIFNsYWJ5IHdyb3RlOgo+IEhpLAo+IAo+IG11Y2gg
YmV0dGVyIElNTy4KPiAKPiBPbiAxNC4gMTIuIDIxLCAxODowNiwgQXJuYXVkIFBvdWxpcXVlbiB3
cm90ZToKPj4gSW4gY3VycmVudCBpbXBsZW1lbnRhdGlvbiB0aGUgdHR5X3BvcnQgc3RydWN0IGlz
IHBhcnQgb2YgdGhlCj4+IHJwbXNnX3R0eV9wb3J0IHN0cnVjdHVyZS5UaGUgaXNzdWUgaXMgdGhh
dCB0aGUgcnBtc2dfdHR5X3BvcnQgc3RydWN0dXJlIGlzCj4+IGZyZWVkIG9uIHJwbXNnX3R0eV9y
ZW1vdmUgYnV0IGFsc28gcmVmZXJlbmNlZCBpbiB0aGUgdHR5X3N0cnVjdC4KPj4gSXRzIHJlbGVh
c2UgaXMgbm90IHByZWRpY3RhYmxlIGR1ZSB0byB3b3JrcXVldWVzLgo+Pgo+PiBGb3IgaW5zdGFu
Y2UgZm9sbG93aW5nIGZ0cmFjZSBzaG93cyB0aGF0IHJwbXNnX3R0eV9jbG9zZSBpcyBjYWxsZWQg
YWZ0ZXIKPj4gcnBtc2dfdHR5X3JlbGVhc2VfY3BvcnQ6Cj4gLi4uCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3R0eS9ycG1zZ190dHkuYyBiL2RyaXZlcnMvdHR5L3JwbXNnX3R0eS5jCj4+IGluZGV4
IGRhZTJhNGU0NGYzOC4uNjkyNzJhZDkyMjY2IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3R0eS9y
cG1zZ190dHkuYwo+PiArKysgYi9kcml2ZXJzL3R0eS9ycG1zZ190dHkuYwo+PiBAQCAtNTMsOSAr
NTMsMTkgQEAgc3RhdGljIGludCBycG1zZ190dHlfaW5zdGFsbChzdHJ1Y3QgdHR5X2RyaXZlciAq
ZHJpdmVyLAo+PiBzdHJ1Y3QgdHR5X3N0cnVjdCAqdHR5KQo+PiDCoCDCoMKgwqDCoMKgIHR0eS0+
ZHJpdmVyX2RhdGEgPSBjcG9ydDsKPj4gwqAgK8KgwqDCoCB0dHlfcG9ydF9nZXQoJmNwb3J0LT5w
b3J0KTsKPiAKPiBDYW4ndCB0aGlzIGZhaWw/IExpa2Ugd2hlbiByYWNpbmcgd2l0aCByZW1vdmFs
Pwo+IAo+PiDCoMKgwqDCoMKgIHJldHVybiB0dHlfcG9ydF9pbnN0YWxsKCZjcG9ydC0+cG9ydCwg
ZHJpdmVyLCB0dHkpOwo+PiDCoCB9Cj4gLi4uCj4+IMKgIHN0YXRpYyBzdHJ1Y3QgcnBtc2dfdHR5
X3BvcnQgKnJwbXNnX3R0eV9hbGxvY19jcG9ydCh2b2lkKQo+PiBAQCAtMTM5LDYgKzE1Niw4IEBA
IHN0YXRpYyBzdHJ1Y3QgcnBtc2dfdHR5X3BvcnQgKnJwbXNnX3R0eV9hbGxvY19jcG9ydCh2b2lk
KQo+PiDCoCDCoCBzdGF0aWMgdm9pZCBycG1zZ190dHlfcmVsZWFzZV9jcG9ydChzdHJ1Y3QgcnBt
c2dfdHR5X3BvcnQgKmNwb3J0KQo+PiDCoCB7Cj4+ICvCoMKgwqAgdHR5X3BvcnRfZGVzdHJveSgm
Y3BvcnQtPnBvcnQpOwo+PiArCj4gCj4gWW91IHNob3VsZCBub3QgY2FsbCB0dHlfcG9ydF9kZXN0
cm95IHdoZW4geW91IHVzZSByZWZjb3VudGluZy4gVGhlIHBvcnQgaXMKPiBhbHJlYWR5IGRlc3Ry
b3llZCB3aGVuIC0+ZGVzdHJ1Y3QoKSBpcyBjYWxsZWQuIChJdCBoYXMgY3VycmVudGx5IG5vIGJh
ZCBlZmZlY3QKPiBjYWxsaW5nIGl0IHR3aWNlIG9uIGEgcG9ydCB0aG91Z2guKQo+IAo+PiBAQCAt
MTQ2LDcgKzE2NSwxNyBAQCBzdGF0aWMgdm9pZCBycG1zZ190dHlfcmVsZWFzZV9jcG9ydChzdHJ1
Y3QgcnBtc2dfdHR5X3BvcnQKPj4gKmNwb3J0KQo+PiDCoMKgwqDCoMKgIGtmcmVlKGNwb3J0KTsK
Pj4gwqAgfQo+PiDCoCAtc3RhdGljIGNvbnN0IHN0cnVjdCB0dHlfcG9ydF9vcGVyYXRpb25zIHJw
bXNnX3R0eV9wb3J0X29wcyA9IHsgfTsKPj4gK3N0YXRpYyB2b2lkIHJwbXNnX3R0eV9kZXN0cnVj
dF9wb3J0KHN0cnVjdCB0dHlfcG9ydCAqcG9ydCkKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3QgcnBt
c2dfdHR5X3BvcnQgKmNwb3J0ID0gY29udGFpbmVyX29mKHBvcnQsIHN0cnVjdCBycG1zZ190dHlf
cG9ydCwKPj4gcG9ydCk7Cj4+ICsKPj4gK8KgwqDCoCBycG1zZ190dHlfcmVsZWFzZV9jcG9ydChj
cG9ydCk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgdHR5X3BvcnRfb3BlcmF0
aW9ucyBycG1zZ190dHlfcG9ydF9vcHMgPSB7Cj4+ICvCoMKgwqAgLmRlc3RydWN0ID0gcnBtc2df
dHR5X2Rlc3RydWN0X3BvcnQsCj4+ICt9Owo+PiArCj4+IMKgIMKgIHN0YXRpYyBpbnQgcnBtc2df
dHR5X3Byb2JlKHN0cnVjdCBycG1zZ19kZXZpY2UgKnJwZGV2KQo+PiDCoCB7Cj4+IEBAIC0xNzks
NyArMjA4LDYgQEAgc3RhdGljIGludCBycG1zZ190dHlfcHJvYmUoc3RydWN0IHJwbXNnX2Rldmlj
ZSAqcnBkZXYpCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIMKgIGVycl9kZXN0cm95Ogo+
PiAtwqDCoMKgIHR0eV9wb3J0X2Rlc3Ryb3koJmNwb3J0LT5wb3J0KTsKPj4gwqDCoMKgwqDCoCBy
cG1zZ190dHlfcmVsZWFzZV9jcG9ydChjcG9ydCk7Cj4gCj4gQ291bGRuJ3QgeW91IGp1c3QgcHV0
IHRoZSBwb3J0IGhlcmU/IEFuZCBpbmxpbmUgcnBtc2dfdHR5X3JlbGVhc2VfY3BvcnQgaW50byB0
aGUKPiBuZXcgcnBtc2dfdHR5X2Rlc3RydWN0X3BvcnQ/Cj4gCgpUaGFua3MgZm9yIGFsbCB0aGUg
aW5zaWdodGZ1bCBjb21tZW50cywgVjMgaXMgY29taW5nLgoKPiB0aGFua3MsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
