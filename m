Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B98B25CC0
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Aug 2025 09:11:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38ADBC36B3E;
	Thu, 14 Aug 2025 07:11:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2475C36B15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Aug 2025 16:43:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCEFB12FC;
 Wed, 13 Aug 2025 09:43:25 -0700 (PDT)
Received: from e130802.arm.com (e130802.arm.com [10.1.33.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0D923F5A1;
 Wed, 13 Aug 2025 09:43:30 -0700 (PDT)
Date: Wed, 13 Aug 2025 17:42:58 +0100
From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <aJzAkk-k4nfXY7Ux@e130802.arm.com>
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
 <20250625094028.758016-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250625094028.758016-3-arnaud.pouliquen@foss.st.com>
X-Mailman-Approved-At: Thu, 14 Aug 2025 07:11:38 +0000
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, op-tee@lists.trustedfirmware.org,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, Srinivas Kalaga <Srinivas.Kalaga2@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v19 2/6] remoteproc: Add TEE support
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

SGkgQXJuYXVkLAoKPiBBZGQgYSByZW1vdGVwcm9jIFRFRSAoVHJ1c3RlZCBFeGVjdXRpb24gRW52
aXJvbm1lbnQpIGRyaXZlciB0aGF0IHdpbGwgYmUKPiBwcm9iZWQgYnkgdGhlIFRFRSBidXMuIElm
IHRoZSBhc3NvY2lhdGVkIFRydXN0ZWQgYXBwbGljYXRpb24gaXMgc3VwcG9ydGVkCj4gb24gdGhl
IHNlY3VyZSBwYXJ0LCB0aGlzIGRyaXZlciBvZmZlcnMgYSBjbGllbnQgaW50ZXJmYWNlIHRvIGxv
YWQgZmlybXdhcmUKPiBieSB0aGUgc2VjdXJlIHBhcnQuCj4gVGhpcyBmaXJtd2FyZSBjb3VsZCBi
ZSBhdXRoZW50aWNhdGVkIGJ5IHRoZSBzZWN1cmUgdHJ1c3RlZCBhcHBsaWNhdGlvbi4KPiAKPiBB
IHNwZWNpZmljaXR5IG9mIHRoZSBpbXBsZW1lbnRhdGlvbiBpcyB0aGF0IHRoZSBmaXJtd2FyZSBo
YXMgdG8gYmUKPiBhdXRoZW50aWNhdGVkIGFuZCBvcHRpb25hbGx5IGRlY3J5cHRlZCB0byBhY2Nl
c3MgdGhlIHJlc291cmNlIHRhYmxlLgo+IAo+IENvbnNlcXVlbnRseSwgdGhlIGJvb3Qgc2VxdWVu
Y2UgaXM6Cj4gCj4gMSkgcnByb2NfcGFyc2VfZncgLS0+IHJwcm9jX3RlZV9wYXJzZV9mdwo+ICAg
IHJlbW90ZXByb2MgVEVFOgo+ICAgIC0gUmVxdWVzdHMgdGhlIFRFRSBhcHBsaWNhdGlvbiB0byBh
dXRoZW50aWNhdGUgYW5kIGxvYWQgdGhlIGZpcm13YXJlCj4gICAgICBpbiB0aGUgcmVtb3RlIHBy
b2Nlc3NvciBtZW1vcmllcy4KPiAgICAtIFJlcXVlc3RzIHRoZSBURUUgYXBwbGljYXRpb24gZm9y
IHRoZSBhZGRyZXNzIG9mIHRoZSByZXNvdXJjZSB0YWJsZS4KPiAgICAtIENyZWF0ZXMgYSBjb3B5
IG9mIHRoZSByZXNvdXJjZSB0YWJsZSBzdG9yZWQgaW4gcnByb2MtPmNhY2hlZF90YWJsZS4KPiAK
PiAyKSBycHJvY19sb2FkX3NlZ21lbnRzIC0tPiBycHJvY190ZWVfbG9hZF9mdwo+ICAgIHJlbW90
ZXByb2MgVEVFOgo+ICAgIC0gUmVxdWVzdHMgdGhlIFRFRSBhcHBsaWNhdGlvbiB0byBsb2FkIHRo
ZSBmaXJtd2FyZS4gTm90aGluZyBpcyBkb25lCj4gICAgICBhdCB0aGUgVEVFIGFwcGxpY2F0aW9u
IGFzIHRoZSBmaXJtd2FyZSBpcyBhbHJlYWR5IGxvYWRlZC4KPiAgICAtIEluIGNhc2Ugb2YgcmVj
b3ZlcnksIHRoZSBURUUgYXBwbGljYXRpb24gaGFzIHRvIHJlbG9hZCB0aGUgZmlybXdhcmUuCj4g
Cj4gMykgcnByb2NfdGVlX2dldF9sb2FkZWRfcnNjX3RhYmxlCj4gICAgcmVtb3RlcHJvYyBURUUg
cmVxdWVzdHMgdGhlIFRFRSBhcHBsaWNhdGlvbiBmb3IgdGhlIGFkZHJlc3Mgb2YgdGhlCj4gICAg
cmVzb3VyY2UgdGFibGUuCj4gCj4gNCkgcnByb2Nfc3RhcnQgLS0+IHJwcm9jX3RlZV9zdGFydAo+
ICAgIC0gUmVxdWVzdHMgdGhlIFRFRSBhcHBsaWNhdGlvbiB0byBzdGFydCB0aGUgcmVtb3RlIHBy
b2Nlc3Nvci4KPiAKPiBUaGUgc2h1dGRvd24gc2VxdWVuY2UgaXM6Cj4gCj4gNSkgcnByb2Nfc3Rv
cCAtLT4gcnByb2NfdGVlX3N0b3AKPiAgICAtIFJlcXVlc3RzIHRoZSBURUUgYXBwbGljYXRpb24g
dG8gc3RvcCB0aGUgcmVtb3RlIHByb2Nlc3Nvci4KPiAKPiA2KSBycHJvY190ZWVfcmVsZWFzZV9m
dwo+ICAgIFRoaXMgZnVuY3Rpb24gaXMgdXNlZCB0byByZXF1ZXN0IHRoZSBURUUgYXBwbGljYXRp
b24gdG8gcGVyZm9ybSBhY3Rpb25zCj4gICAgdG8gcmV0dXJuIHRvIHRoZSBpbml0aWFsIHN0YXRl
IG9uIHN0b3Agb3Igb24gZXJyb3IgZHVyaW5nIHRoZSBib290Cj4gICAgc2VxdWVuY2UuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQXJuYXVkIFBvdWxpcXVlbiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0
LmNvbT4KLi4uCj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHRlZV9jbGllbnRfZGV2aWNlX2lk
IHJwcm9jX3RlZV9pZF90YWJsZVtdID0gewo+ICsJe1VVSURfSU5JVCgweDgwYTRjMjc1LCAweDBh
NDcsIDB4NDkwNSwgMHg4MiwgMHg4NSwgMHgxNCwgMHg4NiwgMHhhOSwgMHg3NywgMHgxYSwgMHgw
OCl9LAo+ICsJe30KPiArfTsKCk90aGVyIGltcGxlbWVudGF0aW9ucyBtYXkgdXNlIGRpZmZlcmVu
dCBVVUlEcy4KV2hhdCBhYm91dCBhZGRpbmcgYSBrZXJuZWwgY29uZmlndXJhdGlvbiBvcHRpb24g
d2hpY2gsIHdoZW4gZW5hYmxlZCwgYWxsb3dzCmFsdGVybmF0aXZlIGltcGxlbWVudGF0aW9ucyB0
byBvdmVycmlkZSB0aGlzIHRhYmxlPwoKPiArLyoqCj4gKyAqIHJwcm9jX3RlZV9yZWdpc3Rlcigp
IC0gUmVnaXN0ZXIgYSByZW1vdGUgcHJvY2Vzc29yIGNvbnRyb2xsZWQgYnkgdGhlIFRFRSBhcHBs
aWNhdGlvbi4KLi4uCj4gKwo+ICtzdGF0aWMgaW50IHJwcm9jX3RlZV9jdHhfbWF0Y2goc3RydWN0
IHRlZV9pb2N0bF92ZXJzaW9uX2RhdGEgKnZlciwgY29uc3Qgdm9pZCAqZGF0YSkKPiArewo+ICsJ
LyogVG9kYXkgd2Ugc3VwcG9ydCBvbmx5IHRoZSBPUC1URUUsIGNvdWxkIGJlIGV4dGVuZCB0byBv
dGhlciB0ZWVzICovCj4gKwlyZXR1cm4gKHZlci0+aW1wbF9pZCA9PSBURUVfSU1QTF9JRF9PUFRF
RSk7Cj4gK30KCkNvdWxkIHdlIG1ha2UgdmVyLT5pbXBsX2lkIHVzZXItY29uZmlndXJhYmxlIHBs
ZWFzZSA/IGZvciBleGFtcGxlLCBieSByZWFkaW5nCml0IGZyb20gdGhlIGRldmljZSB0cmVlIHNp
bmNlIGl0IGlzbuKAmXQgZGlzY292ZXJhYmxlIGF0IHJ1bnRpbWU/IEluIG91ciBzZXR1cCwgd2Xi
gJlkIHNldAppdCB0byBURUVfSU1QTF9JRF9UU1RFRS4KCj4gKwo+ICtzdGF0aWMgaW50IHJwcm9j
X3RlZV9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gK3sKPiArCXN0cnVjdCB0ZWVfY29udGV4
dCAqdGVlX2N0eDsKPiArCWludCByZXQ7Cj4gKwo+ICsJLyogT3BlbiBjb250ZXh0IHdpdGggVEVF
IGRyaXZlciAqLwo+ICsJdGVlX2N0eCA9IHRlZV9jbGllbnRfb3Blbl9jb250ZXh0KE5VTEwsIHJw
cm9jX3RlZV9jdHhfbWF0Y2gsIE5VTEwsIE5VTEwpOwo+ICsJaWYgKElTX0VSUih0ZWVfY3R4KSkK
PiArCQlyZXR1cm4gUFRSX0VSUih0ZWVfY3R4KTsKPiArCj4gKwlyZXQgPSBtdXRleF9sb2NrX2lu
dGVycnVwdGlibGUoJmN0eF9sb2NrKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKCklu
IHNvbWUgVEVFcywgdGhlIGNsaWVudCBkcml2ZXIgbWlnaHQgbmVlZCB0byBwZXJmb3JtIGV4dHJh
IHdvcmsgZHVyaW5nIHByb2JpbmcuCkZvciBleGFtcGxlLCB3aGVuIHVzaW5nIFRTIFRFRSwgY2Fs
bGluZyB0ZWVfc2htX2FsbG9jX2tlcm5lbF9idWYoKSBpcyByZXF1aXJlZC4KQ291bGQgd2UgaW50
cm9kdWNlIGFuIHJwcm9jX3RlZV9vcHMgYW5kIGFkZCBhIFRFRSBwcm9iZSBvcGVyYXRpb24gY2Fs
bGVkIGJ5IHRoZQpyZW1vdGVwcm9jIGRyaXZlciBmb3IgcGVyZm9ybWluZyBjdXN0b20gVEVFIHNl
dHVwID8KCktpbmQgcmVnYXJkcywKQWJkZWxsYXRpZgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
