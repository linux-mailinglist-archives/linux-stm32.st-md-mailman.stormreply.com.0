Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1016745A0F
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jul 2023 12:21:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 850F2C6B45A;
	Mon,  3 Jul 2023 10:21:19 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FF14C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jul 2023 10:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=evH9FssxAVDWuosG3wF0geBaPl42ihY9Va8nTcwYQk4=; 
 b=XGb6qm4+6EvTbcwEm2H5OprpeV+r77KKVrY7nAOjvIOT6XAUTWG2rnI6S7aAss+aDKsVcta5Z1x
 T4JPgD/zZMhCubNS6zfcPjUbhV9m+Y+zePvqVp27wxzSVkPCZ7z6PiFEMPYCPpa4Z8Yp5p6hAm5Lv
 7kZlteiF0dhw8fWH35EaflvEKAaV2dVQ44ID2GjJIrevdWhYjZEwqm7RwjOr9Wmpt0W9yZbhqgs3C
 aPwatGYlzSkw/yXHA/VZ76jcBPpTPwJknlybrr15ZcJSd1DAUjHJt+rO4qMH98RIhOcujUIj+XtCl
 U+wn/hSIJuwNhEpv7RouKmDQwc8p89Blcigg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qGGgD-000N94-Mb; Mon, 03 Jul 2023 12:21:13 +0200
Received: from [185.17.218.86] (helo=smtpclient.apple)
 by sslproxy02.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <sean@geanix.com>)
 id 1qGGgD-000Kxt-7r; Mon, 03 Jul 2023 12:21:13 +0200
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <ZKKZ4qUw5pKVt1T1@shikoro>
Date: Mon, 3 Jul 2023 12:21:02 +0200
Message-Id: <48234852-3206-4F73-A7AD-EE6EBE83D774@geanix.com>
References: <20230509132159.4160984-1-sean@geanix.com>
 <ZJV0/cbjn1Qa62u+@shikoro> <9BEDFE6D-AE5E-46F1-A1BF-A19C6F5130F6@geanix.com>
 <ZKKZ4qUw5pKVt1T1@shikoro>
To: Wolfram Sang <wsa@kernel.org>
X-Mailer: Apple Mail (2.3731.600.7)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26958/Mon Jul  3 09:29:03 2023)
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: Add atomic_xfer method to
	driver
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

Cgo+IE9uIDMgSnVsIDIwMjMsIGF0IDExLjUwLCBXb2xmcmFtIFNhbmcgPHdzYUBrZXJuZWwub3Jn
PiB3cm90ZToKPiAKPiAKPj4+IFdpbGwgRE1BIGFjdHVhbGx5IHJ1biBpbiBhdG9taWMgbW9kZT8K
PiAKPj4gQXRvbWljIGlzIG1haW5seShvbmx5KSB1c2VkIGZvciB3cml0aW5nIGEgc2luZ2xlIHJl
Z2lzdGVyIGluIHRoZSBQTUlDCj4+IGZvciB0aGUgc3RwbWljLgo+IAo+IEFuZCB0aGlzIG1vc3Qg
cHJvYmFibHkgZHVyaW5nIHNodXRkb3duLi4uCj4gCj4+IEd1ZXNzIHRoYXQgd2lsbCBub3QgdHJp
Z2dlciBhbnkgRE1BIHVzZS4KPiAKPiAuLi4gc28gSSdkIGJlIHZlcnkgc3VycHJpc2VkIGlmIERN
QSBpcyBvcGVyYXRpb25hbCB0aGF0IGxhdGUuIEkgdGhpbmsgd2UKPiBjYW4gcnVsZSB0aGF0IG91
dCBpbmRlcGVuZGVudCBvZiBJMkMgbWVzc2FnZXMgdG8gYmUgdHJhc25mZXJyZWQuCj4gCgpZZXMs
IEnigJlsbCBzdWJtaXQgYSBWMiB3aXRob3V0IHRoZSBETUEgZnVuY3Rpb25hbGl0eS4KCi9TZWFu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
