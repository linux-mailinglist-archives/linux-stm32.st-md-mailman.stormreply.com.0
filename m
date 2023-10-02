Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6047B5417
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 15:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5776BC6C83C;
	Mon,  2 Oct 2023 13:37:14 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C96FAC6B456
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 12:43:52 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-40572aeb73cso135109485e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696250632; x=1696855432;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=SuVrzPEkZXL/nyUjcTtIVN8e2SSFUAE0S6M5VXieAtg=;
 b=jcHJOsDB9YYMgq8N5y5mhTLB79sWMX5JviOnylbIpu5vofs2k1DP5V/HbyzdAplXUd
 3sgFdPyRtm4dWESlcZeDoeq2G29mKmr1RiSipM9tQh2ee4f0Lmck711gmwh4GhdGsDs1
 B0cXrNj6UgIW43nvn2FiyoqZTAAo7Y0gJxQtFg2mTjP5VVPw+FWcZCeTtsuEepDYVgW4
 FQ1YAtJc9OFkgGpxOCzL9eiF1n+Umu8IE7Ewo2HyEhJyiablDn7ZIk4GxR4DGzif1ge2
 3IUcK0NarzFQOD1GPdy4sIvwd5bDrMgdm9D9eyb4HxuZsknM38N9aGxouYJyK46Y6206
 NLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696250632; x=1696855432;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SuVrzPEkZXL/nyUjcTtIVN8e2SSFUAE0S6M5VXieAtg=;
 b=UsZV2ffN7/6U8DKQR2DCs0VSAuo6D158WgjOCfRqW9VQoUBnXGGxMWLRrojvwJdiTj
 /gX+FBaojYFQuUk/fAR+/QQdWbJECW1nb5v9ZgI3AX/o6RF22e2o5zlIUIASMB//GitW
 5/97UGtGHtZrH+IM4wy8kBMOYAtUsBHLH4A8GFlAo7qW2ABdx5t3YZXyukCF2UIj6H2e
 385HmZj3P34P3tm230w5yejC9bvwZdI4ioLGpYlHJ5LeDD4eUxvJlcaZLQ/QPJqjIqjL
 +I3ok4/oph8zTnFHDVVjKimWtgs190Zp+n/TLuP44FKl0e6UXfAipoCcxwHlNhaOtCoN
 sJag==
X-Gm-Message-State: AOJu0YwgtY+Jm+f9m65yJcVv6GxDPQpD1eNQQI0tMU4O5GY5ySEtf6Gw
 +lNdmxVCfLx8l9L9WSo69Do=
X-Google-Smtp-Source: AGHT+IFtmy+jvrK149JttUDtopSV0OsgZK6d3UGZg2M3FSqCFBhgRvjmI/KdY93XL4lsSqC/RF9hkQ==
X-Received: by 2002:a05:600c:ac4:b0:401:aa8f:7570 with SMTP id
 c4-20020a05600c0ac400b00401aa8f7570mr9569818wmr.1.1696250631957; 
 Mon, 02 Oct 2023 05:43:51 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05600c248b00b003fefe70ec9csm7185549wms.10.2023.10.02.05.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 05:43:51 -0700 (PDT)
Message-ID: <651abb07.050a0220.5435c.9eae@mx.google.com>
X-Google-Original-Message-ID: <ZRq7Ax0+6OAd2NIn@Ansuel-xps.>
Date: Mon, 2 Oct 2023 14:43:47 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Eric Dumazet <edumazet@google.com>
References: <20230922111247.497-1-ansuelsmth@gmail.com>
 <CANn89iJtrpVQZbeAezd7S4p_yCRSFzcsBMgW+y9YhxOrCv463A@mail.gmail.com>
 <65181064.050a0220.7887c.c7ee@mx.google.com>
 <CANn89iJqkpRu8rd_M7HCzaZQV5P_XTCzbKe5DOwnJkTRDZWEWw@mail.gmail.com>
 <651ab7b8.050a0220.e15ed.9d6a@mx.google.com>
 <CANn89iJqFC-Z3NZwT+CXEG7R9rc9g4LRwNm6Zm=nZKpD3Mon7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89iJqFC-Z3NZwT+CXEG7R9rc9g4LRwNm6Zm=nZKpD3Mon7Q@mail.gmail.com>
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

T24gTW9uLCBPY3QgMDIsIDIwMjMgYXQgMDI6MzU6MjJQTSArMDIwMCwgRXJpYyBEdW1hemV0IHdy
b3RlOgo+IE9uIE1vbiwgT2N0IDIsIDIwMjMgYXQgMjoyOeKAr1BNIENocmlzdGlhbiBNYXJhbmdp
IDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4gPiBFaGhoIHRoZSBpZGVhIGhlcmUg
d2FzIHRvIHJlZHVjZSBjb2RlIGR1cGxpY2F0aW9uIHNpbmNlIHRoZSB2ZXJ5IHNhbWUKPiA+IHRl
c3Qgd2lsbCBiZSBkb25lIGluIHN0bW1hYy4gU28gSSBndWVzcyB0aGlzIGNvZGUgY2xlYW51cCBp
cyBhIE5BQ0sgYW5kCj4gPiBJIGhhdmUgdG8gZHVwbGljYXRlIHRoZSB0ZXN0IGluIHRoZSBzdG1t
YWMgZHJpdmVyLgo+IAo+IEkgc2ltcGx5IHdhbnRlZCB0byBhZGQgYSBjb21tZW50IGluIGZyb250
IG9mIHRoaXMgZnVuY3Rpb24vaGVscGVyLAo+IGFkdmlzaW5nIG5vdCB1c2luZyBpdCB1bmxlc3Mg
YWJzb2x1dGVseSBuZWVkZWQuCj4gCj4gVGh1cyBteSBxdWVzdGlvbiAiSW4gd2hpY2ggY29udGV4
dCBpcyBpdCBzYWZlIHRvIGNhbGwgdGhpcyBoZWxwZXIgPyIKPiAKPiBBcyBsb25nIGFzIGl0IHdh
cyBwcml2YXRlIHdpdGggYSBkcml2ZXIsIEkgZGlkIG5vdCBtaW5kLgo+IAo+IEJ1dCBpZiBtYWRl
IHB1YmxpYyBpbiBpbmNsdWRlL2xpbnV4L25ldGRldmljZS5oLCBJIHdvdWxkIHJhdGhlciBub3QK
PiBoYXZlIHRvIGV4cGxhaW4KPiB0byBmdXR1cmUgdXNlcnMgd2h5IGl0IGNhbiBiZSBwcm9ibGVt
YXRpYy4KCk9oIG9rIQoKV2UgaGF2ZSBwbGVudHkgb2YgY2FzZSBzaW1pbGFyIHRvIHRoaXMuIChl
eGFtcGxlIHNvbWUgY2xvY2sgQVBJIHZlcnkKaW50ZXJuYWwgdGhhdCBzaG91bGQgbm90IGJlIHVz
ZWQgbm9ybWFsbHkgb3IgcmVnbWFwIHJlbGF0ZWQpCgpJIHdpbGwgaW5jbHVkZSBzb21lIGNvbW1l
bnRzIHdhcm5pbmcgdGhhdCB0aGlzIHNob3VsZCBub3QgYmUgdXNlZCBpbgpub3JtYWwgY2lyY3Vt
c3RhbmNlcyBhbmQgb3RoZXIgd2FybmluZ3MuIElmIHlvdSBoYXZlIHN1Z2dlc3Rpb24gb24gd2hh
dAp0byBhZGQgZmVlbCBmcmVlIHRvIHdyaXRlIHRoZW0uCgpBbnkgY2x1ZSBvbiBob3cgdG8gcHJv
Y2VlZCB3aXRoIHRoZSBzZ2UgZHJpdmVyPyAKCi0tIAoJQW5zdWVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
