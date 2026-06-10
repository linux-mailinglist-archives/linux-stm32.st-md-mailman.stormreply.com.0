Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aEHAM+4AKWrMOgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 08:15:10 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B3D6661FE
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 08:15:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linux.dev header.s=key1 header.b="S/EuK96p";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linux.dev (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37426C8F294;
	Wed, 10 Jun 2026 06:15:08 +0000 (UTC)
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com
 [95.215.58.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0872BC56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 06:15:05 +0000 (UTC)
Message-ID: <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1781072103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GCPO9v7e2NaYcPW5zVGvXXPxzu/fCfdM58tRqJXSo9A=;
 b=S/EuK96pTXAWUBg+8TCiJYM+danZr1codL6zDdrR1CXWZbSAz8OZt88gSb3T73P2+Oj0bR
 ye5UJbetTGxWmds/F2K/tlbDAkWts/YSgQ0PrY0mv2jpzcQt2r4zQh26U4ohdHNt5eRxKb
 jqr9Nyh610YgX0sau/FOqrE+b1XuGGI=
Date: Wed, 10 Jun 2026 14:14:06 +0800
MIME-Version: 1.0
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86B3D6661FE

5ZyoIDIwMjYvNi85IDE4OjMzLCBDaHJpc3RpYW4gS8O2bmlnIOWGmemBkzoKPiBPbiA2LzkvMjYg
MDg6MTMsIEthaXRhbyBDaGVuZyB3cm90ZToKPj4gRnJvbTogS2FpdG8gQ2hlbmcgPGNoZW5na2Fp
dGFvQGt5bGlub3MuY24+Cj4+Cj4+IFRoaXMgc2VyaWVzIHByZXBhcmVzIGZvciwgYW5kIHRoZW4g
dXBkYXRlcywgdGhlIGxpc3RfZm9yX2VhY2hfZW50cnkoKQo+PiBmYW1pbHkgc28gdGhlIGNvbW1v
biBlbnRyeSBpdGVyYXRvcnMgY2FjaGUgdGhlaXIgbmV4dCBvciBwcmV2aW91cyBjdXJzb3IKPj4g
YmVmb3JlIHRoZSBsb29wIGJvZHkgcnVucy4KPiAKPiBXaHkgaW4gdGhlIHdvcmxkIHdvdWxkIHdl
IHdhbnQgdG8gZG8gdGhhdD8KPiAKPiBUaGUgc2FmZSBhbmQgbm9uLXNhZmUgdmFyaWFudHMgaGF2
ZSB2ZXJ5IGRpc3RpbmN0IHVzZSBjYXNlcyBhbmQgdGhhdCBpcyBjb21wbGV0ZWx5IGludGVudGlv
bmFsLgo+IAo+IFdoYXQgd2UgY291bGQgaW1wcm92ZSBtYXliZSBpcyB0aGUgZG9jdW1lbnRhdGlv
biwgZnJvbSBteSBleHBlcmllbmNlIGFuIGFzdG9uaXNoaW5nIGxhcmdlIGFtb3VudCBvZiBwZW9w
bGUgaGF2ZSBtaXNjb25jZXB0aW9ucyBhYm91dCB0aGUgc2FmZSB2YXJpYW50cy4KPiAKPj4gVGhl
IGZpcnN0IDEzIHBhdGNoZXMgb3Blbi1jb2RlIGxvb3BzIHRoYXQgaW50ZW50aW9uYWxseSBkZXBl
bmQgb24gdGhlCj4+IG9sZCAiZGVyaXZlIHRoZSBuZXh0IGVudHJ5IGZyb20gdGhlIGN1cnJlbnQg
Y3Vyc29yIGF0IHRoZSBlbmQgb2YgdGhlCj4+IGl0ZXJhdGlvbiIgYmVoYXZpb3VyLiAgVGhlc2Ug
bG9vcHMgYXBwZW5kIHdvcmsgdG8gdGhlIGxpc3QgYmVpbmcgd2Fsa2VkLAo+PiByZXN0YXJ0IHRy
YXZlcnNhbCBhZnRlciBkcm9wcGluZyBhIGxvY2ssIHNraXAgYW4gZW50cnkgY29uc3VtZWQgYnkg
dGhlCj4+IGN1cnJlbnQgaXRlcmF0aW9uLCBvciBvdGhlcndpc2UgYWRqdXN0IHRoZSBjdXJzb3Ig
aW4gdGhlIGxvb3AgYm9keS4KPiAKPiBXZWxsIEkgaGF2ZSB0byBjbGVhcmx5IHJlamVjdCB0aGUg
Y2hhbmdlcyBmb3Igc3Vic3lzdGVtcy9jb21wb25lbnRzIEknbSBtYWludGFpbmluZywgdGhhdCBq
dXN0IGxvb2tzIGhvcnJpYmxlIHRvIG1lIGFuZCBJIGNsZWFybHkgZG9uJ3Qgc2VlIGEgZ29vZCBy
ZWFzb24gZm9yIHRoYXQuCgpIaSBDaHJpc3RpYW4gYW5kIEFuZHkgU2hldmNoZW5rbywKClRoYW5r
cyBmb3IgdGFraW5nIGEgbG9vay4gSSB3b3VsZCBsaWtlIHRvIGNsYXJpZnkgdGhlIHBvaW50IHlv
dSByYWlzZWQuCgpUaGUgcmVhc29uIEkgc3RhcnRlZCBsb29raW5nIGF0IHRoaXMgaXMgdGhlIG9y
aWdpbmFsIG1vdGl2YXRpb24gYmVoaW5kCnRoZSBfc2FmZSgpIHZhcmlhbnRzLiAgVGhleSBleGlz
dCBiZWNhdXNlIHNvbWUgdXNlcnMgbmVlZCB0byByZW1vdmUsIG1vdmUKb3Igb3RoZXJ3aXNlIGNv
bnN1bWUgdGhlIGN1cnJlbnQgZW50cnkgd2hpbGUgd2Fsa2luZyB0aGUgbGlzdC4gIEluIHRoYXQK
Y2FzZSB0aGUgbmV4dCBjdXJzb3IgaGFzIHRvIGJlIHByZXNlcnZlZCBiZWZvcmUgdGhlIGxvb3Ag
Ym9keSBjYW4gbW9kaWZ5CnRoZSBjdXJyZW50IGVudHJ5LgoKVGhlIHVuZm9ydHVuYXRlIHBhcnQg
aXMgdGhhdCB0aGlzIGNvdWxkIG5vdCBiZSBleHByZXNzZWQgd2l0aCB0aGUKZXhpc3RpbmcgbGlz
dF9mb3JfZWFjaF9lbnRyeSgpIGludGVyZmFjZSB3aXRob3V0IGNoYW5naW5nIGl0cyBjYWxsaW5n
CmNvbnZlbnRpb24uICBUaGUgX3NhZmUoKSB2YXJpYW50cyBoYWQgdG8gZ3JvdyBhbiBleHRyYSBh
cmd1bWVudCBmb3IgdGhlCnRlbXBvcmFyeSBjdXJzb3IsIGFuZCB0aGF0IGlzIHdoeSB3ZSBlbmRl
ZCB1cCB3aXRoIGEgc2VwYXJhdGUgZmFtaWx5IG9mCm1hY3Jvcy4KCkJ1dCBjb25jZXB0dWFsbHks
IHRoZSBkaXN0aW5jdGlvbiBkb2VzIG5vdCBoYXZlIHRvIGJlIGV4cG9zZWQgYXMgdHdvCmRpZmZl
cmVudCBpdGVyYXRvciBmYW1pbGllcyBmb3JldmVyLiAgVGhlIGRpZmZlcmVuY2UgaXMgYW4gaW1w
bGVtZW50YXRpb24KZGV0YWlsOiB3aGV0aGVyIHRoZSBpdGVyYXRvciBrZWVwcyB0aGUgbmV4dC9w
cmV2aW91cyBjdXJzb3IgYmVmb3JlIHRoZQpib2R5IHJ1bnMuICBUaGlzIHNlcmllcyBtYWtlcyB0
aGUgY29tbW9uIGxpc3RfZm9yX2VhY2hfZW50cnkoKSBpdGVyYXRvcnMKZG8gdGhhdCBpbnRlcm5h
bGx5LCBzbyB0aGUgc2FmZSBhbmQgbm9uLXNhZmUgZm9ybXMgY2FuIGVmZmVjdGl2ZWx5IGJlCmZv
bGRlZCB0b2dldGhlciwgb3IgYXQgbGVhc3QgdGhlIG5lZWQgZm9yIGEgc2VwYXJhdGUgcHVibGlj
IF9zYWZlKCkKaW50ZXJmYWNlIGJlY29tZXMgbXVjaCB3ZWFrZXIuCgpUaGVyZSBpcyBhbHNvIGEg
dXNhYmlsaXR5IGlzc3VlIHdpdGggdGhlIGN1cnJlbnQgX3NhZmUoKSBpbnRlcmZhY2UuICBUaGUK
Y2FsbGVyIGlzIGZvcmNlZCB0byBkZWZpbmUgYSB0ZW1wb3JhcnkgY3Vyc29yIG91dHNpZGUgdGhl
IG1hY3JvIGFuZCBwYXNzCml0IGluLCBldmVuIHRob3VnaCBhbG1vc3QgYWxsIHVzZXJzIG5ldmVy
IHVzZSB0aGF0IGN1cnNvciBkaXJlY3RseS4gIEl0IGlzCmp1c3QgYm9pbGVycGxhdGUgcmVxdWly
ZWQgYnkgdGhlIG1hY3JvIGltcGxlbWVudGF0aW9uLiAgSSBmaW5kIHRoYXQKcmVkdW5kYW50IGFu
ZCBhd2t3YXJkOiB0aGUgdGVtcG9yYXJ5IGN1cnNvciBpcyBhbiBpbnRlcm5hbCBkZXRhaWwgb2Yg
dGhlCml0ZXJhdGlvbiwgYnV0IGV2ZXJ5IGNhbGxlciBoYXMgdG8gc3BlbGwgaXQgb3V0LgoKV2l0
aCB0aGUgdXBkYXRlZCBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkgaW1wbGVtZW50YXRpb24sIHRoYXQg
ZXh0cmEgY3Vyc29yCmNhbiBiZSBrZXB0IGluc2lkZSB0aGUgaXRlcmF0b3IgaXRzZWxmLiAgQ2Fs
bGVycyB0aGF0IG9ubHkgd2FudCB0byB3YWxrCnRoZSBsaXN0LCBpbmNsdWRpbmcgY2FsbGVycyB0
aGF0IGRlbGV0ZSBvciBjb25zdW1lIHRoZSBjdXJyZW50IGVudHJ5LCBubwpsb25nZXIgbmVlZCB0
byBjYXJyeSBhbiBvdGhlcndpc2UtdW51c2VkIHRlbXBvcmFyeSB2YXJpYWJsZSBqdXN0IHRvIG1h
a2UKdGhlIG1hY3JvIHdvcmsuCgo+Pgo+PiBUaGUgZmluYWwgcGF0Y2ggY2hhbmdlcyBpbmNsdWRl
L2xpbnV4L2xpc3QuaCB0byBrZWVwIGEgcHJpdmF0ZSBjdXJzb3IgaW4KPj4gdGhlIGNvbW1vbiBl
bnRyeSBpdGVyYXRvcnMgd2hpbGUgcHJlc2VydmluZyB0aGUgcHVibGljIG1hY3JvIGludGVyZmFj
ZS4KPj4gVGhlIHNhZmUgdmFyaWFudHMgcmVtYWluIGF2YWlsYWJsZSB3aGVuIGNhbGxlcnMgbmVl
ZCB0aGUgdGVtcG9yYXJ5Cj4+IGN1cnNvciBleHBsaWNpdGx5IG9yIGhhdmUgc3Ryb25nZXIgbXV0
YXRpb24gcmVxdWlyZW1lbnRzLgo+Pgo+PiBDaGFuZ2VzIGluIHYyIChNdWNodW4gU29uZywgQW5k
eSBTaGV2Y2hlbmtvKToKPj4gIC0gRHJvcCB0aGUgbGlzdF9mb3JfZWFjaF9lbnRyeV9tdXRhYmxl
KigpIGhlbHBlcnMgZnJvbSB2MSBhbmQgbWFrZSB0aGUKPj4gICAgY3Vyc29yIGNoYW5nZSBkaXJl
Y3RseSBpbiB0aGUgZXhpc3RpbmcgbGlzdF9mb3JfZWFjaF9lbnRyeSooKSBoZWxwZXJzLgo+PiAg
LSBPcGVuLWNvZGUgc3BlY2lhbCBsaXN0IHdhbGtzIHRoYXQgcmVseSBvbiB1cGRhdGluZyB0aGUg
bG9vcCBjdXJzb3IgaW4KPj4gICAgdGhlIGJvZHksIHByZXNlcnZpbmcgdGhlaXIgZXhpc3Rpbmcg
dHJhdmVyc2FsIHNlbWFudGljcy4KPj4KPj4gTGluayB0byB2MToKPj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjYwNTI5MDgyMTQ5Ljc2NzY0LTEta2FpdGFvLmNoZW5nQGxpbnV4LmRl
di8KPj4KPj4gS2FpdGFvIENoZW5nICgxNCk6Cj4+ICAgZHJiZDogT3Blbi1jb2RlIHRyYW5zZmVy
IGxvZyBsaXN0IHdhbGsKPj4gICBmaXJld2lyZTogY29yZTogT3Blbi1jb2RlIHRvcG9sb2d5IGxp
c3Qgd2Fsawo+PiAgIGRybS9icmlkZ2U6IE9wZW4tY29kZSBicmlkZ2UgY2hhaW4gbGlzdCB3YWxr
cwo+PiAgIGRybS9pOTE1L2d0OiBPcGVuLWNvZGUgYWN0aXZlIHRpbWVsaW5lIHdhbGsKPj4gICBk
cm0vaTkxNTogT3Blbi1jb2RlIERGUyBkZXBlbmRlbmN5IGxpc3Qgd2Fsawo+PiAgIGRybS90dG06
IE9wZW4tY29kZSByZXNlcnZhdGlvbiBsaXN0IHdhbGsKPj4gICBzcGk6IGZzaTogT3Blbi1jb2Rl
IG1lc3NhZ2UgdHJhbnNmZXIgd2Fsawo+PiAgIHNwaTogc3RtMzItb3NwaTogT3Blbi1jb2RlIG1l
c3NhZ2UgdHJhbnNmZXIgd2Fsawo+PiAgIHNwaTogc3RtMzItcXNwaTogT3Blbi1jb2RlIG1lc3Nh
Z2UgdHJhbnNmZXIgd2Fsawo+PiAgIHNwaTogdGVncmEyMTAtcXVhZDogT3Blbi1jb2RlIG1lc3Nh
Z2UgdHJhbnNmZXIgd2Fsawo+PiAgIGxvY2tpbmcvbG9ja3RvcnR1cmU6IE9wZW4tY29kZSB3dyBt
dXRleCBsaXN0IHdhbGsKPj4gICBsb2NraW5nL3d3X211dGV4OiBPcGVuLWNvZGUgc3RyZXNzIHJl
b3JkZXIgbGlzdCB3YWxrCj4+ICAgQVNvQzogZGFwbTogT3Blbi1jb2RlIHdpZGdldCBpbnZhbGlk
YXRpb24gd2Fsawo+PiAgIGxpc3Q6IENhY2hlIGN1cnNvcnMgaW4gZW50cnkgaXRlcmF0b3JzCj4+
Cj4+ICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9kZWJ1Z2ZzLmMgICAgICB8ICA0ICsrLQo+PiAg
ZHJpdmVycy9maXJld2lyZS9jb3JlLXRvcG9sb2d5LmMgICAgICAgfCAgNCArKy0KPj4gIGRyaXZl
cnMvZ3B1L2RybS9kcm1fYnJpZGdlLmMgICAgICAgICAgIHwgIDcgKystLQo+PiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3QvaW50ZWxfcmVzZXQuYyAgfCAgNCArKy0KPj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfc2NoZWR1bGVyLmMgIHwgIDQgKystCj4+ICBkcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9leGVjYnVmX3V0aWwuYyB8ICA0ICsrLQo+PiAgZHJpdmVycy9zcGkvc3BpLWZzaS5jICAg
ICAgICAgICAgICAgICAgfCAgNSArKy0KPj4gIGRyaXZlcnMvc3BpL3NwaS1zdG0zMi1vc3BpLmMg
ICAgICAgICAgIHwgIDQgKystCj4+ICBkcml2ZXJzL3NwaS9zcGktc3RtMzItcXNwaS5jICAgICAg
ICAgICB8ICA1ICsrLQo+PiAgZHJpdmVycy9zcGkvc3BpLXRlZ3JhMjEwLXF1YWQuYyAgICAgICAg
fCAgNCArKy0KPj4gIGluY2x1ZGUvbGludXgvbGlzdC5oICAgICAgICAgICAgICAgICAgIHwgNDYg
KysrKysrKysrKysrKysrKysrKystLS0tLS0KPj4gIGtlcm5lbC9sb2NraW5nL2xvY2t0b3J0dXJl
LmMgICAgICAgICAgIHwgIDQgKystCj4+ICBrZXJuZWwvbG9ja2luZy90ZXN0LXd3X211dGV4LmMg
ICAgICAgICB8ICA0ICsrLQo+PiAgc291bmQvc29jL3NvYy1kYXBtLmMgICAgICAgICAgICAgICAg
ICAgfCAgNCArKy0KPj4gIDE0IGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMoKyksIDI1IGRl
bGV0aW9ucygtKQo+Pgo+PiAtLQo+PiAyLjQzLjAKPj4KPiAKCi0tIApUaGFua3MKS2FpdGFvIENo
ZW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
