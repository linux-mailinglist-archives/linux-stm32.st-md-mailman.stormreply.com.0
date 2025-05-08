Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DF0AB3082
	for <lists+linux-stm32@lfdr.de>; Mon, 12 May 2025 09:29:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49A92C78F93;
	Mon, 12 May 2025 07:29:30 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8D49C7A821
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 May 2025 08:41:23 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3d96d16b375so3243825ab.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 May 2025 01:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746693682; x=1747298482;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=06V0SS4xl9NrencCcbDKamANFiU6WEUFYCHR8UmLwS0=;
 b=bmq3OzI4nynvSecl9TKrQs+5yutw8H1RSSsKSgWsWL9y0KiRvC9Lp8JoSTt4WxtTMJ
 xhdA1mzOvkKfuim0U4AYlduRIyd6WjORQrymw+jArwwKfm0dZWswbog4nKkToTmWSpzt
 O4cLDmD18xKcKQTrau9OIm5DW5jdbM4BqW8h9FXHbFG9O4naoQqN0Df1fk4nuHs92VD6
 1TJitgtXxqlaYOEUAWU9ts3KoGHB0xD1FuXpVylAR9cHYqys382So5qj3vSxLgkomjmt
 6N+rey5TKgVf1iuABWhqVcHZBJ6L4srnKZBxpQH4ssG++wOn2J5nQlW87H0+AeFGXJs9
 tgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746693682; x=1747298482;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=06V0SS4xl9NrencCcbDKamANFiU6WEUFYCHR8UmLwS0=;
 b=GdUQnfDds/664iuTVint88WCpjv3fYG39wUqta8IaXlWr5CYSgxmKTR0ApfOvG2Hem
 VTMQ5IL91TQxRPYJKSljNsCrpLeolZVwdzL2GtBJVZg9ErdncQcLyv75dI6iNDRqe2ey
 98beMx6N7kG8ytXPt9zx21I+FsTo1wtCaVdOwl4deod92CesnM9FJbMwvq+6REEIBZOd
 BaNAf/V1PbbscLpmBXO47bvDO122wDNDgQfmRB1pSwpkzx0T4IM+Ynvk0SacxHTbQrt4
 QrUyw3bpP/TRm+q7ZlcBUclMpn7DVneJgPkTeQwXA+wCKedpLqrtGOeK+Ax6TJacxg40
 uh3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO6c7v6CHcvSJt6vth0Vgb2RPEh7EW9aXTlgSALUPbko1/0l/esyv+O/D0jDj48uscPXFH9QSDYrjGKg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy/DKiR/36mIVx4GhjAecMWopsO/P3DAd8FeOKMqj6t1wOWQZqG
 7Q7ghTwg2dLRBtrNSROetjJG+78MtklXFCXNznglQkoZVEwxFDSyFwqpTy/nLDnZdUke2/grI5p
 rjBVdZTQM1vxl1TfyFqwu/L9+WnE=
X-Gm-Gg: ASbGncuqsILjWZUN7f3A38Lr9P4GnYtnb+yvEv9YRWGfbc4GBuD+IgOlvATq8+FO21U
 32LpK30rbVREa26cAVAEp76z1AMiISuX8ctTBpbvcDSMtViooOZZbHkjUuPBod5TpZP8T4/+omr
 +R0ReaaoEy0aytKrm6et3o9g==
X-Google-Smtp-Source: AGHT+IEmLMp/D0QNJevDYMLRMp0mBTWELujqPt8xXnR9sEVc1PByWElS1L80M8Da1ScWVQSTQUb1nxbOD2vClVz1m7w=
X-Received: by 2002:a92:cdaf:0:b0:3d8:975:b825 with SMTP id
 e9e14a558f8ab-3da738d5b28mr76314015ab.5.1746693682592; Thu, 08 May 2025
 01:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
 <20250508033328.12507-5-kerneljasonxing@gmail.com>
 <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
In-Reply-To: <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 8 May 2025 16:40:45 +0800
X-Gm-Features: ATxdqUEcxKj-NjeNAJFeUmwL48LxaGkk92YGikxUXT0m3HVba_HcMEWlVXVCuUY
Message-ID: <CAL+tcoCuvxfQUbzjSfk+7vPWLEqQgVK8muqkOQe+N6jQQwXfUw@mail.gmail.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>
X-Mailman-Approved-At: Mon, 12 May 2025 07:29:26 +0000
Cc: willemb@google.com, horms@kernel.org, irusskikh@marvell.com,
 netdev@vger.kernel.org, bharat@chelsio.com,
 linux-stm32@st-md-mailman.stormreply.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, edumazet@google.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 ayush.sawal@chelsio.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, sgoutham@marvell.com, Jason Xing <kernelxing@tencent.com>
Subject: Re: [Linux-stm32] [PATCH net-next v1 4/4] net: lan966x: generate
 software timestamp just before the doorbell
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

SGkgSG9yYXRpdSwKCk9uIFRodSwgTWF5IDgsIDIwMjUgYXQgMzowOOKAr1BNIEhvcmF0aXUgVnVs
dHVyCjxob3JhdGl1LnZ1bHR1ckBtaWNyb2NoaXAuY29tPiB3cm90ZToKPgo+IFRoZSAwNS8wOC8y
MDI1IDExOjMzLCBKYXNvbiBYaW5nIHdyb3RlOgo+ID4KPiA+IEZyb206IEphc29uIFhpbmcgPGtl
cm5lbHhpbmdAdGVuY2VudC5jb20+Cj4gPgo+ID4gTWFrZSBzdXJlIHRoZSBjYWxsIG9mIHNrYl90
eF90aW1lc3RhbXAgYXMgY2xvc2UgdG8gdGhlIGRvb3JiZWxsLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEphc29uIFhpbmcgPGtlcm5lbHhpbmdAdGVuY2VudC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2
ZXJzL25ldC9ldGhlcm5ldC9taWNyb2NoaXAvbGFuOTY2eC9sYW45NjZ4X2ZkbWEuYyB8IDIgKy0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWljcm9jaGlwL2xhbjk2NngvbGFu
OTY2eF9mZG1hLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9taWNyb2NoaXAvbGFuOTY2eC9sYW45
NjZ4X2ZkbWEuYwo+ID4gaW5kZXggNTAyNjcwNzE4MTA0Li5lMDMwZjIzZTUxNDUgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9taWNyb2NoaXAvbGFuOTY2eC9sYW45NjZ4X2Zk
bWEuYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWljcm9jaGlwL2xhbjk2NngvbGFu
OTY2eF9mZG1hLmMKPiA+IEBAIC03MzAsNyArNzMwLDYgQEAgaW50IGxhbjk2NnhfZmRtYV94bWl0
KHN0cnVjdCBza19idWZmICpza2IsIF9fYmUzMiAqaWZoLCBzdHJ1Y3QgbmV0X2RldmljZSAqZGV2
KQo+ID4gICAgICAgICAgICAgICAgIH0KPiA+ICAgICAgICAgfQo+ID4KPiA+IC0gICAgICAgc2ti
X3R4X3RpbWVzdGFtcChza2IpOwo+Cj4gQ2hhbmdpbmcgdGhpcyB3aWxsIGJyZWFrIHRoZSBQSFkg
dGltZXN0YW1waW5nIGJlY2F1c2UgdGhlIGZyYW1lIGdldHMKPiBtb2RpZmllZCBpbiB0aGUgbmV4
dCBsaW5lLCBtZWFuaW5nIHRoYXQgdGhlIGNsYXNzaWZ5IGZ1bmN0aW9uIHdpbGwKPiBhbHdheXMg
cmV0dXJuIFBUUF9DTEFTU19OT05FLgoKU29ycnkgdGhhdCBJJ20gbm90IHRoYXQgZmFtaWxpYXIg
d2l0aCB0aGUgZGV0YWlscy4gSSB3aWxsIHJlbW92ZSBpdApmcm9tIHRoaXMgc2VyaWVzLCBidXQg
c3RpbGwgdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hhdCBjYXNlcyBjb3VsZCBiZS4KCkRvIHlvdSBt
ZWFuIGl0IGNhbiBicmVhayB3aGVuIGJwZiBwcm9nIGlzIGxvYWRlZCBiZWNhdXNlCidza2JfcHVz
aChza2IsIElGSF9MRU5fQllURVMpOycgZXhwYW5kcyB0aGUgc2tiLT5kYXRhIGFyZWE/ICBNYXkg
SSBhc2sKaG93IHRoZSBtb2RpZmllZCBkYXRhIG9mIHNrYiBicmVha3MgdGhlIFBIWSB0aW1lc3Rh
bXBpbmcgZmVhdHVyZT8KClRoYW5rcywKSmFzb24KCj4KPiBOYWNrZWQtYnk6IEhvcmF0aXUgVnVs
dHVyIDxob3JhdGl1LnZ1bHR1ckBtaWNyb2NoaXAuY29tPgo+Cj4gPiAgICAgICAgIHNrYl9wdXNo
KHNrYiwgSUZIX0xFTl9CWVRFUyk7Cj4gPiAgICAgICAgIG1lbWNweShza2ItPmRhdGEsIGlmaCwg
SUZIX0xFTl9CWVRFUyk7Cj4gPiAgICAgICAgIHNrYl9wdXQoc2tiLCA0KTsKPiA+IEBAIC03Njgs
NiArNzY3LDcgQEAgaW50IGxhbjk2NnhfZmRtYV94bWl0KHN0cnVjdCBza19idWZmICpza2IsIF9f
YmUzMiAqaWZoLCBzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQo+ID4gICAgICAgICAgICAgICAgIG5l
eHRfZGNiX2J1Zi0+cHRwID0gdHJ1ZTsKPiA+Cj4gPiAgICAgICAgIC8qIFN0YXJ0IHRoZSB0cmFu
c21pc3Npb24gKi8KPiA+ICsgICAgICAgc2tiX3R4X3RpbWVzdGFtcChza2IpOwo+ID4gICAgICAg
ICBsYW45NjZ4X2ZkbWFfdHhfc3RhcnQodHgpOwo+ID4KPiA+ICAgICAgICAgcmV0dXJuIE5FVERF
Vl9UWF9PSzsKPiA+IC0tCj4gPiAyLjQzLjUKPiA+Cj4KPiAtLQo+IC9Ib3JhdGl1Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
