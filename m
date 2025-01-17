Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E58AA15827
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jan 2025 20:30:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 242AFC78F6D;
	Fri, 17 Jan 2025 19:30:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B1F8C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2025 19:30:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A66FA5C646F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2025 19:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E16C4CEE4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2025 19:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737142230;
 bh=foNB1y1uq0V8qV5aIiltQZucaZ3/EtCVUoN7QygiX5Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PcmyZM42OBbUN2s+eMJMWvVKqqjZr4qKzBrGmV7jIAMV0JFtG5sZ+wh5O3YcmKftS
 G3gKho6KPMSGYMCPoa0ni7euRpnJ9cki2DiLySsFoanbzl+2S1gcHj6gLpMsEZu1HM
 114n/v9wwuIE1WF4XCKogkOMXjll4Lk9wr/T2dpAuvwdIOZ26HGBl2r3T/UlYiyQKx
 +PyRPWHOedh7ByLlqUQ1/DkBfzi3RCQjrByM5PKYnUHz4obNDvDsr+XiC48gBJF76i
 IxMo6Zsw/xB3AgHbijeBJdE3c47qoXpm2CCA68ThQ11RR5KMIIg1VLc41oJYIy7uwx
 DXTQAyGot5wzQ==
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-5f88b61399dso1834496eaf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2025 11:30:29 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWx45YxTKJtFqIdoKqtxuMOiBYk2S4rxQAjQTP29Wj4S6hbdMOJBSN2emrXFAH8nkix3NzgoVjj7InxzA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzh0pNVP3TP4frbZhQynfY67a/0rQd62+NUi/wDBPIzCmGlfa2r
 WiEvnz8iCOajWdB1DK9IfHwxrwvjbElzmU8WpD94ulJNm4aSsaDqedobBeMXWH1BImSVtf/6u0N
 3sGn0XerOzIpJY1FJMWN3fSMbD8o=
X-Google-Smtp-Source: AGHT+IEOihIY7mUOa4hVP1bqotPmsr69h5OgdfXyZbu/sRbspauTxsDS8YOdvCTlZN7dTpnC3uxq7LK3T+tCxi8e13Q=
X-Received: by 2002:a05:6871:296:b0:29e:2a06:8405 with SMTP id
 586e51a60fabf-2b186ca0224mr7419767fac.19.1737142229222; Fri, 17 Jan 2025
 11:30:29 -0800 (PST)
MIME-Version: 1.0
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com>
 <20250103-wake_irq-v2-1-e3aeff5e9966@nxp.com>
 <CAJZ5v0hj7wUU3f_j5QH3fNUFKokaXr0octaP2M1Ho_L_BspoUA@mail.gmail.com>
 <PAXPR04MB8459EE38DBDBCA29FB81B6B788192@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB8459EE38DBDBCA29FB81B6B788192@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 17 Jan 2025 20:30:18 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jb=0c5m=FeA-W-aG30H4706Ay_xCHTsiC1S-7MuGxqTQ@mail.gmail.com>
X-Gm-Features: AbW1kva3YRwOs-mqOCr7xIZ_pL_VsK5_Sa-oqdUbd008qjcQYrdbDr5ihs4pOnQ
Message-ID: <CAJZ5v0jb=0c5m=FeA-W-aG30H4706Ay_xCHTsiC1S-7MuGxqTQ@mail.gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 Len Brown <len.brown@intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Pavel Machek <pavel@ucw.cz>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 01/12] PM: sleep: wakeirq: Introduce
 device-managed variant of dev_pm_set_wake_irq
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

T24gV2VkLCBKYW4gMTUsIDIwMjUgYXQgMjoyOOKAr0FNIFBlbmcgRmFuIDxwZW5nLmZhbkBueHAu
Y29tPiB3cm90ZToKPgo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwMS8xMl0gUE06IHNsZWVw
OiB3YWtlaXJxOiBJbnRyb2R1Y2UgZGV2aWNlLQo+ID4gbWFuYWdlZCB2YXJpYW50IG9mIGRldl9w
bV9zZXRfd2FrZV9pcnEKPiA+Cj4gPiBPbiBGcmksIEphbiAzLCAyMDI1IGF0IDk6NDLigK9BTSBQ
ZW5nIEZhbiAoT1NTKSA8cGVuZy5mYW5Ab3NzLm54cC5jb20+Cj4gPiB3cm90ZToKPiA+ID4KPiA+
ID4gRnJvbTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Cj4gPiA+Cj4gPiA+IEFkZCBkZXZp
Y2UtbWFuYWdlZCB2YXJpYW50IG9mIGRldl9wbV9zZXRfd2FrZV9pcnEgd2hpY2gKPiA+IGF1dG9t
YXRpY2FsbHkKPiA+ID4gY2xlYXIgdGhlIHdha2UgaXJxIG9uIGRldmljZSBkZXN0cnVjdGlvbiB0
byBzaW1wbGlmeSBlcnJvciBoYW5kbGluZwo+ID4gPiBhbmQgcmVzb3VyY2UgbWFuYWdlbWVudCBp
biBkcml2ZXJzLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5nIEZhbiA8cGVuZy5mYW5A
bnhwLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2Jhc2UvcG93ZXIvd2FrZWlycS5jIHwg
MjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIGluY2x1ZGUvbGludXgvcG1fd2Fr
ZWlycS5oICAgfCAgNiArKysrKysKPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9u
cygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9iYXNlL3Bvd2VyL3dha2VpcnEu
Ywo+ID4gPiBiL2RyaXZlcnMvYmFzZS9wb3dlci93YWtlaXJxLmMgaW5kZXgKPiA+ID4KPiA+IDVh
NWE5ZTk3OGU4NWYzZmM5ZDg5Y2I3ZDQzNTI3ZGMxZGQ0MmE5YjEuLjhhYTI4YzA4YjI4OTFmM2Fm
Cj4gPiA0OTAxNzUzNjJjYwo+ID4gPiAxYTc1OTA2OWJkNTAgMTAwNjQ0Cj4gPiA+IC0tLSBhL2Ry
aXZlcnMvYmFzZS9wb3dlci93YWtlaXJxLmMKPiA+ID4gKysrIGIvZHJpdmVycy9iYXNlL3Bvd2Vy
L3dha2VpcnEuYwo+ID4gPiBAQCAtMTAzLDYgKzEwMywzMiBAQCB2b2lkIGRldl9wbV9jbGVhcl93
YWtlX2lycShzdHJ1Y3QgZGV2aWNlCj4gPiAqZGV2KSAgfQo+ID4gPiBFWFBPUlRfU1lNQk9MX0dQ
TChkZXZfcG1fY2xlYXJfd2FrZV9pcnEpOwo+ID4gPgo+ID4gPiArc3RhdGljIHZvaWQgZGV2bV9w
bV9jbGVhcl93YWtlX2lycSh2b2lkICpkZXYpIHsKPiA+ID4gKyAgICAgICBkZXZfcG1fY2xlYXJf
d2FrZV9pcnEoZGV2KTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArLyoqCj4gPiA+ICsgKiBkZXZt
X3BtX3NldF93YWtlX2lycSAtIGRldmljZS1tYW5hZ2VkIHZhcmlhbnQgb2YKPiA+ID4gK2Rldl9w
bV9zZXRfd2FrZV9pcnEKPiA+ID4gKyAqIEBkZXY6IERldmljZSBlbnRyeQo+ID4gPiArICogQGly
cTogRGV2aWNlIElPIGludGVycnVwdAo+ID4gPiArICoKPiA+ID4gKyAqCj4gPiA+ICsgKiBBdHRh
Y2ggYSBkZXZpY2UgSU8gaW50ZXJydXB0IGFzIGEgd2FrZSBJUlEsIHNhbWUgd2l0aAo+ID4gPiAr
ZGV2X3BtX3NldF93YWtlX2lycSwKPiA+ID4gKyAqIGJ1dCB0aGUgZGV2aWNlIHdpbGwgYmUgYXV0
byBjbGVhciB3YWtlIGNhcGFiaWxpdHkgb24gZHJpdmVyIGRldGFjaC4KPiA+ID4gKyAqLwo+ID4g
PiAraW50IGRldm1fcG1fc2V0X3dha2VfaXJxKHN0cnVjdCBkZXZpY2UgKmRldiwgaW50IGlycSkg
ewo+ID4gPiArICAgICAgIGludCByZXQ7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICByZXQgPSBkZXZf
cG1fc2V0X3dha2VfaXJxKGRldiwgaXJxKTsKPiA+ID4gKyAgICAgICBpZiAocmV0KQo+ID4gPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4gKwo+ID4gPiArICAgICAgIHJldHVybiBk
ZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LAo+ID4gZGV2bV9wbV9jbGVhcl93YWtlX2lycSwK
PiA+ID4gK2Rldik7IH0gRVhQT1JUX1NZTUJPTF9HUEwoZGV2bV9wbV9zZXRfd2FrZV9pcnEpOwo+
ID4gPiArCj4gPiA+ICAvKioKPiA+ID4gICAqIGhhbmRsZV90aHJlYWRlZF93YWtlX2lycSAtIEhh
bmRsZXIgZm9yIGRlZGljYXRlZCB3YWtlLXVwCj4gPiBpbnRlcnJ1cHRzCj4gPiA+ICAgKiBAaXJx
OiBEZXZpY2Ugc3BlY2lmaWMgZGVkaWNhdGVkIHdha2UtdXAgaW50ZXJydXB0IGRpZmYgLS1naXQK
PiA+ID4gYS9pbmNsdWRlL2xpbnV4L3BtX3dha2VpcnEuaCBiL2luY2x1ZGUvbGludXgvcG1fd2Fr
ZWlycS5oIGluZGV4Cj4gPiA+Cj4gPiBkOTY0MmM2Y2Y4NTIxMWFmNjAzY2UzOWUyODBhNWI0ZGU2
NjE3ZWU1Li4yNWI2M2VkNTFiNzY1YzJjNgo+ID4gOTE5ZjI1OTY2OGEKPiA+ID4gMTI2NzUzMzA4
MzVlIDEwMDY0NAo+ID4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BtX3dha2VpcnEuaAo+ID4gPiAr
KysgYi9pbmNsdWRlL2xpbnV4L3BtX3dha2VpcnEuaAo+ID4gPiBAQCAtMTAsNiArMTAsNyBAQCBl
eHRlcm4gaW50IGRldl9wbV9zZXRfd2FrZV9pcnEoc3RydWN0IGRldmljZQo+ID4gKmRldiwKPiA+
ID4gaW50IGlycSk7ICBleHRlcm4gaW50IGRldl9wbV9zZXRfZGVkaWNhdGVkX3dha2VfaXJxKHN0
cnVjdCBkZXZpY2UKPiA+ID4gKmRldiwgaW50IGlycSk7ICBleHRlcm4gaW50Cj4gPiA+IGRldl9w
bV9zZXRfZGVkaWNhdGVkX3dha2VfaXJxX3JldmVyc2Uoc3RydWN0IGRldmljZSAqZGV2LCBpbnQg
aXJxKTsKPiA+ID4gZXh0ZXJuIHZvaWQgZGV2X3BtX2NsZWFyX3dha2VfaXJxKHN0cnVjdCBkZXZp
Y2UgKmRldik7Cj4gPiA+ICtleHRlcm4gaW50IGRldm1fcG1fc2V0X3dha2VfaXJxKHN0cnVjdCBk
ZXZpY2UgKmRldiwgaW50IGlycSk7Cj4gPiA+Cj4gPiA+ICAjZWxzZSAgLyogIUNPTkZJR19QTSAq
Lwo+ID4gPgo+ID4gPiBAQCAtMzIsNSArMzMsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkCj4gPiBk
ZXZfcG1fY2xlYXJfd2FrZV9pcnEoc3RydWN0Cj4gPiA+IGRldmljZSAqZGV2KSAgeyAgfQo+ID4g
Pgo+ID4gPiArc3RhdGljIGlubGluZSBpbnQgZGV2bV9wbV9zZXRfd2FrZV9pcnEoc3RydWN0IGRl
dmljZSAqZGV2LCBpbnQgaXJxKSB7Cj4gPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiA+ICt9Cj4g
PiA+ICsKPiA+ID4gICNlbmRpZiAvKiBDT05GSUdfUE0gKi8KPiA+ID4gICNlbmRpZiAvKiBfTElO
VVhfUE1fV0FLRUlSUV9IICovCj4gPiA+Cj4gPiA+IC0tCj4gPgo+ID4gSSBjYW4gYXBwbHkgdGhp
cyBwYXRjaCBmb3IgNi4xNCwgYnV0IHRoZSByZXN0IG9mIHRoZSBzZXJpZXMgd2lsbCBuZWVkIHRv
IGJlCj4gPiBwaWNrZWQgdXAgYnkgdGhlIHJlc3BlY3RpdmUgZHJpdmVyIG1haW50YWluZXJzLgo+
ID4KPiA+IEkgaG9wZSB0aGlzIHdvcmtzIGZvciB5b3U/Cj4KPiBZZXMuIHBsZWFzZSBqdXN0IHBp
Y2sgdXAgcGF0Y2ggMS4KCk9LLCBhcHBsaWVkLgoKVGhhbmtzIQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
