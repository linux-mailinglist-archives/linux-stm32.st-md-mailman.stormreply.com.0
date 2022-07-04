Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBDB56562C
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jul 2022 14:54:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5754CC640EF;
	Mon,  4 Jul 2022 12:54:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69B88C640ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 12:54:04 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 264A11Rm009102;
 Mon, 4 Jul 2022 14:53:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=selector1;
 bh=PVb4Y/nz/MVu/ZlYFkjQIxizU3xTIA4qA1VeZ0HrcYM=;
 b=YE5lE7+xzftTo9GGRfkuyS93PX6Tot+2Qjn6vWpttdXVTssyO8ryaEBn0dnMKQAHj3NO
 kg1Ote7e5goQO8zkVDL3/Vqp2NagQtAzA3XSNdXsiISBQ+cUGsXcud/ukAovCeemdAF3
 xRqkFIrHS2p37Iw5OtHewIbevtRhOtRW/MxHfNukTnXhWI7Qt+spSGAX6AGgg8NN+8+O
 phIDYuFl02fS92q+6sLWU2wquBFv2829EDQEvHuSuHoHn+bWK0MGTCwhT7H4WVI8lI25
 HBMGqvo+SnGtDKdLYTso6H6tjbtAQckE+v1L/7taOg3krNqhyOye66VZP+yg8yyksoSi YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h2ben1mr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jul 2022 14:53:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 55BC410002A;
 Mon,  4 Jul 2022 14:53:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C984921E68F;
 Mon,  4 Jul 2022 14:53:40 +0200 (CEST)
Received: from [192.168.8.15] (10.75.127.44) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 4 Jul
 2022 14:53:40 +0200
Message-ID: <4a57677268ac356a006ee35f73ceacdf49ae4221.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Mon, 4 Jul 2022 14:53:36 +0200
In-Reply-To: <20220512160544.13561-1-antonio.borneo@foss.st.com>
References: <20220512160544.13561-1-antonio.borneo@foss.st.com>
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-04_11,2022-06-28_01,2022-06-22_01
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] genirq: Don't return error on missing
 optional irq_request_resources()
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

T24gVGh1LCAyMDIyLTA1LTEyIGF0IDE4OjA1ICswMjAwLCBBbnRvbmlvIEJvcm5lbyB3cm90ZToK
PiBGdW5jdGlvbiBpcnFfY2hpcDo6aXJxX3JlcXVlc3RfcmVzb3VyY2VzKCkgaXMgcmVwb3J0ZWQg
YXMgb3B0aW9uYWwKPiBpbiB0aGUgZGVjbGFyYXRpb24gb2Ygc3RydWN0IGlycV9jaGlwLgo+IElm
IHRoZSBwYXJlbnQgaXJxX2NoaXAgZG9lcyBub3QgaW1wbGVtZW50IGl0LCB3ZSBzaG91bGQgaWdu
b3JlIGl0Cj4gYW5kIHJldHVybi4KPiAKPiBEb24ndCByZXR1cm4gZXJyb3IgaWYgdGhlIGZ1bmN0
aW9ucyBpcyBtaXNzaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQm9ybmVvIDxhbnRv
bmlvLmJvcm5lb0Bmb3NzLnN0LmNvbT4KPiAtLS0KPiAKPiBBcyBmb2xsb3ctdXAgb2YgZGlzY3Vz
c2lvbiBpbgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvODc1eW1kNnhkdS53bC1tYXpA
a2VybmVsLm9yZy8KPiBoZXJlIGlzIGEgcHJvcG9zYWwgZm9yIGNoYW5naW5nIHRoZSByZXR1cm5l
ZCB2YWx1ZS4KPiAKPiBBIHNpbWlsYXIgaXNzdWUgaXMgcHJlc2VudCBmb3IgdGhlIG9wdGlvbmFs
IGZ1bmN0aW9uCj4gaXJxX3NldF92Y3B1X2FmZmluaXR5KCksIHRvIGJlIGNvdmVyZWQgc2VwYXJh
dGVseSwgaWYgbmVlZGVkLgoKR2VudGxlIHBpbmcgZm9yIHRoaXMgcGF0Y2guCkRvZXMgaXQgbWF0
Y2ggdGhlIGV4cGVjdGVkIGJlaGF2aW91ciBmb3IgYW4gb3B0aW9uYWwgZnVuY3Rpb24/CgpUaGFu
a3MsCkFudG9uaW8KCgo+IAo+IC0tLQo+IMKga2VybmVsL2lycS9jaGlwLmMgfCAzICsrLQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9rZXJuZWwvaXJxL2NoaXAuYyBiL2tlcm5lbC9pcnEvY2hpcC5jCj4gaW5kZXggNTRh
ZjBkZWIyMzliLi5lYjkyMTQ4NTkzMGYgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2lycS9jaGlwLmMK
PiArKysgYi9rZXJuZWwvaXJxL2NoaXAuYwo+IEBAIC0xNTEzLDcgKzE1MTMsOCBAQCBpbnQgaXJx
X2NoaXBfcmVxdWVzdF9yZXNvdXJjZXNfcGFyZW50KHN0cnVjdAo+IGlycV9kYXRhICpkYXRhKQo+
IMKgwqDCoMKgwqDCoMKgwqBpZiAoZGF0YS0+Y2hpcC0+aXJxX3JlcXVlc3RfcmVzb3VyY2VzKQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGRhdGEtPmNoaXAtPmlycV9y
ZXF1ZXN0X3Jlc291cmNlcyhkYXRhKTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoHJldHVybiAtRU5P
U1lTOwo+ICvCoMKgwqDCoMKgwqDCoC8qIG5vIGVycm9yIG9uIG1pc3Npbmcgb3B0aW9uYWwKPiBp
cnFfY2hpcDo6aXJxX3JlcXVlc3RfcmVzb3VyY2VzICovCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJu
IDA7Cj4gwqB9Cj4gwqBFWFBPUlRfU1lNQk9MX0dQTChpcnFfY2hpcF9yZXF1ZXN0X3Jlc291cmNl
c19wYXJlbnQpOwo+IMKgCj4gCj4gYmFzZS1jb21taXQ6IGM1ZWIwYTYxMjM4ZGQ2ZmFmMzdmNThj
OWNlNjFjOTk4MGFhZmZkN2EKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
