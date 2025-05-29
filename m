Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E97AC7568
	for <lists+linux-stm32@lfdr.de>; Thu, 29 May 2025 03:36:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05392C35E3F;
	Thu, 29 May 2025 01:36:00 +0000 (UTC)
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B2F5C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 May 2025 01:35:58 +0000 (UTC)
Message-ID: <51768fa6-007e-4f30-ac1f-eed01ae1a3c5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1748482557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZPvO5ea4bJ3AEPNPYkVWBmgC2/crRwDDiQRw7JYiRc0=;
 b=SI9oJffrQhJFzwVRI6hy+E981adGUz2hteYYf8fv/sQWmJIRMo03ZeEUEayJQ+OSmrRmQF
 aL9NacS00yCzFi3hTqHqhiFDvIg6tNPvYNsbL6ljM5L9GHmyrx+Ck8QTLLd5LilVp/5q6n
 PVLBXK9IeoWaseY3eISs0IaVaHE3LY4=
Date: Thu, 29 May 2025 09:35:36 +0800
MIME-Version: 1.0
To: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
 Andrew Lunn <andrew@lunn.ch>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
References: <20241018205332.525595-1-jitendra.vegiraju@broadcom.com>
 <CAMdnO-+FjsRX4fjbCE_RVNY4pEoArD68dAWoEM+oaEZNJiuA3g@mail.gmail.com>
 <67919001-1cb7-4e9b-9992-5b3dd9b03406@quicinc.com>
 <CAMdnO-+HwXf7c=igt2j6VHcki3cYanXpFApZDcEe7DibDz810g@mail.gmail.com>
 <7ac5c034-9e6d-45c4-b20a-2a386b4d9117@quicinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <7ac5c034-9e6d-45c4-b20a-2a386b4d9117@quicinc.com>
X-Migadu-Flow: FLOW_OUT
Cc: Jianheng.Zhang@synopsys.com, edumazet@google.com,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 linux-arm-kernel@lists.infradead.org, xiaolei.wang@windriver.com,
 florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v6 0/5] net: stmmac: Add PCI
 driver support for BCM8958x
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

5ZyoIDUvMjgvMjUgODowNCBBTSwgQWJoaXNoZWsgQ2hhdWhhbiAoQUJDKSDlhpnpgZM6Cj4gCj4g
Cj4gT24gMi83LzIwMjUgMzoxOCBQTSwgSml0ZW5kcmEgVmVnaXJhanUgd3JvdGU6Cj4+IEhpIEFi
aGlzaGVrLAo+Pgo+PiBPbiBGcmksIEZlYiA3LCAyMDI1IGF0IDEwOjIx4oCvQU0gQWJoaXNoZWsg
Q2hhdWhhbiAoQUJDKSA8Cj4+IHF1aWNfYWJjaGF1aGFAcXVpY2luYy5jb20+IHdyb3RlOgo+Pgo+
Pj4KPj4+Cj4+PiBPbiAxMS81LzIwMjQgODoxMiBBTSwgSml0ZW5kcmEgVmVnaXJhanUgd3JvdGU6
Cj4+Pj4gSGkgbmV0ZGV2IHRlYW0sCj4+Pj4KPj4+PiBPbiBGcmksIE9jdCAxOCwgMjAyNCBhdCAx
OjUz4oCvUE0gPGppdGVuZHJhLnZlZ2lyYWp1QGJyb2FkY29tLmNvbT4gd3JvdGU6Cj4+Pj4+Cj4+
Pj4+IEZyb206IEppdGVuZHJhIFZlZ2lyYWp1IDxqaXRlbmRyYS52ZWdpcmFqdUBicm9hZGNvbS5j
b20+Cj4+Pj4+Cj4+Pj4+IFRoaXMgcGF0Y2hzZXQgYWRkcyBiYXNpYyBQQ0kgZXRoZXJuZXQgZGV2
aWNlIGRyaXZlciBzdXBwb3J0IGZvciBCcm9hZGNvbQo+Pj4+PiBCQ004OTU4eCBBdXRvbW90aXZl
IEV0aGVybmV0IHN3aXRjaCBTb0MgZGV2aWNlcy4KPj4+Pj4KPj4+Pgo+Pj4+IEkgd291bGQgbGlr
ZSB0byBzZWVrIHlvdXIgZ3VpZGFuY2Ugb24gaG93IHRvIHRha2UgdGhpcyBwYXRjaCBzZXJpZXMK
Pj4+IGZvcndhcmQuCj4+Pj4gVGhhbmtzIHRvIHlvdXIgZmVlZGJhY2sgYW5kIFNlcmdlJ3Mgc3Vn
Z2VzdGlvbnMsIHdlIG1hZGUgc29tZSBmb3J3YXJkCj4+Pj4gcHJvZ3Jlc3Mgb24gdGhpcyBwYXRj
aCBzZXJpZXMuCj4+Pj4gUGxlYXNlIG1ha2UgYW55IHN1Z2dlc3Rpb25zIHRvIGVuYWJsZSB1cyB0
byB1cHN0cmVhbSBkcml2ZXIgc3VwcG9ydAo+Pj4+IGZvciBCQ004OTU4eC4KPj4+Cj4+PiBKaXRl
bmRyYSwKPj4+ICAgICAgICAgICBIYXZlIHdlIHJlc2VudCB0aGlzIHBhdGNoIG9yIGdvdCBpdCBh
cHByb3ZlZCA/IEkgZG9udCBzZWUgYW55Cj4+PiB1cGRhdGVzIGFmdGVyIHRoaXMgcGF0Y2guCj4+
Pgo+Pj4KPj4gVGhhbmsgeW91IGZvciBpbnF1aXJpbmcgYWJvdXQgdGhlIHN0YXR1cyBvZiB0aGlz
IHBhdGNoLgo+PiBBcyBzdG1tYWMgZHJpdmVyIGlzIGdvaW5nIHRocm91Z2ggYSBtYWludGFpbmVy
IHRyYW5zaXRpb24sIHdlIHdhbnRlZCB0bwo+PiB3YWl0IHVudGlsIGEgbmV3IG1haW50YWluZXIg
aXMgaWRlbnRpZmllZC4KPj4gV2Ugd291bGQgbGlrZSB0byBzZW5kIHRoZSB1cGRhdGVkIHBhdGNo
IGFzIHNvb24gYXMgcG9zc2libGUuCj4+IFRoYW5rcywKPj4gSml0ZW5kcmEKPiBUaGFua3MgSml0
ZW5kcmEsIEkgYW0gc29ycnkgYnV0IGp1c3QgYSBmb2xsb3cgdXAuCj4gCj4gRG8gd2Uga25vdyBp
ZiBzdG1tYWMgbWFpbnRhaW5lciBhcmUgaWRlbnRpZmllZCBub3cgPwoKSSdtIGN1cmlvdXMgd2h5
IHN1Y2ggYSBwcmVjb25kaXRpb24gaXMgYWRkZWTvvJ8KCgpUaGFua3MsCllhbnRlbmcKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
