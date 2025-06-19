Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB76ADFE92
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jun 2025 09:21:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95A9BC36B36;
	Thu, 19 Jun 2025 07:21:47 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F40E4C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jun 2025 07:21:45 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-553dceb342aso232922e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jun 2025 00:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750317705; x=1750922505;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2REX8f1H3qE3TCrycXPdBwYvBe5kQ22cbStBAf1MQA=;
 b=Q614LlbcgN0HpyP0ZXL4tDOD1woP5WUUxX8cWkOOmeWZnjMtYBMULpbz0SRRHw7TvU
 kDw8HtcloiQxmqEGJb4vDgWt+rVfG+Dya+Ahzo/uoVmNBZj+5FvBQ0S/L+CHbglGCZOS
 OxapJDdOGJxPRG0Kcj8omsvwDPJD/sfDwQi18f9GDBXnFihbEKseGPFNmi6npgzKxdXv
 7ELo+VPoKCOjALxbPbSe/degbhSiFY8B/6fDvRVx2EGFExipMwtjcRMzyH7Unvz6SQQ/
 HfJpOGRvQP6NlTD6SqN6Q0IE94FXPCwKhuEeEd/MNyT4smQKcs+sSpi4BeOEwrWOSFv2
 cscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750317705; x=1750922505;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i2REX8f1H3qE3TCrycXPdBwYvBe5kQ22cbStBAf1MQA=;
 b=tuc1HuYwSZ/Gmz/s8AvyqH822yZD3atzt4Z0KZ/Dgf19wdAMZNJb9vkuQxfEsAwr6F
 DyzBmSbDMJ8YlSrkgSd0P0WdBnwMN7vPIH3ecWKFv/RVu122+hZqACBRPIU+OPzZonUh
 +PFXMNb5a+L56LgR/RC7HyWPOhVDaKazxBg9bkVl27W43omQCiid+4KtNjkf/33NmHEw
 mDcnxTgstjDnSrcDCyVsA+lhMFF+rEQSARkF94PQ/FHvGtKeLeUUCOGNx+qND0dQQrpK
 7nsBsDibLewSlSjc77k1XqlStyCIAymJNGvXFcjBUawyVjoOb+qvQXERVrsSKxjUZBia
 0k3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi/MJYbR4P29yvEpUbijZ/K2pdGSktLdXvXNaJoZ9i7bHWGzUe3lBUmxTLr3kt6QcLGAYmbOrKPyOZUA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyaC/RUDuskMKRRTBrFsZfpQ9PwJcpx0jLLGJpfBmg/OCmMcgzh
 7sEfrPisjsTplLxCDsim1rpP6oxe7LiAKZgr/aaiNIHquDOsrc13oz8s+81IEpM/zcqhsZ00BPC
 TkCBfnJ2W643px6SU+NMXgcsMGhuoTJ8tKVYneHVgSg==
X-Gm-Gg: ASbGncv7ts6QMSms/NIiE9rFBOqlOPoZyqH2XmS5UdDL9Riglh/S0+uQCU9tHuZoRTC
 wnre8eUVd7yHvioDS/N9uV45D4wCrOpDuoXbFB15lCUgI8DXqXWdM+zBL2jl3c0ryXsa/gPtqpq
 1GYwh7CZlhFP7k3OdwtwkxYdnd8pOnbCQCNzo6lXfCBrCwXQfGAn1k/CyZR/oBa+b9VqHMeLThh
 5E=
X-Google-Smtp-Source: AGHT+IEh54Pu16jXn4P+irLbn846Wet4MTiIBtxZ5XCuFceE2ajC9TqO8oRVjTcWCkeViL2vbItUiC+8YwBhD/ZWW4o=
X-Received: by 2002:a05:6512:15a4:b0:553:50c6:b86c with SMTP id
 2adb3069b0e04-553b6f6b5ebmr5729673e87.57.1750317704976; Thu, 19 Jun 2025
 00:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
 <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
 <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
 <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com>
 <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com>
In-Reply-To: <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 09:21:34 +0200
X-Gm-Features: AX0GCFvQx5dYUJVAAbuivosq23yF4paNEi7sLTcojRfNtcaypuIpqfvXVp5M46I
Message-ID: <CAMRc=Meq9+hnmvjXnq-YUJRPOOBvAV+pjHQ25k1wgFqV30Vo=A@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 0/9] Introduce HDP support for STM32MP
	platforms
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

T24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgMzo0NeKAr1BNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAxOCwgMjAyNSBhdCAyOjMy
4oCvUE0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4gd3JvdGU6Cj4KPiA+IEkg
aGF2ZSBhIHJld29yayBvZiBncGlvLW1taW8gaW4gcHJvZ3Jlc3MgdGhhdCByZW1vdmVzIHRoZSBi
Z3Bpbwo+ID4gc3BlY2lmaWMgZmllbGRzIGZyb20gc3RydWN0IGdwaW9fY2hpcC4gVGhpcyBpbmNs
dWRlcyBtb3ZpbmcgdGhlIGZsYWdzCj4gPiBpbnRvIGEgc2VwYXJhdGUgZ3Bpby9nZW5lcmljLmgg
aGVhZGVyLiBJIHJlYWxseSBuZWVkIHRvIGVpdGhlciBhcHBseQo+ID4gaXQgbXlzZWxmIG9yIGdl
dCBhbiBpbW11dGFibGUgdGFnIGZyb20geW91IHdpdGggdGhpcyBjaGFuZ2UuCj4KPiBPSyB0cnkg
dGhpcywgaWYgeW91IHB1bGwgaW4gdGhpcyB0byB5b3VyIHRyZWUgYW5kIHdvcmsgd2l0aCByZWZh
Y3RvcmluZ3MKPiBvbiB0b3AsIGV2ZXJ5dGhpbmcgc2hvdWxkIHdvcmsgb3V0IGZpbmUgaW4gdGhl
IGVuZDoKPgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMTkyNzJiMzdhYTRm
ODNjYTUyYmRmOWMxNmQ1ZDgxYmRkMTM1NDQ5NDoKPgo+ICAgTGludXggNi4xNi1yYzEgKDIwMjUt
MDYtMDggMTM6NDQ6NDMgLTA3MDApCj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3Np
dG9yeSBhdDoKPgo+ICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2xpbnVzdy9saW51eC1waW5jdHJsLmdpdAo+IHRhZ3MvaWItZ3Bpby1tbWlvLW5vLWlucHV0
LXRhZwo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDRmYjhjNWQzNmExY2ZkOTdj
ZDcxNWViNDI1NjcwOGJjMDk3MjRmM2Q6Cj4KPiAgIGdwaW86IG1taW86IGFkZCBCR1BJT0ZfTk9f
SU5QVVQgZmxhZyBmb3IgR1BPIGdwaW9jaGlwICgyMDI1LTA2LTE4Cj4gMTU6NDA6MjkgKzAyMDAp
Cj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gU2ltcGxlIGNoYW5nZSBmb3Igbm8taW5wdXQgTU1JTyBHUElPCj4KPiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4gQ2zDqW1lbnQgTGUgR29mZmljICgxKToKPiAgICAgICBncGlvOiBtbWlvOiBhZGQg
QkdQSU9GX05PX0lOUFVUIGZsYWcgZm9yIEdQTyBncGlvY2hpcAo+Cj4gIGRyaXZlcnMvZ3Bpby9n
cGlvLW1taW8uYyAgICB8IDExICsrKysrKysrKystCj4gIGluY2x1ZGUvbGludXgvZ3Bpby9kcml2
ZXIuaCB8ICAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4KPgo+IFlvdXJzLAo+IExpbnVzIFdhbGxlaWoKCkhpIExpbnVzLAoKU29ycnkgSSBk
aWRuJ3Qgbm90aWNlIHRoaXMgb25lLiBCdXQgSSBzZWUgeW91IGFscmVhZHkgcmVzcG9uZGVkIHRo
YXQKeW91IHB1bGxlZCBteSBQUiBmcm9tIHRvZGF5LiBTaG91bGQgSSBpZ25vcmUgaXQ/CgpCYXJ0
b3N6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
