Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3C3853131
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 14:03:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23091C6DD69;
	Tue, 13 Feb 2024 13:03:43 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBDE0C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 13:03:41 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-411d2836b20so613605e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 05:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707829421; x=1708434221;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C5NrW5FTTwB3Xw2yt6Nvx3f3s8HF+s3K3TJHJX5IeCg=;
 b=jzNjwXjgDwRYvkT/+CDTs9nqP2B6pR1tH5A5J6nZxzmfH7w8wgVswDB5fKuEz0ritM
 H/2guKaTD3d1QC/p1wilCTKErULiF6GuVFMSwTAvK8lJg4Yz7mJERgYJ5E3fbe9UO09N
 sw9RKO8BVjUOtGTVXxR3wmS+pAD0vTrDJGzo6rhER2C+Sq8q+dFV5QYHTCaFga+31f94
 IT47KEi1qZ+ntTbmQkVP3YVPUYTTjp/JOCROT3CQcYKK1YJ/2A9SZSpFuLGv5lcvcz7L
 vWVrKCm/FQ7EjM03Q93UBPc4fwI4GClsgFaH+0WZsrqynFf/vzAqNSdIEod70YV/ApOV
 7qEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707829421; x=1708434221;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C5NrW5FTTwB3Xw2yt6Nvx3f3s8HF+s3K3TJHJX5IeCg=;
 b=sgDFY86n/FdSCnbTKWhTXWpw6g3+GdR3mebhspIfiCYudKNiQpuDN5atGQaGGZLpDB
 qcPiG/RLRq0n13Fzv18RnMu0dr4Am47flVBduB9tHSw45tLg1lfuev1+XGTNcXkAN1k1
 CXxZgDH1xBuDCW1Mqbw94HZbUTZKft2vMg62o2FJKERo/k58m6vmEbulg4PfgLuZpF0D
 ikGkd4tVHiE2nFZs/2e4upMGdPV8X83zyag7wBrxrd6CkPyfpogVDoWDpd5bNeT4iEZj
 DvRzC9tF/niJ5gXwu+H2UaxmpOxTlfEbEdQn9MivXr/3PwIDW94fZZiH1DPcB7M2z4As
 cqNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR0JRLmykUitjv0MRRvH/7BFWxWzIGmlUBJ5Ez0DV2MOkkGFpNE/nTcCHIQs7TnRzQ8ZrgrcxwCSf/+be1DttNwBPRz9UIjuVFahetiDcm5Qlwg4Bo1nRq
X-Gm-Message-State: AOJu0Yzw22y9FK0tgUlZCHAPwghZepkAaZVqU7xt8lS5B+ASKv3N9uc3
 x3KF1e/uryuUr3stn/yZlMt3rYWDD6LdgwPKjSvgVJqOQ18A/17P6H649ylLLBs=
X-Google-Smtp-Source: AGHT+IGff4Ny4f1WeJGCs+3nuZxbToyUFx8GempT/EH0khCzbnM4pZaGfiEmTfd7EjnRLIAX3EhG9A==
X-Received: by 2002:a05:600c:3b86:b0:40f:fe1a:6baf with SMTP id
 n6-20020a05600c3b8600b0040ffe1a6bafmr6994110wms.1.1707829421015; 
 Tue, 13 Feb 2024 05:03:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW7CtLuect2QEqcymxQGaUVmVCPIyY1NdHNUpoLLZHXRt9+n/gP+2I6mH9ctZZlAnwNCbloiXyQRv9bQh+MF5UWYu1yRjChSKHqVrHw8wnHuac0mRrY1Gj7p9X/s2YJDdaZ5mSMdtRpTNTm6GaISrpY1EQpQ+b6t1VrU+0xsYEm8bwBlZmUtkBNxcN5vVx20fwpOp6xICEzXAypqtVuaZoL/C7RzpDGn+aRrdZJieEGE/btmHIpyWNcL8dPDbdkE8zLdibnJa5m/CcTl5lC/oHHy7v52s8tA4V/zcBwIUUbmI6eks6zokE63AeiPVHcU/UGEAIWk/7/kuIk0ephB0BuEVIm1+vtMFWk90ZljITNTf6YVyg8QHCbvqwL32VOUlerYK0QGoRBeACZD4ijWSgdiWGABW9JkLNzK2MF7xv8iD1PQ7UAJbJm7BmmVaQNK2/vhxQEhb2tnJPR3PkbKensFAb7wKFZMGtBXV+dO9zdpn45vC/xXjXkxs3ARiFVNyjydEOvQ/kTHjVgNzVLqhb+6wlM10wrJpW05sV9e6HW7jIbKVqZEhMyh2DAWiDqr1yk/Vz2S1lDfjL7K1XkIc4+OPQqqWfxcskmUJmbbFBkWgqVQP/AGwqU50T0L4psZXPemJdpkXwoyOU=
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 v1-20020a05600c214100b00410395dc7d1sm11615850wml.7.2024.02.13.05.03.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 05:03:40 -0800 (PST)
Message-ID: <6092ee3a-4a28-488b-97fe-538e619f8983@linaro.org>
Date: Tue, 13 Feb 2024 14:03:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
References: <20231115212908.33131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8tN-qn8zuimte=-riahJBWGgGi8i5botNfWqdWwJ7w-4g@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CA+V-a8tN-qn8zuimte=-riahJBWGgGi8i5botNfWqdWwJ7w-4g@mail.gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: timer: renesas: ostm:
	Document RZ/Five SoC
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

T24gMTMvMDIvMjAyNCAxMToyMiwgTGFkLCBQcmFiaGFrYXIgd3JvdGU6Cj4gSGkgRGFuaWVsLAo+
IAo+IE9uIFdlZCwgTm92IDE1LCAyMDIzIGF0IDk6MjnigK9QTSBQcmFiaGFrYXIgPHByYWJoYWth
ci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gRnJvbTogTGFkIFByYWJoYWthciA8cHJh
Ymhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+Pgo+PiBUaGUgT1NUTSBibG9j
ayBvbiB0aGUgUlovRml2ZSBTb0MgaXMgaWRlbnRpY2FsIHRvIG9uZSBmb3VuZCBvbiB0aGUgUlov
RzJVTAo+PiBTb0MuICJyZW5lc2FzLHI5YTA3ZzA0My1vc3RtIiBjb21wYXRpYmxlIHN0cmluZyB3
aWxsIGJlIHVzZWQgb24gdGhlIFJaL0ZpdmUKPj4gU29DIHNvIHRvIG1ha2UgdGhpcyBjbGVhciBh
bmQgdG8ga2VlcCB0aGlzIGZpbGUgY29uc2lzdGVudCwgdXBkYXRlIHRoZQo+PiBjb21tZW50IHRv
IGluY2x1ZGUgUlovRml2ZSBTb0MuCj4+Cj4+IE5vIGRyaXZlciBjaGFuZ2VzIGFyZSByZXF1aXJl
ZCBhcyBnZW5lcmljIGNvbXBhdGlibGUgc3RyaW5nICJyZW5lc2FzLG9zdG0iCj4+IHdpbGwgYmUg
dXNlZCBhcyBhIGZhbGxiYWNrIG9uIFJaL0ZpdmUgU29DLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBM
YWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4+
IC0tLQo+PiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1lci9yZW5lc2Fz
LG9zdG0ueWFtbCB8IDIgKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPj4KPiBHZW50bGUgcGluZyEKCkFwcGxpZWQsIHRoYW5rcyBmb3IgdGhlIGhl
YWQgdXAKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBz
b3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cu
ZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29t
LyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJs
b2cvPiBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
