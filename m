Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A0E9D49C7
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2024 10:19:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C04ECC7A82A;
	Thu, 21 Nov 2024 09:19:47 +0000 (UTC)
Received: from cmccmta1.chinamobile.com (cmccmta6.chinamobile.com
 [111.22.67.139])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E22AC78F6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2024 09:19:40 +0000 (UTC)
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
 by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee1673efb29a2c-2e343;
 Thu, 21 Nov 2024 17:19:38 +0800 (CST)
X-RM-TRANSID: 2ee1673efb29a2c-2e343
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [172.20.230.59] (unknown[223.108.79.101])
 by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee5673efb2983a-cbd8c;
 Thu, 21 Nov 2024 17:19:38 +0800 (CST)
X-RM-TRANSID: 2ee5673efb2983a-cbd8c
Message-ID: <bee10978-ce12-4813-957d-2d1288f49815@cmss.chinamobile.com>
Date: Thu, 21 Nov 2024 17:19:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, mcoquelin.stm32@gmail.com
References: <20241109055049.269163-1-guanjing@cmss.chinamobile.com>
 <cfb1caed-9402-4148-831d-57c50bdf6a27@foss.st.com>
 <1179b3a6-e430-4d9a-8f86-470e8cbe5738@foss.st.com>
From: guanjing <guanjing@cmss.chinamobile.com>
In-Reply-To: <1179b3a6-e430-4d9a-8f86-470e8cbe5738@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] firewall: remove misplaced semicolon
 fromstm32_firewall_get_firewall
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

VGhhbmtzIGZvciB5b3VyIGFkdmljZS4gSSBhcG9sb2dpemUgZm9yIHRoZSBvbWlzc2lvbi4gOikK
CgpPbiAyMDI0LzExLzEyIDE3OjQwLCBHYXRpZW4gQ0hFVkFMTElFUiB3cm90ZToKPiBPbiAxMS8x
Mi8yNCAxMDoyNSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPj4gSGkKPj4KPj4gT24gMTEvOS8y
NCAwNjo1MCwgZ3Vhbmppbmcgd3JvdGU6Cj4+PiBSZW1vdmUgbWlzcGxhY2VkIGNvbG9uIGluIHN0
bTMyX2ZpcmV3YWxsX2dldF9maXJld2FsbCgpCj4+PiB3aGljaCByZXN1bHRzIGluIGEgc3ludGF4
IGVycm9yIHdoZW4gdGhlIGNvZGUgaXMgY29tcGlsZWQKPj4+IHdpdGhvdXQgQ09ORklHX1NUTTMy
X0ZJUkVXQUxMLgo+Pj4KPj4+IEZpeGVzOiA1Yzk2NjhjZmM2ZDcgKCJmaXJld2FsbDogaW50cm9k
dWNlIHN0bTMyX2ZpcmV3YWxsIGZyYW1ld29yayIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBndWFuamlu
ZyA8Z3VhbmppbmdAY21zcy5jaGluYW1vYmlsZS5jb20+Cj4+PiAtLS0KPj4+IMKgIGluY2x1ZGUv
bGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsX2RldmljZS5oIHwgMiArLQo+Pj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsX2RldmljZS5oIAo+Pj4gYi9pbmNsdWRl
L2xpbnV4L2J1cy9zdG0zMl9maXJld2FsbF9kZXZpY2UuaAo+Pj4gaW5kZXggMThlMGEyZmMzODE2
Li41MTc4YjcyYmM5MjAgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2J1cy9zdG0zMl9m
aXJld2FsbF9kZXZpY2UuaAo+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9idXMvc3RtMzJfZmlyZXdh
bGxfZGV2aWNlLmgKPj4+IEBAIC0xMTUsNyArMTE1LDcgQEAgdm9pZCBzdG0zMl9maXJld2FsbF9y
ZWxlYXNlX2FjY2Vzc19ieV9pZChzdHJ1Y3QgCj4+PiBzdG0zMl9maXJld2FsbCAqZmlyZXdhbGws
IHUzMiBzdQo+Pj4gwqAgI2Vsc2UgLyogQ09ORklHX1NUTTMyX0ZJUkVXQUxMICovCj4+PiDCoCBp
bnQgc3RtMzJfZmlyZXdhbGxfZ2V0X2ZpcmV3YWxsKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIHN0
cnVjdCAKPj4+IHN0bTMyX2ZpcmV3YWxsICpmaXJld2FsbCwKPj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IG5iX2ZpcmV3YWxsKTsKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IG5iX2ZpcmV3YWxsKQo+Pj4gwqAgewo+
Pj4gwqDCoMKgwqDCoCByZXR1cm4gLUVOT0RFVjsKPj4+IMKgIH0KPj4KPj4gQWNrZWQtYnk6IEFs
ZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4+Cj4+IFRoYW5r
cwo+PiBBbGV4Cj4KPiBIaSwgcGxlYXNlIHVzZSBnZXRfbWFpbnRhaW5lcnMucGwgc2NyaXB0IG5l
eHQgdGltZSBzbyB0aGF0Cj4gYWRlcXVhdGUgcGVvcGxlIGFyZSBwdXQgaW4gVG8vQ0MuCj4gTmV2
ZXJ0aGVsZXNzLCB0aGFua3MgZm9yIHRoZSBwYXRjaCEKPgo+IFJldmlld2VkLWJ5OiBHYXRpZW4g
Q2hldmFsbGllciA8Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
