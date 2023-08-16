Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0A977DAC1
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 08:59:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27CB2C6B45F;
	Wed, 16 Aug 2023 06:59:19 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A13B8C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 06:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=Rx9CxpHQGsFLRIk06FX4JQQY4520UTRT/fQlsa07mE8=; 
 b=VfguSBkIj+wKhT2hmYK2+QqmU9codjBV100eqIkscMppCmqXVTknYL8J8hknetzpIZx1ag9bFjc
 th2G/Olo6O8mE7ZovaC3w+MSTLRZyONUM63jJilVWmv03MPIl202nVxlMHyyM1/cd+BltSrKPE8GL
 FmoQ3iBs21RtTl++SiXAd+3nrrS2g8XkWaNjfXI+8XC+Hv03uFgsFrCnfTawD38nskmKdYI/6liTq
 Aiinv1ZohYjWMOPNAkKYdnVd87t4Qu+V1Jxa9VRcPoT7Gi9ZWJceoL+7d7w2HOtklzCMrxfEwkIjO
 QCUJLPWRWib10DygtLQwkrOUEXsGmh2iyeMw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qWAUr-00005M-KI; Wed, 16 Aug 2023 08:59:13 +0200
Received: from [2a06:4004:10df:0:1cda:5a2e:6344:82ff] (helo=smtpclient.apple)
 by sslproxy03.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <sean@geanix.com>)
 id 1qWAUr-000SpN-5s; Wed, 16 Aug 2023 08:59:13 +0200
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <20230726212132.vylu6qulpyu5fndh@intel.intel>
Date: Wed, 16 Aug 2023 08:59:02 +0200
Message-Id: <07544E8E-6C08-40F0-984B-738A69DC686F@geanix.com>
References: <20230718105435.2641207-1-sean@geanix.com>
 <20230726212132.vylu6qulpyu5fndh@intel.intel>
To: Andi Shyti <andi.shyti@kernel.org>
X-Mailer: Apple Mail (2.3731.600.7)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27001/Tue Aug 15 09:40:17 2023)
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

SGkgQW5kaSwKClRoYW5rcyBmb3IgdGhlIHJldmlldwoKPiBPbiAyNiBKdWwgMjAyMywgYXQgMjMu
MjEsIEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gCj4gSGkgU2Vh
biwKPiAKPiBbLi4uXQo+IAo+PiBAQCAtOTA1LDM4ICs5MDYsNDMgQEAgc3RhdGljIHZvaWQgc3Rt
MzJmN19pMmNfeGZlcl9tc2coc3RydWN0IHN0bTMyZjdfaTJjX2RldiAqaTJjX2RldiwKPj4gY3Iy
IHw9IFNUTTMyRjdfSTJDX0NSMl9OQllURVMoZjdfbXNnLT5jb3VudCk7Cj4+IH0KPj4gCj4+IC0g
LyogRW5hYmxlIE5BQ0ssIFNUT1AsIGVycm9yIGFuZCB0cmFuc2ZlciBjb21wbGV0ZSBpbnRlcnJ1
cHRzICovCj4+IC0gY3IxIHw9IFNUTTMyRjdfSTJDX0NSMV9FUlJJRSB8IFNUTTMyRjdfSTJDX0NS
MV9UQ0lFIHwKPj4gLSBTVE0zMkY3X0kyQ19DUjFfU1RPUElFIHwgU1RNMzJGN19JMkNfQ1IxX05B
Q0tJRTsKPj4gLQo+PiAtIC8qIENsZWFyIERNQSByZXEgYW5kIFRYL1JYIGludGVycnVwdCAqLwo+
PiAtIGNyMSAmPSB+KFNUTTMyRjdfSTJDX0NSMV9SWElFIHwgU1RNMzJGN19JMkNfQ1IxX1RYSUUg
fAo+PiAtIFNUTTMyRjdfSTJDX0NSMV9SWERNQUVOIHwgU1RNMzJGN19JMkNfQ1IxX1RYRE1BRU4p
Owo+PiAtCj4+IC0gLyogQ29uZmlndXJlIERNQSBvciBlbmFibGUgUlgvVFggaW50ZXJydXB0ICov
Cj4+IC0gaTJjX2Rldi0+dXNlX2RtYSA9IGZhbHNlOwo+PiAtIGlmIChpMmNfZGV2LT5kbWEgJiYg
ZjdfbXNnLT5jb3VudCA+PSBTVE0zMkY3X0kyQ19ETUFfTEVOX01JTikgewo+PiAtIHJldCA9IHN0
bTMyX2kyY19wcmVwX2RtYV94ZmVyKGkyY19kZXYtPmRldiwgaTJjX2Rldi0+ZG1hLAo+PiAtICAg
ICAgbXNnLT5mbGFncyAmIEkyQ19NX1JELAo+PiAtICAgICAgZjdfbXNnLT5jb3VudCwgZjdfbXNn
LT5idWYsCj4+IC0gICAgICBzdG0zMmY3X2kyY19kbWFfY2FsbGJhY2ssCj4+IC0gICAgICBpMmNf
ZGV2KTsKPj4gLSBpZiAoIXJldCkKPj4gLSBpMmNfZGV2LT51c2VfZG1hID0gdHJ1ZTsKPj4gLSBl
bHNlCj4+IC0gZGV2X3dhcm4oaTJjX2Rldi0+ZGV2LCAiY2FuJ3QgdXNlIERNQVxuIik7Cj4+IC0g
fQo+PiArIGlmICghaTJjX2Rldi0+YXRvbWljKSB7Cj4+ICsgLyogRW5hYmxlIE5BQ0ssIFNUT1As
IGVycm9yIGFuZCB0cmFuc2ZlciBjb21wbGV0ZSBpbnRlcnJ1cHRzICovCj4+ICsgY3IxIHw9IFNU
TTMyRjdfSTJDX0NSMV9FUlJJRSB8IFNUTTMyRjdfSTJDX0NSMV9UQ0lFIHwKPj4gKyBTVE0zMkY3
X0kyQ19DUjFfU1RPUElFIHwgU1RNMzJGN19JMkNfQ1IxX05BQ0tJRTsKPj4gKwo+PiArIC8qIENs
ZWFyIERNQSByZXEgYW5kIFRYL1JYIGludGVycnVwdCAqLwo+PiArIGNyMSAmPSB+KFNUTTMyRjdf
STJDX0NSMV9SWElFIHwgU1RNMzJGN19JMkNfQ1IxX1RYSUUgfAo+PiArIFNUTTMyRjdfSTJDX0NS
MV9SWERNQUVOIHwgU1RNMzJGN19JMkNfQ1IxX1RYRE1BRU4pOwo+PiArCj4+ICsgLyogQ29uZmln
dXJlIERNQSBvciBlbmFibGUgUlgvVFggaW50ZXJydXB0ICovCj4+ICsgaTJjX2Rldi0+dXNlX2Rt
YSA9IGZhbHNlOwo+PiArIGlmIChpMmNfZGV2LT5kbWEgJiYgZjdfbXNnLT5jb3VudCA+PSBTVE0z
MkY3X0kyQ19ETUFfTEVOX01JTikgewo+PiArIHJldCA9IHN0bTMyX2kyY19wcmVwX2RtYV94ZmVy
KGkyY19kZXYtPmRldiwgaTJjX2Rldi0+ZG1hLAo+PiArIG1zZy0+ZmxhZ3MgJiBJMkNfTV9SRCwK
Pj4gKyBmN19tc2ctPmNvdW50LCBmN19tc2ctPmJ1ZiwKPj4gKyBzdG0zMmY3X2kyY19kbWFfY2Fs
bGJhY2ssCj4+ICsgaTJjX2Rldik7Cj4+ICsgaWYgKCFyZXQpCj4+ICsgaTJjX2Rldi0+dXNlX2Rt
YSA9IHRydWU7Cj4+ICsgZWxzZQo+PiArIGRldl93YXJuKGkyY19kZXYtPmRldiwgImNhbid0IHVz
ZSBETUFcbiIpOwo+PiArIH0KPj4gCj4+IC0gaWYgKCFpMmNfZGV2LT51c2VfZG1hKSB7Cj4+IC0g
aWYgKG1zZy0+ZmxhZ3MgJiBJMkNfTV9SRCkKPj4gLSBjcjEgfD0gU1RNMzJGN19JMkNfQ1IxX1JY
SUU7Cj4+IC0gZWxzZQo+PiAtIGNyMSB8PSBTVE0zMkY3X0kyQ19DUjFfVFhJRTsKPj4gKyBpZiAo
IWkyY19kZXYtPnVzZV9kbWEpIHsKPj4gKyBpZiAobXNnLT5mbGFncyAmIEkyQ19NX1JEKQo+PiAr
IGNyMSB8PSBTVE0zMkY3X0kyQ19DUjFfUlhJRTsKPj4gKyBlbHNlCj4+ICsgY3IxIHw9IFNUTTMy
RjdfSTJDX0NSMV9UWElFOwo+PiArIH0gZWxzZSB7Cj4+ICsgaWYgKG1zZy0+ZmxhZ3MgJiBJMkNf
TV9SRCkKPj4gKyBjcjEgfD0gU1RNMzJGN19JMkNfQ1IxX1JYRE1BRU47Cj4+ICsgZWxzZQo+PiAr
IGNyMSB8PSBTVE0zMkY3X0kyQ19DUjFfVFhETUFFTjsKPj4gKyB9Cj4+IH0gZWxzZSB7Cj4+IC0g
aWYgKG1zZy0+ZmxhZ3MgJiBJMkNfTV9SRCkKPj4gLSBjcjEgfD0gU1RNMzJGN19JMkNfQ1IxX1JY
RE1BRU47Cj4+IC0gZWxzZQo+PiAtIGNyMSB8PSBTVE0zMkY3X0kyQ19DUjFfVFhETUFFTjsKPj4g
KyAvKiBEaXNhYmxlIGFsbCBpbnRlcnJ1cHRzICovCj4+ICsgY3IxICY9IH5TVE0zMkY3X0kyQ19B
TExfSVJRX01BU0s7Cj4gCj4gaWYgeW91IGRvCj4gCj4gaWYgKGkyY19kZXYtPmF0b21pYykgewo+
IC8qIERpc2FibGUgYWxsIGludGVycnVwdHMgKi8KPiBjcjEgJj0gflNUTTMyRjdfSTJDX0FMTF9J
UlFfTUFTSzsKPiByZXR1cm47Cj4gfQo+IAo+IHlvdSBzYXZlIGFsbCB0aGUgYWJvdmUgZnJvbSBh
IGxldmVlbCBvZiBpbmRlbnRhdGlvbi4KCkFncmVlLCBpdCB3b3VsZCBiZSBiZXN0IG5vdCB0byBp
bmRlbnQgdGhpcy4KQnV0IHRoZSBsYXN0IHN0ZXAgaW4gdGhlIGZ1bmN0aW9uIGlzIHRvIHdyaXRl
IHRoZSBjcjEgdmFsdWUgOikgR290byBkb2VzbuKAmXQgc2VlbSB2ZXJ5IHByZXR0eSwgYnV0IHVw
IHRvIHlvdS4uLgoKCj4gCj4+IH0KPj4gCj4+IC8qIENvbmZpZ3VyZSBTdGFydC9SZXBlYXRlZCBT
dGFydCAqLwo+PiBAQCAtMTY3MCw3ICsxNjc2LDIyIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzdG0z
MmY3X2kyY19pc3JfZXJyb3IoaW50IGlycSwgdm9pZCAqZGF0YSkKPj4gcmV0dXJuIElSUV9IQU5E
TEVEOwo+PiB9Cj4+IAoKWyDigKYgXQoKPj4gLSB0aW1lX2xlZnQgPSB3YWl0X2Zvcl9jb21wbGV0
aW9uX3RpbWVvdXQoJmkyY19kZXYtPmNvbXBsZXRlLAo+PiAtIGkyY19kZXYtPmFkYXAudGltZW91
dCk7Cj4+ICsgaWYgKCFpMmNfZGV2LT5hdG9taWMpIHsKPj4gKyB0aW1lX2xlZnQgPSB3YWl0X2Zv
cl9jb21wbGV0aW9uX3RpbWVvdXQoJmkyY19kZXYtPmNvbXBsZXRlLAo+PiArIGkyY19kZXYtPmFk
YXAudGltZW91dCk7Cj4+ICsgfSBlbHNlIHsKPj4gKyB0aW1lX2xlZnQgPSBzdG0zMmY3X2kyY193
YWl0X3BvbGxpbmcoaTJjX2Rldik7Cj4+ICsgfQo+IAo+IHBsZWFzZSwgZHJvcCB0aGUgYnJhY2tl
dHMgaGVyZS4uLiBhbmQgdGltZV9sZWZ0IGhlcmUgc2VydmVzIG9ubHkKPiBub3QgdG8gZ2V0IHRo
ZSAtRVRJTUVET1VULi4uIGxvb2tzIGEgYml0IHVnbHkgdG8gbWUsIGJ1dCBjYW4ndAo+IHRoaW5r
IG9mIGEgYmV0dGVyIHdheS4KCkRvbmUuCgo+IAo+PiArCj4+IHJldCA9IGY3X21zZy0+cmVzdWx0
Owo+PiBpZiAocmV0KSB7Cj4+IGlmIChpMmNfZGV2LT51c2VfZG1hKQo+PiBAQCAtMTcyNyw2ICsx
NzUzLDI0IEBAIHN0YXRpYyBpbnQgc3RtMzJmN19pMmNfeGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIg
KmkyY19hZGFwLAo+PiByZXR1cm4gKHJldCA8IDApID8gcmV0IDogbnVtOwo+PiB9Cj4+IAo+PiAr
c3RhdGljIGludCBzdG0zMmY3X2kyY194ZmVyKHN0cnVjdCBpMmNfYWRhcHRlciAqaTJjX2FkYXAs
Cj4+ICsgICAgc3RydWN0IGkyY19tc2cgbXNnc1tdLCBpbnQgbnVtKQo+PiArewo+PiArIHN0cnVj
dCBzdG0zMmY3X2kyY19kZXYgKmkyY19kZXYgPSBpMmNfZ2V0X2FkYXBkYXRhKGkyY19hZGFwKTsK
Pj4gKwo+PiArIGkyY19kZXYtPmF0b21pYyA9IDA7Cj4gCj4gZmFsc2UKPiAKPj4gKyByZXR1cm4g
c3RtMzJmN19pMmNfeGZlcl9jb3JlKGkyY19hZGFwLCBtc2dzLCBudW0pOwo+PiArfQo+PiArCj4+
ICtzdGF0aWMgaW50IHN0bTMyZjdfaTJjX3hmZXJfYXRvbWljKHN0cnVjdCBpMmNfYWRhcHRlciAq
aTJjX2FkYXAsCj4+ICsgICAgc3RydWN0IGkyY19tc2cgbXNnc1tdLCBpbnQgbnVtKQo+PiArewo+
PiArIHN0cnVjdCBzdG0zMmY3X2kyY19kZXYgKmkyY19kZXYgPSBpMmNfZ2V0X2FkYXBkYXRhKGky
Y19hZGFwKTsKPj4gKwo+PiArIGkyY19kZXYtPmF0b21pYyA9IDE7Cj4gCj4gdHJ1ZQo+IAo+IEFu
ZGkKCi9TZWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
