Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A47A7B5416
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 15:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BEF2C6C83A;
	Mon,  2 Oct 2023 13:37:14 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BE00C6B456
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 12:35:34 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-537f07dfe8eso11228a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 05:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696250134; x=1696854934;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=869N3vyS+ZVqQWUeBDSfQ2c9Aluwujb0eSJXyHR6CZo=;
 b=lm8ZVr3h8FOGPSNE1HJ6zt+eyQbDTtVhV6TFQYXHfV0Zd4ht9q/zZCttzGkMaZM4xW
 NwDkHDz34EelwhAi7Fy00Q7He73W2Ynz7ZBX2uule/HVMMsmnQJ/oXbjsPZnlPIMR8Vo
 u++4S1CJIJuoFCcq4xKORCN1wzwz7fS/fALKi4KeJ3nDEArhoBfoRxbp6cdhibh5jRn4
 quQ8Ofm6U2ysUMvtZuOVDDadUngQKOMB7x6xhWn5G36ej/pIFN3QC7QZSwGBjlwlQmoM
 1tO2+H/taitmZheLmPNOq8YPHxsKWgifzoMfgWQPVo+1idYjsvEbBf9zSUCbiGfDeyz2
 AJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696250134; x=1696854934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=869N3vyS+ZVqQWUeBDSfQ2c9Aluwujb0eSJXyHR6CZo=;
 b=IrPqBiyU0a5ODVCUxcwCN8xqynVlKinkckvwSD8WZr0y3KDYIn4YcnxjTf0DfB4I3l
 GELtiSe3qn0gJxpnSWmvVQ+RyLIYWq2eEGgetYGetWH5cMXHTHIDvHV7suDNGBSqtqqv
 WrOMNkNQuPMtP2lnus6+6kXFkUdgoWi9ajwYbQrvtXFz1Az5OkiUuezUH/qSFKDCjIHa
 mene6QBZSsYFWE0yBMQ8dfDuZx98xHnsf27glyuOuPJwVGyBEdNgT0/uPqyPGZHPPYcU
 JwVkjoyTHfLYZb4xu/Y3mLMcHxXipTrSCS33jf2jjJ2qx2sVjAmcJeVLGoETdHQfnhNy
 40nA==
X-Gm-Message-State: AOJu0YwxtFK+roPfaGCEnvnrRBSEHiL17bDQl4Z+5lad6YZq5QnEBpBz
 clkVMSpkHIas5HFo6KHa5/5h+3Xztr9jhnlV+aCdqg==
X-Google-Smtp-Source: AGHT+IH2qkgyc3P3wrgTwRHmjGqihfZX/MS1d01+bMZCjuJ/E8bglfxeD1d64wEbHjO/Ut60Cr8v+8J4PFD889cPxno=
X-Received: by 2002:a50:c30f:0:b0:525:573c:643b with SMTP id
 a15-20020a50c30f000000b00525573c643bmr97048edb.7.1696250133829; Mon, 02 Oct
 2023 05:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230922111247.497-1-ansuelsmth@gmail.com>
 <CANn89iJtrpVQZbeAezd7S4p_yCRSFzcsBMgW+y9YhxOrCv463A@mail.gmail.com>
 <65181064.050a0220.7887c.c7ee@mx.google.com>
 <CANn89iJqkpRu8rd_M7HCzaZQV5P_XTCzbKe5DOwnJkTRDZWEWw@mail.gmail.com>
 <651ab7b8.050a0220.e15ed.9d6a@mx.google.com>
In-Reply-To: <651ab7b8.050a0220.e15ed.9d6a@mx.google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 2 Oct 2023 14:35:22 +0200
Message-ID: <CANn89iJqFC-Z3NZwT+CXEG7R9rc9g4LRwNm6Zm=nZKpD3Mon7Q@mail.gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
X-Mailman-Approved-At: Mon, 02 Oct 2023 13:37:12 +0000
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>,
 Jiri Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH 1/3] net: introduce
	napi_is_scheduled helper
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

T24gTW9uLCBPY3QgMiwgMjAyMyBhdCAyOjI54oCvUE0gQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3Vl
bHNtdGhAZ21haWwuY29tPiB3cm90ZToKCj4gRWhoaCB0aGUgaWRlYSBoZXJlIHdhcyB0byByZWR1
Y2UgY29kZSBkdXBsaWNhdGlvbiBzaW5jZSB0aGUgdmVyeSBzYW1lCj4gdGVzdCB3aWxsIGJlIGRv
bmUgaW4gc3RtbWFjLiBTbyBJIGd1ZXNzIHRoaXMgY29kZSBjbGVhbnVwIGlzIGEgTkFDSyBhbmQK
PiBJIGhhdmUgdG8gZHVwbGljYXRlIHRoZSB0ZXN0IGluIHRoZSBzdG1tYWMgZHJpdmVyLgoKSSBz
aW1wbHkgd2FudGVkIHRvIGFkZCBhIGNvbW1lbnQgaW4gZnJvbnQgb2YgdGhpcyBmdW5jdGlvbi9o
ZWxwZXIsCmFkdmlzaW5nIG5vdCB1c2luZyBpdCB1bmxlc3MgYWJzb2x1dGVseSBuZWVkZWQuCgpU
aHVzIG15IHF1ZXN0aW9uICJJbiB3aGljaCBjb250ZXh0IGlzIGl0IHNhZmUgdG8gY2FsbCB0aGlz
IGhlbHBlciA/IgoKQXMgbG9uZyBhcyBpdCB3YXMgcHJpdmF0ZSB3aXRoIGEgZHJpdmVyLCBJIGRp
ZCBub3QgbWluZC4KCkJ1dCBpZiBtYWRlIHB1YmxpYyBpbiBpbmNsdWRlL2xpbnV4L25ldGRldmlj
ZS5oLCBJIHdvdWxkIHJhdGhlciBub3QKaGF2ZSB0byBleHBsYWluCnRvIGZ1dHVyZSB1c2VycyB3
aHkgaXQgY2FuIGJlIHByb2JsZW1hdGljLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
