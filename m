Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2C9A80ED8
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Apr 2025 16:50:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DAEDC78F75;
	Tue,  8 Apr 2025 14:50:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBEBEC7803B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 14:50:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D1C65C591A;
 Tue,  8 Apr 2025 14:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2297AC4CEE5;
 Tue,  8 Apr 2025 14:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744123849;
 bh=iippsYe8qLb/2X9/I9NX6d/fzC9lDY7Hh/+44sczz4g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NSMi+sI6BfxNdjGVuI7k1YPEEB3cI1ZteuMz/i77RX6ZKVVtc7G5wTT1aSxozuebA
 XMflo8Dg43jH0NMQTNts8wq5qxJk/KX2JwIt/jhxJDVCZ4nfBlEdutImR4Y8TcCGYr
 a/LZp8xVwK5rZ8s5TpytyreXMUjrkSIDT3dfjZA+mKTMjzNxb00w63F9LCi2sDaXhM
 TIDpgJYw9Skn+WXlBrEQ6c6lH13pqYKgkqZjUgH+ju6TbeV8JhlZv2pzeLBH9H8w9a
 hApED5WPIbOVRA8ssP34+b8l6uizHChdo0YvbYvAoSbbprKSYOk6daNln8naVIVuOY
 ngrqmh3HwUXXQ==
Date: Tue, 8 Apr 2025 07:50:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Message-ID: <20250408075047.69d031a9@kernel.org>
In-Reply-To: <20250407231746.2316518-1-sean.anderson@linux.dev>
References: <20250407231746.2316518-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Eric Dumazet <edumazet@google.com>, "David S .
 Miller" <davem@davemloft.net>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 UNGLinuxDriver@microchip.com, linux-stm32@st-md-mailman.stormreply.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Joyce Ooi <joyce.ooi@intel.com>,
 linux-doc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Clark Wang <xiaoning.wang@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
 Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Robert Hancock <robert.hancock@calian.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Wei Fang <wei.fang@nxp.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, upstream@airoha.com,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [net-next PATCH v2 00/14] Add PCS core support
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

T24gTW9uLCAgNyBBcHIgMjAyNSAxOToxNzozMSAtMDQwMCBTZWFuIEFuZGVyc29uIHdyb3RlOgo+
IFRoaXMgc2VyaWVzIGRlcGVuZHMgb24gWzEsMl0sIGFuZCB0aGV5IGhhdmUgYmVlbiBpbmNsdWRl
ZCBhdCB0aGUKPiBiZWdpbm5pbmcgc28gQ0kgd2lsbCBydW4uIEhvd2V2ZXIsIEkgZXhwZWN0IHRo
ZW0gdG8gYmUgcmV2aWV3ZWQvYXBwbGllZAo+IG91dHNpZGUgdGhlIG5ldC1uZXh0IHRyZWUuCgpU
aGVzZSBhcHBlYXIgdG8gYnJlYWsgdGhlIGJ1aWxkOgoKZHJpdmVycy9hY3BpL3Byb3BlcnR5LmM6
MTY2OTozOTogZXJyb3I6IGluaXRpYWxpemF0aW9uIG9mIOKAmGludCAoKikoY29uc3Qgc3RydWN0
IGZ3bm9kZV9oYW5kbGUgKiwgY29uc3QgY2hhciAqLCBjb25zdCBjaGFyICosIGludCwgIHVuc2ln
bmVkIGludCwgIHN0cnVjdCBmd25vZGVfcmVmZXJlbmNlX2FyZ3MgKinigJkgZnJvbSBpbmNvbXBh
dGlibGUgcG9pbnRlciB0eXBlIOKAmGludCAoKikoY29uc3Qgc3RydWN0IGZ3bm9kZV9oYW5kbGUg
KiwgY29uc3QgY2hhciAqLCBjb25zdCBjaGFyICosIHVuc2lnbmVkIGludCwgIHVuc2lnbmVkIGlu
dCwgIHN0cnVjdCBmd25vZGVfcmVmZXJlbmNlX2FyZ3MgKinigJkgWy1XaW5jb21wYXRpYmxlLXBv
aW50ZXItdHlwZXNdCiAxNjY5IHwgICAgICAgICAgICAgICAgIC5nZXRfcmVmZXJlbmNlX2FyZ3Mg
PSBhY3BpX2Z3bm9kZV9nZXRfcmVmZXJlbmNlX2FyZ3MsICAgXAoKQ291bGQgeW91IHBvc3QgYXMg
UkZDIHVudGlsIHdlIGNhbiBhY3R1YWxseSBtZXJnZSB0aGlzPyBJJ20gd29ycmllZCAKc29tZSBz
bGVlcCBkZXByaXZlZCBtYWludGFpbmVyIG1heSBtaXNzIHRoZSBub3RlIGluIHRoZSBjb3ZlciBs
ZXR0ZXIKYW5kIGp1c3QgYXBwbHkgaXQgYWxsIHRvIG5ldC1uZXh0Li4KLS0gCnB3LWJvdDogY3IK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
