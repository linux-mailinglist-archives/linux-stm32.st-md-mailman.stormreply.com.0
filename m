Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A63A093A8
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 15:38:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A0BDC78F6F;
	Fri, 10 Jan 2025 14:38:08 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E64CFC78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 14:38:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 980E5C0007;
 Fri, 10 Jan 2025 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736519880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AqHOTtKrS2nK6owEMQCN+3bics3pst072/Bpdc2sk1Q=;
 b=m/PU3jSVOUgUfNeqSsjZfGTt+SAIExnswQ4nJ1ydWLAlAqDyJgvFnyk8HKoBD9BUxG16hy
 Kxy9n0Cwf1Hc7YihZi5k5w9nwTsGIYKn4FnnKxNF0C/9/xC2AA8aQ8o73ouUrLBlKrfiyx
 AyjzfEzOaOEu/KSVKY/wAa4K7WUjTk5cuP80r3I36oJZfq/WPge2eyw/Q2gARWb7KL+upy
 Ls5pf4WYuuJ+rGBVEyY/yx0BMp8H7ueg0TrVzxvdSUOcEZM3LoiSsfBxWSFXKt701XzzPJ
 /SMNBlfNJ7hqRZFrr0ROsFwE2/gIY4flK+fkxxJW4GO12ujEoN3r4OMJKmWnZQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <ca317e2c-cd09-4884-b9eb-9cf23ae88078@sirena.org.uk> (Mark
 Brown's message of "Fri, 10 Jan 2025 12:42:47 +0000")
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
 <20241224-winbond-6-11-rc1-quad-support-v2-20-ad218dbc406f@bootlin.com>
 <ca317e2c-cd09-4884-b9eb-9cf23ae88078@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 15:37:52 +0100
Message-ID: <87tta6ag5b.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, Steam Lin <stlin2@winbond.com>,
 Tali Perry <tali.perry1@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shan-Chun Hung <schung@nuvoton.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Vignesh Raghavendra <vigneshr@ti.com>, Raju Rangoju <Raju.Rangoju@amd.com>,
 Benjamin Fair <benjaminfair@google.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Joel Stanley <joel@jms.id.au>,
 linux-rockchip@lists.infradead.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Jacky Huang <ychuang3@nuvoton.com>, Sanjay R Mehta <sanju.mehta@amd.com>,
 linux-mediatek@lists.infradead.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi@vger.kernel.org, Daire McNamara <daire.mcnamara@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v2 20/27] spi: spi-mem: Estimate the time
 taken by operations
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

SGkgTWFyaywKCk9uIDEwLzAxLzIwMjUgYXQgMTI6NDI6NDcgR01ULCBNYXJrIEJyb3duIDxicm9v
bmllQGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBUdWUsIERlYyAyNCwgMjAyNCBhdCAwNjowNjow
NVBNICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBJbiB0aGUgU1BJLU5BTkQgbGF5ZXIs
IHdlIGN1cnJlbnRseSBtYWtlIGxpc3Qgb2Ygb3BlcmF0aW9uIHZhcmlhbnRzIGZyb20KPj4gdGhl
IGZhc3Rlc3Qgb25lIHRvIHRoZSBzbG93ZXN0IGFuZCB0aGVyZSBpcyBhIGJpdCBvZiBsb2dpYyBp
biB0aGUgY29yZQo+PiB0byBnbyBvdmVyIHRoZW0gYW5kIHBpY2sgdGhlIGZpcnN0IG9uZSB0aGF0
IGlzIHN1cHBvcnRlZCBieSB0aGUKPj4gY29udHJvbGxlciwgaWUuIHRoZSBmYXN0ZXN0IG9uZSBh
bW9uZyB0aGUgc3VwcG9ydGVkIG9wcy4KPgo+IFRoaXMgYnJlYWtzIHRoZSBidWlsZDoKPgo+IC9i
dWlsZC9zdGFnZS9saW51eC9kcml2ZXJzL3NwaS9zcGktbWVtLmM6NTgwOjU6IGVycm9yOiBjb25m
bGljdGluZyB0eXBlcyBmb3Ig4oCYc3BpX21lbV9jYWxjX29wX2R1cmF0aW9u4oCZOyBoYXZlIOKA
mHU2NChzdHJ1Y3Qgc3BpX21lbV9vcCAqKeKAmSB7YWthIOKAmGxvbmcgbG9uZyB1bnNpZ25lZCBp
bnQoc3RydWN0IHNwaV9tZW1fb3AgKinigJl9Cj4gICA1ODAgfCB1NjQgc3BpX21lbV9jYWxjX29w
X2R1cmF0aW9uKHN0cnVjdCBzcGlfbWVtX29wICpvcCkKCkNyYXAsIHRoYXQncyBhIGZpeHVwIHRo
YXQgbGFuZGVkIGluIHRoZSB3cm9uZyBjb21taXQgKG10ZDogc3BpbmFuZDoKRW5oYW5jZSB0aGUg
bG9naWMgd2hlbiBwaWNraW5nIGEgdmFyaWFudCkuIEknbGwgZml4IGl0LgoKVGhhbmtzLApNaXF1
w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
