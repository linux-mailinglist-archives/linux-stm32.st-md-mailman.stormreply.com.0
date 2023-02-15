Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B54697A91
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 12:21:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F17EC6A5F8;
	Wed, 15 Feb 2023 11:21:31 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82F97C69049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Feb 2023 11:21:29 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8C44E3F215
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Feb 2023 11:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1676460087;
 bh=hwzNkkVHAMig3SgTdNBISffkqWyB+YZfYs1moUFjJBQ=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=cQ/cbKTc7GkCr29Mxcb5UBckJwcf7/15OPWJehCFZc66ItYrp/W6igA0CYlVe3/kB
 x1JuRl4ascRlF0s06xqPeox0O50+4fLmNf4u3tlgO95jZiS7fFwVkfr0sUbZO4El5J
 ezi550gUwk3tYvGylY3NAttl32HRIHwhFSnJzRHnwxiFJ8/nHVbhvcK0ocklPsDEZB
 zdtC2uXFSaev8AeeqBKlA4dmSmiDdTf2UN4xpFxnPoWpKCYsti3+JT72//NsVu232j
 L3BbhFtUZrSDWe0W5pKhIzZi+HqmK1W6zPrXpKoMMRoU5oLzg+QU0AdA7atq9V84Hq
 jMp5Zbu2aSMng==
Received: by mail-qv1-f69.google.com with SMTP id
 gu10-20020a056214260a00b0056c2005684aso5940445qvb.23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Feb 2023 03:21:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hwzNkkVHAMig3SgTdNBISffkqWyB+YZfYs1moUFjJBQ=;
 b=3Q3UBnt8UhftXqUc9FYbYE1mQlzBMB5Zx9WqOqh/FxvFr7j3Y8o8ypNArbMxBOep9B
 XxFQFIATHdgnu7OZ6nezP+RBhDKx7VlcP7+UINEYOYVL3lb+j1zAGvmOgcIReAOj+0pR
 5S7+srDG0BHHw4udd53evQFLjsL4mwEn+trttCFXxe9KhQy1hJQCjrN6YDp/53++kvj7
 7ewsqtC7wleJLIFRhnGS4GzgxFZkapUklSqmeplRlTfx/Ey0hmPN6CenZSEpWvL1GX2a
 gT/GnbO/AdJuNgeBtPo4/PEAxci7KCKf6UQbYa5HSU0HwexUXFaBwlzSFHrv+G3TZ6vz
 sb3A==
X-Gm-Message-State: AO0yUKW+P1ARvLhrvw2WZ8SIIHBHpad88jFpoml3qnF/zsAshqD68mRr
 9mY+7T/RotuTZWFJOtMl2K1NFQ0gRk8SfP5ePNJQNwKXt77Erdo4OhpCFgWex1zbIit0YA+1xDe
 PhHQrg1kA861Y7kvkIYR1P7MuildXSFhTAj3u5eAKw2Ce7fCAhMZSg1PCkEZFBEKgKOK3woBK9w
 ==
X-Received: by 2002:a05:622a:164f:b0:3bc:e3a8:d1d6 with SMTP id
 y15-20020a05622a164f00b003bce3a8d1d6mr195957qtj.229.1676460075472; 
 Wed, 15 Feb 2023 03:21:15 -0800 (PST)
X-Google-Smtp-Source: AK7set9/NeWH75yJcn/t46NzwvdAG3kpXtrEWKot0xC2tKbCmHsBGrLAxxXzoc7xjxLRcnJ3CgUfTfDnKiYp8juZgUM=
X-Received: by 2002:a05:622a:164f:b0:3bc:e3a8:d1d6 with SMTP id
 y15-20020a05622a164f00b003bce3a8d1d6mr195937qtj.229.1676460075213; Wed, 15
 Feb 2023 03:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
 <Y+e+N/aiqCctIp6e@lunn.ch>
 <d1769dac-9e80-2f0d-6a5c-386ef70e1547@collabora.com>
In-Reply-To: <d1769dac-9e80-2f0d-6a5c-386ef70e1547@collabora.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 15 Feb 2023 12:20:58 +0100
Message-ID: <CAJM55Z8Uq2ZU3KvJZKDLZUJDLEyvHjCRJKcYn5CAOR0c2rhT7Q@mail.gmail.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Emil Renner Berthing <kernel@esmil.dk>,
 Eric Dumazet <edumazet@google.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 08/12] net: stmmac: Add glue layer for
	StarFive JH7100 SoC
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

T24gV2VkLCAxNSBGZWIgMjAyMyBhdCAwMTowOSwgQ3Jpc3RpYW4gQ2lvY2FsdGVhCjxjcmlzdGlh
bi5jaW9jYWx0ZWFAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBPbiAyLzExLzIzIDE4OjExLCBB
bmRyZXcgTHVubiB3cm90ZToKPiA+PiArCj4gPj4gKyNkZWZpbmUgSkg3MTAwX1NZU01BSU5fUkVH
SVNURVIyOCAweDcwCj4gPj4gKy8qIFRoZSB2YWx1ZSBiZWxvdyBpcyBub3QgYSB0eXBvLCBqdXN0
IHJlYWxseSBiYWQgbmFtaW5nIGJ5IFN0YXJGaXZlIMKvXF8o44OEKV8vwq8gKi8KPiA+PiArI2Rl
ZmluZSBKSDcxMDBfU1lTTUFJTl9SRUdJU1RFUjQ5IDB4YzgKPiA+Cj4gPiBTZWVtcyBsaWtlIHRo
ZSBjb21tZW50IHNob3VsZCBiZSBvbmUgbGluZSBlYXJsaWVyPwoKV2VsbCB5ZXMsIHRoZSB2ZXJ5
IGdlbmVyaWMgcmVnaXN0ZXIgbmFtZXMgYXJlIGFsc28gYmFkLCBidXQgdGhpcwpjb21tZW50IHJl
ZmVycyB0byB0aGUgZmFjdCB0aGF0IGl0IGtpbmQgb2YgbWFrZXMgc2Vuc2UgdGhhdCByZWdpc3Rl
cgoyOCBoYXMgdGhlIG9mZnNldAogIDI4ICogNCBieXRlcyBwci4gcmVnaXN0ZXIgPSAweDcwCi4u
YnV0IHRoZW4gcmVnaXN0ZXIgNDkgaXMgb2RkbHkgb3V0IG9mIHBsYWNlIGF0IG9mZnNldCAweGM4
IGluc3RlYWQgb2YKICA0OSAqIDQgYnl0ZXMgcHIuIHJlZ2lzdGVyID0gMHhjNAoKPiA+IFRoZXJl
IGlzIHZhbHVlIGluIGJhc2luZyB0aGUgbmFtZXMgb24gdGhlIGRhdGFzaGVldCwgYnV0IHlvdSBj
b3VsZAo+ID4gYXBwZW5kIHNvbWV0aGluZyBtZWFuaW5nZnVsIG9uIHRoZSBlbmQ6Cj4gPgo+ID4g
I2RlZmluZSBKSDcxMDBfU1lTTUFJTl9SRUdJU1RFUjQ5X0RMWUNIQUlOIDB4YzgKPgo+IFVuZm9y
dHVuYXRlbHkgdGhlIEpINzEwMCBkYXRhc2hlZXQgSSBoYXZlIGFjY2VzcyB0byBkb2Vzbid0IHBy
b3ZpZGUgYW55Cj4gaW5mb3JtYXRpb24gcmVnYXJkaW5nIHRoZSBTWVNDVFJMLU1BSU5TWVMgcmVs
YXRlZCByZWdpc3RlcnMuIE1heWJlIEVtaWwKPiBjb3VsZCBwcm92aWRlIHNvbWUgZGV0YWlscyBo
ZXJlPwoKVGhpcyBpcyByZXZlcnNlIGVuZ2luZWVyZWQgZnJvbSB0aGUgYXV0byBnZW5lcmF0ZWQg
aGVhZGVycyBpbiB0aGVpciB1LWJvb3Q6Cmh0dHBzOi8vZ2l0aHViLmNvbS9zdGFyZml2ZS10ZWNo
L3UtYm9vdC9ibG9iL0pINzEwMF9WaXNpb25GaXZlX2RldmVsL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vYXJjaC1qaDcxMDAvc3lzY29uX3N5c21haW5fY3RybF9tYWNyby5oCgpDaHJpc3RpYW4sIEkn
bSBoYXBweSB0aGF0IHlvdSdyZSB3b3JraW5nIG9uIHRoaXMsIGJ1dCBtZXNzIGxpa2UgdGhpcwph
bmQgd2FpdGluZyBmb3IgdGhlIG5vbi1jb2hlcmVudCBkbWEgdG8gYmUgc29ydGVkIGlzIHdoeSBJ
IGRpZG4ndCBzZW5kCml0IHVwc3RyZWFtIHlldC4KCj4gPj4gKyAgICBpZiAoIW9mX3Byb3BlcnR5
X3JlYWRfdTMyKG5wLCAic3RhcmZpdmUsZ3R4Y2xrLWRseWNoYWluIiwgJmd0eGNsa19kbHljaGFp
bikpIHsKPiA+PiArICAgICAgICAgICAgcmV0ID0gcmVnbWFwX3dyaXRlKHN5c21haW4sIEpINzEw
MF9TWVNNQUlOX1JFR0lTVEVSNDksIGd0eGNsa19kbHljaGFpbik7Cj4gPj4gKyAgICAgICAgICAg
IGlmIChyZXQpCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUo
ZGV2LCByZXQsICJlcnJvciBzZWxlY3RpbmcgZ3R4Y2xrIGRlbGF5IGNoYWluXG4iKTsKPiA+PiAr
ICAgIH0KPiA+Cj4gPiBZb3Ugc2hvdWxkIHByb2JhYmx5IGRvY3VtZW50IHRoYXQgaWYgc3RhcmZp
dmUsZ3R4Y2xrLWRseWNoYWluIGlzIG5vdAo+ID4gZm91bmQgaW4gdGhlIERUIGJsb2IsIHRoZSB2
YWx1ZSBmb3IgdGhlIGRlbGF5IGNoYWluIGlzIHVuZGVmaW5lZC4gIEl0Cj4gPiB3b3VsZCBhY3R1
YWxseSBiZSBiZXR0ZXIgdG8gZGVmaW5lIGl0LCBzZXQgaXQgdG8gMCBmb3IgZXhhbXBsZS4gVGhh
dAo+ID4gd2F5LCB5b3Uga25vdyB5b3UgZG9uJ3QgaGF2ZSBhbnkgZGVwZW5kZW5jeSBvbiB0aGUg
Ym9vdGxvYWRlciBmb3IKPiA+IGV4YW1wbGUuCj4KPiBTdXJlLCBJIHdpbGwgc2V0IGl0IHRvIDAu
Cj4KPiA+Cj4gPiAgICAgICBBbmRyZXcKPgo+IFRoYW5rcyBmb3IgcmV2aWV3aW5nLAo+IENyaXN0
aWFuCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
