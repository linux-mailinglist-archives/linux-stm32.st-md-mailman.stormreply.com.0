Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8ADAD9C5A
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Jun 2025 13:08:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1F29C36B3D;
	Sat, 14 Jun 2025 11:08:38 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90A2EC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Jun 2025 11:08:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 119D04A284;
 Sat, 14 Jun 2025 11:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9A3C4CEEF;
 Sat, 14 Jun 2025 11:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749899314;
 bh=e8lIQX1RhoFgT10N8YKrRLRbZf5gcBZWZ3yjEM3FJv8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=debgul3IwFpyHn2BjIjKMwWjvW1oBXqpauRenlMl4eIJudR51MoBbrO0P1AiRN+lg
 5VdStoRc+i2HkmEk7y+nyWc2cr10gliBU1V/haXN2va5wtU1XCReinIzNv2PeB/IUS
 /tDAkVi7TZaMtdti9FYizgOHFQCA6eJMU8cbc9dpSiB0BCwMEWawKGY05lBCKGMzLI
 bewyVLyapd2SMgZbn/NC+OXd/NWulf7ICfVWYxetNaBTRLWiUr64FAXWK85NvF4p6+
 bQTQ9LQYPdp38bP2ANyXMOv2VUamYDqBCH+Exuf2n326kFJ6mBty0g0gL+B6ihgWyW
 jQB/iKEqtuxLA==
Date: Sat, 14 Jun 2025 12:08:27 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Message-ID: <20250614120827.54b2e77a@jic23-huawei>
In-Reply-To: <46208c8d-8370-4b9e-bca1-7ede7ee9b078@baylibre.com>
References: <0ec0fd5e-8fbe-43c4-8aad-f36d2872f280@baylibre.com>
 <20250612084627.217341-1-jirislaby@kernel.org>
 <46208c8d-8370-4b9e-bca1-7ede7ee9b078@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, linux-iio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, tglx@linutronix.de,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] iio: adc: stm32-adc: Use dev_fwnode()
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

T24gRnJpLCAxMyBKdW4gMjAyNSAxMjowMDoxMCAtMDUwMApEYXZpZCBMZWNobmVyIDxkbGVjaG5l
ckBiYXlsaWJyZS5jb20+IHdyb3RlOgoKPiBPbiA2LzEyLzI1IDM6NDYgQU0sIEppcmkgU2xhYnkg
KFNVU0UpIHdyb3RlOgo+ID4gaXJxX2RvbWFpbl9jcmVhdGVfc2ltcGxlKCkgdGFrZXMgZndub2Rl
IGFzIHRoZSBmaXJzdCBhcmd1bWVudC4gSXQgY2FuIGJlCj4gPiBleHRyYWN0ZWQgZnJvbSB0aGUg
c3RydWN0IGRldmljZSB1c2luZyBkZXZfZndub2RlKCkgaGVscGVyIGluc3RlYWQgb2YKPiA+IHVz
aW5nIG9mX25vZGUgd2l0aCBvZl9md25vZGVfaGFuZGxlKCkuCj4gPiAKPiA+IFNvIHVzZSB0aGUg
ZGV2X2Z3bm9kZSgpIGhlbHBlci4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmlyaSBTbGFieSAo
U1VTRSkgPGppcmlzbGFieUBrZXJuZWwub3JnPgo+ID4gQ2M6IEpvbmF0aGFuIENhbWVyb24gPGpp
YzIzQGtlcm5lbC5vcmc+Cj4gPiBDYzogRGF2aWQgTGVjaG5lciA8ZGxlY2huZXJAYmF5bGlicmUu
Y29tPgo+ID4gQ2M6ICJOdW5vIFPDoSIgPG51bm8uc2FAYW5hbG9nLmNvbT4KPiA+IENjOiBBbmR5
IFNoZXZjaGVua28gPGFuZHlAa2VybmVsLm9yZz4KPiA+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1j
b3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4gPiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFu
ZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPiA+IENjOiBsaW51eC1paW9Admdlci5rZXJuZWwub3Jn
Cj4gPiAKPiA+IC0tLSAgCj4gUmV2aWV3ZWQtYnk6IERhdmlkIExlY2huZXIgPGRsZWNobmVyQGJh
eWxpYnJlLmNvbT4KPiAKPiAKQXBwbGllZC4gVGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
