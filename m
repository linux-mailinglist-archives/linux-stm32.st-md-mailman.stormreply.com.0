Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1276D3263
	for <lists+linux-stm32@lfdr.de>; Sat,  1 Apr 2023 17:38:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59A95C6A5F7;
	Sat,  1 Apr 2023 15:38:10 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F2DFC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Apr 2023 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=1OF1gwVwKxRH0Bsbr3sddCdFnvOlwCDqmXr9PbGww6I=; 
 b=NPuW8Evm/xgBsYbGTQYqTPvwwmcjLQMqELlVWCF6OWYDQJKcojZTdN7f0Mgj3+bVrpSdjnGfalF
 XZ2j+w2PR0Nkpi25yrPyTdpcF/Dqs1OjsqTUJQKVtvdwv4eUrz5v4hH9b0PD/wKH08vwT0nG3GsID
 nAcw9EqP68lUAzzzs/pxzlYzY1tHAf3ld/0Edu/2lOrKlN+/r9ZxslFjeBht6VldfbIc0n0HpsLE1
 2vf6QgO/8kEanpj2SmS05H30Tx+Vu5m1KYinsv3NLsBxnTxoJDV9DihXHpmu3TS6NjceXr5a0VjZG
 nKhl/m8hbeQS9JnITdfx/cVt9dr9GD0oQYSg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1pidIt-0009NA-DD; Sat, 01 Apr 2023 17:38:07 +0200
Received: from [2a06:4004:10df:0:7ca5:67b9:3ab2:84e3] (helo=smtpclient.apple)
 by sslproxy03.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <sean@geanix.com>)
 id 1pidIt-000QhM-17; Sat, 01 Apr 2023 17:38:07 +0200
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
From: =?utf-8?Q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>
In-Reply-To: <20230401150455.3e426d1e@jic23-huawei>
Date: Sat, 1 Apr 2023 17:37:56 +0200
Message-Id: <57AA344C-3213-469A-8759-78C0D183B5D4@geanix.com>
References: <20230327083449.1098174-1-sean@geanix.com>
 <56c019d4-832e-17e1-19f8-7d8bd927c1bb@foss.st.com>
 <20230401150455.3e426d1e@jic23-huawei>
To: Jonathan Cameron <jic23@kernel.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26862/Sat Apr  1 09:22:47 2023)
Cc: lars@metafoo.de, linux-iio@vger.kernel.org, nuno.sa@analog.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/3] iio: adc: stm32-adc: warn if dt uses
 legacy channel config
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

Cgo+IE9uIDEgQXByIDIwMjMsIGF0IDE2LjA0LCBKb25hdGhhbiBDYW1lcm9uIDxqaWMyM0BrZXJu
ZWwub3JnPiB3cm90ZToKPiAKPiBPbiBUaHUsIDMwIE1hciAyMDIzIDE3OjMwOjMyICswMjAwCj4g
RmFicmljZSBHYXNuaWVyIDxmYWJyaWNlLmdhc25pZXJAZm9zcy5zdC5jb20+IHdyb3RlOgo+IAo+
PiBPbiAzLzI3LzIzIDEwOjM0LCBTZWFuIE55ZWtqYWVyIHdyb3RlOgo+Pj4gU2luY2UgbmVhcmx5
IGFsbCBzdG0zMiBkdCdzIGFyZSB1c2luZyB0aGUgbGVnYWN5IGFkYyBjaGFubmVsIGNvbmZpZywK
Pj4+IHdlIHNob3VsZCB3YXJuIHVzZXJzIGFib3V0IHVzaW5nIGl0Lgo+Pj4gCj4+PiBTaWduZWQt
b2ZmLWJ5OiBTZWFuIE55ZWtqYWVyIDxzZWFuQGdlYW5peC5jb20+Cj4+PiAtLS0KPj4+IGRyaXZl
cnMvaWlvL2FkYy9zdG0zMi1hZGMuYyB8IDIgKysKPj4+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKPj4+IAo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMu
YyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMuYwo+Pj4gaW5kZXggMWFhZGIyYWQyY2FiLi5k
OGU3NTVkMGNjNTIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLmMK
Pj4+ICsrKyBiL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1hZGMuYwo+Pj4gQEAgLTE5OTMsNiArMTk5
Myw4IEBAIHN0YXRpYyBpbnQgc3RtMzJfYWRjX2dldF9sZWdhY3lfY2hhbl9jb3VudChzdHJ1Y3Qg
aWlvX2RldiAqaW5kaW9fZGV2LCBzdHJ1Y3Qgc3RtCj4+PiBjb25zdCBzdHJ1Y3Qgc3RtMzJfYWRj
X2luZm8gKmFkY19pbmZvID0gYWRjLT5jZmctPmFkY19pbmZvOwo+Pj4gaW50IG51bV9jaGFubmVs
cyA9IDAsIHJldDsKPj4+IAo+Pj4gKyBkZXZfd2FybigmaW5kaW9fZGV2LT5kZXYsICJ1c2luZyBs
ZWdhY3kgY2hhbm5lbCBjb25maWdcbiIpOwo+Pj4gKyAgCj4+IAo+PiBIaSBTZWFuLAo+PiAKPj4g
SSdkIHJlY29tbWVuZCB0byBhdm9pZCBhZGRpbmcgYSBkZXZfd2FybigpIG9uIGEgcGVyIGRyaXZl
ciBiYXNpcywgZm9yCj4+IGRlcHJlYWN0ZWQgRFQgcHJvcGVydGllcy4gU3RpbGwgSSdtIG5vdCBz
dXJlIGlmIHRoZXJlJ3Mgc29tZSBwb2xpY3kgaW4KPj4gdGhpcyBhcmVhLgo+PiAKPj4gSU1ITywg
ZGVwcmVjYXRlZCBwcm9wZXJ0aWVzIHNob3VsZCBiZSBjaGVja2VkIGJ5IHVzaW5nIGR0IHRvb2xz
Cj4+IChkdF9iaW5kaW5nX2NoZWNrIC8gZHRic19jaGVjayBvciBvdGhlciBtZWFuPykuIEJ1dCBJ
IGhhdmUgbm8gaWRlYSBpZgo+PiB0aGlzIGlzIGdvaW5nIHRvIHJlcG9ydCB3YXJuaW5ncyBhbmQg
d2hlbi4gUHVycG9zZSB3b3VsZCBiZSB0byBhdm9pZAo+PiBpbnRyb2R1Y2luZyBubyBkdHMgZmls
ZXMgd2l0aCB0aGVzZS4gQXMgY29tbWVudGVkIGJ5IE9saXZpZXIgb24gUGF0Y2ggMywKPj4gd2Un
dmUgc29tZSBkb3duc3RyZWFtIHBhdGNoZXMgdG8gYWRvcHQgdGhlIGdlbmVyaWMgYmluZGluZ3Mg
KG5vdAo+PiB1cHN0cmVhbSAneWV0JykuCj4+IAo+PiBBbm90aGVyIGRvd25zaWRlIGlzIHJlZ2Fy
ZGluZyBiYWNrd2FyZCBjb21wYXRpYmlsaXR5LiBJbiBjYXNlIGFuIG9sZCBkdGIKPj4gaXMgdXNl
ZCB0byBib290IHRoZSBrZXJuZWwsIGFzIGxvbmcgYXMgdGhlcmUncyBubyBmdW5jdGlvbmFsaXR5
IGxvc3MsCj4+IEknZCBhZHZpc2Ugbm90IHRvIHVzZSBhbnkgd2FybmluZyBoZXJlLiBUaGF0J3Mg
YSB2YWxpZCB1c2Ugb2YgYW4gb2xkIGR0Lgo+PiAKPj4gSW4gYWxsIGNhc2UsIHRoYW5rcyBmb3Ig
cG9pbnRpbmcgaXNzdWVzIChlLmcuIFBhdGNoIDIgJiAzKSwgcmVnYXJkaW5nCj4+IHRoaXMgcGF0
Y2gsIEknZCBuYWNrIGFkZGluZyB0aGlzIHdhcm5pbmcuIFBsZWFzZSBkcm9wIHRoaXMgY2hhbmdl
IGlmIHlvdQo+PiByZS1zdWJtaXQgb3IgdHVybiB0aGlzIGludG8gYSBkZXZfZGJnKCkuCj4+IAo+
IAo+IEFncmVlZC4gQmV0dGVyIHRvIGNoYW5nZSB0byBkZXZfZGJnKCkuCj4gCj4gT3RoZXIgdHdv
IHBhdGNoZXMgbG9vayBnb29kIHRvIG1lLCBidXQgd2lsbCBsZWF2ZSBhIGJpdCBtb3JlIHRpbWUg
Zm9yIG90aGVycwo+IHRvIGNvbW1lbnQgYmVmb3JlIEkgcGljayB0aGVtIHVwLiAgQXMgYSBzbWFs
bCBzaWRlIG5vdGUuIFRoZXkgYXJlIGZpeGVzIGFuZAo+IHRoaXMgZmlyc3QgcGF0Y2ggaXMgbm90
LCBzbyB0aGV5IHNob3VsZCBoYXZlIGJlZW4gYmVmb3JlIGl0IGluIHRoZSBzZXJpZXMKPiBzbyBJ
IGNhbiByb3V0ZSB0aGVtIHRvIG1haW5saW5lIGZhc3RlciB0aGFuIHRoZSBub24gZml4Lgo+IAo+
IEpvbmF0aGFuCgpIaSBKb25hdGhhbiwKCknigJlsbCByZXN1Ym1pdCB0aGUgZmlyc3QgcGF0Y2gg
d2l0aCBkZXZfZGJnKCkgYXMgYSBzaW5nbGUgY29tbWl0LCBhbmQgdGhlbiB0aGUgZml4ZXMgYXMg
YSBzZXBhcmF0ZSBzZXJpZXMgOikKCi9TZWFuCgo+IAo+PiBCZXN0IFJlZ2FyZHMsCj4+IEZhYnJp
Y2UKPj4gCj4+PiByZXQgPSBkZXZpY2VfcHJvcGVydHlfY291bnRfdTMyKGRldiwgInN0LGFkYy1j
aGFubmVscyIpOwo+Pj4gaWYgKHJldCA+IGFkY19pbmZvLT5tYXhfY2hhbm5lbHMpIHsKPj4+IGRl
dl9lcnIoJmluZGlvX2Rldi0+ZGV2LCAiQmFkIHN0LGFkYy1jaGFubmVscz9cbiIpOyAgCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
