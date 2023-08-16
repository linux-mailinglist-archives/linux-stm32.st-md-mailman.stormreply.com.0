Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C3977DADB
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 09:02:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FB56C6B45F;
	Wed, 16 Aug 2023 07:02:36 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAD6FC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 07:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=5MhjneJemItWisEeWBJ9xqyHb/f6PYCrLEq/lmLd5KA=; 
 b=J8rD/W08c+MKJzItNdHqV3pDQIwtbiAFDQVtGWBpsFI4YVZPXKJol2wVZn5ZGYmnA2prDmr2FZV
 xZ7kg/zTkbnXzNXwGZRpHVaRAoTYL8tdUXMNKwJgzgScJXh/Vo1QaKWuJs8GIi3ZUI3byRgcat9ij
 EUlRx8mVcFUMk5D4sf8UY8HVbdpbYmasAZBcr9NjXKAJP3zhGISRiplx2aCLo/hiaZXEDe3LlllLV
 zaYzVQeHF/XEIeXRTlClfxIv868r2VJi8m874o7zIJBj0wXpf0PGCZqtF0W8Uuz65tzDv3AaTgfv0
 f6wl9f9UG3gFNuooZXKROE68Pw7EoCjLeZaA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qWAY3-0000hq-QY; Wed, 16 Aug 2023 09:02:31 +0200
Received: from [2a06:4004:10df:0:1cda:5a2e:6344:82ff] (helo=smtpclient.apple)
 by sslproxy03.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <sean@geanix.com>)
 id 1qWAY3-000NjS-BA; Wed, 16 Aug 2023 09:02:31 +0200
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <20230802100709.GB2156918@gnbcxd0016.gnb.st.com>
Date: Wed, 16 Aug 2023 09:02:20 +0200
Message-Id: <5E10F2AD-6D7E-4F2F-ACEB-B6FD3C71C85D@geanix.com>
References: <20230718105435.2641207-1-sean@geanix.com>
 <20230802100709.GB2156918@gnbcxd0016.gnb.st.com>
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

SGkgQWxhaW4sCgpUaGFua3MgZm9yIHRoZSByZXZpZXcKCj4gT24gMiBBdWcgMjAyMywgYXQgMTIu
MDcsIEFsYWluIFZvbG1hdCA8YWxhaW4udm9sbWF0QGZvc3Muc3QuY29tPiB3cm90ZToKPiAKPiBI
aSBTZWFuLAo+IAo+IHNvcnJ5IGZvciB0aGUgZGVsYXkgZm9yIHRoaXMgcmV2aWV3LiAgVGhhbmsg
eW91IEFuZGkgZm9yCj4gdGhlIHJldmlldyBhcyB3ZWxsLgoKQWxzbyBmcm9tIG15IHNpZGUgOikg
VmFjYXRpb24uCgo+IAo+IEZldyBvdGhlciBjb21tZW50cyBpbiBhZGRpdGlvbiB0byB3aGF0IEFu
ZGkgYWxyZWFkeSBtZW50aW9uZWQuCj4gCj4gT24gVHVlLCBKdWwgMTgsIDIwMjMgYXQgMTI6NTQ6
MzVQTSArMDIwMCwgU2VhbiBOeWVramFlciB3cm90ZToKPj4gQWRkIGFuIGF0b21pY194ZmVyIG1l
dGhvZCB0byB0aGUgZHJpdmVyIHNvIHRoYXQgaXQgYmVoYXZlcyBjb3JyZWN0bHkKPj4gd2hlbiBj
b250cm9sbGluZyBhIFBNSUMgdGhhdCBpcyByZXNwb25zaWJsZSBmb3IgZGV2aWNlIHNodXRkb3du
Lgo+PiAKPj4gVGhlIGF0b21pY194ZmVyIG1ldGhvZCBhZGRlZCBpcyBzaW1pbGFyIHRvIHRoZSBv
bmUgZnJvbSB0aGUgaTJjLW12NjR4eHgKPj4gZHJpdmVyLiBXaGVuIHJ1bm5pbmcgYW4gYXRvbWlj
X3hmZXIgYSBib29sIGZsYWcgaW4gdGhlIGRyaXZlciBkYXRhIGlzCj4+IHNldCwgdGhlIGludGVy
cnVwdCBpcyBub3QgdW5tYXNrZWQgb24gdHJhbnNmZXIgc3RhcnQsIGFuZCB0aGUgSVJRCj4+IGhh
bmRsZXIgaXMgbWFudWFsbHkgaW52b2tlZCB3aGlsZSB3YWl0aW5nIGZvciBwZW5kaW5nIHRyYW5z
ZmVycyB0bwo+PiBjb21wbGV0ZS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFNlYW4gTnlla2phZXIg
PHNlYW5AZ2Vhbml4LmNvbT4KPj4gLS0tCj4+IENoYW5nZXMgc2luY2UgdjE6Cj4+IC0gUmVtb3Zl
ZCBkbWEgaW4gYXRvbWljCj4+IAo+PiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYyB8
IDExMSArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4+IDEgZmlsZSBjaGFuZ2VkLCA3
OCBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3Rt
MzJmNy5jCj4+IGluZGV4IGU4OTdkOTEwMTQzNC4uZDk0NGI4Zjg1ZDFjIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYwo+PiArKysgYi9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLXN0bTMyZjcuYwo+PiBAQCAtMzU3LDYgKzM1Nyw3IEBAIHN0cnVjdCBzdG0zMmY3
X2kyY19kZXYgewo+PiB1MzIgZG5mX2R0Owo+PiB1MzIgZG5mOwo+PiBzdHJ1Y3Qgc3RtMzJmN19p
MmNfYWxlcnQgKmFsZXJ0Owo+PiArIGJvb2wgYXRvbWljOwo+IAo+IEkgYW0gd29uZGVyaW5nIGlm
IHRoaXMgYXRvbWljIHJlYWxseSBuZWVkcyB0byBiZSB3aXRoaW4gdGhlIHN0cnVjdC4KPiBJdCBj
b3VsZCB3ZWxsIGJlIGdpdmVuIGFzIGxhc3QgYXJnIG9mIHN0bTMyZjdfaTJjX3hmZXJfY29yZSBh
bmQKPiBzdG0zMmY3X2kyY194ZmVyIGZ1bmN0aW9ucy4KCkFncmVlLgoKPiAKPiAKPj4gfTsKPj4g
Cj4+IAoKWyDigKYgXQoKPj4gQEAgLTE2NzAsNyArMTY3NiwyMiBAQCBzdGF0aWMgaXJxcmV0dXJu
X3Qgc3RtMzJmN19pMmNfaXNyX2Vycm9yKGludCBpcnEsIHZvaWQgKmRhdGEpCj4+IHJldHVybiBJ
UlFfSEFORExFRDsKPj4gfQo+PiAKPj4gLXN0YXRpYyBpbnQgc3RtMzJmN19pMmNfeGZlcihzdHJ1
Y3QgaTJjX2FkYXB0ZXIgKmkyY19hZGFwLAo+PiArc3RhdGljIGludCBzdG0zMmY3X2kyY193YWl0
X3BvbGxpbmcoc3RydWN0IHN0bTMyZjdfaTJjX2RldiAqaTJjX2RldikKPj4gK3sKPj4gKyBrdGlt
ZV90IHRpbWVvdXQgPSBrdGltZV9hZGRfbXMoa3RpbWVfZ2V0KCksIGkyY19kZXYtPmFkYXAudGlt
ZW91dCk7Cj4+ICsKPj4gKyB3aGlsZSAoa3RpbWVfY29tcGFyZShrdGltZV9nZXQoKSwgdGltZW91
dCkgPCAwKSB7Cj4+ICsgdWRlbGF5KDUpOwo+PiArIHN0bTMyZjdfaTJjX2lzcl9ldmVudCgwLCBp
MmNfZGV2KTsKPj4gKwo+PiArIGlmICh0cnlfd2FpdF9mb3JfY29tcGxldGlvbigmaTJjX2Rldi0+
Y29tcGxldGUpKQo+PiArIHJldHVybiAxOwo+IAo+IEkgYWdyZWUgd2l0aCB0aGUgY29tcGxldGUg
LyB3YWl0X2Zvcl9jb21wbGV0aW9uIGFwcHJvYWNoIHNpbmNlIGl0IGFsbG93cwo+IHRvIGtlZXAg
bW9zdCBvZiBjb2RlIGNvbW1vbiBieSBtYW51YWxseSBjYWxsaW5nIHRoZSBpc3JfZXZlbnQgZm9y
Cj4gY2hlY2tpbmcgc3RhdHVzIGJpdHMuICBIb3dldmVyIHdoYXQgYWJvdXQgdXNpbmcgY29tcGxl
dGlvbl9kb25lIGluc3RlYWQKPiBvZiB0cnlfd2FpdF9mb3JfY29tcGxldGlvbiBoZXJlID8gVGhp
cyBzaG91bGRuJ3QgY2hhbmdlIG11Y2ggc2luY2UKPiBhbnl3YXkgdGhlcmUgaXMgYSByZWluaXRf
Y29tcGxldGlvbiBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSB4ZmVyCj4gZnVuY3Rpb24sIGJ1dCBh
dCBsZWFzdCBmdW5jdGlvbiBuYW1pbmcgZmVlbHMgYmV0dGVyIHNpbmNlIG5vdCByZWZlcmluZwo+
IHRvIHdhaXRpbmcgLi4KCknigJlsbCB0YWtlIGEgbG9vayBhdCB0aGUgY29tcGxldGlvbl9kb25l
KCkKCj4gCj4+ICsgfQo+PiAKClsg4oCmIF0KCi9TZWFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
