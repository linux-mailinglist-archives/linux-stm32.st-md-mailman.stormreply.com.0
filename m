Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB2955FF21
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jun 2022 13:58:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 230F9C5F1EE;
	Wed, 29 Jun 2022 11:58:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CA14C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jun 2022 11:58:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F59F61B6B;
 Wed, 29 Jun 2022 11:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4620FC341D8;
 Wed, 29 Jun 2022 11:58:14 +0000 (UTC)
Message-ID: <5ff3220b-d8c9-430b-7e7a-621746ccf23d@xs4all.nl>
Date: Wed, 29 Jun 2022 13:58:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20220627174156.66919-1-marex@denx.de>
 <3ef88906-188d-52a6-c3bf-647bc4e36732@xs4all.nl>
 <c4abd47e-a721-b92f-c84a-bdb6436d997d@denx.de>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <c4abd47e-a721-b92f-c84a-bdb6436d997d@denx.de>
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH v2] media: stm32: dcmi: Switch to
 __v4l2_subdev_state_alloc()
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

T24gMjkvMDYvMjAyMiAxMzowNCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNi8yOS8yMiAxMTo0
MSwgSGFucyBWZXJrdWlsIHdyb3RlOgo+PiBIaSBNYXJlaywgVG9taSwgTGF1cmVudCwKPiAKPiBI
aSwKPiAKPiBbLi4uXQo+IAo+Pj4gwqAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdC9zdG0zMi9z
dG0zMi1kY21pLmMgfCA1OSArKysrKysrKysrKystLS0tLS0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDM3IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0L3N0bTMyL3N0bTMyLWRjbWkuYyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vc3Qvc3RtMzIvc3RtMzItZGNtaS5jCj4+PiBpbmRleCBjNjA0ZDY3MmMy
MTU2Li5jNjhkMzI5MzFiMjc3IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9zdC9zdG0zMi9zdG0zMi1kY21pLmMKPj4+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
c3Qvc3RtMzIvc3RtMzItZGNtaS5jCj4+PiBAQCAtOTk2LDIyICs5OTYsMzAgQEAgc3RhdGljIGlu
dCBkY21pX3RyeV9mbXQoc3RydWN0IHN0bTMyX2RjbWkgKmRjbWksIHN0cnVjdCB2NGwyX2Zvcm1h
dCAqZiwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkY21pX2ZyYW1lc2l6
ZSAqc2RfZnJhbWVzaXplKQo+Pj4gwqAgewo+Pj4gwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZGNt
aV9mb3JtYXQgKnNkX2ZtdDsKPj4+ICvCoMKgwqAgc3RhdGljIHN0cnVjdCBsb2NrX2NsYXNzX2tl
eSBrZXk7Cj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBkY21pX2ZyYW1lc2l6ZSBzZF9mc2l6ZTsKPj4+
IMKgwqDCoMKgwqAgc3RydWN0IHY0bDJfcGl4X2Zvcm1hdCAqcGl4ID0gJmYtPmZtdC5waXg7Cj4+
PiAtwqDCoMKgIHN0cnVjdCB2NGwyX3N1YmRldl9wYWRfY29uZmlnIHBhZF9jZmc7Cj4+PiAtwqDC
oMKgIHN0cnVjdCB2NGwyX3N1YmRldl9zdGF0ZSBwYWRfc3RhdGUgPSB7Cj4+PiAtwqDCoMKgwqDC
oMKgwqAgLnBhZHMgPSAmcGFkX2NmZwo+Pj4gLcKgwqDCoMKgwqDCoMKgIH07Cj4+PiArwqDCoMKg
IHN0cnVjdCB2NGwyX3N1YmRldl9zdGF0ZSAqc2Rfc3RhdGU7Cj4+PiDCoMKgwqDCoMKgIHN0cnVj
dCB2NGwyX3N1YmRldl9mb3JtYXQgZm9ybWF0ID0gewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC53
aGljaCA9IFY0TDJfU1VCREVWX0ZPUk1BVF9UUlksCj4+PiDCoMKgwqDCoMKgIH07Cj4+PiDCoMKg
wqDCoMKgIGJvb2wgZG9fY3JvcDsKPj4+IMKgwqDCoMKgwqAgaW50IHJldDsKPj4+IMKgICvCoMKg
wqAgLyoKPj4+ICvCoMKgwqDCoCAqIEZJWE1FOiBEcm9wIHRoaXMgY2FsbCwgZHJpdmVycyBhcmUg
bm90IHN1cHBvc2VkIHRvIHVzZQo+Pj4gK8KgwqDCoMKgICogX192NGwyX3N1YmRldl9zdGF0ZV9h
bGxvYygpLgo+Pj4gK8KgwqDCoMKgICovCj4+PiArwqDCoMKgIHNkX3N0YXRlID0gX192NGwyX3N1
YmRldl9zdGF0ZV9hbGxvYyhkY21pLT5zb3VyY2UsICJkY21pOnN0YXRlLT5sb2NrIiwgJmtleSk7
Cj4+PiArwqDCoMKgIGlmIChJU19FUlIoc2Rfc3RhdGUpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJl
dHVybiBQVFJfRVJSKHNkX3N0YXRlKTsKPj4+ICsKPj4KPj4gSSd2ZSBiZWVuIHJlYWRpbmcgdGhl
IGRpc2N1c3Npb24gZm9yIHRoZSB2MSBwYXRjaCwgYW5kIEkgc2VyaW91c2x5IGRvIG5vdCBsaWtl
IHRoaXMuCj4+Cj4+IE15IGNvbW1lbnRzIGFyZSBub3Qgc3BlY2lmaWNhbGx5IGZvciB0aGlzIHBh
dGNoLCBidXQgZm9yIGFsbCBjYXNlcyB3aGVyZQo+PiBfX3Y0bDJfc3ViZGV2X3N0YXRlX2FsbG9j
IGlzIGNhbGxlZC4KPj4KPj4gSXQgaXMgbm93IHVzZWQgaW4gNCBkcml2ZXJzLCBzbyB0aGF0J3Mg
bm8gbG9uZ2VyIGEgcmFyZSBjYXNlLCBhbmQgdGhlIGNvZGUgaXNuJ3QKPj4gZXhhY3RseSB0cml2
aWFsIGVpdGhlci4KPj4KPj4gSSB0aGluayBhIGhlbHBlciBmdW5jdGlvbiBtaWdodCBiZSBiZW5l
ZmljaWFsLCBidXQgdGhlIHJlYWwgcHJvYmxlbSBpcyB3aXRoIHRoZQo+PiBjb21tZW50OiBpdCBk
b2VzIG5vdCBleHBsYWluIHdoeSB5b3Ugc2hvdWxkbid0IHVzZSBpdCBhbmQgd2hhdCBuZWVkcyB0
byBiZSBkb25lCj4+IHRvIGZpeCBpdC4KPj4KPj4gTXkgc3VnZ2VzdGlvbiB3b3VsZCBiZSB0byBk
b2N1bWVudCB0aGF0IGluIHRoZSBrZXJuZWxkb2MgZm9yIHRoaXMgZnVuY3Rpb24gaW4KPj4gbWVk
aWEvdjRsMi1zdWJkZXYuaCwgYW5kIHRoZW4gcmVmZXIgdG8gdGhhdCBmcm9tIHRoaXMgY29tbWVu
dCAoYW5kIHNpbWlsYXIgY29tbWVudHMKPj4gaW4gdGhlIG90aGVyIGRyaXZlcnMgdGhhdCB1c2Ug
dGhpcykuCj4gCj4gV291bGQgaXQgYmUgT0sgaWYgSSBsZWZ0IHRoZSBjb3JlIHJld29yay9kb2N1
bWVudGF0aW9uIHRvIFRvbWkgYXMgYSBzdWJzZXF1ZW50IHBhdGNoIHRvIHRoaXMgb25lID8KClll
cy4gSXQgd291bGQgYmUgbmljZSBpZiBUb21pIGNhbiBtYWtlIGEgcGF0Y2ggZml4aW5nIHRoZSBj
b21tZW50cyBhcyBzdWdnZXN0ZWQgYWJvdmUsCmFuZCB0aGVuIHlvdXIgcGF0Y2ggY2FuIGdvIG9u
IHRvcC4gQWRkaW5nIGEgaGVscGVyIGZ1bmN0aW9uIGNhbiBiZSBkb25lIGxhdGVyLCBpdCdzCm5v
dCBteSBtYWluIGNvbmNlcm4uCgo+IAo+PiBBbmQgYW5vdGhlciBxdWVzdGlvbjogYXJlIG1vcmUg
ZHJpdmVycyBhZmZlY3RlZCBieSB0aGlzPyBJcyBpdCBwb3NzaWJsZSB0bwo+PiBmaW5kIHRob3Nl
IGFuZCBmaXggdGhlbSBhbGw/Cj4gCj4gUHJvYmFibHksIEkgb25seSByYW4gaW50byBpdCB3aXRo
IHRoZSBEQ01JIHNvIGZhci4KClRvbWksIGRvIHlvdSBrbm93PwoKUmVnYXJkcywKCglIYW5zCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
