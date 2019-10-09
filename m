Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 038CCD0BC9
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Oct 2019 11:51:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB49BC36B0C;
	Wed,  9 Oct 2019 09:51:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8412C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 09:51:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x999k2Tq018596; Wed, 9 Oct 2019 11:51:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=wZHBdNbfW8cemZbtM4EyVZqKxEgCY/Nj31PdlfGQS9w=;
 b=ygm2/EHfTI96Znm/14gtNcEhtO2j8lgebssB8pz/Uu2kujmiis96wSn+laxTxviRv3hc
 0VG8qHKo6ajKRj/bkz7qTLPzNhySRBzi/C7vlVBSD4SpTsXP+/Zq6cmqJVHxyVFfrM5L
 e80fsS3gxj0xHLWXMIIF2HF20gYN12D1oZMDN8M/dE3w8Y1E1qMY5gL+DChB3UEoUNuR
 lqWdXvBmTLOTETuApSs9mdvAB+zdeSOat4Vr61wJg+i+V1oXcOJGT6wB59wRDBuOsstL
 vDbKaDt5rMrFff+4fOCcWkMRB4RdY8iTN9GKrcuYv2uodGBnPkCLXcqi3aqcuzkCtCjY qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vegah5vm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Oct 2019 11:51:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B681B10002A;
 Wed,  9 Oct 2019 11:51:06 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A777320681A;
 Wed,  9 Oct 2019 11:51:06 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 9 Oct 2019
 11:51:06 +0200
Received: from [10.48.0.192] (10.48.0.192) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Wed, 9 Oct 2019 11:51:06 +0200
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <1570534887-26181-1-git-send-email-fabrice.gasnier@st.com>
 <20191008144531.pjt525xuz7n5a3hq@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <5c05893b-e938-4db8-e33a-803b1a498f97@st.com>
Date: Wed, 9 Oct 2019 11:51:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008144531.pjt525xuz7n5a3hq@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.48.0.192]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-09_05:2019-10-08,2019-10-09 signatures=0
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pwm: stm32: add comment to better
 describe breakinput feature
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

T24gMTAvOC8xOSA0OjQ1IFBNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBPbiBUdWUsIE9j
dCAwOCwgMjAxOSBhdCAwMTo0MToyN1BNICswMjAwLCBGYWJyaWNlIEdhc25pZXIgd3JvdGU6Cj4+
IEFkZCBhIGNvbW1lbnQgdG8gYmV0dGVyIGRlc2NyaWJlIHRoZSBwdXJwb3NlIG9mIGJyZWFraW5w
dXQgZmVhdHVyZSB0aGF0Cj4+IGNhbiBiZSBmb3VuZCBvbiBzb21lIFNUTTMyIHRpbWVyIGluc3Rh
bmNlcy4gQnJpZWZseSBjb21tZW50IG9uIHRoZQo+PiBjaGFyYWN0ZXJpc3RpY3Mgb2YgdGhpcyBp
bnB1dCBmb3IgUFdNLCBhbmQgcGlubXV4aW5nIGFzIHN1Z2dlc3RlZCBpbiBbMV0uCj4+Cj4+IFsx
XSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8xMC8xLzIwNwo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBGYWJyaWNlIEdhc25pZXIgPGZhYnJpY2UuZ2FzbmllckBzdC5jb20+Cj4+IC0tLQo+PiAgZHJp
dmVycy9wd20vcHdtLXN0bTMyLmMgfCA4ICsrKysrKystCj4+ICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3
bS9wd20tc3RtMzIuYyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCj4+IGluZGV4IDM1OWIwODUu
LjY0MDZlYmIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCj4+ICsrKyBi
L2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCj4+IEBAIC01MjIsOCArNTIyLDE0IEBAIHN0YXRpYyBp
bnQgc3RtMzJfcHdtX2FwcGx5X2JyZWFraW5wdXRzKHN0cnVjdCBzdG0zMl9wd20gKnByaXYsCj4+
ICAJCQkJCSAgICAgc2l6ZW9mKHN0cnVjdCBzdG0zMl9icmVha2lucHV0KSk7Cj4+ICAKPj4gIAkv
Kgo+PiArCSAqIFNvbWUgdGltZXIgaW5zdGFuY2VzIGNhbiBoYXZlIEJSSyBpbnB1dCBwaW5zIChl
LmcuIGJhc2ljYWxseSBhIGZhdWx0Cj4+ICsJICogcGluIGZyb20gdGhlIG91dHB1dCBwb3dlciBz
dGFnZSkuIFRoZSBicmVhayBmZWF0dXJlIGFsbG93cyBhIHNhZmUKPj4gKwkgKiBzaHV0LWRvd24g
b2YgdGhlIFBXTSBvdXRwdXRzIHRvIGEgcHJlZGVmaW5lZCBzdGF0ZS4gRnVydGhlciBkZXRhaWxz
Cj4+ICsJICogYXJlIGF2YWlsYWJsZSBpbiBhcHBsaWNhdGlvbiBub3RlIEFONDI3NywgIlVzaW5n
IFNUTTMyIGRldmljZSBQV00KPj4gKwkgKiBzaHV0LWRvd24gZmVhdHVyZXMuLi4iCj4gCj4gV2l0
aG91dCBoYXZpbmcgcmVhZCB0aGUgYXBwbGljYXRpb24gbm90ZSBJIGRvbid0IHVuZGVyc3RhbmQg
dGhlIHB1cnBvc2UuCj4gTm90IHN1cmUgaWYgdGhpcyBzaG91bGQgYmUgYSBzaG93IHN0b3BwZXIg
dGhvdWdoLgoKSGkgVXdlLAoKSSBjYW4gcmVwaHJhc2UgdGhpcy4gRG8geW91IHRoaW5rIHRoZSBi
ZWxsb3cgY29tbWVudCB3b3VsZCBiZSBtb3JlCnJlbGV2YW50IGFuZCBlYXN5IHRvIHVuZGVyc3Rh
bmQgPwoKLyoKICogVGhlIGJyZWFrIGZlYXR1cmUgYWxsb3dzIGEgc2FmZSBzaHV0LWRvd24gb2Yg
dGhlIFBXTSBvdXRwdXRzLgogKiBJdCdzIGJhc2VkIG9uIHRoZSBCUksgZXZlbnQgc2lnbmFsIGRl
ZmluZWQgaW4gdGhlIGR0LWJpbmRpbmdzCiAqIGJ5IDxpbmRleCBsZXZlbCBmaWx0ZXI+IHZhbHVl
cy4KICogQmVjYXVzZSAic3QsYnJlYWtpbnB1dCIgcGFyYW1ldGVyIGlzIG9wdGlvbmFsIGRvIG5v
dCBtYWtlIHByb2JlCiAqIGZhaWxlZCBpZiBpdCBkb2Vzbid0IGV4aXN0LgogKi8KCj4gCj4+ICAJ
ICogQmVjYXVzZSAic3QsYnJlYWtpbnB1dCIgcGFyYW1ldGVyIGlzIG9wdGlvbmFsIGRvIG5vdCBt
YWtlIHByb2JlCj4+IC0JICogZmFpbGVkIGlmIGl0IGRvZXNuJ3QgZXhpc3QuCj4+ICsJICogZmFp
bGVkIGlmIGl0IGRvZXNuJ3QgZXhpc3QuIFRoZSBwaW5jdHJsIGhhbmRsZSBtdXN0IGhvbGQgdGhl
IEJSSwo+PiArCSAqIHBpbihzKSB3aGVuIHVzaW5nICJzdCxicmVha2lucHV0IiBwcm9wZXJ0eS4K
PiAKPiBJcyB0aGlzIGEgY29tbWVudCB0aGF0IGhhcyBhIGJldHRlciBwbGFjZSBpbiB0aGUgYmlu
ZGluZyBkb2M/CgpZb3UncmUgcmlnaHQsIHRoaXMgaXMgdW5uZWVkZWQgaGVyZS4gSSdsbCByZW1v
dmUgdGhpcy4KClBsZWFzZSBhZHZpc2UsCkJSLApGYWJyaWNlCgo+IAo+IEJlc3QgcmVnYXJkcwo+
IFV3ZQo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
