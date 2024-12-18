Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA459F60FA
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2024 10:08:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC742C78014;
	Wed, 18 Dec 2024 09:08:51 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49965C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 09:08:44 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-728e3826211so4970260b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 01:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734512923; x=1735117723;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Wy1Hv7f5NOQcxmlYyzPB31q6qHS+YkVM6o+GdftYtbY=;
 b=ZaVBgXV+w+lIe8LVsFCG19txCpwy268GASX/ENmKp6l3PRjC/9/JadAzsBpwBLhk2d
 1F9x0xupMgbDwKwEqsj+4EilXUUncae7eKgq4D5oY2uws4pdCTIxSt7vh6ynfHYSaMgY
 PVuimdp0HjWG7UJ7y/guR+XX1LDdGeUnV0LQkYcNruffd56PkSxr8aBkppPywUZpzvTx
 WvGItKQgcfO9zHQzDd/N0C7DCk6GWzSg6EpbgxKazakJ7oh5aJyNiBeO05ZZ3pr2jQ4E
 IzzlxxRMPG5VycToCqQv7njYNHxVg+LZwT35Wtgjzb5zZ1SBDl6ttX0OB7FLpUKUqKPl
 IVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734512923; x=1735117723;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wy1Hv7f5NOQcxmlYyzPB31q6qHS+YkVM6o+GdftYtbY=;
 b=Dw/zUKViDVnI0ghK4KhQi+YZPPbuKVAxvOKwNCOLXGJJzxAwarZys0NpjeGUoh3mhi
 Jjel0osC4BOxqHcHdfX8QrwqWHVISHIEOvHQarOx/5H+w6YLfjGpXds4HHH6Ln0j3Vyw
 f1vTYHzdTvhJ365mL69qe8u9JuBDnnXWV2OIGkvDy8pO0a6r936A5lX6LecUVyqvvTM/
 +pRnVa8SKcgN4j5bD8NobJcHUM9vtRbOWvfhV8YYyaJViUIGqMWV/UfJqqJFWbuF69bX
 i/IC9pRjOprOZM8yIYHdulweUocGxqGd18sWft/xZUtAv3ppM8zte+LHrmEY5XE9s1ZK
 7/QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX25nyv5UadgVBoS0KGLPoSGgOknHFn7QRX3Ml6kVtlq0oTDS326f9ox/a0rnlQ38BaNjchR9yihrMUtA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyV+ddw4BCoRmgqckxfKEcqxhkuccseTXuJCOC+BQvIZuxgK5ra
 7Ywd9QXUvypI39l+SLpPWPyi1wZbHySrdyKXmjd23XR/6SBrvMUJhqXZYos4RA==
X-Gm-Gg: ASbGnct9dn6+X83cnyZGKt/x4N9yAqbt4YCOa06dGxaL6jIqINeerjBSMIErwjC02+j
 WHfnxPjC6Qy6g41gOVEVfpkKQ2vUFjK3xoNIF6nZoS1j5t8iEYnVhm59mp3nkYKTeQFCnSw+5EP
 MLQQnPlBW6zT9BCFmDUrpPw+yPB1Fqeu60iitMOEHgjK0BItW8yuujD6I179YVnx4Fq2NOVoj8Q
 vzAasrctK3zwR/rTvNIgCT2SJDWowMcccljXp//WVK910Ob7POu0Zf2YxuH0+75KCNC
X-Google-Smtp-Source: AGHT+IG37gQZUixcAS2wt6FAy35zDXkREGTgBmnLoB7E2HkZAUyQek0tK+EgYpBTTg5mZeTEdfkKVA==
X-Received: by 2002:a05:6a21:9002:b0:1e1:b28e:a148 with SMTP id
 adf61e73a8af0-1e5b45ffc3dmr3602999637.5.1734512922868; 
 Wed, 18 Dec 2024 01:08:42 -0800 (PST)
Received: from thinkpad ([117.193.214.60]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72918bad749sm7997622b3a.138.2024.12.18.01.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 01:08:42 -0800 (PST)
Date: Wed, 18 Dec 2024 14:38:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Message-ID: <20241218090834.bz5htywl3sjbzq6w@thinkpad>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-5-christian.bruel@foss.st.com>
 <20241203152230.5mdrt27u5u5ecwcz@thinkpad>
 <4e257489-4d90-4e47-a4d9-a2444627c356@foss.st.com>
 <20241216161700.dtldi7fari6kafrr@thinkpad>
 <fdc487c4-cbdc-45ac-a79f-aff2b8ccafcc@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fdc487c4-cbdc-45ac-a79f-aff2b8ccafcc@foss.st.com>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de, robh@kernel.org,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 cassel@kernel.org, devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 mcoquelin.stm32@gmail.com, bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/5] PCI: stm32: Add PCIe endpoint
 support for STM32MP25
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

T24gVHVlLCBEZWMgMTcsIDIwMjQgYXQgMTA6NDg6NDNBTSArMDEwMCwgQ2hyaXN0aWFuIEJydWVs
IHdyb3RlOgo+IAo+IAo+IE9uIDEyLzE2LzI0IDE3OjE3LCBNYW5pdmFubmFuIFNhZGhhc2l2YW0g
d3JvdGU6Cj4gPiBPbiBNb24sIERlYyAxNiwgMjAyNCBhdCAxMTowMjowN0FNICswMTAwLCBDaHJp
c3RpYW4gQnJ1ZWwgd3JvdGU6Cj4gPiA+IEhpIE1hbml2YW5uYSwKPiA+ID4gCj4gPiA+IE9uIDEy
LzMvMjQgMTY6MjIsIE1hbml2YW5uYW4gU2FkaGFzaXZhbSB3cm90ZToKPiA+ID4gPiBPbiBUdWUs
IE5vdiAyNiwgMjAyNCBhdCAwNDo1MToxOFBNICswMTAwLCBDaHJpc3RpYW4gQnJ1ZWwgd3JvdGU6
Cj4gPiA+ID4gCj4gPiA+ID4gWy4uLl0KPiA+ID4gPiAKPiA+ID4gPiA+ICtzdGF0aWMgaW50IHN0
bTMyX3BjaWVfc3RhcnRfbGluayhzdHJ1Y3QgZHdfcGNpZSAqcGNpKQo+ID4gPiA+ID4gK3sKPiA+
ID4gPiA+ICsJc3RydWN0IHN0bTMyX3BjaWUgKnN0bTMyX3BjaWUgPSB0b19zdG0zMl9wY2llKHBj
aSk7Cj4gPiA+ID4gPiArCWludCByZXQ7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArCWlmIChzdG0z
Ml9wY2llLT5saW5rX3N0YXR1cyA9PSBTVE0zMl9QQ0lFX0VQX0xJTktfRU5BQkxFRCkgewo+ID4g
PiA+ID4gKwkJZGV2X2RiZyhwY2ktPmRldiwgIkxpbmsgaXMgYWxyZWFkeSBlbmFibGVkXG4iKTsK
PiA+ID4gPiA+ICsJCXJldHVybiAwOwo+ID4gPiA+ID4gKwl9Cj4gPiA+ID4gPiArCj4gPiA+ID4g
PiArCXJldCA9IHN0bTMyX3BjaWVfZW5hYmxlX2xpbmsocGNpKTsKPiA+ID4gPiA+ICsJaWYgKHJl
dCkgewo+ID4gPiA+ID4gKwkJZGV2X2VycihwY2ktPmRldiwgIlBDSWUgY2Fubm90IGVzdGFibGlz
aCBsaW5rOiAlZFxuIiwgcmV0KTsKPiA+ID4gPiA+ICsJCXJldHVybiByZXQ7Cj4gPiA+ID4gPiAr
CX0KPiA+ID4gPiAKPiA+ID4gPiBIb3cgdGhlIFJFRkNMSyBpcyBzdXBwbGllZCB0byB0aGUgZW5k
cG9pbnQ/IEZyb20gaG9zdCBvciBnZW5lcmF0ZWQgbG9jYWxseT8KPiA+ID4gCj4gPiA+ICBGcm9t
IEhvc3Qgb25seSwgd2UgZG9uJ3Qgc3VwcG9ydCB0aGUgc2VwYXJhdGVkIGNsb2NrIG1vZGVsLgo+
ID4gPiAKPiA+IAo+ID4gT0suIFNvIGV2ZW4gd2l0aG91dCByZWZjbGsgeW91IGFyZSBzdGlsbCBh
YmxlIHRvIGFjY2VzcyB0aGUgY29udHJvbGxlcgo+ID4gcmVnaXN0ZXJzPyBTbyB0aGUgY29udHJv
bGxlciBDU1JzIHNob3VsZCBiZSBhY2Nlc3NpYmxlIGJ5IHNlcGFyYXRlIGxvY2FsIGNsb2NrIEkK
PiA+IGJlbGlldmUuCj4gPiAKPiA+IEFueWhvdywgcGxlYXNlIGFkZCB0aGlzIGxpbWl0YXRpb24g
KHJlZmNsayBkZXBlbmRlbmN5IGZyb20gaG9zdCkgaW4gY29tbWl0Cj4gPiBtZXNzYWdlLgo+ID4g
Cj4gPiBbLi4uXQo+ID4gCj4gPiA+ID4gPiArCXJldCA9IHBoeV9zZXRfbW9kZShzdG0zMl9wY2ll
LT5waHksIFBIWV9NT0RFX1BDSUUpOwo+ID4gPiA+IAo+ID4gPiA+IEhtbSwgc28gUEhZIG1vZGUg
aXMgY29tbW9uIGZvciBib3RoIGVuZHBvaW50IGFuZCBob3N0Pwo+ID4gPiAKPiA+ID4gWWVzIGl0
IGlzLiBXZSBuZWVkIHRvIGluaXQgdGhlIHBoeSBoZXJlIGJlY2F1c2UgaXQgaXMgYSBjbG9jayBz
b3VyY2UgZm9yIHRoZQo+ID4gPiBQQ0llIGNvcmUgY2xrCj4gPiA+IAo+ID4gCj4gPiBDbG9jayBz
b3VyY2U/IElzIGl0IGNvbWluZyBkaXJlY3RseSB0byBQQ0llIG9yIHRocm91Z2ggUkNDPyBUaGVy
ZSBpcyBubyBkaXJlY3QKPiA+IGNsb2NrIHJlcHJlc2VudGF0aW9uIGZyb20gUEhZIHRvIFBDSWUg
aW4gRFQgYmluZGluZy4KPiAKPiBUaGUgY29yZV9jbGsgaXMgZ2VuZXJhdGVkIGRpcmVjdGx5IGJ5
IHRoZSBQTEwgaW4gdGhlIENPTUJPUEhZLCBnYXRlZCBieSB0aGUKPiBSQ0MKPiAKCkluIHRoYXQg
Y2FzZSwgcGh5IHNob3VsZCBiZSB0aGUgY2xvY2sgcHJvdmlkZXIgdG8gUkNDIGFuZCBQQ0llIHNo
b3VsZCBnZXQgdGhlCmdhdGVkIGNsb2NrIGl0LgoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K614K6j
4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
