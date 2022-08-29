Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 769B95A4B4C
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Aug 2022 14:14:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2846FC5A4FD;
	Mon, 29 Aug 2022 12:14:42 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 970D8C03FDA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Aug 2022 12:14:40 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id cv7so3568645qvb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Aug 2022 05:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=y92MhY7EE4yvAfEj5TsgHetaWbvxk1FPwg51QUNz2vw=;
 b=dQuvCfbN+BqLYM2JPF9Jk0JgSIRFxvFp9l5ekLwOhQD94t2iJ3XipOt4C28q9q3jOU
 oOBbXlAfEnCXBStKk8MQzpdwANPt2An0WRSky8R+nggmsz22HnsvenI2TeydD7zC0Heb
 X0w5KZ7bEweaLkqAkcEuPEg/sErmxPyEfzFfhxXy/eVniwSHstoclJoNt/R+tsbvIi5y
 RH+k+UXL6pNkM14cb5LRvi2w7CflG+AimF44FrcxjiN1cZifa5Qfi8KqPQ4+pILlWXPm
 ySvzLEAfghECl/ZJFS8UDT7kddOlX0Us8JzEI8PsJUfbOL34qeVaph1BxpSgUt+a3QgU
 f/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=y92MhY7EE4yvAfEj5TsgHetaWbvxk1FPwg51QUNz2vw=;
 b=Bch/uWwO4+BJsD8ZUSnZHyXAgP4YitJdAte4OJ41UPvH3ug3JHHN9wT3XK1V0DYtL9
 yb4APV4EHCrgrqXnOh14ua58cWaxhYgcEtd52nUk131FlydiI8Oe+J94vzjXR0geV6vC
 1m/VZUa+J/7CIB9aUqJOeNPyBz/NhJeRY8HXlfvgcSQZZ7uXfZQ7H1yJ7aSNWUGTMq5A
 mz28ToZIGbq31GpOcBtAC9LpcLdgBj0GDnuwHo9zCmFXrzgE9PfeXJYhWLv8uyLk5zns
 3KsD48/mt7YcJlccsc3CoRIGtnKwvOGAAQlIVDgPZPfzJgGj8SMWeyVpXpiDesB9/GQb
 1wjA==
X-Gm-Message-State: ACgBeo0Ies4Sr1+iyn/4rNnqzhiEQk4jVYTkbueWQmOSVFaQiEGq1y5k
 1T+ZEuzKM+PUqVOFRwlYqlE68gCt2wMlxCBeIaE=
X-Google-Smtp-Source: AA6agR4IaCF2wMNBlOtYMYUc4a6oz+UHbC5LMsSt8YcO74NjWYktGgHWVopBsY6Qa9+qBFsRGpDkq/WY8g8Z4coaPkI=
X-Received: by 2002:a05:6214:29c2:b0:497:8b2:442 with SMTP id
 gh2-20020a05621429c200b0049708b20442mr10091445qvb.97.1661775279551; Mon, 29
 Aug 2022 05:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220826144629.11507-1-ilpo.jarvinen@linux.intel.com>
 <20220826144629.11507-4-ilpo.jarvinen@linux.intel.com>
 <CAHp75Vc4NfZE6DxFnfeAS9fxnZHpxMjacHy1TsG8ib+FiCqFLQ@mail.gmail.com>
 <1712a4c5-638-4e63-af29-32bdcbaab443@linux.intel.com>
In-Reply-To: <1712a4c5-638-4e63-af29-32bdcbaab443@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 29 Aug 2022 15:14:03 +0300
Message-ID: <CAHp75VcozE+AYMoTpjPf0sdPNMqjdO8Z1cpF2wU4FfzhnAaZng@mail.gmail.com>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Documentation List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Corbet <corbet@lwn.net>, Jiri Slaby <jirislaby@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Lino Sanfilippo <LinoSanfilippo@gmx.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Richard Genoud <richard.genoud@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 3/3] serial: Add kserial_rs485 to avoid
 wasted space due to .padding
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

T24gTW9uLCBBdWcgMjksIDIwMjIgYXQgMzowOSBQTSBJbHBvIErDpHJ2aW5lbgo8aWxwby5qYXJ2
aW5lbkBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+IE9uIEZyaSwgMjYgQXVnIDIwMjIsIEFuZHkg
U2hldmNoZW5rbyB3cm90ZToKPiA+IE9uIEZyaSwgQXVnIDI2LCAyMDIyIGF0IDU6NTEgUE0gSWxw
byBKw6RydmluZW4KPiA+IDxpbHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cgou
Li4KCj4gPiA+ICsgICAgICAgKnJzNDg1ID0gKigoc3RydWN0IGtzZXJpYWxfcnM0ODUgKikmcnM0
ODVfdWFwaSk7Cj4gPgo+ID4gU28gd2l0aCBhbGwgYXNzZXRzIHdlIGhhdmUgd2UgY2FuIGJlIHN1
cmUgdGhhdCBvbiBCRTY0IC8gQkUzMiBtYWNoaW5lcwo+ID4gdGhpcyB3aWxsIGJlIGZsYXdsZXNz
LiBJcyB0aGlzIGFzc3VtcHRpb24gY29ycmVjdD8KPgo+IEkgdGhpbmsgc28uIEF0IHdvcnN0IGl0
IGNvdWxkIHRyaWdnZXIgYSBidWlsZCBmYWlsIGFzc3VtaW5nIHRoZSBrZXJuZWwKPiB3b3VsZCBk
byBzb21lIHJlYWxseSBvZGQgc3RydWN0IGxheW91dCByZW9yZGVyaW5nICh3aGljaCwgYWNjb3Jk
aW5nIHRvCj4gdGhlIGJ1aWxkIGJvdCwgZG9lc24ndCBvY2N1ciBmb3IgYW55IGN1cnJlbnRseSB0
ZXN0ZWQgYXJjaCkuCj4KPiBOb3cgdGhhdCB5b3UgaGlnaGxpZ2h0ZWQgdGhpcyBsaW5lIHRob3Vn
aCwgSSBzdGFydGVkIHRvIHdvbmRlciBpZiBpdCB3b3VsZAo+IGJlIGp1c3QgYmV0dGVyIHRvIHVz
ZSBtZW1jcHkoKSBpbnN0ZWFkIGFzIGl0IHdvdWxkIGF2b2lkIHRob3NlIGNhc3RzLgoKQWN0dWFs
bHkgdGhlIGN1cnJlbnQgdmVyc2lvbiBtaWdodCBiZSBiZXR0ZXIgc2luY2UgdGhlIGNvbXBpbGVy
IHdpbGwKYmUgYXdhcmUgb2YgdGhlIHR5cGVzLCBidXQgaXQgc3RpbGwgcmVxdWlyZXMgYSBwcm9w
ZXIgbGF5b3V0IG9mIHRoZQpmaWVsZHMuIFRoYXQgc2FpZCwgSSBsZWF2ZSBpdCBmb3IgeW91LgoK
LS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
