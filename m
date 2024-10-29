Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1B79B4C66
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 15:45:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 736BAC71290;
	Tue, 29 Oct 2024 14:45:16 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4ADECC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 14:45:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C8B31C0003;
 Tue, 29 Oct 2024 14:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730213109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJ+dC1+4ZiHEQDgeU3fYeNHYmT0utELbJCQ8uYRI6pg=;
 b=iDH/SeYmV60b+LV3bzsR3t53id4bQ/Vw04kE/AfHvXUuPZY02OK6qS18rcqRh1aw7V7b8q
 LPkhLTlg0Toz050MWeyG6jGFg0x246Bj7eadjEf01JrkXzkQlmCmXPhWx7P/z/TzJOlF2R
 BZ/iFu7PoNC62kEp3xJWauHlhmj/cZX8C3MwoT8G0fJxHiGvQgra78MRZ9hBSLgouHSv3o
 NqVNkGnbHtVO5DHSOynyOKClVNLSzaZSvoXYy31oXv+PuNNglNZ0K/C49Gtd2qqCrMnOrm
 jbG5IR/0ZRCbSUbnxkpXzCfh8sjkZjOZ0fNEey+O2qgq/MEO9gy+ucGeJwVjCQ==
Message-ID: <a905c45d-344b-49e9-a0c9-fb7b6445edad@bootlin.com>
Date: Tue, 29 Oct 2024 15:45:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
References: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Language: en-US
In-Reply-To: <20241029115419.1160201-1-maxime.chevallier@bootlin.com>
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/7] Support external snapshots
	on dwmac1000
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

SGVsbG8gTWF4aW1lLAoKT24gMTAvMjkvMjQgMTI6NTQsIE1heGltZSBDaGV2YWxsaWVyIHdyb3Rl
Ogo+IEhpLAo+IAo+IFRoaXMgc2VyaWVzIGlzIGFub3RoZXIgdGFrZSBvbiB0aGUgcGVydmlvdXMg
d29yayBbMV0gZG9uZSBieQo+IEFsZXhpcyBMb3Rob3LDqSwgdGhhdCBmaXhlcyB0aGUgc3VwcG9y
dCBmb3IgZXh0ZXJuYWwgc25hcHNob3RzCj4gdGltZXN0YW1waW5nIGluIEdNQUMzLWJhc2VkIGRl
dmljZXMuCj4gCgpbLi4uXQoKPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL25ldGRldi8y
MDIzMDYxNjEwMDQwOS4xNjQ1ODMtMS1hbGV4aXMubG90aG9yZUBib290bGluLmNvbS8KPiAKPiBU
aGFua3MgQWxleGlzIGZvciBsYXlpbmcgdGhlIGdyb3VuZHdvcmsgZm9yIHRoaXMsCj4gCj4gQmVz
dCByZWdhcmRzLAo+IAo+IE1heGltZQoKVGhhbmtzIGZvciBtYWtpbmcgdGhpcyB0b3BpYyBtb3Zl
IGZvcndhcmQuIEkgc3VzcGVjdCB0aGUgc2VyaWVzIHRvIGJlIG1pc3NpbmcKc29tZSBiaXRzOiBp
biB0aGUgaW5pdGlhbCBzZXJpZXMgeW91IG1lbnRpb24gaW4gWzFdLCBJIGFsc28gcmV3b3JrZWQK
c3RtbWFjX2h3dHN0YW1wX3NldCBpbiBzdG1tYWNfbWFpbi5jLCB3aGljaCBpcyBhbHNvIGN1cnJl
bnRseSBhc3N1bWluZyBhIEdNQUM0CmxheW91dCAoWzJdKS4gSSBzdXNwZWN0IHRoYXQgaW4geW91
ciBzZXJpZXMgY3VycmVudCBzdGF0ZSwgYW55IG5ldyBjYWxsIHRvCnN0bW1hY19od3RzdGFtcF9z
ZXQgd2lsbCBvdmVyd3JpdGUgYW55IHByZXZpb3VzbHkgY29uZmlndXJlZCBoYXJkd2FyZSB0aW1l
c3RhbXBpbmcuCgpbMl0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjMwNjE2MTAw
NDA5LjE2NDU4My04LWFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tLwo+IAo+IE1heGltZSBDaGV2
YWxsaWVyICg3KToKPiAgIG5ldDogc3RtbWFjOiBEb24ndCBtb2RpZnkgdGhlIGdsb2JhbCBwdHAg
b3BzIGRpcmVjdGx5Cj4gICBuZXQ6IHN0bW1hYzogVXNlIHBlci1odyBwdHAgY2xvY2sgb3BzCj4g
ICBuZXQ6IHN0bW1hYzogT25seSB1cGRhdGUgdGhlIGF1dG8tZGlzY292ZXJlZCBQVFAgY2xvY2sg
ZmVhdHVyZXMKPiAgIG5ldDogc3RtbWFjOiBJbnRyb2R1Y2UgZHdtYWMxMDAwIHB0cF9jbG9ja19p
bmZvIGFuZCBvcGVyYXRpb25zCj4gICBuZXQ6IHN0bW1hYzogSW50cm9kdWNlIGR3bWFjMTAwMCB0
aW1lc3RhbXBpbmcgb3BlcmF0aW9ucwo+ICAgbmV0OiBzdG1tYWM6IEVuYWJsZSB0aW1lc3RhbXBp
bmcgaW50ZXJydXB0IG9uIGR3bWFjMTAwMAo+ICAgbmV0OiBzdG1tYWM6IERvbid0IGluY2x1ZGUg
ZHdtYWM0IGRlZmluaXRpb25zIGluIHN0bW1hY19wdHAKPiAKPiAgZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvY29tbW9uLmggIHwgIDQgKwo+ICAuLi4vbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjMTAwMC5oICAgfCAxNSArKystCj4gIC4uLi9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYzEwMDBfY29yZS5jICB8IDg1ICsrKysrKysrKysrKysrKysrKysKPiAg
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvaHdpZi5jICAgIHwgMTQgKystCj4g
IC4uLi9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfaHd0c3RhbXAuYyB8IDExICsrKwo+
ICAuLi4vbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wdHAuYyAgfCAzOCArKysr
KysrLS0KPiAgLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcHRwLmggIHwg
MTAgKysrCj4gIDcgZmlsZXMgY2hhbmdlZCwgMTY1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQo+IAoKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
