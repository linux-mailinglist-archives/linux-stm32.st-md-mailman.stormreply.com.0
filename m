Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEBC8356C6
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jan 2024 17:58:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD2AEC6B457;
	Sun, 21 Jan 2024 16:58:01 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6685C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jan 2024 16:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=c37txM5AQBeipFKlwo48dwCVCZGCUaCC40m8RvSfo3M=; b=Kz
 nw0K80g2wZux006JZCCdff6hpb+mbikxpe0BJ47nr3Ub3l4+FNQjrjZ9Qkq9xxLa+bv07C+l6P7YM
 1H1mAl5X/KyV+M3X6Iscfv7nk3jyRleaH3PLEYzZTGp3Lu4KdnYrefSdKidAP2dIjfLJfgZxPd8B4
 3FWUkaTEl6k5q2Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rRb8q-005f8u-VZ; Sun, 21 Jan 2024 17:57:52 +0100
Date: Sun, 21 Jan 2024 17:57:52 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Message-ID: <28cca132-d5bb-4cff-ba2f-9be241a5ce83@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556DEA3D4740441EC561414C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TYZPR01MB5556DEA3D4740441EC561414C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>,
 linux-mediatek@lists.infradead.org, Praveenkumar I <ipkumar@codeaurora.org>,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 5/8] clk: qcom: support for duplicate freq
 in RCG2 freq table
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

T24gU3VuLCBKYW4gMjEsIDIwMjQgYXQgMDg6NDI6MzRQTSArMDgwMCwgWml5YW5nIEh1YW5nIHdy
b3RlOgo+IEZyb206IFByYXZlZW5rdW1hciBJIDxpcGt1bWFyQGNvZGVhdXJvcmEub3JnPgo+IAo+
IEN1cnJlbnRseSBSQ0cgY29kZSBsb29rcyB1cCB0aGUgZnJlcXVlbmN5IHRhYmxlIGR1cmluZyBz
ZXQKPiByYXRlIGFuZCByZXR1cm4gdGhlIGZpcnN0IGF2YWlsYWJsZSBmcmVxdWVuY3kgZ3JlYXRl
ciB0aGFuCj4gcmVxdWVzdGVkIHJhdGUuIElmIENMS19TRVRfUkFURV9QQVJFTlQgZmxhZyBpcyBz
ZXQgdGhlbiB0aGUKPiBzZXRfcmF0ZSByZXF1ZXN0IHdpbGwgZ28gdG8gaXRzIHBhcmVudCBvdGhl
cndpc2UgdGhlIGNsb2NrCj4gZnJhbWV3b3JrIHdpbGwgY29uZmlndXJlIHByZS1kaXYsIG0gYW5k
IG4gYWNjb3JkaW5nIHRvIHRoZQo+IHJldHVybmVkIGZyZXF1ZW5jeSB0YWJsZSBlbnRyeS4gSW4g
dGhpcyBjYXNlLCBpdCBpcyBhc3N1bWluZwo+IHRoYXQgcGFyZW50IGNsb2NrIHdpbGwgcnVuIGlu
IHRoZSBzYW1lIGZyZXF1ZW5jeSB3aXRoIHdoaWNoCj4gcHJlLWRpdiwgbSBhbmQgbiBoYXMgYmVl
biBkZXJpdmVkLiBCdXQgaXQgbWF5IGJlIHBvc3NpYmxlCj4gdGhhdCB0aGUgcGFyZW50IGNsb2Nr
IHN1cHBvcnRzIG11bHRpcGxlIGZyZXF1ZW5jeSBhbmQgdGhlCj4gc2FtZSBmcmVxdWVuY3kgY2Fu
IGJlIGRlcml2ZWQgd2l0aCBkaWZmZXJlbnQgcHJlLWRpdiwgbSBhbmQKPiBuIHZhbHVlcyBkZXBl
bmRpbmcgdXBvbiBjdXJyZW50IGZyZXF1ZW5jeS4gIEFsc28sIHRoZSBzYW1lCj4gZnJlcXVlbmN5
IGNhbiBiZSBkZXJpdmVkIGZyb20gZGlmZmVyZW50IHBhcmVudCBzb3VyY2VzIGFuZAo+IGN1cnJl
bnRseSB0aGVyZSBpcyBubyBvcHRpb24gZm9yIGhhdmluZyBkdXBsaWNhdGUKPiBmcmVxdWVuY2ll
cyBpbiBmcmVxdWVuY3kgdGFibGUgYW5kIGNob29zaW5nIHRoZSBiZXN0IG9uZQo+IGFjY29yZGlu
ZyB0byBjdXJyZW50IHJhdGUuCj4gCj4gTm93IHRoaXMgcGF0Y2ggYWRkcyB0aGUgc3VwcG9ydCBm
b3IgaGF2aW5nIGR1cGxpY2F0ZQo+IGZyZXF1ZW5jaWVzIGluIGZyZXF1ZW5jeSB0YWJsZS4gRHVy
aW5nIHNldCByYXRlLCBpdCB3aWxsCj4gY29tcGFyZSB0aGUgYWN0dWFsIHJhdGUgZm9yIGVhY2gg
ZW50cnkgd2l0aCByZXF1ZXN0ZWQgcmF0ZQo+IGFuZCB3aWxsIHNlbGVjdCB0aGUgYmVzdCBlbnRy
eSBpbiB3aGljaCB0aGUgZGlmZmVyZW5jZSB3aWxsCj4gYmUgbGVzcy4KPiAKPiBUaGUgZXhpc3Rp
bmcgZnVuY3Rpb25hbGl0eSB3b27igJl0IGJlIGFmZmVjdGVkIHdpdGggdGhpcyBjb2RlCj4gY2hh
bmdlIHNpbmNlIHRoaXMgY29kZSBjaGFuZ2Ugd2lsbCBoaXQgb25seSBpZiBmcmVxdWVuY3kKPiB0
YWJsZSBoYXMgZHVwbGljYXRlIHZhbHVlcy4KCkEgZ29vZCBjb21taXQgbWVzc2FnZSBmb3IgYSBj
aGFuZ2UhCgo+IAo+IENoYW5nZS1JZDogSTk3ZDllMWI1NWQ4ZjNlZTA5NWY2ZjAxNzI5YWY1Mjdi
YTkwZTUwZTUKPiBTaWduZWQtb2ZmLWJ5OiBBYmhpc2hlayBTYWh1IDxhYnNhaHVAY29kZWF1cm9y
YS5vcmc+Cj4gKGNoZXJyeSBwaWNrZWQgZnJvbSBjb21taXQgNzc1ZTdkM2I2OWZmYzk3YWZiNWJk
NWE2YzljNDIzZjJmNGQ4YTBiMikKPiBTaWduZWQtb2ZmLWJ5OiBQcmF2ZWVua3VtYXIgSSA8aXBr
dW1hckBjb2RlYXVyb3JhLm9yZz4KPiAKPiBDaGFuZ2UtSWQ6IElmMTAxOTNmYzc5YTNjMTM3NWFi
NzM1OTc4MTM3NDVmZjFmNGRmMGFkCj4gCj4gUGljayBmcm9tIGh0dHBzOi8vZ2l0LmNvZGVsaW5h
cm8ub3JnL2Nsby9xc2RrL29zcy9rZXJuZWwvbGludXgtaXBxLTUuNC8tL2NvbW1pdC82ZGZiMzY4
YmFlMTMwYmVlNThlMDBkZGY4MzMwYjU1MDY2ZTFjOGM1Cj4gCj4gU2lnbmVkLW9mZi1ieTogWml5
YW5nIEh1YW5nIDxoenlpdGNAb3V0bG9vay5jb20+CgpQbGVhc2UgY2xlYW4gdXAgdGhlc2UgdGFn
cy4gVGhlc2UgQ2hhbmdlLUlEIHRhZ3MgYXJlIG1lYW5pbmdsZXNzIGluCm1haW5saW5lLiA3NzVl
N2QzYjY5ZmZjOTdhZmI1YmQ1YTZjOWM0MjNmMmY0ZDhhMGIyIGlzIG5vdCBpbiBtYWlubGluZQpl
aXRoZXIuIFRoZSBwaWNrZWQgZnJvbSBtaWdodCBiZSBpbnRlcmVzdGluZywgYnV0IHBsZWFzZSBw
dXQgaXQgaW50bwp0aGUgYm9keSBvZiB0aGUgY29tbWl0IG1lc3NhZ2UsIG5vdCBtaXhlZCBpbiB3
aXRoIHRoZSB0YWdzLgoKV2hvIGFjdHVhbGx5IHdyb3RlIHRoaXMgcGF0Y2g/IFRoZSBmaXJzdCBT
aWduZWQtb2ZmLWJ5OiBpcyBmcm9tCkFiaGlzaGVrIFNhaHUuIEJ1dCB5b3UgaGF2ZSBhIEZyb20g
b2YgUHJhdmVlbmt1bWFyIEkgPwoKICAgIEFuZHJldwoKLS0tCnB3LWJvdDogY3IKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
