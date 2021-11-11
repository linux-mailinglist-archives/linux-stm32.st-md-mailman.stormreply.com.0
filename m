Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EA34504D4
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Nov 2021 14:00:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9349C5F1C7;
	Mon, 15 Nov 2021 13:00:08 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CFADC5EC70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 14:01:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4604B1F770;
 Thu, 11 Nov 2021 14:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636639312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PombuJM8RL7E0FROtDAMwpbx4fuaWwnUJtU+DAOHsBE=;
 b=U6fSnwbccRPFM/tkgrtG5NtE145dLcqfzKxXpojjkLtJ6F8Yg17Q0dyg2XvOZ+l+6ugNF5
 LeqRB8Zd6+HBWPAOmfOPUDg2WV9Ri4UrD5SgtMqCUUOFAjgMqZ1SsrxlssGx8+P0CJNgCI
 KAB6J7fWtwkU4BX+iS24NEFyZuePRoI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636639312;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PombuJM8RL7E0FROtDAMwpbx4fuaWwnUJtU+DAOHsBE=;
 b=EI9uGlbylpouuTv2UtYsUCSvWQFcF09ngVtmbTNVqNRhu56rqBktWNu1MUDIjldUo6Iuxa
 yhG+wwrw/Air4qCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6C40813DBA;
 Thu, 11 Nov 2021 14:01:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id o1HqFU8ijWFkQQAAMHmgww
 (envelope-from <dkirjanov@suse.de>); Thu, 11 Nov 2021 14:01:51 +0000
To: Meng Li <Meng.Li@windriver.com>, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 kuba@kernel.org, mcoquelin.stm32@gmail.com
References: <20211111135630.24996-1-Meng.Li@windriver.com>
From: Denis Kirjanov <dkirjanov@suse.de>
Message-ID: <499952a2-c919-109d-4f0a-fb4db4ead604@suse.de>
Date: Thu, 11 Nov 2021 17:01:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211111135630.24996-1-Meng.Li@windriver.com>
Content-Language: ru
X-Mailman-Approved-At: Mon, 15 Nov 2021 13:00:05 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

CgoxMS8xMS8yMSA0OjU2IFBNLCBNZW5nIExpINC/0LjRiNC10YI6Cj4gRnJvbTogTWVuZyBMaSA8
bWVuZy5saUB3aW5kcml2ZXIuY29tPgo+IAo+IEFjY29yZGluZyB0byB1cHN0cmVhbSBjb21taXQg
NWVjNTU4MjM0MzhlKCJuZXQ6IHN0bW1hYzoKPiBhZGQgY2xvY2tzIG1hbmFnZW1lbnQgZm9yIGdt
YWMgZHJpdmVyICIpLCBpdCBpbXByb3ZlIGNsb2Nrcwo+IG1hbmFnZW1lbnQgZm9yIHN0bW1hYyBk
cml2ZXIuIFNvLCBpdCBpcyBuZWNlc3NhcnkgdG8gaW1wbGVtZW50Cj4gdGhlIHJ1bnRpbWUgY2Fs
bGJhY2sgaW4gZHdtYWMtc29jZnBnYSBkcml2ZXIgYmVjYXVzZSBpdCBkb2VzbuKAmXQKPiB1c2Ug
dGhlIGNvbW1vbiBzdG1tYWNfcGx0ZnJfcG1fb3BzIGluc3RhbmNlLiBPdGhlcndpc2UsIGNsb2Nr
cwo+IGFyZSBub3QgZGlzYWJsZWQgd2hlbiBzeXN0ZW0gZW50ZXJzIHN1c3BlbmQgc3RhdHVzLgoK
UGxlYXNlIGFkZCBGaXhlcyB0YWcKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNZW5nIExpIDxNZW5nLkxp
QHdpbmRyaXZlci5jb20+Cj4gLS0tCj4gICAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdt
YWMtc29jZnBnYS5jICAgfCAyNCArKysrKysrKysrKysrKysrKy0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jCj4gaW5kZXggODUy
MDgxMjhmMTM1Li45M2FiZGU0NjdkZTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jCj4gQEAgLTQ4NSw4ICs0ODUsMjgg
QEAgc3RhdGljIGludCBzb2NmcGdhX2R3bWFjX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4g
ICB9Cj4gICAjZW5kaWYgLyogQ09ORklHX1BNX1NMRUVQICovCj4gICAKPiAtc3RhdGljIFNJTVBM
RV9ERVZfUE1fT1BTKHNvY2ZwZ2FfZHdtYWNfcG1fb3BzLCBzdG1tYWNfc3VzcGVuZCwKPiAtCQkJ
CQkgICAgICAgc29jZnBnYV9kd21hY19yZXN1bWUpOwo+ICtzdGF0aWMgaW50IF9fbWF5YmVfdW51
c2VkIHNvY2ZwZ2FfZHdtYWNfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAr
ewo+ICsJc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiAr
CXN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiA9IG5ldGRldl9wcml2KG5kZXYpOwo+ICsKPiArCXN0
bW1hY19idXNfY2xrc19jb25maWcocHJpdiwgZmFsc2UpOwpjaGVjayB0aGUgcmV0dXJuIHZhbHVl
Pwo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IF9fbWF5YmVfdW51c2Vk
IHNvY2ZwZ2FfZHdtYWNfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+ICt7Cj4g
KwlzdHJ1Y3QgbmV0X2RldmljZSAqbmRldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ICsJc3Ry
dWN0IHN0bW1hY19wcml2ICpwcml2ID0gbmV0ZGV2X3ByaXYobmRldik7Cj4gKwo+ICsJcmV0dXJu
IHN0bW1hY19idXNfY2xrc19jb25maWcocHJpdiwgdHJ1ZSk7Cj4gK30KPiArCj4gK2NvbnN0IHN0
cnVjdCBkZXZfcG1fb3BzIHNvY2ZwZ2FfZHdtYWNfcG1fb3BzID0gewo+ICsJU0VUX1NZU1RFTV9T
TEVFUF9QTV9PUFMoc3RtbWFjX3N1c3BlbmQsIHNvY2ZwZ2FfZHdtYWNfcmVzdW1lKQo+ICsJU0VU
X1JVTlRJTUVfUE1fT1BTKHNvY2ZwZ2FfZHdtYWNfcnVudGltZV9zdXNwZW5kLCBzb2NmcGdhX2R3
bWFjX3J1bnRpbWVfcmVzdW1lLCBOVUxMKQo+ICt9Owo+ICAgCj4gICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHNvY2ZwZ2FfZHdtYWNfb3BzIHNvY2ZwZ2FfZ2VuNV9vcHMgPSB7Cj4gICAJLnNldF9waHlf
bW9kZSA9IHNvY2ZwZ2FfZ2VuNV9zZXRfcGh5X21vZGUsCj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
