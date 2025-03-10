Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACC8A5942D
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 13:24:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2AF4C7802E;
	Mon, 10 Mar 2025 12:24:34 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31F76C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 12:24:33 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e53a91756e5so3190922276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 05:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1741609472; x=1742214272;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ND2kqJOrUJ4yzGsa9gnO+yqtj6hclSewbFNs2ty9z4=;
 b=BhWHZ+is5UC5q7LFYBbx4j0zHzXvEN/fR00atjxNG6XH9dDNyKIRCy2YFQ5kMtylBW
 t47S6lAz7+J7MUeXp0kqrvJuQjXfG1NswUUQu1TedYhiArNG9P9qxW2payjaUBMaCtAz
 212Rg4y95z73WkoOaAvd0wrEJdMIzz2M4Zm/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741609472; x=1742214272;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ND2kqJOrUJ4yzGsa9gnO+yqtj6hclSewbFNs2ty9z4=;
 b=Md1jfvBSwziF1UYr/GDcKiojhQYESMpgIxL47+1bXuJY/ToRtzuaZY7N/zZZsa4zcO
 X0gb6Q2YHdHjzZ2j9IF/kohmgSuX+MDc1N1snr6tvCr1m8DTAvj+CvmqbR7LBASzuO4w
 8pUzZ0IEx9aHsVM67Kalf7TOEKF9DyRYnbmtrqoA+eP4e1SHv69eJrpF9YflSqqUDwCN
 cZZ6AE6EXN+fY/UwOSQLXPwmAuXSNc4DinS1EM7ttQzJLNK8nRQPUBkOxIhzcv7Ws8wW
 f+7fS6GzUTROtwAyo3KQjJHlOmaH3T46kcoOXh8YqgL5q3IA13kf/zleHjwuGnPLtwKt
 Jpow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzzoLQo2veAUzg0nfEc+JVswT8QUm8zQGkkHVUFxL7e/91Jn2Uv+yvZmDLSFjIUzw8tpP11O1z3AZq6A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwZlJMymCwQZWOnEwuU4hoSQgV5eD35I1w6uQv+z+kqnxr/uAWd
 L7F0PTVSjL0ikNIY0LJmcVglJdH1N8/LF+f4HTm4AAbd9+OC773BOi+pqF4QSQxEt18EaLrYEcd
 c0jE/XywdBLO9eIzezprUvrg8xu3XE82ToO6TgA==
X-Gm-Gg: ASbGncvd+2n3kKVPJVwnOdPGPP4PdzFDNKYO6/rfCtxcLRJGod6ESdcDgaETZXWEYr3
 uE6rhqrNGQveBe8NIZapvgbK/LySe6TS8UIMWeCW3VI2io/nzRzKFHUoun/FTpgzfuI+Nmb+bZL
 EY1FYUfmJnBDihvFTrWWrd3bkkkZ61
X-Google-Smtp-Source: AGHT+IH0tHXGp9UeHGxfrLbUzZnkh/DxT1q5vNyoFPhPKc+dkvw3h1KG8wG9Fqv0xSyH4YITslHYsvlvq709Vj41Cn4=
X-Received: by 2002:a05:6902:3388:b0:e5d:bcc5:c33a with SMTP id
 3f1490d57ef6-e635c1dbebdmr14201756276.43.1741609472105; Mon, 10 Mar 2025
 05:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250301115116.2862353-1-dario.binacchi@amarulasolutions.com>
 <e5a5dd9b-475b-4c66-a580-08f11a80e5a3@foss.st.com>
In-Reply-To: <e5a5dd9b-475b-4c66-a580-08f11a80e5a3@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 10 Mar 2025 13:24:18 +0100
X-Gm-Features: AQ5f1Jpjge_vQvtcg2fYtLcCxKDZuRZi6uFbkDzRqCoH-Q0HlGPggWhyZjwoZak
Message-ID: <CABGWkvpM+MbC=W1Z2yVnQiCXznVKXXv6ijn0dw8AGup8Wuyh0Q@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: use
	IRQ_TYPE_EDGE_FALLING on stm32mp157c-dk2
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

SGkgQWxleGFuZHJlLAoKT24gTW9uLCBNYXIgMTAsIDIwMjUgYXQgMTE6NTDigK9BTSBBbGV4YW5k
cmUgVE9SR1VFCjxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPiB3cm90ZToKPgo+IEhpIERh
cmlvCj4KPiBPbiAzLzEvMjUgMTI6NTEsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+ID4gUmVwbGFj
ZSB0aGUgbnVtYmVyIDIgd2l0aCB0aGUgYXBwcm9wcmlhdGUgbnVtZXJpY2FsIGNvbnN0YW50IGRl
ZmluZWQgaW4KPiA+IGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxh
c29sdXRpb25zLmNvbT4KPiA+Cj4gPiAtLS0KPiA+Cj4gPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0
L3N0bTMybXAxNTdjLWRrMi5kdHMgfCAzICsrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0L3N0bTMybXAxNTdjLWRrMi5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0z
Mm1wMTU3Yy1kazIuZHRzCj4gPiBpbmRleCA1ZjljMDE2MGE5YzQuLmRjZjE3YzQ5MzAyMiAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWRrMi5kdHMKPiA+
ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLWRrMi5kdHMKPiA+IEBAIC0x
MSw2ICsxMSw3IEBACj4gPiAgICNpbmNsdWRlICJzdG0zMm1wMTUtcGluY3RybC5kdHNpIgo+ID4g
ICAjaW5jbHVkZSAic3RtMzJtcDE1eHhhYy1waW5jdHJsLmR0c2kiCj4gPiAgICNpbmNsdWRlICJz
dG0zMm1wMTV4eC1ka3guZHRzaSIKPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0
LWNvbnRyb2xsZXIvaXJxLmg+Cj4KPiByZWFsbHkgbmVlZGVkID8gYXMgaXQgY29tZXMgYWxzbyB3
aXRoCj4gZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oCgp5ZXMsIHlv
dSBhcmUgcmlnaHQ6CiAgICAgICAgIHN0bTMybXAxNTdjLWRrMi5kdHMKICAgICAgICAgLS0+IHN0
bTMybXAxNTcuZHRzaQogICAgICAgICAgICAgICAtLT4gc3RtMzJtcDE1My5kdHNpCiAgICAgICAg
ICAgICAgICAgICAgIC0tPiBzdG0zMm1wMTUxLmR0c2kKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4K
CkknbGwgc3VibWl0IHYyLgoKVGhhbmtzIGFuZCByZWdhcmRzCkRhcmlvCj4KPiA+ICAgLyB7Cj4g
PiAgICAgICBtb2RlbCA9ICJTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzJNUDE1N0MtREsyIERpc2Nv
dmVyeSBCb2FyZCI7Cj4gPiBAQCAtNjcsNyArNjgsNyBAQCAmaTJjMSB7Cj4gPiAgICAgICB0b3Vj
aHNjcmVlbkAzOCB7Cj4gPiAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZm9jYWx0ZWNoLGZ0
NjIzNiI7Cj4gPiAgICAgICAgICAgICAgIHJlZyA9IDwweDM4PjsKPiA+IC0gICAgICAgICAgICAg
aW50ZXJydXB0cyA9IDwyIDI+Owo+ID4gKyAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDIgSVJR
X1RZUEVfRURHRV9GQUxMSU5HPjsKPiA+ICAgICAgICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9
IDwmZ3Bpb2Y+Owo+ID4gICAgICAgICAgICAgICB0b3VjaHNjcmVlbi1zaXplLXggPSA8NDgwPjsK
PiA+ICAgICAgICAgICAgICAgdG91Y2hzY3JlZW4tc2l6ZS15ID0gPDgwMD47CgoKCi0tIAoKRGFy
aW8gQmluYWNjaGkKClNlbmlvciBFbWJlZGRlZCBMaW51eCBEZXZlbG9wZXIKCmRhcmlvLmJpbmFj
Y2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCgoKQW1hcnVsYSBTb2x1dGlvbnMgU1JMCgpWaWEgTGUgQ2FuZXZhcmUgMzAsIDMxMTAwIFRy
ZXZpc28sIFZlbmV0bywgSVQKClQuICszOSAwNDIgMjQzIDUzMTAKaW5mb0BhbWFydWxhc29sdXRp
b25zLmNvbQoKd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
