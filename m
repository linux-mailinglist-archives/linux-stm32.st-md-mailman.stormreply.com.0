Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 077DA9F5293
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 18:20:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3DC4C78014;
	Tue, 17 Dec 2024 17:20:51 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF940C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 17:20:44 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2f13acbe29bso4367787a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 09:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734456043; x=1735060843;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=97u39/mB75Gyvq3MUoP9A6BWuOZp1jV8oYjBZnf5YHs=;
 b=Yh4Lt0e4CKhNYg1lSmPTwTB8UjfJyllDwyhzagMM3w0+YCTf3f2SxKits/oJOEmEDt
 TXqIOihJe1/0LyAexuUkXfQ7S1Gi1WO/x6sCUHcgun5lIPdEXPts738oQxKPFMRkithW
 KDiNppBy4Qel/w0285UemzImCEiDZsHBtUvmxdnwD7gHgmLA3KTcKjbFNnvMgWjtFxR8
 Gj6GdmXtCMFwv8p9dzoMTpnb8x0+MvDR1XVIYvCdIQNeVJFFCI9m9GyREt4Fna2u2JqZ
 CoTsxswLwJJEPXins0Jttbwtef719/YBTfc4e/unCAs++5fohXMnACQS/C0WVsFb5IhB
 eUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734456043; x=1735060843;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=97u39/mB75Gyvq3MUoP9A6BWuOZp1jV8oYjBZnf5YHs=;
 b=hYT7xpapeM4g8JPu95TlS1OZMJQINg6aNiTCfBUqpDVx3/vlYjc8XxF8kL0k439Dw5
 QsgMILA3bjIBRyYZXsuwLGJD69GRRIN9PJK7daqjxNhr4Tr5MHb3qMIckEnzdDgv2JeM
 LGXfNDAHcgDr042xm0CzDht/h0ParCHDA/CQbimWfRzwsp+nIycJq0EEvtrOXnbu9WqM
 YD7IQbu9R3yDTPzWvm+9C/6fEXqxZ4hIpAOwALzhgV20YjP6+wgZRLpYg2Pjl/UIxc7l
 2/oo801jrhkQaixN0WPlS4clM+EyCKnTnvjfNhRV+BpJa6DO51oz6uEc8QBH1J71QVeV
 eLtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5vKH00EBcxUCNXjB334bEJVZa073AwgcJe8eebkDSuY5NH16YPt+drpWLXRtxTkf2mpNiftJtNqvvzA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwMq2iUDD7ZFsZ94f4cZG6Rir00djuJVH7caplwysRkBSs42wqN
 uVokw3nTtZ7Oo/fQwAyEMNO8q2n6wrjrAPWMVJsXPJ1BJAoWrlN2BKsLjkRiQA==
X-Gm-Gg: ASbGncvsEN8atNZQDtcbWHbEEuNgoIg2ieGVNI0XXn0kyNZeIi2HjCIimajHcR6Y6Db
 uAzKkbvDSESOcdoi4KZqOj2oe1HOHDX5P2GwvZ7r0fwg/21xq1etlXeHJ3YLRkdTPfJwdc2BwH2
 yBUMuV5ov9DwVvxcLEAiOmD6BfqidPoYHepXIPqxAvvFDv/Dey2Vnkj+7r4z+Yk9GUgVomNbiyk
 BwamyXyeaqEgdcyfZtRjC7/beiRPew9tcn7YbbLD0Oohz3EYghC1G6HaZtmt/OLBGwU
X-Google-Smtp-Source: AGHT+IGjUccenohiYb+SDkdAmpf0k5ZpdC9204RkXFZyFmXwB9GNV/fs0d/6P1jKINhalSCuMQyisw==
X-Received: by 2002:a17:90b:2750:b0:2ee:7504:bb3d with SMTP id
 98e67ed59e1d1-2f2d867445amr6395058a91.0.1734456043265; 
 Tue, 17 Dec 2024 09:20:43 -0800 (PST)
Received: from thinkpad ([117.193.214.60]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2a2434a7bsm6848964a91.36.2024.12.17.09.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 09:20:42 -0800 (PST)
Date: Tue, 17 Dec 2024 22:50:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Message-ID: <20241217172033.zxl4bufakzx7eww5@thinkpad>
References: <20241126155119.1574564-2-christian.bruel@foss.st.com>
 <20241203222515.GA2967814@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241203222515.GA2967814@bhelgaas>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de,
 cassel@kernel.org, quic_schintav@quicinc.com, lpieralisi@kernel.org,
 linux-kernel@vger.kernel.org, Christian Bruel <christian.bruel@foss.st.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
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

T24gVHVlLCBEZWMgMDMsIDIwMjQgYXQgMDQ6MjU6MTVQTSAtMDYwMCwgQmpvcm4gSGVsZ2FhcyB3
cm90ZToKPiBPbiBUdWUsIE5vdiAyNiwgMjAyNCBhdCAwNDo1MToxNVBNICswMTAwLCBDaHJpc3Rp
YW4gQnJ1ZWwgd3JvdGU6Cj4gPiBEb2N1bWVudCB0aGUgYmluZGluZ3MgZm9yIFNUTTMyTVAyNSBQ
Q0llIENvbnRyb2xsZXIgY29uZmlndXJlZCBpbgo+ID4gcm9vdCBjb21wbGV4IG1vZGUuCj4gPiAK
PiA+IFN1cHBvcnRzIDQgbGVnYWN5IGludGVycnVwdHMgYW5kIE1TSSBpbnRlcnJ1cHRzIGZyb20g
dGhlIEFSTQo+ID4gR0lDdjJtIGNvbnRyb2xsZXIuCj4gCj4gcy9sZWdhY3kvSU5UeC8KPiAKPiA+
IFNUTTMyIFBDSWUgbWF5IGJlIGluIGEgcG93ZXIgZG9tYWluIHdoaWNoIGlzIHRoZSBjYXNlIGZv
ciB0aGUgU1RNMzJNUDI1Cj4gPiBiYXNlZCBib2FyZHMuCj4gPiAKPiA+IFN1cHBvcnRzIHdha2Uj
IGZyb20gd2FrZS1ncGlvcwo+IAo+IHMvd2FrZSMvV0FLRSMvCj4gCj4gPiArICB3YWtlLWdwaW9z
Ogo+ID4gKyAgICBkZXNjcmlwdGlvbjogR1BJTyBjb250cm9sbGVkIGNvbm5lY3Rpb24gdG8gV0FL
RSMgaW5wdXQgc2lnbmFsCj4gCj4gSSdtIG5vdCBhIGhhcmR3YXJlIGd1eSwgYnV0IHRoaXMgc291
bmRzIGxpa2UgYSBHUElPIHRoYXQgKnJlYWRzKgo+IFdBS0UjLCBub3QgY29udHJvbHMgaXQuCj4g
Cj4gPiArICAgIHBjaWVANDg0MDAwMDAgewo+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJzdCxz
dG0zMm1wMjUtcGNpZS1yYyI7Cj4gPiArICAgICAgICBkZXZpY2VfdHlwZSA9ICJwY2kiOwo+ID4g
KyAgICAgICAgbnVtLWxhbmVzID0gPDE+Owo+IAo+IG51bS1sYW5lcyBhcHBsaWVzIHRvIGEgUm9v
dCBQb3J0LCBub3QgdG8gYSBSb290IENvbXBsZXguICBJIGtub3cgbW9zdAo+IGJpbmRpbmdzIGNv
bmZsYXRlIFJvb3QgUG9ydHMgd2l0aCB0aGUgUm9vdCBDb21wbGV4LCBtYXliZSBiZWNhdXNlIG1h
bnkKPiBvZiB0aGVzZSBjb250cm9sbGVycyBvbmx5IHN1cHBvcnQgYSBzaW5nbGUgUm9vdCBQb3J0
Pwo+IAo+IEJ1dCBhcmUgd2UgZXZlciBnb2luZyB0byBzZXBhcmF0ZSB0aGVzZSBvdXQ/ICBJIGFz
c3VtZSBzb21lZGF5Cj4gY29udHJvbGxlcnMgd2lsbCBzdXBwb3J0IG11bHRpcGxlIFJvb3QgUG9y
dHMgYW5kL29yIGFkZGl0aW9uYWwgZGV2aWNlcwo+IG9uIHRoZSByb290IGJ1cywgbGlrZSBSQ2lF
UHMsIFJDRUNzLCBldGMuLCBhbmQgd2UnbGwgbmVlZCBwZXItUlAgcGh5cywKPiBtYXgtbGluay1z
cGVlZCwgbnVtLWxhbmVzLCByZXNldC1ncGlvcywgZXRjLgo+IAo+IFNlZW1zIGxpa2UgaXQgd291
bGQgYmUgdG8gb3VyIGJlbmVmaXQgdG8gc3BsaXQgb3V0IHRoZSBSb290IFBvcnRzIHdoZW4KPiB3
ZSBjYW4sIGV2ZW4gaWYgdGhlIGN1cnJlbnQgaGFyZHdhcmUgb25seSBzdXBwb3J0cyBvbmUsIHNv
IHdlIGNhbgo+IHN0YXJ0IHVudGFuZ2xpbmcgdGhlIGNvZGUgYW5kIGRhdGEgc3RydWN0dXJlcy4K
PiAKCisxIGZvciBtb3ZpbmcgdGhlIHByb3BlcnRpZXMgdG8gUlAgbm9kZSB3aGVyZSB0aGV5IHNo
b3VsZCBiZWxvbmcgdG8uIFRoZQpjb250cm9sbGVyIGRyaXZlciBtaWdodCBoYXZlIHRvIGRvIHNv
bWUgZXh0cmEgd29yayB0byBwYXJzZSB0aGUgUlAgbm9kZSBhbmQgZ2V0CnRoZXNlIHByb3BlcnRp
ZXMsIGJ1dCBpdCBpcyB3b3J0aCB0aGUgZWZmb3J0LgoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K61
4K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
