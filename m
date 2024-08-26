Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1A995F81E
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 19:31:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E05BC7801A;
	Mon, 26 Aug 2024 17:31:09 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 734DCC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 17:31:02 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-2d3e46ba5bcso3265800a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 10:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724693461; x=1725298261;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iClgDrknyT0dEay6TLsYqV+rELzO0m3jwG6/VjVsKOY=;
 b=QkWI/wbmUHEiQixV2aVcdC4ywErRmnXEPiENP8RCBdJTND0zyUncKMHNNKVWvjS8dy
 IZS2qu8EVgMfs7MMLzHptZs6RX5FshfwDPRWevathMh/r4gctubTN+FWQEGrOFh+TfRb
 1Qb5dwvFBeaYn8o3cQNcyVhT7S+O75M0xnKs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724693461; x=1725298261;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iClgDrknyT0dEay6TLsYqV+rELzO0m3jwG6/VjVsKOY=;
 b=e2oyQtquLqL5FPob/4KpqwwgxZnxWDh+1opBI+U1GAbfw32F3bGmm5EAZnhaMWxKJ5
 wuRQ78W44RFiFyZRYB0emaQJ2f2cYpkF3j1jxaLwz4CfrFMj2oqzUVve+lxm9p8LxIKr
 Dh4s9d+9aMzefrjmwNcO7S8DqdzTTQSH0rJ+j78CkRwHlcHvzlYV6JFM7D4m/lIWc4Yg
 MIz4Qs5m5UjpRmQv0VxyC1kX0mkD5Be9UKrSLqh4atZMP8kjNIXFWC2zoYaBZTV7oa3P
 I1lj9vcI+PnKCZbnYpumFDIOUDOGHyAyh0hByvsYN8FH8JIZieNbhaRWp9qQu/g+xM+P
 xH/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYxzs36ozzIRtYMzk/UqUgP7K4EvltAjms7XqtZ6x4QUQws3FL5He9g7jxdPz1lqxxrTkVeN40/5aaxQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxkEuBVB1ABkcGZi9l+xb/1ndBIS4eb9GyMRwAxy8wZdudNwLUV
 Gj42hVkZcnL+Yz2mCR1AO+2H2T7P9sLlhZui7be2g+MGWckUa/POPz5K7Cme0IuDiL/XlFsyehX
 aggqJagyJyq3yE/OHsZsfbqq4qjhdLgBsDFho
X-Google-Smtp-Source: AGHT+IGOiC9l+tylzHyvTlxh5R323gDD1FRUx3Z+bfPXVWn9FyrfJSQssxkfETmOUkVELarY+SrTHbJFJ2oK/08oDGc=
X-Received: by 2002:a17:90b:4a43:b0:2d4:924:8891 with SMTP id
 98e67ed59e1d1-2d8259f79a4mr319895a91.38.1724693460840; Mon, 26 Aug 2024
 10:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
 <20240814221818.2612484-5-jitendra.vegiraju@broadcom.com>
 <5f7a617e-a8a2-40ca-a54a-19e58d69ab33@marvell.com>
In-Reply-To: <5f7a617e-a8a2-40ca-a54a-19e58d69ab33@marvell.com>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Mon, 26 Aug 2024 10:30:49 -0700
Message-ID: <CAMdnO-+ZKyoPY=ZDO8cir5T8hcF-nLRhkasfykF8EFbbedqXFg@mail.gmail.com>
To: Amit Singh Tomar <amitsinght@marvell.com>
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, fancer.lancer@gmail.com,
 horms@kernel.org, mcoquelin.stm32@gmail.com, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next v4 4/5] net: stmmac: Add PCI driver
	support for BCM8958x
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

SGkgQW1pdCwKVGhhbmtzIGZvciB0aGUgcmV2aWV3IGNvbW1lbnRzLgoKT24gVGh1LCBBdWcgMjIs
IDIwMjQgYXQgOTozNeKAr0FNIEFtaXQgU2luZ2ggVG9tYXIgPGFtaXRzaW5naHRAbWFydmVsbC5j
b20+IHdyb3RlOgo+Cj4gSGksCj4KPgo+ID4gK3sKPiA+ICsgICAgIGludCByZXQ7Cj4gPiArICAg
ICBpbnQgaTsKPiBuaXQ6IFRoaXMgY2FuIGJlIG1lcmdlZCBpbnRvIHNpbmdsZSBsaW5lLgoKVGhh
bmtzLCBJIHdpbGwgZml4IGl0LgoKPiA+ICtlcnJfZGlzYWJsZV9tc2k6Cj4gPiArICAgICBwY2lf
ZnJlZV9pcnFfdmVjdG9ycyhwZGV2KTsKPiA+ICtlcnJfZGlzYWJsZV9kZXZpY2U6Cj4gPiArICAg
ICBwY2lfZGlzYWJsZV9kZXZpY2UocGRldik7Cj4gU2hvdWxkbid0IHBjaW1faW91bm1hcF9yZWdp
b24gYmUgY2FsbGVkIGhlcmUgdG8gdW5tYXAgYW5kIHJlbGVhc2UgUENJIEJBUnM/CgpNeSB1bmRl
cnN0YW5kaW5nIGlzIHRoYXQgZm9yIG1hbmFnZWQgQVBJIGNhbGxzIHBjaW1faW9tYXBfcmVnaW9u
cygpLAp3ZSBkb24ndCBuZWVkIHRvIGRvIGV4cGxpY2l0IGNsZWFuIHVwLgpQbGVhc2UgbGV0IG1l
IGtub3cgaWYgdGhhdCdzIG5vdCB0aGUgY2FzZS4KSnVzdCByZWFsaXplZCB0aGF0IHBjaV9kaXNh
YmxlX2RldmljZSgpIGluIGNsZWFudXAgaXMgbm90IHJlcXVpcmVkCnNpbmNlIHRoZSBkcml2ZXIg
aXMgdXNpbmcgcGNpbV9lbmFibGVfZGV2aWNlKCkuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
