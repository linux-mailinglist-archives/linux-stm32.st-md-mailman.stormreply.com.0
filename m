Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4496E4D89
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 17:47:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A481AC6A5FA;
	Mon, 17 Apr 2023 15:47:49 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CF08C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 15:47:47 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-54c0c86a436so541876437b3.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 08:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681746466; x=1684338466;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DQlIri97TmZMXUVRTtsm2+SywZpxFoXWBikPobx0N+0=;
 b=ihY84tfAWitQmk4iYcuvCGxmy/54iD05VS9oIH9KrWeafpu605HY0OU8cnANkZ8Erk
 jpHU15o1JV1lWjKoxybXKVzmmRF3uhkGFnb/PaOGtFOl3GozpOGU/NHblqAGvEpalRwe
 reIoNNwh5OhKe85xkfaykWJe35uFaN5/q7hx9lgrqbPQMStHBLrRlSIgNQKr+m+4gEWW
 BKKcyX8tlXaHzxMKBngP6IreSK8Jb1lrdXWjpzveI/2eaZeRJMkcL0IgZb3psb3bj+rW
 Ebq47k8EL7Gg3ZnZXhWTXjeBeY+m300Uc5P4o8bUu0kFCLL/TFJjZDivN67jcVtwGFd2
 iWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681746466; x=1684338466;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DQlIri97TmZMXUVRTtsm2+SywZpxFoXWBikPobx0N+0=;
 b=AG5Xc6KO4LN0gOGrgfaSLnKAj7QFWMOOqWK4mTFHx0MIktRyQJDYUqaQvY6XL9LOqv
 LptLhHppNWfaMECRjO3OLE3wuOgOP+3frRLrnyUNeZorc4h+Mr3iBFgiSeA8eFhiN2xc
 EWFk6by6rIZQBFoRZawRod+0o06Equ/NKQ0LXC8PJysU8nYwWur5HiN+kuCl4R1zEp+c
 ZZi4yDB7a5m6Qx1cVahU2EMqSJq4EOizFW6/orjNC9a3TsoyUQGSpzY9aGTZntY9osCW
 3kgkJ4U0/PGXCGDlL9CikVsK0mVxeIsQbePjZqO1ALhvaSwCDkbkUSV0yIpQ/W93LCuo
 8kmA==
X-Gm-Message-State: AAQBX9ckk6PA8tOOXewjv6TBwwYv2zxt/peZq9OQ4xfFsVTkJbIahDZt
 f8fy0fZym1AQxvTMPaC/JMxfDVnAoIAtwNYNS+jIlw==
X-Google-Smtp-Source: AKy350aTVotgdcfBmt/5SDUUs9b0di/T+TJuBST3fq8A+cUEB2XtX6flIyURAsDgZUz1CEda+DIkA6EYmuXh49Es3mk=
X-Received: by 2002:a81:af0c:0:b0:54f:bb71:c7b3 with SMTP id
 n12-20020a81af0c000000b0054fbb71c7b3mr9543515ywh.9.1681746466321; Mon, 17 Apr
 2023 08:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
 <20230405-pl180-busydetect-fix-v2-10-eeb10323b546@linaro.org>
 <CAPDyKFptLGySEz3ygoacQ00rk69DKP=1wrt1Hq-weSMASwkF7w@mail.gmail.com>
In-Reply-To: <CAPDyKFptLGySEz3ygoacQ00rk69DKP=1wrt1Hq-weSMASwkF7w@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Apr 2023 17:47:35 +0200
Message-ID: <CACRpkdazpoEfFZhjUNQ5=jc-EndxteVCLDQaTHT02Gob036uTQ@mail.gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 10/12] mmc: mmci: mmci_card_busy() from
	state machine
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

T24gTW9uLCBBcHIgMTcsIDIwMjMgYXQgNDo0OeKAr1BNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnPiB3cm90ZToKPiBPbiBTdW4sIDkgQXByIDIwMjMgYXQgMDA6MDAsIExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSWYgd2Ug
aGF2ZSBhIC5idXN5X2NvbXBsZXRlKCkgY2FsbGJhY2ssIHRoZW4gY2hlY2sgaWYKPiA+IHRoZSBz
dGF0ZSBtYWNoaW5lIHRyaWdnZXJlZCBmcm9tIHRoZSBidXN5IGRldGVjdCBpbnRlcnJ1cHRzCj4g
PiBpcyBidXN5OiB0aGVuIHdlIGFyZSBjZXJ0YWlubHkgYnVzeS4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gPiAtLS0KPiA+
IENoYW5nZUxvZyB2MS0+djI6Cj4gPiAtIERvIHRoaXMgaW4gYSBzYWZlciB3YXkgdGhhdCBmYWxs
cyBiYWNrIHRvIHJlYWRpbmcgYnVzeQo+ID4gICBzdGF0dXMgZnJvbSB0aGUgaGFyZHdhcmUgaWYg
dGhlIHN0YXRlIG1hY2hpbmUgaXMgTk9UCj4gPiAgIGJ1c3kuCj4gPiAtLS0KPiA+ICBkcml2ZXJz
L21tYy9ob3N0L21tY2kuYyB8IDYgKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L21tY2kuYyBiL2Ry
aXZlcnMvbW1jL2hvc3QvbW1jaS5jCj4gPiBpbmRleCA5YTdmNDQxZWM5ZDYuLjE4MGE3YjcxOTM0
NyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbW1jaS5jCj4gPiArKysgYi9kcml2
ZXJzL21tYy9ob3N0L21tY2kuYwo+ID4gQEAgLTMzOSw2ICszMzksMTIgQEAgc3RhdGljIGludCBt
bWNpX2NhcmRfYnVzeShzdHJ1Y3QgbW1jX2hvc3QgKm1tYykKPiA+ICAgICAgICAgdW5zaWduZWQg
bG9uZyBmbGFnczsKPiA+ICAgICAgICAgaW50IGJ1c3kgPSAwOwo+ID4KPiA+ICsgICAgICAgLyog
SWYgd2UgYXJlIHdhaXRpbmcgZm9yIElSUXMgd2UgYXJlIGNlcnRhaW5seSBidXN5ICovCj4gPiAr
ICAgICAgIGlmIChob3N0LT5vcHMtPmJ1c3lfY29tcGxldGUgJiYKPiA+ICsgICAgICAgICAgIGhv
c3QtPmJ1c3lfc3RhdGUgIT0gTU1DSV9CVVNZX0lETEUgJiYKPiA+ICsgICAgICAgICAgIGhvc3Qt
PmJ1c3lfc3RhdGUgIT0gTU1DSV9CVVNZX0RPTkUpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJu
IDE7Cj4KPiBUaGlzIGxvb2tzIGZpc2h5IHRvIG1lLgo+Cj4gSWYgdGhpcyBpcyBuZWVkZWQsIHRo
YXQgbWVhbnMgdGhhdCB0aGUgbW1jIGNvcmUgaXMgY2FsbGluZyB0aGUKPiAtPmNhcmRfYnVzeSgp
IG9wcyBpbiB0aGUgbWlkZGxlIG9mIGEgcmVxdWVzdCB0aGF0IGhhcyBub3QgYmVlbgo+IGNvbXBs
ZXRlZCB5ZXQuIFRoaXMgc2hvdWxkbid0IGhhcHBlbiAtIHVubGVzcyBJIGFtIG1pc3VuZGVyc3Rh
bmRpbmcKPiBzb21lIHBhcnQgb2YgdGhlIGludGVybmFsIG5ldyBzdGF0ZSBtYWNoaW5lLgoKWW91
J3JlIHByb2JhYmx5IHJpZ2h0IGFib3V0IHRoYXQsIEkgaGF2ZSBubyBpZGVhIHdoZW4gdGhlIGNv
cmUgY2FuCmFuZCBjYW5ub3QgY2FsbCAtPmNhcmRfYnVzeSwgSSBqdXN0IGFzc3VtZWQgaXQgY291
bGQgYmUgY2FsbGVkIGF0CmFueSB0aW1lIChldmVuIHdoaWxlIHdhaXRpbmcgZm9yIGJ1c3kgaW50
ZXJydXB0cykuIElmIHlvdSBzYXkgaXQgd29uJ3QKZ2V0IGNhbGxlZCB0aGVuIHRoaXMgcGF0Y2gg
aXNuJ3QgbmVlZGVkLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
