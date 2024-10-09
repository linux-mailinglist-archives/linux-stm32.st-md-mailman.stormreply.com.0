Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD0E9966EC
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Oct 2024 12:20:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BD96C6C841;
	Wed,  9 Oct 2024 10:20:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35B12CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2024 10:20:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF9125C5EE8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2024 10:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B96C4CED8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2024 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728469229;
 bh=ImAK0CpUwm+JPbTzbW7azTUBVNfLGbvl7aS7sfbdp0E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Sypaa8E4XTR2h+6vO973S9djHACjIXek0KLq783ADF8tNtOe1bMZrJFf0zlt8+zSs
 OLRAtppFEIb5Ic0mWDNDYNRaI6e9/Z7vBQGyOQ8guZklNp3J6lYVvOJPY0Nte+XhtF
 xT1b91GGI33rYAt7gxwLcB1d3y1SBKs6bb4MxTTF1y6tGBweQi8zO12oDVI1/KpONI
 bOJQtQv0XV690wHla57wDR2aHvoM6Up16kaIYdw6AVyfMWDvtpnERh2dLqJ6WBvkYw
 EhkKXnH7yqObLqkMathJ5jYncRSwZXMHxI2dTYJuZPN1g66Yyks/L1YgZFWJ7ipDTo
 JPDgtbBAM36Bg==
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-5e5d0a80db4so3555290eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Oct 2024 03:20:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUlaG1WoIrsrkoVMn5Cv8+dWmOT5W+O+Dzy5lIL5Te1Jo48jT/ZV0ZEGbBnaWmZII0IrbcCC1lE5UYJcg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz7YLt6+AF3Jv78thYgbmKRxmRFHonEvQDdMOu9ltINcGC8Z36D
 VkKEohDXSFoG67AklfJIHImKM7hCM/MAm+BeUMaw40MobEPGTEQkilf1sI/A1RtoDm14l28ZOTJ
 +0X6tRn+myXuvg6MlvCywPMVOLHY=
X-Google-Smtp-Source: AGHT+IF28e1A9mtOEy4wCWwLUrfMAFq/4+DT8Vi41Eljnp8AjlauSlJofg4NJprxAH2sFsPScvE36aWo6OHCPjXQ49c=
X-Received: by 2002:a05:6820:270f:b0:5e7:c925:b05 with SMTP id
 006d021491bc7-5e987aadf58mr1212364eaf.2.1728469228716; Wed, 09 Oct 2024
 03:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com>
 <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
 <20241007222502.GG30699@pendragon.ideasonboard.com>
 <CAPDyKFrGNwna6Y2pqSRaBbRYHKRaD2ayqQHLtoqLPOu9Et7qTg@mail.gmail.com>
 <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jvJyS7D5-wURi2kyWN-rmNa+YqupeQJ000pQRVd9VBcQ@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 9 Oct 2024 12:20:16 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0htLbrFeby43Ycqpaihqd4x56MokC9sTVRBmTTQSX7vmQ@mail.gmail.com>
Message-ID: <CAJZ5v0htLbrFeby43Ycqpaihqd4x56MokC9sTVRBmTTQSX7vmQ@mail.gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-i3c@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 asahi@lists.linux.dev, linux-staging@lists.linux.dev,
 Andy Shevchenko <andy.shevchenko@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-clk@vger.kernel.org, iommu@lists.linux.dev, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org,
 patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/51] treewide: Switch to
	__pm_runtime_put_autosuspend()
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

T24gVHVlLCBPY3QgOCwgMjAyNCBhdCA4OjI04oCvUE0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFl
bEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgT2N0IDgsIDIwMjQgYXQgMTI6MzXigK9B
TSBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24g
VHVlLCA4IE9jdCAyMDI0IGF0IDAwOjI1LCBMYXVyZW50IFBpbmNoYXJ0Cj4gPiA8bGF1cmVudC5w
aW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgVWxmLAo+ID4g
Pgo+ID4gPiBPbiBUdWUsIE9jdCAwOCwgMjAyNCBhdCAxMjowODoyNEFNICswMjAwLCBVbGYgSGFu
c3NvbiB3cm90ZToKPiA+ID4gPiBPbiBNb24sIDcgT2N0IDIwMjQgYXQgMjA6NDksIExhdXJlbnQg
UGluY2hhcnQgd3JvdGU6Cj4gPiA+ID4gPiBPbiBGcmksIE9jdCAwNCwgMjAyNCBhdCAwNDozODoz
NlBNICswMjAwLCBVbGYgSGFuc3NvbiB3cm90ZToKPiA+ID4gPiA+ID4gT24gRnJpLCA0IE9jdCAy
MDI0IGF0IDExOjQxLCBTYWthcmkgQWlsdXMgd3JvdGU6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiBIZWxsbyBldmVyeW9uZSwKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFRoaXMgc2V0
IHdpbGwgc3dpdGNoIHRoZSB1c2VycyBvZiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHRv
Cj4gPiA+ID4gPiA+ID4gX19wbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHdoaWxlIHRoZSBm
b3JtZXIgd2lsbCBzb29uIGJlIHJlLXB1cnBvc2VkCj4gPiA+ID4gPiA+ID4gdG8gaW5jbHVkZSBh
IGNhbGwgdG8gcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpLiBUaGUgdHdvIGFyZSBhbG1vc3QK
PiA+ID4gPiA+ID4gPiBhbHdheXMgdXNlZCB0b2dldGhlciwgYXBhcnQgZnJvbSBidWdzIHdoaWNo
IGFyZSBsaWtlbHkgY29tbW9uLiBHb2luZwo+ID4gPiA+ID4gPiA+IGZvcndhcmQsIG1vc3QgbmV3
IHVzZXJzIHNob3VsZCBiZSB1c2luZyBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpLgo+ID4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gT25jZSB0aGlzIGNvbnZlcnNpb24gaXMgZG9uZSBhbmQg
cG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSByZS1wdXJwb3NlZCwKPiA+ID4gPiA+ID4gPiBJ
J2xsIHBvc3QgYW5vdGhlciBzZXQgdG8gbWVyZ2UgdGhlIGNhbGxzIHRvIF9fcG1fcnVudGltZV9w
dXRfYXV0b3N1c3BlbmQoKQo+ID4gPiA+ID4gPiA+IGFuZCBwbV9ydW50aW1lX21hcmtfbGFzdF9i
dXN5KCkuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoYXQgc291bmRzIGxpa2UgaXQgY291bGQg
Y2F1c2UgYSBsb3Qgb2YgY2h1cm5zLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBXaHkgbm90IGFk
ZCBhIG5ldyBoZWxwZXIgZnVuY3Rpb24gdGhhdCBkb2VzIHRoZQo+ID4gPiA+ID4gPiBwbV9ydW50
aW1lX3B1dF9hdXRvc3VzcGVuZCgpIGFuZCB0aGUgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgp
Cj4gPiA+ID4gPiA+IHRoaW5ncz8gVGhlbiB3ZSBjYW4gc3RhcnQgbW92aW5nIHVzZXJzIG92ZXIg
dG8gdGhpcyBuZXcgaW50ZXJmYWNlLAo+ID4gPiA+ID4gPiByYXRoZXIgdGhhbiBoYXZpbmcgdGhp
cyBpbnRlcm1lZGlhdGUgc3RlcD8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIHRoaW5rIHRoZSBBUEkg
d291bGQgYmUgbmljZXIgaWYgd2UgdXNlZCB0aGUgc2hvcnRlc3QgYW5kIHNpbXBsZXN0Cj4gPiA+
ID4gPiBmdW5jdGlvbiBuYW1lcyBmb3IgdGhlIG1vc3QgY29tbW9uIHVzZSBjYXNlcy4gRm9sbG93
aW5nCj4gPiA+ID4gPiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHdpdGggcG1fcnVudGlt
ZV9tYXJrX2xhc3RfYnVzeSgpIGlzIHRoYXQKPiA+ID4gPiA+IG1vc3QgY29tbW9uIHVzZSBjYXNl
LiBUaGF0J3Mgd2h5IEkgbGlrZSBTYWthcmkncyBhcHByb2FjaCBvZiByZXB1cnBvc2luZwo+ID4g
PiA+ID4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSwgYW5kIGludHJvZHVjaW5nCj4gPiA+
ID4gPiBfX3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgZm9yIHRoZSBvZGQgY2FzZXMgd2hl
cmUKPiA+ID4gPiA+IHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3koKSBzaG91bGRuJ3QgYmUgY2Fs
bGVkLgo+ID4gPiA+Cj4gPiA+ID4gT2theSwgc28gdGhlIHJlYXNvbiBmb3IgdGhpcyBhcHByb2Fj
aCBpcyBiZWNhdXNlIHdlIGNvdWxkbid0IGZpbmQgYQo+ID4gPiA+IHNob3J0IGFuZCBkZXNjcmlw
dGl2ZSBuYW1lIHRoYXQgY291bGQgYmUgdXNlZCBpbiBmYXZvciBvZgo+ID4gPiA+IHBtX3J1bnRp
bWVfcHV0X2F1dG9zdXNwZW5kKCkuIExldCBtZSB0aHJvdyBzb21lIGlkZWFzIGF0IGl0IGFuZCBt
YXliZQo+ID4gPiA+IHlvdSBsaWtlIGl0IC0gb3Igbm90LiA6LSkKPiA+ID4KPiA+ID4gSSBsaWtl
IHRoZSBpZGVhIGF0IGxlYXN0IDotKQo+ID4gPgo+ID4gPiA+IEkgZG9uJ3Qga25vdyB3aGF0IG9w
dGlvbnMgeW91IGd1eXMgZGlzY3Vzc2VkLCBidXQgdG8gbWUgdGhlIGVudGlyZQo+ID4gPiA+ICJh
dXRvc3VzcGVuZCItc3VmZml4IGlzbid0IHJlYWxseSB0aGF0IG5lY2Vzc2FyeSBpbiBteSBvcGlu
aW9uLiBUaGVyZQo+ID4gPiA+IGFyZSBtb3JlIHdheXMgdGhhbiBjYWxsaW5nIHBtX3J1bnRpbWVf
cHV0X2F1dG9zdXNwZW5kKCkgdGhhdCB0cmlnZ2Vycwo+ID4gPiA+IHVzIHRvIHVzZSB0aGUgUlBN
X0FVVE8gZmxhZyBmb3IgcnBtX3N1c3BlbmQoKS4gRm9yIGV4YW1wbGUsIGp1c3QKPiA+ID4gPiBj
YWxsaW5nIHBtX3J1bnRpbWVfcHV0KCkgaGFzIHRoZSBzaW1pbGFyIGVmZmVjdC4KPiA+ID4KPiA+
ID4gVG8gYmUgaG9uZXN0LCBJJ20gbG9zdCB0aGVyZS4gcG1fcnVudGltZV9wdXQoKSBjYWxscwo+
ID4gPiBfX3BtX3J1bnRpbWVfaWRsZShSUE1fR0VUX1BVVCB8IFJQTV9BU1lOQyksIHdoaWxlCj4g
PiA+IHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkgY2FsbHMgX19wbV9ydW50aW1lX3N1c3Bl
bmQoUlBNX0dFVF9QVVQgfAo+ID4gPiBSUE1fQVNZTkMgfCBSUE1fQVVUTykuCj4gPgo+ID4gX19w
bV9ydW50aW1lX2lkbGUoKSBlbmRzIHVwIGNhbGxpbmcgcnBtX2lkbGUoKSwgd2hpY2ggbWF5IGNh
bGwKPiA+IHJwbV9zdXNwZW5kKCkgLSBpZiBpdCBzdWNjZWVkcyB0byBpZGxlIHRoZSBkZXZpY2Uu
IEluIHRoYXQgY2FzZSwgaXQKPiA+IHRhZ3Mgb24gdGhlIFJQTV9BVVRPIGZsYWcgaW4gdGhlIGNh
bGwgdG8gcnBtX3N1c3BlbmQoKS4gUXVpdGUgc2ltaWxhcgo+ID4gdG8gd2hhdCBpcyBoYXBwZW5p
bmcgd2hlbiBjYWxsaW5nIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCkuCj4KPiBSaWdodC4K
Pgo+IEZvciBhbG1vc3QgZXZlcnlib2R5LCBleGNlcHQgZm9yIGEgc21hbGwgYnVuY2ggb2YgZHJp
dmVycyB0aGF0Cj4gYWN0dWFsbHkgaGF2ZSBhIC5ydW50aW1lX2lkbGUoKSBjYWxsYmFjaywgcG1f
cnVudGltZV9wdXQoKSBpcwo+IGxpdGVyYWxseSBlcXVpdmFsZW50IHRvIHBtX3J1bnRpbWVfcHV0
X2F1dG9zdXNwZW5kKCkuCj4KPiBTbyByZWFsbHkgdGhlIHF1ZXN0aW9uIGlzIHdoeSBhbnlvbmUg
d2hvIGRvZXNuJ3QgcHJvdmlkZSBhCj4gLnJ1bnRpbWVfaWRsZSgpIGNhbGxiYWNrIGJvdGhlcnMg
d2l0aCB1c2luZyB0aGlzIHNwZWNpYWwKPiBwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZCgpIHRo
aW5nLCB3aGljaCByZWFsbHkgbWVhbnMgImRvIGEKPiBydW50aW1lX3B1dCgpLCBidXQgc2tpcCBt
eSAucnVudGltZV9pZGxlKCkgY2FsbGJhY2siLgo+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBNb3Jl
b3ZlciwgaXQncyBzaW1pbGFyIGZvciBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCksIGl0J3Mg
Y2FsbGVkCj4gPiA+ID4gZHVyaW5nIHJwbV9yZXN1bWUoKSB0b28sIGZvciBleGFtcGxlLiBTbyB3
aHkgYm90aGVyIGFib3V0IGhhdmluZwo+ID4gPiA+ICJtYXJrX2xhc3RfYnVzeSIgaW4gdGhlIG5l
dyBuYW1lIHRvby4KPiA+ID4gPgo+ID4gPiA+IFRoYXQgc2FpZCwgbXkgc3VnZ2VzdGlvbiBpcyBz
aW1wbHkgInBtX3J1bnRpbWVfcHV0X3N1c3BlbmQiLgo+ID4gPgo+ID4gPiBDYW4gd2UgZG8gZXZl
biBiZXR0ZXIsIGFuZCBtYWtlIHBtX3J1bnRpbWVfcHV0KCkgdG8gaGFuZGxlIGF1dG9zdXNwZW5k
Cj4gPiA+IGF1dG9tYXRpY2FsbHkgd2hlbiBhdXRvc3VzcGVuZCBpcyBlbmFibGVkID8KPiA+Cj4g
PiBBcyBzdGF0ZWQgYWJvdmUsIHRoaXMgaXMgYWxyZWFkeSB0aGUgY2FzZS4KPgo+IFdoYXQgcmVh
bGx5IGlzIG5lZWRlZCBhcHBlYXJzIHRvIGJlIGEgY29tYmluYXRpb24gb2YKPiBwbV9ydW50aW1l
X21hcmtfbGFzdF9idXN5KCkgd2l0aCBwbV9ydW50aW1lX3B1dCgpLgo+Cj4gR3JhbnRlZCwgcG1f
cnVudGltZV9wdXQoKSBjb3VsZCBkbyB0aGUgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSgpCj4g
dGhpbmcgYXV0b21hdGljYWxseSBpZiBhdXRvc3VzcGVuZCBpcyBlbmFibGVkIGFuZCB0aGUgb25s
eSBjb25zZXF1ZW5jZQo+IG9mIGl0IG1pZ2h0IGJlIGRlbGF5aW5nIGEgc3VzcGVuZCBvZiB0aGUg
ZGV2aWNlIHVudGlsIGl0cyBhdXRvc3VzcGVuZAo+IHRpbWVyIGV4cGlyZXMsIHdoaWNoIHNob3Vs
ZCBub3QgYmUgYSBwcm9ibGVtIGluIHRoZSB2YXN0IG1ham9yaXR5IG9mCj4gY2FzZXMuCgpUaGF0
IHNhaWQsIGl0IGlzIGxpa2VseSBiZXR0ZXIgdG8gYXZvaWQgc3VycHJpc2luZyB0aGUgY3VycmVu
dCB1c2VycwpvZiBwbV9ydW50aW1lX3B1dCgpIGFuZCBkZWZpbmUgc29tZXRoaW5nIGxpa2UKCnN0
YXRpYyBpbmxpbmUgdm9pZCBwbV9ydW50aW1lX3RvdWNoX2FuZF9wdXQoc3RydWN0IGRldmljZSAq
ZGV2KQp7CiAgICAgICAgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShkZXYpOwogICAgICAgIHBt
X3J1bnRpbWVfcHV0KGRldik7Cn0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
