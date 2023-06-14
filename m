Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E24D1730813
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 21:22:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99D04C6A61A;
	Wed, 14 Jun 2023 19:22:37 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E34D7C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 19:22:35 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-bcd0226607bso30291276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 12:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686770555; x=1689362555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kTgKJ0Xv9os7bie+kMAyra/nI6Vl0QY0hlCtc8nBPq8=;
 b=K7vEPf6d0ix+0wowHhaHisBWY3Jqwdp9PP6WOxGUmgDk1EudFVEHJsWl7Ba28deDKh
 CFhzzTs8bd2qMiaMIzTuS4fNDW0xoCuhitbO/HUhnE2rZUfbx8ZpiRB4R3qPt9I3mK76
 RKVM1ivyZ2whSAHOEnPVEUoLzCj3kOefZcS/tURikdMccszC37XXrbL/slm6ggW4sU7j
 i8mOT0NoGT7mu0YAdy24wyCamPzhYXqZjfQuyYVe3XArSvqoM3OGql2s2b0bU89tzOUq
 tsD20WSVQ613+J6F8VsXPI3wmf08qUdiN2GqGsoKzYU0zSnN6uS2Ws/2f+dw8qJCcBmE
 O9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686770555; x=1689362555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kTgKJ0Xv9os7bie+kMAyra/nI6Vl0QY0hlCtc8nBPq8=;
 b=cjI0t9jV7EHx5y5ZrU9LhGarxubK5S74KmVBkoDGGxF5Pc3AHiL0lw+hXvk5GYrWPp
 yEE2HU2txEYuE6Bx6zhG20FZbcAUfJxjoYCS5xQurlh6R+ke3EvJrW4+oSZ9KEd8sTXv
 +O0PYxj6MaZ89rck7ztHjrgaxyEOPvrf84Gi0S8lYnYUIXyCV1aeDGmIAfuzFlVM4RKG
 fm0fEXL3mZf4HVPsAID7zk9ixSxIC1Aq48dNJFI5EpwdmCzVDg7gg9tylkNwl8M8X3p0
 IJ2B88mFDcqKDnPwVc0kSh/ClhMPMh2kQhKKhzkawYjtz8U+FqPjg99A0KyHUAb/YCRD
 ALkw==
X-Gm-Message-State: AC+VfDxD9P4Gbon5j/EtpIq1UmlLD+m7dq3jdjM13iMC3MWVFGTBLGhh
 ij/Db6jD3xf/mSCqsYHa4CoSIHOv1FKV/fCytFkxFw==
X-Google-Smtp-Source: ACHHUZ6tXpnORUqaDomrOU8lA/2e9S3QjHVo/NzRv+Gx8ZqDefS1gZN1tL/jTFpsxhGG3vM6fTc4HCZz9zhsbaA8pIM=
X-Received: by 2002:a25:2d10:0:b0:bab:8be5:697d with SMTP id
 t16-20020a252d10000000b00bab8be5697dmr2830570ybt.32.1686770554779; Wed, 14
 Jun 2023 12:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v3-0-cd3d5925ae64@linaro.org>
 <20230405-pl180-busydetect-fix-v3-10-cd3d5925ae64@linaro.org>
 <CAPDyKFqxvNxFqLdpj15Gz+zDNT04YzxEAh-svKvRuaM52dCV3g@mail.gmail.com>
 <CACRpkdbg5UXnU=WcQa2HoGH54UK-C8+vU8t+7iLChvd__iJiMg@mail.gmail.com>
 <CAPDyKFoMNPHs3td-UBnqDdEK4i7aHybWfsba796BEXPQC-bzUQ@mail.gmail.com>
 <CACRpkdbYNn0S7AXn_sbPb+o8L_DcffKat=tR0mLtNiBhgy7UEg@mail.gmail.com>
 <CAPDyKFqZsQ+wHdh1FYZwBxiar=9SeobiucaTVhPyQzHgAq-CWQ@mail.gmail.com>
In-Reply-To: <CAPDyKFqZsQ+wHdh1FYZwBxiar=9SeobiucaTVhPyQzHgAq-CWQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 Jun 2023 21:22:23 +0200
Message-ID: <CACRpkdYKif6LhLWEoid3vhuDmuSdR6eW9B=ZdGLtNnAzUb9W2w@mail.gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 10/10] mmc: mmci: Add busydetect timeout
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

T24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgMjoyMuKAr1BNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnPiB3cm90ZToKPiBPbiBXZWQsIDE0IEp1biAyMDIzIGF0IDEzOjE3LCBMaW51
cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFdl
ZCwgSnVuIDE0LCAyMDIzIGF0IDEyOjA14oCvUE0gVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxp
bmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+ID4gSG93ZXZlciwgd2UgdXNlIHRoZSBzcGluX2xvY2sg
dG8gcHJvdGVjdCBzb21lIG1lbWJlcnMgaW4gdGhlIHN0cnVjdAo+ID4gPiBtbWNpX2hvc3QuIElu
IHRoaXMgY2FzZSwgdGhlIG1tY2lfY21kX2lycSgpIGlzIHVzaW5nICJob3N0LT5jbWQiIHRvCj4g
PiA+IHVuZGVyc3RhbmQgd2hldGhlciB0aGVyZSBpcyBhbiBhY3RpdmUgY29tbWFuZCB0byBtYW5h
Z2UuIFdoZW4gdGhlCj4gPiA+IGNvbW1hbmQgaGFzIGJlZW4gY29tcGxldGVkLCB3ZSBzZXQgaG9z
dC0+Y21kIHRvIE5VTEwuCj4gPgo+ID4gSG0gcmlnaHQuLi4KPiA+Cj4gPiBJJ20gbGVhbmluZyB0
b3dhcmQgc29tZSBjYXRjaC1hbGwgbGlrZToKPiA+Cj4gPiBpZiAoIWhvc3QtPmNtZCkKPiA+ICAg
c3RhdGUgPSBNTUNJX0JVU1lfRE9ORTsKPiA+Cj4gPiBhcyBpZiB0aGVyZSBpcyBubyBjb21tYW5k
IGdvaW5nIG9uIHRoZW4gc3VyZWx5IG5vdGhpbmcgaXMgYnVzeSBvbiB0aGUKPiA+IGhvc3QgY29u
dHJvbGxlci4KPgo+IFJpZ2h0LCBzbyBhdCB3aGF0IHBvaW50IGRvIHlvdSB3YW50IHRvIGFkZCB0
aGlzIGNoZWNrPwoKSSBoYXZlIHB1dCBpdCBiZWZvcmUgdGhlIGNhbGxzIHRvIHRoZSBidXN5X2Nv
bXBsZXRlKCkgY2FsbGJhY2ssIGluIHRoZQpJUlEsIHdoZXJlIHdlIGFyZSBhbHJlYWR5IGluIGF0
b21pYyBjb250ZXh0LiBJZiB3ZSBhcmUgbm90IHByb2Nlc3NpbmcKYSBjb21tYW5kLCB3ZSBzaG91
bGQgbm90IGRvIGFueSBidXN5IGRldGVjdGlvbiBmb3Igc3VyZS4KCllvdXJzLApMaW51cyBXYWxs
ZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
