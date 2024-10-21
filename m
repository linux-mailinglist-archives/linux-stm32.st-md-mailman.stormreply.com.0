Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6F59A68EA
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 14:46:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1218BC78033;
	Mon, 21 Oct 2024 12:46:39 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36AD7C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 12:46:31 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539e4b7409fso4430735e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 05:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729514790; x=1730119590;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=00OOYAye7Y8Jmp2eoWZbqWaZ8JNNBAOvgechpLDPNLM=;
 b=MLW0bW9VcHk/UtIUIiJxebo+GUnJaFA8yDkydO7guE5Bt6ZQIS9vfa9ANWpylufTf9
 Dp/LRgoAB0pdtkYSYeny8tuMwSAi0q5iwbEJu1+ZnH3fiNxuN3nooxSE+OAvSA+Qt9XN
 Yf9/c029qMPNw99J7KI1u5w/LedP2fLyKfHK6LB1KJ20L5iK8Xt61tumKXdXi8CRtCKE
 RY+uf6fwpefTqmJhWlM26WfYv4hKSFhYJPIwuNykba3EgJssi5f+WpIRtzJQBXUFaKRT
 i8rl2QIeNLuxAxqPdd6cGFwg8gVdXv9ux0Dgoojx2nMN2y6EzFtktkG2ITaGJb8T3gxF
 06Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729514790; x=1730119590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=00OOYAye7Y8Jmp2eoWZbqWaZ8JNNBAOvgechpLDPNLM=;
 b=JfSdv37aHmot01358wDuy8YC1fuO9nPpN/uDmM63p7/KflOV6QvI+PJl570JIg3M0a
 GqXkrlLSPimq8kJmlLZe8G2zsr41PhIjUikiCKrMqwoWJAlf2bM2L0ibzRrvIO0zFNIh
 Aohih/wl2XBGNh45F0xsThZLcwZWSW7eIQ/Ldt0tLsBv6isfH3u5A9Ogycwk8mLZy5eW
 ehcAnvjx15uT7EzDc5Awn4EZXhE2PlmIm0yoELHqH+4gWtcVw2hccvfMOeWUC6dNcUMP
 ZiEVMidGH542jeTie2xiXCMfufNywot0qeeDwld46XEbzS0bNKn4dlRJD80feUAz4ODl
 TXiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2gEXW8fsAHDhhfQg70PU4rIpCGjTuvNn0pxcdKKM0xRy0EjACD03p1W0RXjlI4ps4wkID2BhwK4Tj1A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzBTY0gF0zfUQK2f/xW34YDF2/GCqSr2E/uB0Vhc8gARB+WyDrN
 tCmNSsKMRa8bkFXgg2waCxzY4FYwR3bsRIt8TCc6DMGziDEg+EqtLxsYuzADKfI705oETX8fw3Z
 iGH/Wb5C/U4A+OMxMoth2En4t87alCh4nhcDzgQ==
X-Google-Smtp-Source: AGHT+IGe3S4BwA+pOP/cQq7I1CjxxDBUjVQoZRmQ7W4PP8hKLPc100e8nJIIOd6Yg8yfMAsZvsSBWYHMIieC1vxcEJw=
X-Received: by 2002:a05:6512:1392:b0:539:e67e:7db8 with SMTP id
 2adb3069b0e04-53a0c6ae65bmr4990352e87.12.1729514790318; Mon, 21 Oct 2024
 05:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
 <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
 <69f71ac8-4ba6-46ed-b2ab-e575dcada47b@foss.st.com>
 <CACRpkdYvgZj1R4gAmzFhf4GmFOxZXhpHVTOio+hVP52OBAJP0A@mail.gmail.com>
 <46336aba-e7dd-49dd-aa1c-c5f765006e3c@foss.st.com>
In-Reply-To: <46336aba-e7dd-49dd-aa1c-c5f765006e3c@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Oct 2024 14:46:18 +0200
Message-ID: <CACRpkdaiwt3aHmRKbR5e-hbd3VpR_Zxd95N3CmcAtFV-mjw_tg@mail.gmail.com>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kees Cook <kees@kernel.org>, Mark Brown <broonie@kernel.org>,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] ARM: ioremap: Sync PGDs for
	VMALLOC shadow
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

T24gTW9uLCBPY3QgMjEsIDIwMjQgYXQgMjoxMuKAr1BNIENsZW1lbnQgTEUgR09GRklDCjxjbGVt
ZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPiB3cm90ZToKCj4gSSBzYXcgeW91ciBlbWFpbCBhYm91
dCBNZWxvbidzIHBhdGNoIHRhcmdldGluZyB0aGUgc2FtZSBzdWJqZWN0Lgo+IElmIHdlIGRvbid0
IGVuYWJsZSBLQVNBTiBlaXRoZXIgeW91IHBhdGNoIG9yIE1lbG9uJ3Mgb25lIGRvIG5vdCBjb21w
aWxlLgo+Cj4gWy4uLl0KPiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19LQVNBTl9WTUFM
TE9DKSkKPiBbLi4uXQo+Cj4gU2hvdWxkIGJlIHJlcGxhY2VkIHdpdGggYW4gI2lmZGVmIGRpcmVj
dGl2ZS4KPiBga2FzYW5fbWVtX3RvX3NoYWRvd2Agc3ltYm9sIGlzIGhpZGVuIGJlaGluZCA6Cj4K
PiBpbmNsdWRlL2xpbnV4L2thc2FuLmg6MzI6I2lmIGRlZmluZWQoQ09ORklHX0tBU0FOX0dFTkVS
SUMpIHx8Cj4gZGVmaW5lZChDT05GSUdfS0FTQU5fU1dfVEFHUykKPgo+IFNvIHN5bWJvbCBkb2Vz
bid0IGV4aXN0IHdpdGhvdXQgS0FTQU4gZW5hYmxlZC4KClllYWggc29ycnkgZm9yIG1pc3Npbmcg
dGhpcy4gOigKClRoZSBhYnNlbmNlIG9mIHN0dWJzIGluIHRoZSBLYXNhbiBoZWFkZXIgbWFrZXMg
aXQgbmVjZXNzYXJ5IHRvIHJlbHkKb24gaWZkZWZzLgoKSSB3aWxsIGZvbGQgdGhlIGlkZWFzIGZy
b20gTWVsb24ncyBwYXRjaCBpbnRvIG1pbmUgYW5kIGFsc28gZGV2ZWxvcAphIHZlcnNpb24gdGhh
dCB3b3JrcyB3aXRoIGlmZGVmcy4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
