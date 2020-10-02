Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18769281839
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Oct 2020 18:47:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9A7BC424B7;
	Fri,  2 Oct 2020 16:47:18 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74307C424B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Oct 2020 16:47:17 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id z13so2220271iom.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Oct 2020 09:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Li4M3GK5y6x0SzTfqjxLLA9AT+ROiUGVRcFqRzm5Djg=;
 b=a1gXL5toNpXLmacnL7yhtJtYu+HmO+zq2HSfVRcyZ9z5aGYPOUMcOsxSjRxLjTiwhj
 zJBgESeE1qI3ToOAsK8MZWwKmHt51a3nMoD6FLDGupRKEjHEktpPC4yX8sNz7w/nKYtr
 hL0t3LhSNNDXOlNOrlInWA796iaMFGVw4FjQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Li4M3GK5y6x0SzTfqjxLLA9AT+ROiUGVRcFqRzm5Djg=;
 b=igkhitTQEq98GTF4JLwihUvp7CsDvwbQRHlkwczbw/IofMlUiPTyDRr5GcE54bkSVg
 duZFEy6cNXEokf9sXHbb5DKsKB9gdQOhCm0Qket7487IkHiIwmYTiBmPF9N8GO/riCz4
 f09dgnm1CWd0aGAsTADYsj2p89p+IVW5ZCbWQxab0Y0wiQBzmzUsOgKOgYy93fW3/vdD
 kOFyT32d8Ah+Vp8TUshGwv0nQN2Z1hUUg2S+FfxVyaekiwS29T6SXvU2Z7bUtqbu2knB
 ljD7eC1h6/MGHm6T+dPrRQkjXLM/WkWlD0cgfMq3h//GOMgsDULgltOMHuEF8Y7n7LQK
 ndSg==
X-Gm-Message-State: AOAM5336WMcNY9DBVLTSxRceqE6HHpRB4T/bcgXP+a30OfvBDnPT3xkS
 w4KqH6P39L9RH/ubTNiJdGbRoQ==
X-Google-Smtp-Source: ABdhPJzrfRpNIYzV2uFrhJdCHt/QTSYBKDnpK2pS6zKI5Da6BP91uaqOQt3S2LEYZ+yKmaDKjo66AQ==
X-Received: by 2002:a05:6638:10e9:: with SMTP id
 g9mr2960820jae.139.1601657236070; 
 Fri, 02 Oct 2020 09:47:16 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id h2sm932771ioj.5.2020.10.02.09.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 09:47:15 -0700 (PDT)
To: Joe Perches <joe@perches.com>, Julia Lawall <julia.lawall@inria.fr>,
 Dan Carpenter <dan.carpenter@oracle.com>, Shuah Khan <shuah@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <CAMj1kXGh+CzuXkAnqsoMO2A3T1p=D6uFOV347Ym5+VFn5U1gWg@mail.gmail.com>
 <20200929124108.GY4282@kadam>
 <alpine.DEB.2.22.394.2009291445050.2808@hadrien>
 <5f0d2b20f5088281363bb4a35c5652a2c087f159.camel@perches.com>
 <cd75e2d1-9923-b725-78cd-fd5611431584@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <81b94c3a-43d6-c9f5-0bc0-43bf65b3d5fc@linuxfoundation.org>
Date: Fri, 2 Oct 2020 10:47:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cd75e2d1-9923-b725-78cd-fd5611431584@linuxfoundation.org>
Content-Language: en-US
Cc: linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
 =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>,
 David Lechner <david@lechnology.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-block@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 drbd-dev@tron.linbit.com, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH 00/18] use semicolons rather than commas
 to separate statements
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gOS8yOS8yMCA3OjQyIEFNLCBTaHVhaCBLaGFuIHdyb3RlOgo+IE9uIDkvMjkvMjAgNzozNCBB
TSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4+IE9uIFR1ZSwgMjAyMC0wOS0yOSBhdCAxNDo0NyArMDIw
MCwgSnVsaWEgTGF3YWxsIHdyb3RlOgo+Pj4gT24gVHVlLCAyOSBTZXAgMjAyMCwgRGFuIENhcnBl
bnRlciB3cm90ZToKPj4+PiBUaGUgdGltZXMgd2hlcmUgY29tbWFzIGFyZSB1c2VkIGRlbGliZXJh
dGVseSB0byByZXBsYWNlIGN1cmx5IGJyYWNlcyAKPj4+PiBhcmUKPj4+PiBqdXN0IGV2aWwuwqAg
RWl0aGVyIHdheSB0aGUgY29kZSBpcyBjbGVhbmVyIHdpdGggc2VtaS1jb2xvbnMuCj4+Pgo+Pj4g
SSBhbHNvIGZvdW5kIGV4YWFtcGxlcyBsaWtlIHRoZSBmb2xsb3dpbmcgdG8gYmUgcGFydGljdWxh
cmx5IHVuZm9ydW5hdGU6Cj4+Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcHJpbnRmKHN0ZGVyciwKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICJwYWdlX25yICVsdSB3cm9uZyBjb3VudCAlTHUgCj4+PiAlTHVc
biIsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFnZV9uciwgY291bnQsCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY291bnRfdmVyaWZ5W3BhZ2VfbnJdKSwgZXhpdCgxKTsKPj4+Cj4+PiBU
aGUgZXhpdCBpcyB2ZXJ5IGhhcmQgdG8gc2VlLCB1bmxlc3MgeW91IGtub3cgdG8gbG9vayBmb3Ig
aXQuCj4+Cj4+IEkgc2VudCB0aGF0IHBhdGNoIGxhc3QgbW9udGguCj4+IGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTE3MzQ4NzcvCj4+Cj4gCj4gSSBzZWUgd2hhdCBoYXBwZW5l
ZC4gVGhpcyBwYXRjaCB0b3VjaGVzIGxpYiwgY3B1cG93ZXIsIGFuZCBzZWxmdGVzdHMuCj4gR3Vl
c3MgbG9zdCBpbiB0aGUgbGltYm8gb2Ygd2hvIHRha2VzIGl0Lgo+IAo+ICDCoHRvb2xzL2xpYi9z
dWJjbWQvaGVscC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEw
ICstCj4gIMKgdG9vbHMvcG93ZXIvY3B1cG93ZXIvdXRpbHMvY3B1ZnJlcS1zZXQuY8KgwqAgfMKg
IDE0ICstCj4gIMKgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdm0vZ3VwX2JlbmNobWFyay5jIHzC
oCAxOCArLQo+ICDCoHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL3VzZXJmYXVsdGZkLmPCoMKg
IHwgMjk2ICsrKysrKysrKysrKystLS0tLS0tLQo+ICDCoDQgZmlsZXMgY2hhbmdlZCwgMjEwIGlu
c2VydGlvbnMoKyksIDEyOCBkZWxldGlvbnMoLSkKPiAKPiBJIGNhbiB0YWtlIGl0IHRocm91Z2gg
b25lIG9mIG15IHRyZWVzLgo+IAoKUmFmYWVsLCBBbmRyZXcsCgpUaGlzIHBhdGNoIGlzIG5vdyBh
cHBsaWVkIHRvCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3NodWFoL2xpbnV4LWtzZWxmdGVzdC5naXQgCmZpeGVzIGJyYW5jaC4KClRoaXMgc3BhbnMgcG0s
IGtzZWxmdGVzdC1tbSB0ZXN0cyBhbmQgdG9vbHMvbGliIGFuZCBoYXMgYmVlbgppbiBsaW1ibyBm
b3IgYSBmZXcgd2Vla3MgZm9yIHRoYXQgcmVhc29uLgoKSSBkZWNpZGVkIHRvIHRha2UgdGhpcyB0
aHJvdWdoIGtzZWxmdGVzdCB0cmVlIHRvIGF2b2lkIGhhdmluZwpKb2Ugc3BsaXQgdGhlIHBhdGNo
ZXMuCgp0aGFua3MsCi0tIFNodWFoCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
