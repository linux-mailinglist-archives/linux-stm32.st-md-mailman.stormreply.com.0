Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEB26C8250
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Mar 2023 17:25:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6B1EC6A603;
	Fri, 24 Mar 2023 16:25:32 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0A3CC6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 16:25:31 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E9A0624000B;
 Fri, 24 Mar 2023 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1679675131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mLzWeLxSuEsnoumPpXxnCEwUl43WWezW7vONFSan/CU=;
 b=MrA2p34aD+1+1n6ZmzwtodiD1bIwrXlGZBz9KJaD1qOBCd1d1xkbl0kVYrWvRK9mVQCpta
 zyh7TfW7RdjXZKiWiAdLx8v+IK6xId+N0lj5hTypSvsjc22EIiTTG2SU3BPODUGSGTty9b
 VXJLnAn7KDPf/Emr3zr9PyRm+7M/YGMBU0VQkl6uikJOuESb13jVZQOaHWBkHg5Sf7yc3v
 YnJRzamlfX/aSt8+Huv7/vRwDrWsphlvmIm36yx29XKNbWn6oX4MQxSHPOEarqgDVmG6kY
 G/GPKZEUFLXoyVbwzKGHyZSxbz3dBdUcw9Wp3II+fKCFBpclrvFldgJcAxLxQg==
Date: Fri, 24 Mar 2023 17:25:28 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Message-ID: <20230324172528.4d3ccd4b@xps-13>
In-Reply-To: <20230324160918.826452-1-christophe.kerello@foss.st.com>
References: <20230324160918.826452-1-christophe.kerello@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: richard@nod.at, linux-stm32@st-md-mailman.stormreply.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] mtd: rawnand: stm32_fmc2: do not support
	EDO mode
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
cmksIDI0IE1hciAyMDIzIDE3OjA5OjE4ICswMTAwOgoKPiBGTUMyIGNvbnRyb2xsZXIgZG9lcyBu
b3Qgc3VwcG9ydCBFRE8gbW9kZSAodGltaW5ncyBtb2RlIDQgYW5kIDUpLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQGZvc3Muc3QuY29t
Pgo+IEZpeGVzOiAyY2Q0NTdmMzI4YzEgKCJtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IGFkZCBT
VE0zMiBGTUMyIE5BTkQgZmxhc2ggY29udHJvbGxlciBkcml2ZXIiKQo+IC0tLQo+ICBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQu
Ywo+IGluZGV4IDVkNjI3MDQ4YzQyMC4uM2FiYjYzZDAwYTBiIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMKPiBAQCAtMTUzMSw2ICsxNTMxLDkgQEAgc3RhdGljIGlu
dCBzdG0zMl9mbWMyX25mY19zZXR1cF9pbnRlcmZhY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwg
aW50IGNoaXBuciwKPiAgCWlmIChJU19FUlIoc2RydCkpCj4gIAkJcmV0dXJuIFBUUl9FUlIoc2Ry
dCk7Cj4gIAo+ICsJaWYgKHNkcnQtPnRSQ19taW4gPCAzMDAwMCkKCldoZW4gaW50cm9kdWNpbmcg
TlYtRERSIHN1cHBvcnQgd2UgYXMgd2VsbCBhZGRlZCBhIHRpbWluZ3MubW9kZSBmaWVsZCwKcGVy
aGFwcyB5b3UgY291bGQgdXNlIGl0PwoKPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4gKwo+ICAJ
aWYgKGNoaXBuciA9PSBOQU5EX0RBVEFfSUZBQ0VfQ0hFQ0tfT05MWSkKPiAgCQlyZXR1cm4gMDsK
PiAgCgoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
