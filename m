Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E12B6495F7E
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jan 2022 14:12:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8472EC5F1EB;
	Fri, 21 Jan 2022 13:12:53 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD991C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 13:12:52 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C0A0180FDE;
 Fri, 21 Jan 2022 14:12:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642770772;
 bh=gOK+KoEhV8IsdAelX1RAzCZ18FHAlg4FPukwYmI3h3s=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=dfiZbczjWnURcFUKrVbh1NvK3+/OK3rAACUbr03OT4mfbUH0cMFDYwrVZl/fKJtnZ
 lxTpshd6TUAFNhBL5rqHahOY4SKgt/90jXJLmXBRLHbZ6NlJYLqYb5czupzgmDPo3D
 vxOpPIeaJCe4KBj7+nZR0BT3f0AoNHFvbDivsq3ae1pfaoA3xqFzOo1VrepS3FmZ0f
 FunJ5Vyec9tCAmH8Fr1Ik21gMCdxcBJWe/GNuGzYPb+3/XMWo90+cAbS6dBAIdVKuV
 5KdBZ4O6ItLVYW95hqS0xikmhdAKxwnU8vtpYhqX/q3XszqhpvFxhIWDSdxjBkBXrO
 wfip5NHOzxsAQ==
Message-ID: <6bf770a8-9a87-9806-d1a1-9564e018817c@denx.de>
Date: Fri, 21 Jan 2022 14:12:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
To: Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20220118202958.1840431-1-marex@denx.de>
 <20220120220356.79C3CC340E0@smtp.kernel.org>
 <2752700e-83ec-d844-e99e-73be8ff87ee9@denx.de>
In-Reply-To: <2752700e-83ec-d844-e99e-73be8ff87ee9@denx.de>
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, jneuhauser@dh-electronics.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH 1/5] clk: stm32mp1: Split ETHCK_K into
 separate MUX and GATE clock
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

T24gMS8yMC8yMiAyMzozOSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMS8yMC8yMiAyMzowMywg
U3RlcGhlbiBCb3lkIHdyb3RlOgo+PiBRdW90aW5nIE1hcmVrIFZhc3V0ICgyMDIyLTAxLTE4IDEy
OjI5OjU0KQo+Pj4gVGhlIEVUSENLX0sgYXJlIG1vZGVsZWQgYXMgY29tcG9zaXRlIGNsb2NrIG9m
IE1VWCBhbmQgR0FURSwgaG93ZXZlciBwZXIKPj4+IFNUTTMyTVAxIFJlZmVyZW5jZSBNYW51YWwg
Uk0wNDM2IFJldiAzLCBQYWdlIDU3NCwgRmlndXJlIDgzLiBQZXJpcGhlcmFsCj4+PiBjbG9jayBk
aXN0cmlidXRpb24gZm9yIEV0aGVybmV0LCBFVEhQVFBESVYgZGl2aWRlciBpcyBhdHRhY2hlZCBw
YXN0IHRoZQo+Pj4gRVRIQ0tfSyBtdXgsIGFuZCBFVEhfQ0xLL2V0aF9jbGtfZmIgY2xvY2sgYXJl
IG91dHB1dCBwYXN0IEVUSENLRU4gZ2F0ZS4KPj4+IFRoZXJlZm9yZSwgaW4gY2FzZSBFVEhfQ0xL
L2V0aF9jbGtfZmIgYXJlIG5vdCBpbiB1c2UgQU5EIFBUUCBjbG9jayBhcmUKPj4+IGluIHVzZSwg
RVRIQ0tFTiBnYXRlIGNhbiBiZSB0dXJuZWQgb2ZmLiBDdXJyZW50IGRyaXZlciBkb2VzIG5vdCBw
ZXJtaXQKPj4+IHRoYXQsIGZpeCBpdC4KPj4+Cj4+PiBUaGlzIHBhdGNoIGNvbnZlcnRzIEVUSENL
X0sgZnJvbSBjb21wb3NpdGUgY2xvY2sgaW50byBhIEVUSENLRU4gZ2F0ZSwKPj4+IEVUSFBUUF9L
IGZyb20gY29tcG9zaXRlIGNsb2NrIGludG8gRVRIUFRQRElWIGRpdmlkZXIsIGFuZCBhZGRzIGFu
b3RoZXIKPj4+IE5PX0lEIGNsb2NrICJja19rZXJfZXRoIiB3aGljaCBtb2RlbHMgdGhlIEVUSFNS
QyBtdXggYW5kIGlzIHBhcmVudCBjbG9jawo+Pj4gdG8gYm90aCBFVEhDS19LIGFuZCBFVEhQVFBf
Sy4gVGhlcmVmb3JlLCBhbGwgcmVmZXJlbmNlcyB0byBFVEhDS19LIGFuZAo+Pj4gRVRIUFRQX0sg
cmVtYWluIGZ1bmN0aW9uYWwgYXMgYmVmb3JlLgo+Pj4KPj4+IFsxXSBTVE0zMk1QMSBSZWZlcmVu
Y2UgTWFudWFsIFJNMDQzNiBSZXYgMywgUGFnZSA1NzQsCj4+PiDCoMKgwqDCoCBGaWd1cmUgODMu
IFBlcmlwaGVyYWwgY2xvY2sgZGlzdHJpYnV0aW9uIGZvciBFdGhlcm5ldAo+Pj4gICAgICAKPj4+
IGh0dHBzOi8vd3d3LnN0LmNvbS9yZXNvdXJjZS9lbi9yZWZlcmVuY2VfbWFudWFsL2RtMDAzMjc2
NTktc3RtMzJtcDE1Ny1hZHZhbmNlZC1hcm1iYXNlZC0zMmJpdC1tcHVzLXN0bWljcm9lbGVjdHJv
bmljcy5wZGYgCj4+Pgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBk
ZW54LmRlPgo+Pj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5z
dC5jb20+Cj4+PiBDYzogQ2hyaXN0b3BoZSBSb3VsbGllciA8Y2hyaXN0b3BoZS5yb3VsbGllckBm
b3NzLnN0LmNvbT4KPj4+IENjOiBHYWJyaWVsIEZlcm5hbmRleiA8Z2FicmllbC5mZXJuYW5kZXpA
Zm9zcy5zdC5jb20+Cj4+PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9z
cy5zdC5jb20+Cj4+PiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3Nz
LnN0LmNvbT4KPj4+IENjOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+Cj4+PiBDYzog
bGludXgtY2xrQHZnZXIua2VybmVsLm9yZwo+Pj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KPj4+IFRvOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPj4+IC0tLQo+Pgo+PiBBbnkgY292ZXIgbGV0dGVyPwo+IAo+IElmIHRoZXJlIGlzIGEg
bmVlZCBmb3IgVjIsIEkgd2lsbCBzZW5kIG9uZS4gQWRtaXR0ZWRseSwgSSBmb3Jnb3Qgb25lIGhl
cmUuCj4gCj4+IFdoYXQgaXMgdGhlIG1lcmdlIHN0cmF0ZWd5IG9mIHRoaXMgcGF0Y2ggc2VyaWVz
Pwo+IAo+IENsb2NrIGJpdHMgMS81IGFuZCAyLzUgY2FuIGdvIHRocm91Z2ggY2xvY2sgdHJlZSwg
RFQgYml0cyB0aHJvdWdoIEFsZXgncyAKPiBTVCB0cmVlLgo+IAo+PiBEbyBJIG5lZWQgdG8gYWNr
IHRoZSBwYXRjaGVzPwo+IAo+IEkgYW0gd2FpdGluZyBmb3IgQUIvUkIgZnJvbSBTVCwgdGhlbiB0
aGV5IGNhbiBiZSBtZXJnZWQuCj4gCj4gSWYgeW91IHdhbnQgdG8gcmV2aWV3IHRoZSBmaXJzdCB0
d28gcGF0Y2hlcywgc3VyZSwgdGhlIHRvcCBoYWxmIG9mIDIvNSAKPiBpcyBwcm9iYWJseSB0aGUg
bW9zdCBpbnRlcmVzdGluZyBwYXJ0LCBiYXNlZCBvbiB5b3VyIHN1Z2dlc3Rpb24gZnJvbSAKPiBh
bG1vc3QgYSB5ZWFyIGFnby4gVGhlIHJlc3QgYXJlIGNsb2NrIGNvbnRyb2xsZXIgaGFyZHdhcmUg
ZGV0YWlscy4KClNvIGlmIHlvdSB3YW50IHRvIHBpY2sgMS81IGFuZCAyLzUgdmlhIGNsb2NrIHRy
ZWUgd2l0aCBBLUIgZnJvbSBHYWJyaWVsLCAKcGxlYXNlIGRvLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
