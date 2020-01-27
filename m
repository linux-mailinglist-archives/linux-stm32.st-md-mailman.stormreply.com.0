Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0045A14A651
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2020 15:39:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4940C36B0B;
	Mon, 27 Jan 2020 14:39:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A04DEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 14:39:03 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id p17so7322425wmb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2020 06:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r2n9HgG3ZrMvXCqNF4d9mGEYxiT05rGn70RPL8ULQ/U=;
 b=riJB6zG/Eu4iZf43OSwCK8JfLG3Z4kdWyGiXoNEzxgIf5YHsghMkh/YiKKboRP2hSr
 vHKZ4bEvzgq+1QKhTCPBoic4rdysIz5K2TMbdoloT2WFflNn2E2lEv4VJsMcSw1IR2RC
 67Gkpmg9IfH8YvTTmCf5oMAeYsa5YKm0DHs8jpDR0aodiJsmGKW2byHh6hJKjqoQb/7k
 YF3vRCqwXhRUmvfqCHlYU7DD6yEPTCGdVGPoxy0k4rm/+tEfHXdb3Grj1jYe0lUliVEf
 t0k2Sv+QU8XzdlpKBAvXTfP1SJUq0qPWKtFN9q3lyFwZ2boU14Vb7t6Z1aJIssAHpGEm
 i3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r2n9HgG3ZrMvXCqNF4d9mGEYxiT05rGn70RPL8ULQ/U=;
 b=S8DKNep3AMHF3ZkncboVjjGcJ14jbz8Sbi5XoIXIllQ4UdYrpDoWD9lrDbyh9SyuQr
 ZBdSEPcH6YJ/WDuJv7Tv4xN5tcVK2ai7jV3wPcZdSXtCCYbofC/cmAsB5SPmxaD6qmwJ
 r3Hg5h1c8DasceEBNiaH9JbZKOj/RI2Y5jTmSJRxKAv7SgrxDZLCMHiKQXHaPQ7kFlZo
 IlUGydb/QuRUGWB0cWwb/SsqXyP6z1EWjpNEcW3RUpmEgZFpvfpBr+8xuISNbQFHSwbo
 bScbeiIbRQ2+OOIpphBZBU6vjuiPygtCUKuNNUPP8jJqTwARzNeCZ2T8CTrNSzZoBJiw
 bkXQ==
X-Gm-Message-State: APjAAAVwX86XZEPe6EEql77QzULx9NG1KTwJYdEtR7QOmua1jlidqFIM
 gLARgwCPvZj6CnVokCTV32KL/w==
X-Google-Smtp-Source: APXvYqxgcOHr1iifDqF6SYFUFu7cnSGxsH6hrRCitGTGYgw+Fnt0qCZ2OSGD5XVW0TWKTeiVfSqYjQ==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr14426343wmi.116.1580135942912; 
 Mon, 27 Jan 2020 06:39:02 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:25cd:3fb1:37ba:f055?
 ([2a01:e34:ed2f:f020:25cd:3fb1:37ba:f055])
 by smtp.googlemail.com with ESMTPSA id e18sm20391646wrw.70.2020.01.27.06.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 06:39:02 -0800 (PST)
To: Pascal PAILLET-LME <p.paillet@st.com>,
 "rui.zhang@intel.com" <rui.zhang@intel.com>,
 "edubezval@gmail.com" <edubezval@gmail.com>,
 "amit.kucheria@verdurent.com" <amit.kucheria@verdurent.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 David HERNANDEZ SANCHEZ <david.hernandezsanchez@st.com>,
 "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200110101605.24984-1-p.paillet@st.com>
 <a400d4e2-4abb-aad8-73f0-57c9300ca351@st.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <9cddb220-7890-5bdb-0d59-125264ab0626@linaro.org>
Date: Mon, 27 Jan 2020 15:39:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a400d4e2-4abb-aad8-73f0-57c9300ca351@st.com>
Content-Language: en-US
Subject: Re: [Linux-stm32] [PATCH_V3 0/6] thermal: stm32: driver improvements
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

T24gMjcvMDEvMjAyMCAxNDoxNywgUGFzY2FsIFBBSUxMRVQtTE1FIHdyb3RlOgo+IFRoZSBnb2Fs
IG9mIHRoaXMgcGF0Y2hzZXQgaXMgdG8gaW1wcm92ZSBhbmQgc2ltcGxpZnkgdGhlIHN0bTMyIHRo
ZXJtYWwKPj4gZHJpdmVyOgo+PiAqIGxldCB0aGUgZnJhbWV3b3JrIGhhbmRsZSB0aGUgdHJpcCBw
b2ludHM6IGl0IHZlcnkgaXMgaGFyZCB0byBzcGxpdCB0aGlzIHBhdGNoCj4+IGludG8gc21hbGxl
ciBvbmVzIGFuZCBrZWVwIGVhY2ggaW5kaXZpZHVhbCBwYXRjaCBmdW5jdGlvbmFsLgo+PiAqIGZp
eCBpbnRlcnJ1cHQgbWFuYWdlbWVudCB0byBhdm9pZCByZWNlaXZpbmcgaHVuZHJlZHMgb2YKPj4g
aW50ZXJydXB0cyB3aGVuIHRoZSB0ZW1wZXJhdHVyZSBpcyBjbG9zZSB0byB0aGUgbG93IHRocmVz
aG9sZC4KPj4gKiBpbXByb3ZlIHRlbXBlcmF0dXJlIHJlYWRpbmcgcmVzb2x1dGlvbgo+PiAqIHRo
ZSBkaXJ2ZXIgaXMgYmFja2F3cmQgY29tcGF0aWJsZS4KPj4KPj4gUGFzY2FsIFBhaWxsZXQgKDYp
Ogo+PiBjaGFuZ2VzIGluIHYyOgo+PiAqIFNwbGl0ICJoYW5kbGUgbXVsdGlwbGUgdHJpcCBwb2lu
dHMiIHBhdGNoIHRvIG1ha2Ugb25lczoKPj4gKiAgIHJld29yayBzZW5zb3IgbW9kZSBtYW5hZ2Vt
ZW50Cj4+ICogICBkaXNhYmxlIGludGVycnVwdHMgYXQgcHJvYmUKPj4gKiAicmVtb3ZlIGhhcmR3
YXJlIGlycSBoYW5kbGVyIiBpcyBzcXVhc2hlZCBpbiAiaGFuZGxlIG11bHRpcGxlIHRyaXAgcG9p
bnRzIgo+IGtpbmQgcmVtaW5kZXIgZm9yIHJldmlldwo+PiAgICB0aGVybWFsOiBzdG0zMjogZml4
IGljaWZyIHJlZ2lzdGVyIG5hbWUKPj4gICAgdGhlcm1hbDogc3RtMzI6IHJld29yayBzZW5zb3Ig
bW9kZSBtYW5hZ2VtZW50Cj4+ICAgIHRoZXJtYWw6IHN0bTMyOiBkaXNhYmxlIGludGVycnVwdHMg
YXQgcHJvYmUKPj4gICAgdGhlcm1hbDogc3RtMzI6IGhhbmRsZSBtdWx0aXBsZSB0cmlwIHBvaW50
cwo+PiAgICB0aGVybWFsOiBzdG0zMjogaW1wcm92ZSB0ZW1wZXJhdHVyZSBjb21wdXRpbmcKPj4g
ICAgdGhlcm1hbDogc3RtMzI6IGZpeCBsb3cgdGhyZXNob2xkIGludGVycnVwdCBmbG9vZAo+Pgo+
PiAgIGRyaXZlcnMvdGhlcm1hbC9zdC9zdG1fdGhlcm1hbC5jIHwgMzg4ICsrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTIwIGluc2VydGlvbnMoKyks
IDI2OCBkZWxldGlvbnMoLSkKClRoZSBzZXJpZXMgbG9va3MgZ29vZCB0byBtZS4gSSd2ZSBhcHBs
aWVkIGl0IGZvciBrZXJuZWxjaSwgaWYgaXQgaXMgZ29vZAppdCB3aWxsIGdvIHRvIHRoZSBuZXh0
IGJyYW5jaCBhbmQgYmUgcGFydCBvZiB0aGUgbmV4dCBwdWxsIHJlcXVlc3QuCgpJbiB0aGUgZnV0
dXJlLCBkbyBub3Qgam9pbiB0aGUgUEFUQ0gga2V5d29yZCB3aXRoIHRoZSB2ZXJzaW9uLiBUaGF0
CnB1enpsZXMgcGF0Y2h3b3JrLgoKVGhhbmtzCgogIC0tIERhbmllbAoKCi0tIAogPGh0dHA6Ly93
d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBB
Uk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9M
aW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0
ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
