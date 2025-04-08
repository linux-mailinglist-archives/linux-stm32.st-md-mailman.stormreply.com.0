Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E2CA81014
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Apr 2025 17:33:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07D10C78F75;
	Tue,  8 Apr 2025 15:33:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F04BC78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Apr 2025 15:33:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DB91E614FE;
 Tue,  8 Apr 2025 15:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF28EC4CEE9;
 Tue,  8 Apr 2025 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744126406;
 bh=jTDbRpm/2plpGWyuZcgnOrksZvCKonLIj49TrwkLGMg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gIUnuqwmDKh1UdrcyGo5h8XkMiMGPrHjGP2Cmlp/98SG+JZqvfK3OyBJ+YaEE/Dw5
 H6pY6EMPjEV6BhiE9oYP/y9FYAJYJMr9WztK+fOVQIp5YV7we+jfWPW1khCxcwglQg
 xakHA48v1mIq6Fp8b1O39NyWxaTPUGkG6DN+U4mttyqTh1f/kLJSXedWGRbJ4/sVpX
 NVgkHtZMImN2NAh4mD3IfY/HwQwNeu73yMxcVR5K77AWicjVlISZoq3O2gwIAwPC9L
 KyUa3uiK/aqdj6hw7DeoXSa6j6ktcUkt8aXr4kggFWZjUtLWWN0oUJLCSktQwPDDgn
 qX2hYtprje98g==
Date: Tue, 8 Apr 2025 08:33:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Message-ID: <20250408083324.3996c141@kernel.org>
In-Reply-To: <08c0e1eb-2de6-45bf-95a4-e817008209ab@linux.dev>
References: <20250407231746.2316518-1-sean.anderson@linux.dev>
 <20250408075047.69d031a9@kernel.org>
 <08c0e1eb-2de6-45bf-95a4-e817008209ab@linux.dev>
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

T24gVHVlLCA4IEFwciAyMDI1IDExOjMwOjQzIC0wNDAwIFNlYW4gQW5kZXJzb24gd3JvdGU6Cj4g
PiBUaGVzZSBhcHBlYXIgdG8gYnJlYWsgdGhlIGJ1aWxkOgo+ID4gCj4gPiBkcml2ZXJzL2FjcGkv
cHJvcGVydHkuYzoxNjY5OjM5OiBlcnJvcjogaW5pdGlhbGl6YXRpb24gb2Yg4oCYaW50ICgqKShj
b25zdCBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqLCBjb25zdCBjaGFyICosIGNvbnN0IGNoYXIgKiwg
aW50LCAgdW5zaWduZWQgaW50LCAgc3RydWN0IGZ3bm9kZV9yZWZlcmVuY2VfYXJncyAqKeKAmSBm
cm9tIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUg4oCYaW50ICgqKShjb25zdCBzdHJ1Y3QgZndu
b2RlX2hhbmRsZSAqLCBjb25zdCBjaGFyICosIGNvbnN0IGNoYXIgKiwgdW5zaWduZWQgaW50LCAg
dW5zaWduZWQgaW50LCAgc3RydWN0IGZ3bm9kZV9yZWZlcmVuY2VfYXJncyAqKeKAmSBbLVdpbmNv
bXBhdGlibGUtcG9pbnRlci10eXBlc10KPiA+ICAxNjY5IHwgICAgICAgICAgICAgICAgIC5nZXRf
cmVmZXJlbmNlX2FyZ3MgPSBhY3BpX2Z3bm9kZV9nZXRfcmVmZXJlbmNlX2FyZ3MsICAgXAo+ID4g
Cj4gPiBDb3VsZCB5b3UgcG9zdCBhcyBSRkMgdW50aWwgd2UgY2FuIGFjdHVhbGx5IG1lcmdlIHRo
aXM/IEknbSB3b3JyaWVkIAo+ID4gc29tZSBzbGVlcCBkZXByaXZlZCBtYWludGFpbmVyIG1heSBt
aXNzIHRoZSBub3RlIGluIHRoZSBjb3ZlciBsZXR0ZXIKPiA+IGFuZCBqdXN0IGFwcGx5IGl0IGFs
bCB0byBuZXQtbmV4dC4uICAKPiAKPiBJIHdvdWxkIHJlYWxseSBsaWtlIHRvIGtlZXAgUkZDIG9m
ZiB0aGUgdGl0bGVzIHNpbmNlIHNvbWUgcmV2aWV3ZXJzIGRvbid0Cj4gcGF5IGF0dGVudGlvbiB0
byBSRkMgc2VyaWVzLgo+IAo+IFdvdWxkIFtETyBOT1QgTUVSR0VdIGluIHRoZSBzdWJqZWN0IGJl
IE9LPwoKVGhhdCB3b3JrcyB0b28uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
