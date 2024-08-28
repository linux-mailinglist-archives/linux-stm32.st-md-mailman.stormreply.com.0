Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93237961FAE
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 08:26:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44F29C6DD9D;
	Wed, 28 Aug 2024 06:26:19 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC9FAC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 06:26:11 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53346132365so7482684e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 23:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724826371; x=1725431171;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SWJai3FOZ0aIfR9xP0d6XbyckawGCPeLPNcVBBq6JJk=;
 b=degk3CoIMTr3GLEbIGhF+KCIx7ICwWnoTEALZoEdRDIL92ZP8jfEaY1XcvorJ32Qdu
 AVMGIEtFMMchgYrhhycYZaZiQ239WNdFZBouHxCiDu/Y3XAY7lSLEtBIkXBAD1WnA3+3
 L9TKdfn3cIFSXYlLRtYvhatYR5JPcKWtu+aHnbQGmnUHRaPm05HXOA38IetcwPWnJTnL
 r8RwFdHGkc9efTdbhs9cmsbTJVwcl5adhgUpNT564XjErbY/AUkKQXhzj5co6Lze04q5
 3zLw3cRtdsCuZYK10VijmJ8WcQBTvRyUgw1pDflnowdNF9OkTj42eAnhuf8spieOhPGp
 Ss/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724826371; x=1725431171;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SWJai3FOZ0aIfR9xP0d6XbyckawGCPeLPNcVBBq6JJk=;
 b=EtAEexBlyJ7MFGtDbueJpzwZVsMfwJdT9aZ/Gg1pZhZhU0yGpbFC3ZcqfW2cUChY2Q
 FTox/8xSn9LAbL15INLS18CfmQVU4b9Ucjfg/g4tosYH/8D8aKwytnaxXcgulzsTEeq/
 griSsRUAyv/hxaTal2qNBGgyeC2aY0tiC6JDSaYv6XQZBtKL/z3PThj7HUpLbMU+H9/X
 2n+LLmixyw3AK9tlhmKveaJQ+BdumRrjFcV9JVO/6HI62R0doPL6uCX87fsd/ocq0gXE
 /516FNAuD5lR+kgvaI+0DBRVQFw+luM6i5PhjCPCi5Nqoq3CE9TE8nl7HNzrVvdHWETZ
 6jmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0KwKGV6IIUzn5jUbwEKrz1kAK6LGdw+QslFjmCoHr2CvzD12z5+WEgRtKGMZqbd/+0Y+vghqNtJd9/g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwKQ9/pgwDqWqB/3hPhlDHapaTPtSa2XczVHrNtry1RFsonotPT
 dLhSRIK5PXYa1bWnjAvZOn51UdzhOKs9MJKQnB5+DVj7CHI5SpOggeWUaVI6bURWaHHPll3+QGv
 rc3yeaZcbPAonrm71QaMUJ/DkaSE=
X-Google-Smtp-Source: AGHT+IFEt9p2w9MKV8Zp367JXiujuRIJ135e9+HM1SrHI5y6rzXoYwC74hSPlKsVxIIYV0RiBX5XsG6Gi1mRzvqKcwE=
X-Received: by 2002:a2e:bc08:0:b0:2f0:1a19:f3f1 with SMTP id
 38308e7fff4ca-2f55b64017cmr7038631fa.7.1724826370344; Tue, 27 Aug 2024
 23:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240827095712.2672820-1-frank.li@vivo.com>
 <20240827095712.2672820-9-frank.li@vivo.com>
 <20240827120953.00005450@Huawei.com>
In-Reply-To: <20240827120953.00005450@Huawei.com>
From: Marcin Wojtas <marcin.s.wojtas@gmail.com>
Date: Wed, 28 Aug 2024 08:25:58 +0200
Message-ID: <CAHzn2R0r9Jziex+7fyhPGaPf12ckwqZwO40bshDBGdq_Tyenqg@mail.gmail.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: andrew@lunn.ch, linus.walleij@linaro.org, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, f.fainelli@gmail.com,
 sd@queasysnail.net, linux@armlinux.org.uk, joabreu@synopsys.com,
 u.kleine-koenig@pengutronix.de, jacob.e.keller@intel.com, kuba@kernel.org,
 pabeni@redhat.com, clement.leger@bootlin.com, mcoquelin.stm32@gmail.com,
 Yangtao Li <frank.li@vivo.com>, ulli.kroll@googlemail.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
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

SGkgSm9uYXRoYW4sCgp3dC4sIDI3IHNpZSAyMDI0IG8gMTM6MDkgSm9uYXRoYW4gQ2FtZXJvbgo8
Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPiBuYXBpc2HFgihhKToKPgo+IE9uIFR1ZSwgMjcg
QXVnIDIwMjQgMDM6NTc6MTEgLTA2MDAKPiBZYW5ndGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4g
d3JvdGU6Cj4KPiA+IFVzZSBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIGFuZCBkZXZtX2Nsa19nZXRf
b3B0aW9uYWxfZW5hYmxlZCgpCj4gPiB0byBzaW1wbGlmeSBjb2RlLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZpdm8uY29tPgo+ID4gUmV2aWV3ZWQtYnk6IE1h
eGltZSBDaGV2YWxsaWVyIDxtYXhpbWUuY2hldmFsbGllckBib290bGluLmNvbT4KPiA+IFRlc3Rl
ZC1ieTogTWF4aW1lIENoZXZhbGxpZXIgPG1heGltZS5jaGV2YWxsaWVyQGJvb3RsaW4uY29tPgo+
ID4gU3VnZ2VzdGVkLWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3
YW5hZG9vLmZyPgo+ID4gUmV2aWV3ZWQtYnk6IE1hcmNpbiBXb2p0YXMgPG1hcmNpbi5zLndvanRh
c0BnbWFpbC5jb20+Cj4KPiA+Cj4gPiBAQCAtNzc0NSwxMiArNzcxMCw2IEBAIHN0YXRpYyB2b2lk
IG12cHAyX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4KPiA+ICAgICAg
IGlmICghZGV2X29mX25vZGUoJnBkZXYtPmRldikpCj4gPiAgICAgICAgICAgICAgIHJldHVybjsK
Pgo+IEdpdmVuIHRoaXMgbWFrZXMgbm8gZGlmZmVyZW5jZSBhbnkgbW9yZSwgZHJvcCB0aGUgYWJv
dmUgZGV2X29mX25vZGUoKSBjaGVjay4KPgoKVGhpcyBjaGVjayBpcyB0byBub3QgZXhlY3V0ZSB0
aGUgY2xrLXJlbGF0ZWQgY29kZSB3aGVuIGJvb3Rpbmcgd2l0aApBQ1BJLiBJdCBzaG91bGQgcmVt
YWluIGFzLWlzLCB1bmxlc3MgdGhlIG5ldyBkZXZtX2Nsa19nZXQqIGFwaSBpcwpjYXBhYmxlIG9m
IG5vdCBleHBsb2RpbmcgaW4gbm9uLURUIGNhc2UuIENhbiB5b3UgY29uZmlybT8KCkJlc3QgcmVn
YXJkcywKTWFyY2luCgo+ID4gLQo+ID4gLSAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHByaXYt
PmF4aV9jbGspOwo+ID4gLSAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPm1nX2NvcmVf
Y2xrKTsKPiA+IC0gICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShwcml2LT5tZ19jbGspOwo+ID4g
LSAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPnBwX2Nsayk7Cj4gPiAtICAgICBjbGtf
ZGlzYWJsZV91bnByZXBhcmUocHJpdi0+Z29wX2Nsayk7Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdnBwMl9tYXRjaFtdID0gewo+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
