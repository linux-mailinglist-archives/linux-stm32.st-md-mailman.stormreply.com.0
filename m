Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4C09A22CD
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 14:57:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48415C78032;
	Thu, 17 Oct 2024 12:57:22 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63E18C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 12:57:15 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fb561f273eso9215861fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 05:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729169835; x=1729774635;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lM/6EyqTofKhNcaC/eZHyJO9iygvo6bNNH5rmkBUyRs=;
 b=GJHmO3X2UokJ1LWJ9UNG23JMvo1FKAYhyUwUTH7XneYNZfvbfLuoc5dPfVoF5H9LQf
 Q+7C/EW8zK6etXjBXfmYC/d51s5nHnx+O9cMkRRskhfbw4hLFlN2LWhF5+6hPbQnGhwD
 2FpPLgckN9CsgEfz7QHh6gvtKL5QXzmUyy6iEdKVCh93UcoR6ZjHlBzoaodAIXhycmaN
 tq5G79qsbl4FZOBPikWMfJBDZaywQktiDbZ1aOoIG4jmQ+e7NppStvkIURRlHaUTYVfm
 mA/EFwkMHF0vAg+xjZSbHaQLyhq3/VtBBkp5RvuWCtRgureiF6FPxG+vRwPIZ9Qo3Tke
 ZVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729169835; x=1729774635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lM/6EyqTofKhNcaC/eZHyJO9iygvo6bNNH5rmkBUyRs=;
 b=hu8e91TTPPYd9Hj59qjhYQGTdinzZgfGDS5jhnHKgkP/NBwtFmgeJN5/jICfruO1iz
 TJQYpKUGWN1SWBBT3HSLV9VBUyMxCJSZVsC3T7RaEbZrGcxp6OfDTP1OsBz3MbsVvo2d
 wMy0q/YQL2nDIU6Hn+SDExeYKvchexc/ODwZBILWxJFT3Qtqc9/f2/tvYQNzsjH+6fgn
 FTT8iLBYJwdJ+OyITMelJ/fYct90h9TLBEMdFGlpPQtso/ZW60fwwndpY0vr+1pANqMC
 84xWSNlwvw5YcS+2fjuKVHZ49ZDYxqm+pR7fqtoLGxO/X8uvup4yl+XsTsqPd9IpFFKm
 vMjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFUeBVd0/A8o38z4z5Rn5/WhkcNhXcG9fmonZzq+GGBnBLSY7SX/8sILmmyl5xD4Z9tgbNmr59tnvXjQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YybX6ya1FZ/ookfGs4aMvo4x9YN/3gifLveV54i5gHfpzDeRx9Q
 k5qjoKVhp4idGbkKwqQvDU+0X2+aDWfMJ3ghH1I+I4jxqQUEJO4PwgdK5pwT/Y+QSpv7LpJlkjo
 J/9gUF6jWORSNDo0BhX+Ow6UyiCt5mv/kmCSkvg==
X-Google-Smtp-Source: AGHT+IGtrITGsJ440cQ+NJ22p10H77zFvEUf3tKZTupFjLxmj4ShXkcJ1iATfsio4altMQLxvBi0+8F53/ukQnNuun4=
X-Received: by 2002:a2e:a987:0:b0:2fb:6169:c430 with SMTP id
 38308e7fff4ca-2fb6169c62bmr33603431fa.45.1729169834446; Thu, 17 Oct 2024
 05:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20241016-arm-kasan-vmalloc-crash-v2-0-0a52fd086eef@linaro.org>
 <20241016-arm-kasan-vmalloc-crash-v2-2-0a52fd086eef@linaro.org>
 <16e45f70-d1d6-4cca-95b0-24d3959e50be@foss.st.com>
 <CACRpkdaAnutxm-vrrWiqXPoJfsU_RNUOi+a0XP6FNysuYWiX+w@mail.gmail.com>
In-Reply-To: <CACRpkdaAnutxm-vrrWiqXPoJfsU_RNUOi+a0XP6FNysuYWiX+w@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Oct 2024 14:57:03 +0200
Message-ID: <CACRpkdZ2tSC0Xqzv0KHfAGHKU-_s0QQFjhTmqi--58pcBXRh-w@mail.gmail.com>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
 Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Mark Brown <broonie@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/2] ARM: entry: Do a dummy read from
	VMAP shadow
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

T24gVGh1LCBPY3QgMTcsIDIwMjQgYXQgMjo1NeKAr1BNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4gT24gVGh1LCBPY3QgMTcsIDIwMjQgYXQgMTI6MjDi
gK9QTSBDbGVtZW50IExFIEdPRkZJQwo+IDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPiB3
cm90ZToKPgo+ID4gPiArICAgICBhZGQgICAgIHIyLCBpcCwgbHNyICNLQVNBTl9TSEFET1dfU0NB
TEVfU0hJRlQKPiAoLi4uKQo+ID4gV2hpbGUgQVJNIFRSTSBzYXlzIHRoYXQgaWYgUmQgaXMgdGhl
IHNhbWUgb2YgUm4gdGhlbiBpdCBjYW4gYmUgb21pdHRlZCwKPiA+IHN1Y2ggc3ludGF4IGNhdXNl
cyBlcnJvciBvbiBteSBidWlsZC4KPiA+IExvb2tpbmcgYXJvdW5kIGZvciBzdWNoIHN5bnRheCBp
biB0aGUga2VybmVsLCB0aGlzIGxpbmUgc2hvdWxkIGJlIDoKPiA+IGFkZCAgICAgcjIsIHIyLCBp
cCwgbHNyICNLQVNBTl9TSEFET1dfU0NBTEVfU0hJRlQKPgo+IFllYWggY2xlYXJseSBteSBjb21w
aWxlcnMgYWxsb3dlZCBpdCA6Lwo+Cj4gSSBjaGFuZ2VkIGl0IHRvIHRoZSBhcmNoYWljIHZlcnNp
b24sIHdpbGwgcmVwb3N0IGFzIHYzLgoKSSB0aGluayBJIG1lYW50IHRoZSBjYW5vbmljYWwgdmVy
c2lvbi4uIGFuZ2xvLXNheG9uIGlzCnNvbWV0aW1lcyBub3QgbXkgc3Ryb25nIGNhcmQuCgpZb3Vy
cywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
