Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D38AB84DB
	for <lists+linux-stm32@lfdr.de>; Thu, 15 May 2025 13:29:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B5BAC7A845;
	Thu, 15 May 2025 11:29:27 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1781EC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 11:29:25 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3a0be321968so466125f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 04:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747308565; x=1747913365;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sFdj64C/cdI5aMQcMm0++S9r7ta1roUULL87nRUbXCo=;
 b=fdJT04LCoUGI7Q6+kiNDmPVf9vIRGRWaQ5kP4I2frO2PVwAHfYWfw4J2/cvQWY74mp
 fnZpr7iJon9E2MtxgpVSTbC4m6dPXDhpeNv2MWxtzjtsBRVDccvlOGLmvPxyrzVxC9kv
 DdtgZ7L3v/L32T9SEaEZ8CtzUKq4e9vNDHtITlxZ2ViK4w639FsZAgREv0Ks1iqRQjRJ
 Qxx+kHH+6j9F/c58T386jS4WX6Rknu1YEasVxXYR57FrBXtNYLSqfOpWEEpMRVjVbG6p
 xML8shZsMERmV9AERj6EdBA6zH6QhGc4PwiGSBbwVtC79+116TCqIk2J4Mh6fiVY5LlQ
 lCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747308565; x=1747913365;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sFdj64C/cdI5aMQcMm0++S9r7ta1roUULL87nRUbXCo=;
 b=HjUHgr1K2Xb3IqAeaAyi3osIAtonzTE+Ilu1dN6O50aaHOzwBiwhtjrl8tFYp3tZ/Q
 6jCHyUvoCcu1I9yepqmUt3ZbtHfhItTuDNn301jzl+Lm8MEkfw5IwtmutZa82CVLgCZ0
 B+sY7JPc9fS1+83Kh4kNBw+pnSO2G+dCDlpERD0FynREWkAmXIVFm30NGRWz8tJ7JHOk
 aoirvJFw0htouWLNQTYKVBewKAs9cs5FtPI+qa8/0y0HH0+iO1CuZ6MJa7KJZrI7n16/
 0khO19E75dAsG+y+p+92G/MUVlM62I0pLTMelNij/Af5hehs0nHMk0jsJbCP2Q9PkiAo
 +S+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPwDvxeeCmoMZtejV7aYypfVJBmZKaz06BEEx3Uoyqzi5wUEhYjGkea/HRw0DwE65YdKeRXh60SP16eg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxNNR40uzTpPFjbH0y92ZEeDf9T33DlkU+9l0LHaCI2NHJFTll4
 VJtiv42jqA08yofZ7YcmMLkMib+zKdYFXgznDvTVY/Ykd/2ro7/4W4LxNb5Yuw==
X-Gm-Gg: ASbGncvAz3qs9G7LvG7cojwW0RQZAe/UDLpaiGEkmcFwxvrORFu1+xsidszDNaIgAV5
 iCGswsboS4N9QdD1lIaYUO3QZU4sfmeUqnn1agV3/lfrZE+DVYGGd6o7SInEp5MSuRfyilzElTZ
 TCQbZtBQM82QbXwEL3CxO4HIpokh8eJw0LXPTw4o1yJHULI33EyWC+WmZc59pnff/tF1K9nMGaN
 7gZspRJFs4f3nKfQk6v+BZUIce/RVGOmq93d/aEfruZ8Zx1ots4Z5aGBEnUr9JYZ4gfDyC6vA5P
 kxqmPqSlR5dMiN4Y3HB5MWsN3Odb4S3uQ+TKLsvWsGjlkkorSiqtRJ/IH06yIanSytItCldoiuY
 8k9NTfRi9ntF1w/R/hoL7hNoD
X-Google-Smtp-Source: AGHT+IFamW2RPKGKJfE+U6UvXP5DVtS58juDRGBK81mdENW8tAkGVKABiwtzg+vRMFYjw66L5CqtcA==
X-Received: by 2002:a05:6000:2088:b0:3a3:55e6:eaaf with SMTP id
 ffacd0b85a97d-3a355e72142mr1087194f8f.24.1747308565358; 
 Thu, 15 May 2025 04:29:25 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f57de087sm22731199f8f.16.2025.05.15.04.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 04:29:24 -0700 (PDT)
Date: Thu, 15 May 2025 12:29:21 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <ec33uuugief45swij7eu3mbx7htfxov6qa5miucqsrdp36z7qe@svpbhliveks4>
References: <20250423090119.4003700-1-christian.bruel@foss.st.com>
 <20250423090119.4003700-3-christian.bruel@foss.st.com>
 <gzw3rcuwuu7yswljzde2zszqlzkfsilozdfv2ebrcxjpvngpkk@hvzqb5wbjalb>
 <c01d0d72-e43c-4e10-b298-c8ed4f5d1942@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c01d0d72-e43c-4e10-b298-c8ed4f5d1942@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, thippeswamy.havalige@amd.com,
 linux-kernel@vger.kernel.org, cassel@kernel.org, devicetree@vger.kernel.org,
 quic_schintav@quicinc.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, bhelgaas@google.com, krzk+dt@kernel.org,
 shradha.t@samsung.com, linux-stm32@st-md-mailman.stormreply.com,
 johan+linaro@kernel.org
Subject: Re: [Linux-stm32] [PATCH v8 2/9] PCI: stm32: Add PCIe host support
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

T24gTW9uLCBNYXkgMTIsIDIwMjUgYXQgMDU6MDg6MTNQTSArMDIwMCwgQ2hyaXN0aWFuIEJydWVs
IHdyb3RlOgo+IEhpIE1hbml2YW5uYW4sCj4gCj4gT24gNC8zMC8yNSAwOTozMCwgTWFuaXZhbm5h
biBTYWRoYXNpdmFtIHdyb3RlOgo+ID4gT24gV2VkLCBBcHIgMjMsIDIwMjUgYXQgMTE6MDE6MTJB
TSArMDIwMCwgQ2hyaXN0aWFuIEJydWVsIHdyb3RlOgo+ID4gPiBBZGQgZHJpdmVyIGZvciB0aGUg
U1RNMzJNUDI1IFNvQyBQQ0llIEdlbjEgMi41IEdUL3MgYW5kIEdlbjIgNUdUL3MKPiA+ID4gY29u
dHJvbGxlciBiYXNlZCBvbiB0aGUgRGVzaWduV2FyZSBQQ0llIGNvcmUuCj4gPiA+IAo+ID4gPiBT
dXBwb3J0cyBNU0kgdmlhIEdJQ3YybSwgU2luZ2xlIFZpcnR1YWwgQ2hhbm5lbCwgU2luZ2xlIEZ1
bmN0aW9uCj4gPiA+IAo+ID4gPiBTdXBwb3J0cyBXQUtFIyBHUElPLgo+ID4gPiAKPiA+IAo+ID4g
TW9zdGx5IGxvb2tzIGdvb2QuIEp1c3QgYSBjb3VwbGUgb2YgY29tbWVudHMgYmVsb3cuCj4gPiAK
PiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEJydWVsIDxjaHJpc3RpYW4uYnJ1ZWxAZm9z
cy5zdC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL0tj
b25maWcgICAgICB8ICAxMiArCj4gPiA+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvTWFr
ZWZpbGUgICAgIHwgICAxICsKPiA+ID4gICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LXN0bTMyLmMgfCAzNjggKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICAgZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpZS1zdG0zMi5oIHwgIDE1ICsKPiA+ID4gICA0IGZpbGVzIGNo
YW5nZWQsIDM5NiBpbnNlcnRpb25zKCspCj4gPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3RtMzIuYwo+ID4gPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXN0bTMyLmgKPiA+ID4gCj4gPiAK
PiA+IFsuLi5dCj4gPiAKPiA+ID4gK3N0YXRpYyBpbnQgc3RtMzJfcGNpZV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiArewo+ID4gPiArCXN0cnVjdCBzdG0zMl9wY2ll
ICpzdG0zMl9wY2llOwo+ID4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4g
PiA+ICsJaW50IHJldDsKPiA+ID4gKwo+ID4gPiArCXN0bTMyX3BjaWUgPSBkZXZtX2t6YWxsb2Mo
ZGV2LCBzaXplb2YoKnN0bTMyX3BjaWUpLCBHRlBfS0VSTkVMKTsKPiA+ID4gKwlpZiAoIXN0bTMy
X3BjaWUpCj4gPiA+ICsJCXJldHVybiAtRU5PTUVNOwo+ID4gPiArCj4gPiA+ICsJc3RtMzJfcGNp
ZS0+cGNpLmRldiA9IGRldjsKPiA+ID4gKwlzdG0zMl9wY2llLT5wY2kub3BzID0gJmR3X3BjaWVf
b3BzOwo+ID4gPiArCXN0bTMyX3BjaWUtPnBjaS5wcC5vcHMgPSAmc3RtMzJfcGNpZV9ob3N0X29w
czsKPiA+ID4gKwo+ID4gPiArCXN0bTMyX3BjaWUtPnJlZ21hcCA9IHN5c2Nvbl9yZWdtYXBfbG9v
a3VwX2J5X2NvbXBhdGlibGUoInN0LHN0bTMybXAyNS1zeXNjZmciKTsKPiA+ID4gKwlpZiAoSVNf
RVJSKHN0bTMyX3BjaWUtPnJlZ21hcCkpCj4gPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRl
diwgUFRSX0VSUihzdG0zMl9wY2llLT5yZWdtYXApLAo+ID4gPiArCQkJCSAgICAgIk5vIHN5c2Nm
ZyBzcGVjaWZpZWRcbiIpOwo+ID4gPiArCj4gPiA+ICsJc3RtMzJfcGNpZS0+Y2xrID0gZGV2bV9j
bGtfZ2V0KGRldiwgTlVMTCk7Cj4gPiA+ICsJaWYgKElTX0VSUihzdG0zMl9wY2llLT5jbGspKQo+
ID4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoc3RtMzJfcGNpZS0+Y2xr
KSwKPiA+ID4gKwkJCQkgICAgICJGYWlsZWQgdG8gZ2V0IFBDSWUgY2xvY2sgc291cmNlXG4iKTsK
PiA+ID4gKwo+ID4gPiArCXN0bTMyX3BjaWUtPnJzdCA9IGRldm1fcmVzZXRfY29udHJvbF9nZXRf
ZXhjbHVzaXZlKGRldiwgTlVMTCk7Cj4gPiA+ICsJaWYgKElTX0VSUihzdG0zMl9wY2llLT5yc3Qp
KQo+ID4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoc3RtMzJfcGNpZS0+
cnN0KSwKPiA+ID4gKwkJCQkgICAgICJGYWlsZWQgdG8gZ2V0IFBDSWUgcmVzZXRcbiIpOwo+ID4g
PiArCj4gPiA+ICsJcmV0ID0gc3RtMzJfcGNpZV9wYXJzZV9wb3J0KHN0bTMyX3BjaWUpOwo+ID4g
PiArCWlmIChyZXQpCj4gPiA+ICsJCXJldHVybiByZXQ7Cj4gPiA+ICsKPiA+ID4gKwlwbGF0Zm9y
bV9zZXRfZHJ2ZGF0YShwZGV2LCBzdG0zMl9wY2llKTsKPiA+ID4gKwo+ID4gPiArCXJldCA9IHBt
X3J1bnRpbWVfc2V0X2FjdGl2ZShkZXYpOwo+ID4gPiArCWlmIChyZXQgPCAwKSB7Cj4gPiA+ICsJ
CWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFjdGl2YXRlIHJ1bnRpbWUgUE0gJWRcbiIsIHJldCk7
Cj4gPiAKPiA+IFBsZWFzZSB1c2UgZGV2X2Vycl9wcm9iZSgpIGhlcmUgYW5kIGJlbG93Lgo+IAo+
IE9LLCB3aWxsIHJlcG9ydCB0aGlzIGluIHRoZSBFUCBkcml2ZXIgYWxzby4KPiAKPiA+IAo+ID4g
PiArCQlyZXR1cm4gcmV0Owo+ID4gPiArCX0KPiA+ID4gKwo+ID4gPiArCXJldCA9IGRldm1fcG1f
cnVudGltZV9lbmFibGUoZGV2KTsKPiA+ID4gKwlpZiAocmV0IDwgMCkgewo+ID4gPiArCQlkZXZf
ZXJyKGRldiwgIkZhaWxlZCB0byBlbmFibGUgcnVudGltZSBQTSAlZFxuIiwgcmV0KTsKPiA+ID4g
KwkJcmV0dXJuIHJldDsKPiA+ID4gKwl9Cj4gPiA+ICsKPiA+ID4gKwlwbV9ydW50aW1lX2dldF9u
b3Jlc3VtZShkZXYpOwo+ID4gPiArCj4gPiAKPiA+IEkga25vdyB0aGF0IGEgbG90IG9mIHRoZSBj
b250cm9sbGVyIGRyaXZlcnMgZG8gdGhpcyBmb3Igbm8gb2J2aW91cyByZWFzb24uIEJ1dAo+ID4g
aW4gdGhpcyBjYXNlLCBJIGJlbGlldmUgeW91IHdhbnQgdG8gZW5hYmxlIHBvd2VyIGRvbWFpbiBv
ciBnZW5wZCBiZWZvcmUKPiA+IHJlZ2lzdGVyaW5nIHRoZSBob3N0IGJyaWRnZS4gSXMgdGhhdCBy
aWdodD8KPiAKPiBXZSBjYWxsIHBtX3J1bnRpbWVfZW5hYmxlKCkgYmVmb3JlIHN0bTMyX2FkZF9w
Y2llX3BvcnQoKSBhbmQKPiBkd19wY2llX2hvc3RfaW5pdCgpLiBUaGlzIGVuc3VyZXMgdGhhdCBQ
Q0llIGlzIGFjdGl2ZSBkdXJpbmcgdGhlIFBFUlNUIwo+IHNlcXVlbmNlIGFuZCBiZWZvcmUgYWNj
ZXNzaW5nIHRoZSBEV0MgcmVnaXN0ZXJzLgo+IAoKV2hhdCBkbyB5b3UgbWVhbiBieSAnUENJZSBp
cyBhY3RpdmUnPyBXaG8gaXMgYWN0aXZhdGluZyBpdCBvdGhlciB0aGFuIHRoaXMKZHJpdmVyPwoK
PiA+IEFuZCB0aGUgZmFjdCB0aGF0IHlvdSBhcmUgbm90Cj4gPiBkZWNyZW1lbnRpbmcgdGhlIHJ1
bnRpbWUgdXNhZ2UgY291bnQgbWVhbnMsIHlvdSB3YW50IHRvIGtlZXAgaXQgT04gYWxsIHRoZSB0
aW1lPwo+ID4gQmV3YXJlIHRoYXQgeW91ciBzeXN0ZW0gc3VzcGVuZC9yZXN1bWUgY2FsbHMgd291
bGQgbmV2ZXIgZ2V0IGV4ZWN1dGVkLgo+IAo+IFdlIGRvIG5vdCBzdXBwb3J0IFBNIHJ1bnRpbWUg
YXV0b3N1c3BlbmQsIHNvIHdlIG11c3Qgbm90aWZ5IFBNIHJ1bnRpbWUgdGhhdAo+IFBDSWUgaXMg
YWx3YXlzIGFjdGl2ZS4gV2l0aG91dCBpbnZva2luZyBwbV9ydW50aW1lX2dldF9ub3Jlc3VtZSgp
LCBQQ0llCj4gd291bGQgbWlzdGFrZW5seSBiZSBtYXJrZWQgYXMgc3VzcGVuZGVkLgoKVGhpcyBj
YW5ub3QgaGFwcGVuIHVubGVzcyB0aGUgY2hpbGQgZGV2aWNlcyBhcmUgYWxzbyBzdXNwZW5kZWQ/
IE9yIGlmIHRoZXJlIGFyZQpubyBjaGlsZCBkZXZpY2VzIGNvbm5lY3RlZC4KCi0gTWFuaQoKLS0g
CuCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
