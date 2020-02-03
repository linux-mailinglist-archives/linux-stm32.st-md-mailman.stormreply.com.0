Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD46150879
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2020 15:35:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A462C36B0C;
	Mon,  3 Feb 2020 14:35:15 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88089C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2020 14:35:12 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id f5so12790704ilq.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Feb 2020 06:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PeAE2050RUwA2PhxvSVJSMNprANdC/69hQV8eL+NY48=;
 b=TUaaPrZnYM1tgevoqkuJWFXrJMpt7+22SMpJkevzbwT+vt6EMOU3Sxf5Ll8wF7cWhx
 7wgPwHJBuaVxTxd2/kVnoxRg3aW8jdNZabM+0Z/6I40M8Hfubj7S1Z5RTdQgDwPFOlFX
 OVICfMVZyyoNxzFIvNvbpQZVApef+W2nMB6qVASrRYzBY8X67KyEq3DacxVLhs9NYN9H
 vqjOWSLE5mRse511pO6UqBzDcy18YqEX0PX3v8nMk5Y+GMUrUyHqK5xTkzftOzmp7jp5
 zRsbdXlVnXf4+DzZwS5E3lmroWXUCCzizzdOG527hxV8gTth11yutKox7zlpOIfLMnZV
 5aRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PeAE2050RUwA2PhxvSVJSMNprANdC/69hQV8eL+NY48=;
 b=MDzMXE5zSVKpYZDXhB0271ZHdJvutqHjHzFMb3vOv/GL5A+/F93UQM9o6OHvetlOCW
 iLDXdt+1lF9H/RFht6EiJD2GoeruI0G3NvmryCL6wXeqixkAk4GNqpe8uN3PLfvVhv53
 WCy935BAiS4ZYyDZAOVvTtevx82fgo7eYv7875kq58Ng44HH8DnfKZPp5/TKj9bDaVIM
 i4QnbQfGhPyHb97y+c34XN8lBsgXiEZ01FmtW4f7FF872bjhHWMSMADtkIRSwksVV8yj
 Axy0X05flrasMRcFkUg4VThWVo0Cz59AoAdY6eGGphtabTpgFCytugMuQJf+fIbuhJzw
 CNHA==
X-Gm-Message-State: APjAAAXikvGbrQnR2uq+fN3wKMSu9MXXB6xw3QEcZ3W0+RJW1fkg5vSB
 qfUNX/pOFHz/5TaA4uehtigkXBSd1hZ2qyUHXis=
X-Google-Smtp-Source: APXvYqyHSJVh71XbyNxUrseBdDaOrgsCKYEgH80cZsvYCQFfhjuOIwCdgh9E8GWzYcLhFnLBPzjp7kW4MaZ05lXAWdg=
X-Received: by 2002:a92:981b:: with SMTP id l27mr22497981ili.118.1580740511331; 
 Mon, 03 Feb 2020 06:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20200203140425.26579-1-erwan.leray@st.com>
In-Reply-To: <20200203140425.26579-1-erwan.leray@st.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 3 Feb 2020 15:35:00 +0100
Message-ID: <CAJiuCcfRuHXajo7+cDMpQ73vhGuerW3_ObrfG0YOEzogKaH-sA@mail.gmail.com>
To: Erwan Le Ray <erwan.leray@st.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gerald Baeza <gerald.baeza@st.com>, Olof Johansson <olof@lixom.net>,
 Nathan Huckleberry <nhuck15@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 0/4] STM32 early console
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

SGkgRXJ3YW4sCgpPbiBNb24sIDMgRmViIDIwMjAgYXQgMTU6MDQsIEVyd2FuIExlIFJheSA8ZXJ3
YW4ubGVyYXlAc3QuY29tPiB3cm90ZToKPgo+IEFkZCBVQVJUIGluc3RhbmNlIGNvbmZpZ3VyYXRp
b24gdG8gU1RNMzIgRjQgYW5kIEY3IGVhcmx5IGNvbnNvbGUuCj4gQWRkIFNUTTMyIEg3IGFuZCBN
UDEgZWFybHkgY29uc29sZSBzdXBwb3J0Lgo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAtIGZpeCBhIG1p
c3NpbmcgY29uZGl0aW9uIGZvciBTVE0zMk1QMQo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAtIHNwbGl0
ICJbUEFUQ0hdIEFSTTogZGVidWc6IHN0bTMyOiBhZGQgVUFSVCBlYXJseSBjb25zb2xlIGNvbmZp
Z3VyYXRpb24iCj4gICBpbnRvIHNlcGFyYXRlIHBhdGNoZXMgYXMgc3VnZ2VzdGVkIGJ5IENsZW1l
bnQgaW50byBbMV0KClRoYW5rcyBmb3Igc3BsaXR0aW5nIHRoZSBwYXRjaCwgdGhlIHdob2xlIHNl
cmllcyBsb29rcyBmaW5lIHRvIG1lLgoKQWNrZWQtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24u
Y2xlbUBnbWFpbC5jb20+CgpDbMOpbWVudAoKCgo+Cj4gWzFdIGh0dHBzOi8vbGttbC5vcmcvbGtt
bC8yMDE5LzQvMTAvMTk5Cj4KPiBFcndhbiBMZSBSYXkgKDQpOgo+ICAgQVJNOiBkZWJ1Zzogc3Rt
MzI6IGFkZCBVQVJUIGVhcmx5IGNvbnNvbGUgY29uZmlndXJhdGlvbiBmb3IgU1RNMzJGNAo+ICAg
QVJNOiBkZWJ1Zzogc3RtMzI6IGFkZCBVQVJUIGVhcmx5IGNvbnNvbGUgY29uZmlndXJhdGlvbiBm
b3IgU1RNMzJGNwo+ICAgQVJNOiBkZWJ1Zzogc3RtMzI6IGFkZCBVQVJUIGVhcmx5IGNvbnNvbGUg
c3VwcG9ydCBmb3IgU1RNMzJINwo+ICAgQVJNOiBkZWJ1Zzogc3RtMzI6IGFkZCBVQVJUIGVhcmx5
IGNvbnNvbGUgc3VwcG9ydCBmb3IgU1RNMzJNUDEKPgo+ICBhcmNoL2FybS9LY29uZmlnLmRlYnVn
ICAgICAgICAgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gIGFyY2gv
YXJtL2luY2x1ZGUvZGVidWcvc3RtMzIuUyB8ICA5ICsrKystLS0tCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNDAgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMTcuMQo+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
