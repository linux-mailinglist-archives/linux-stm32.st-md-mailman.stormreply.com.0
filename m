Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A966C8213
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Mar 2023 17:03:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BE31C6A603;
	Fri, 24 Mar 2023 16:03:25 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F4FDC6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 16:03:24 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F3B29FF80B;
 Fri, 24 Mar 2023 16:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1679673804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e/Ot0XeBt4bh9S+cBPdCZ8iwvY0dcGmED6USv22SRnM=;
 b=BN22IGMZfMTPJUAD9JudirnCVZS8EtGHY8K8BBURZujAXY/BvR54yys/qrYZIVCxyYflSP
 AikEEJ4YmqmlZbNOMemXEdao26esr6xDfEmVdFz+KufTp8PQoHKUVNBYvdzzHU/hadKb1n
 rJzyQwdn75aimiV0tljZA6qnou0wBE06O3hApQj6gYT1QRn+MAmFrNbqHW8Bs/MvUaLBNi
 7MO4Hzpik1h27xB8Q1Ugzn/kyTe44hWlD+zhz1y2ARNpqq76PBoYJ0jZNg2XJ0HHHAHzla
 SsEwmYFrxf+m345laNq4FEbaPEJM0oO8DGAl1Ii8K7HvoaqDetBZ1lJRYYf39w==
Date: Fri, 24 Mar 2023 17:03:20 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Message-ID: <20230324170320.5087c223@xps-13>
In-Reply-To: <20230324155105.826063-1-christophe.kerello@foss.st.com>
References: <20230324155105.826063-1-christophe.kerello@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mtd@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/2] depends on ARCH_STM32 instead of
	MACH_STM32MP157
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

SGkgQ2hyaXN0b3BoZSwKCmNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBG
cmksIDI0IE1hciAyMDIzIDE2OjUxOjAzICswMTAwOgoKPiBUbyBiZSBhYmxlIHRvIGNvbXBpbGUg
dGhlIGRyaXZlciBvbiBhbGwgU1RNMzJNUCBTT0NzLCB3ZSBtb3ZlIHRoZQo+ICJkZXBlbmRzIG9u
IiBvbiBBUkNIX1NUTTMyLgo+IAo+IENocmlzdG9waGUgS2VyZWxsbyAoMik6Cj4gICBtZW1vcnk6
IHN0bTMyLWZtYzItZWJpOiBkZXBlbmRzIG9uIEFSQ0hfU1RNMzIgaW5zdGVhZCBvZgo+ICAgICBN
QUNIX1NUTTMyTVAxNTcKPiAgIG10ZDogcmF3bmFuZDogc3RtMzJfZm1jMjogZGVwZW5kcyBvbiBB
UkNIX1NUTTMyIGluc3RlYWQgb2YKPiAgICAgTUFDSF9TVE0zMk1QMTU3CgpJIGRvbid0IHNlZSBp
c3N1ZSB3aXRoIHRha2luZyB0aGVzZSB0d28gcGF0Y2hlcyBpbiBpbmRlcGVuZGVudCB0cmVlcyBz
bwppZiBub2JvZHkgZGlzYWdyZWVzIEkgd2lsbCB0YWtlIHRoZSBzZWNvbmQgb25lIHRocm91Z2gg
dGhlIG10ZCB0cmVlIGFuZApsZXQgS3J6eXN6dG9mIHRha2UgdGhlIGZpcnN0IG9uZSB0aHJvdWdo
IG1lbS1jdHJsLgoKPiAKPiAgZHJpdmVycy9tZW1vcnkvS2NvbmZpZyAgICAgICB8IDIgKy0KPiAg
ZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZyB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCgoKVGhhbmtzLApNaXF1w6hsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
