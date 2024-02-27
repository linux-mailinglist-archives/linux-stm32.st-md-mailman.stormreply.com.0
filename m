Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAD0869C3F
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Feb 2024 17:36:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4226C6C841;
	Tue, 27 Feb 2024 16:36:20 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB075C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 16:36:19 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2d29111272eso23980951fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 08:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709051779; x=1709656579;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9i5hlJapLP6jPwsym6zkalPtVBE+pFBSRmyXNbEoAEY=;
 b=e/DjnbS8b7qSTXCbW0ov/3JFjENCKpZkJopndcyNwdYIl45GxmXcSIl11KBAAXiKcf
 EqrQ7qgQkEXKBcnkhXUEiDapJKhrqkkN0hkUYkg4s98cULzZn0sm/Ff4HZ47x3kdpBcC
 KYRNdqH0zpZ4mjT1ete71HFFOs4j7E0wRz6L+AJIYVNnq3ATytarWL52xUUt8vLu8ueF
 lbKXVmnrltHbNothnH2iR1zHoa3mZRptaDX66tKsdUAbUFvFOhDAPYchCEqOx370EBL+
 woq1pbjrQJzpIic8WyoRaqxoSfuR6SB4udomm3k5tHS/F0fLBELe6wEo+oW/9rloXwmD
 m8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709051779; x=1709656579;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9i5hlJapLP6jPwsym6zkalPtVBE+pFBSRmyXNbEoAEY=;
 b=Z2CBpAU4tnTrPADyJcY8j1ztUINiPSa6ay5er+1hAN0AQAt+Z05xdHrUS7mhEpzidX
 2UkX4n/9A4CDKpMuIoXhFZFzj6Q04dADerK4MoXEFOLgRe2vP883oCYuTdhsIMCPU8Ij
 6saqeRWGhN/3AZCVACrnz6EqKOjI/rdS3qHKYikbirxyv0Mfz0P19xeLWFDdK/5trnce
 EcUpR3vbVb8/WJRPJxb2lVyQZXr4EpV5XcEUF3O1/2THindnEj74MVEsB2RcfMuy5Zsj
 /qCqeDVEebtWZhT/H2C94Ep5XfPWx6ta5N1scJ0b98KXBv+TWgeCZdJVA+xlLEQvBjgB
 dfvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIKtDt9prG048zqNqb6uhTkL5ZnihMaE5VwuSB54St4Qi9YcOwPZWRoIs/8aEsAHmLI35ZG0N25rkV+rOZf7en18eXdYlFWBgLyXuEOMr9aJ58VXkdFVML
X-Gm-Message-State: AOJu0Yy8zMYh+7WpUwuA5iUS3oOVuBBtztZZppI9Q2MBmDxrWCn0hW2o
 DUvf87wuIxBxDgouO7ay6r3Tc2xNzZACWaKFFsmYR9xFNIzXYMzqOWPlBLMofOHQO0q07ojAwm0
 f/KbKSXvlOx6ync/OIfbphjPBiIfr+xXFbQzFdw==
X-Google-Smtp-Source: AGHT+IH7YLnLMluYbBqba2HqK2U/KdjlxswxBx1MLznMGFPH7zEmPhqgw9gjdxbEvl1zCBEAWp/RcuPS41adiKr/ORI=
X-Received: by 2002:a05:651c:2c4:b0:2d2:7580:e220 with SMTP id
 f4-20020a05651c02c400b002d27580e220mr5748651ljo.15.1709051778879; Tue, 27 Feb
 2024 08:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
 <20240219-mainline-spi-precook-message-v2-5-4a762c6701b9@baylibre.com>
 <20240224165706.18cc0d7e@jic23-huawei>
In-Reply-To: <20240224165706.18cc0d7e@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 27 Feb 2024 10:36:07 -0600
Message-ID: <CAMknhBGZkCx1HT1pzNHAgOCSvA3U7a6_P7DdDibfawziih_PwA@mail.gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Julien Stephan <jstephan@baylibre.com>,
 David Jander <david@protonic.nl>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 5/5] iio: adc: ad7380: use
	spi_optimize_message()
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

T24gU2F0LCBGZWIgMjQsIDIwMjQgYXQgMTA6NTfigK9BTSBKb25hdGhhbiBDYW1lcm9uIDxqaWMy
M0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgMTkgRmViIDIwMjQgMTY6MzM6MjIgLTA2
MDAKPiBEYXZpZCBMZWNobmVyIDxkbGVjaG5lckBiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gPiBU
aGlzIG1vZGlmaWVzIHRoZSBhZDczODAgQURDIGRyaXZlciB0byB1c2Ugc3BpX29wdGltaXplX21l
c3NhZ2UoKSB0bwo+ID4gb3B0aW1pemUgdGhlIFNQSSBtZXNzYWdlIGZvciB0aGUgYnVmZmVyZWQg
cmVhZCBvcGVyYXRpb24uIFNpbmNlIGJ1ZmZlcmVkCj4gPiByZWFkcyByZXVzZSB0aGUgc2FtZSBT
UEkgbWVzc2FnZSBmb3IgZWFjaCByZWFkLCB0aGlzIGNhbiBpbXByb3ZlCj4gPiBwZXJmb3JtYW5j
ZSBieSByZWR1Y2luZyB0aGUgb3ZlcmhlYWQgb2Ygc2V0dGluZyB1cCBzb21lIHBhcnRzIHRoZSBT
UEkKPiA+IG1lc3NhZ2UgaW4gZWFjaCBzcGlfc3luYygpIGNhbGwuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogRGF2aWQgTGVjaG5lciA8ZGxlY2huZXJAYmF5bGlicmUuY29tPgo+IExvb2tzIGdvb2Qg
dG8gbWUuCj4KPiBBcyB0aGlzIGlzIHRoZSBkcml2ZXIgeW91IGFza2VkIG1lIHRvIGRyb3AgZWFy
bGllciB0aGlzIGN5Y2xlLAo+IGhvdyBkbyB3ZSBwbGFuIHRvIG1lcmdlIHRoaXMgc2VyaWVzPwo+
Cj4gSWYgTWFyayBpcyBmaW5lIHRha2luZyAxLTQgd2l0aCB0aGUgdXNlciBmb2xsb3dpbmcgYWxv
bmcgdGhhdCdzCj4gZmluZSBieSBtZSwgaWYgbm90IEkgZ3Vlc3Mgd2UgYXJlIGluIGltbXV0YWJs
ZSB0cmVlIHRlcnJpdG9yeSBmb3IKPiBuZXh0IGN5Y2xlPwoKSSd2ZSBiZWVuIG91dCBzaWNrIGZv
ciBhIHdlZWsgc28gdHJ5aW5nIHRvIGdldCBiYWNrIHVwIHRvIHNwZWVkIGhlcmUuCkl0IGxvb2tz
IGxpa2UgTWFyayBoYXMgcGlja2VkIHVwIHRoZSBzcGkgY2hhbmdlcywgc28gdGhhdCBwYXJ0IGlz
CnJlc29sdmVkLiBJJ2xsIHdvcmsgb24gZ2V0dGluZyB0aGUgYWQ3MzgwIGRyaXZlciByZXN1Ym1p
dHRlZCwgdGhlbiB3ZQpjYW4gY29tZSBiYWNrIHRvIHRoaXMgcGF0Y2ggYWZ0ZXIgNi45LXJjMSAo
YXNzdW1pbmcgdGhlIFNQSSBjaGFuZ2VzCm1ha2UgaXQgaW4gdG8gMy45IG9mIGNvdXJzZSkuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
