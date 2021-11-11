Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CC34504D6
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Nov 2021 14:00:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E29B0C5F1CF;
	Mon, 15 Nov 2021 13:00:08 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58A4DC5660B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 15:02:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CECF01FD40;
 Thu, 11 Nov 2021 15:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636642950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I0IS9eHAFjRbFhRVgmy1zwTE8qh3rhYd1ikPaMLm9/o=;
 b=0XK4wzAIhjQJeIlvW/qyZnVjyx6c/uosaQxI8SBFgQ8Q/3nVa4h6aMxzcKLcueX78zaPkZ
 sgP81p+Wnq8DTHFYZgHcCl9BIGrm4li+YZcv6F7VVlThQTh2psuxauB6TfO1KjrJxlZd19
 7156aXVpu8M6PJgKvb4yVt5nPhCsR2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636642950;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I0IS9eHAFjRbFhRVgmy1zwTE8qh3rhYd1ikPaMLm9/o=;
 b=I8toBzgm8ND8LYB2vlNRMR2O4Cm/YcjT+o/J0JJrsHgo6KPToMffKVmcICAebMatOSyw1T
 JaFa+9lR9XC/wmCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0505213DBC;
 Thu, 11 Nov 2021 15:02:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wXJ2OYUwjWHhcQAAMHmgww
 (envelope-from <dkirjanov@suse.de>); Thu, 11 Nov 2021 15:02:29 +0000
To: "Li, Meng" <Meng.Li@windriver.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>
References: <20211111135630.24996-1-Meng.Li@windriver.com>
 <499952a2-c919-109d-4f0a-fb4db4ead604@suse.de>
 <PH0PR11MB5191582745F77F7D876001ECF1949@PH0PR11MB5191.namprd11.prod.outlook.com>
From: Denis Kirjanov <dkirjanov@suse.de>
Message-ID: <788fa547-49c9-458b-8427-afddcee412a6@suse.de>
Date: Thu, 11 Nov 2021 18:02:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <PH0PR11MB5191582745F77F7D876001ECF1949@PH0PR11MB5191.namprd11.prod.outlook.com>
Content-Language: ru
X-Mailman-Approved-At: Mon, 15 Nov 2021 13:00:05 +0000
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: socfpga: add runtime
 suspend/resume callback for stratix10 platform
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

CgoxMS8xMS8yMSA1OjE2IFBNLCBMaSwgTWVuZyDQv9C40YjQtdGCOgo+IAo+IAo+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBEZW5pcyBLaXJqYW5vdiA8ZGtpcmphbm92QHN1
c2UuZGU+Cj4+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAxMSwgMjAyMSAxMDowMiBQTQo+PiBU
bzogTGksIE1lbmcgPE1lbmcuTGlAd2luZHJpdmVyLmNvbT47IHBlcHBlLmNhdmFsbGFyb0BzdC5j
b207Cj4+IGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb207IGpvYWJyZXVAc3lub3BzeXMuY29t
Owo+PiBkYXZlbUBkYXZlbWxvZnQubmV0OyBrdWJhQGtlcm5lbC5vcmc7IG1jb3F1ZWxpbi5zdG0z
MkBnbWFpbC5jb20KPj4gQ2M6IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb207Cj4+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+PiBTdWJqZWN0OiBSZTog
W1BBVENIXSBuZXQ6IHN0bW1hYzogc29jZnBnYTogYWRkIHJ1bnRpbWUgc3VzcGVuZC9yZXN1bWUK
Pj4gY2FsbGJhY2sgZm9yIHN0cmF0aXgxMCBwbGF0Zm9ybQo+Pgo+PiBbUGxlYXNlIG5vdGU6IFRo
aXMgZS1tYWlsIGlzIGZyb20gYW4gRVhURVJOQUwgZS1tYWlsIGFkZHJlc3NdCj4+Cj4+IDExLzEx
LzIxIDQ6NTYgUE0sIE1lbmcgTGkg0L/QuNGI0LXRgjoKPj4+IEZyb206IE1lbmcgTGkgPG1lbmcu
bGlAd2luZHJpdmVyLmNvbT4KPj4+Cj4+PiBBY2NvcmRpbmcgdG8gdXBzdHJlYW0gY29tbWl0IDVl
YzU1ODIzNDM4ZSgibmV0OiBzdG1tYWM6Cj4+PiBhZGQgY2xvY2tzIG1hbmFnZW1lbnQgZm9yIGdt
YWMgZHJpdmVyICIpLCBpdCBpbXByb3ZlIGNsb2NrcyBtYW5hZ2VtZW50Cj4+PiBmb3Igc3RtbWFj
IGRyaXZlci4gU28sIGl0IGlzIG5lY2Vzc2FyeSB0byBpbXBsZW1lbnQgdGhlIHJ1bnRpbWUKPj4+
IGNhbGxiYWNrIGluIGR3bWFjLXNvY2ZwZ2EgZHJpdmVyIGJlY2F1c2UgaXQgZG9lc27igJl0IHVz
ZSB0aGUgY29tbW9uCj4+PiBzdG1tYWNfcGx0ZnJfcG1fb3BzIGluc3RhbmNlLiBPdGhlcndpc2Us
IGNsb2NrcyBhcmUgbm90IGRpc2FibGVkIHdoZW4KPj4+IHN5c3RlbSBlbnRlcnMgc3VzcGVuZCBz
dGF0dXMuCj4+Cj4+IFBsZWFzZSBhZGQgRml4ZXMgdGFnCj4gCj4gVGhhbmtzIGZvciBzdWdnZXN0
Lgo+IFllcyEgdGhpcyBwYXRjaCBpcyB1c2VkIHRvIGZpeCBhbiBjbG9jayBvcGVyYXRpb24gaXNz
dWUgaW4gZHdtYWMtc29jZnBnYSBkcml2ZXIsCj4gQnV0IEkgYW0gbm90IHN1cmUgd2hpY2ggRml4
aW5nIGNvbW1pdCBJRCBJIHNob3VsZCB1c2UuCj4gQmVjYXVzZSA1ZWM1NTgyMzQzOGUgYnJlYWtz
IHRoZSBvcmlnaW5hbCBjbG9jayBvcGVyYXRpb24gb2YgZHdtYWMtc29jZnBnYSBkcml2ZXIsIGJ1
dCB0aGlzIGNvbW1pdCA1ZWM1NTgyMzQzOGUgaXMgbm90IGEgYnVnLgo+IE1vcmVvdmVyLCBpZiB3
aXRob3V0IDVlYzU1ODIzNDM4ZSBkd21hYy1zb2NmcGdhIGRyaXZlciBhbHNvIHdvcmtzIGZpbmUu
ClllcyBJIHNlZS4gSSBhbHNvIGNoZWNrZWQgdGhlIGNvbW1pdCA1ZWM1NTgyMzQzOGUgYW5kIGl0
IGxvZ2ljYWxseSAKcmVsYXRlcyB0byB5b3VyIGNoYW5nZQo+IAo+IEhvdyBhYm91dCB5b3VyIHN1
Z2dlc3Q/Cj4gCj4gVGhhbmtzLAo+IExpbWVuZwo+IAo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE1l
bmcgTGkgPE1lbmcuTGlAd2luZHJpdmVyLmNvbT4KPj4+IC0tLQo+Pj4gICAgLi4uL2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL2R3bWFjLXNvY2ZwZ2EuYyAgIHwgMjQKPj4gKysrKysrKysrKysrKysr
KystLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjLXNvY2ZwZ2EuYwo+Pj4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1zb2NmcGdhLmMKPj4+IGluZGV4IDg1MjA4MTI4ZjEzNS4uOTNhYmRlNDY3ZGU0
IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdt
YWMtc29jZnBnYS5jCj4+PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9kd21hYy1zb2NmcGdhLmMKPj4+IEBAIC00ODUsOCArNDg1LDI4IEBAIHN0YXRpYyBpbnQgc29j
ZnBnYV9kd21hY19yZXN1bWUoc3RydWN0IGRldmljZQo+PiAqZGV2KQo+Pj4gICAgfQo+Pj4gICAg
I2VuZGlmIC8qIENPTkZJR19QTV9TTEVFUCAqLwo+Pj4KPj4+IC1zdGF0aWMgU0lNUExFX0RFVl9Q
TV9PUFMoc29jZnBnYV9kd21hY19wbV9vcHMsIHN0bW1hY19zdXNwZW5kLAo+Pj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc29jZnBnYV9kd21hY19yZXN1bWUp
Owo+Pj4gK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc29jZnBnYV9kd21hY19ydW50aW1lX3N1
c3BlbmQoc3RydWN0Cj4+IGRldmljZQo+Pj4gKypkZXYpIHsKPj4+ICsgICAgIHN0cnVjdCBuZXRf
ZGV2aWNlICpuZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4+PiArICAgICBzdHJ1Y3Qgc3Rt
bWFjX3ByaXYgKnByaXYgPSBuZXRkZXZfcHJpdihuZGV2KTsKPj4+ICsKPj4+ICsgICAgIHN0bW1h
Y19idXNfY2xrc19jb25maWcocHJpdiwgZmFsc2UpOwo+PiBjaGVjayB0aGUgcmV0dXJuIHZhbHVl
Pwo+Pj4gKwo+Pj4gKyAgICAgcmV0dXJuIDA7Cj4+PiArfQo+Pj4gKwo+Pj4gK3N0YXRpYyBpbnQg
X19tYXliZV91bnVzZWQgc29jZnBnYV9kd21hY19ydW50aW1lX3Jlc3VtZShzdHJ1Y3QKPj4gZGV2
aWNlCj4+PiArKmRldikgewo+Pj4gKyAgICAgc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYgPSBkZXZf
Z2V0X2RydmRhdGEoZGV2KTsKPj4+ICsgICAgIHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiA9IG5l
dGRldl9wcml2KG5kZXYpOwo+Pj4gKwo+Pj4gKyAgICAgcmV0dXJuIHN0bW1hY19idXNfY2xrc19j
b25maWcocHJpdiwgdHJ1ZSk7IH0KPj4+ICsKPj4+ICtjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBz
b2NmcGdhX2R3bWFjX3BtX29wcyA9IHsKPj4+ICsgICAgIFNFVF9TWVNURU1fU0xFRVBfUE1fT1BT
KHN0bW1hY19zdXNwZW5kLAo+PiBzb2NmcGdhX2R3bWFjX3Jlc3VtZSkKPj4+ICsgICAgIFNFVF9S
VU5USU1FX1BNX09QUyhzb2NmcGdhX2R3bWFjX3J1bnRpbWVfc3VzcGVuZCwKPj4+ICtzb2NmcGdh
X2R3bWFjX3J1bnRpbWVfcmVzdW1lLCBOVUxMKSB9Owo+Pj4KPj4+ICAgIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgc29jZnBnYV9kd21hY19vcHMgc29jZnBnYV9nZW41X29wcyA9IHsKPj4+ICAgICAgICAu
c2V0X3BoeV9tb2RlID0gc29jZnBnYV9nZW41X3NldF9waHlfbW9kZSwKPj4+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
