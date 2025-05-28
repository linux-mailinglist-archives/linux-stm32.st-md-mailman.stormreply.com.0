Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4039BAC71A5
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 21:45:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E48D7C36B3D;
	Wed, 28 May 2025 19:45:54 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86EEBC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 19:45:53 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-4e58ef9cb69so57572137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 12:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748461552; x=1749066352;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2WYsfpi4i8f0LBMEO0DT617i14NhS7BPxw7WwiazOec=;
 b=a424iJ9Z33xcfZfuQlP4DDGNHkTKNBnK8jxHwZZh4/0gWEb6TXbwLQaRa06bvtYmF1
 cKllEZ1XIJpTSVzrRmmQONCxkxobN6QrPHByepRV7oa8PZXXEMOlSOWJ2/DUolQwa35R
 vygNdzaOjRxw5dOCHxO/Ilw+AT67BVA2Gjii/QpxT0TmPdt2zihqyjPw1iGtGgZ0dWIE
 YHtYx4tpc+uFVzG+rFhWURIFTVDQDOyDM/iShRufFRfnV53l9KSbeRl3wr3bMVaSn2eb
 HI1hslDVZKF2hRzdOUfaYJ3J+rKkP34HNojBig1j3Zf29I1haYjiXiPpP07XcklmHFXE
 yGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748461552; x=1749066352;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2WYsfpi4i8f0LBMEO0DT617i14NhS7BPxw7WwiazOec=;
 b=dLaQCfQ4EnE0Oe0ShvUAVSUHwLHLIQbPTSqrNY0GSyd47Axp/zQmNmCJYx2MhP8dTW
 xy3UYSFrExTr3zbio8svcotxHyAiL9lEP5zCD50RJOAPAfMn/WqTl5LFvlyrhyiTyM+U
 L/4Ql9+7PYS40zUSQ8BRs2c0pM3PpO9jHq8Y9FzBtEAZzbqfeoy7YWzsibXfPNPYPzwf
 CTT62INW8ICujVxqalZfwpH7+aDtbqy8q01RUJ0GwWTsIyYg+WL3c9+ewiujNviZUdIw
 GJauK9pgOm0CchnIcNwrc1FnUcQh7nDkQFynpbov5N0bk0F+ArwF21T5eiROaw5YTey5
 wMXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmiPC8fRhr+BKP6KeFzy7UCNkcUrKNX+etAW+D6aRc77CZVjTyhrBjF4XAW5UICwVZ1jpztuqPZaJVyg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz5LBFs7aC7xEoZigo+zF9MFw8mCzHLlM4nBMMyH5pRABOzYfPO
 6dH/WoDJXc5/YapeKRAZFedvnum8fwWHWy0/belpTZHCGfV0qS7v5GZE+TFyjIL/cTKTgJWoU/J
 MBbJP2bAxyWpmTwuRaAIeBqrjxZRZDsk=
X-Gm-Gg: ASbGncsmByIO2XNWRhRNEq1ktTF1nurlyq01tFKjFM3jLVVLXLn7C0ZPgKZmv0NaFhv
 EhaozVy/MFiA5lMPdesEi0JIhUVgFK/pANiL+G70oFnRrffUnxTvC875YKs+RMnKC4hH/TmUnrc
 M61EEWQxhEbu38rvsCQsro7F5zDGgVPOVhSA==
X-Google-Smtp-Source: AGHT+IEMvKPgfShf/MwU8EBntmzL2gLB5r9MeIt5Zff5sN3Hg4sMdylM4vuXLPE4sTB9F/25CeOcTFcD0aTeNKmZrbs=
X-Received: by 2002:a05:6102:441b:b0:4e5:9fbe:79f1 with SMTP id
 ada2fe7eead31-4e59fbe7f3amr3865881137.24.1748461552237; Wed, 28 May 2025
 12:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch>
 <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk>
 <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch>
 <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
 <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
 <aDdXRPD2NpiZMsfZ@shell.armlinux.org.uk>
 <CADvTj4pKsAYsm6pm0sgZgQ+AxriXH5_DLmF30g8rFd0FewGG6w@mail.gmail.com>
 <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch>
In-Reply-To: <8306dac8-3a0e-4e79-938a-10e9ee38e325@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 13:45:40 -0600
X-Gm-Features: AX0GCFvXBPujHS6_IsJk8UZ1tZBvuuAf4ZznRV1htx1eM1HjStthmVFSfduasE8
Message-ID: <CADvTj4rWvEaFyOm2HdNonASE4y1qoPoNgP_9n_ZbLCqAo1gGYw@mail.gmail.com>
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

T24gV2VkLCBNYXkgMjgsIDIwMjUgYXQgMToyN+KAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiA+IEkgdGhpbmsgYSBsb3Qgb2YgZXRoZXJuZXQgZHJpdmVycyB1c2Ug
cGh5X2ZpbmRfZmlyc3QoKSBmb3IgcGh5IHNjYW5uaW5nCj4gPiBhcyB3ZWxsIHNvIGl0J3Mgbm90
IGxpbWl0ZWQgdG8ganVzdCBzdG1tYWMgQUZBSVUuCj4KPiBZb3UgbmVlZCB0byBkaWZmZXJlbnRp
YXRlIGJ5IHRpbWUuIEl0IGhhcyBiZWNvbWUgYSBsb3QgbGVzcyB1c2VkIGluCj4gdGhlIGxhc3Qg
ZGVjYWRlLiBEVCBkZXNjcmliZXMgdGhlIFBIWSwgc28gdGhlcmUgaXMgbm8gbmVlZCB0byBodW50
Cj4gYXJvdW5kIGZvciBpdC4gVGhlIG9ubHkgcmVhbCB1c2UgY2FzZSBub3cgYSBkYXlzIGlzIFVT
QiBkb25nbGVzLCB3aGljaAo+IGRvbid0IGhhdmUgRFQsIGFuZCBtYXliZSBQQ0llIGRldmljZXMg
d2l0aG91dCBBQ1BJIHN1cHBvcnQuCgpJIG1lYW4sIGhhcmR3YXJlIHByb2JpbmcgZmVhdHVyZXMg
Zm9yIHRoaXMgc29ydCBvZiB1c2UgY2FzZSBoYXZlIGJlZW4KZ2V0dGluZyBhZGRlZCBvdXRzaWRl
IHRoZSBuZXR3b3JrIHN1YnN5c3RlbSBzbyBJJ20gbm90IHN1cmUgd2hhdCB0aGUKaXNzdWUgd2l0
aCB0aGlzIGlzIGFzIHRob3NlIHVzZSBjYXNlcyBkb24ndCBhcHBlYXIgdG8gYmUgbWVhbmluZ2Z1
bGx5CmRpZmZlcmVudC4KCj4gSSBzdWdnZXN0IHlvdSBnaXZlIHVwIHB1c2hpbmcgdGhpcy4gWW91
IGhhdmUgdHdvIE1haW50YWluZXJzIHNheWluZyBubwo+IHRvIHRoaXMsIHNvIGl0IGlzIHZlcnkg
dW5saWtlbHkgeW91IGFyZSBnb2luZyB0byBzdWNjZWVkLgoKU28gd2hhdCBzaG91bGQgSSBiZSBk
b2luZyBpbnN0ZWFkPyBJdCdzIG5vdCBjbGVhciB0byBtZSB3aGF0IHRoZSBpc3N1ZQp3aXRoIHRo
aXMgYXBwcm9hY2ggaXMgYXMgaXQgYXBwZWFycyB0byBiZSBhIHJhdGhlciBub24taW52YXNpdmUg
Y2hhbmdlLgoKPiBJIHBlcnNvbmFsbHkgZG9uJ3QgbGlrZSBkZXBlbmRpbmcgb24gdGhlIGJvb3Rs
b2FkZXIuIEkgb2Z0ZW4gcmVwbGFjZQo+IHRoZSBib290bG9hZGVyLCBiZWNhdXNlIGl0IGlzIGEg
Y3JpcHBsZWQgdmVyc2lvbiB0aGF0IGRvZXMgbm90IGxldCBtZQo+IFRGVFAgYm9vdCwgZG9lcyBu
b3QgaGF2ZSBmbGFzaCBlbmFibGVkIGZvciBzYXZpbmcgY29uZmlndXJhdGlvbiwgYW5kIGkKPiB3
YW50IHRvIHVzZSBiYXJlYm94IGV0Yy4gSSB0aGluayBpdCBpcyBtdWNoIGJldHRlciB3aGVuIExp
bnV4IGRyaXZlcwo+IHRoZSBoYXJkd2FyZSwgbm90IHRoZSBib290bG9hZGVyLgoKQXMgeW91IHNh
aWQgZWFybGllciB3ZSBkb24ndCB3YW50IHRvIHJlbHkgb24gdGhlIGJvb3Rsb2FkZXIod2hpY2gg
SSBhZ3JlZQp3aXRoKSwgc28gaXQncyB1bmNsZWFyIGhvdyB3ZSBzaG91bGQgc3VwcG9ydCBTb0Mn
cyB0aGF0IHJlcXVpcmUgcnVudGltZQphdXRvZGV0ZWN0aW9uIGxpa2UgdGhpcyBpbiB0aGUga2Vy
bmVsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
