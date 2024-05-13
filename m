Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5097E8C4612
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 19:32:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0185BC6A61D;
	Mon, 13 May 2024 17:32:40 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 698EBC5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 17:32:32 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2b33e342c03so4104024a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 10:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715621551; x=1716226351;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qBskcfG9aM08EQ3NqSBzF1A9Ml9c1SIZv/ydH3cvOC8=;
 b=Nm/YixM+MtbA5d1eZB9Rsn2qp0m4hb9C7M5BijQSZs9pQssgJROc+WyP+6BbNH+etY
 azfI3D7uE5ps6goTgj6aKY77EVhRN3t+loaVS/3ArrglhK3MWMlY4XYYVQOQ9srMlj/s
 1FcCc/LkozCldwo5s/JNe06/qn5/Z3kp2ah+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715621551; x=1716226351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qBskcfG9aM08EQ3NqSBzF1A9Ml9c1SIZv/ydH3cvOC8=;
 b=BB+ZlPVXifDl2xIq2jfOo9EiLpcdWpfrv7g3P3a5JW8jw9DB3t4jEY7HiAJ9OvVeuo
 i40uer8zlv7zbhakey4y0acEEHuj6W7aQBGZWpJxG4ssY8NehXlwJCg/B2E55e0XJcvk
 DgNGZb7IRBEcuPo93jC1+XsOTA7UUQqsFVdRpIUyD5fMTdjuNPNIF/CNquDM75jvloL1
 sPumigjfP+k6iGxKHFy9dbkhpYWOYg6Ntjvh/LsWqUjzpN2CTRHIys8OtS2HKRb0EBKM
 MneLdAjVxvNJrwpEqljjhrgJj6liIoqpauYKQgyiNzUbp6I/y4m+l2Y9oAqF3MQsbDzM
 jIfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjBiUNCNdH53hDVa6NqoPUFaHzb3GzzLkDRC8ure+IstFrNwTnDDSCLcnIncNywPzDxCEfBKPm2o5Mzof/QI9ktmozIPulo4+a+EZDxWvT6TPUvCSJw6gE
X-Gm-Message-State: AOJu0YwBER5fM6HSizo6zc0/gmMQ+wt0KoglAI7XS2RFTOV73mCR5Pye
 icjVnSyufMNLgO/6cHRTbi9f1Hi5I0Xpq5UG4zQBTFREuPcUimadBnSMQS5ci14KwLrkk57ClgB
 lAGS4+jfj15t+w8z/Jw3U5GrW9lCr2HTov54x
X-Google-Smtp-Source: AGHT+IF7+dEtjAXbfnCYpn8cxOY0NsZcjmqTQO78In26AeAGJNxjpO+h8xHhH1On7C8lWFuqkMS0FE5B4iZVrdBg0b4=
X-Received: by 2002:a17:90b:4f82:b0:2a1:f586:d203 with SMTP id
 98e67ed59e1d1-2b6ccd8874amr9380254a91.41.1715621550896; Mon, 13 May 2024
 10:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240510000331.154486-3-jitendra.vegiraju@broadcom.com>
 <20240511015924.41457-1-jitendra.vegiraju@broadcom.com>
 <4ede8911-827d-4fad-b327-52c9aa7ed957@lunn.ch>
 <Zj+nBpQn1cqTMJxQ@shell.armlinux.org.uk>
 <08b9be81-52c9-449d-898f-61aa24a7b276@lunn.ch>
In-Reply-To: <08b9be81-52c9-449d-898f-61aa24a7b276@lunn.ch>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Mon, 13 May 2024 10:32:19 -0700
Message-ID: <CAMdnO-+V2npKBoXW5o-5avS9HP84LV+nQkvW6AxbLwFOrZuAGg@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>, edumazet@google.com,
 joabreu@synopsys.com, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2, net-next,
	2/2] net: stmmac: PCI driver for BCM8958X SoC
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

T24gU2F0LCBNYXkgMTEsIDIwMjQgYXQgMTA6NTDigK9BTSBBbmRyZXcgTHVubiA8YW5kcmV3QGx1
bm4uY2g+IHdyb3RlOgo+Cj4gT24gU2F0LCBNYXkgMTEsIDIwMjQgYXQgMDY6MTI6MzhQTSArMDEw
MCwgUnVzc2VsbCBLaW5nIChPcmFjbGUpIHdyb3RlOgo+ID4gT24gU2F0LCBNYXkgMTEsIDIwMjQg
YXQgMDY6MTY6NTJQTSArMDIwMCwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4gPiA+ID4gKyAvKiBUaGlz
IGRldmljZSBpbnRlcmZhY2UgaXMgZGlyZWN0bHkgYXR0YWNoZWQgdG8gdGhlIHN3aXRjaCBjaGlw
IG9uCj4gPiA+ID4gKyAgKiAgdGhlIFNvQy4gU2luY2Ugbm8gTURJTyBpcyBwcmVzZW50LCByZWdp
c3RlciBmaXhlZF9waHkuCj4gPiA+ID4gKyAgKi8KPiA+ID4gPiArIGJyY21fcHJpdi0+cGh5X2Rl
diA9Cj4gPiA+ID4gKyAgICAgICAgICBmaXhlZF9waHlfcmVnaXN0ZXIoUEhZX1BPTEwsCj4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmR3eGdtYWNfYnJjbV9maXhlZF9waHlf
c3RhdHVzLCBOVUxMKTsKPiA+ID4gPiArIGlmIChJU19FUlIoYnJjbV9wcml2LT5waHlfZGV2KSkg
ewo+ID4gPiA+ICsgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICIlc1x0Tm8gUEhZL2ZpeGVk
X1BIWSBmb3VuZFxuIiwgX19mdW5jX18pOwo+ID4gPiA+ICsgICAgICAgICByZXR1cm4gLUVOT0RF
VjsKPiA+ID4gPiArIH0KPiA+ID4gPiArIHBoeV9hdHRhY2hlZF9pbmZvKGJyY21fcHJpdi0+cGh5
X2Rldik7Cj4gPiA+Cj4gPiA+IFdoYXQgc3dpdGNoIGlzIGl0PyBXaWxsIHRoZXJlIGJlIHBhdGNo
ZXMgdG8gZXh0ZW5kIFNGMj8KPiA+Cj4gPiAuLi4gYW5kIHdoeSBpcyB0aGlzIGxlZ2FjeSBmaXhl
ZF9waHkgZXZlbiBuZWNlc3Nhcnkgd2hlbiBzdG1tYWMgdXNlcwo+ID4gcGh5bGluayB3aGljaCBz
dXBwb3J0cyBmaXhlZCBsaW5rcywgaW5jbHVkaW5nIHdpdGggY3VzdG9tIGZpeGVkIHN0YXR1cz8K
Pgo+IEFuZCBub3cgeW91IG1lbnRpb25zIGxlZ2FjeSBGaXhlZCBsaW5rOgo+Cj4gK01PRFVMRV9E
RVNDUklQVElPTigiQnJvYWRjb20gMTBHIEF1dG9tb3RpdmUgRXRoZXJuZXQgUENJZSBkcml2ZXIi
KTsKPgo+IFRoaXMgY2xhaW1zIGl0IGlzIGEgMTBHIGRldmljZS4gWW91IGNhbm5vdCByZXByZXNl
bnQgMTBHIHVzaW5nIGxlZ2FjeQo+IGZpeGVkIGxpbmsuCj4KPiBEb2VzIHRoaXMgTUFDIGRpcmVj
dGx5IGNvbm5lY3QgdG8gdGhlIHN3aXRjaCB3aXRoaW4gdGhlIFNvQz8gVGhlcmUgaXMKPiBubyBl
eHRlcm5hbCBNSUkgaW50ZXJmYWNlPyBSZWFsdGVrIGhhdmUgYmVlbiBwb3N0aW5nIGEgTUFDIGRy
aXZlciBmb3IKPiBzb21ldGhpbmcgc2ltaWxhciB3ZXJlIHRoZSBNQUMgaXMgZGlyZWN0bHkgY29u
bmVjdGVkIHRvIHRoZSBzd2l0Y2gKPiB3aXRoaW4gdGhlIFNvQy4gVGhlIE1BQyBpcyBmaXhlZCBh
dCA1RywgdGhlcmUgaXMgbm8gcGh5bGluay9waHlsaWIKPiBzdXBwb3J0LCBzZXRfbGlua19rc2V0
dGluZyByZXR1cm4gLUVPUE5PVFNVUFAgYW5kIGdldF9saW5rX2tzZXR0aW5ncwo+IHJldHVybnMg
aGFyZCBjb2RlZCA1Ry4KPgo+IFdlIG5lZWQgYSBiZXR0ZXIgdW5kZXJzdGFuZGluZyBvZiB0aGUg
YXJjaGl0ZWN0dXJlIGhlcmUsIGJlZm9yZSB3ZSBjYW4KPiBhZHZpc2UgdGhlIGNvcnJlY3Qgd2F5
IHRvIGRvIHRoaXMuCj4KWWVzLCB0aGUgTUFDIGRpcmVjdGx5IGNvbm5lY3RzIHRvIHN3aXRjaCB3
aXRoaW4gdGhlIFNvQyB3aXRoIG5vIGV4dGVybmFsIE1JSS4KVGhlIFNvQyBpcyBCQ004OTU4Nk0v
QkNNODk1ODcgYXV0b21vdGl2ZSBldGhlcm5ldCBzd2l0Y2guClRoZSBTT0MgcHJlc2VudHMgUENJ
RSBpbnRlcmZhY2VzIG9uIEJDTTg5NTg2TS9CQ004OTU4NyBhdXRvbW90aXZlCmV0aGVybmV0IHN3
aXRjaC4KVGhlIHN3aXRjaCBzdXBwb3J0cyBtYW55IGV0aGVybmV0IGludGVyZmFjZXMgb3V0IG9m
IHdoaWNoIG9uZSBvciB0d28KaW50ZXJmYWNlcyBhcmUgcHJlc2VudGVkIGFzIFBDSUUgZW5kcG9p
bnRzIHRvIHRoZSBob3N0IGNvbm5lY3RlZCBvbgp0aGUgUENJRSBidXMuClRoZSBNQUMgY29ubmVj
dHMgdG8gc3dpdGNoIHVzaW5nIFhHTUlJIGludGVyZmFjZSBpbnRlcm5hbCB0byB0aGUgU09DLgpU
aGUgaGlnaCBsZXZlbCBkaWFncmFtIGlzIHNob3duIGJlbG93OgoKKz09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09KwogICArLS0tLS0tLS0rICAgICAgICAg
ICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgIEJDTTg5NThYCnN3aXRjaCBTb0MgICAg
ICAgICAgICAgICArLS0tLS0tLS0tLS0tLS0tLSsgICAgICAgICB8CiAgIHwgSG9zdCAgIHwgICAg
ICAgICAgICAgICAgICAgICAgfCAgKy0tLS0tLS0tLS0tLS0tLS0rCiAgICArLS0tLS0tLSsgICAg
ICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgfCA9PT0KbW9yZSBl
dGhlcm5ldCBJRnMKICAgfCBDUFUgICB8ID09PVBDSUU9PT18IFBDSUUgZW5kcG9pbnQgfD09RE1B
PT18IE1BQyB8PT1YR01JST09fApzd2l0Y2ggZmFicmljIHwgICAgICAgICB8ID09PSBtb3JlIGV0
aGVybmV0IElGcwogICB8TGludXggICB8ICAgICAgICAgICAgICAgICAgICAgIHwgKy0tLS0tLS0t
LS0tLS0tLS0rCiAgICstLS0tLS0tKyAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICB8ICAgICAgICAgfAogICArLS0tLS0tLSsgICAgICAgICAgICAgICAgICAgICAgIHwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArLS0tLS0tLS0tLS0tLS0tLS0rICAg
ICAgICB8CgorPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0rClNpbmNlIHRoZSBsZWdhY3kgZml4ZWQgbGluayBjYW5ub3Qgc3VwcG9ydCAxMEcsIHdlIGFy
ZSBpbml0aWFsaXppbmcgdG8KZml4ZWQgc3BlZWQgMUcuCj4gICAgICAgQW5kcmV3Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
