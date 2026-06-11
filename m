Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jnc9BpOkKmr/uAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 14:05:39 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AA3671A4A
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 14:05:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linux.dev header.s=key1 header.b=WXdGfeEV;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linux.dev (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44EF0C46D45;
	Thu, 11 Jun 2026 12:05:38 +0000 (UTC)
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63A28C14540
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 12:05:37 +0000 (UTC)
Message-ID: <0a333eb8-fc29-4b85-993e-6b726f4c7cf0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1781179534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5DWhVGO5QRW1VdI6faudwwsJfHG4kEahgJYviymqApU=;
 b=WXdGfeEVGSAo++golesa9RqlwDWjUI0heMbmJ+0qysjw6M0vMDyoHOMF4BIo7IvkX4TAc/
 st1Pw4GNLqtv7J36ZsIWUbhzXpD6Xr1bl3yfaJx2Itop5AMoYvIiJY7F17AB8z2GFhlVk4
 dNxzkmi6tes/wrxDPVh7NfIty6mQlso=
Date: Thu, 11 Jun 2026 20:04:40 +0800
MIME-Version: 1.0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
 <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
 <ail4AvzqAOXNaU6N@ashevche-desk.local>
 <9b98e860-11df-44bf-9a95-3046d2c274a6@linux.dev>
 <aipbojSeMH-usARY@ashevche-desk.local>
 <83ba73d8-27d3-4ee9-a143-7dfe4cb827be@linux.dev>
 <aippVAj83dCzscTN@ashevche-desk.local>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <aippVAj83dCzscTN@ashevche-desk.local>
X-Migadu-Flow: FLOW_OUT
Cc: Muchun Song <muchun.song@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 drbd-dev@lists.linbit.com, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kaito Cheng <chengkaitao@kylinos.cn>,
 Ingo Molnar <mingo@redhat.com>, Matthew Auld <matthew.auld@intel.com>,
 Waiman Long <longman@redhat.com>, Philipp Reisner <philipp.reisner@linbit.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Paul E . McKenney" <paulmck@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, linux1394-devel@lists.sourceforge.net,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Christian Brauner <brauner@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi@vger.kernel.org,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Huang Rui <ray.huang@amd.com>, Sowjanya Komatineni <skomatineni@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: [Linux-stm32] [PATCH v2 00/14] list: Prepare entry iterators to
 cache cursor state
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linux.dev:s=key1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.dev : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[kaitao.cheng@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:muchun.song@linux.dev,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:ldewangan@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:tursulin@ursulin.net,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:drbd-dev@lists.linbit.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:airlied@gmail.com,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:matthew.auld@intel.com,m:longman@redhat.com,m:philipp.reisner@linbit.com,m:luca.ceresoli@bootlin.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:jani.nikula@linux.intel.com
 ,m:linux-block@vger.kernel.org,m:broonie@kernel.org,m:mripard@kernel.org,m:rodrigo.vivi@intel.com,m:linux-tegra@vger.kernel.org,m:perex@perex.cz,m:linux1394-devel@lists.sourceforge.net,m:lars.ellenberg@linbit.com,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:linux-spi@vger.kernel.org,m:christoph.boehmwalder@linbit.com,m:ray.huang@amd.com,m:skomatineni@nvidia.com,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:christian.koenig@amd.com,m:o-takashi@sakamocchi.jp,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,infradead.org,kernel.org,linux.intel.com,linux.ibm.com,lists.freedesktop.org,vger.kernel.org,redhat.com,nvidia.com,ideasonboard.com,intel.com,ursulin.net,st-md-mailman.stormreply.com,lists.linbit.com,ffwll.ch,stgolabs.net,gmail.com,suse.com,kylinos.cn,linbit.com,bootlin.com,suse.de,kwiboo.se,joshtriplett.org,perex.cz,lists.sourceforge.net,lists.infradead.org,kernel.dk,linaro.org,amd.com,linux-foundation.org,sakamocchi.jp];
	DKIM_TRACE(0.00)[linux.dev:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[61];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kaitao.cheng@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:from_mime,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96AA3671A4A

CgrlnKggMjAyNi82LzExIDE1OjUyLCBBbmR5IFNoZXZjaGVua28g5YaZ6YGTOgo+IE9uIFRodSwg
SnVuIDExLCAyMDI2IGF0IDAzOjM2OjAxUE0gKzA4MDAsIEthaXRhbyBDaGVuZyB3cm90ZToKPj4g
5ZyoIDIwMjYvNi8xMSAxNDo1NCwgQW5keSBTaGV2Y2hlbmtvIOWGmemBkzoKPj4+IE9uIFRodSwg
SnVuIDExLCAyMDI2IGF0IDEyOjQyOjAyUE0gKzA4MDAsIEthaXRhbyBDaGVuZyB3cm90ZToKPj4+
PiDlnKggMjAyNi82LzEwIDIyOjQzLCBBbmR5IFNoZXZjaGVua28g5YaZ6YGTOgo+Pj4+PiBPbiBX
ZWQsIEp1biAxMCwgMjAyNiBhdCAwMjoxNDowNlBNICswODAwLCBLYWl0YW8gQ2hlbmcgd3JvdGU6
Cj4+Pj4+PiDlnKggMjAyNi82LzkgMTg6MzMsIENocmlzdGlhbiBLw7ZuaWcg5YaZ6YGTOgo+Pj4+
Pj4+IE9uIDYvOS8yNiAwODoxMywgS2FpdGFvIENoZW5nIHdyb3RlOgo+Pj4KPj4+Pj4+Pj4gVGhp
cyBzZXJpZXMgcHJlcGFyZXMgZm9yLCBhbmQgdGhlbiB1cGRhdGVzLCB0aGUgbGlzdF9mb3JfZWFj
aF9lbnRyeSgpCj4+Pj4+Pj4+IGZhbWlseSBzbyB0aGUgY29tbW9uIGVudHJ5IGl0ZXJhdG9ycyBj
YWNoZSB0aGVpciBuZXh0IG9yIHByZXZpb3VzIGN1cnNvcgo+Pj4+Pj4+PiBiZWZvcmUgdGhlIGxv
b3AgYm9keSBydW5zLgo+Pj4+Pj4+Cj4+Pj4+Pj4gV2h5IGluIHRoZSB3b3JsZCB3b3VsZCB3ZSB3
YW50IHRvIGRvIHRoYXQ/Cj4+Pj4+Pj4KPj4+Pj4+PiBUaGUgc2FmZSBhbmQgbm9uLXNhZmUgdmFy
aWFudHMgaGF2ZSB2ZXJ5IGRpc3RpbmN0IHVzZSBjYXNlcyBhbmQgdGhhdCBpcyBjb21wbGV0ZWx5
IGludGVudGlvbmFsLgo+Pj4+Pj4+Cj4+Pj4+Pj4gV2hhdCB3ZSBjb3VsZCBpbXByb3ZlIG1heWJl
IGlzIHRoZSBkb2N1bWVudGF0aW9uLCBmcm9tIG15IGV4cGVyaWVuY2UgYW4gYXN0b25pc2hpbmcg
bGFyZ2UgYW1vdW50IG9mIHBlb3BsZSBoYXZlIG1pc2NvbmNlcHRpb25zIGFib3V0IHRoZSBzYWZl
IHZhcmlhbnRzLgo+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoZSBmaXJzdCAxMyBwYXRjaGVzIG9wZW4tY29k
ZSBsb29wcyB0aGF0IGludGVudGlvbmFsbHkgZGVwZW5kIG9uIHRoZQo+Pj4+Pj4+PiBvbGQgImRl
cml2ZSB0aGUgbmV4dCBlbnRyeSBmcm9tIHRoZSBjdXJyZW50IGN1cnNvciBhdCB0aGUgZW5kIG9m
IHRoZQo+Pj4+Pj4+PiBpdGVyYXRpb24iIGJlaGF2aW91ci4gIFRoZXNlIGxvb3BzIGFwcGVuZCB3
b3JrIHRvIHRoZSBsaXN0IGJlaW5nIHdhbGtlZCwKPj4+Pj4+Pj4gcmVzdGFydCB0cmF2ZXJzYWwg
YWZ0ZXIgZHJvcHBpbmcgYSBsb2NrLCBza2lwIGFuIGVudHJ5IGNvbnN1bWVkIGJ5IHRoZQo+Pj4+
Pj4+PiBjdXJyZW50IGl0ZXJhdGlvbiwgb3Igb3RoZXJ3aXNlIGFkanVzdCB0aGUgY3Vyc29yIGlu
IHRoZSBsb29wIGJvZHkuCj4+Pj4+Pj4KPj4+Pj4+PiBXZWxsIEkgaGF2ZSB0byBjbGVhcmx5IHJl
amVjdCB0aGUgY2hhbmdlcyBmb3Igc3Vic3lzdGVtcy9jb21wb25lbnRzIEknbSBtYWludGFpbmlu
ZywgdGhhdCBqdXN0IGxvb2tzIGhvcnJpYmxlIHRvIG1lIGFuZCBJIGNsZWFybHkgZG9uJ3Qgc2Vl
IGEgZ29vZCByZWFzb24gZm9yIHRoYXQuCj4+Pj4+Pgo+Pj4+Pj4gSGkgQ2hyaXN0aWFuIGFuZCBB
bmR5IFNoZXZjaGVua28sCj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzIGZvciB0YWtpbmcgYSBsb29rLiBJ
IHdvdWxkIGxpa2UgdG8gY2xhcmlmeSB0aGUgcG9pbnQgeW91IHJhaXNlZC4KPj4+Pj4+Cj4+Pj4+
PiBUaGUgcmVhc29uIEkgc3RhcnRlZCBsb29raW5nIGF0IHRoaXMgaXMgdGhlIG9yaWdpbmFsIG1v
dGl2YXRpb24gYmVoaW5kCj4+Pj4+PiB0aGUgX3NhZmUoKSB2YXJpYW50cy4gIFRoZXkgZXhpc3Qg
YmVjYXVzZSBzb21lIHVzZXJzIG5lZWQgdG8gcmVtb3ZlLCBtb3ZlCj4+Pj4+PiBvciBvdGhlcndp
c2UgY29uc3VtZSB0aGUgY3VycmVudCBlbnRyeSB3aGlsZSB3YWxraW5nIHRoZSBsaXN0LiAgSW4g
dGhhdAo+Pj4+Pj4gY2FzZSB0aGUgbmV4dCBjdXJzb3IgaGFzIHRvIGJlIHByZXNlcnZlZCBiZWZv
cmUgdGhlIGxvb3AgYm9keSBjYW4gbW9kaWZ5Cj4+Pj4+PiB0aGUgY3VycmVudCBlbnRyeS4KPj4+
Pj4+Cj4+Pj4+PiBUaGUgdW5mb3J0dW5hdGUgcGFydCBpcyB0aGF0IHRoaXMgY291bGQgbm90IGJl
IGV4cHJlc3NlZCB3aXRoIHRoZQo+Pj4+Pj4gZXhpc3RpbmcgbGlzdF9mb3JfZWFjaF9lbnRyeSgp
IGludGVyZmFjZSB3aXRob3V0IGNoYW5naW5nIGl0cyBjYWxsaW5nCj4+Pj4+PiBjb252ZW50aW9u
LiAgVGhlIF9zYWZlKCkgdmFyaWFudHMgaGFkIHRvIGdyb3cgYW4gZXh0cmEgYXJndW1lbnQgZm9y
IHRoZQo+Pj4+Pj4gdGVtcG9yYXJ5IGN1cnNvciwgYW5kIHRoYXQgaXMgd2h5IHdlIGVuZGVkIHVw
IHdpdGggYSBzZXBhcmF0ZSBmYW1pbHkgb2YKPj4+Pj4+IG1hY3Jvcy4KPj4+Pj4+Cj4+Pj4+PiBC
dXQgY29uY2VwdHVhbGx5LCB0aGUgZGlzdGluY3Rpb24gZG9lcyBub3QgaGF2ZSB0byBiZSBleHBv
c2VkIGFzIHR3bwo+Pj4+Pj4gZGlmZmVyZW50IGl0ZXJhdG9yIGZhbWlsaWVzIGZvcmV2ZXIuICBU
aGUgZGlmZmVyZW5jZSBpcyBhbiBpbXBsZW1lbnRhdGlvbgo+Pj4+Pj4gZGV0YWlsOiB3aGV0aGVy
IHRoZSBpdGVyYXRvciBrZWVwcyB0aGUgbmV4dC9wcmV2aW91cyBjdXJzb3IgYmVmb3JlIHRoZQo+
Pj4+Pj4gYm9keSBydW5zLiAgVGhpcyBzZXJpZXMgbWFrZXMgdGhlIGNvbW1vbiBsaXN0X2Zvcl9l
YWNoX2VudHJ5KCkgaXRlcmF0b3JzCj4+Pj4+PiBkbyB0aGF0IGludGVybmFsbHksIHNvIHRoZSBz
YWZlIGFuZCBub24tc2FmZSBmb3JtcyBjYW4gZWZmZWN0aXZlbHkgYmUKPj4+Pj4+IGZvbGRlZCB0
b2dldGhlciwgb3IgYXQgbGVhc3QgdGhlIG5lZWQgZm9yIGEgc2VwYXJhdGUgcHVibGljIF9zYWZl
KCkKPj4+Pj4+IGludGVyZmFjZSBiZWNvbWVzIG11Y2ggd2Vha2VyLgo+Pj4+Pj4KPj4+Pj4+IFRo
ZXJlIGlzIGFsc28gYSB1c2FiaWxpdHkgaXNzdWUgd2l0aCB0aGUgY3VycmVudCBfc2FmZSgpIGlu
dGVyZmFjZS4gIFRoZQo+Pj4+Pj4gY2FsbGVyIGlzIGZvcmNlZCB0byBkZWZpbmUgYSB0ZW1wb3Jh
cnkgY3Vyc29yIG91dHNpZGUgdGhlIG1hY3JvIGFuZCBwYXNzCj4+Pj4+PiBpdCBpbiwgZXZlbiB0
aG91Z2ggYWxtb3N0IGFsbCB1c2VycyBuZXZlciB1c2UgdGhhdCBjdXJzb3IgZGlyZWN0bHkuICBJ
dCBpcwo+Pj4+Pj4ganVzdCBib2lsZXJwbGF0ZSByZXF1aXJlZCBieSB0aGUgbWFjcm8gaW1wbGVt
ZW50YXRpb24uICBJIGZpbmQgdGhhdAo+Pj4+Pj4gcmVkdW5kYW50IGFuZCBhd2t3YXJkOiB0aGUg
dGVtcG9yYXJ5IGN1cnNvciBpcyBhbiBpbnRlcm5hbCBkZXRhaWwgb2YgdGhlCj4+Pj4+PiBpdGVy
YXRpb24sIGJ1dCBldmVyeSBjYWxsZXIgaGFzIHRvIHNwZWxsIGl0IG91dC4KPj4+Pj4KPj4+Pj4g
QWgsIEkgdGhpbmsgdGhlIGRpc3RpbmN0IG1hY3JvIGZhbWlsaWVzIGlzIHRoYXQgd2hhdCB3ZSB3
YW50Lgo+Pj4+PiBCdXQgdGhlIGhpZGluZyBvZiB0aGUgcGFyYW1ldGVyIGNhbiBiZSBkb25lIGlu
c2lkZSBsaXN0X2Zvcl9lYWNoXypfc2FmZSgpLgo+Pj4+PiBZb3UgY2FuIGRvIGEgdHJlZXdpZGUg
Y2hhbmdlIHdpdGggY29jY2luZWxsZS4KPj4+Pj4KPj4+Pj4gU29ycnkgaWYgSSBkaWRuJ3QgZ2V0
IHRoZSB3aG9sZSBpZGVhIGZyb20geW91ciBwcmV2aW91cyBjb250cmlidXRpb25zLgo+Pj4+Pgo+
Pj4+PiBOb3RlLCBldmVuIGNhc2VzIHRoYXQgd291bGQgbmVlZCBhIHRlbXBvcmFyeSBjdXJzb3Ig
bWF5IGJlIHN3aXRjaGVkIHRvCj4+Pj4+IG5ldyBsaXN0X2Zvcl9lYWNoXypfc2FmZSgpLCBzZWUg
aG93IFBDSSBtYWNyb3MgZm9yIGl0ZXJhdGluZyBvdmVyIHJlc291cmNlcwo+Pj4+PiBhcmUgaW1w
bGVtZW50ZWQgKGluY2x1ZGUvbGludXgvcGNpLmgpLgo+Pj4+Cj4+Pj4gVGhhbmtzIGZvciB5b3Vy
IHN1Z2dlc3Rpb25zLiBJJ3ZlIHdyaXR0ZW4gYSBkZW1vIGJhc2VkIG9uIHlvdXIgZmVlZGJhY2su
Cj4+Pj4gQ291bGQgeW91IHBsZWFzZSByZXZpZXcgaXQgYW5kIHNoYXJlIHlvdXIgdGhvdWdodHMg
b24gdGhpcyBhcHByb2FjaD8KPj4+Cj4+PiBIYXZlIHlvdSBjaGVja2VkIGhvdyBtYW55IHVzZXJz
IGFjdHVhbGx5IG5lZWQgdGhlIHRlbXBvcmFyeSBzdG9yYWdlPwo+Pgo+PiBJbiBNdWNodW4ncyBy
ZXBseSwgaGUgbWVudGlvbmVkIHRoZSBmb2xsb3dpbmc6Cj4+Cj4+IFRoZXJlIGFyZSA5LDkyNSBs
aXN0X2Zvcl9lYWNoX2VudHJ5KCkgY2FsbCBzaXRlcyBpbiB0b3RhbC4gQW1vbmcgdGhlbSwKPj4g
OSw5MTkgZG8gbm90IHJlcXVpcmUgYW55IGFkYXB0YXRpb24sIGFuZCBvbmx5IDYgbmVlZCB0byBi
ZSByZWZhY3RvcmVkOgo+Pgo+PiBBcyBmb3IgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKCksIHRo
ZXJlIGFyZSA0LDU3MiBjYWxsZXJzLiA0LDU1MCBvZiB0aGVtCj4+IGNhbiBiZSBkaXJlY3RseSBy
ZXBsYWNlZCBieSB0aGUgbmV3IGxpc3RfZm9yX2VhY2hfZW50cnkoKSwgd2hpbGUgMjIgY2Fubm90
Cj4+IGJlIHJlcGxhY2VkCj4+Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yQjNCRkEx
RS0wOEI4LTQyQUItODdENi1BMjhCRjE1RTVDNThAbGludXguZGV2Lwo+Pgo+PiBJIG9ubHkgdXNl
ZCBDb2NjaW5lbGxlIHRvIHNjYW4gZm9yIGxpc3RfZm9yX2VhY2hfZW50cnkoKSBjYWxsIHNpdGVz
LCBhbmQKPj4gZm91bmQgdGhlIDEzIGNhbGwgc2l0ZXMgc2hvd24gaW4gdGhlIGN1cnJlbnQgcGF0
Y2ggc2VyaWVzLCB3aGljaCBjb3Zlcgo+PiB0aGUgNiBjYXNlcyBtZW50aW9uZWQgaW4gTXVjaHVu
J3MgZW1haWwuIEkgaGF2ZSBub3QgeWV0IHJ1biB0aGUgQ29jY2luZWxsZQo+PiBzY2FuIGZvciBs
aXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoKS4KPj4KPj4gSWYgd2UgbmVlZCB0byBoYW5kbGUgYWxs
IDksOTI1IGxpc3RfZm9yX2VhY2hfZW50cnkoKSBjYWxsIHNpdGVzIG9yIGFsbCA0LDU3Mgo+PiBs
aXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoKSBjYWxsIHNpdGVzIGluIG9uZSBnbywgd291bGQgc3Vj
aCBhIGNoYW5nZSBiZSB0b28KPj4gbGFyZ2U/IEkgZXhwZWN0IGl0IHdvdWxkIGFmZmVjdCBhbG1v
c3QgZXZlcnkga2VybmVsIHN1YnN5c3RlbS4KPiAKPiBJZiBpdCdzIGRvbmUgYnkgTGludXMgaGlt
c2VsZiBkdXJpbmcgdGhlIGRheSB3aGVuIGhlIHByZXBhcmVzIC1yYzEsIGl0J3MgZmluZS4KPiBZ
b3Ugd291bGQgbmVlZCB0byBwcm92aWRlIGEgZ29vZCBqdXN0aWZpY2F0aW9uIGZvciB0aGUgY2hh
bmdlLCB0aG91Z2guCj4gCj4gQnV0IGluIHRoZSBhYm92ZSBzdGF0aXN0aWNzIHRoZSA0NTcyIHZz
IDQ1NTAsIHNvIHRoZSBmaXJzdCBzdGVwIGlzIHRvIGludmVzdGlnYXRlCj4gd2h5IHRlbXBvcmFy
eSBjdXJzb3IgaXMgdXNlZCBpbiB0aG9zZSAyMiBjYXNlcyBhbmQgd2hhdCB3ZSBjYW4gZG8gdG8g
YXZvaWQgdGhhdC4KCkhlcmUgaXMgb25lIGV4YW1wbGU6IGluIHNobWVtX3VudXNlKCkgaW4gbW0v
c2htZW0uYywgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKCkKaXMgdXNlZC4gSW4gdGhpcyBjYXNl
LCB0aGUgY2FsbGVyIHJlbGVhc2VzIHNobWVtX3N3YXBsaXN0X2xvY2sgaW5zaWRlIHRoZSBsb29w
LgpEdXJpbmcgdGhhdCB3aW5kb3csIHRoZSBsaXN0IG1heSBiZSBtb2RpZmllZCwgYW5kIHRoZSBw
cmV2aW91c2x5IHNhdmVkIG5leHQgbWF5CmJlY29tZSBzdGFsZS4gVGhlcmVmb3JlLCBuZXh0IG5l
ZWRzIHRvIGJlIHJlY29tcHV0ZWQgc28gdGhhdCBzdWJzZXF1ZW50IGl0ZXJhdGlvbgppcyBiYXNl
ZCBvbiB0aGUgbGF0ZXN0IGxpc3Qgc3RhdGUuCgpUaGlzIGxlYWRzIHRvIHR3byBwb3NzaWJsZSBh
cHByb2FjaGVzOgoKMS4gQ2hhbmdlIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShwb3MsIG4sIGhl
YWQsIG1lbWJlcikgZGlyZWN0bHkgdG8KbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHBvcywgaGVh
ZCwgbWVtYmVyKS4gSWYgd2UgZG8gdGhpcywgdGhlIGNhc2UKYWJvdmUgd291bGQgbmVlZCB0byBi
ZSBjb252ZXJ0ZWQgdG8gYW4gb3Blbi1jb2RlZCBmb3JtLgoKMi4gU3VwcG9ydCBib3RoIGZvcm1z
LCBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUocG9zLCBuLCBoZWFkLCBtZW1iZXIpCmFuZCBsaXN0
X2Zvcl9lYWNoX2VudHJ5X3NhZmUocG9zLCBoZWFkLCBtZW1iZXIpLCBhcyBkZXNjcmliZWQgaW4g
dGhlCmxpbmsgYmVsb3cuCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC85Yjk4ZTg2MC0xMWRm
LTQ0YmYtOWE5NS0zMDQ2ZDJjMjc0YTZAbGludXguZGV2LwoKRG8geW91IGhhdmUgYW55IG90aGVy
IHRob3VnaHRzIG9uIHRoaXM/Cgo+PiBJIHdvbmRlciB3aGV0aGVyIGl0IHdvdWxkIGJlIGJldHRl
ciB0byBmaXJzdCBwcm92aWRlIHRoZSBuZWNlc3NhcnkKPj4gY29tcGF0aWJpbGl0eSBBUElzLCBh
bmQgdGhlbiBsZXQgZWFjaCBzdWJzeXN0ZW0gb3duZXIgdXBkYXRlIHRoZWlyIGNvZGUgYXMKPj4g
YXBwcm9wcmlhdGUuIFRoYXQgd291bGQgbWFrZSB0aGUgaW1wYWN0IG1vcmUgY29udHJvbGxlZCwg
c2ltaWxhciB0byBob3cKPj4gdGhlIGN1cnJlbnQgZm9saW8gcmVwbGFjZW1lbnQgb2YgcGFnZSBp
cyBiZWluZyBoYW5kbGVkLgotLSAKVGhhbmtzCkthaXRhbyBDaGVuZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
