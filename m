Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 773A59F5318
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 18:25:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C37FC78014;
	Tue, 17 Dec 2024 17:25:22 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72C7FC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 17:25:14 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-728eedfca37so5724826b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 09:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734456313; x=1735061113;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YOPV+rKrhFxhfr/BDT97d+AUMncXtvhCP8Kd1bZ9mu0=;
 b=jdyupJ0YqRsFOyPP8hRUqqJjXGnH0e7e2+9zIeZzcrJwa5W7ieJVd8lFVRQFt6eJbA
 aeyrSL1ZN/nYQJKMCL9cLWDophLJQUKq2xmzDzHLcGgoXp2IN14Jy0xIHwnU36wLlWUE
 lNkt4MFOHVDZJbF1Na9WbewGr9SvdGOzv5Zwle0O6OkN9ldLH5/sYaUnxZmtrhoE5ZhR
 IQlTWkPKlCE+436q8Je7M44QMIIXxweZHLdtmn9AV6JCLC4cJzcG79PHOWRFIu74pGIG
 fZM5YyWc+B2rI3sq1FFH7Pe88mLiIFJvRyweOXS3E8CvaZd5oOCJZP5A7FoDllsGSupI
 kNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734456313; x=1735061113;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YOPV+rKrhFxhfr/BDT97d+AUMncXtvhCP8Kd1bZ9mu0=;
 b=qstNqMJecDtmFgWpiRg5xTQ2G7O9XLVtn7HEAzk9rBIicSpshYQ+3OyJRr2VfQ8071
 H0WkhyIPRSsdashQ41JH16RkYuk1Zqfij0rY/FSTYWLdShhWstp0olvHjXJbLDGdylki
 7T8irQD8bblNhX7EoFipIpQWkiXMVVVWqHEQEsDCZgSnrrnJdDYkzQ9tgxIoSojZiDfT
 /g2/qy0n7eUE6QfFTLRDC9SX6pWsgdqlozfTT6cX88IeAh/phcZWq2rsnXTwEZybeWUo
 KhjU56Db8NQwHAsRdgXKzxOEETrHRq79NzRmIFnZaKDjTOPbi1PhtjXstwZ/1bN8n4ev
 A/ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJfD6oce/ybj3uu6bTRSMK3uWMBIbWNVxobZlLVad7d7BUB+6IUkn/doI2+3bpqNSgWUnEfsZmoUrScA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzJvm2gAR74ZmD3YdXW/sJFtJDb0xt9caUoX9g793OcTcxTpltZ
 hdEe9MfePtwdAqpxx6VkZY4HPTEV4ft4TjQ7ePkwUpuyiGwJ7fWwoahLZhhUhg==
X-Gm-Gg: ASbGncsposZ8J3vkDzkQhg7HsHIf7oPfmMkp/515edar6e+PV0A5Tq6e63YjQ6NcUjM
 GLIFuT5+Tjzp8tkpjnw77XMIG4LgfUEd1MK9hFHHftkME3cwPAzN2CRN2yrXUscsClB/WNf3xxW
 jGmYdyE5W8NeuaWvAeVEe7hVTCTL1yOZTfOAaJutDtL1s+WphmoGBfa6QcIOhaEry/brxWp5sVB
 Ni8z1HNWr//UlzsebcYGvmgDTSd/T5vt6cOSl6slrzO7ZsEqUSAn5dmSVGeUjQPpV0F
X-Google-Smtp-Source: AGHT+IEiyPtAWgyu8zoCPimND9mRn/6YCnmBDMVc1DmVYS+iQJlok+y8D22roOKEWjuOJV17xvafEw==
X-Received: by 2002:a05:6a00:3d06:b0:725:cfd0:dffa with SMTP id
 d2e1a72fcca58-7290c0ee463mr28517272b3a.5.1734456312913; 
 Tue, 17 Dec 2024 09:25:12 -0800 (PST)
Received: from thinkpad ([117.193.214.60]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72918bcfecbsm6907193b3a.195.2024.12.17.09.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 09:25:12 -0800 (PST)
Date: Tue, 17 Dec 2024 22:55:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20241217172502.borj2oy4rpxcteag@thinkpad>
References: <20241205172022.GA3053765@bhelgaas>
 <d976d74c-80c0-4446-bb9b-960a990c552b@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d976d74c-80c0-4446-bb9b-960a990c552b@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, quic_schintav@quicinc.com, lpieralisi@kernel.org,
 linux-kernel@vger.kernel.org, cassel@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 mcoquelin.stm32@gmail.com, linux-pci@vger.kernel.org, bhelgaas@google.com,
 krzk+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/5] dt-bindings: PCI: Add STM32MP25
 PCIe root complex bindings
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

T24gVHVlLCBEZWMgMTcsIDIwMjQgYXQgMDQ6NTM6NDhQTSArMDEwMCwgQ2hyaXN0aWFuIEJydWVs
IHdyb3RlOgo+IAo+ID4gTWFrZXMgc2Vuc2UuICBXaGF0IGFib3V0IHBoeXMsIHJlc2V0cywgZXRj
PyAgSSdtIHByZXR0eSBzdXJlIGEgUEhZCj4gPiB3b3VsZCBiZSBhIHBlci1Sb290IFBvcnQgdGhp
bmcsIGFuZCBzb21lIHJlc2V0cyBhbmQgd2FrZXVwIHNpZ25hbHMKPiA+IGFsc28uCj4gPiAKPiA+
IEZvciBuZXcgZHJpdmVycywgSSB0aGluayB3ZSBzaG91bGQgc3RhcnQgYWRkaW5nIFJvb3QgUG9y
dCBzdGFuemFzIHRvCj4gPiBzcGVjaWZpY2FsbHkgYXNzb2NpYXRlIHRob3NlIHRoaW5ncyB3aXRo
IHRoZSBSb290IFBvcnQsIGUuZy4sCj4gPiBzb21ldGhpbmcgbGlrZSB0aGlzPwo+ID4gCj4gPiAg
ICBwY2llQDQ4NDAwMDAwIHsKPiA+ICAgICAgY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMjUtcGNp
ZS1yYyI7Cj4gPiAKPiA+ICAgICAgcGNpZUAwLDAgewo+ID4gICAgICAgIHJlZyA9IDwweDAwMDAg
MCAwIDAgMD47Cj4gPiAgICAgICAgcGh5cyA9IDwmY29tYm9waHkgUEhZX1RZUEVfUENJRT47Cj4g
PiAgICAgICAgcGh5LW5hbWVzID0gInBjaWUtcGh5IjsKPiA+ICAgICAgfTsKPiA+ICAgIH07Cj4g
PiAKPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
Y2kvbWVkaWF0ZWssbXQ3NjIxLXBjaWUueWFtbD9pZD12Ni4xMiNuMTExCj4gPiBpcyBvbmUgYmlu
ZGluZyB0aGF0IGRvZXMgdGhpcywgb3RoZXJzIGluY2x1ZGUgYXBwbGUscGNpZS55YW1sLAo+ID4g
YnJjbSxzdGItcGNpZS55YW1sLCBoaXNpbGljb24sa2lyaW4tcGNpZS55YW1sLgo+ID4gCj4gCj4g
T24gYSBzZWNvbmQgdGhvdWdodCwgbW92aW5nIHRoZSBQSFkgdG8gdGhlIHJvb3QtcG9ydCBwYXJ0
IHdvdWxkIGludHJvZHVjZSBhCj4gZGlzY3JlcGFuY3kgd2l0aCB0aGUgcGNpZV9lcCBiaW5kaW5n
LCB3aGVyZWFzIHRoZSBQSFkgaXMgcmVxdWlyZWQgb24gdGhlCj4gcGNpZV9lcCBub2RlLgo+IAo+
IEV2ZW4gZm9yIHRoZSBwY2llX3JjLCB0aGUgUEhZIGlzIG5lZWRlZCB0byBlbmFibGUgdGhlIGNv
cmVfY2xrIHRvIGFjY2Vzcwo+IHRoZSBQQ0llIGNvcmUgcmVnaXN0ZXJzLAo+IAoKQnV0IHdoeSB0
aGF0IG1hdHRlcnM/IFlvdSBjYW4gc3RpbGwgcGFyc2UgdGhlIGNoaWxkIG5vZGVzLCBlbmFibGUg
UEhZIGFuZApjb25maWd1cmUgUENJZSByZWdpc3RlcnMuCgo+IFNvIHRoYXQgd291bGQgbWFrZSAy
IGRpZmZlcmVudCByZXF1aXJlZCBQSFkgbG9jYXRpb25zIGZvciBSQyBhbmQgRVA6Cj4gCj4gICAg
IHBjaWVfcmM6IHBjaWVANDg0MDAwMDAgewo+ICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzJt
cDI1LXBjaWUtcmMiOwo+IAo+ICAgICAgIHBjaWVAMCwwIHsKPiAgICAgICAgIHJlZyA9IDwweDAw
MDAgMCAwIDAgMD47Cj4gICAgICAgICBwaHlzID0gPCZjb21ib3BoeSBQSFlfVFlQRV9QQ0lFPjsK
PiAgICAgICAgIHBoeS1uYW1lcyA9ICJwY2llLXBoeSI7Cj4gICAgICAgfTsKPiAgICAgfTsKPiAK
PiAgICAgcGNpZV9lcCBwY2llQDQ4NDAwMDAwIHsKPiAgICAgICBjb21wYXRpYmxlID0gInN0LHN0
bTMybXAyNS1wY2llLWVwIjsKPiAgICAgICBwaHlzID0gPCZjb21ib3BoeSBQSFlfVFlQRV9QQ0lF
PjsKPiAgICAgICBwaHktbmFtZXMgPSAicGNpZS1waHkiOwo+ICAgICB9Owo+IAo+IFNpbXBsZXN0
IHNlZW1zIHRvIGtlZXAgdGhlIFBIWSByZXF1aXJlZCBmb3IgdGhlIHBjaWUgY29yZSByZWdhcmRs
ZXNzIG9mIHRoZQo+IG1vZGUgYW5kIGtlZXAgdGhlIGVtcHR5IHJvb3QgcG9ydCB0byBzcGxpdCB0
aGUgZGVzaWduCj4gCgpObyBwbGVhc2UuIFRyeSB0byBkbyB0aGUgcmlnaHQgdGhpbmcgZnJvbSB0
aGUgc3RhcnQgaXRzZWxmLgoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+N
IOCumuCupOCuvuCumuCuv+CuteCuruCvjQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
