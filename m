Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7179F7E5948
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Nov 2023 15:39:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22EC5C6B44D;
	Wed,  8 Nov 2023 14:39:15 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91381C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Nov 2023 14:39:13 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-da0359751dbso833196276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Nov 2023 06:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699454352; x=1700059152;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PQU3hqMMYcYs/SCmGDlKPzxbDtOph1I+oD4U8+UogTs=;
 b=y8NQcTh4MGqt+OnGTCsnPDxPGI04njNNmhy/hm+IAxRuyDmzul1zs7YMZ2zAa7vKsp
 FLlC5HQyvSPjzxg6aR9SdB4N3qoVrop7UVPy2cko47ZErLrbxcqWi+OaqWzdD8qm35YP
 xDDOiMWaQGiyI22UQhZ2mLkMOQXql9cbxXonq645p+IlI/D1Su3t6IkBnVG85Zwq0bL/
 w+efvzYnsY/zBGS0QXz3/370uJwmjMQpo2wcGPy1It++DH215mzLUVznzENGDfwE+BbE
 m1dnvjaUe6lRbL/AiLXPp6ENHz79bX80QvG4izSaJgJl6BAvzMfhTVBO2XUpAtYb8a9W
 x7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699454352; x=1700059152;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PQU3hqMMYcYs/SCmGDlKPzxbDtOph1I+oD4U8+UogTs=;
 b=hBoFk61AR5UYgEoSiEo7W9lWOF0p69Vzbu8Wl3mViiV51EtkFmBwiyUmVKVMUpztTH
 nyNDxWSA/lzO6fQemGccJ2UsnWPl8DVXcNUdwUMSL3cScYLrt9TXg46aH2cfiwttOuTc
 mgngoXdqwFBM4VfdsgsjX+bjj499LRyFGj9Hisbw3TcUHKwpLysYWmjOUJpamXPFgjMI
 1qvb1xpEtKTiLYRAJYrfr5HdoB/68xml09kAn2n9BORa+JZSCj6Lw0PnrUKHQqcmatfQ
 crPpeBPaWciJDKp9cOX/stPncjyF+JIY55EdL81PntQ3E4mv0s/tVGms61ujfQY8ZBzh
 C2Wg==
X-Gm-Message-State: AOJu0YxTXtYbQSW2uRAgwmGtkz7tyTLBRmYJLrTj56ySNFlEc5JGlzen
 Pc7ihwuBlK6Wow+J38g6pPn62kJ+knXYU/eWbBvC3Q==
X-Google-Smtp-Source: AGHT+IFTCIwDBjEMYpwNJ8pCD6O9DyvdbbX4a7hqAkZOe5VRqRtPaWWQozp69ojbFtC4cQ7kVpXUNe0BHNJc/LPtYy4=
X-Received: by 2002:a25:aa73:0:b0:da3:f2c0:dcd4 with SMTP id
 s106-20020a25aa73000000b00da3f2c0dcd4mr1399160ybi.9.1699454352307; Wed, 08
 Nov 2023 06:39:12 -0800 (PST)
MIME-Version: 1.0
References: <20231108141637.119497-1-yann.gautier@foss.st.com>
In-Reply-To: <20231108141637.119497-1-yann.gautier@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 8 Nov 2023 15:39:00 +0100
Message-ID: <CACRpkda+JjXKO-HS4XHciiTm6GfViCV1vLQ8T1VNtNzK=qe3hA@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Yang Yingliang <yangyingliang@huawei.com>,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Subject: Re: [Linux-stm32] [PATCH v3] mmc: mmci: stm32: add SDIO in-band
	interrupt mode
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

T24gV2VkLCBOb3YgOCwgMjAyMyBhdCAzOjE44oCvUE0gWWFubiBHYXV0aWVyIDx5YW5uLmdhdXRp
ZXJAZm9zcy5zdC5jb20+IHdyb3RlOgoKPiBGcm9tOiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlz
dG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbT4KPgo+IEFkZCB0aGUgc3VwcG9ydCBvZiBTRElPIGlu
LWJhbmQgaW50ZXJydXB0IG1vZGUgZm9yIFNUTTMyIGFuZCBVeDUwMAo+IHZhcmlhbnRzLgo+IEl0
IGFsbG93cyB0aGUgU0QgSS9PIGNhcmQgdG8gaW50ZXJydXB0IHRoZSBob3N0IG9uIFNETU1DX0Qx
IGRhdGEgbGluZS4KPiBJdCBpcyBub3QgZW5hYmxlZCBieSBkZWZhdWx0IG9uIFV4NTAwIHZhcmlh
bnQgYXMgdGhpcyBpcyB1bnN0YWJsZSBhbmQKPiBVeDUwMCB1c2VycyBzaG91bGQgdXNlIG91dC1v
Zi1iYW5kIElSUXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlz
dG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEdhdXRpZXIg
PHlhbm4uZ2F1dGllckBmb3NzLnN0LmNvbT4KClN0aWxsIGxvb2tzIGdvb2QgdG8gbWUhClJldmll
d2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywK
TGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
