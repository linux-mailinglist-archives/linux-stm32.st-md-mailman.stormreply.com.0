Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0779B9F2D15
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2024 10:35:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6132C71292;
	Mon, 16 Dec 2024 09:35:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FAF3C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2024 09:35:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EECE45C4C41;
 Mon, 16 Dec 2024 09:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F62DC4CED3;
 Mon, 16 Dec 2024 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734341730;
 bh=MJAI/S1eHdraNTqHVjewdE9v94dBXIYQiOVlxPlvNrs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CqcqrCu4hKubVHrP5OFmAQeSv5jXAjEVkgLWRNxM1HyH8n4lXGrkEwQ/qd8YU1neZ
 MOByLXyEzw8WoCKYmse+m43YN080jJbWoOpO89l+krT+QIwYKa2XYrJoPjD62YtpOC
 4BWDbWIxAZWJ+ZGoUCnHP9dl14leMa9Aj2pjz2dYZRJQ9HCfFRP8OtlAT/rvXOWKh8
 L284uiICX4cxf/zTLr77F5fZeTGB8LBOV1JohATH4MKwlx8WLXBQ7XP5eWHWkkPZTv
 qMhMN65zPHMjTn1V/1GxK6jP//1OUPrfz58yrDMUSa8WsQk+yJPrmScGHD0NgaJ7Rs
 p4fGlGKsDjkLQ==
Date: Mon, 16 Dec 2024 09:35:25 +0000
From: Lee Jones <lee@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20241216093525.GG2418536@google.com>
References: <20241001024731.140069-1-marex@denx.de>
 <6f848ef7-c921-4694-9fd5-4a777d5271d0@lunn.ch>
 <72383917-4bbe-4b95-9e2f-4e364f5288bd@denx.de>
 <5c15ea24-8ca1-4b44-b6d6-fa6adac50334@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c15ea24-8ca1-4b44-b6d6-fa6adac50334@lunn.ch>
Cc: Marek Vasut <marex@denx.de>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Daniel Golle <daniel@makrotopia.org>, kernel@dh-electronics.com,
 Pavel Machek <pavel@ucw.cz>, Lukasz Majewski <lukma@denx.de>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-leds@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] leds: trigger: netdev: Check offload
 ability on interface up
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

T24gU2F0LCAxNCBEZWMgMjAyNCwgQW5kcmV3IEx1bm4gd3JvdGU6Cgo+IE9uIEZyaSwgRGVjIDEz
LCAyMDI0IGF0IDExOjE1OjA5UE0gKzAxMDAsIE1hcmVrIFZhc3V0IHdyb3RlOgo+ID4gT24gMTAv
My8yNCAyOjA2IFBNLCBBbmRyZXcgTHVubiB3cm90ZToKPiA+ID4gT24gVHVlLCBPY3QgMDEsIDIw
MjQgYXQgMDQ6NDU6MjNBTSArMDIwMCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gPiA+ID4gVGhlIHRy
aWdnZXJfZGF0YS0+aHdfY29udHJvbCBpbmRpY2F0ZXMgd2hldGhlciB0aGUgTEVEIGlzIGNvbnRy
b2xsZWQgYnkgSFcKPiA+ID4gPiBvZmZsb2FkLCBpLmUuIHRoZSBQSFkuIFRoZSB0cmlnZ2VyX2Rh
dGEtPmh3X2NvbnRyb2wgPSBjYW5faHdfY29udHJvbCgpIGlzCj4gPiA+ID4gY3VycmVudGx5IGNh
bGxlZCBvbmx5IGZyb20gbmV0ZGV2X2xlZF9hdHRyX3N0b3JlKCksIGkuZS4gd2hlbiB3cml0aW5n
IGFueQo+ID4gPiA+IHN5c2ZzIGF0dHJpYnV0ZSBvZiB0aGUgbmV0ZGV2IHRyaWdnZXIgaW5zdGFu
Y2UgYXNzb2NpYXRlZCB3aXRoIGEgUEhZIExFRC4KPiA+ID4gPiAKPiA+ID4gPiBUaGUgY2FuX2h3
X2NvbnRyb2woKSBjYWxscyB2YWxpZGF0ZV9uZXRfZGV2KCkgd2hpY2ggaW50ZXJuYWxseSBjYWxs
cwo+ID4gPiA+IGxlZF9jZGV2LT5od19jb250cm9sX2dldF9kZXZpY2UoKSwgd2hpY2ggaXMgcGh5
X2xlZF9od19jb250cm9sX2dldF9kZXZpY2UoKQo+ID4gPiA+IGZvciBQSFkgTEVEcy4gVGhlIHBo
eV9sZWRfaHdfY29udHJvbF9nZXRfZGV2aWNlKCkgcmV0dXJucyBOVUxMIGlmIHRoZSBQSFkKPiA+
ID4gPiBpcyBub3QgYXR0YWNoZWQuCj4gPiA+ID4gCj4gPiA+ID4gQXQgbGVhc3QgaW4gY2FzZSBv
ZiBEV01BQyAoU1RNMzJNUCwgaU1YOE0sIC4uLiksIHRoZSBQSFkgZGV2aWNlIGlzIGF0dGFjaGVk
Cj4gPiA+ID4gb25seSB3aGVuIHRoZSBpbnRlcmZhY2UgaXMgYnJvdWdodCB1cCBhbmQgaXMgZGV0
YWNoZWQgYWdhaW4gd2hlbiB0aGUKPiA+ID4gPiBpbnRlcmZhY2UgaXMgYnJvdWdodCBkb3duLiBJ
biBjYXNlIGUuZy4gdWRldiBydWxlcyBjb25maWd1cmUgdGhlIG5ldGRldgo+ID4gPiA+IExFRCB0
cmlnZ2VyIHN5c2ZzIGF0dHJpYnV0ZXMgYmVmb3JlIHRoZSBpbnRlcmZhY2UgaXMgYnJvdWdodCB1
cCwgdGhlbiB3aGVuCj4gPiA+ID4gdGhlIGludGVyZmFjZSBpcyBicm91Z2h0IHVwLCB0aGUgTEVE
cyBhcmUgbm90IGJsaW5raW5nLgo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgaXMgYmVjYXVzZSB0cmln
Z2VyX2RhdGEtPmh3X2NvbnRyb2wgPSBjYW5faHdfY29udHJvbCgpIHdhcyBjYWxsZWQKPiA+ID4g
PiB3aGVuIHVkZXYgd3JvdGUgdGhlIHN5c2ZzIGF0dHJpYnV0ZSBmaWxlcywgYmVmb3JlIHRoZSBp
bnRlcmZhY2Ugd2FzIHVwLAo+ID4gPiA+IHNvIGNhbl9od19jb250cm9sKCkgcmVzcC4gdmFsaWRh
dGVfbmV0X2RldigpIHJldHVybmVkIGZhbHNlLCBhbmQgdGhlCj4gPiA+ID4gdHJpZ2dlcl9kYXRh
LT5od19jb250cm9sID0gY2FuX2h3X2NvbnRyb2woKSB3YXMgbmV2ZXIgY2FsbGVkIGFnYWluIHRv
Cj4gPiA+ID4gdXBkYXRlIHRoZSB0cmlnZ2VyX2RhdGEtPmh3X2NvbnRyb2wgY29udGVudCBhbmQg
bGV0IHRoZSBvZmZsb2FkIHRha2UKPiA+ID4gPiBvdmVyIHRoZSBMRUQgYmxpbmtpbmcuCj4gPiA+
ID4gCj4gPiA+ID4gQ2FsbCBkYXRhLT5od19jb250cm9sID0gY2FuX2h3X2NvbnRyb2woKSBmcm9t
IG5ldGRldl90cmlnX25vdGlmeSgpIHRvCj4gPiA+ID4gdXBkYXRlIHRoZSBvZmZsb2FkIGNhcGFi
aWxpdHkgb2YgdGhlIExFRCB3aGVuIHRoZSBVUCBub3RpZmljYXRpb24gYXJyaXZlcy4KPiA+ID4g
PiBUaGlzIG1ha2VzIHRoZSBMRURzIGJsaW5rIGFmdGVyIHRoZSBpbnRlcmZhY2UgaXMgYnJvdWdo
dCB1cC4KPiA+ID4gPiAKPiA+ID4gPiBPbiBTVE0zMk1QMTN4eCB3aXRoIFJUTDgyMTFGLCBpdCBp
cyBlbm91Z2ggdG8gaGF2ZSB0aGUgZm9sbG93aW5nIHVkZXYgcnVsZQo+ID4gPiA+IGluIHBsYWNl
LCBib290IHRoZSBtYWNoaW5lIHdpdGggY2FibGUgcGx1Z2dlZCBpbiwgYW5kIHRoZSBMRURzIHdv
bid0IHdvcmsKPiA+ID4gPiB3aXRob3V0IHRoaXMgcGF0Y2ggb25jZSB0aGUgaW50ZXJmYWNlIGlz
IGJyb3VnaHQgdXAsIGV2ZW4gaWYgdGhleSBzaG91bGQ6Cj4gPiA+ID4gIgo+ID4gPiA+IEFDVElP
Tj09ImFkZCIsIFNVQlNZU1RFTT09ImxlZHMiLCBLRVJORUw9PSJzdG1tYWMtMDowMTpncmVlbjp3
YW4iLCBBVFRSe3RyaWdnZXJ9PSJuZXRkZXYiLCBBVFRSe2xpbmtfMTB9PSIxIiwgQVRUUntsaW5r
XzEwMH09IjEiLCBBVFRSe2xpbmtfMTAwMH09IjEiLCBBVFRSe2RldmljZV9uYW1lfT0iZW5kMCIK
PiA+ID4gPiBBQ1RJT049PSJhZGQiLCBTVUJTWVNURU09PSJsZWRzIiwgS0VSTkVMPT0ic3RtbWFj
LTA6MDE6eWVsbG93OndhbiIsIEFUVFJ7dHJpZ2dlcn09Im5ldGRldiIsIEFUVFJ7cnh9PSIxIiwg
QVRUUnt0eH09IjEiLCBBVFRSe2RldmljZV9uYW1lfT0iZW5kMCIKPiA+ID4gPiAiCj4gPiA+ID4g
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4gPiA+
IAo+ID4gPiBSZXZpZXdlZC1ieTogQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPgo+ID4gSXMg
dGhlcmUgYW55dGhpbmcgYmxvY2tpbmcgdGhpcyBwYXRjaCBmcm9tIGJlaW5nIHBpY2tlZCB1cCA/
Cj4gCj4gSSB0aGluayB0aGlzIHNob3VsZCBiZSBnb2luZyB2aWEgdGhlIExFRCBNYWludGFpbmVy
LiBQbGVhc2UgY2hlY2sgd2l0aAoKSXQgbG9va2VkIGxpa2UgdGhlIGNvbnZlcnNhdGlvbiB3YXMg
Y29udGludWluZy4KCklmIHlvdSBoYXZlIGV2ZXJ5dGhpbmcgdGllZCB1cCwgcmF0aGVyIHRoYW4g
cmVseWluZyBvbiBtYWludGFpbmVycyB0bwprZWVwIHVwIHdpdGggdGhlIGJyYW5jaGluZyBjb252
ZXJzYXRpb25zIG9mIDEwMCdzIG9mIHBhdGNoLXNldHMsIGl0J3MKYmVzdCB0byBjb2xsZWN0IHRo
ZSB0YWdzIHlvdSBoYXZlIGFuZCBzdWJtaXQgYSBbUkVTRU5EXS4KCi0tIApMZWUgSm9uZXMgW+ad
jueQvOaWr10KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
