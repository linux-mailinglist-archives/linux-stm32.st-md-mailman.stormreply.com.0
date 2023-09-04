Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBA47910ED
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 07:30:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37CEDC6B44E;
	Mon,  4 Sep 2023 05:30:22 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99ACAC6B44C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 05:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=T3SiwA+nSrWJsUqWupq7/d/RhwtuVgONj1KxvBWGD9k=; 
 b=Z1ah41nntYQGeWDepIDesE4iU1plC8jgCY//AX/UHd5Z92QgvJov+LEtn1+ChtJluc28vZy6PQz
 sD7WI/yIeYC48qNKrxagkbbG6uN3mUNdkdCz5wHIQD71K0d+I1SG42R6IVprvHhLfsqeKsbDgtWYl
 yuBKaH/ZyssIcTaqHA6rT9pFHjTNlZ9wT7fwCKPscXwlAHNlItBHw6Tw+d1ha+Cp56lFU364ctaPf
 9e9PUsVa5B+CCHHIx3CqXP7p7oUqcgwmCdngEOoMKFE7X/Jw+8cH2gtmIDHEL/Pnw+6bwytMTipGV
 MpAdoznskSSnQASrevU+RGQdUlrhjj6wdJrQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qd2A6-0002dP-Cc; Mon, 04 Sep 2023 07:30:10 +0200
Received: from [2a06:4004:10df:0:5108:a08f:8282:7512] (helo=smtpclient.apple)
 by sslproxy01.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <sean@geanix.com>)
 id 1qd2A5-000VKP-MO; Mon, 04 Sep 2023 07:30:09 +0200
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <20230903124620.6yrnpbpj37on6wih@zenone.zhora.eu>
Date: Mon, 4 Sep 2023 07:29:59 +0200
Message-Id: <6A1B6BF0-C298-43D3-9B63-0FB1EC9E902B@geanix.com>
References: <20230816080552.3045491-1-sean@geanix.com>
 <20230903124620.6yrnpbpj37on6wih@zenone.zhora.eu>
To: Andi Shyti <andi.shyti@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27020/Sun Sep  3 09:38:16 2023)
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] i2c: stm32f7: Add atomic_xfer method
	to driver
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

SGkgQW5keSwKCj4gT24gMyBTZXAgMjAyMywgYXQgMTQuNDYsIEFuZGkgU2h5dGkgPGFuZGkuc2h5
dGlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gCj4gSGkgUGllcnJlLVl2ZXMsIEFsYWluLAo+IAo+IG1p
bmQgdGFraW5nIGEgbG9vayBoZXJlPwo+IAo+IFsuLi5dCj4gCj4+IEBAIC0zNTcsNiArMzU3LDcg
QEAgc3RydWN0IHN0bTMyZjdfaTJjX2RldiB7Cj4+IHUzMiBkbmZfZHQ7Cj4+IHUzMiBkbmY7Cj4+
IHN0cnVjdCBzdG0zMmY3X2kyY19hbGVydCAqYWxlcnQ7Cj4+ICsgYm9vbCBhdG9taWM7Cj4gCj4g
dGhpcyBzbWVsbHMgYSBiaXQgcmFjeSBoZXJlLCB0aGlzIHdvcmtzIG9ubHkgaWYgdGhlIHhmZXIn
cyBhcmUKPiBhbHdheXMgc2VxdWVudGlhbC4KPiAKPiBXaGF0IGhhcHBlbnMgd2hlbiB3ZSByZWNl
aXZlIGF0IHRoZSBzYW1lIHRpbWUgdHdvIHhmZXIncywgb25lCj4gYXRvbWljIGFuZCBvbmUgbm9u
IGF0b21pYz8KCkZyb20gdGhlIGluY2x1ZGUvaTJjLmg6CiAqIEBtYXN0ZXJfeGZlcl9hdG9taWM6
IHNhbWUgYXMgQG1hc3Rlcl94ZmVyLiBZZXQsIG9ubHkgdXNpbmcgYXRvbWljIGNvbnRleHQKICog
ICBzbyBlLmcuIFBNSUNzIGNhbiBiZSBhY2Nlc3NlZCB2ZXJ5IGxhdGUgYmVmb3JlIHNodXRkb3du
LiBPcHRpb25hbC4KClNvIGl04oCZcyBvbmx5IHVzZWQgdmVyeSBsYXRlIGluIHRoZSBzaHV0ZG93
bi4KCkl04oCZcyBpbXBsZW1lbnRlZCB0aGUgc2FtZSB3YXkgYXMgaW46CmRyaXZlcnMvaTJjL2J1
c3Nlcy9pMmMtaW14LmMKZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tZXNvbi5jCmRyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtbXY2NHh4eC5jCmRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtdGVncmEuYwrigKYg
ZXRj4oCmCgoKSW4gZHJpdmVycy9pMmMvaTJjLWNvcmUuaCBpdOKAmXMgZGV0ZXJtaW5lZCB3aGV0
aGVyIGl04oCZcyBhdG9taWMgdHJhbnNmZXIgb3Igbm90OgoKLyoKICogV2Ugb25seSBhbGxvdyBh
dG9taWMgdHJhbnNmZXJzIGZvciB2ZXJ5IGxhdGUgY29tbXVuaWNhdGlvbiwgZS5nLiB0byBhY2Nl
c3MgYQogKiBQTUlDIHdoZW4gcG93ZXJpbmcgZG93bi4gQXRvbWljIHRyYW5zZmVycyBhcmUgYSBj
b3JuZXIgY2FzZSBhbmQgbm90IGZvcgogKiBnZW5lcmljIHVzZSEKICovCnN0YXRpYyBpbmxpbmUg
Ym9vbCBpMmNfaW5fYXRvbWljX3hmZXJfbW9kZSh2b2lkKQp7CiAgICAgICAgcmV0dXJuIHN5c3Rl
bV9zdGF0ZSA+IFNZU1RFTV9SVU5OSU5HICYmIGlycXNfZGlzYWJsZWQoKTsKfQoKU28geW91IHdv
dWxkIG5vdCBoYXZlIGFuIGF0b21pYyB0cmFuc2ZlciBhbmQgbGF0ZXIgYW4gbm9uIGF0b21pYy4K
Ci9TZWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
