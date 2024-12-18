Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB219F653C
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2024 12:46:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78AB1C78012;
	Wed, 18 Dec 2024 11:46:40 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60B2CC6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 11:46:33 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-7fd17f231a7so3799468a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 03:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734522392; x=1735127192;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TrVaSMgbTfMEJQGridzhaDtd8gpO8DG1MuI/x/WUz/s=;
 b=XjCYsfNzsFIV/qCaAk7bwrZ5wQrmgUsSuJZyCRgvMDsy1yAzFbvaorJntxM1jFIITr
 cc5JdauvrEEr8eHP9DOD0WBa/7gfrF/D8mbBMeswf54RD2QGNssxFI45pxVJyUGqbeTV
 E0bCbKgFlj1/ykyxUvklTpDc1QFRLSeCB+E+UDtY9rq6ZZM7lSjxwaVf8ALRD6xuXiKN
 3Na9Ms4vJ6Y+gELvAvvzJL04pQQSdL/FxLiS4kZ2RqUyEPZYmzqekad3epUEFfeWLClc
 oyf7dFomp9KHALpP+1d9AM0f9HVuXcLGKoM2h9EJ0sJ+G3CmJDyLSz9yfx2KaN115OdL
 hUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734522392; x=1735127192;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TrVaSMgbTfMEJQGridzhaDtd8gpO8DG1MuI/x/WUz/s=;
 b=TfAlz5MrH+r68otPUK7wUOTAdFOBuKN25iz97hR3SENy2nm61J/F+8bLYVtj7UrLdt
 p1tq4CgU07ThMptLb8Jicg5mFS+vzN5EH2732sN6xV4mXX2kJsI/Kwz+ZTCMsQdHFinU
 sqH9LxNpweCZzrz9X8RX1HFPUoCCijkpx5sa2VkfoPeaKYdsl7MsSvHih3dVj+1HTruz
 cl80VZ0VILxr3wksu7w8CjpVlRwr4EI95AnxDmiK6HahwEwsyw8lmHIRY7LjR221CxQs
 zup9JIzH02hI0rgOApP88AG/1g8xuMO5Y71GIQEePqyhHle3jVkGNxE30U5+WSBUNcfP
 qcng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTTpOkZK4OOneQpwWU0C11mdP4Gea6yzRAYFlCo7dexvSzYV+TDdHz9KauCbm0l5hRJVPfvrJuef9Ixw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyUFJ4fgPDHSMIhvvrwNgQsCpHP1L9heqCchsq0j3oDKTRLTunO
 BlqJMFI47qUMoVcxlIebMJUJLe93a9AFOr8xRtEiSX/Fjh39EbT6QXESXU/KfQ==
X-Gm-Gg: ASbGncvFs6PwDEC5jqVxUzUVZDkO97bzZo/S0XP1nD26K1DTKYzVLxxYxFbGdB1i88e
 uxJDyz0Juf5ZIKM1HC1n1IsRGaG3wNDvJyK9VZGCJPO0JGYKE2X8C5DgA2Ro1yhy+1bjEQT2x6i
 jeWMro5rpT4JV6RtY7oFbl2Qo77S2PL3BOP/ssBFHdCq/ERM6ihDamAlx4yXTWTEbEiITu/KOYr
 Q1FdJojx3qryR6U+DhrRjUKFFPEsYymlXPRxM3vLqHZYlFItwWqZ5h5KkP6cl0KnTfO
X-Google-Smtp-Source: AGHT+IGQCgOq49R63ovvMukQoYUb7D03BYa7ObLjFwjqufc6miUeckdIMCl7aC+v7+RULldgNi6Ukw==
X-Received: by 2002:a17:90b:548f:b0:2ee:8e75:4aeb with SMTP id
 98e67ed59e1d1-2f2e91f6469mr4114590a91.17.1734522391875; 
 Wed, 18 Dec 2024 03:46:31 -0800 (PST)
Received: from thinkpad ([117.213.97.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ee06dd84sm1313616a91.38.2024.12.18.03.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 03:46:31 -0800 (PST)
Date: Wed, 18 Dec 2024 17:16:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20241218114622.3fgdooag6hwlmipr@thinkpad>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-3-christian.bruel@foss.st.com>
 <20241203145244.trgrobtfmumtiwuc@thinkpad>
 <ced7a55a-d968-497f-abc2-663855882a3f@foss.st.com>
 <20241218094606.sljdx2w27thc5ahj@thinkpad>
 <d15cec4e-e06a-47f7-aa8a-744c0829d244@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d15cec4e-e06a-47f7-aa8a-744c0829d244@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 cassel@kernel.org, devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/5] PCI: stm32: Add PCIe host support
	for STM32MP25
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

T24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMTI6MjQ6MjFQTSArMDEwMCwgQ2hyaXN0aWFuIEJydWVs
IHdyb3RlOgoKWy4uLl0KCj4gPiA+ID4gPiArc3RhdGljIGludCBzdG0zMl9wY2llX3N1c3BlbmRf
bm9pcnEoc3RydWN0IGRldmljZSAqZGV2KQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICsJc3RydWN0
IHN0bTMyX3BjaWUgKnN0bTMyX3BjaWUgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ICsJc3RtMzJfcGNpZS0+bGlua19pc191cCA9IGR3X3BjaWVfbGlua191cChz
dG0zMl9wY2llLT5wY2kpOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKwlzdG0zMl9wY2llX3N0b3Bf
bGluayhzdG0zMl9wY2llLT5wY2kpOwo+ID4gPiA+IAo+ID4gPiA+IEkgZG9uJ3QgdW5kZXJzdGFu
ZCBob3cgZW5kcG9pbnQgY2FuIHdha2V1cCB0aGUgaG9zdCBpZiBQRVJTVCMgZ2V0cyBhc3NlcnRl
ZC4KPiA+ID4gCj4gPiA+IFRoZSBzdG0zMiBQQ0llIGRvZXNuJ3Qgc3VwcG9ydCBMMiwgd2UgZG9u
J3QgZXhwZWN0IGFuIGluLWJhbmQgYmVhY29uIGZvciB0aGUKPiA+ID4gd2FrZXVwLiBXZSBzdXBw
b3J0IHdha2V1cCBvbmx5IGZyb20gc2lkZWJhbmQgV0FLRSMsIHRoYXQgd2lsbCByZXN0YXJ0IHRo
ZQo+ID4gPiBsaW5rIGZyb20gSVJRCj4gPiA+IAo+ID4gCj4gPiBJIGRvbid0IHVuZGVyc3RhbmQg
aG93IFdBS0UjIGlzIHN1cHBvcnRlZCB3aXRob3V0IEwyLiBPbmx5IGluIEwyIHN0YXRlLCBlbmRw
b2ludAo+ID4gd2lsbCBtYWtlIHVzZSBvZiBWYXV4IGFuZCBpdCB3aWxsIHdha2V1cCB0aGUgaG9z
dCB1c2luZyBlaXRoZXIgYmVhY29uIG9yIFdBS0UjLgo+ID4gSWYgeW91IGRvbid0IHN1cHBvcnQg
TDIsIHRoZW4gdGhlIGVuZHBvaW50IHdpbGwgcmVhY2ggTDMgKGxpbmsgb2ZmKSBzdGF0ZS4KPiAK
PiBJIHRoaW5rIHRoaXMgaXMgd2hhdCBoYXBwZW5zLCBteSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQg
dGhlIGRldmljZSBpcyBzdGlsbAo+IHBvd2VyZWQgdG8gZ2V0IHRoZSB3YWtldXAgZXZlbnQgKGVn
IFdvTCBtYWdpYyBwYWNrZXQpLCB0cmlnZ2VycyB0aGUgUENJZQo+IHdha2VfSVJRIGZyb20gdGhl
IFdBS0UjLgo+IAoKSG9uZXN0bHksIEkgc3RpbGwgY2Fubm90IHVuZGVyc3RhbmQgaG93IHRoaXMg
Y2FuIGhhcHBlbi4KCj4gPiAKPiA+ID4gPiAKPiA+ID4gPiA+ICsJY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKHN0bTMyX3BjaWUtPmNsayk7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArCWlmICghZGV2aWNl
X21heV93YWtldXAoZGV2KSAmJiAhZGV2aWNlX3dha2V1cF9wYXRoKGRldikpCj4gPiA+ID4gPiAr
CQlwaHlfZXhpdChzdG0zMl9wY2llLT5waHkpOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKwlyZXR1
cm4gcGluY3RybF9wbV9zZWxlY3Rfc2xlZXBfc3RhdGUoZGV2KTsKPiA+ID4gPiA+ICt9Cj4gPiA+
ID4gPiArCj4gPiA+ID4gPiArc3RhdGljIGludCBzdG0zMl9wY2llX3Jlc3VtZV9ub2lycShzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gPiA+ID4gPiArewo+ID4gPiA+ID4gKwlzdHJ1Y3Qgc3RtMzJfcGNp
ZSAqc3RtMzJfcGNpZSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ID4gPiA+ID4gKwlzdHJ1Y3Qg
ZHdfcGNpZSAqcGNpID0gc3RtMzJfcGNpZS0+cGNpOwo+ID4gPiA+ID4gKwlzdHJ1Y3QgZHdfcGNp
ZV9ycCAqcHAgPSAmcGNpLT5wcDsKPiA+ID4gPiA+ICsJaW50IHJldDsKPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ICsJLyogaW5pdF9zdGF0ZSBtdXN0IGJlIGNhbGxlZCBmaXJzdCB0byBmb3JjZSBjbGtf
cmVxIyBncGlvIHdoZW4gbm8KPiA+ID4gPiAKPiA+ID4gPiBDTEtSRVEjCj4gPiA+ID4gCj4gPiA+
ID4gV2h5IFJDIHNob3VsZCBjb250cm9sIENMS1JFUSM/Cj4gPiA+IAo+ID4gPiBSRUZDTEsgaXMg
Z2F0ZWQgd2l0aCBDTEtSRVEjLCBTbyB3ZSBjYW5ub3QgYWNjZXNzIHRoZSBjb3JlCj4gPiA+IHdp
dGhvdXQgQ0xLUkVRIyBpZiBubyBkZXZpY2UgaXMgcHJlc2VudC4gU28gZm9yY2UgaXQgd2l0aCBh
IGluaXQgcGlubXV4Cj4gPiA+IHRoZSB0aW1lIHRvIGluaXQgdGhlIFBIWSBhbmQgdGhlIGNvcmUg
REJJIHJlZ2lzdGVycwo+ID4gPiAKPiA+IAo+ID4gT2suIFlvdSBzaG91bGQgYWRkIGEgY29tbWVu
dCB0byBjbGFyaWZ5IGl0IGluIHRoZSBjb2RlIGFzIHRoaXMgaXMgbm90IGEgc3RhbmRhcmQKPiA+
IGJlaGF2aW9yLgo+ID4gCj4gCj4gT0sKPiAKPiA+ID4gPiAKPiA+ID4gPiBBbHNvIHBsZWFzZSB1
c2UgcHJlZmVycmVkIHN0eWxlIGZvciBtdWx0aS1saW5lIGNvbW1lbnRzOgo+ID4gPiA+IAo+ID4g
PiA+IAkvKgo+ID4gPiA+IAkgKiAuLi4KPiA+ID4gPiAJICovCj4gPiA+ID4gCj4gPiA+ID4gPiAr
CSAqIGRldmljZSBpcyBwbHVnZ2VkLgo+ID4gPiA+ID4gKwkgKi8KPiA+ID4gPiA+ICsJaWYgKCFJ
U19FUlIoZGV2LT5waW5zLT5pbml0X3N0YXRlKSkKPiA+ID4gPiA+ICsJCXJldCA9IHBpbmN0cmxf
c2VsZWN0X3N0YXRlKGRldi0+cGlucy0+cCwgZGV2LT5waW5zLT5pbml0X3N0YXRlKTsKPiA+ID4g
PiA+ICsJZWxzZQo+ID4gPiA+ID4gKwkJcmV0ID0gcGluY3RybF9wbV9zZWxlY3RfZGVmYXVsdF9z
dGF0ZShkZXYpOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKwlpZiAocmV0KSB7Cj4gPiA+ID4gPiAr
CQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBhY3RpdmF0ZSBwaW5jdHJsIHBtIHN0YXRlOiAlZFxu
IiwgcmV0KTsKPiA+ID4gPiA+ICsJCXJldHVybiByZXQ7Cj4gPiA+ID4gPiArCX0KPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ICsJaWYgKCFkZXZpY2VfbWF5X3dha2V1cChkZXYpICYmICFkZXZpY2Vfd2Fr
ZXVwX3BhdGgoZGV2KSkgewo+ID4gPiA+ID4gKwkJcmV0ID0gcGh5X2luaXQoc3RtMzJfcGNpZS0+
cGh5KTsKPiA+ID4gPiA+ICsJCWlmIChyZXQpIHsKPiA+ID4gPiA+ICsJCQlwaW5jdHJsX3BtX3Nl
bGVjdF9kZWZhdWx0X3N0YXRlKGRldik7Cj4gPiA+ID4gPiArCQkJcmV0dXJuIHJldDsKPiA+ID4g
PiA+ICsJCX0KPiA+ID4gPiA+ICsJfQo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKwlyZXQgPSBjbGtf
cHJlcGFyZV9lbmFibGUoc3RtMzJfcGNpZS0+Y2xrKTsKPiA+ID4gPiA+ICsJaWYgKHJldCkKPiA+
ID4gPiA+ICsJCWdvdG8gY2xrX2VycjsKPiA+ID4gPiAKPiA+ID4gPiBQbGVhc2UgbmFtZSB0aGUg
Z290byBsYWJlbHMgb2YgdGhlaXIgcHVycG9zZS4gTGlrZSBlcnJfcGh5X2V4aXQuCj4gPiA+IAo+
ID4gPiBPSwo+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsJcmV0ID0gZHdf
cGNpZV9zZXR1cF9yYyhwcCk7Cj4gPiA+ID4gPiArCWlmIChyZXQpCj4gPiA+ID4gPiArCQlnb3Rv
IHBjaWVfZXJyOwo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgc2hvdWxkIGJlLCAnZXJyX2Rpc2FibGVf
Y2xrJy4KPiA+ID4gPiAKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsJaWYgKHN0bTMyX3BjaWUtPmxp
bmtfaXNfdXApIHsKPiA+ID4gPiAKPiA+ID4gPiBXaHkgZG8geW91IG5lZWQgdGhpcyBjaGVjaz8g
WW91IGNhbm5vdCBzdGFydCB0aGUgbGluayBpbiB0aGUgYWJzZW5jZSBvZiBhbgo+ID4gPiA+IGVu
ZHBvaW50Pwo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gSXQgaXMgYW4gb3B0aW1pemF0aW9uIHRvIGF2
b2lkIHVubmVjZXNzYXJ5ICJkd19wY2llX3dhaXRfZm9yX2xpbmsiIGlmIG5vCj4gPiA+IGRldmlj
ZSBpcyBwcmVzZW50IGR1cmluZyBzdXNwZW5kCj4gPiA+IAo+ID4gCj4gPiBJbiB0aGF0IGNhc2Ug
eW91J2xsIG5vdCB0cmlnZ2VyIExUU1NNIGlmIHRoZXJlIHdhcyBubyBlbmRwb2ludCBjb25uZWN0
ZWQgYmVmb3JlCj4gPiBzdXNwZW5kLiBXaGF0IGlmIHVzZXJzIGNvbm5lY3QgYW4gZW5kcG9pbnQg
YWZ0ZXIgcmVzdW1lPwo+IAo+IFllcywgZXhhY3RseS4gV2UgZG9uJ3Qgc3VwcG9ydCBob3RwbHVn
LCBhbmQgcGx1Z2dpbmcgYSBkZXZpY2Ugd2hpbGUgdGhlCj4gc3lzdGVtIGlzIGluIHN0YW5kLWJ5
IGlzIHNvbWV0aGluZyB0aGF0IHdlIGRvbid0IGV4cGVjdC4gVGhlIGlteDYgcGxhdGZvcm0KPiBk
b2VzIHRoaXMgYWxzby4KPiAKCllvdSBzaG91bGQgcmVjb25zaWRlciB0aGlzIGFwcHJvYWNoLiBZ
b3UnbGwgbmV2ZXIga25vdyBob3cgdGhlIE9FTXMgYXJlIGdvaW5nIHRvCnVzZSB0aGUgUENJZSBz
bG90LiBBbmQgbGFjayBvZiBzdGFuZGFyZCBob3RwbHVnIGlzIG5vdCBwcmV2ZW50aW5nIHVzZXJz
IGZyb20KZG9pbmcgaG90cGx1ZyAodGhleSBjb3VsZCB0cnkgdG8gZG8gcmVzY2FuIHRoZW1zZWx2
ZXMgZXRjLi4uKQoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCu
pOCuvuCumuCuv+CuteCuruCvjQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
