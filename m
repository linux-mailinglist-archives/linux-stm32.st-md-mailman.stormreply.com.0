Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2502F885611
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Mar 2024 09:52:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9687C6DD68;
	Thu, 21 Mar 2024 08:52:02 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE1A2C6C85A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 08:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=baXGPugzpNhp5EWukSQW5hfM6IxZYyCnn6Z0nPisxm8=; 
 b=Miyzv5ruHAoxiUcwZ87t6mGmhcgWjZCHSLrAGf+D41PCzcjD8F/AVuIIe+5VtMOf/rfadsU/UQy
 4vmwlq+TtLiG5Kb9hu+6g0sBZ2VMGlqnSKeowrws/N0nmROt7bDVCHK3SvNN/ahFkvS9w9oIUePxM
 9kicmFLMm+7NC6h0BnIoH59HQ6Rr8pIWNCRgbmGcq3KKeMWktbgtKvDTrf3ciRYdI0X302Lja0b8x
 sH8ycjfwC3zxIeg1qiHubsmjRJ7iLfp7/pQVS8g4X5/gFStqIrP09IhqnCaNCuHv5qAc9Ww8slVoR
 i/8zdeA2Z1wsHmFzLoJkozM1M1BcvOCEPK7A==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1rnE9Y-000OaP-HA; Thu, 21 Mar 2024 09:52:00 +0100
Received: from [185.17.218.86] (helo=smtpclient.apple)
 by sslproxy03.your-server.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <sean@geanix.com>) id 1rnE9X-000NyH-2X;
 Thu, 21 Mar 2024 09:51:59 +0100
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <99dad358-0ca8-4f19-9d0c-e41c095db8c7@foss.st.com>
Date: Thu, 21 Mar 2024 09:51:58 +0100
Message-Id: <E4D73AB8-C245-4931-9E18-BCA7219EA8CE@geanix.com>
References: <4A53A669-C3AF-4D29-B5A5-0F7FEBA79045@geanix.com>
 <99dad358-0ca8-4f19-9d0c-e41c095db8c7@foss.st.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27220/Wed Mar 20 09:25:13 2024)
Cc: =?utf-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>,
 yannick.fertre@foss.st.com, dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] STM32 DSI controller driver: mode_valid clock
	tolerance
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

SGkgUmFwaGFlbCwKCj4gT24gMjAgTWFyIDIwMjQsIGF0IDE1LjE0LCBSYXBoYWVsIEdhbGxhaXMt
UG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPiB3cm90ZToKPiAKPiAKPiBPbiAz
LzgvMjQgMDk6MzUsIFNlYW4gTnlla2phZXIgd3JvdGU6Cj4+IEhpLAo+IAo+IAo+IEhpIFNlYW4s
Cj4gCj4gCj4gU29ycnkgZm9yIG5vdCByZXNwb25kaW5nIGVhcmxpZXIuCgpOUCA6KQoKPiAKPiBJ
J3ZlIGFsc28gYWRkZWQgQW50b25pbyBCb3JuZW8sIHdoaWNoIGlzIHRoZSBhdXRob3Igb2YgdGhl
IGltcGxlbWVudGF0aW9uIG9mIHRoZQo+IG1vZGVfdmFsaWQoKSBob29rLgo+IAo+PiBJ4oCZbSB1
c2luZyBhIHN0bTMybXAxNTcgd2l0aCBhIHNuNjVkc2k4MyBEU0kyTFZEUyBicmlkZ2UuCj4+IFRo
ZSBMVkRTIGRpc3BsYXkgaXMgaGF2aW5nIGEgbWluaW11bSBjbG9jayBvZiAyNS4yIE1IeiwgdHlw
aWNhbCBvZiAyNywyIE1IeiBhbmQgYSBtYXggb2YgMzAsNSBNSHouCj4+IAo+PiBJIHdpbGwgZmFp
bCB0aGUgbW9kZV92YWxpZCBjaGVjayB3aXRoIE1PREVfQ0xPQ0tfUkFOR0UuCj4+IEl0IHdpbGwg
cmVxdWVzdCAyNzIwMDAwMCBIeiwgYnV0IGlzIGdldHRpbmcgMjcyNTAwMDAuIEd1ZXNzIHRoZSBk
aXNwbGF5IGlzIGZpbmUgd2l0aCB0aGlzIDopCj4+IAo+PiBJbiB0aGlzIGNhc2UgaXQgc2VlbXMg
YSBiaXQgaGFyc2ggdG8gZmFpbCBpZiB0aGUgb3V0cHV0IGNsb2NrIGlzbuKAmXQgd2l0aGluIDUw
IEh6IG9mIHRoZSByZXF1ZXN0ZWQgY2xvY2suCj4+IAo+PiBJZiBIRE1JIGlzIHJlcXVpcmluZyBh
IHRvbGVyYW5jZSBvZiA1MCBIeiwgd291bGQgaXQgYmUgYmV0dGVyIHRvIGRvIHRoZSBjaGVjayBp
biB0aGUgSERNSSBicmlkZ2UgZHJpdmVyPwo+IAo+IEF0IHRoZSB0aW1lIHdoZW4gdGhlIGRyaXZl
ciB3YXMgaW1wbGVtZW50ZWQsIGEgbGFyZ2Ugc2V0IG9mIFRWcy9IRE1JIHBhbmVscyB3ZXJlCj4g
dGVzdGVkLCBhbmQgaXQgd2FzIHRoZSAnb3B0aW1hbCcgcGFyYW1ldGVyIGZvdW5kLCBldmVuIGlm
IHRoZSB2YWx1ZSBpcyBxdWl0ZQo+IHJlc3RyaWN0aXZlLgoKT2ssIGxldOKAmXMga2VlcCB0aWwg
NTBIeiB0b2xlcmFuY2UgYXMgYSBkZWZhdWx0LgoKPiAKPiBBcyBNYXhpbWUgc2FpZCBlYXJsaWVy
LCBpdCB3YXMgYWxzbyBlYXNpZXIgdG8gaW1wbGVtZW50IHRoaXMgdG9sZXJhbmNlIGRpcmVjdGx5
Cj4gd2l0aGluIHRoZSBEU0kgZHJpdmVyLCBzaW5jZSBvbmx5IHRoZSBkaXNwbGF5LWNvbnRyb2xs
ZXIgYW5kIHRoZSBkcml2ZXIgaXRzZWxmCj4gaGF2ZSBhY2Nlc3MgdG8gdGhpcyBjbG9jay4KPiAK
PiAKPiBFdmVudHVhbGx5IGEgZGV2aWNlLXRyZWUgcGFyYW1ldGVyIGNvdWxkIGJlIGltcGxlbWVu
dGVkLCB3aXRoIGRlZmF1bHQgdmFsdWUgdG8KPiA1MEh6LCBzbyB0aGF0IGZpbmUgdHVuaW5nIGNh
biBiZSBkb25lIHVzaW5nIG90aGVyIGJyaWRnZXMuCgpJdCBkb2VzbuKAmXQgbG9vayB0aGF0IGRp
ZmZpY3VsdCB0byBhZGQgdGhlIHRvbGVyYW5jZSBhcyBhIGRldmljZSB0cmVlIG9wdGlvbi4KTmFt
aW5nIGlzIGFsd2F5cyBxdWl0ZSBoYXJkLCBjb3VsZCB0aGUgbmFtZSBiZSBzdCxjbG9ja190b2xl
cmFuY2UgPSA8NTA+OyA/CgpJIGNhbuKAmXQgZmluZCBvdGhlciBkcml2ZXJzIHRoYXQgaGF2ZSB0
aGlzIHRvbGVyYW5jZSBvcHRpb24gbm9yIGhhdmUgYSBkZXZpY2UgdHJlZSBvcHRpb24uCgovU2Vh
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
