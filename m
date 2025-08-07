Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E79DCB1E321
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Aug 2025 09:24:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A94ABC349C4;
	Fri,  8 Aug 2025 07:24:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 587FDC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 14:17:56 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577DQaY4023128;
 Thu, 7 Aug 2025 16:17:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 0rKaft9+XU83BazRufG1bMpf0DcHNm09LrzRYaslGhI=; b=jcNwdx4nFkb1smh5
 h5I16w88LgIWv9EFwVomPh41WuDDm3tU7puXrvrzQiVSR1tvJRm7DCk5cFWC7Eom
 Qwg1OwWGqvZUyjm07/BYReQSQo79lSF1dhIf9oKjstVoB9bWPfvACu2Oc8xw+84f
 Zlhh5p0bqDLXFK4VJlhOPKdkrUwW/7pfYQgC0sTAs4EcR8+RFeBT/dMkUzmzxZM+
 uFyOQ0dhCccbAYgg8w3+HpWrxjhMOq43zPfM/MXN8fF5kXMtitJph28y9NgOhd5d
 G6m1tRUZsRJ5bc4Nm4yfONACvLJTSu0R4A7uIAQ+f/XpTOuDer4E7FPtzm2ZfWkL
 L9UTIw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48bpx083p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Aug 2025 16:17:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0A04840046;
 Thu,  7 Aug 2025 16:16:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5DA2371582F;
 Thu,  7 Aug 2025 16:15:42 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 16:15:41 +0200
Message-ID: <cb76e0da-f4c9-4aaf-8e0b-4666738d238e@foss.st.com>
Date: Thu, 7 Aug 2025 16:15:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>
References: <20250723210753.GA2911683@bhelgaas>
 <99737d4f-488d-4208-91aa-83ce52957147@foss.st.com>
Content-Language: en-US
In-Reply-To: <99737d4f-488d-4208-91aa-83ce52957147@foss.st.com>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_03,2025-08-06_01,2025-03-28_01
X-Mailman-Approved-At: Fri, 08 Aug 2025 07:24:10 +0000
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

R2VudGxlIHBpbmcsCgpNYXliZSB0aGUgYmVzdCBmb3IgTGludXMgaXMgdG8gYXBwbHkgb25seSAx
LzIgb24gaGlzIHBpbmN0cmwgdHJlZS4KCkknbGwgcmViYXNlIDIvMiBzdG0zMiBQQ0llIHBhcnQg
YWZ0ZXIgdGhlIG1lcmdlIHRvIG1haW5saW5lIGFuZCByZXNwaW4gCmZvciB0aGUgUENJIHRyZWUK
CkJlc3QgUmVnYXJkcwoKQ2hyaXN0aWFuCgpPbiA3LzI0LzI1IDE1OjM2LCBDaHJpc3RpYW4gQnJ1
ZWwgd3JvdGU6Cj4gCj4gCj4gT24gNy8yMy8yNSAyMzowNywgQmpvcm4gSGVsZ2FhcyB3cm90ZToK
Pj4gT24gV2VkLCBKdWwgMjMsIDIwMjUgYXQgMDE6MzI6NTJQTSArMDIwMCwgTGludXMgV2FsbGVp
aiB3cm90ZToKPj4+IE9uIFRodSwgSnVsIDE3LCAyMDI1IGF0IDg6MzPigK9BTSBDaHJpc3RpYW4g
QnJ1ZWwKPj4+IDxjaHJpc3RpYW4uYnJ1ZWxAZm9zcy5zdC5jb20+IHdyb3RlOgo+Pj4KPj4+PiBX
ZSBoYXZlIHRoZSBoZWxwZXIgZnVuY3Rpb25zIHBpbmN0cmxfcG1fc2VsZWN0X2RlZmF1bHRfc3Rh
dGUgYW5kCj4+Pj4gcGluY3RybF9wbV9zZWxlY3Rfc2xlZXBfc3RhdGUuCj4+Pj4gVGhpcyBwYXRj
aCBhZGRzIHRoZSBtaXNzaW5nIHBpbmN0cmxfcG1fc2VsZWN0X2luaXRfc3RhdGUgZnVuY3Rpb24u
Cj4+Pj4KPj4+PiBUaGUgU1RNMzJNUDIgbmVlZHMgdG8gc2V0IHRoZSBwaW5jdHJsIHRvIGFuIGlu
aXRpYWwgc3RhdGUgZHVyaW5nCj4+Pj4gcG1fcmVzdW1lLCBqdXN0IGxpa2UgaW4gcHJvYmUuIFRv
IGFjaGlldmUgdGhpcywgdGhlIGZ1bmN0aW9uCj4+Pj4gcGluY3RybF9wbV9zZWxlY3RfaW5pdF9z
dGF0ZSBpcyBhZGRlZC4KPj4+Pgo+Pj4+IFRoaXMgYWxsb3dzIGEgZHJpdmVyIHRvIGJhbGFuY2Ug
cGluY3RybF9wbV9zZWxlY3Rfc2xlZXBfc3RhdGUoKQo+Pj4+IHdpdGggcGluY3RybF9wbV9zZWxl
Y3RfZGVmYXVsdF9zdGF0ZSgpIGFuZAo+Pj4+IHBpbmN0cmxfcG1fc2VsZWN0X2luaXRfc3RhdGUo
KSBpbiBwbV9ydW50aW1lX3N1c3BlbmQgYW5kIAo+Pj4+IHBtX3J1bnRpbWVfcmVzdW1lLgo+Pj4+
Cj4+Pj4gQ2hyaXN0aWFuIEJydWVsICgyKToKPj4+PiDCoMKgIHBpbmN0cmw6IEFkZCBwaW5jdHJs
X3BtX3NlbGVjdF9pbml0X3N0YXRlIGhlbHBlciBmdW5jdGlvbgo+Pj4+IMKgwqAgUENJOiBzdG0z
MjogdXNlIHBpbmN0cmxfcG1fc2VsZWN0X2luaXRfc3RhdGUoKSBpbgo+Pj4+IMKgwqDCoMKgIHN0
bTMyX3BjaWVfcmVzdW1lX25vaXJxKCkKPj4+Cj4+PiBJZiBCam9ybiBIZWxnYWFzIGlzIE9LIHdp
dGggaXQgSSBjYW4gYXBwbHkgdGhpcyB0byB0aGUgcGluY3RybCB0cmVlLgo+Pj4KPj4+IE90aGVy
d2lzZSBJIGNhbiBhbHNvIGp1c3QgYXBwbHkgcGF0Y2ggMS8yLCBidXQgdGhhdCBkb2Vzbid0IHNv
bHZlCj4+PiBhbnkgcHJvYmxlbS4KPj4KPj4gVGhlIHN0bTMyIGRyaXZlciBoYXMgYmVlbiBwb3N0
ZWQgYW5kIGlzIG9uIHRoaXMgYnJhbmNoIG9mIHRoZSBQQ0kKPj4gdHJlZToKPj4KPj4gwqDCoCBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wY2kvcGNpLmdp
dC9sb2cvPyAKPj4gaD1jb250cm9sbGVyL2R3Yy1zdG0zMiZpZD01YTk3MmEwMWUyNGIKPj4KPj4g
YnV0IGl0J3Mgbm90IGluIG1haW5saW5lIChvciBldmVuIGluIHBjaS9uZXh0KSB5ZXQsIHNvIHlv
dSB3b3VsZCBvbmx5Cj4+IGJlIGFibGUgdG8gYXBwbHkgcGF0Y2ggMi8yIGlmIHlvdSB0b29rIHRo
ZSB3aG9sZSBkcml2ZXIsIHdoaWNoIGlzCj4+IHByb2JhYmx5IG1vcmUgdGhhbiB5b3Ugd291bGQg
d2FudCB0byBkby4KPj4KPj4gSSBoYXZlbid0IHB1dCBpdCBpbiBwY2kvbmV4dCB5ZXQgYmVjYXVz
ZSBpdCBkb2Vzbid0IGJ1aWxkIHdoZW4KPj4gQ09ORklHX1BJTkNUUkwgaXMgbm90IGRlZmluZWQ6
Cj4+Cj4+IMKgwqAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDcxNjE5MjQxOC5HQTI1
NTA4NjFAYmhlbGdhYXMKPj4KPj4gSSBkb24ndCBrbm93IGVub3VnaCBhYm91dCBwaW5jdHJsIHRv
IGtub3cgd2h5IHN0bTMyIG5lZWRzIHRoaXMgd2hlbgo+PiBub2JvZHkgZWxzZSBzZWVtcyB0by7C
oCBJIGRvdWJ0IGl0J3MgcmVhbGx5IHVuaXF1ZSwgc28gbWF5YmUgaXQncyBqdXN0Cj4+IG5vdCBk
b2luZyB0aGUgcmlnaHQgdGhpbmcgaGVyZS4KPiAKPiBUaGUgU1RNMzJNUDIgaXMgdW5pcXVlIGJl
Y2F1c2UgdGhlIGNvcmUgY2xvY2sgaXMgZ2F0ZWQgb24gQ0xLUkVRIy4gCj4gQ29uc2VxdWVudGx5
LCBpdCBpcyBub3QgcG9zc2libGUgdG8gYWNjZXNzIHRoZSBjb3JlIHJlZ2lzdGVycyBmcm9tIERC
SSAKPiB3aGVuIG5vIGNhcmQgaXMgYXR0YWNoZWQsIGNhdXNpbmcgdGhlIGJvYXJkIHRvIGZyZWV6
ZS4gSSBkb24ndCBrbm93IAo+IGFub3RoZXIgcGxhdGZvcm0gd2l0aCB0aGlzIGxpbWl0YXRpb24K
PiAKPiBUbyBmaXggdGhpcywgd2UgdXNlIGEgR1BJTyB0byBkZS1hc3NlcnQgQ0xLUkVRIyBkdXJp
bmcgcHJvYmUgYW5kIHJlc3RvcmUgCj4gdGhlIHBpbiB0byBpdHMgZGVmYXVsdCBBRiBtb2RlIGFm
dGVyd2FyZC4gVGhpcyB3b3JrcyBwZXJmZWN0bHkgZm9yIAo+IHByb2JlLCBidXQgd2UgbGFjayBm
dW5jdGlvbmFsaXR5IGZvciBQTSByZXN1bWUgdW5sZXNzIHdlIGV4cGxpY2l0bHkgCj4gc2VsZWN0
IHRoZSBzdGF0ZSB3aXRoIHBpbmN0cmxfcG1fc2VsZWN0X1hYWF9zdGF0ZSgpLgo+IAo+IEZvciBy
ZWZlcmVuY2UsIHRoZSBpbml0X3N0YXRlIGZ1bmN0aW9uYWxpdHkgd2FzIGludHJvZHVjZWQgaW4K
PiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxNS8xMC8yMS8xCj4gCj4gSWYgd2UgcHJlZmVyIG5v
dCB0byBleHRlbmQgdGhlIHBpbmN0cmwgQVBJIGluIHBhdGNoIDEvMiwgSSBjYW4gZml4IHRoZSAK
PiBjYXNlIGluIHBhdGNoIDIvMiBvbmx5IHdpdGggc29tZXRoaW5nIGxpa2U6Cj4gCj4gaW4gc3Rt
MzJfcGNpZV9wcm9iZSgpCj4gIMKgwqDCoMKgIHBpbmN0cmwgPSBkZXZtX3BpbmN0cmxfZ2V0KGRl
dik7Cj4gCj4gIMKgwqDCoMKgIGlmKHBpbmN0cmwhPSAtRU5PREVWKSAvLyBQSU5DVFJMIGlzIGRl
ZmluZWQKPiAgwqDCoMKgwqDCoMKgwqDCoMKgIHBpbmN0cmxfaW5pdCA9IHBpbmN0cmxfbG9va3Vw
X3N0YXRlKHN0bTMyX3BjaWU+cGluY3RybCwgCj4gUElOQ1RSTF9TVEFURV9JTgo+IAo+IGluIHN0
bTMyX3BjaWVfcmVzdW1lX25vaXJxKCkKPiAgwqDCoCBpZiAocGluY3RybCkgewo+ICDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0ID0gcGluY3RybF9zZWxlY3Rfc3RhdGUoc3RtMzJfcGNpZS0+cGluY3Ry
bCwgc3RtMzJfcGNpZS0gCj4gID5waW5jdHJsX2luaXQpOwo+IAo+IFdoYXQgZG8geW91IGFkdmlz
ZSA/Cj4gCj4gdGhhbmsgeW91Cj4gCj4gQ2hyaXN0aWFuCj4gCj4gCj4gCj4+Cj4+IEJqb3JuCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
