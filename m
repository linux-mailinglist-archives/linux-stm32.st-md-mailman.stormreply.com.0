Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D80BCF23B9
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 08:37:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7F8FC57A51;
	Mon,  5 Jan 2026 07:37:16 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B430EC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 07:37:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8E3CF6000A;
 Mon,  5 Jan 2026 07:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126D3C116D0;
 Mon,  5 Jan 2026 07:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767598634;
 bh=xZXhNGf8vmrb3CmFuHN4pbqIFbluYGuFSRI363D+f+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AQARnNlfezTetrzJA3Ray5fzyIVC7UjBIgH+mtbm6iAII3CHO5cPZ/tTo2CFVCyR+
 DVcS7Kf+SULOiiEUwHK+zBr3c6t2RDNvqWFx0g8IMhzcLPIxBvGTxj9LSdH7/gQfnh
 jg3ZcE+6SAgF8GcJTDyHVjo6e6aizljBqBpNZrOSUX2A01xZv6E2RPv86uFsE4ADdl
 kUccWGdUJQp9rs4iGzgVns76/lKBxKlJRY6rmVuu6woz1a+lXQYu8T8a+HSihzBCuG
 esf0xbDHDWkpCIoxrL3ngYar990BhCFJs0hiZlu6koA1zN0bTHNUeoFavPAK2Yl9i9
 T+Zhy5zaQHyZg==
Date: Mon, 5 Jan 2026 13:07:05 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <aVtqITUxy--E8HJt@sumit-xelite>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
 <20251229232530.GA2753472-robh@kernel.org>
 <aVOzHWmlJ-eneS-2@sumit-xelite>
 <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, op-tee@lists.trustedfirmware.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v20 1/6] dt-bindings: firmware: Add TEE
 remoteproc service binding
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

T24gRnJpLCBKYW4gMDIsIDIwMjYgYXQgMDQ6MTc6MjdQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gVHVlLCBEZWMgMzAsIDIwMjUgYXQgNToxMOKAr0FNIFN1bWl0IEdhcmcgPHN1bWl0
LmdhcmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBEZWMgMjksIDIwMjUgYXQg
MDU6MjU6MzBQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+IE9uIFdlZCwgRGVjIDE3
LCAyMDI1IGF0IDA0OjM5OjEyUE0gKzAxMDAsIEFybmF1ZCBQb3VsaXF1ZW4gd3JvdGU6Cj4gPiA+
ID4gQWRkIGEgZGV2aWNlIHRyZWUgYmluZGluZyBmb3IgdGhlIFRFRS1iYXNlZCByZW1vdGUgcHJv
Y2Vzc29yIGNvbnRyb2wKPiA+ID4gPiBzZXJ2aWNlIGltcGxlbWVudGVkIGFzIGFuIE9QLVRFRSBU
cnVzdGVkIEFwcGxpY2F0aW9uIGlkZW50aWZpZWQgYnkKPiA+ID4gPiBVVUlEIDgwYTRjMjc1LTBh
NDctNDkwNS04Mjg1LTE0ODZhOTc3MWEwOC4KPiA+ID4gPgo+ID4gPiA+IFRoZSBURUUgc2Vydmlj
ZSBub2RlIGlzIGEgY2hpbGQgb2YgdGhlICJsaW5hcm8sb3B0ZWUtdHoiIGZpcm13YXJlIG5vZGUg
YW5kCj4gPiA+ID4gYWN0cyBhcyBhIGNvbnRhaW5lciBmb3IgcmVtb3RlcHJvYyBkZXZpY2VzIHRo
YXQgYXJlIGNvbnRyb2xsZWQgdmlhIFRFRS4KPiA+ID4KPiA+ID4gSXMgdGhpcyBnZW5lcmljIGZv
ciBhbnkgcmVtb3RlcHJvYyBkZXZpY2Ugb3IganVzdCBTVCdzIHJlbW90ZXByb2MuIExvb2tzCj4g
PiA+IGxpa2UgdGhlIGxhdHRlciB0byBtZS4KPiA+Cj4gPiBUaGF0J3MgdHJ1ZSwgdGhlIERUIGRl
c2NyaXB0aW9uIG9mIHRoZSByZW1vdGVwcm9jIHN1Ym5vZGUgaXMgdmVyeQo+ID4gc3BlY2lmaWMg
dG8gdGhlIHZlbmRvciB3aGljaCBpbiB0aGlzIGNhc2UgaXMgU1QuCj4gPgo+ID4gPgo+ID4gPiA+
IEluIGFkZGl0aW9uLCB0aGUgImxpbmFybyxvcHRlZS10eiIgYmluZGluZyBpcyB1cGRhdGVkIHRv
IHNwZWNpZnkgdGhlCj4gPiA+ID4gJyNhZGRyZXNzLWNlbGxzJyBhbmQgJyNzaXplLWNlbGxzJyB2
YWx1ZXMgdXNlZCBmb3IgY2hpbGQgVEVFIHNlcnZpY2UKPiA+ID4gPiBub2Rlcy4KPiA+ID4KPiA+
ID4gSSdtIHByZXR0eSBzdXJlIEkgYWxyZWFkeSByZWplY3RlZCBwZXIgc2VydmljZS9hcHAgY2hp
bGQgbm9kZXMgZm9yCj4gPiA+IE9QLVRFRSB3aGVuIGl0cyBiaW5kaW5nIHdhcyBzdWJtaXR0ZWQu
Cj4gPgo+ID4gVGhhdCB3YXMgdGhlIHJlYXNvbiB0byBoYXZlIGRpc2NvdmVyYWJsZSBURUUgYnVz
IGluIGZpcnN0IHBsYWNlIGFuZCBJCj4gPiBoYXZlIGJlZW4gbW90aXZhdGluZyBwZW9wbGUgdG8g
ZHluYW1pY2FsbHkgZGlzY292ZXIgZmlybXdhcmUgcHJvcGVydGllcwo+ID4gcmF0aGVyIHRoYW4g
aGFyZGNvZGluZyBpbiB0aGUgRFQuCj4gPgo+ID4gPiBJZiB3ZSBkbyBuZWVkIHNvbWV0aGluZyBp
biBEVAo+ID4gPiB0byBkZWZpbmUgc29tZSByZXNvdXJjZXMsIHRoZW4gY2FuJ3Qgd2UgaGF2ZSBz
b21lIHNvcnQgb2YKPiA+ID4gc3RhbmRhcmQvY29tbW9uIGNvbW11bmljYXRpb25zIGNoYW5uZWw/
IEkgZG9uJ3QgY2FyZSB0byBzZWUgc29tZSBzb3J0IG9mCj4gPiA+IGZyZWUtZm9yLWFsbCB3aGVy
ZSB3ZSBoYXZlIGV2ZXJ5IHZlbmRvciBkb2luZyB0aGVpciBvd24gdGhpbmcuIE9QLVRFRQo+ID4g
PiBuZWVkcyB0byBzdGFuZGFyaXplIHRoaXMuCj4gPgo+ID4gSSBzdXBwb3NlIHRoaXMgcmVxdWly
ZXMgYSB3aWRlciBzY29wZSB3b3JrIGFzIHlvdSBjYW4gc2VlIHRoZSBEVCByZXNvdXJjZQo+ID4g
ZGVwZW5kZW5jZSBmcm9tIGhlcmUgWzFdLiBCeSBzdGFuZGFyZGl6ZSBjb21tdW5pY2F0aW9uIGNo
YW5uZWwsIGRvIHlvdQo+ID4gbWVhbiB0byBzYXkgaWYgYWRkaW5nIGFuIGFsdGVybmF0aXZlIGJh
Y2tlbmQgdG8gZndub2RlIGZvciBURUUgaW4KPiA+IHBhcmFsbGVsIHRvIERULCBBQ1BJIG9yIHN3
bm9kZSBpcyB0aGUgd2F5IHRvIGdvIGZvciBkaXNjb3ZlcmluZyBmdwo+ID4gcHJvcGVydGllcz8K
PiAKPiBObywgbm90IGF0IGFsbC4KPiAKPiA+IE9yIGRvIHlvdSBoYXZlIGFueSBvdGhlciBzdWdn
ZXN0aW9uIGhlcmU/Cj4gCj4gV2hhdCBJIG1lYW4gaXMgd2h5IGRvZXNuJ3QgdGhlIFRFRSBkZWZp
bmUgdGhlIGNvbW11bmljYXRpb24gY2hhbm5lbAo+IChtYWlsYm94K3NobWVtIGFuZCBub3RpZmlj
YXRpb24gaW50ZXJydXB0KSByYXRoZXIgdGhhbiBlYWNoIFRFRSBhcHA/CgpUaGUgc3luY2hyb25v
dXMgY29tbXVuaWNhdGlvbiBjaGFubmVsIGlzIGFscmVhZHkgdGhlcmUgZm9yIGVhY2ggVEVFIGFw
cApiYXNlZCBvbiAoaW52b2tlIGNvbW1hbmRzICsgVEVFIHNoYXJlZCBtZW1vcnkpLiBPUC1URUUg
ZG9lcyBzdXBwb3J0Cm5vdGlmaWNhdGlvbiBpbnRlcnJ1cHRzIHRvbyBidXQgdGhvc2UgaGF2ZW4n
dCBiZWVuIGV4cG9zZWQgdG8gVEVFIGNsaWVudApkcml2ZXJzIHlldC4gSSBzdXBwb3NlIHRoaXMg
cmVtb3RlcHJvYyB1c2UtY2FzZSBjYW4gYmUgYSBnb29kIGV4YW1wbGUgdG8KZXhwb3NlIHRoYXQg
YXMgYSBnZW5lcmljIFRFRSBub3RpZmljYXRpb24gaW50ZXJmYWNlIHRvby4KCj4gCj4gTW9yZSBn
ZW5lcmFsbHksIGlzIGhhdmluZyBURUUgYXBwcyBkZXBlbmRpbmcgb24gcmFuZG9tIERUIHJlc291
cmNlcwo+IHJlYWxseSBhIGJveCB3ZSB3YW50IHRvIG9wZW4/IElzIHRoZSBuZXh0IHRoaW5nIGdv
aW5nIHRvIGJlIGEgVEVFCj4gY2xvY2svcmVzZXQvZ3Bpby9wb3dlciBwcm92aWRlcj8gV2hlcmUg
ZG8gd2UgZHJhdyB0aGUgbGluZT8KClRoaXMgaXMgcmVhbGx5IGEgaGFyZCBsaW5lIHRvIGRyYXcg
c2luY2Ugc2lsaWNvbi9PRU0gdmVuZG9ycyBiYXNlZCBvbiB0aGVpcgpoYXJkd2FyZSBzZWN1cml0
eSBhcmNoaXRlY3R1cmUgcGFydGl0aW9uIHZhcmlvdXMgcmVzb3VyY2VzIGFtb25nIFRFRSBhbmQK
dGhlIExpbnV4IHdvcmxkLiBBbmQgb25lIGdlbmVyYWwgcHJpbmNpcGxlIHdlIHRyeSB0byBmb2xs
b3cgZm9yIHRoZSBURUUKaXMgdG8ga2VlcCBpdCdzIFRydXN0ZWQgQ29tcHV0aW5nIEJhc2UgKFRD
QikgdG8gYSBtaW5pbWFsIHRvby4KCklNSE8sIGlmIHRoZSB0aHJlYXQgbW9kZWwgaXMgd2VsbCB1
bmRlcnN0b29kIHRoZW4gd2Ugc2hvdWxkIGFsbG93IGZvcgp0aGlzIGhldHJvZ2Vub3VzIHBhcnRp
dGlvbmluZyBvZiBzeXN0ZW0gcmVzb3VyY2VzLgoKLVN1bWl0Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
