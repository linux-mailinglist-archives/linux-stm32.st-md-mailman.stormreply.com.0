Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HCs2JR9x+WnH8gIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 06:25:03 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 261734C6597
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 06:25:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3F3AC055F4;
	Tue,  5 May 2026 04:25:02 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63D91C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2026 04:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
 Content-Type; bh=3B2CunHCGpiMjcTDIPvkA5wnx3g/cxDEDO4exp2ZkTA=;
 b=VBoDHIY4WJJi70YRfo0kb2nK/+cju4NajjJmVjFHGt7bThYMY/JDla9gJih2UX
 KZEWKBLXh/MbVlXiXid8BOx2ovYOfsu7WpBfnOLNrzg2JJJjL5dc2c5mpWgtzOZx
 WMWtVyyYMzkssQTjuVe2VJeOtqZUuZud/YB6NXldV8GlY=
Received: from [192.168.50.71] (unknown [])
 by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wC3T+7RcPlpXxPvDQ--.4818S2; 
 Tue, 05 May 2026 12:23:46 +0800 (CST)
Message-ID: <9be240fa-ab46-4b58-9240-5e96cab8a097@163.com>
Date: Tue, 5 May 2026 12:23:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Laight <david.laight.linux@gmail.com>
References: <20260430155456.36998-1-18255117159@163.com>
 <20260501093050.3f97cd3e@pumpkin>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260501093050.3f97cd3e@pumpkin>
X-CM-TRANSID: _____wC3T+7RcPlpXxPvDQ--.4818S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw48Cr43ArW3JFykuFWfKrg_yoW5GrW3pF
 48GF42vFs7JrWFkF4xCrW5CF1Yya4fKrWjga4Ut3s3ZwnYvr17ZrWkt3WrWa9rAFykGFWx
 KF4jy3s0k3ZxZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4OJOUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxUqzWn5cNXchAAA3c
Cc: linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 mcoquelin.stm32@gmail.com, lhjeff911@gmail.com, imx@lists.linux.dev,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, haibo.chen@nxp.com, linux-spi@vger.kernel.org,
 broonie@kernel.org, mhiramat@kernel.org, xianwei.zhao@amlogic.com,
 linux-amlogic@lists.infradead.org, han.xu@nxp.com, sunny.luo@amlogic.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
Subject: Re: [Linux-stm32] [PATCH 00/10] spi: Use FIELD_MODIFY() for
	bitfield operations
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
X-Rspamd-Queue-Id: 261734C6597
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[163.com:s=s110527];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[163.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:neil.armstrong@linaro.org,m:mcoquelin.stm32@gmail.com,m:lhjeff911@gmail.com,m:imx@lists.linux.dev,m:martin.blumenstingl@googlemail.com,m:khilman@baylibre.com,m:hayashi.kunihiko@socionext.com,m:haibo.chen@nxp.com,m:linux-spi@vger.kernel.org,m:broonie@kernel.org,m:mhiramat@kernel.org,m:xianwei.zhao@amlogic.com,m:linux-amlogic@lists.infradead.org,m:han.xu@nxp.com,m:sunny.luo@amlogic.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:jbrunet@baylibre.com,m:davidlaightlinux@gmail.com,m:mcoquelinstm32@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[18255117159@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_FROM(0.00)[163.com];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,linaro.org,gmail.com,lists.linux.dev,googlemail.com,baylibre.com,socionext.com,nxp.com,vger.kernel.org,kernel.org,amlogic.com,st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[163.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.105];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]

CgpPbiA1LzEvMjYgMTY6MzAsIERhdmlkIExhaWdodCB3cm90ZToKPiBPbiBUaHUsIDMwIEFwciAy
MDI2IDIzOjU0OjQ2ICswODAwCj4gSGFucyBaaGFuZyA8MTgyNTUxMTcxNTlAMTYzLmNvbT4gd3Jv
dGU6Cj4gCj4+IFJlcGxhY2Ugb3Blbi1jb2RlZCBiaXRmaWVsZCBtb2RpZmljYXRpb25zIHdpdGgg
dGhlIHN0YW5kYXJkIEZJRUxEX01PRElGWSgpCj4+IG1hY3JvIGFjcm9zcyBtdWx0aXBsZSBTUEkg
Y29udHJvbGxlciBkcml2ZXJzLiBUaGlzIGltcHJvdmVzIHJlYWRhYmlsaXR5IGFuZAo+PiBhZGRz
IGNvbXBpbGUtdGltZSBjaGVja2luZyB3aXRob3V0IGZ1bmN0aW9uYWwgY2hhbmdlcy4KPiAKPiBJ
IGRvbid0IHRoaW5rIHRoZXNlIGNoYW5nZXMgYXJlIHdvcnRoIHRoZSBlZmZvcnQuCj4gVGhlIHJl
YWRhYmlsaXR5IGRvZXNuJ3QgY2hhbmdlIG11Y2ggLSB5b3UgbmVlZCB0byBrbm93IHdoYXQgYSBz
bGlnaHRseQo+IG1vcmUgb2JzY3VyZSAnaGVscGVyJyBkb2VzLgo+IFRoZSBleHRyYSBjb21waWxl
LXRpbWUgY2hlY2tzIGFyZSBwcmV0dHkgdW5saWtlbHkgdG8gZXZlciBmaW5kIGEgcHJvYmxlbQo+
IGFuZCBtb3N0bHkganVzdCBzbG93IGRvd24gdGhlIGNvbXBpbGUuCj4gVGhlIGdlbmVyYXRlZCBj
b2RlIGlzIGxpa2VseSBiZSBzbGlnaHRseSB3b3JzZS4KPiBBbmQsIHdpdGggdGhlIGJlc3Qgd2ls
bCBpbiB0aGUgd29ybGQsIGl0IGlzIGVhc3kgdG8gbWFrZSBzaWxseSBtaXN0YWtlcy4KPiAKPiAJ
RGF2aWQKCkhpIERhdmlkLAoKRklFTERfTU9ESUZZKCkgaXMgYSBzdGFuZGFyZCBrZXJuZWwgaGVs
cGVyIChiaXRmaWVsZC5oKSwgbm90IGFuIG9ic2N1cmUKb25lLiBNeSByZWNlbnQgcG93ZXIgZG9t
YWluIHNlcmllcyB1c2luZyBzaW1pbGFyIHBhdHRlcm5zIHdhcyBhY2NlcHRlZDoKCmh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1wbS9jb3Zlci8yMDI2MDQzMDE2MzIx
My40NDY5NS0xLTE4MjU1MTE3MTU5QDE2My5jb20vCgpUaGUgUENJZSBtYWludGFpbmVyIGFsc28g
dmFsdWVzIHRoaXMga2luZCBvZiBjb2RlIHNpbXBsaWZpY2F0aW9uLCB3aGljaAplbmNvdXJhZ2Vk
IG1lIHRvIHNlbmQgdGhlc2UgU1BJIHBhdGNoZXMuCgpUaGUgbWFjcm8gb2ZmZXJzIGNvbXBpbGUt
dGltZSBvdmVyZmxvdyBjaGVja3MsIGFuZCBJJ3ZlIHZlcmlmaWVkIHRoZQpnZW5lcmF0ZWQgYXNz
ZW1ibHkgaXMgaWRlbnRpY2FsIChHQ0MvQ2xhbmcpLiBJIGJlbGlldmUgdGhlIHRyYWRl4oCRb2Zm
CmZhdm91cnMgcmVhZGFiaWxpdHkgYW5kIHNhZmV0eS4KCklmIHlvdSBzdGlsbCBwcmVmZXIgdG8g
a2VlcCB0aGUgb3BlbuKAkWNvZGVkIHZlcnNpb25zLCBJJ2xsIGRyb3AgdGhlCnNlcmllcy4gUGxl
YXNlIGxldCBtZSBrbm93LgoKCkJlc3QgcmVnYXJkcywKSGFucwoKPiAKPj4KPj4gRWFjaCBwYXRj
aCBtb2RpZmllcyBhIHNpbmdsZSBkcml2ZXIsIGFsbG93aW5nIGluZGVwZW5kZW50IHJldmlldyBh
bmQKPj4gYXBwbGljYXRpb24uCj4+Cj4+IEhhbnMgWmhhbmcgKDEwKToKPj4gICAgc3BpOiBhbWxv
Z2ljLXNwaWZjLWExOiBVc2UgRklFTERfTU9ESUZZKCkKPj4gICAgc3BpOiBhbWxvZ2ljLXNwaXNn
OiBVc2UgRklFTERfTU9ESUZZKCkKPj4gICAgc3BpOiBjYWRlbmNlLXhzcGk6IFVzZSBGSUVMRF9N
T0RJRlkoKQo+PiAgICBzcGk6IG1lc29uLXNwaWNjOiBVc2UgRklFTERfTU9ESUZZKCkKPj4gICAg
c3BpOiBueHAteHNwaTogVXNlIEZJRUxEX01PRElGWSgpCj4+ICAgIHNwaTogc24tZi1vc3BpOiBV
c2UgRklFTERfTU9ESUZZKCkKPj4gICAgc3BpOiBzdG0zMi1vc3BpOiBVc2UgRklFTERfTU9ESUZZ
KCkKPj4gICAgc3BpOiBzdG0zMi1xc3BpOiBVc2UgRklFTERfTU9ESUZZKCkKPj4gICAgc3BpOiBz
dW5wbHVzLXNwNzAyMTogVXNlIEZJRUxEX01PRElGWSgpCj4+ICAgIHNwaTogdW5pcGhpZXI6IFVz
ZSBGSUVMRF9NT0RJRlkoKQo+Pgo+PiAgIGRyaXZlcnMvc3BpL3NwaS1hbWxvZ2ljLXNwaWZjLWEx
LmMgfCAgNSArKy0tLQo+PiAgIGRyaXZlcnMvc3BpL3NwaS1hbWxvZ2ljLXNwaXNnLmMgICAgfCAx
MyArKysrKy0tLS0tLS0tCj4+ICAgZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UteHNwaS5jICAgICB8
ICAzICstLQo+PiAgIGRyaXZlcnMvc3BpL3NwaS1tZXNvbi1zcGljYy5jICAgICAgfCAgNSArKy0t
LQo+PiAgIGRyaXZlcnMvc3BpL3NwaS1ueHAteHNwaS5jICAgICAgICAgfCAxMiArKysrLS0tLS0t
LS0KPj4gICBkcml2ZXJzL3NwaS9zcGktc24tZi1vc3BpLmMgICAgICAgIHwgIDUgKystLS0KPj4g
ICBkcml2ZXJzL3NwaS9zcGktc3RtMzItb3NwaS5jICAgICAgIHwgIDcgKysrLS0tLQo+PiAgIGRy
aXZlcnMvc3BpL3NwaS1zdG0zMi1xc3BpLmMgICAgICAgfCAgNSArKy0tLQo+PiAgIGRyaXZlcnMv
c3BpL3NwaS1zdW5wbHVzLXNwNzAyMS5jICAgfCAgMyArLS0KPj4gICBkcml2ZXJzL3NwaS9zcGkt
dW5pcGhpZXIuYyAgICAgICAgIHwgMTMgKysrKystLS0tLS0tLQo+PiAgIDEwIGZpbGVzIGNoYW5n
ZWQsIDI3IGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQo+Pgo+Pgo+PiBiYXNlLWNvbW1p
dDogM2IzYmVhNmQ0YjljMTYyZjllNTU1OTA1ZDk2YjhjMWRhNjdlY2Q1YgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
