Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3524F773AC1
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 16:44:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B11CAC6B469;
	Tue,  8 Aug 2023 14:44:24 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6AD9C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 14:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691505861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lr8QH1hJKMAeMGOo0M5b1qGrUuXmYrB7fQhjBLGi+k0=;
 b=Xk7+MDW+TVx1S0WWPLGYzDVX5FTPnSRD+cGSONU0kmUNmnIHLF74HQNz+HAWeZnO6vfIxF
 mtdj8jeJCB1djcEHU/G3fMENEk/1DWTKnrR0Pt2YbpdXbj1ka9kYwfA6Th3W9mEKXFmALP
 gHWAQyb9U565WLAshpH6t6Ta+Q4yHsM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-WBc-7gSMM4qurAmBRkB1lw-1; Tue, 08 Aug 2023 10:44:19 -0400
X-MC-Unique: WBc-7gSMM4qurAmBRkB1lw-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4100bd13cb7so19780971cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Aug 2023 07:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691505859; x=1692110659;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lr8QH1hJKMAeMGOo0M5b1qGrUuXmYrB7fQhjBLGi+k0=;
 b=OhswDJuvyrfp9Hc3CMGs5sLSkmZ/AgtJhPA0i02E3c5MugI+rJko3K/VLX777RyV37
 WjcQbo7Ox5qyGxTkzkR1VKyhBtvsCViENH63u507iK5QEDjocl0qUex/SrNAN+tYMKkg
 S2GOKOewbwz9SKo8VeeYbfWkppmZkgJeA/97TL/XvfN4o92RA20njG1do++5gTpFxwu7
 NXU+hKRxrtVmbx/Nq969fj83Vc2iazoUqEQszu1WgTjrNvr/JtaUxv0CMDdQqUsUlphD
 UwMkqqyldnhwqAdrCxg7OHyl76N68/kkFoznN+EjGE/rbgOnLYOuz6asFAZTmMMsf2eY
 sw3A==
X-Gm-Message-State: AOJu0YwzZki1Y7I+7wgwO4XFQlpm5pZD4UzJE54J/icrlgTys4bK7SZW
 UWy1IeTLqdaaHC4Uryk5aWkhLoNzsMe+STyrjgHoCbK2iidheG305w3BVaTMR0gqIBn2vSaJVPK
 7fUYcXv68GDTBAA/OMHqoTs9XB3mNQMCXMEQUJuyu
X-Received: by 2002:ac8:5902:0:b0:40f:f44f:7f79 with SMTP id
 2-20020ac85902000000b0040ff44f7f79mr2454qty.16.1691505859185; 
 Tue, 08 Aug 2023 07:44:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4H/PhZU/WpPuHATF0/xjAxDvtaCGT5yE9Pf+IDINKw6+ypsWmrPVAHe6GEcDu06wD1x60qw==
X-Received: by 2002:ac8:5902:0:b0:40f:f44f:7f79 with SMTP id
 2-20020ac85902000000b0040ff44f7f79mr2428qty.16.1691505858889; 
 Tue, 08 Aug 2023 07:44:18 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 l5-20020ac84a85000000b0040fdf9a53e6sm3397095qtq.82.2023.08.08.07.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 07:44:18 -0700 (PDT)
Date: Tue, 8 Aug 2023 09:44:16 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <xfme5pgj4eqlgao3vmyg6vazaqk6qz2wq6kitgujtorouogjty@cklyof3xz2zm>
References: <20230807193102.6374-1-brgl@bgdev.pl>
 <54421791-75fa-4ed3-8432-e21184556cde@lunn.ch>
 <CAMRc=Mc6COaxM6GExHF2M+=v2TBpz87RciAv=9kHr41HkjQhCg@mail.gmail.com>
 <ZNJChfKPkAuhzDCO@shell.armlinux.org.uk>
 <CAMRc=MczKgBFvuEanKu=mERYX-6qf7oUO2S4B53sPc+hrkYqxg@mail.gmail.com>
 <65b53003-23cf-40fa-b9d7-f0dbb45a4cb2@lunn.ch>
 <CAMRc=MecYHi=rPaT44kuX_XMog=uwB9imVZknSjnmTBW+fb5WQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRc=MecYHi=rPaT44kuX_XMog=uwB9imVZknSjnmTBW+fb5WQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alex Elder <elder@linaro.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/2] net: stmmac: allow sharing MDIO lines
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

T24gVHVlLCBBdWcgMDgsIDIwMjMgYXQgMDQ6MzA6MDVQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pl
d3NraSB3cm90ZToKPiBPbiBUdWUsIEF1ZyA4LCAyMDIzIGF0IDQ6MjXigK9QTSBBbmRyZXcgTHVu
biA8YW5kcmV3QGx1bm4uY2g+IHdyb3RlOgo+ID4KPiA+ID4gPiBPbiBUdWUsIEF1ZyAwOCwgMjAy
MyBhdCAxMDoxMzowOUFNICswMjAwLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gPiA+
ID4gT2sgc28gdXBvbiBzb21lIGZ1cnRoZXIgaW52ZXN0aWdhdGlvbiwgdGhlIGFjdHVhbCBjdWxw
cml0IGlzIGluIHN0bW1hYwo+ID4gPiA+ID4gcGxhdGZvcm0gY29kZSAtIGl0IGFsd2F5cyB0cmll
cyB0byByZWdpc3RlciBhbiBNRElPIGJ1cyAtIGluZGVwZW5kZW50Cj4gPiA+ID4gPiBvZiB3aGV0
aGVyIHRoZXJlIGlzIGFuIGFjdHVhbCBtZGlvIGNoaWxkIG5vZGUgLSB1bmxlc3MgdGhlIE1BQyBp
cwo+ID4gPiA+ID4gbWFya2VkIGV4cGxpY2l0bHkgYXMgaGF2aW5nIGEgZml4ZWQtbGluay4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBXaGVuIEkgZml4ZWQgdGhhdCwgTUFDMSdzIHByb2JlIGlzIGNvcnJl
Y3RseSBkZWZlcnJlZCB1bnRpbCBNQUMwIGhhcwo+ID4gPiA+ID4gY3JlYXRlZCB0aGUgTURJTyBi
dXMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gRXZlbiBzbywgaXNuJ3QgaXQgdXNlZnVsIHRvIGFjdHVh
bGx5IHJlZmVyZW5jZSB0aGUgc2hhcmVkIE1ESU8gYnVzIGluIHNvbWUgd2F5Pwo+ID4gPiA+ID4K
PiA+ID4gPiA+IElmIHRoZSBzY2hlbWF0aWNzIGxvb2sgc29tZXRoaW5nIGxpa2UgdGhpczoKPiA+
ID4gPiA+Cj4gPiA+ID4gPiAtLS0tLS0tLSAgICAgICAgICAgLS0tLS0tLQo+ID4gPiA+ID4gfCBN
QUMwIHwtLU1ESU8tLS0tLXwgUEhZIHwKPiA+ID4gPiA+IC0tLS0tLS0tIHwgICAgIHwgICAtLS0t
LS0tCj4gPiA+ID4gPiAgICAgICAgICB8ICAgICB8Cj4gPiA+ID4gPiAtLS0tLS0tLSB8ICAgICB8
ICAgLS0tLS0tLQo+ID4gPiA+ID4gfCBNQUMxIHwtLSAgICAgLS0tLXwgUEhZIHwKPiA+ID4gPiA+
IC0tLS0tLS0tICAgICAgICAgICAtLS0tLS0tCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlbiBpdCB3
b3VsZCBtYWtlIHNlbnNlIHRvIG1vZGVsIGl0IG9uIHRoZSBkZXZpY2UgdHJlZT8KPiA+ID4gPgo+
ID4gPiA+IFNvIEkgdGhpbmsgd2hhdCB5b3UncmUgc2F5aW5nIGlzIHRoYXQgTUFDMCBhbmQgTUFD
MSdzIGhhdmUgTURJTyBidXMKPiA+ID4gPiBtYXN0ZXJzLCBhbmQgdGhlIGhhcmR3YXJlIGRlc2ln
bmVyIGRlY2lkZWQgdG8gdGllIGJvdGggdG9nZXRoZXIgdG8KPiA+ID4gPiBhIHNpbmdsZSBzZXQg
b2YgY2xvY2sgYW5kIGRhdGEgbGluZXMsIHdoaWNoIHRoZW4gZ28gdG8gdHdvIFBIWXMuCj4gPiA+
Cj4gPiA+IFRoZSBzY2hlbWF0aWNzIEkgaGF2ZSBhcmUgbm90IHZlcnkgY2xlYXIgb24gdGhhdCwg
YnV0IG5vdyB0aGF0IHlvdQo+ID4gPiBtZW50aW9uIHRoaXMsIGl0J3MgbW9zdCBsaWtlbHkgdGhl
IGNhc2UuCj4gPgo+ID4gSSBob3BlIG5vdC4gVGhhdCB3b3VsZCBiZSB2ZXJ5IGJyb2tlbi4gQXMg
UnVzc2VsbCBwb2ludGVkIG91dCwgTURJTyBpcwo+ID4gbm90IG11bHRpLW1hc3Rlci4gWW91IG5l
ZWQgdG8gY2hlY2sgd2l0aCB0aGUgaGFyZHdhcmUgZGVzaWduZXIgaWYgdGhlCj4gPiBzY2hlbWF0
aWNzIGFyZSBub3QgY2xlYXIuCj4gCj4gU29ycnksIGl0IHdhcyBub3QgdmVyeSBjbGVhci4gSXQn
cyB0aGUgY2FzZSB0aGF0IHR3byBNRElPIG1hc3RlcnMKPiBzaGFyZSB0aGUgTURDIGFuZCBkYXRh
IGxpbmVzLgoKSSdsbCBtYWtlIHRoZSB3YXRlciBtdWRkaWVyIChob3BlZnVsbHkgY2xlYXJlcj8p
LiBJIGhhdmUgYWNjZXNzIHRvIHRoZQpib2FyZCBzY2hlbWF0aWMgKG5vdCBTSVAvU09NIHN0dWZm
IHRob3VnaCksIGJ1dCB0aGF0IHNob3VsZCBoZWxwIGhlcmUuCgpNQUMwIG93bnMgaXRzIG93biBN
RElPIGJ1cyAod2UnbGwgY2FsbCBpdCBNRElPMCkuIEl0IGlzIHBpbm11eGVkIHRvCmdwaW84L2dw
aW85IGZvciBtZGMvbWRpby4gTUFDMSBvd25zIGl0cyBvd24gYnVzIChNRElPMSkgd2hpY2ggaXMK
cGlubXV4ZWQgdG8gZ3BpbzIxLzIyLgoKT24gTURJTzAgdGhlcmUgYXJlIHR3byBTR01JSSBldGhl
cm5ldCBwaHlzLiBPbmUgaXMgY29ubmVjdGVkIHRvIE1BQzAsCm9uZSBpcyBjb25uZWN0ZWQgdG8g
TUFDMS4KCk1ESU8xIGlzIG5vdCBjb25uZWN0ZWQgdG8gYW55dGhpbmcgb24gdGhlIGJvYXJkLiBT
byB0aGVyZSBpcyBvbmx5IG9uZQpNRElPIG1hc3RlciwgTUFDMCBvbiBNRElPMCwgYW5kIGl0IG1h
bmFnZXMgdGhlIGV0aGVybmV0IHBoeSBmb3IgYm90aApNQUMwL01BQzEuCgpEb2VzIHRoYXQgbWFr
ZSBzZW5zZT8gSSBkb24ndCB0aGluayBmcm9tIGEgaGFyZHdhcmUgZGVzaWduIHN0YW5kcG9pbnQK
dGhpcyBpcyB2aW9sYXRpbmcgYW55dGhpbmcsIGl0IGlzbid0IGEgbXVsdGltYXN0ZXIgc2V0dXAg
b24gTURJTy4KCj4gCj4gPgo+ID4gPiBHb29kIHBvaW50LCBidXQgaXQncyB3b3JzZSB0aGFuIHRo
YXQ6IHdoZW4gTUFDMCBpcyB1bmJvdW5kLCBpdCB3aWxsCj4gPiA+IHVucmVnaXN0ZXIgdGhlIE1E
SU8gYnVzIGFuZCBkZXN0cm95IGFsbCBQSFkgZGV2aWNlcy4gVGhlc2UgYXJlIG5vdAo+ID4gPiBy
ZWZjb3VudGVkIHNvIHRoZXkgd2lsbCBsaXRlcmFsbHkgZ28gZnJvbSB1bmRlciBNQUMxLiBOb3Qg
c3VyZSBob3cKPiA+ID4gdGhpcyBjYW4gYmUgZGVhbHQgd2l0aD8KPiA+Cj4gPiB1bmJpbmRpbmcg
aXMgbm90IGEgbm9ybWFsIG9wZXJhdGlvbi4gU28gaSB3b3VsZCBqdXN0IGxpdmUgd2l0aCBpdCwg
YW5kCj4gPiBpZiByb290IGRlY2lkZXMgdG8gc2hvb3QgaGVyc2VsZiBpbiB0aGUgZm9vdCwgdGhh
dCBpcyBoZXIgY2hvaWNlLgo+ID4KPiAKPiBJIGRpc2FncmVlLiBVbmJpbmRpbmcgaXMgdmVyeSBt
dWNoIGEgbm9ybWFsIG9wZXJhdGlvbi4gTGVzcyBzbyBmb3IKPiBwbGF0Zm9ybSBkZXZpY2VzIGJ1
dCBzdGlsbCwgaXQgaXMgdGhlcmUgZm9yIGEgcmVhc29uIGFuZCBzaG91bGQgYmUKPiBleHBlY3Rl
ZCB0byB3b3JrIGNvcnJlY3RseS4gT3IgYXQgdGhlIHZlcnkgbGVhc3Qgbm90IGNyYXNoIGFuZCBi
dXJuCj4gdGhlIHN5c3RlbS4KPiAKPiBPbiB0aGUgb3RoZXIgaGFuZCwgSSBsaWtlIHlvdXIgYXBw
cm9hY2ggYmVjYXVzZSBJIG1heSBnZXQgYXdheSB3aXRob3V0Cj4gaGF2aW5nIHRvIGZpeCBpdC4g
QnV0IGlmIEkgd2VyZSB0byBmaXggaXQgLSBJIHdvdWxkIHJlZmVyZW5jZSB0aGUgTURJTwo+IGJ1
cyBmcm9tIHRoZSBzZWNvbmRhcnkgbWFjIGJ5IHBoYW5kbGUgYW5kIGNvdW50IGl0cyByZWZlcmVu
Y2VzIGJlZm9yZQo+IGRyb3BwaW5nIGl0LiA6KQo+IAo+IEJhcnRvc3oKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
