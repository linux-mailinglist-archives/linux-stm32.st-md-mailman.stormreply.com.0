Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0771ADEC4B
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jun 2025 14:32:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B472C36B30;
	Wed, 18 Jun 2025 12:32:14 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA730C36B2F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 12:32:12 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-553bcf41440so4253754e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jun 2025 05:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750249932; x=1750854732;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1MHrtaWQYxYQbOY1jXBZbhCbwYlDmgnWya6qmbQvgdY=;
 b=V9By53V9QXZpnYZilM1Ad5/lgftD/s807zGTucaK5I5D8cHmq3eYXqz7ch8In2J5Xd
 Jtp6NSU04RarqszHQkX+jhZln/27gmfhyUy4WGisIpWYf2eK/y+pHPS4m5Zqso411sWN
 9OvgEIN9fqkSWX+n677hHDhtJKC55JOWZwzK1Ui2YHGWXu5BrzjO+BBOAv6L1n1IU7d9
 gq1spZXSLKHHBtfWziYxZ+pk09UhiOgVqC1GomBLnFMk2XR3JC1Bduro9VHAGdZ0mstp
 ruVdOk3mWDlelw1ZwE3kjh3m1ykTEdmboabMYzvAP7C9yQjheeL1AOkBxVV7yFV8D1Al
 UpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750249932; x=1750854732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1MHrtaWQYxYQbOY1jXBZbhCbwYlDmgnWya6qmbQvgdY=;
 b=W9c17TAYWL76SSntBswJR60ruC2JowZe2Y1RjBx5i8bKBy+vQefWRsclVO/H5Fse6b
 4oRLSWSimPCf15Fk+ut9zX7z/t82QKxtOQVzhL8D3C7HtlShc1uc++xRlx4fpG/hnNLk
 GU+tD0sr33LluCVU7EGzW+gDl6bjyay0I3OIr7JQZK6NBxiKxsDwtsuVe21uRqh2syPr
 wlOHTeilBJlITRzlcoIqEiwZgbe8YZ7nvNMWqReU1hF+oInGlnJFk3g1SnGuu616mx/9
 FbYA+gqGRJ200olAzetl2JfqAfV3kgqLDDX18xNLNGiNu3u3nySHZ8e/NfHon9MyjXWz
 HuNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnUFRV988PBmZZaB0I83caCcuWkBdex06yju09oTEbuceSHuyYwGPSZV5L26WoHUOkaLMNVyiP18cREg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw8F8Idf3AwQ4AUiOwjodbPBzT0kx1NQxdPA6p8pWMV57LUJ2HT
 sszIG2LEFV+SRQWkPxClNU0HkFPv9ucVQma2+hraABREeX12WMzufkUe4//M7ePBdTjpeWUAuek
 fOKMOJ2uBO7RBD5f4v3Xsjtii5Ebi41ecYl7o3slVtA==
X-Gm-Gg: ASbGnctejQ4Afopa6fQdi9UTA0Wi8v1AJpot5MvktJ3+oPm90v/KjHyxrX89CietK6v
 Hq5zo3CyMGHW5pmRQOl5EYcdXSj46OXvCnsA7CGFQiuaiZSvnA2KLtcJQ7v085DSTe9GlSznra7
 3ECE0HgF7eXP6/pwnPRAKxDFDIfv9QH7fOqYnZIDgStic1qEAqRkB7XnO53hupEz/U4frYEcLpU
 g==
X-Google-Smtp-Source: AGHT+IFAMnM7CSQpA77g/OMbt8IoqXvkUX7g9VLTQkGZp3kx9iir6pjz35t/vnj3pTtA5gMi1QAzjji43YJ6cOMM12U=
X-Received: by 2002:ac2:58f1:0:b0:553:ceed:c859 with SMTP id
 2adb3069b0e04-553ceedca11mr1249211e87.21.1750249931831; Wed, 18 Jun 2025
 05:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
 <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
 <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
In-Reply-To: <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 14:32:00 +0200
X-Gm-Features: AX0GCFsVjqlM3hFZShUrbzkpCsjw98BAff7JIDMVgVQXijZgm6doHKA1YxG22Rc
Message-ID: <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com>
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

T24gV2VkLCBKdW4gMTgsIDIwMjUgYXQgMjoyMeKAr1BNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1biAxNiwgMjAyNSBhdCAxMDow
NeKAr0FNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+IHdyb3RlOgo+ID4gT24g
RnJpLCBKdW4gMTMsIDIwMjUgYXQgMTI6MTbigK9QTSBDbMOpbWVudCBMZSBHb2ZmaWMKPiA+IDxj
bGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhpcyBwYXRj
aCBzZXJpZXMgaW50cm9kdWNlcyB0aGUgSGFyZHdhcmUgRGVidWcgUG9ydCAoSERQKSBzdXBwb3J0
IGZvcgo+ID4gPiBTVE0zMk1QIHBsYXRmb3Jtcy4KPiA+ID4KPiA+ID4gSXQgaW5jbHVkZXMgdXBk
YXRlcyB0byB0aGUgbW1pbyBncGlvIGRyaXZlciwgdGhlIGFkZGl0aW9uIG9mIGRldmljZSB0cmVl
Cj4gPiA+IGJpbmRpbmdzLCB0aGUgSERQIGRyaXZlciwgYW5kIHVwZGF0ZXMgdG8gdGhlIGRldmlj
ZSB0cmVlIGZpbGVzIGZvcgo+ID4gPiBTVE0zMk1QMTMsIFNUTTMyTVAxNSwKPiA+ID4gYW5kIFNU
TTMyTVAyNSBTb0NzLgo+ID4gPiBUaGUgc2VyaWVzIGFsc28gdXBkYXRlcyB0aGUgTUFJTlRBSU5F
UlMgZmlsZSB0byBpbmNsdWRlIG15c2VsZiBhcyB0aGUKPiA+ID4gbWFpbnRhaW5lciBmb3IgdGhl
IFNUTTMyIEhEUCBkcml2ZXIgYW5kIGFkZHMgdGhlIG5lY2Vzc2FyeQo+ID4gPiBwaW5tdXggY29u
ZmlndXJhdGlvbnMgZm9yIEhEUCBwaW5zIG9uIFNUTTMyTVAxNTdDLURLMiBhcyBleGFtcGxlLgo+
ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGNsZW1lbnQubGVn
b2ZmaWNAZm9zcy5zdC5jb20+Cj4gPiA+IC0tLQo+ID4KPiA+IFtzbmlwXQo+ID4KPiA+ID4gLS0t
Cj4gPiA+IENsw6ltZW50IExlIEdvZmZpYyAoOSk6Cj4gPiA+ICAgICAgIGdwaW86IG1taW86IGFk
ZCBCR1BJT0ZfTk9fSU5QVVQgZmxhZyBmb3IgR1BPIGdwaW9jaGlwCj4gPiA+ICAgICAgIGR0LWJp
bmRpbmdzOiBwaW5jdHJsOiBzdG0zMjogSW50cm9kdWNlIEhEUAo+ID4gPiAgICAgICBwaW5jdHJs
OiBzdG0zMjogSW50cm9kdWNlIEhEUCBkcml2ZXIKPiA+ID4gICAgICAgTUFJTlRBSU5FUlM6IGFk
ZCBDbMOpbWVudCBMZSBHb2ZmaWMgYXMgU1RNMzIgSERQIG1haW50YWluZXIKPiA+ID4gICAgICAg
QVJNOiBkdHM6IHN0bTMyOiBhZGQgSGFyZHdhcmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1w
MTMKPiA+ID4gICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgSGFyZHdhcmUgZGVidWcgcG9ydCAo
SERQKSBvbiBzdG0zMm1wMTUKPiA+ID4gICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgSGFyZHdh
cmUgZGVidWcgcG9ydCAoSERQKSBvbiBzdG0zMm1wMjUKPiA+ID4gICAgICAgQVJNOiBkdHM6IHN0
bTMyOiBhZGQgYWx0ZXJuYXRlIHBpbm11eCBmb3IgSERQIHBpbiBhbmQgYWRkIEhEUCBwaW5jdHJs
IG5vZGUKPiA+ID4gICAgICAgQVJNOiBkdHM6IHN0bTMyOiBhZGQgSGFyZHdhcmUgZGVidWcgcG9y
dCAoSERQKSBvbiBzdG0zMm1wMTU3Yy1kazIgYm9hcmQKPiA+ID4KPiA+Cj4gPiBQYXRjaGVzIDEt
NCBhbmQgNS05IGNhbiBnbyB1cHN0cmVhbSBpbmRlcGVuZGVudGx5LiBJIHN1Z2dlc3QgdGFraW5n
Cj4gPiBwYXRjaCAxLzkgdGhyb3VnaCB0aGUgR1BJTyB0cmVlIGFuZCBwcm92aWRpbmcgYW4gaW1t
dXRhYmxlIHRhZyB0bwo+ID4gTGludXMgdG8gdGFrZSBwYXRjaGVzIDItNCB0aHJvdWdoIHRoZSBw
aW5jdHJsIHRyZWUuIExpbnVzOiBhcmUgeW91IE9LCj4gPiB3aXRoIHRoYXQ/Cj4KPiBZZXMgZ28g
YWhlYWQgaWYgeW91IHdhbnQsIGFuIGltbXV0YWJsZSBicmFuY2ggYmFzZWQgb24gdjYuMTYtcmMx
Cj4gaXMgdGhlIGJlc3QgZm9yIG1lLCB0aGVuIEkgcHVsbCB0aGF0IGluLgo+Cj4gSSBjb3VsZCBh
bHNvIGp1c3QgYXBwbHkgaXQgYW5kIGhvcGUgZm9yIHRoZSBiZXN0Li4uIGl0IHVzdWFsbHkgd29y
a3MuCj4KCkkgaGF2ZSBhIHJld29yayBvZiBncGlvLW1taW8gaW4gcHJvZ3Jlc3MgdGhhdCByZW1v
dmVzIHRoZSBiZ3BpbwpzcGVjaWZpYyBmaWVsZHMgZnJvbSBzdHJ1Y3QgZ3Bpb19jaGlwLiBUaGlz
IGluY2x1ZGVzIG1vdmluZyB0aGUgZmxhZ3MKaW50byBhIHNlcGFyYXRlIGdwaW8vZ2VuZXJpYy5o
IGhlYWRlci4gSSByZWFsbHkgbmVlZCB0byBlaXRoZXIgYXBwbHkKaXQgbXlzZWxmIG9yIGdldCBh
biBpbW11dGFibGUgdGFnIGZyb20geW91IHdpdGggdGhpcyBjaGFuZ2UuCgpCYXJ0b3N6Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
