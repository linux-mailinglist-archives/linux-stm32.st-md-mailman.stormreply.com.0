Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C67A46E8D6
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Dec 2021 14:11:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA6EEC5F1EB;
	Thu,  9 Dec 2021 13:11:00 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05C00C5F1E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Dec 2021 13:10:59 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so6560226wme.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Dec 2021 05:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9VZyqdQ56/CPfyzyaRYaaaE5b2PgRvu7YyaE56kFMvE=;
 b=rg1/4pK0o0ArdNXIBbD7hIE8s9xOHCm3s2zR+jfRt9pWHPNxmphuZU/5Y0BMYIxVou
 d/HICWcCeofRMoz19UeqPo+AEZtRF9fdIOv1GjnTIZ79ZMnQSUvqO3eldjVAHMPFna++
 nmmACFQQ1rdFf8E9wBTDz8xo9/Kyd7l1cTLUGHJSvB6GaOXiObswt98A6Y55wZ/L0S5R
 gcrKSmmMCHDgpl3Rvapr4NOEAeAiuuG4/8+Ggifk/4YXyWsWfHje34GdlVOW9dWH1w3W
 QVgQNK+h5ltg7CU4rnCddtWcvUr59SQ/CBwsEGOKz0irrc8+vksJfqmWsNkM8ePMybze
 PaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9VZyqdQ56/CPfyzyaRYaaaE5b2PgRvu7YyaE56kFMvE=;
 b=52IMGq2uWvpB8qO6Oi47TqXPNrC2A5y98Kj0Qa5orQkYyqcD4IzujM0VZvi7CS8nip
 5nir7P5dwrD+u08HG9IGuRdJIwUjpIUxAZ9VKj5QMZSKOK4MVMf4dABwYLZ0jtRupYTu
 QseYwuD4mG3nTgZMOhIaL8oSjOx7WA35AGbvVbyn9QWo7WSZ3hIySN9MAlowuTKdqMlv
 gK7cTIGPa2LEhEqdtSnMZur6FtDU60sw9RGPkwfGt5+u/u2fUZYVFB2dgC6ZOUBgNeo/
 DGYhBQzHXpQyZyqzHT3UvMZm18Ou86oW6eQ9g+YHusj/ciNG8gRR9ZylfvqKH4WDoXIR
 N3XA==
X-Gm-Message-State: AOAM5309/RBXAGfPSGHw3LVQCuls7TWRoQvU9nN/VmJhZ8hzmcqpN7wA
 S/J+jgEb/4HxawaQInkvVNwIMA==
X-Google-Smtp-Source: ABdhPJzwo70kMd9vz2H0c+H98mxr9fadytd81xABG2xU1OkWF52g2yDKAJ2hmsi6CK+az7/GSYxhRQ==
X-Received: by 2002:a05:600c:1d01:: with SMTP id
 l1mr7370687wms.44.1639055459303; 
 Thu, 09 Dec 2021 05:10:59 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:8ae8:ca1f:ff1a:a23d?
 ([2a01:e34:ed2f:f020:8ae8:ca1f:ff1a:a23d])
 by smtp.googlemail.com with ESMTPSA id d188sm9075073wmd.3.2021.12.09.05.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 05:10:57 -0800 (PST)
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
 <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
 <c4869451-e879-aa58-29ba-ef3e94b03527@linaro.org>
 <OS0PR01MB592240481D7503FFC505BD5E86669@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUE3A0WwhGYpVK52S0C5xMqccpvHp0hHdnqq3aawzb7DQ@mail.gmail.com>
 <OS0PR01MB5922A0170D05F9930F848C2E866E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <23411585-b011-c12c-a3ff-2edb9889c37d@linaro.org>
Date: Thu, 9 Dec 2021 14:10:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB5922A0170D05F9930F848C2E866E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Language: en-US
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 3/4] clocksource/drivers/renesas-ostm:
 Add RZ/G2L OSTM support
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

T24gMDcvMTIvMjAyMSAxNDozMiwgQmlqdSBEYXMgd3JvdGU6Cj4gSGkgQWxsLAo+IAo+IEdlbnRs
ZSBwaW5nLgo+IAo+IEFyZSB3ZSBoYXBweSB3aXRoIHRoaXMgcGF0Y2g/IFBsZWFzZSBsZXQgbWUg
a25vdy4KPiAKPiBBcyBtZW50aW9uZWQgaW4gWzFdLCBpdCBoYXMgZGVwZW5kZW5jeSBvbiByZXNl
dCBwYXRjaAo+IAo+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGlu
dXgtcmVuZXNhcy1zb2MvcGF0Y2gvMjAyMTExMTIxODQ0MTMuNDM5MS0yLWJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tLwoKSSd2ZSBtZXJnZWQgdGhlIGltbXV0YWJsZSBicmFuY2ggYW5kIHRoZSB0
aHJlZSByZW1haW5pbmcgcGF0Y2hlcy4KClRoZXkgd2lsbCBhcHBlYXIgaW4gbGludXgtbmV4dCB0
b21vcnJvdy4KClRoYW5rcwoKICAtLSBEYW5pZWwKCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5v
cmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZv
bGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNl
Ym9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6
Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
