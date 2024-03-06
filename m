Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 695C9872DB5
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Mar 2024 04:55:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D8D0C6DD72;
	Wed,  6 Mar 2024 03:55:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 291DEC64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Mar 2024 03:55:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA08E1FB;
 Tue,  5 Mar 2024 19:55:37 -0800 (PST)
Received: from [10.162.41.20] (unknown [10.162.41.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28C793F762;
 Tue,  5 Mar 2024 19:54:56 -0800 (PST)
Message-ID: <4bfe9477-9ea9-4609-96c8-470cd5393d75@arm.com>
Date: Wed, 6 Mar 2024 09:24:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240222082142.3663983-1-anshuman.khandual@arm.com>
 <20240222082142.3663983-4-anshuman.khandual@arm.com>
 <921173d2-c996-4a0f-b3a5-b660036fa254@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <921173d2-c996-4a0f-b3a5-b660036fa254@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V5 03/11] coresight: tmc: Extract device
 properties from AMBA pid based table lookup
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

CgpPbiAzLzUvMjQgMjA6MDYsIFN1enVraSBLIFBvdWxvc2Ugd3JvdGU6Cj4gT24gMjIvMDIvMjAy
NCAwODoyMSwgQW5zaHVtYW4gS2hhbmR1YWwgd3JvdGU6Cj4+IFRoaXMgZXh0cmFjdHMgZGV2aWNl
IHByb3BlcnRpZXMgZnJvbSBBTUJBIHBpZCBiYXNlZCB0YWJsZSBsb29rdXAuIEJ1dCBmaXJzdAo+
PiB0aGlzIG1vZGlmaWVzIHRtY19ldHJfc2V0dXBfY2FwcygpIHRvIGFjY2VwdCBjc2RldiBhY2Nl
c3MuCj4+Cj4+IENjOiBTdXp1a2kgSyBQb3Vsb3NlIDxzdXp1a2kucG91bG9zZUBhcm0uY29tPgo+
PiBDYzogTWlrZSBMZWFjaCA8bWlrZS5sZWFjaEBsaW5hcm8ub3JnPgo+PiBDYzogSmFtZXMgQ2xh
cmsgPGphbWVzLmNsYXJrQGFybS5jb20+Cj4+IENjOiBjb3Jlc2lnaHRAbGlzdHMubGluYXJvLm9y
Zwo+PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IENjOiBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4+IFJldmlld2VkLWJ5OiBKYW1lcyBDbGFyayA8amFt
ZXMuY2xhcmtAYXJtLmNvbT4KPiAKPiBtaW5vciBuaXQ6IFNpbmNlIHRoZXJlIHdlcmUgc2lnbmlm
aWNhbnQgY2hhbmdlcyBmcm9tIHdoYXQgSmFtZXMgcHJldmlvdXNseSByZXZpZXdlZCwgaXQgaXMg
YSBnb29kIGlkZWEgdG8gZHJvcCBoaXMgUmV2aWV3ZWQtYnk6CgpTdXJlLCB3aWxsIGRvLgoKPiAK
PiBPdGhlcndpc2UsIHRoZSBjaGFuZ2VzIGxvb2sgZ29vZCB0byBtZS4KPiAKPiBTdXp1a2kKPiAK
Pj4gU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFy
bS5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIGluIFY1Ogo+Pgo+PiAtIE1vZGlmaWVkIHRtY19ldHJf
c2V0dXBfY2FwcygpIHRvIGFjY2VwdCBzdHJ1Y3QgY3NkZXZfYWNjZXNzIGFyZ3VtZW50Cj4+IC0g
UmV2ZXJ0ZWQgYmFjayB0bWNfZXRyX3NldHVwX2NhcHMoKSBjYWxsIHNpdGUgcG9zaXRpb24gaW4g
dG1jX3Byb2JlKCkKPj4gLSBEcm9wcGVkIGN1c3RvbSBtYXNrIFRNQ19BTUJBX01BU0sKPj4KPj4g
wqAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC10bWMtY29yZS5jIHwgMTQg
KysrKysrKysrKy0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2ln
aHQvY29yZXNpZ2h0LXRtYy1jb3JlLmMgYi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29y
ZXNpZ2h0LXRtYy1jb3JlLmMKPj4gaW5kZXggN2VjNTM2NWUyYjY0Li40Mzg3NGZhNGRlZjAgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtdG1jLWNv
cmUuYwo+PiArKysgYi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LXRtYy1j
b3JlLmMKPj4gQEAgLTM3MCwxNiArMzcwLDIzIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB0bWNfZXRy
X2hhc19ub25fc2VjdXJlX2FjY2VzcyhzdHJ1Y3QgdG1jX2RydmRhdGEgKmRydmRhdGEpCj4+IMKg
wqDCoMKgwqAgcmV0dXJuIChhdXRoICYgVE1DX0FVVEhfTlNJRF9NQVNLKSA9PSAweDM7Cj4+IMKg
IH0KPj4gwqAgK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYW1iYV9pZCB0bWNfaWRzW107Cj4+ICsKPj4g
wqAgLyogRGV0ZWN0IGFuZCBpbml0aWFsaXNlIHRoZSBjYXBhYmlsaXRpZXMgb2YgYSBUTUMgRVRS
ICovCj4+IC1zdGF0aWMgaW50IHRtY19ldHJfc2V0dXBfY2FwcyhzdHJ1Y3QgZGV2aWNlICpwYXJl
bnQsIHUzMiBkZXZpZCwgdm9pZCAqZGV2X2NhcHMpCj4+ICtzdGF0aWMgaW50IHRtY19ldHJfc2V0
dXBfY2FwcyhzdHJ1Y3QgZGV2aWNlICpwYXJlbnQsIHUzMiBkZXZpZCwKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGNzZGV2X2FjY2VzcyAqYWNjZXNzKQo+PiDC
oCB7Cj4+IMKgwqDCoMKgwqAgaW50IHJjOwo+PiAtwqDCoMKgIHUzMiBkbWFfbWFzayA9IDA7Cj4+
ICvCoMKgwqAgdTMyIHRtY19waWQsIGRtYV9tYXNrID0gMDsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qg
dG1jX2RydmRhdGEgKmRydmRhdGEgPSBkZXZfZ2V0X2RydmRhdGEocGFyZW50KTsKPj4gK8KgwqDC
oCB2b2lkICpkZXZfY2FwczsKPj4gwqAgwqDCoMKgwqDCoCBpZiAoIXRtY19ldHJfaGFzX25vbl9z
ZWN1cmVfYWNjZXNzKGRydmRhdGEpKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FQUND
RVM7Cj4+IMKgICvCoMKgwqAgdG1jX3BpZCA9IGNvcmVzaWdodF9nZXRfcGlkKGFjY2Vzcyk7Cj4+
ICvCoMKgwqAgZGV2X2NhcHMgPSBjb3Jlc2lnaHRfZ2V0X3VjaV9kYXRhX2Zyb21fYW1iYSh0bWNf
aWRzLCB0bWNfcGlkKTsKPj4gKwo+PiDCoMKgwqDCoMKgIC8qIFNldCB0aGUgdW5hZHZlcnRpc2Vk
IGNhcGFiaWxpdGllcyAqLwo+PiDCoMKgwqDCoMKgIHRtY19ldHJfaW5pdF9jYXBzKGRydmRhdGEs
ICh1MzIpKHVuc2lnbmVkIGxvbmcpZGV2X2NhcHMpOwo+PiDCoCBAQCAtNDk3LDggKzUwNCw3IEBA
IHN0YXRpYyBpbnQgdG1jX3Byb2JlKHN0cnVjdCBhbWJhX2RldmljZSAqYWRldiwgY29uc3Qgc3Ry
dWN0IGFtYmFfaWQgKmlkKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGVzYy50eXBlID0gQ09SRVNJ
R0hUX0RFVl9UWVBFX1NJTks7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZXNjLnN1YnR5cGUuc2lu
a19zdWJ0eXBlID0gQ09SRVNJR0hUX0RFVl9TVUJUWVBFX1NJTktfU1lTTUVNOwo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgZGVzYy5vcHMgPSAmdG1jX2V0cl9jc19vcHM7Cj4+IC3CoMKgwqDCoMKgwqDC
oCByZXQgPSB0bWNfZXRyX3NldHVwX2NhcHMoZGV2LCBkZXZpZCwKPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29yZXNpZ2h0X2dldF91Y2lfZGF0YShpZCkpOwo+
PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gdG1jX2V0cl9zZXR1cF9jYXBzKGRldiwgZGV2aWQsICZk
ZXNjLmFjY2Vzcyk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlkcl9pbml0
KCZkcnZkYXRhLT5pZHIpOwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
