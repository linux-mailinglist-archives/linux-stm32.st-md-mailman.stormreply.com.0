Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C98B856563C
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jul 2022 14:56:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89B02C640EF;
	Mon,  4 Jul 2022 12:56:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32FC2C640ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Jul 2022 12:56:50 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 264AHs5e008697;
 Mon, 4 Jul 2022 14:56:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=selector1;
 bh=/xn9WTxm3J+BhSPtpIQTJNXDo4Fe/OymRKXzxlOXDTA=;
 b=rh+plKvW9YVXlfBodCYoSFhJE7wCWujRZ8eqmBePb13lcaaz5pMgg+AaF2w73XgSRtf+
 t/gC9J95mqtsj71L/mT4j1WMpIBIOYLlyV93iS5NyXTxB7OUmpKy5jyPhuAdRzaHSyiF
 mw36Yys+IxnYRcXsRrsRMHPOmOJNT4a84MLIqFe1BoVi1KKmQ5b+WSDA7emJTigvmU9v
 zcHsUok2y6FxGB72HcSvtd3cf2xA+Xk3RFATy83SWzImuf48KrPjMlm/kTCap3oyQVXc
 HCrodpAQQFMqTyV4U4qQSH0q9P/g7pvftr+yWMH4FTt9esQ+iAiw8X/dDerMfwFAhQqN 9Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h2ben1n6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jul 2022 14:56:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9913910002A;
 Mon,  4 Jul 2022 14:56:33 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9401C21E691;
 Mon,  4 Jul 2022 14:56:33 +0200 (CEST)
Received: from [192.168.8.15] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 4 Jul
 2022 14:56:32 +0200
Message-ID: <d42a1360b522585dfa214c3152da4aa018bd6013.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Date: Mon, 4 Jul 2022 14:56:29 +0200
In-Reply-To: <20220606162757.415354-1-antonio.borneo@foss.st.com>
References: <20220510164123.557921-1-antonio.borneo@foss.st.com>
 <20220606162757.415354-1-antonio.borneo@foss.st.com>
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-04_11,2022-06-28_01,2022-06-22_01
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Loic Pallardy <loic.pallardy@foss.st.com>,
 Pascal Paillet <p.paillet@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v2 0/6] irqchip/stm32-exti: Fixes and
	simplifications
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

T24gTW9uLCAyMDIyLTA2LTA2IGF0IDE4OjI3ICswMjAwLCBBbnRvbmlvIEJvcm5lbyB3cm90ZToK
PiBUaGlzIHNlcmllcyBhZGRyZXNzIHNvbWUgY29kZSBmaXggZm9yIGlycS1zdG0zMi1leHRpIGRy
aXZlciBhbmQKPiBzaW1wbGlmaWVzIHRoZSB0YWJsZSB0aGF0IHJlbWFwcyB0aGUgaW50ZXJydXB0
cyBmcm9tIGV4dGkgdG8gZ2ljLgo+IAoKR2VudGxlIHBpbmcgZm9yIHRoaXMgc2VyaWVzLgpJZiB0
aGVyZSBpcyBhbnl0aGluZyBJIGNhbiBkbyB0byBsZXQgdGhpcyBzZXJpZXMgcHJvY2VlZCwgcGxl
YXNlIGxldCBtZQprbm93LgoKVGhhbmtzLApBbnRvbmlvCgo+IHYxLT52Mgo+IMKgLSBQcm9wZXJs
eSBmb3JtYXQgdGhlIGNvbW1pdCB0aXRsZSBhbmQgZXhwYW5kIHRoZSBjb21taXQgbXNnOwo+IMKg
LSBkcm9wIHRoZSBwYXRjaCB2MSA0Lzc6Cj4gwqDCoCAiaXJxY2hpcC9zdG0zMi1leHRpOiBmb3J3
YXJkIGlycV9yZXF1ZXN0X3Jlc291cmNlcyB0byBwYXJlbnQiCj4gwqDCoCBpbiBmYXZvciBvZiB0
aGUgZ2VuZXJpYzoKPiDCoMKgCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIyMDUx
MjE2MDU0NC4xMzU2MS0xLWFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tLwo+IMKgwqAgImdlbmly
cTogRG9uJ3QgcmV0dXJuIGVycm9yIG9uIG1pc3Npbmcgb3B0aW9uYWwKPiDCoMKgIGlycV9yZXF1
ZXN0X3Jlc291cmNlcygpIjsKPiDCoC0gdXNlIGNvbnNpc3RlbnRseSBVTkRFRl9SRUcgZm9yIG5v
biBleGlzdGluZyBFTVIgcmVnaXN0ZXJzOwo+IMKgLSByZWJhc2Ugb24gdjUuMTktcmMxLgo+IAo+
IAo+IEFsZXhhbmRyZSBUb3JndWUgKDEpOgo+IMKgIGlycWNoaXAvc3RtMzItZXh0aTogVGFnIGVt
ciByZWdpc3RlciBhcyB1bmRlZmluZWQgZm9yIHN0bTMybXAxNQo+IAo+IEFudG9uaW8gQm9ybmVv
ICgzKToKPiDCoCBpcnFjaGlwL3N0bTMyLWV4dGk6IFByZXZlbnQgaWxsZWdhbCByZWFkIGR1ZSB0
byB1bmJvdW5kZWQgRFQgdmFsdWUKPiDCoCBpcnFjaGlwL3N0bTMyLWV4dGk6IFJlYWQgZXZlbnQg
dHJpZ2dlciB0eXBlIGZyb20gZXZlbnRfdHJnIHJlZ2lzdGVyCj4gwqAgaXJxY2hpcC9zdG0zMi1l
eHRpOiBTaW1wbGlmeSBpcnEgZGVzY3JpcHRpb24gdGFibGUKPiAKPiBMb2ljIFBhbGxhcmR5ICgx
KToKPiDCoCBpcnFjaGlwL3N0bTMyLWV4dGk6IEZpeCBpcnFfbWFzay9pcnFfdW5tYXNrIGZvciBk
aXJlY3QgZXZlbnRzCj4gCj4gTHVkb3ZpYyBCYXJyZSAoMSk6Cj4gwqAgaXJxY2hpcC9zdG0zMi1l
eHRpOiBGaXggaXJxX3NldF9hZmZpbml0eSByZXR1cm4gdmFsdWUKPiAKPiDCoGRyaXZlcnMvaXJx
Y2hpcC9pcnEtc3RtMzItZXh0aS5jIHwgMjUwICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
Cj4gLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMjQgaW5zZXJ0aW9ucygrKSwgMTI2IGRlbGV0aW9u
cygtKQo+IAo+IAo+IGJhc2UtY29tbWl0OiBmMjkwNmFhODYzMzgxYWZiMDAxNWE5ZWI3ZmVmYWQ4
ODVkNGU1YTU2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
