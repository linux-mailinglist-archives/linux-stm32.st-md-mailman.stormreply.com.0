Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4612E3BC
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jan 2020 09:19:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31EDCC36B1E;
	Thu,  2 Jan 2020 08:19:18 +0000 (UTC)
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 (using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D92AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jan 2020 00:38:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0020cM24027929
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
 Wed, 1 Jan 2020 16:38:22 -0800 (PST)
Received: from [128.224.162.195] (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
 Wed, 1 Jan 2020 16:38:20 -0800
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 <peppe.cavallaro@st.com>, <alexandre.torgue@st.com>
References: <20191231020302.71792-1-jiping.ma2@windriver.com>
 <57dcdaa1-feff-1134-919e-57b37e306431@cogentembedded.com>
From: Jiping Ma <Jiping.Ma2@windriver.com>
Message-ID: <4de343a7-e47f-2f72-4f5a-17ea9c7c0e1a@windriver.com>
Date: Thu, 2 Jan 2020 08:38:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <57dcdaa1-feff-1134-919e-57b37e306431@cogentembedded.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 02 Jan 2020 08:19:16 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] stmmac: debugfs entry name is not be
 changed when udev rename device name.
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

CgpPbiAxMi8zMS8yMDE5IDA2OjEyIFBNLCBTZXJnZWkgU2h0eWx5b3Ygd3JvdGU6Cj4gSGVsbG8h
Cj4KPiBPbiAzMS4xMi4yMDE5IDU6MDMsIEppcGluZyBNYSB3cm90ZToKPgo+PiBBZGQgb25lIG5v
dGlmaWVyIGZvciB1ZGV2IGNoYW5nZXMgbmV0IGRldmljZSBuYW1lLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBKaXBpbmcgTWEgPGppcGluZy5tYTJAd2luZHJpdmVyLmNvbT4KPj4gLS0tCj4+IMKgIC4u
Li9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyB8IDM4ICsrKysrKysr
KysrKysrKysrKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL3N0bW1hY19tYWluLmMgCj4+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX21haW4uYwo+PiBpbmRleCBiMTRmNDZhNTcxNTQuLmMxYzg3N2JiNDQyMSAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFj
X21haW4uYwo+PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1t
YWNfbWFpbi5jCj4+IEBAIC00MDM4LDYgKzQwMzgsNDAgQEAgc3RhdGljIGludCBzdG1tYWNfZG1h
X2NhcF9zaG93KHN0cnVjdCBzZXFfZmlsZSAKPj4gKnNlcSwgdm9pZCAqdikKPj4gwqAgfQo+PiDC
oCBERUZJTkVfU0hPV19BVFRSSUJVVEUoc3RtbWFjX2RtYV9jYXApOwo+PiDCoCArLyoqCj4+ICsg
KiBVc2UgbmV0d29yayBkZXZpY2UgZXZlbnRzIHRvIGNyZWF0ZS9yZW1vdmUvcmVuYW1lCj4+ICsg
KiBkZWJ1Z2ZzIGZpbGUgZW50cmllcwo+PiArICovCj4+ICtzdGF0aWMgaW50IHN0bW1hY19kZXZp
Y2VfZXZlbnQoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICp1bnVzZWQsCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBldmVudCwgdm9pZCAqcHRyKQo+
PiArewo+PiArwqDCoMKgIHN0cnVjdCBuZXRfZGV2aWNlICpkZXYgPSBuZXRkZXZfbm90aWZpZXJf
aW5mb190b19kZXYocHRyKTsKPj4gK8KgwqDCoCBzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYgPSBu
ZXRkZXZfcHJpdihkZXYpOwo+PiArCj4+ICvCoMKgwqAgc3dpdGNoIChldmVudCkgewo+PiArwqDC
oMKgIGNhc2UgTkVUREVWX0NIQU5HRU5BTUU6Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocHJpdi0+
ZGJnZnNfZGlyKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcml2LT5kYmdmc19kaXIgPSBk
ZWJ1Z2ZzX3JlbmFtZShzdG1tYWNfZnNfZGlyLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpdi0+ZGJnZnNfZGlyLAo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Rt
bWFjX2ZzX2RpciwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRldi0+bmFtZSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4g
Kwo+PiArwqDCoMKgIGNhc2UgTkVUREVWX0dPSU5HX0RPV046Cj4+ICvCoMKgwqDCoMKgwqDCoCBi
cmVhazsKPj4gKwo+PiArwqDCoMKgIGNhc2UgTkVUREVWX1VQOgo+PiArwqDCoMKgwqDCoMKgwqAg
YnJlYWs7Cj4KPiDCoMKgIFdoeSBub3QgbWVyZ2UgdGhlIGFib3ZlIDIgY2FzZXM/IE9yIGp1c3Qg
cmVtb3ZlIHRoZW0oJ2V2ZW50JyBpcyBub3QgCj4gKmVudW0qKT8KSSB3aWxsIHJlbW92ZSB0aGVt
LgoKVGhhbmtzLAo+Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICtkb25lOgo+PiArwqDCoMKgIHJldHVy
biBOT1RJRllfRE9ORTsKPj4gK30KPiBbLi4uXQo+Cj4gTUJSLCBTZXJnZWkKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
