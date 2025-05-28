Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD9CAC72E3
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 23:45:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC817C35E00;
	Wed, 28 May 2025 21:45:55 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E15FC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 21:45:54 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id
 71dfb90a1353d-52f4327a0c8so108108e0c.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 14:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748468753; x=1749073553;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hpEaJTEpfR9+TojleH3uk2aBSDLiXQVkHne1HqD9Ces=;
 b=HwONmwIrxm+ybxIVnRfdJ0/sSyHvjHiH2ypi5puLlItI6sDq/xDxbPEyzNA+WOd9Hq
 QLRXT1kyx4JNbL/E+JJ2Usg39tKdgCDxoOPA+2ovc2dPEFfzo4nmm30eLXSTJLjZrBOU
 lrITqu0Uxa+/tVhsVuX0xlx30nshtzETjH/ttnOwtIIa55xGWC8qeYEsW6zXG/KMMCKF
 0jRPCOCTPpYt3fgqef8vQcouNSnzTF0tbGfapHKbDsnxAU24RVNSeT5YZnn45kgWIjIp
 li8asCQzOtsLqGaCj1bkZqEZgWLc5DKOqidAsbeVODnpNgHO+iszjIPEl1h969NkeeZz
 nELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748468753; x=1749073553;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hpEaJTEpfR9+TojleH3uk2aBSDLiXQVkHne1HqD9Ces=;
 b=K2sqVA3dM4SY1F7urLG170338fZERTYUCbb+agjTC3qecx8sEnzuwiPd/eiGb7AkkF
 1SK+tDotaoEUrI7MPXK97aFeshylCROktHa2ByoY0SndCHE2SP/g+hIQyX7n77ogrfzn
 uxAf7zYw0V/yzKv0vpxhPRFVgbhP4Cg6yjJ/PktoMbWezL83Th6zIihzFjc3/VNzRbfT
 Q7JbFEtNznB6ak4WClTaX821TNfGg/Aj8VBG3MP9HP8ahNwOznabVv6QJhCcec4mUmyO
 eFxTdwCHjasI8aewgcYpZadBDOKqu644JVhIuJKR4pHaYOiuz4BaVH3qenlGWLJ3N4TK
 V1kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFw5gjSzzIpVBb05AyZckq11txSn0+gdA18/6Wy+fPlbLKpKiGDDL1rlIAqVgzQmeeusfpaHKaXQhnOA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxuHGG9kKaPuVCfc5a0t3F1KMH4egHHHbMT1pLWnJfJPGZVR89a
 Kz4s9if7qjUK5bgJSw+UwK8Hq2WK3zJEQSE6Z8Y5pP/6d5BkC8Xzn9PwQh9vfmywjQgIMFdVJ78
 yKF29qZyhM4qslJe3cfggzSrLyLcBYuo=
X-Gm-Gg: ASbGncvk2Dk8JDpep5g8ozJB20sLCnEV4U27hndQbh2anSDBM+bJmCxO8MaUalREAY7
 7DKhNDHMsQwrMmXXmh+ZPOPuUxmMSsJJFzsFCGjRkZ0QhzMaWmslZAmr4L5JLoHt6tl13u46UzP
 uxnZPB9UppJm3tSPsfx/1Eb+5nj8DpSrxOtg==
X-Google-Smtp-Source: AGHT+IGpsHKYbxIXwCy/oeyiPruU2kwkLfCm0N6ezu9dQx6lfofizVF8mmR7cTBw0/YoCHcNbrcZCx1R7ipPXQVnY1Y=
X-Received: by 2002:a05:6122:6185:b0:52f:4624:35ef with SMTP id
 71dfb90a1353d-52f46243757mr6427374e0c.6.1748468753120; Wed, 28 May 2025
 14:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
 <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk>
 <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
 <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch>
 <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
 <1e6e4a44-9d2b-4af4-8635-150ccc410c22@lunn.ch>
 <CADvTj4r1VvjiK4tj3tiHYVJtLDWtMSJ3GFQgYyteTnLGsQQ2Eg@mail.gmail.com>
 <0bf48878-a3d0-455c-9110-5c67d29073c9@lunn.ch>
In-Reply-To: <0bf48878-a3d0-455c-9110-5c67d29073c9@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 15:45:40 -0600
X-Gm-Features: AX0GCFsQQOiCt1aAs6THJH6hfyWkXOQcM4Hww3s0-x--VPr5n56VGuMBPUsnYgI
Message-ID: <CADvTj4qab272xTpZGRoPnCstufK_3e9CY99Og+2mey2co6u5dg@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Furong Xu <0x1207@gmail.com>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>, linux-sunxi@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>, wens@csie.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] net: stmmac: allow drivers to
 explicitly select PHY device
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMzoyOeKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiA+ID4gRGVzY3JpYmUgdGhlIG9uZSBQSFkgd2hpY2ggYWN0dWFsbHkg
ZXhpc3RzIGluIGRldmljZSB0cmVlIGZvciB0aGUKPiA+ID4gYm9hcmQsIGFuZCBwb2ludCB0byBp
dCB1c2luZyBwaHktaGFuZGxlLiBObyBydW50aW1lIGRldGVjdGlvbiwganVzdAo+ID4gPiBjb3Jy
ZWN0bHkgZGVzY3JpYmUgdGhlIGhhcmR3YXJlLgo+ID4KPiA+IEJ1dCB0aGUgYm9hcmRzIHJhbmRv
bWx5IGNvbnRhaW4gU29DJ3Mgd2l0aCBkaWZmZXJlbnQgUEhZJ3Mgc28gd2UKPiA+IGhhdmUgdG8g
c3VwcG9ydCBib3RoIHZhcmlhbnRzLgo+Cj4gWW91IGhhdmUgdHdvIC5kdHMgZmlsZXMsIHJlc3Vs
dGluZyBpbiB0d28gLmR0YiBmaWxlcywgd2hpY2ggYXJlIDk1JQo+IGlkZW50aWNhbCwgYnV0IGlt
cG9ydCBhIGRpZmZlcmVudCAuZHRzaSBmaWxlIGZvciB0aGUgUEhZLgo+Cj4gWW91IGNhbiB0ZXN0
IGlmIHRoZSBjb3JyZWN0IC5kdGIgYmxvYiBpcyB1c2VkIGJ5IGNoZWNraW5nIHRoZSBmdXNlLiBJ
Zgo+IGl0IGlzIHdyb25nLCB5b3UgY2FuIGdpdmUgYSBoaW50IHdoYXQgLmR0YiBzaG91bGQgYmUg
dXNlZC4KCkhvdyBpcyB0aGlzIGJldHRlciB0aGFuIGp1c3QgY2hvb3NpbmcgdGhlIGNvcnJlY3Qg
UEhZIGJhc2VkIG9uIHRoZQplZnVzZT8KCj4gT3IsIGFzIFJ1c3NlbGwgc3VnZ2VzdGVkLCB5b3Ug
Z2l2ZSB0aGUgYm9vdGxvYWRlciBib3RoIC5kdGIgYmxvYnMsIGFuZAo+IGl0IGNhbiBwaWNrIHRo
ZSBjb3JyZWN0IG9uZSB0byBwYXNzIHRvIHRoZSBrZXJuZWwuIE9yIHRoZSBib290bG9hZGVyCj4g
Y2FuIHBhdGNoIHRoZSAuZHRiIGJsb2IgdG8gbWFrZSBpdCBmaXQgdGhlIGhhcmR3YXJlLgoKVGhp
cyBpcyB3aGF0IEknbSByZWFsbHkgdHJ5aW5nIHRvIGF2b2lkIHNpbmNlIGl0IHJlcXVpcmVzIHNw
ZWNpYWwKaGFuZGxpbmcgaW4gdGhlIGJvb3Rsb2FkZXIgYW5kIHRoZXJlZm9yZSB3aWxsIHJlc3Vs
dCBpbiBhIGxvdCBvZiBicm9rZW4Kc3lzdGVtcyBzaW5jZSBtb3N0IHBlb3BsZSBkb2luZyBwb3J0
cyB0byBINjE2IGJhc2VkIGJvYXJkcyB3aWxsIG9ubHkKZXZlciB0ZXN0IGFnYWluc3Qgb25lIFBI
WSB2YXJpYW50LgoKPiA+ID4gRG8geW91IGhhdmUgZXhhbXBsZXMgb2YgYm9hcmRzIHdoZXJlIHRo
ZSBTb0MgdmFyaWFudCBjaGFuZ2VkIGR1cmluZwo+ID4gPiB0aGUgYm9hcmRzIHByb2R1Y3Rpb24g
bGlmZT8KPiA+Cj4gPiBZZXMsIHRoZSBib2FyZHMgSSdtIHdvcmtpbmcgZm9yIGV4YW1wbGUsIGJ1
dCB0aGlzIGlzIGxpa2VseSBhbiBpc3N1ZSBmb3IKPiA+IG90aGVyIGJvYXJkcyBhcyB3ZWxsKHZl
bmRvciBCU1AgYXV0byBkZXRlY3RzIFBIWSB2YXJpYW50cyk6Cj4gPiBodHRwczovL3d3dy56ZXVz
YnRjLmNvbS9BU0lDLU1pbmVyLVJlcGFpci9QYXJ0cy1Ub29scy1EZXRhaWxzLmFzcD9JRD0xMTM5
Cj4KPiBNYWlubGluZSBnZW5lcmFsbHkgZG9lcyBub3QgY2FyZSB3aGF0IHZlbmRvcnMgZG8sIGJl
Y2F1c2UgdGhleSBvZnRlbgo+IGRvIGhvcnJpYmxlIHRoaW5ncy4gV2hpY2ggaXMgTy5LLCBpdCBp
cyBvcGVuIHNvdXJjZSwgdGhleSBjYW4gZG8gd2hhdAo+IHRoZXkgd2FudCBpbiB0aGVpciBmb3Jr
IG9mIHRoZSBrZXJuZWwuCgpUaGF0J3Mgbm90IHJlYWxseSB0cnVlIElNTywgbWFpbmxpbmUgaW1w
bGVtZW50cyBhbGwgc29ydHMgb2Ygd29ya2Fyb3VuZHMKZm9yIHZhcmlvdXMgdmVuZG9yIGhhcmR3
YXJlIHF1aWNrcy93ZWlyZG5lc3MuCgo+IEJ1dCBmb3IgTWFpbmxpbmUsIHdlIGV4cGVjdCBhIGhp
Z2ggbGV2ZWwgb2YgcXVhbGl0eSwgYW5kIGEgdW5pZm9ybSB3YXkKPiBvZiBkb2luZyB0aGluZ3Mu
CgpTdXJlLCBhbmQgSSdtIHRyeWluZyB0byBkbyB0aGF0IGhlcmUgcmF0aGVyIHRoYW4gZG8gc29t
ZSBzdXBlciBoYWNreQp1bm1haW50YWluYWJsZSBib290bG9hZGVyIGJhc2VkIGRldmljZSB0cmVl
IHNlbGVjdG9yLgoKPiBUaGlzIGNhbiBhbHNvIGFjdCBhcyBwdXNoIGJhY2sgb24gU29DIHZlbmRv
cnMsIGZvciBkb2luZyBzaWxseSB0aGluZ3MKPiBsaWtlIGNoYW5naW5nIHRoZSBQSFkgd2l0aGlu
IGEgU29DIHdpdGhvdXQgY2hhbmdpbmcgaXRzIG5hbWUvbnVtYmVyLgoKSXQgd29uJ3QgaGVyZSwg
YmVjYXVzZSBBbGx3aW5uZXIgZG9lc24ndCBjYXJlIGFib3V0IG5vbi1CU1Aga2VybmVscy4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
