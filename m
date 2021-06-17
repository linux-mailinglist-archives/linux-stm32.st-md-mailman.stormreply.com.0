Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B513AB123
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jun 2021 12:15:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82D86C59780;
	Thu, 17 Jun 2021 10:15:27 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C34D7C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 10:15:24 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id d9so2519183ioo.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 03:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KGL/4St8CT2Ac963azeQRyk+IlITL+qEpVPNlHM/37o=;
 b=bKwHB0IKV5OjeMW4X7r3ZB08hgO7efxr9ryo6e32en43D2rUiBX017lGE/UFlz1grh
 U/qx4ESV7D/TSrZHIw6iYvTxd4GeVbV1uwkabZhjNnIiDC19As3hxCeiM9Qa9YbGYyzs
 Dfq/20Vh27eRY6FV06PXE+/eL+23GBwPZYUJkj9ObL++f8+NmIaG8iKsUArb+pNpE18c
 F2zmJy29m2PkjPXFhXUru6Mgr2GD/rdx0QvLK3dkvTYCLK1SCrr6Pwfh2MBaKYaSYFLp
 pSnqxRj/umVc/AWGsRizGiharAiQBsnWIUrCnLPRAfEXP/O9onaDzwhJeC0ttSCuW47A
 mX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KGL/4St8CT2Ac963azeQRyk+IlITL+qEpVPNlHM/37o=;
 b=H7RDr01mXk3MXUrLZrRuCeXoHf2wNRMN6qg+nB0SNTmsAgPQOhoTEdMM7Jc0dt7yGe
 xZiZZj09NxpsgMSQULprH7clfTJ+a4r1EQgaHxaSM8YQ81FU6PW7ASNMYziC7CdruQNC
 3dP+uNC5vpOfN0DmFMb0iazOrpuSv9gylv2FR4qEC7rAZUzFTRWKAVMyq+GUIHb1fQ1/
 BefxoYYXRMlQ08hJvleiQ4Thu9c6hIaJ4To2VoO5uRhHyNf71p63XKpJypn0BscLYXpt
 BGCoy1HqC4h5V1zBplaEeGYwYNKwqrgOwCdwV1qe+BSV/iV4YOBQlA0QldupeCQ5haCk
 WiAg==
X-Gm-Message-State: AOAM531xxN1MSGk+Ev4bP+BcftDwBS3Ej5UuIvLO4l1gS080Oug/B90o
 lTeC2XeoaWEYLo4/I2xNHcME9S9/d9X4ZiM5jG8=
X-Google-Smtp-Source: ABdhPJzbB+2xozr5c3nEbDgidEIonumRpZapZoSLiEZmV8b80pA0Y6QT5+aRwOkO+0YwvNKs3B2sbAuiL7VqpUym2fM=
X-Received: by 2002:a02:5b45:: with SMTP id g66mr3970817jab.62.1623924923627; 
 Thu, 17 Jun 2021 03:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
 <1621508727-24486-2-git-send-email-dillon.minfei@gmail.com>
 <0f3145ce-3a01-3a77-2b65-85450bf9d920@xs4all.nl>
In-Reply-To: <0f3145ce-3a01-3a77-2b65-85450bf9d920@xs4all.nl>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Thu, 17 Jun 2021 18:14:47 +0800
Message-ID: <CAL9mu0KeZ9Fq5wN-jJwK5S94N0qPXmsENtZXUx-KfjWxNjjecw@mail.gmail.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Alexandre TORGUE <Alexandre.torgue@foss.st.com>
Cc: gnurou@gmail.com, Pi-Hsun Shih <pihsun@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mchehab+huawei@kernel.org,
 hugues.fruchet@foss.st.com, Michael Turquette <mturquette@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, ezequiel@collabora.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-media <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/7] media: admin-guide: add stm32-dma2d
	description
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

SGkgSGFucwoKVGhhbmtzIGZvciB5b3VyIHJldmlldyBvbiBteSBjb2RlLgoKT24gVGh1LCBKdW4g
MTcsIDIwMjEgYXQgNTo1NiBQTSBIYW5zIFZlcmt1aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5u
bD4gd3JvdGU6Cj4KPiBPbiAyMC8wNS8yMDIxIDEzOjA1LCBkaWxsb24ubWluZmVpQGdtYWlsLmNv
bSB3cm90ZToKPiA+IEZyb206IERpbGxvbiBNaW4gPGRpbGxvbi5taW5mZWlAZ21haWwuY29tPgo+
ID4KPiA+IGFkZCBzdG0zMi1kbWEyZCBkZXNjcmlwdGlvbiBmb3IgZG1hMmQgZHJpdmVyCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogRGlsbG9uIE1pbiA8ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20+Cj4g
PiAtLS0KPiA+ICBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL21lZGlhL3BsYXRmb3JtLWNhcmRs
aXN0LnJzdCB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL21lZGlhL3BsYXRmb3JtLWNh
cmRsaXN0LnJzdCBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbWVkaWEvcGxhdGZvcm0tY2Fy
ZGxpc3QucnN0Cj4gPiBpbmRleCAyNjFlNzc3MmViM2UuLmFjNzNjNDE2NmQxZSAxMDA2NDQKPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbWVkaWEvcGxhdGZvcm0tY2FyZGxpc3Qu
cnN0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL21lZGlhL3BsYXRmb3JtLWNh
cmRsaXN0LnJzdAo+ID4gQEAgLTYwLDYgKzYwLDcgQEAgczVwLW1mYyAgICAgICAgICAgIFNhbXN1
bmcgUzVQIE1GQyBWaWRlbyBDb2RlYwo+ID4gIHNoX3ZldSAgICAgICAgICAgICBTdXBlckggVkVV
IG1lbTJtZW0gdmlkZW8gcHJvY2Vzc2luZwo+ID4gIHNoX3ZvdSAgICAgICAgICAgICBTdXBlckgg
Vk9VIHZpZGVvIG91dHB1dAo+ID4gIHN0bTMyLWRjbWkgICAgICAgICBTVE0zMiBEaWdpdGFsIENh
bWVyYSBNZW1vcnkgSW50ZXJmYWNlIChEQ01JKQo+ID4gK3N0bTMyLWRtYTJkICAgICAgICBTVE0z
MiBDaHJvbS1BcnQgQWNjZWxlcmF0b3IgVW5pdAo+Cj4gSSBoYXZlIHRvIGFzazogaXQgaXMgcmVh
bGx5ICdDaHJvbS1BcnQnIGFuZCBub3QgQ2hyb21lLUFydCBvciBDaG9tYS1BcnQ/CgpZZXMsIEkg
anVzdCBkb3VibGUgY2hlY2tlZCBpdCBmcm9tIFsxXSwgaXQncyByZWFsbHkgJ0Nocm9tLUFydCcg
OikKaXQncyBzaG91bGQgbm90IGJlIGFuIHNwZWxsaW5nIG1pc3Rha2UsIGkgY2hlY2sgdGhlIHNv
YydzIGRhdGFzaGVldCwKcmVmZXJlbmNlIE1hbnVlbCwgYWxsIHVzZWQgJ0Nocm9tLUFydCcuCgou
Li4KR3JhcGhpY3MKCkNocm9tLUFSVCBBY2NlbGVyYXRvcuKEoiAoRE1BMkQpLCBncmFwaGljYWwg
aGFyZHdhcmUgYWNjZWxlcmF0b3IKZW5hYmxpbmcgZW5oYW5jZWQgZ3JhcGhpY2FsIHVzZXIgaW50
ZXJmYWNlIHdpdGggbWluaW11bSBDUFUgbG9hZAouLi4KCgpbMV0gaHR0cHM6Ly93d3cuc3QuY29t
L2VuL21pY3JvY29udHJvbGxlcnMtbWljcm9wcm9jZXNzb3JzL3N0bTMyZjQ2OW5pLmh0bWwKClRo
YW5rcy4KCkJlc3QgUmVnYXJkcwpEaWxsb24KCj4KPiBJdCdzIHByb2JhYmx5IGNvcnJlY3QsIGJ1
dCBJIGhhdmUgdG8gY2hlY2sgdGhpcyA6LSkKPgo+IFJlZ2FyZHMsCj4KPiAgICAgICAgIEhhbnMK
Pgo+ID4gIHN1bjRpLWNzaSAgICAgICAgICBBbGx3aW5uZXIgQTEwIENNT1MgU2Vuc29yIEludGVy
ZmFjZSBTdXBwb3J0Cj4gPiAgc3VuNmktY3NpICAgICAgICAgIEFsbHdpbm5lciBWM3MgQ2FtZXJh
IFNlbnNvciBJbnRlcmZhY2UKPiA+ICBzdW44aS1kaSAgICAgICAgICAgQWxsd2lubmVyIERlaW50
ZXJsYWNlCj4gPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
