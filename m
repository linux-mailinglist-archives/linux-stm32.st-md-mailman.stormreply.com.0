Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F18F4CF4C52
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 17:42:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6479C57A51;
	Mon,  5 Jan 2026 16:42:27 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49C9EC56612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 16:42:26 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47d3ba3a4deso732835e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jan 2026 08:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767631345; x=1768236145;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OyCREwze6wuRU2UsbFO8TEdIlanzdvvtH1ABUGO9pDk=;
 b=LHwjkpxuaenxt4UykALTJWR+ETVD2oBTpUomoYq52vnL2IY8P6Nwf+D/RZy7tc9eBp
 IbogNaXawb0YlRMcve8FY/5N7YKKobf0w/nNoZghsX0ZDBHMHcsxBRzrPbrG+uxfzMgG
 guEIsk49FU1OOWp4tdUr6av/QTlKqV7jOCoNEPiNf998rFurSq0v0MqRtALFE34WRFZG
 6mL872drogPBycMHW3hVRreSLSVz3mgFE3kFmVJBDIQAHjM8/EYiWxxvrm2Wf+JBbm3f
 5ia7ZLousgB4l0HLqIDgI2MPQD2tqXQmHjprxGJ3LoNsquV86B10AchDPGMgF/wSs2lo
 nSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767631345; x=1768236145;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OyCREwze6wuRU2UsbFO8TEdIlanzdvvtH1ABUGO9pDk=;
 b=j3WvKkDvcZ1/uW1vnVA5LAsuX8OLEz9m41X3Kv55gj5zWTTotEo+IISDHYERh8Zwf/
 F2cMfsATXEP+RH6L/ahmqyrMfiHLcJvzrN1YG6/CQMECND8slkenUw8YiMcPso859sqD
 8DQdEZnG69mh+fzO6lbRCoAgurg1jxNYo96BAL7J+MToCccBmjDh2E/Toe4Frmks06s5
 sfYajGCrgJ2s1Kcus4+cOdITNgWY1UKuOeTIi4iH7QEJZ1il/6L9h/3MuzbM8JDkmVCb
 Fqrh8gKnkeLUw83mhpCOmXzyQmvbBY+hkQsEy2gGbACvRoSnME9ZIZl+1rX7TamTEFy8
 WZCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCrPJlyQuMKIzCm8g7ouL0kZZYqOlyi+/qHEG+6WiuiTS8RcOv8nfnu4Ld8MXJLgrH3Ml5pf8hAp8kaw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzx5UpOO8HBPMI1EwDLM8eZvU3dHYqs14PItGD9ehIob9zc0tVP
 IrA90+4819ts80I6aO48fohMYOk4edwx2IefxmSnNguebKyj3XH8MkH0
X-Gm-Gg: AY/fxX5/TBxwoLRLv7cKbe+TvxbqwprwTO8rTENovYawxBSoQetf/K61GAf+rBNLTFc
 dyEBh7kRlp3FUYQ0Jzk+osnQv31IqZkEMVdSYI3gLSHxgYS31e9PnwpXKr0OCbi/KvMJb6fDLH7
 CWaHLAL1E+OMYo2Qe0hwjGOX8OWemo3Wb7ucdxrlRNUSTfoNvZgwLDfP2118qIaArh32FmOunVz
 amnrl3HaGFRQyHHOqHeSKuhEgU1etApE75Wsqc4sSH3QVP7E3rihek7TD4Ke0CDS79c7w9XrSkY
 Dj3LhXKpPz7h4cZv5a1gOubReF/dAfQbZxjtlhhwvW3ZfUk5Xj2EjQ1trhuguGbiz/0syvYoYxF
 Wi1sNtcnb1QsRHBVIQBdFZgRrOqMzk/E+WV7q1S4xJeoLNTNukDRx+rjIu18IerinmrIrzNxecx
 TQ2ZB9MlrJuI0=
X-Google-Smtp-Source: AGHT+IE/JjorzXLwwkJgsbApvm+a3QMCRUUp3o9LGdUjHP2iI1zq9V8yb9BydDK6HAKwFcoQXH8UFg==
X-Received: by 2002:a05:600c:1c29:b0:46e:37a7:48d1 with SMTP id
 5b1f17b1804b1-47d1959d4bamr704429525e9.34.1767631345377; 
 Mon, 05 Jan 2026 08:42:25 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:20bb:19ed:fbb2:7e2d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bca532c6sm442805f8f.27.2026.01.05.08.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 08:42:24 -0800 (PST)
Date: Mon, 5 Jan 2026 17:42:23 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aVvp70S2Lr3o_jyB@eichest-laptop>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, robh@kernel.org, festevam@gmail.com,
 s.hauer@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 francesco.dolcini@toradex.com, andrew+netdev@lunn.ch, edumazet@google.com,
 kernel@pengutronix.de, netdev@vger.kernel.org, kuba@kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, pabeni@redhat.com,
 shawnguo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND net-next v2] net: stmmac: dwmac:
 Add a fixup for the Micrel KSZ9131 PHY
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

SGkgQW5kcmV3LAoKT24gTW9uLCBKYW4gMDUsIDIwMjYgYXQgMDQ6MjY6NDBQTSArMDEwMCwgQW5k
cmV3IEx1bm4gd3JvdGU6Cj4gPiBVbmZvcnR1bmF0ZWx5LCBJJ20gYWZyYWlkIG9mIGJyZWFraW5n
IHNvbWV0aGluZyBvbiB0aGUgcGxhdGZvcm1zCj4gPiB0aGF0IGFyZSBhbHJlYWR5IHdvcmtpbmcs
IGFzIHRoaXMgaXMgYW4gRXRoZXJuZXQgY29udHJvbGxlcgo+ID4gaXNzdWUuIEFzIEkgdW5kZXJz
dGFuZCBpdCwgdGhlIFBIWSB3b3JrcyBhY2NvcmRpbmcgdG8gdGhlIHN0YW5kYXJkLgo+IAo+IFdo
YXQgaXMgdGhlIGV4YWN0IHdvcmRpbmcgb2YgdGhlIHN0YW5kYXJkPyBJJ20gYXNzdW1pbmcgdGhp
cyBpcyBJRUVFCj4gODAyLjM/ICBQbGVhc2UgY291bGQgeW91IHF1b3RlIHRoZSByZWxldmFudCBw
YXJ0LgoKWWVzIHRoaXMgaXMgY29ycmVjdC4gRVJSMDUwNjk0IGZyb20gTlhQIHN0YXRlczoKVGhl
IElFRUUgODAyLjMgc3RhbmRhcmQgc3RhdGVzIHRoYXQsIGluIE1JSS9HTUlJIG1vZGVzLCB0aGUg
Ynl0ZQpwcmVjZWRpbmcgdGhlIFNGRCAoMHhENSksIFNNRC1TICgweEU2LDB4NEMsIDB4N0YsIG9y
IDB4QjMpLCBvciBTTUQtQwooMHg2MSwgMHg1MiwgMHg5RSwgb3IgMHgyQSkgYnl0ZSBjYW4gYmUg
YSBub24tUFJFQU1CTEUgYnl0ZSBvciB0aGVyZSBjYW4KYmUgbm8gcHJlY2VkaW5nIHByZWFtYmxl
IGJ5dGUuIFRoZSBNQUMgcmVjZWl2ZXIgbXVzdCBzdWNjZXNzZnVsbHkKcmVjZWl2ZSBhIHBhY2tl
dCB3aXRob3V0IGFueSBwcmVhbWJsZSgweDU1KSBieXRlIHByZWNlZGluZyB0aGUgU0ZELApTTUQt
Uywgb3IgU01ELUMgYnl0ZS4KSG93ZXZlciBkdWUgdG8gdGhlIGRlZmVjdCwgaW4gY29uZmlndXJh
dGlvbnMgd2hlcmUgZnJhbWUgcHJlZW1wdGlvbiBpcwplbmFibGVkLCB3aGVuIHByZWFtYmxlIGJ5
dGUgZG9lcyBub3QgcHJlY2VkZSB0aGUgU0ZELCBTTUQtUywgb3IgU01ELUMKYnl0ZSwgdGhlIHJl
Y2VpdmVkIHBhY2tldCBpcyBkaXNjYXJkZWQgYnkgdGhlIE1BQyByZWNlaXZlci4gVGhpcyBpcwpi
ZWNhdXNlLCB0aGUgc3RhcnQtb2YtcGFja2V0IGRldGVjdGlvbiBsb2dpYyBvZiB0aGUgTUFDIHJl
Y2VpdmVyCmluY29ycmVjdGx5IGNoZWNrcyBmb3IgYSBwcmVhbWJsZSBieXRlLgoKTlhQIHJlZmVy
cyB0byBJRUVFIDgwMi4zIHdoZXJlIGluIGNsYXVzZSAzNS4yLjMuMi4yIFJlY2VpdmUgY2FzZSAo
R01JSSkKdGhleSBzaG93IHR3byB0YWJsZXMgb25lIHdoZXJlIHRoZSBwcmVhbWJsZSBpcyBwcmVj
ZWRpbmcgdGhlIFNGRCBhbmQgb25lCndoZXJlIGl0IGlzIG5vdC4gVGhlIHRleHQgc2F5czoKVGhl
IG9wZXJhdGlvbiBvZiAxMDAwIE1iL3MgUEhZcyBjYW4gcmVzdWx0IGluIHNocmlua2FnZSBvZiB0
aGUgcHJlYW1ibGUKYmV0d2VlbiB0cmFuc21pc3Npb24gYXQgdGhlIHNvdXJjZSBHTUlJIGFuZCBy
ZWNlcHRpb24gYXQgdGhlIGRlc3RpbmF0aW9uCkdNSUkuIFRhYmxlIDM14oCTMyBkZXBpY3RzIHRo
ZSBjYXNlIHdoZXJlIG5vIHByZWFtYmxlIGJ5dGVzIGFyZSBjb252ZXllZAphY3Jvc3MgdGhlIEdN
SUkuIFRoaXMgY2FzZSBtYXkgbm90IGJlIHBvc3NpYmxlIHdpdGggYSBzcGVjaWZpYyBQSFksIGJ1
dAppbGx1c3RyYXRlcyB0aGUgbWluaW11bSBwcmVhbWJsZSB3aXRoIHdoaWNoIE1BQyBzaGFsbCBi
ZSBhYmxlIHRvCm9wZXJhdGUuIFRhYmxlIDM14oCTNCBkZXBpY3RzIHRoZSBjYXNlIHdoZXJlIHRo
ZSBlbnRpcmUgcHJlYW1ibGUgaXMKY29udmV5ZWQgYWNyb3NzIHRoZSBHTUlJLgoKV2Ugd291bGQg
Y2hhbmdlIHRoZSBiZWhhdmlvciBmcm9tICJubyBwcmVhbWJsZSBpcyBwcmVjZWRpbmcgU0ZEIiB0
byAidGhlCmVuaXRyZSBwcmVhbWJsZSBpcyBwcmVjZWRpbmcgU0ZEIi4gQm90aCBhcmUgbGlzdGVk
IGluIHRoZSBzdGFuZGFyZCBhbmQKc2hhbGwgYmUgc3VwcG9ydGVkIGJ5IHRoZSBNQUMuCgpJIGhv
cGUgdGhpcyBoZWxwcy4KClJlZ2FyZHMsClN0ZWZhbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
