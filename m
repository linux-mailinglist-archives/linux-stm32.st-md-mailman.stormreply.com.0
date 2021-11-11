Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D41FC4504D1
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Nov 2021 14:00:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C340C5F1C1;
	Mon, 15 Nov 2021 13:00:08 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87726CFAC4B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 11:35:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 26B8321B37;
 Thu, 11 Nov 2021 11:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636630556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rt8/aMa5Kry7fqouFBixTE9VuPZ3pHAbttQhw0tgJc4=;
 b=tYGz6h/KDA+Q/zJgrUumoUPd7y2S0wD7gXgB8Dlj2FqGCJJxZhq5/5HA1qzKR7H6wbDnas
 1WCfDAhM+uo3mxBihzZHjHCIn0mY+ApqAVvLGq/7ANy1SJx87ErxkEwzCC0UE0A7FAF71I
 /ey+7UqTTJv4VygIHujfmclXPSyl+7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636630556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rt8/aMa5Kry7fqouFBixTE9VuPZ3pHAbttQhw0tgJc4=;
 b=qLh9JQx9hbbITghv5K0PLtUppefmmFDFNejE4ijyqP/vBAR62yFPrbtNmpT2aWpj8BQEwl
 Sd8oGasviazh+cDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C969313358;
 Thu, 11 Nov 2021 11:35:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lD43LBoAjWFMUAAAMHmgww
 (envelope-from <dkirjanov@suse.de>); Thu, 11 Nov 2021 11:35:54 +0000
To: Biao Huang <biao.huang@mediatek.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20211111071214.21027-1-biao.huang@mediatek.com>
From: Denis Kirjanov <dkirjanov@suse.de>
Message-ID: <c2d3c746-ab32-eb99-0408-1409f43248cd@suse.de>
Date: Thu, 11 Nov 2021 14:35:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211111071214.21027-1-biao.huang@mediatek.com>
Content-Language: ru
X-Mailman-Approved-At: Mon, 15 Nov 2021 13:00:05 +0000
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/5] MediaTek Ethernet Patches on MT8195
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

CgoxMS8xMS8yMSAxMDoxMiBBTSwgQmlhbyBIdWFuZyDQv9C40YjQtdGCOgo+IENoYW5nZXMgaW4g
djI6Cj4gMS4gZml4IGVycm9ycy93YXJuaW5ncyBpbiBtZWRpYXRlay1kd21hYy55YW1sIHdpdGgg
dXBncmFkZWQgZHRzY2hlbWEgdG9vbHMKPiAKPiBUaGlzIHNlcmllcyBpbmNsdWRlIDUgcGF0Y2hl
czoKPiAxLiBhZGQgcGxhdGZvcm0gbGV2ZWwgY2xvY2tzIG1hbmFnZW1lbnQgZm9yIGR3bWFjLW1l
ZGlhdGVrCj4gMi4gcmVzdWUgbW9yZSBjb21tb24gZmVhdHVyZXMgZGVmaW5lZCBpbiBzdG1tYWNf
cGxhdGZvcm0uYwo+IDMuIGFkZCBldGhlcm5ldCBlbnRyeSBmb3IgbXQ4MTk1Cj4gNC4gY29udmVy
dCBtZWRpYXRlay1kd21hYy50eHQgdG8gbWVkaWF0ZWstZHdtYWMueWFtbAo+IDUuIGFkZCBldGhl
cm5ldCBkZXZpY2Ugbm9kZSBmb3IgbXQ4MTk1CmFsbCBuZXcgZmVhdHVyZSBzaG91bGQgYmUgc2Vu
dCBwcmVmaXhlZCB3aXRoIG5ldC1uZXh0Cj4gCj4gQmlhbyBIdWFuZyAoNSk6Cj4gICAgbmV0OiBz
dG1tYWM6IGR3bWFjLW1lZGlhdGVrOiBhZGQgcGxhdGZvcm0gbGV2ZWwgY2xvY2tzIG1hbmFnZW1l
bnQKPiAgICBuZXQ6IHN0bW1hYzogZHdtYWMtbWVkaWF0ZWs6IFJldXNlIG1vcmUgY29tbW9uIGZl
YXR1cmVzCj4gICAgbmV0OiBzdG1tYWM6IGR3bWFjLW1lZGlhdGVrOiBhZGQgc3VwcG9ydCBmb3Ig
bXQ4MTk1Cj4gICAgZHQtYmluZGluZ3M6IG5ldDogZHdtYWM6IENvbnZlcnQgbWVkaWF0ZWstZHdt
YWMgdG8gRFQgc2NoZW1hCj4gICAgYXJtNjQ6IGR0czogbXQ4MTk1OiBhZGQgZXRoZXJuZXQgZGV2
aWNlIG5vZGUKPiAKPiAgIC4uLi9iaW5kaW5ncy9uZXQvbWVkaWF0ZWstZHdtYWMudHh0ICAgICAg
ICAgICB8ICA5MSAtLS0tLQo+ICAgLi4uL2JpbmRpbmdzL25ldC9tZWRpYXRlay1kd21hYy55YW1s
ICAgICAgICAgIHwgMjExICsrKysrKysrKysrKwo+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDgxOTUtZXZiLmR0cyAgIHwgIDkyICsrKysrCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210ODE5NS5kdHNpICAgICAgfCAgNzAgKysrKwo+ICAgLi4uL2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMgIHwgMzEzICsrKysrKysrKysrKysrKystLQo+
ICAgNSBmaWxlcyBjaGFuZ2VkLCA2NjQgaW5zZXJ0aW9ucygrKSwgMTEzIGRlbGV0aW9ucygtKQo+
ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9u
ZXQvbWVkaWF0ZWstZHdtYWMudHh0Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9tZWRpYXRlay1kd21hYy55YW1sCj4gCj4gLS0KPiAy
LjE4LjAKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
