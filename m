Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 32310B14887
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7DE3C3F93C;
	Tue, 29 Jul 2025 06:49:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5A0AC32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jul 2025 13:39:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ODAgol018828;
 Thu, 24 Jul 2025 15:38:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 w9y6lMVKoGSGbAQ4r7YRTQAIypLEALnPa938lwZnu4s=; b=8DuW1mVWb5Zmz+q0
 7RKe020XQCaScSNVrCjpPnmByr2ryfDEsJqHwQPObJeuAtdyS46qENjf789qB2Gn
 Y9jkz0gnExfyBxnDdCXcKF/U1bvmXiPSL0WnENoFzkBrzJOHYylmsIvuGCerLywl
 ZaA9oZ7lKwFoF195X342XP1lYemLrGWn/qjVkHL6zChh+CpYuigHX7/+E62GiSba
 SVAHo4H6Hei4POCBjTIbbBtR678I3fMIdBg41DlglPcRw9/urX+wij9vSihPDcRp
 TxPHyIN2JW2TvS5/OuWkzhrAFqWa9uAwPyPD4tuvxnn6RfeIub6Uo+oLKBm8zZIJ
 H13+MA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800g91e0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Jul 2025 15:38:57 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4750C4005D;
 Thu, 24 Jul 2025 15:37:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 594A6763978;
 Thu, 24 Jul 2025 15:36:56 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 15:36:55 +0200
Message-ID: <99737d4f-488d-4208-91aa-83ce52957147@foss.st.com>
Date: Thu, 24 Jul 2025 15:36:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Helgaas <helgaas@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>
References: <20250723210753.GA2911683@bhelgaas>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <20250723210753.GA2911683@bhelgaas>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: robh@kernel.org, mani@kernel.org, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, mcoquelin.stm32@gmail.com, bhelgaas@google.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 kwilczynski@kernel.org
Subject: Re: [Linux-stm32] [RESEND PATCH 0/2] Add
 pinctrl_pm_select_init_state helper function
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

CgpPbiA3LzIzLzI1IDIzOjA3LCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+IE9uIFdlZCwgSnVsIDIz
LCAyMDI1IGF0IDAxOjMyOjUyUE0gKzAyMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4+IE9uIFRo
dSwgSnVsIDE3LCAyMDI1IGF0IDg6MzPigK9BTSBDaHJpc3RpYW4gQnJ1ZWwKPj4gPGNocmlzdGlh
bi5icnVlbEBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4+Cj4+PiBXZSBoYXZlIHRoZSBoZWxwZXIgZnVu
Y3Rpb25zIHBpbmN0cmxfcG1fc2VsZWN0X2RlZmF1bHRfc3RhdGUgYW5kCj4+PiBwaW5jdHJsX3Bt
X3NlbGVjdF9zbGVlcF9zdGF0ZS4KPj4+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgbWlzc2luZyBwaW5j
dHJsX3BtX3NlbGVjdF9pbml0X3N0YXRlIGZ1bmN0aW9uLgo+Pj4KPj4+IFRoZSBTVE0zMk1QMiBu
ZWVkcyB0byBzZXQgdGhlIHBpbmN0cmwgdG8gYW4gaW5pdGlhbCBzdGF0ZSBkdXJpbmcKPj4+IHBt
X3Jlc3VtZSwganVzdCBsaWtlIGluIHByb2JlLiBUbyBhY2hpZXZlIHRoaXMsIHRoZSBmdW5jdGlv
bgo+Pj4gcGluY3RybF9wbV9zZWxlY3RfaW5pdF9zdGF0ZSBpcyBhZGRlZC4KPj4+Cj4+PiBUaGlz
IGFsbG93cyBhIGRyaXZlciB0byBiYWxhbmNlIHBpbmN0cmxfcG1fc2VsZWN0X3NsZWVwX3N0YXRl
KCkKPj4+IHdpdGggcGluY3RybF9wbV9zZWxlY3RfZGVmYXVsdF9zdGF0ZSgpIGFuZAo+Pj4gcGlu
Y3RybF9wbV9zZWxlY3RfaW5pdF9zdGF0ZSgpIGluIHBtX3J1bnRpbWVfc3VzcGVuZCBhbmQgcG1f
cnVudGltZV9yZXN1bWUuCj4+Pgo+Pj4gQ2hyaXN0aWFuIEJydWVsICgyKToKPj4+ICAgIHBpbmN0
cmw6IEFkZCBwaW5jdHJsX3BtX3NlbGVjdF9pbml0X3N0YXRlIGhlbHBlciBmdW5jdGlvbgo+Pj4g
ICAgUENJOiBzdG0zMjogdXNlIHBpbmN0cmxfcG1fc2VsZWN0X2luaXRfc3RhdGUoKSBpbgo+Pj4g
ICAgICBzdG0zMl9wY2llX3Jlc3VtZV9ub2lycSgpCj4+Cj4+IElmIEJqb3JuIEhlbGdhYXMgaXMg
T0sgd2l0aCBpdCBJIGNhbiBhcHBseSB0aGlzIHRvIHRoZSBwaW5jdHJsIHRyZWUuCj4+Cj4+IE90
aGVyd2lzZSBJIGNhbiBhbHNvIGp1c3QgYXBwbHkgcGF0Y2ggMS8yLCBidXQgdGhhdCBkb2Vzbid0
IHNvbHZlCj4+IGFueSBwcm9ibGVtLgo+IAo+IFRoZSBzdG0zMiBkcml2ZXIgaGFzIGJlZW4gcG9z
dGVkIGFuZCBpcyBvbiB0aGlzIGJyYW5jaCBvZiB0aGUgUENJCj4gdHJlZToKPiAKPiAgICBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wY2kvcGNpLmdpdC9s
b2cvP2g9Y29udHJvbGxlci9kd2Mtc3RtMzImaWQ9NWE5NzJhMDFlMjRiCj4gCj4gYnV0IGl0J3Mg
bm90IGluIG1haW5saW5lIChvciBldmVuIGluIHBjaS9uZXh0KSB5ZXQsIHNvIHlvdSB3b3VsZCBv
bmx5Cj4gYmUgYWJsZSB0byBhcHBseSBwYXRjaCAyLzIgaWYgeW91IHRvb2sgdGhlIHdob2xlIGRy
aXZlciwgd2hpY2ggaXMKPiBwcm9iYWJseSBtb3JlIHRoYW4geW91IHdvdWxkIHdhbnQgdG8gZG8u
Cj4gCj4gSSBoYXZlbid0IHB1dCBpdCBpbiBwY2kvbmV4dCB5ZXQgYmVjYXVzZSBpdCBkb2Vzbid0
IGJ1aWxkIHdoZW4KPiBDT05GSUdfUElOQ1RSTCBpcyBub3QgZGVmaW5lZDoKPiAKPiAgICBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwNzE2MTkyNDE4LkdBMjU1MDg2MUBiaGVsZ2Fhcwo+
IAo+IEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgcGluY3RybCB0byBrbm93IHdoeSBzdG0zMiBu
ZWVkcyB0aGlzIHdoZW4KPiBub2JvZHkgZWxzZSBzZWVtcyB0by4gIEkgZG91YnQgaXQncyByZWFs
bHkgdW5pcXVlLCBzbyBtYXliZSBpdCdzIGp1c3QKPiBub3QgZG9pbmcgdGhlIHJpZ2h0IHRoaW5n
IGhlcmUuCgpUaGUgU1RNMzJNUDIgaXMgdW5pcXVlIGJlY2F1c2UgdGhlIGNvcmUgY2xvY2sgaXMg
Z2F0ZWQgb24gQ0xLUkVRIy4gCkNvbnNlcXVlbnRseSwgaXQgaXMgbm90IHBvc3NpYmxlIHRvIGFj
Y2VzcyB0aGUgY29yZSByZWdpc3RlcnMgZnJvbSBEQkkgCndoZW4gbm8gY2FyZCBpcyBhdHRhY2hl
ZCwgY2F1c2luZyB0aGUgYm9hcmQgdG8gZnJlZXplLiBJIGRvbid0IGtub3cgCmFub3RoZXIgcGxh
dGZvcm0gd2l0aCB0aGlzIGxpbWl0YXRpb24KClRvIGZpeCB0aGlzLCB3ZSB1c2UgYSBHUElPIHRv
IGRlLWFzc2VydCBDTEtSRVEjIGR1cmluZyBwcm9iZSBhbmQgcmVzdG9yZSAKdGhlIHBpbiB0byBp
dHMgZGVmYXVsdCBBRiBtb2RlIGFmdGVyd2FyZC4gVGhpcyB3b3JrcyBwZXJmZWN0bHkgZm9yIApw
cm9iZSwgYnV0IHdlIGxhY2sgZnVuY3Rpb25hbGl0eSBmb3IgUE0gcmVzdW1lIHVubGVzcyB3ZSBl
eHBsaWNpdGx5IApzZWxlY3QgdGhlIHN0YXRlIHdpdGggcGluY3RybF9wbV9zZWxlY3RfWFhYX3N0
YXRlKCkuCgpGb3IgcmVmZXJlbmNlLCB0aGUgaW5pdF9zdGF0ZSBmdW5jdGlvbmFsaXR5IHdhcyBp
bnRyb2R1Y2VkIGluCmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE1LzEwLzIxLzEKCklmIHdlIHBy
ZWZlciBub3QgdG8gZXh0ZW5kIHRoZSBwaW5jdHJsIEFQSSBpbiBwYXRjaCAxLzIsIEkgY2FuIGZp
eCB0aGUgCmNhc2UgaW4gcGF0Y2ggMi8yIG9ubHkgd2l0aCBzb21ldGhpbmcgbGlrZToKCmluIHN0
bTMyX3BjaWVfcHJvYmUoKQogICAgICBwaW5jdHJsID0gZGV2bV9waW5jdHJsX2dldChkZXYpOwoK
ICAgICAgaWYocGluY3RybCE9IC1FTk9ERVYpIC8vIFBJTkNUUkwgaXMgZGVmaW5lZAogICAgICAg
ICAgIHBpbmN0cmxfaW5pdCA9IHBpbmN0cmxfbG9va3VwX3N0YXRlKHN0bTMyX3BjaWU+cGluY3Ry
bCwgClBJTkNUUkxfU1RBVEVfSU4KCmluIHN0bTMyX3BjaWVfcmVzdW1lX25vaXJxKCkKICAgIGlm
IChwaW5jdHJsKSB7CiAgICAgICAgICAgcmV0ID0gcGluY3RybF9zZWxlY3Rfc3RhdGUoc3RtMzJf
cGNpZS0+cGluY3RybCwgCnN0bTMyX3BjaWUtPnBpbmN0cmxfaW5pdCk7CgpXaGF0IGRvIHlvdSBh
ZHZpc2UgPwoKdGhhbmsgeW91CgpDaHJpc3RpYW4KCgoKPiAKPiBCam9ybgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
