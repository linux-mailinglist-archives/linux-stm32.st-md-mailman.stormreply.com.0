Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E38C87457E4
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jul 2023 11:00:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F6A6C6B45A;
	Mon,  3 Jul 2023 09:00:48 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78506C6B453
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jul 2023 09:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=s3S1d1mAF8fMxePjQb4GdgTmpVEFy5v/YG/rsY8z00g=; 
 b=borwZeNYhMf70JYxVnxVQcu7MCBG2AsjMN6P33P7/loB6oHNCKymp7tvwbNGAOBUuohAfqkzQBz
 CgIs0DK4VfX379T188k/V2s0I4BIDwc7wNH0SCQg96DDo7j11IZz3EzS8RN43RsW/K+JJn+rnIYNv
 kZOZbvNMKyF4znag43vhaJAqxbPRYy/+13oVsiFfEdL8cojfAsYSYx8gjctvnx7Ec7XonojNB4U30
 Zm/hAOQpPfThGev8ngVTsiJC+H2vOeWZdVdM5eIwW8oofoVsyjccrmWGWY0pPyG4kQyu331SXAK3I
 6RQ6MvYUSdnjhqyYigGhjzocL4VRFxAlynfA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qGFQJ-000BBH-0c; Mon, 03 Jul 2023 11:00:43 +0200
Received: from [185.17.218.86] (helo=smtpclient.apple)
 by sslproxy03.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <sean@geanix.com>)
 id 1qGFQI-000QPD-I4; Mon, 03 Jul 2023 11:00:42 +0200
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <ZJV0/cbjn1Qa62u+@shikoro>
Date: Mon, 3 Jul 2023 11:00:31 +0200
Message-Id: <9BEDFE6D-AE5E-46F1-A1BF-A19C6F5130F6@geanix.com>
References: <20230509132159.4160984-1-sean@geanix.com>
 <ZJV0/cbjn1Qa62u+@shikoro>
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

Cgo+IE9uIDIzIEp1biAyMDIzLCBhdCAxMi4zMywgV29sZnJhbSBTYW5nIDx3c2FAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gCj4gT24gVHVlLCBNYXkgMDksIDIwMjMgYXQgMDM6MjE6NTlQTSArMDIwMCwg
U2VhbiBOeWVramFlciB3cm90ZToKPj4gQWRkIGFuIGF0b21pY194ZmVyIG1ldGhvZCB0byB0aGUg
ZHJpdmVyIHNvIHRoYXQgaXQgYmVoYXZlcyBjb3JyZWN0bHkKPj4gd2hlbiBjb250cm9sbGluZyBh
IFBNSUMgdGhhdCBpcyByZXNwb25zaWJsZSBmb3IgZGV2aWNlIHNodXRkb3duLgo+PiAKPj4gVGhl
IGF0b21pY194ZmVyIG1ldGhvZCBhZGRlZCBpcyBzaW1pbGFyIHRvIHRoZSBvbmUgZnJvbSB0aGUg
aTJjLW12NjR4eHgKPj4gZHJpdmVyLiBXaGVuIHJ1bm5pbmcgYW4gYXRvbWljX3hmZXIgYSBib29s
IGZsYWcgaW4gdGhlIGRyaXZlciBkYXRhIGlzCj4+IHNldCwgdGhlIGludGVycnVwdCBpcyBub3Qg
dW5tYXNrZWQgb24gdHJhbnNmZXIgc3RhcnQsIGFuZCB0aGUgSVJRCj4+IGhhbmRsZXIgaXMgbWFu
dWFsbHkgaW52b2tlZCB3aGlsZSB3YWl0aW5nIGZvciBwZW5kaW5nIHRyYW5zZmVycyB0bwo+PiBj
b21wbGV0ZS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFNlYW4gTnlla2phZXIgPHNlYW5AZ2Vhbml4
LmNvbT4KPiAKPiBQaWVycmUtWXZlcywgQWxhaW4sIGFueSBmdXJ0aGVyIGNvbW1lbnRzIHRvIHRo
aXMgcGF0Y2g/Cj4gCj4+IElzIGl0IG9rYXkgdG8ga2VlcCB0aGUgRE1BIHRyYW5zZmVyIGluIGF0
b21pYz8KPiAKPiBXaWxsIERNQSBhY3R1YWxseSBydW4gaW4gYXRvbWljIG1vZGU/Cj4gCgpIaSBX
b2xmcmFtLAoKQXRvbWljIGlzIG1haW5seShvbmx5KSB1c2VkIGZvciB3cml0aW5nIGEgc2luZ2xl
IHJlZ2lzdGVyIGluIHRoZSBQTUlDIGZvciB0aGUgc3RwbWljLiBHdWVzcyB0aGF0IHdpbGwgbm90
IHRyaWdnZXIgYW55IERNQSB1c2UuCkJ1dCBsZXTigJlzIHdhaXQgZm9yIG90aGVyIGNvbW1lbnRz
4oCmCgovU2VhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
