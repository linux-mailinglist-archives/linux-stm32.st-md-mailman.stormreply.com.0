Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /CEKIiEeKWrUQwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 10:19:45 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DF2667120
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 10:19:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linux.dev header.s=key1 header.b=b+KKxMDO;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linux.dev (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 569DAC57A51;
	Wed, 10 Jun 2026 08:19:44 +0000 (UTC)
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1AEAC56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 08:19:42 +0000 (UTC)
Message-ID: <2399841f-d834-4652-8285-4a15c7d9a9b9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1781079581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vgeT73qC1JMBtqJB2TUIr+4bit/wHx6kJFn5Pav/2f4=;
 b=b+KKxMDOPPD9issjhumw6+KGbYM7wMtezvy5jEnscI0CZYz2NKMOHn33g1ku+yIj4Y2DTn
 +Yag6Z6BDFL2Y2GchMx0dVC5s3t6GNYZv4TV2TeNkysaubM7HMus5UBFldLUBxBN8KRyYZ
 t05b5xvQnStTsnzUuvWsLluFbGiay9I=
Date: Wed, 10 Jun 2026 16:18:28 +0800
MIME-Version: 1.0
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
 <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
 <6b2efdee-95b0-4306-a682-0d0466497ddb@amd.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <6b2efdee-95b0-4306-a682-0d0466497ddb@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:andriy.shevchenko@linux.intel.com,m:muchun.song@linux.dev,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:ldewangan@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:tursulin@ursulin.net,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:drbd-dev@lists.linbit.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:airlied@gmail.com,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:matthew.auld@intel.com,m:longman@redhat.com,m:philipp.reisner@linbit.com,m:luca.ceresoli@bootlin.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:
 jani.nikula@linux.intel.com,m:linux-block@vger.kernel.org,m:broonie@kernel.org,m:mripard@kernel.org,m:rodrigo.vivi@intel.com,m:linux-tegra@vger.kernel.org,m:perex@perex.cz,m:linux1394-devel@lists.sourceforge.net,m:lars.ellenberg@linbit.com,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:linux-spi@vger.kernel.org,m:christoph.boehmwalder@linbit.com,m:ray.huang@amd.com,m:skomatineni@nvidia.com,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:o-takashi@sakamocchi.jp,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo,kylinos.cn:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96DF2667120

CgrlnKggMjAyNi82LzEwIDE2OjA3LCBDaHJpc3RpYW4gS8O2bmlnIOWGmemBkzoKPiBPbiA2LzEw
LzI2IDA4OjE0LCBLYWl0YW8gQ2hlbmcgd3JvdGU6Cj4+IOWcqCAyMDI2LzYvOSAxODozMywgQ2hy
aXN0aWFuIEvDtm5pZyDlhpnpgZM6Cj4+PiBPbiA2LzkvMjYgMDg6MTMsIEthaXRhbyBDaGVuZyB3
cm90ZToKPj4+PiBGcm9tOiBLYWl0byBDaGVuZyA8Y2hlbmdrYWl0YW9Aa3lsaW5vcy5jbj4KPj4+
Pgo+Pj4+IFRoaXMgc2VyaWVzIHByZXBhcmVzIGZvciwgYW5kIHRoZW4gdXBkYXRlcywgdGhlIGxp
c3RfZm9yX2VhY2hfZW50cnkoKQo+Pj4+IGZhbWlseSBzbyB0aGUgY29tbW9uIGVudHJ5IGl0ZXJh
dG9ycyBjYWNoZSB0aGVpciBuZXh0IG9yIHByZXZpb3VzIGN1cnNvcgo+Pj4+IGJlZm9yZSB0aGUg
bG9vcCBib2R5IHJ1bnMuCj4+Pgo+Pj4gV2h5IGluIHRoZSB3b3JsZCB3b3VsZCB3ZSB3YW50IHRv
IGRvIHRoYXQ/Cj4+Pgo+Pj4gVGhlIHNhZmUgYW5kIG5vbi1zYWZlIHZhcmlhbnRzIGhhdmUgdmVy
eSBkaXN0aW5jdCB1c2UgY2FzZXMgYW5kIHRoYXQgaXMgY29tcGxldGVseSBpbnRlbnRpb25hbC4K
Pj4+Cj4+PiBXaGF0IHdlIGNvdWxkIGltcHJvdmUgbWF5YmUgaXMgdGhlIGRvY3VtZW50YXRpb24s
IGZyb20gbXkgZXhwZXJpZW5jZSBhbiBhc3RvbmlzaGluZyBsYXJnZSBhbW91bnQgb2YgcGVvcGxl
IGhhdmUgbWlzY29uY2VwdGlvbnMgYWJvdXQgdGhlIHNhZmUgdmFyaWFudHMuCj4+Pgo+Pj4+IFRo
ZSBmaXJzdCAxMyBwYXRjaGVzIG9wZW4tY29kZSBsb29wcyB0aGF0IGludGVudGlvbmFsbHkgZGVw
ZW5kIG9uIHRoZQo+Pj4+IG9sZCAiZGVyaXZlIHRoZSBuZXh0IGVudHJ5IGZyb20gdGhlIGN1cnJl
bnQgY3Vyc29yIGF0IHRoZSBlbmQgb2YgdGhlCj4+Pj4gaXRlcmF0aW9uIiBiZWhhdmlvdXIuICBU
aGVzZSBsb29wcyBhcHBlbmQgd29yayB0byB0aGUgbGlzdCBiZWluZyB3YWxrZWQsCj4+Pj4gcmVz
dGFydCB0cmF2ZXJzYWwgYWZ0ZXIgZHJvcHBpbmcgYSBsb2NrLCBza2lwIGFuIGVudHJ5IGNvbnN1
bWVkIGJ5IHRoZQo+Pj4+IGN1cnJlbnQgaXRlcmF0aW9uLCBvciBvdGhlcndpc2UgYWRqdXN0IHRo
ZSBjdXJzb3IgaW4gdGhlIGxvb3AgYm9keS4KPj4+Cj4+PiBXZWxsIEkgaGF2ZSB0byBjbGVhcmx5
IHJlamVjdCB0aGUgY2hhbmdlcyBmb3Igc3Vic3lzdGVtcy9jb21wb25lbnRzIEknbSBtYWludGFp
bmluZywgdGhhdCBqdXN0IGxvb2tzIGhvcnJpYmxlIHRvIG1lIGFuZCBJIGNsZWFybHkgZG9uJ3Qg
c2VlIGEgZ29vZCByZWFzb24gZm9yIHRoYXQuCj4+Cj4+IEhpIENocmlzdGlhbiBhbmQgQW5keSBT
aGV2Y2hlbmtvLAo+Pgo+PiBUaGFua3MgZm9yIHRha2luZyBhIGxvb2suIEkgd291bGQgbGlrZSB0
byBjbGFyaWZ5IHRoZSBwb2ludCB5b3UgcmFpc2VkLgo+Pgo+PiBUaGUgcmVhc29uIEkgc3RhcnRl
ZCBsb29raW5nIGF0IHRoaXMgaXMgdGhlIG9yaWdpbmFsIG1vdGl2YXRpb24gYmVoaW5kCj4+IHRo
ZSBfc2FmZSgpIHZhcmlhbnRzLiAgVGhleSBleGlzdCBiZWNhdXNlIHNvbWUgdXNlcnMgbmVlZCB0
byByZW1vdmUsIG1vdmUKPj4gb3Igb3RoZXJ3aXNlIGNvbnN1bWUgdGhlIGN1cnJlbnQgZW50cnkg
d2hpbGUgd2Fsa2luZyB0aGUgbGlzdC4gIEluIHRoYXQKPj4gY2FzZSB0aGUgbmV4dCBjdXJzb3Ig
aGFzIHRvIGJlIHByZXNlcnZlZCBiZWZvcmUgdGhlIGxvb3AgYm9keSBjYW4gbW9kaWZ5Cj4+IHRo
ZSBjdXJyZW50IGVudHJ5Lgo+Pgo+PiBUaGUgdW5mb3J0dW5hdGUgcGFydCBpcyB0aGF0IHRoaXMg
Y291bGQgbm90IGJlIGV4cHJlc3NlZCB3aXRoIHRoZQo+PiBleGlzdGluZyBsaXN0X2Zvcl9lYWNo
X2VudHJ5KCkgaW50ZXJmYWNlIHdpdGhvdXQgY2hhbmdpbmcgaXRzIGNhbGxpbmcKPj4gY29udmVu
dGlvbi4gIFRoZSBfc2FmZSgpIHZhcmlhbnRzIGhhZCB0byBncm93IGFuIGV4dHJhIGFyZ3VtZW50
IGZvciB0aGUKPj4gdGVtcG9yYXJ5IGN1cnNvciwgYW5kIHRoYXQgaXMgd2h5IHdlIGVuZGVkIHVw
IHdpdGggYSBzZXBhcmF0ZSBmYW1pbHkgb2YKPj4gbWFjcm9zLgo+Pgo+PiBCdXQgY29uY2VwdHVh
bGx5LCB0aGUgZGlzdGluY3Rpb24gZG9lcyBub3QgaGF2ZSB0byBiZSBleHBvc2VkIGFzIHR3bwo+
PiBkaWZmZXJlbnQgaXRlcmF0b3IgZmFtaWxpZXMgZm9yZXZlci4gIFRoZSBkaWZmZXJlbmNlIGlz
IGFuIGltcGxlbWVudGF0aW9uCj4+IGRldGFpbDogd2hldGhlciB0aGUgaXRlcmF0b3Iga2VlcHMg
dGhlIG5leHQvcHJldmlvdXMgY3Vyc29yIGJlZm9yZSB0aGUKPj4gYm9keSBydW5zLiAgVGhpcyBz
ZXJpZXMgbWFrZXMgdGhlIGNvbW1vbiBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkgaXRlcmF0b3JzCj4+
IGRvIHRoYXQgaW50ZXJuYWxseSwgc28gdGhlIHNhZmUgYW5kIG5vbi1zYWZlIGZvcm1zIGNhbiBl
ZmZlY3RpdmVseSBiZQo+PiBmb2xkZWQgdG9nZXRoZXIsIG9yIGF0IGxlYXN0IHRoZSBuZWVkIGZv
ciBhIHNlcGFyYXRlIHB1YmxpYyBfc2FmZSgpCj4+IGludGVyZmFjZSBiZWNvbWVzIG11Y2ggd2Vh
a2VyLgo+Pgo+PiBUaGVyZSBpcyBhbHNvIGEgdXNhYmlsaXR5IGlzc3VlIHdpdGggdGhlIGN1cnJl
bnQgX3NhZmUoKSBpbnRlcmZhY2UuICBUaGUKPj4gY2FsbGVyIGlzIGZvcmNlZCB0byBkZWZpbmUg
YSB0ZW1wb3JhcnkgY3Vyc29yIG91dHNpZGUgdGhlIG1hY3JvIGFuZCBwYXNzCj4+IGl0IGluLCBl
dmVuIHRob3VnaCBhbG1vc3QgYWxsIHVzZXJzIG5ldmVyIHVzZSB0aGF0IGN1cnNvciBkaXJlY3Rs
eS4gIEl0IGlzCj4+IGp1c3QgYm9pbGVycGxhdGUgcmVxdWlyZWQgYnkgdGhlIG1hY3JvIGltcGxl
bWVudGF0aW9uLiAgSSBmaW5kIHRoYXQKPj4gcmVkdW5kYW50IGFuZCBhd2t3YXJkOiB0aGUgdGVt
cG9yYXJ5IGN1cnNvciBpcyBhbiBpbnRlcm5hbCBkZXRhaWwgb2YgdGhlCj4+IGl0ZXJhdGlvbiwg
YnV0IGV2ZXJ5IGNhbGxlciBoYXMgdG8gc3BlbGwgaXQgb3V0Lgo+Pgo+PiBXaXRoIHRoZSB1cGRh
dGVkIGxpc3RfZm9yX2VhY2hfZW50cnkoKSBpbXBsZW1lbnRhdGlvbiwgdGhhdCBleHRyYSBjdXJz
b3IKPj4gY2FuIGJlIGtlcHQgaW5zaWRlIHRoZSBpdGVyYXRvciBpdHNlbGYuICBDYWxsZXJzIHRo
YXQgb25seSB3YW50IHRvIHdhbGsKPj4gdGhlIGxpc3QsIGluY2x1ZGluZyBjYWxsZXJzIHRoYXQg
ZGVsZXRlIG9yIGNvbnN1bWUgdGhlIGN1cnJlbnQgZW50cnksIG5vCj4+IGxvbmdlciBuZWVkIHRv
IGNhcnJ5IGFuIG90aGVyd2lzZS11bnVzZWQgdGVtcG9yYXJ5IHZhcmlhYmxlIGp1c3QgdG8gbWFr
ZQo+PiB0aGUgbWFjcm8gd29yay4KPiAKPiBXZWxsIHRoZSBkaXN0aW5jdGlvbiBiZXR3ZWVuIGxp
c3RfZm9yX2VhY2hfZW50cnkoKSBhbmQgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKCkgaXMgKm5v
dCogdGhlcmUgYmVjYXVzZSB5b3UgbmVlZCBhbiBleHRyYSB2YXJpYWJsZSB0byBob2xkIHRoZSBu
ZXh0IHBvaW50ZXIsIGJ1dCBiZWNhdXNlIGp1c3QgJ2l0ZXJhdGluZyB0aGUgbGlzdCcgYW5kICdp
dGVyYXRpbmcgdGhlIGxpc3Qgd2hpbGUgeW91IG1vZGlmeSBpdCcgYXJlIHR3byBkaXN0aW5jdCB1
c2UgY2FzZXMuCj4gCj4gQXBhcnQgZnJvbSB0aGUgdGVjaG5pY2FsIGltcGxpY2F0aW9ucyB0aGlz
IGFsc28gaGFzIHNvbWUgZG9jdW1lbnRhdGlvbiB2YWx1ZSBmb3IgdGhlIGNvZGUgdXNpbmcgaXQu
Cj4gCj4gV2hhdCB3ZSBjb3VsZCBjb25zaWRlciB3aXRoIEM5OSBhdCBoYW5kIGlzIHRvIGhhdmUg
X3NhZmUoKSB2YXJpYW50cyB3aG8gdXNlcyBhIGxvY2FsIGhpZGRlbiB2YXJpYWJsZSB0byBob2xk
IHRoZSBuZXh0IGVsZW1lbnQuCj4gCj4gT3IgbWF5YmUgY29tZSB1cCB3aXRoIGEgYmV0dGVyIG5h
bWUgaW5zdGVhZCBvZiBfc2FmZSgpIGJlY2F1c2UgcGVvcGxlIHNlZW0gdG8gbWlzdW5kZXJzdGFu
ZCB0aGF0IHF1aXRlIG9mdGVuLgo+IAo+IEJ1dCBtYW5nbGluZyB0aGUgdHdvIHVzZSBjYXNlcyB0
b2dldGhlciBqdXN0IGJlY2F1c2UgaXQgaXMgbm93IHRlY2huaWNhbCBwb3NzaWJsZSBpcyBhbW9u
ZyB0aGUgd29yc3QgaWRlYXMgSSd2ZSBldmVyIGhlYXJkLgo+IAoKU2hvdWxkIHdlIHJldmVydCB0
byB2MSwgb3Iga2VlcCBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkgYW5kCmxpc3RfZm9yX2VhY2hfZW50
cnlfc2FmZSgpIGFzIHRoZXkgYXJlLCBjbG9zZSB0aGlzIHRocmVhZCwgYW5kIG1ha2Ugbm8KY2hh
bmdlcz8KCkxpbmsgdG8gdjE6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDUyOTA4
MjE0OS43Njc2NC0xLWthaXRhby5jaGVuZ0BsaW51eC5kZXYvCgpPciBkbyB5b3UgaGF2ZSBhbnkg
YmV0dGVyIHN1Z2dlc3Rpb25zPwoKLS0gClRoYW5rcwpLYWl0YW8gQ2hlbmcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
