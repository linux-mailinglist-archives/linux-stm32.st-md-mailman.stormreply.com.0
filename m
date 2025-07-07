Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F72FAFB64A
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Jul 2025 16:43:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06127C3089F;
	Mon,  7 Jul 2025 14:43:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 108C6C36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Jul 2025 14:43:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 14A0B61454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Jul 2025 14:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC42EC4CEF7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Jul 2025 14:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751899421;
 bh=pygmB6Y0A8GnIvfkKxpvuMj1/8T5+x16Brq+Mu3flTM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hW7AEn/kJoZ8G/Ci6vwPyUhco7+VT+w71XTx1ckOOlEvFJ/XKwDhl5sE5b9n0vETn
 EoBQn8bKGxm2xp53PmFWiarQqh3pag3ilMqvwhTHb3byIy+pYBNJSt52ADXNa/MOFS
 +St49nQkrtc6KQHchPzRFYKXHZIdwRyz1ELm99WFwf2g00rsR9i0S6bgj0rpxYxHuL
 5PigZFIt0Es2ZgJV0o8sqXtLuX+r7gcko2jCPn8vGe4Lng1QsjwOuSMZLDyMrFf0Wc
 IFOnWDqHkuLn04u1NoOC2CQOYtSHxEo9oBSMWBRjdi6oZ3bQwILTM5qDqUhwWEOJ8M
 QHRiEECr41zTQ==
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ae3c5f666bfso522939966b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Jul 2025 07:43:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW6le9XRrOP4GbT9fxK0DLiWcaEJrQmYz9mzR4puL+o+PDlCer5bKfg9Zm1dYbIvYza0f8E1ulM4q/iRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxRMoLN+F7jcVseZ0x4O6eX8fklFJkf4uk70jFlm4yxqA3bjfAT
 utSGoF8tlru/5kIYqr7p7Xilytc+LVFkiWxbC9Er6OXLBM+joZoAbVJGSMn1GeSMbecYpuFVFdC
 17NbQuQl8CNm/KT6aDQz2dnK+9VdUWQ==
X-Google-Smtp-Source: AGHT+IH+f8zvdudHp1LuRKAAn7cL9u6+1JqOnozuxrIIQH8whQPjPMtiGupPBrID+yAocJ3AfWvuowkyHK1U/F/njY4=
X-Received: by 2002:a17:907:96ac:b0:ae6:abe9:8cbc with SMTP id
 a640c23a62f3a-ae6abe98e66mr63239166b.12.1751899420274; Mon, 07 Jul 2025
 07:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250703183537.2075746-1-robh@kernel.org>
 <1e33e6b6-845a-44bf-a398-4a9fb895a125@sirena.org.uk>
In-Reply-To: <1e33e6b6-845a-44bf-a398-4a9fb895a125@sirena.org.uk>
From: Rob Herring <robh@kernel.org>
Date: Mon, 7 Jul 2025 09:43:27 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+8ObyEM-f88QSq1QfptVPrk5s5mVM-irq4ZTGNW9NKTw@mail.gmail.com>
X-Gm-Features: Ac12FXwY1NqOYzEWnEAy2ESIy7UgECjX4aJqnXTz286AyGb5Rk-mUEzeguxMrTU
Message-ID: <CAL_Jsq+8ObyEM-f88QSq1QfptVPrk5s5mVM-irq4ZTGNW9NKTw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-ospi: Use
 of_reserved_mem_region_to_resource() for "memory-region"
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

T24gRnJpLCBKdWwgNCwgMjAyNSBhdCA4OjUw4oCvQU0gTWFyayBCcm93biA8YnJvb25pZUBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgSnVsIDAzLCAyMDI1IGF0IDAxOjM1OjM3UE0gLTA1
MDAsIFJvYiBIZXJyaW5nIChBcm0pIHdyb3RlOgo+ID4gVXNlIHRoZSBuZXdseSBhZGRlZCBvZl9y
ZXNlcnZlZF9tZW1fcmVnaW9uX3RvX3Jlc291cmNlKCkgZnVuY3Rpb24gdG8KPiA+IGhhbmRsZSAi
bWVtb3J5LXJlZ2lvbiIgcHJvcGVydGllcy4KPgo+IFRoaXMgYnJlYWtzIGFuIGFsbG1vZGNvbmZp
ZyBidWlsZDoKPgo+IC9idWlsZC9zdGFnZS9saW51eC9kcml2ZXJzL3NwaS9zcGktc3RtMzItb3Nw
aS5jOjc3NToyMzogZXJyb3I6IHVudXNlZCB2YXJpYWJsZSAncm1lbScgWy1XZXJyb3IsLVd1bnVz
ZWQtdmFyaWFibGVdCj4gICA3NzUgfCAgICAgICAgIHN0cnVjdCByZXNlcnZlZF9tZW0gKnJtZW0g
PSBOVUxMOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+Cj4gL2J1
aWxkL3N0YWdlL2xpbnV4L2RyaXZlcnMvc3BpL3NwaS1zdG0zMi1vc3BpLmM6Nzc2OjIyOiBlcnJv
cjogdW51c2VkIHZhcmlhYmxlICdub2RlJyBbLVdlcnJvciwtV3VudXNlZC12YXJpYWJsZV0KPiAg
IDc3NiB8ICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpub2RlOwo+ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+fn4KClNpZ2guIEkgc3dlYXIgSSBoYWQgZml4ZWQgdGhh
dC4uLgoKClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
