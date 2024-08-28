Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFFD962066
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 09:13:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB259C6DD6E;
	Wed, 28 Aug 2024 07:13:13 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1AF8C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 07:13:06 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6c1ed19b25fso51562487b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 00:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724829184; x=1725433984;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IRttU90cGhHvxq7l+2uEOOgIlDZs3J8W+eir8dqoS4M=;
 b=Sy73tU9o35Fk5q0+j11LnlSp0+N0L3Cx/IbCVz2DH5yM8rCdg2UTupoeX+OzIT2P82
 jtU8ZqQzi3iH4pHr3KDa/k0jHPe/sYphOP6/LZO5M/M2UVsHyiLdx+yXobvKOIBUnjuu
 FH1+djrfeM3tXH8Zu/QlNFfAmH5USfjreU0GtMDEw5po1hGFAL9GmXT6TVqjo+khIeTE
 1nAQkjgt3gnrn2aIZFtDyUNbmohzs8fajN8sThkVTI6/aNnZ/4s6hORfqJFt92F6ss+K
 0Eof9M86MjVBKyDCOftx1RRcegxbVzC+45UkD5zFls9YYfTZDeuG/Jx5klyJfPzJK0mu
 ESKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUanDM6ajtahFLmgrlha2tEqlgnZoNaHcS/62kSyJOiFoPaOhYqnpUQSb848/WvyxDqCP8AchkprqSVJQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywho3quCym4K9me6bKf4Ez5eDHRAJcfQU0eD2z6aEQP7EYzcDQ5
 X8QOer/xNsriJQIBMA9KG7msbmVuZvLvRI0mI054louAxAQiOCtwuhA4OCVi
X-Google-Smtp-Source: AGHT+IFBuK9X6D3aXDdt3FHzjWtLHw0aD8qP/GbRID+dLrHtQ3WiVRBELSKuOUtNvYwCz+iWVwc/Hg==
X-Received: by 2002:a05:690c:4c89:b0:6ae:bb6f:2f29 with SMTP id
 00721157ae682-6c6295318f5mr136585777b3.44.1724829184014; 
 Wed, 28 Aug 2024 00:13:04 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6c39d3a9d52sm22271587b3.97.2024.08.28.00.13.02
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 00:13:02 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e1161ee54f7so6883106276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 00:13:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUfXE/QfEqR+pk9dj8wXHqB8Ac0WRAFIjJ0Iqyk8Z/rFI0y/RTxlqAy2mk0QmY+8VjYuWMbypvm2tbIMQ==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:690c:2f0a:b0:6b0:cad5:2239 with SMTP id
 00721157ae682-6c628a9f1c5mr129690527b3.31.1724829182652; Wed, 28 Aug 2024
 00:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-9-frank.li@vivo.com>
 <20240827120953.00005450@Huawei.com>
 <CAHzn2R0r9Jziex+7fyhPGaPf12ckwqZwO40bshDBGdq_Tyenqg@mail.gmail.com>
In-Reply-To: <CAHzn2R0r9Jziex+7fyhPGaPf12ckwqZwO40bshDBGdq_Tyenqg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 Aug 2024 09:12:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVSz32c6qXYSX4YSfO5mo-30Jku3kgPyR3-PXBoQqex3g@mail.gmail.com>
Message-ID: <CAMuHMdVSz32c6qXYSX4YSfO5mo-30Jku3kgPyR3-PXBoQqex3g@mail.gmail.com>
To: Marcin Wojtas <marcin.s.wojtas@gmail.com>
Cc: andrew@lunn.ch, linus.walleij@linaro.org, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com,
 sd@queasysnail.net, linux@armlinux.org.uk, joabreu@synopsys.com,
 u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com, kuba@kernel.org,
 pabeni@redhat.com, clement.leger@bootlin.com, mcoquelin.stm32@gmail.com,
 Yangtao Li <frank.li@vivo.com>, ulli.kroll@googlemail.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 horms@kernel.org, justinstitt@google.com, olteanv@gmail.com,
 davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next v3 8/9] net: mvpp2: Convert to
 devm_clk_get_enabled() and devm_clk_get_optional_enabled()
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

SGkgTWFyY2luLAoKT24gV2VkLCBBdWcgMjgsIDIwMjQgYXQgODoyNuKAr0FNIE1hcmNpbiBXb2p0
YXMgPG1hcmNpbi5zLndvanRhc0BnbWFpbC5jb20+IHdyb3RlOgo+IHd0LiwgMjcgc2llIDIwMjQg
byAxMzowOSBKb25hdGhhbiBDYW1lcm9uCj4gPEpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4g
bmFwaXNhxYIoYSk6Cj4gPiBPbiBUdWUsIDI3IEF1ZyAyMDI0IDAzOjU3OjExIC0wNjAwCj4gPiBZ
YW5ndGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4gd3JvdGU6Cj4gPiA+IFVzZSBkZXZtX2Nsa19n
ZXRfZW5hYmxlZCgpIGFuZCBkZXZtX2Nsa19nZXRfb3B0aW9uYWxfZW5hYmxlZCgpCj4gPiA+IHRv
IHNpbXBsaWZ5IGNvZGUuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlhbmd0YW8gTGkgPGZy
YW5rLmxpQHZpdm8uY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogTWF4aW1lIENoZXZhbGxpZXIgPG1h
eGltZS5jaGV2YWxsaWVyQGJvb3RsaW4uY29tPgo+ID4gPiBUZXN0ZWQtYnk6IE1heGltZSBDaGV2
YWxsaWVyIDxtYXhpbWUuY2hldmFsbGllckBib290bGluLmNvbT4KPiA+ID4gU3VnZ2VzdGVkLWJ5
OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPgo+ID4g
PiBSZXZpZXdlZC1ieTogTWFyY2luIFdvanRhcyA8bWFyY2luLnMud29qdGFzQGdtYWlsLmNvbT4K
PiA+Cj4gPiA+Cj4gPiA+IEBAIC03NzQ1LDEyICs3NzEwLDYgQEAgc3RhdGljIHZvaWQgbXZwcDJf
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+Cj4gPiA+ICAgICAgIGlm
ICghZGV2X29mX25vZGUoJnBkZXYtPmRldikpCj4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuOwo+
ID4KPiA+IEdpdmVuIHRoaXMgbWFrZXMgbm8gZGlmZmVyZW5jZSBhbnkgbW9yZSwgZHJvcCB0aGUg
YWJvdmUgZGV2X29mX25vZGUoKSBjaGVjay4KPgo+IFRoaXMgY2hlY2sgaXMgdG8gbm90IGV4ZWN1
dGUgdGhlIGNsay1yZWxhdGVkIGNvZGUgd2hlbiBib290aW5nIHdpdGgKPiBBQ1BJLiBJdCBzaG91
bGQgcmVtYWluIGFzLWlzLCB1bmxlc3MgdGhlIG5ldyBkZXZtX2Nsa19nZXQqIGFwaSBpcwo+IGNh
cGFibGUgb2Ygbm90IGV4cGxvZGluZyBpbiBub24tRFQgY2FzZS4gQ2FuIHlvdSBjb25maXJtPwoK
QXMgcGVyIHRoZSByZW1vdmFscyBiZWxvdywgdGhlcmUgaXMgbm8gY29kZSBsZWZ0IGluIHRoaXMg
ZnVuY3Rpb24gYWZ0ZXIKdGhlIGNoZWNrIChpLmUuIHRoZSAiZWxzZSIgcGFydCBiZWNhbWUgZW1w
dHkpLgoKPiA+ID4gLQo+ID4gPiAtICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+YXhp
X2Nsayk7Cj4gPiA+IC0gICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5tZ19jb3JlX2Ns
ayk7Cj4gPiA+IC0gICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5tZ19jbGspOwo+ID4g
PiAtICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+cHBfY2xrKTsKPiA+ID4gLSAgICAg
Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPmdvcF9jbGspOwo+ID4gPiAgfQoKR3J7b2V0amUs
ZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
