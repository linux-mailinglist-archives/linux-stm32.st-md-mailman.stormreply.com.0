Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E491A6ABC2
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Mar 2025 18:15:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3B1AC78F67;
	Thu, 20 Mar 2025 17:15:16 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27EEEC78F60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Mar 2025 17:15:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8861443AB;
 Thu, 20 Mar 2025 17:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742490914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxcpHL6JN0oeezTkg7NVy58dIuvVNMDJ2U1SuOSdwYU=;
 b=J9IJpfJxCUQy4Nmv3ICqgxXGSZ6zv41jNmXAdsbdKwqXzLaMoy2ew7RCtXu5kef/Qj3UaF
 2+zElCQGrOuVLtFPPGpzcf0ORi6zbAgThOr3jt8MSGqTewV8LkyAcFrOub33cnTGhHm4ar
 +Yjt05/rZBHpbLjzJ0yMU4mJPyS1sVB0JlyPwtCLy0Rek9OG/1w4yvPoe0lqnNZN7Hy4ZH
 iDkGER6Agr4nUeyy4ujo3PCO0lt28Nff7uJGFke26TRdk+V2mG5xX4NQNx6whIo35RVIvA
 mOBc/Tkse0yiIsQ/+2DTBIftNn2i5pBmRhc9cRmwADMAw5PcFX20fwBKo1+lIA==
Date: Thu, 20 Mar 2025 18:15:08 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Message-ID: <20250320181508.132c4636@bootlin.com>
In-Reply-To: <20250319092951.37667-7-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
 <20250319092951.37667-7-jirislaby@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefledprhgtphhtthhopehjihhrihhslhgrsgihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehmrgiisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvl
 hdrohhrghdprhgtphhtthhopegrthgvnhgrrhhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhioh
X-GND-Sasl: herve.codina@bootlin.com
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-mips@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
 Janne Grunau <j@jannau.net>, linux-riscv@lists.infradead.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 Alexandre Ghiti <alex@ghiti.fr>, asahi@lists.linux.dev, maz@kernel.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 Huacai Chen <chenhuacai@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Kevin Hilman <khilman@baylibre.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Sven Peter <sven@svenpeter.dev>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Tero Kristo <kristo@kernel.org>,
 Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Anup Patel <anup@brainfault.org>,
 Imre Kaloz <kaloz@openwrt.org>, Antoine Tenart <atenart@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 06/57] irqdomain: irqchip: Switch to
 of_fwnode_handle()
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

SGkgSmlyaSwKCk9uIFdlZCwgMTkgTWFyIDIwMjUgMTA6Mjg6NTkgKzAxMDAKIkppcmkgU2xhYnkg
KFNVU0UpIiA8amlyaXNsYWJ5QGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBvZl9ub2RlX3RvX2Z3bm9k
ZSgpIGlzIGlycWRvbWFpbidzIHJlaW1wbGVtZW50YXRpb24gb2YgdGhlICJvZmZpY2lhbGx5Igo+
IGRlZmluZWQgb2ZfZndub2RlX2hhbmRsZSgpLiBUaGUgZm9ybWVyIGlzIGluIHRoZSBwcm9jZXNz
IG9mIGJlaW5nCj4gcmVtb3ZlZCwgc28gdXNlIHRoZSBsYXR0ZXIgaW5zdGVhZC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKaXJpIFNsYWJ5IChTVVNFKSA8amlyaXNsYWJ5QGtlcm5lbC5vcmc+CgpSZXZp
ZXdlZC1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+CkFja2VkLWJ5
OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4gIyBpcnEtbGFuOTY2eC1v
aWMKCkJlc3QgcmVnYXJkcywKSGVydsOpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
