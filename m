Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 407A894C842
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2024 03:50:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7BADC78019;
	Fri,  9 Aug 2024 01:50:16 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D66ADC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2024 01:50:09 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2cb5789297eso1259570a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Aug 2024 18:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723168208; x=1723773008;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJYAKUyPbciCc4vCrXAcPv95+Qs4aCXInm0STL0fohI=;
 b=MJlwbvkDSP1SQy/z2FSbC4IVxsRwjdGtN5SnsuqF0J7R2LqoYE9GpQx58kEVOIlRre
 t4qBelyYdKEuN29NeS3K8ov/RPtkSRG3cr2z33PXCbfillG9E4EQHFqDwGQZvvRq0obF
 kzeZ9ARZ5c5YQOJrOh2alCXvrNYUvY3GspQH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723168208; x=1723773008;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wJYAKUyPbciCc4vCrXAcPv95+Qs4aCXInm0STL0fohI=;
 b=AR0Mszv6XSKEl9PTSv79s7duFs62AjOIzySE6Mxk1QfN+1rkyeU1Waws4iIw+AgLo5
 F/im3IZHue/6RV3ooK1xl5caIPmr5YYcX0mVQk20RmhvEqtx8HE+eiuz6MZjmPQguwi/
 S6+P6hke9xUwidDaHl/hEed+2zMB7fsJhqCA6WImWMpzaVimR/6neB9OK6WaT66lPzix
 qxrYHfpGvvj+M/j8agoMcPbADRZ5TAC+I7qNyYyNnCNdLBenJHLe2LlUSIsSS34Fy72Q
 +AK5I+TLpmyphOCT9yRckAMud6vhHBHgRmOnC8+rELiiK4aFvziqek4u4t7JGzTnATJN
 yfZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHbjyk6XRbZkoNEUMkz6qPP14ulJAzPnCdiG/UcCAFUhCSEuHHdlEuofcz0D1mlmvW1BlAdithaKj/oQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwAneVgvWEFg9azoujBsjlRtbKj5JQ+tkgajL3RB3Ht0IyDKMki
 EWX++iocydxMp2zRwVo+oVdNFNxIwzX73rZS6TXfRdPrhDKoJsrDsF9w1p9rfjOq1KzcvvLVT6R
 rLm+S3jfG12EF5tvJdoIRNmMdx5kicyZlUeDg
X-Google-Smtp-Source: AGHT+IHzhTtrIODiPawo9uaYrezjTm9YBfmLrsFRZAR1fnpznOkZgFG+1eZH6YuMmWDJKca259PLWfZIyYoQ25pXmNU=
X-Received: by 2002:a17:90b:4b8e:b0:2d1:ca16:5555 with SMTP id
 98e67ed59e1d1-2d1ca16580emr3666377a91.37.1723168208179; Thu, 08 Aug 2024
 18:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-3-jitendra.vegiraju@broadcom.com>
 <1e6e6eaa-3fd3-4820-bc1d-b1c722610e2f@lunn.ch>
 <CAMdnO-J-G2mUw=RySEMSUj8QmY7CyFe=Si1-Ez9PAuF+knygWQ@mail.gmail.com>
 <e6b4fc20-a861-4f24-9881-f8151fe66351@lunn.ch>
In-Reply-To: <e6b4fc20-a861-4f24-9881-f8151fe66351@lunn.ch>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Thu, 8 Aug 2024 18:49:57 -0700
Message-ID: <CAMdnO-Lte7SfYXBhjBXoKP_LsXRvdexvUKKYBQEC2Y0jjEQYng@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: hawk@kernel.org, daniel@iogearbox.net, linux@armlinux.org.uk,
 netdev@vger.kernel.org, richardcochran@gmail.com, john.fastabend@gmail.com,
 ast@kernel.org, linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/3] net: stmmac: Integrate
 dwxgmac4 into stmmac hwif handling
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

SGkgQW5kcmV3CgpPbiBUdWUsIEF1ZyA2LCAyMDI0IGF0IDQ6MTPigK9QTSBBbmRyZXcgTHVubiA8
YW5kcmV3QGx1bm4uY2g+IHdyb3RlOgo+Cj4gT24gTW9uLCBBdWcgMDUsIDIwMjQgYXQgMDU6MzY6
MzBQTSAtMDcwMCwgSml0ZW5kcmEgVmVnaXJhanUgd3JvdGU6Cj4gPiBIaSBBbmRyZXcsCj4gPiBP
biBGcmksIEF1ZyAyLCAyMDI0IGF0IDM6NTnigK9QTSBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4u
Y2g+IHdyb3RlOgo+ID4gPgo+ID4gPiA+ICsgICAgIHVzZXJfdmVyID0gc3RtbWFjX2dldF91c2Vy
X3ZlcnNpb24ocHJpdiwgR01BQzRfVkVSU0lPTik7Cj4gPiA+ID4gKyAgICAgaWYgKHByaXYtPnN5
bm9wc3lzX2lkID09IERXWEdNQUNfQ09SRV80XzAwICYmCj4gPiA+ID4gKyAgICAgICAgIHVzZXJf
dmVyID09IERXWEdNQUNfVVNFUl9WRVJfWDIyKQo+ID4gPiA+ICsgICAgICAgICAgICAgbWFjLT5k
bWEgPSAmZHd4Z21hYzQwMF9kbWFfb3BzOwo+ID4gPgo+ID4gPiBJIGtub3cgbm90aGluZyBhYm91
dCB0aGlzIGhhcmR3YXJlLi4uLgo+ID4gPgo+ID4gPiBEb2VzIHByaXYtPnN5bm9wc3lzX2lkID09
IERXWEdNQUNfQ09SRV80XzAgbm90IGltcGx5Cj4gPiA+IGR3eGdtYWM0MDBfZG1hX29wcz8KPiA+
ID4KPiA+ID4gQ291bGQgYSB1c2VyIHN5bnRoZXNpc2UgRFdYR01BQ19DT1JFXzRfMDAgd2l0aG91
dCB1c2luZwo+ID4gPiBkd3hnbWFjNDAwX2RtYV9vcHM/IENvdWxkIGR3eGdtYWM1MDBfZG1hX29w
cyBvciBkd3hnbWFjMTAwX2RtYV9vcHMgYmUKPiA+ID4gdXNlZD8KPiA+IFllcywgdGhlIHVzZXIg
Y2FuIGNob29zZSBiZXR3ZWVuIEVuaGFuY2VkIERNQSAsIEh5cGVyIERNQSAsIE5vcm1hbCBETUEu
Cj4gPiBUaGlzIFNvQyBzdXBwb3J0IGhhcyBjaG9zZW4gSHlwZXIgRE1BIGZvciBmdXR1cmUgZXhw
YW5kYWJpbGl0eS4KPgo+IElzIHRoZXJlIGEgcmVnaXN0ZXIgd2hpY2ggZGVzY3JpYmVzIHRoZSBz
eW50aGVzaXMgY29uZmlndXJhdGlvbj8gSXQgaXMKPiBtdWNoIGJldHRlciB0aGF0IHRoZSBoYXJk
d2FyZSB0ZWxscyB1cyB3aGF0IGl0IGlzLCByYXRoZXIgdGhhbiBoYXZpbmcKPiB0byBleHBhbmQg
dGhpcyBjb25kaXRpb24gZm9yIGV2ZXJ5IG5ldyBkZXZpY2VzIHdoaWNoIGdldHMgYWRkZWQuCj4K
U29ycnksIGZvciB0aGUgZGVsYXllZCByZXNwb25zZS4KV2UgZ290IGNvbmZpcm1hdGlvbiB0aGF0
IEhETUEgY2FwYWJpbGl0eSBjYW4gYmUgaWRlbnRpZmllZCBieSB0aGUKcHJlc2VuY2Ugb2YgRFdY
R01BQ19DT1JFXzRfeHggYW5kIGRldmljZV9pZCAweDU1LgoKPiBBbHNvLCB3aGF0IGlzIHRoZSBk
ZWZpbml0aW9uIG9mIHVzZXJfdmVyLiBDYW4gd2UgZ3VhcmFudGVlIHRoaXMgaXMKPiB1bmlxdWUg
YW5kIGNhbiBhY3R1YWxseSBiZSB1c2VkIHRvIGRldGVybWluZSB3aGF0IERNQSB2YXJpYW50IGhh
cyBiZWVuCj4gc3ludGhlc2lzZWQ/ClRoZSBpbml0aWFsIGluZm9ybWF0aW9uIEkgZ290IG9uIHRo
aXMgaXMgdGhhdCB1c2VyIHZlcnNpb25zIGFyZQphbGxvY2F0ZWQgYW5kIHJlc2VydmVkIGJ5IFN5
bm9wc2lzLgpXZSBwcm9iYWJseSBkb24ndCBuZWVkIHRvIGtleSBvZmYgdGhpcyBpbmZvcm1hdGlv
biBub3cuCj4KPiAgICAgICAgIEFuZHJldwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
