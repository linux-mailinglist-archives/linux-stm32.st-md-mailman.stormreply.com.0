Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0111677DB0F
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 09:23:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C7F4C6B45F;
	Wed, 16 Aug 2023 07:23:04 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D72C4C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 07:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=19wNukchLNZN0X4BtCFwuraW6co2nA0L6OybOEKuK5o=; 
 b=YpNByOB7g1IeEdiFV3iyCqTmeHxRkXVPCM3MQO1wt1Ns/37QoLBuTNDcbRj7Q0jxudCwuubWM9E
 QFRwLXTTz4fx+k7kp5fwULyg12M2nNMm8MI5cWF/ta+/3RwElmDJE86zQOpKuJXVF35J0ahG6avpe
 E0gnMtU8iZUnK7NOAjjNcehgEgIRfwtNNvMbwXMhkCeM55cgwLCgyEmizU/JMkdms7cxV30vhahf4
 BdqmYVoSiAyOmUMCzUexKIf/U5XXyNuvqAXqrVTamc4OUF1vwSgjwcBEj9degPrODmzSCWpoRSICJ
 P7jwylFy7oDDEbU9h9uSoEREx8hUbxgkaBcQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qWArr-0004Ll-VD; Wed, 16 Aug 2023 09:22:59 +0200
Received: from [2a06:4004:10df:0:1cda:5a2e:6344:82ff] (helo=smtpclient.apple)
 by sslproxy05.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <sean@geanix.com>)
 id 1qWArr-0004Ez-FQ; Wed, 16 Aug 2023 09:22:59 +0200
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <5E10F2AD-6D7E-4F2F-ACEB-B6FD3C71C85D@geanix.com>
Date: Wed, 16 Aug 2023 09:22:48 +0200
Message-Id: <CB5067F1-28CC-4011-A6FF-0695916D764C@geanix.com>
References: <20230718105435.2641207-1-sean@geanix.com>
 <20230802100709.GB2156918@gnbcxd0016.gnb.st.com>
 <5E10F2AD-6D7E-4F2F-ACEB-B6FD3C71C85D@geanix.com>
To: Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27001/Tue Aug 15 09:40:17 2023)
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] i2c: stm32f7: Add atomic_xfer method
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

SGkgQWxhaW4sCgo+IE9uIDE2IEF1ZyAyMDIzLCBhdCAwOS4wMiwgU2VhbiBOeWVramFlciA8c2Vh
bkBnZWFuaXguY29tPiB3cm90ZToKPiAKClsg4oCmIF0KCj4+PiBfZGV2IHsKPj4+IHUzMiBkbmZf
ZHQ7Cj4+PiB1MzIgZG5mOwo+Pj4gc3RydWN0IHN0bTMyZjdfaTJjX2FsZXJ0ICphbGVydDsKPj4+
ICsgYm9vbCBhdG9taWM7Cj4+IAo+PiBJIGFtIHdvbmRlcmluZyBpZiB0aGlzIGF0b21pYyByZWFs
bHkgbmVlZHMgdG8gYmUgd2l0aGluIHRoZSBzdHJ1Y3QuCj4+IEl0IGNvdWxkIHdlbGwgYmUgZ2l2
ZW4gYXMgbGFzdCBhcmcgb2Ygc3RtMzJmN19pMmNfeGZlcl9jb3JlIGFuZAo+PiBzdG0zMmY3X2ky
Y194ZmVyIGZ1bmN0aW9ucy4KPiAKPiBBZ3JlZS4KClNjcmF0Y2ggdGhhdOKApgpUaGUgYXRvbWlj
IHdhcyBpbmNsdWRlZCBpbiB0aGUgc3RydWN0IGJlY2F1c2UgaXTigJlzIGFsc28gdXNlZCBpbiB0
aGUgaXNyIGZ1bmN0aW9uLCBhcyB0aGUgaXNyIGZ1bmN0aW9uIGlzIGNhbGxpbmcgc3RtMzJmN19p
MmNfeGZlcl9tc2coKQoKL1NlYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
