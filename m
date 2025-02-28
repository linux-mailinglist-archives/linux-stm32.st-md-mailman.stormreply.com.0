Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FB1A494DE
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Feb 2025 10:26:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B54FC6DD9F;
	Fri, 28 Feb 2025 09:26:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAF91C6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2025 09:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740734791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qyXnd1QeVCFR0UPHxNUE8dIZREv7JdUyyVgv52l4qOU=;
 b=UYNod2c+slSS1SIUAQ8vVaDricIAhMAu5usd6PZetMZtKbns2gg82GAzn7V2eQBvxj9eLY
 q4YxwEKrWz2LBMDztHQWo7HT/cTJTcjjJVHLwD5PLa1pyZ/VthDLGJ1A3umc1VHvwuISO6
 ZSXX/UkLMaryyHg0UIHTVzdzK1k/Em0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-htZIm99RP2GNaXnAk3_jGw-1; Fri, 28 Feb 2025 04:26:27 -0500
X-MC-Unique: htZIm99RP2GNaXnAk3_jGw-1
X-Mimecast-MFC-AGG-ID: htZIm99RP2GNaXnAk3_jGw_1740734786
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43ab5baf62cso13896775e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2025 01:26:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740734786; x=1741339586;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qyXnd1QeVCFR0UPHxNUE8dIZREv7JdUyyVgv52l4qOU=;
 b=IUgpxkH6kjmXxe0Gu6nvlBdHH4a/n1L2ty7OaZ5TXFD1oTO/Sah5Jhvw812WudgkeS
 Mrco7dSqNigA/pWtNrKTsRES3dfxm38qqC7vKWEtnyr77+1DqMqYXilADK5kLO6TWbpP
 eU9ddbUazDKkp9o0lIVG0T3cHThf32TAVI1bx6SQ0Ht5N8L6HBT794PHF5nAVTd3huUE
 bHhk9uqh4Bm6r2yc/N7aUZQigSJH+MegvcPUQTz/Xrzo/z0TwRMY+u3EyQdzvVAPiw4v
 AmKSv8DwntkL5d1m6gQAuJ8bxojSajoCC/nlRJgAvWj8PzQopHl+oU7VcgMgrdMrgii4
 TwNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs943f6iJy+RN84xTjoyjFH/s/N5pX6a5aTDhIsaPE1R+guW31/nK/8UdngRmx4r7fcEe06PyfaHEU1Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwkI7SEdwwuGMSDY2Svvh15vDcGPXCKyzNlOT5wQ6k4krYKPZp6
 xNlEg6xpnb7hqujfHq0slLkXV7JydJkAkY311P+lgu+EBN8VZcn3MOzBhpM6etcF4mqxIpTmSW1
 AEg+hBg1RNE3LRKcMe3YNdH765Cwxsw6aNnkjx4iUKyvkIWvw+tfijM3cqxF2U4voMdUprRIwVk
 JQXA==
X-Gm-Gg: ASbGncvLoQE6W2Md9vIsJHWUTXUgiO9glCJ17PQalbhB+ZusSs5Ud5XrirOg3nATOFN
 XX1gquGTsfGreDHUhq6lGelMrjehCtAENFzBrLwIxZ3y7bcMHKnyjGfwxvC3SzV9wHLPNijKGPQ
 SLp73Xn1gwC+8L1WjB5YhOcbEVVLrtTqKjK7+6Ls5Hws3WXV0608zHM5T3fwEADIvNNjElFw4OW
 I90RpknM8joO/ww3pc7hdWeIMupwdtAf2V+9SlQPRA34e2iBWZNRLD588S9xjzaRonQr1r2+mO4
 CdhU9rUvW7wYPAmJrV+/j+sFgo/HgMDn4gqfCffju9I8JyyyOUpLR175q0DQkEu5GA==
X-Received: by 2002:a05:600c:1c85:b0:439:89d1:30ec with SMTP id
 5b1f17b1804b1-43ba6747587mr20161715e9.29.1740734785952; 
 Fri, 28 Feb 2025 01:26:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrk8HCJDFMTsz7xCP+NNdsyxhZ1X9lB/qPY5M9JGAe9E6mxJhigejXtxTR6plCVUKRLft8mw==
X-Received: by 2002:a05:600c:1c85:b0:439:89d1:30ec with SMTP id
 5b1f17b1804b1-43ba6747587mr20161455e9.29.1740734785589; 
 Fri, 28 Feb 2025 01:26:25 -0800 (PST)
Received: from ?IPv6:2001:16b8:3d09:ac00:a782:635e:5e55:166d?
 ([2001:16b8:3d09:ac00:a782:635e:5e55:166d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b7a27b27bsm49277385e9.31.2025.02.28.01.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 01:26:25 -0800 (PST)
Message-ID: <a7720a091ea02a6bbaa88c7311d7a642f9c7fdff.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>, Philipp Stanner <phasta@kernel.org>
Date: Fri, 28 Feb 2025 10:26:24 +0100
In-Reply-To: <20250227183545.0848dd61@kernel.org>
References: <20250226085208.97891-1-phasta@kernel.org>
 <20250226085208.97891-2-phasta@kernel.org>
 <20250227183545.0848dd61@kernel.org>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M1sd1hGSmFt2-M86kIPjEDRgwk9VBYQXu6fS8g00FoQ_1740734786
X-Mimecast-Originator: redhat.com
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
 Yanteng Si <si.yanteng@linux.dev>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Yinggang Gu <guyinggang@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Henry Chen <chenx97@aosc.io>,
 Qing Zhang <zhangqing@loongson.cn>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/4] stmmac: loongson: Pass
 correct arg to PCI function
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

T24gVGh1LCAyMDI1LTAyLTI3IGF0IDE4OjM1IC0wODAwLCBKYWt1YiBLaWNpbnNraSB3cm90ZToK
PiBPbiBXZWQsIDI2IEZlYiAyMDI1IDA5OjUyOjA1ICswMTAwIFBoaWxpcHAgU3Rhbm5lciB3cm90
ZToKPiA+IHBjaW1faW9tYXBfcmVnaW9ucygpIHNob3VsZCByZWNlaXZlIHRoZSBkcml2ZXIncyBu
YW1lIGFzIGl0cyB0aGlyZAo+ID4gcGFyYW1ldGVyLCBub3QgdGhlIFBDSSBkZXZpY2UncyBuYW1l
Lgo+ID4gCj4gPiBEZWZpbmUgdGhlIGRyaXZlciBuYW1lIHdpdGggYSBtYWNybyBhbmQgdXNlIGl0
IGF0IHRoZSBhcHByb3ByaWF0ZQo+ID4gcGxhY2VzLCBpbmNsdWRpbmcgcGNpbV9pb21hcF9yZWdp
b25zKCkuCj4gPiAKPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnwqAjIHY1LjE0Kwo+ID4g
Rml4ZXM6IDMwYmJhNjlkN2RiNCAoInN0bW1hYzogcGNpOiBBZGQgZHdtYWMgc3VwcG9ydCBmb3Ig
TG9vbmdzb24iKQo+IAo+IFNpbmNlIHlvdSBzZW50IHRoaXMgYXMgYSBmaXggKHdoaWNoLi4geWVh
Li4gSSBndWVzcy4uIHdoeSBub3QuLikKPiBJJ2xsIGFwcGx5IGl0IHRvIHRoZSBmaXhlcyB0cmVl
LiBCdXQgdGhlbiB0aGUgb3RoZXIgcGF0Y2hlcyBoYXZlIAo+IHRvIHdhaXQgYW5kIGJlIHJlcG9z
dGVkIG5leHQgVGh1LiBUaGUgZml4ZXMgYXJlIG1lcmdlZCB3aXRoIG5ldC1uZXh0Cj4gZXZlcnkg
VGh1LCBidXQgc2luY2UgdGhpcyBzZXJpZXMgd2FzIHRhZ2dlZCBhcyBuZXQtbmV4dCBJIG1pc3Nl
ZAo+IGl0IGluIHRvZGF5J3MgY3Jvc3MgbWVyZ2UgOigKPiAKCk9oIE9LLCBJIHNlZSDigJMgSSdt
IG5vdCB2ZXJ5IGZhbWlsaWFyIHdpdGggdGhlIG5ldCBzdWJzeXN0ZW0gcHJvY2Vzcy4gU28KZmFy
IEkgYWx3YXlzIGhhZCBpdCBsaWtlIHRoaXM6IGZpcmUgZXZlcnl0aGluZyBpbnRvIExpbnVzJ3Mg
bWFzdGVyIGFuZApHcmVnICYgU2FzaGEgdGhlbiBwaWNrIHRob3NlIHdpdGggRml4ZXMgdGFncyBp
bnRvIHRoZSBzdGFibGUgdHJlZXMKYXV0b21hdGljYWxseSA6KQoKQW55d2F5cywgSSBpbnRlcnBy
ZXQgeW91ciBtZXNzYWdlIHNvIHRoYXQgdGhpcyBzZXJpZXMgaXMgZG9uZSBhbmQgSQpkb24ndCBo
YXZlIHRvIGRvIGFueXRoaW5nIGFib3V0IGl0IGFueW1vcmUuIENvcnJlY3QgbWUgaWYgSSdtIHdy
b25nLgoKClRoYW5rcwpQLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
