Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E88E52364C
	for <lists+linux-stm32@lfdr.de>; Wed, 11 May 2022 16:55:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF3EDC03FC4;
	Wed, 11 May 2022 14:55:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FA95C035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 May 2022 14:55:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BAW1Ju018362;
 Wed, 11 May 2022 16:55:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=selector1;
 bh=+YPIl1+HECBCIFGnFWdVUt+GpcgGMMtibG+mpoeQNc0=;
 b=bSLmsDXRbL88WEdwp57DO3MAA2xNUkKwZ+ReLtxsGg+2rbFq1qzUNkr8szuo0K4kViJW
 H/oJhgbuzjj+Xb/KP+xIVj2b6+/cLkbCT+r963uBsYYRCSrBkTE0XRm9MXCSamf9DNml
 Mt4Xh4okVW683qpN28yWgXXfyYA1AeHzCVuDBMRcHPHZ5bGE/2qm+hj6DTfA5Az+vQeg
 cwqPvh3y/6LemoJL7tYpiZ3nx6ZbtXF0n7px/qwRD0yMv5NftcLlJF5Vx+o8E0imhhq9
 6/HZSH3jktQ1++ft31T4FcrDO4WRbBP6STXf/draglsWSkR0q2efXNUtineHg3frTNM3 yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwdw9bawu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 16:55:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D80F10002A;
 Wed, 11 May 2022 16:55:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 763F7229A9A;
 Wed, 11 May 2022 16:55:07 +0200 (CEST)
Received: from [192.168.8.15] (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 11 May
 2022 16:55:04 +0200
Message-ID: <87d059e62a54e2216acdf4ca3a6a81b8d771af42.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Marc Zyngier <maz@kernel.org>
Date: Wed, 11 May 2022 16:55:03 +0200
In-Reply-To: <875ymd6xdu.wl-maz@kernel.org>
References: <20220510164123.557921-1-antonio.borneo@foss.st.com>
 <20220510164123.557921-4-antonio.borneo@foss.st.com>
 <875ymd6xdu.wl-maz@kernel.org>
User-Agent: Evolution 3.44.1 
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-11_01,2022-02-23_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, Loic
 Pallardy <loic.pallardy@foss.st.com>, Pascal Paillet <p.paillet@foss.st.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/7] irqchip/stm32-exti: forward
 irq_request_resources to parent
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

T24gVHVlLCAyMDIyLTA1LTEwIGF0IDE5OjQ0ICswMTAwLCBNYXJjIFp5bmdpZXIgd3JvdGU6Cj4g
T24gVHVlLCAxMCBNYXkgMjAyMiAxNzo0MToyMCArMDEwMCwKPiBBbnRvbmlvIEJvcm5lbyA8YW50
b25pby5ib3JuZW9AZm9zcy5zdC5jb20+IHdyb3RlOgo+ID4gCj4gPiBGcm9tOiBQYXNjYWwgUGFp
bGxldCA8cC5wYWlsbGV0QGZvc3Muc3QuY29tPgo+ID4gCj4gPiBFbmhhbmNlIHN0bTMyLWV4dGkg
ZHJpdmVyIHRvIGZvcndhcmQgcmVxdWVzdF9yZXNvdXJjZXMgYW5kCj4gPiByZWxlYXNlX3Jlc291
cmNlc19wYXJlbnQgb3BlcmF0aW9ucyB0byBwYXJlbnQuCj4gPiBEbyBub3QgdXNlIGlycV9yZXF1
ZXN0X3Jlc291cmNlc19wYXJlbnQgYmVjYXVzZSBpdCByZXR1cm5zCj4gPiBhbiBlcnJvciB3aGVu
IHRoZSBwYXJlbnQgZG9lcyBub3QgaW1wbGVtZW50IGlycV9yZXF1ZXN0X3Jlc291cmNlcy4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogUGFzY2FsIFBhaWxsZXQgPHAucGFpbGxldEBmb3NzLnN0LmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5lb0Bmb3Nz
LnN0LmNvbT4KPiA+IC0tLQo+ID4gwqBkcml2ZXJzL2lycWNoaXAvaXJxLXN0bTMyLWV4dGkuYyB8
IDE0ICsrKysrKysrKysrKysrCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCsp
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXN0bTMyLWV4dGkuYwo+
ID4gYi9kcml2ZXJzL2lycWNoaXAvaXJxLXN0bTMyLWV4dGkuYwo+ID4gaW5kZXggYzgwMDNmNGYw
NDU3Li4zZjZkNTI0YTg3ZmUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXN0
bTMyLWV4dGkuYwo+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1zdG0zMi1leHRpLmMKPiA+
IEBAIC01NTAsNiArNTUwLDE2IEBAIHN0YXRpYyB2b2lkIHN0bTMyX2V4dGlfaF91bm1hc2soc3Ry
dWN0Cj4gPiBpcnFfZGF0YSAqZCkKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aXJxX2NoaXBfdW5tYXNrX3BhcmVudChkKTsKPiA+IMKgfQo+ID4gwqAKPiA+ICtzdGF0aWMgaW50
IHN0bTMyX2V4dGlfaF9yZXF1ZXN0X3Jlc291cmNlcyhzdHJ1Y3QgaXJxX2RhdGEgKmRhdGEpCj4g
PiArewo+ID4gK8KgwqDCoMKgwqDCoMKgZGF0YSA9IGRhdGEtPnBhcmVudF9kYXRhOwo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGRhdGEtPmNoaXAtPmlycV9yZXF1ZXN0X3Jlc291cmNlcykK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZGF0YS0+Y2hpcC0+aXJx
X3JlcXVlc3RfcmVzb3VyY2VzKGRhdGEpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJu
IDA7Cj4gPiArfQo+IAo+IFdoeSBkbyB5b3UgbmVlZCB0byByZWludmVudCB0aGUgd2hvbGUgdGhp
bmc/IFdoeSBpc24ndCBpdCBqdXN0Ogo+IAo+IHN0YXRpYyBpbnQgc3RtMzJfZXh0aV9oX3JlcXVl
c3RfcmVzb3VyY2VzKHN0cnVjdCBpcnFfZGF0YSAqZGF0YSkKPiB7Cj4gwqDCoMKgwqDCoMKgwqDC
oGlycV9jaGlwX3JlcXVlc3RfcmVzb3VyY2VzX3BhcmVudChkYXRhKTsKPiDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIDA7Cj4gfQo+IAo+IEFuZCB0aGlzIHJlYWxseSBkZXNlcnZlcyBhIGNvbW1lbnQu
IEkgYWxzbyB3b25kZXIgd2hldGhlciB3ZSBzaG91bGQKPiBjaGFuZ2UgdGhpcyBiZWhhdmlvdXIg
dG8gYWx3YXlzIHJldHVybiAwLgoKTWFyYywKdGhlIHN0bTMyLWV4dGkgc2l0cyBpbiB0aGUgbWlk
ZGxlIG9mIGFuIGlycSBoaWVyYXJjaHksIGV4YWN0bHkgYXMgdGhlCiJJbnRlcnJ1cHQgcmVtYXBw
aW5nIGNvbnRyb2xsZXIiIGluIHRoZSBzZWN0aW9uICJIaWVyYXJjaHkgSVJRIGRvbWFpbiIKaW4g
RG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9pcnEvaXJxLWRvbWFpbi5yc3QKCldoZW4gdGhlICJJT0FQ
SUMgY29udHJvbGxlciIgcnVucyBhIHJlcXVlc3RfKl9pcnEoKSwgaXQgY2F1c2VzIGNhbGxpbmcK
aXJxX3JlcXVlc3RfcmVzb3VyY2VzKCkgb2YgaXRzIHBhcmVudCwgaWYgdGhlIHBhcmVudCBpbXBs
ZW1lbnRzIGl0LgpUaGVyZSBpcyBubyBhdXRvbWF0aWMgcHJvcGFnYXRpb24gaW4gdGhlIGhpZXJh
cmNoeSwgc28gaXQncyB1cCB0byBlYWNoCmlycV9jaGlwIGluIHRoZSBoaWVyYXJjaHkgdG8gcHJv
cGFnYXRlIHRoaXMgY2FsbCB0byBpdHMgcGFyZW50LgpVc2luZyBpcnFfY2hpcF9yZXF1ZXN0X3Jl
c291cmNlc19wYXJlbnQoKSBmaXRzIHRoaXMgdXNlIGNhc2UuCgpBdCB0aGUgZW5kIG9mIHRoZSBj
aGFpbiwgdGhlICJMb2NhbCBBUElDIGNvbnRyb2xsZXIiIGlzIG5vdCBvYmxpZ2VkIHRvCmltcGxl
bWVudCB0aGUgJ29wdGlvbmFsJyBpcnFfcmVxdWVzdF9yZXNvdXJjZXMoKS4gQW5kIGhlcmUgc3Rh
cnRzIHRoZQpwYWluOgppcnFfY2hpcF9yZXF1ZXN0X3Jlc291cmNlc19wYXJlbnQoKSByZXR1cm5z
IC1FTk9TWVMgaWYgdGhlIHBhcmVudCBkb2VzCm5vdCBpbXBsZW1lbnQgdGhlIG9wdGlvbmFsIGly
cV9yZXF1ZXN0X3Jlc291cmNlcygpLgpTbyB3ZSBuZWVkIHRvIGZpbHRlci1vdXQgdGhlIGVycm9y
IGZvciB1bmltcGxlbWVudGVkIGZ1bmN0aW9uLCBlLmcuOgoKc3RhdGljIGludCBzdG0zMl9leHRp
X2hfcmVxdWVzdF9yZXNvdXJjZXMoc3RydWN0IGlycV9kYXRhICpkYXRhKQp7CglpbnQgcmV0OwoJ
cmV0ID0gaXJxX2NoaXBfcmVxdWVzdF9yZXNvdXJjZXNfcGFyZW50KGRhdGEpOwoJLyogbm90IGFu
IGVycm9yIGlmIHBhcmVudCBkb2VzIG5vdCBpbXBsZW1lbnQgaXQgKi8KCXJldHVybiAocmV0ID09
IC1FTk9TWVMpID8gMCA6IHJldDsKfQoKYnV0IHRoZW4gd2UgY2Fubm90IGRpc2NyaW1pbmF0ZSBp
ZiAtRU5PU1lTIGNvbWVzIGZyb20gbWlzc2luZyBvcHRpb25hbAppcnFfcmVxdWVzdF9yZXNvdXJj
ZXMoKSBpbiBwYXJlbnQsIG9yIGZyb20gYW4gZXJyb3IgaW5zaWRlIHBhcmVudCdzCmlycV9yZXF1
ZXN0X3Jlc291cmNlcygpLiBUaGF0J3Mgd2h5IHRoaXMgcGF0Y2ggcmVpbXBsZW1lbnRzIHRoZSB3
aGVlbC4KClNodWxkbid0IGlycV9jaGlwX3JlcXVlc3RfcmVzb3VyY2VzX3BhcmVudCgpIHJldHVy
biAwIHdoZW4gdGhlIHBhcmVudApkb2Vzbid0IGltcGxlbWVudHMgdGhlIG9wdGlvbmFsIG1ldGhv
ZCwgYXMgaXQncyBhbHJlYWR5IHRoZSBjYXNlIGluc2lkZQprZXJuZWwvaXJxL21hbmFnZS5jOjEz
OTAgc3RhdGljIGludCBpcnFfcmVxdWVzdF9yZXNvdXJjZXMoc3RydWN0CmlycV9kZXNjICpkZXNj
KQo/CgpSZWdhcmRzLApBbnRvbmlvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
