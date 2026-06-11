Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4krjJ+M8KmoWlAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 06:43:15 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D0B66E42A
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 06:43:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linux.dev header.s=key1 header.b=Hp8pOFHp;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linux.dev (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EBCEC5F1CF;
	Thu, 11 Jun 2026 04:43:14 +0000 (UTC)
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0BA1C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 04:43:12 +0000 (UTC)
Message-ID: <9b98e860-11df-44bf-9a95-3046d2c274a6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1781152991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=amFobG45FitZxSTZMk37sKmrzp6+HTwygF2QRCMVESA=;
 b=Hp8pOFHpWz66c6aS666mzKdGRUOg5trj2OOXjIC2FT49beQLeiNdwbdvku6y74Ze+FUPE+
 E8RFdhLaOrZjL9dY7cSSbpn242HXv3fuPOtrI0a7ePuPhOCMW89fa+R0t1DoJD4yyOztEo
 oTw51U8wnDSUmm+mYfNoclmpLJbmbns=
Date: Thu, 11 Jun 2026 12:42:02 +0800
MIME-Version: 1.0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
 <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
 <ail4AvzqAOXNaU6N@ashevche-desk.local>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <ail4AvzqAOXNaU6N@ashevche-desk.local>
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
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:christian.koenig@amd.com,m:muchun.song@linux.dev,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:ldewangan@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:tursulin@ursulin.net,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:drbd-dev@lists.linbit.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:airlied@gmail.com,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:matthew.auld@intel.com,m:longman@redhat.com,m:philipp.reisner@linbit.com,m:luca.ceresoli@bootlin.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:from_mime,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8D0B66E42A

CgrlnKggMjAyNi82LzEwIDIyOjQzLCBBbmR5IFNoZXZjaGVua28g5YaZ6YGTOgo+IE9uIFdlZCwg
SnVuIDEwLCAyMDI2IGF0IDAyOjE0OjA2UE0gKzA4MDAsIEthaXRhbyBDaGVuZyB3cm90ZToKPj4g
5ZyoIDIwMjYvNi85IDE4OjMzLCBDaHJpc3RpYW4gS8O2bmlnIOWGmemBkzoKPj4+IE9uIDYvOS8y
NiAwODoxMywgS2FpdGFvIENoZW5nIHdyb3RlOgo+Pj4+Cj4+Pj4gVGhpcyBzZXJpZXMgcHJlcGFy
ZXMgZm9yLCBhbmQgdGhlbiB1cGRhdGVzLCB0aGUgbGlzdF9mb3JfZWFjaF9lbnRyeSgpCj4+Pj4g
ZmFtaWx5IHNvIHRoZSBjb21tb24gZW50cnkgaXRlcmF0b3JzIGNhY2hlIHRoZWlyIG5leHQgb3Ig
cHJldmlvdXMgY3Vyc29yCj4+Pj4gYmVmb3JlIHRoZSBsb29wIGJvZHkgcnVucy4KPj4+Cj4+PiBX
aHkgaW4gdGhlIHdvcmxkIHdvdWxkIHdlIHdhbnQgdG8gZG8gdGhhdD8KPj4+Cj4+PiBUaGUgc2Fm
ZSBhbmQgbm9uLXNhZmUgdmFyaWFudHMgaGF2ZSB2ZXJ5IGRpc3RpbmN0IHVzZSBjYXNlcyBhbmQg
dGhhdCBpcyBjb21wbGV0ZWx5IGludGVudGlvbmFsLgo+Pj4KPj4+IFdoYXQgd2UgY291bGQgaW1w
cm92ZSBtYXliZSBpcyB0aGUgZG9jdW1lbnRhdGlvbiwgZnJvbSBteSBleHBlcmllbmNlIGFuIGFz
dG9uaXNoaW5nIGxhcmdlIGFtb3VudCBvZiBwZW9wbGUgaGF2ZSBtaXNjb25jZXB0aW9ucyBhYm91
dCB0aGUgc2FmZSB2YXJpYW50cy4KPj4+Cj4+Pj4gVGhlIGZpcnN0IDEzIHBhdGNoZXMgb3Blbi1j
b2RlIGxvb3BzIHRoYXQgaW50ZW50aW9uYWxseSBkZXBlbmQgb24gdGhlCj4+Pj4gb2xkICJkZXJp
dmUgdGhlIG5leHQgZW50cnkgZnJvbSB0aGUgY3VycmVudCBjdXJzb3IgYXQgdGhlIGVuZCBvZiB0
aGUKPj4+PiBpdGVyYXRpb24iIGJlaGF2aW91ci4gIFRoZXNlIGxvb3BzIGFwcGVuZCB3b3JrIHRv
IHRoZSBsaXN0IGJlaW5nIHdhbGtlZCwKPj4+PiByZXN0YXJ0IHRyYXZlcnNhbCBhZnRlciBkcm9w
cGluZyBhIGxvY2ssIHNraXAgYW4gZW50cnkgY29uc3VtZWQgYnkgdGhlCj4+Pj4gY3VycmVudCBp
dGVyYXRpb24sIG9yIG90aGVyd2lzZSBhZGp1c3QgdGhlIGN1cnNvciBpbiB0aGUgbG9vcCBib2R5
Lgo+Pj4KPj4+IFdlbGwgSSBoYXZlIHRvIGNsZWFybHkgcmVqZWN0IHRoZSBjaGFuZ2VzIGZvciBz
dWJzeXN0ZW1zL2NvbXBvbmVudHMgSSdtIG1haW50YWluaW5nLCB0aGF0IGp1c3QgbG9va3MgaG9y
cmlibGUgdG8gbWUgYW5kIEkgY2xlYXJseSBkb24ndCBzZWUgYSBnb29kIHJlYXNvbiBmb3IgdGhh
dC4KPj4KPj4gSGkgQ2hyaXN0aWFuIGFuZCBBbmR5IFNoZXZjaGVua28sCj4+Cj4+IFRoYW5rcyBm
b3IgdGFraW5nIGEgbG9vay4gSSB3b3VsZCBsaWtlIHRvIGNsYXJpZnkgdGhlIHBvaW50IHlvdSBy
YWlzZWQuCj4+Cj4+IFRoZSByZWFzb24gSSBzdGFydGVkIGxvb2tpbmcgYXQgdGhpcyBpcyB0aGUg
b3JpZ2luYWwgbW90aXZhdGlvbiBiZWhpbmQKPj4gdGhlIF9zYWZlKCkgdmFyaWFudHMuICBUaGV5
IGV4aXN0IGJlY2F1c2Ugc29tZSB1c2VycyBuZWVkIHRvIHJlbW92ZSwgbW92ZQo+PiBvciBvdGhl
cndpc2UgY29uc3VtZSB0aGUgY3VycmVudCBlbnRyeSB3aGlsZSB3YWxraW5nIHRoZSBsaXN0LiAg
SW4gdGhhdAo+PiBjYXNlIHRoZSBuZXh0IGN1cnNvciBoYXMgdG8gYmUgcHJlc2VydmVkIGJlZm9y
ZSB0aGUgbG9vcCBib2R5IGNhbiBtb2RpZnkKPj4gdGhlIGN1cnJlbnQgZW50cnkuCj4+Cj4+IFRo
ZSB1bmZvcnR1bmF0ZSBwYXJ0IGlzIHRoYXQgdGhpcyBjb3VsZCBub3QgYmUgZXhwcmVzc2VkIHdp
dGggdGhlCj4+IGV4aXN0aW5nIGxpc3RfZm9yX2VhY2hfZW50cnkoKSBpbnRlcmZhY2Ugd2l0aG91
dCBjaGFuZ2luZyBpdHMgY2FsbGluZwo+PiBjb252ZW50aW9uLiAgVGhlIF9zYWZlKCkgdmFyaWFu
dHMgaGFkIHRvIGdyb3cgYW4gZXh0cmEgYXJndW1lbnQgZm9yIHRoZQo+PiB0ZW1wb3JhcnkgY3Vy
c29yLCBhbmQgdGhhdCBpcyB3aHkgd2UgZW5kZWQgdXAgd2l0aCBhIHNlcGFyYXRlIGZhbWlseSBv
Zgo+PiBtYWNyb3MuCj4+Cj4+IEJ1dCBjb25jZXB0dWFsbHksIHRoZSBkaXN0aW5jdGlvbiBkb2Vz
IG5vdCBoYXZlIHRvIGJlIGV4cG9zZWQgYXMgdHdvCj4+IGRpZmZlcmVudCBpdGVyYXRvciBmYW1p
bGllcyBmb3JldmVyLiAgVGhlIGRpZmZlcmVuY2UgaXMgYW4gaW1wbGVtZW50YXRpb24KPj4gZGV0
YWlsOiB3aGV0aGVyIHRoZSBpdGVyYXRvciBrZWVwcyB0aGUgbmV4dC9wcmV2aW91cyBjdXJzb3Ig
YmVmb3JlIHRoZQo+PiBib2R5IHJ1bnMuICBUaGlzIHNlcmllcyBtYWtlcyB0aGUgY29tbW9uIGxp
c3RfZm9yX2VhY2hfZW50cnkoKSBpdGVyYXRvcnMKPj4gZG8gdGhhdCBpbnRlcm5hbGx5LCBzbyB0
aGUgc2FmZSBhbmQgbm9uLXNhZmUgZm9ybXMgY2FuIGVmZmVjdGl2ZWx5IGJlCj4+IGZvbGRlZCB0
b2dldGhlciwgb3IgYXQgbGVhc3QgdGhlIG5lZWQgZm9yIGEgc2VwYXJhdGUgcHVibGljIF9zYWZl
KCkKPj4gaW50ZXJmYWNlIGJlY29tZXMgbXVjaCB3ZWFrZXIuCj4+Cj4+IFRoZXJlIGlzIGFsc28g
YSB1c2FiaWxpdHkgaXNzdWUgd2l0aCB0aGUgY3VycmVudCBfc2FmZSgpIGludGVyZmFjZS4gIFRo
ZQo+PiBjYWxsZXIgaXMgZm9yY2VkIHRvIGRlZmluZSBhIHRlbXBvcmFyeSBjdXJzb3Igb3V0c2lk
ZSB0aGUgbWFjcm8gYW5kIHBhc3MKPj4gaXQgaW4sIGV2ZW4gdGhvdWdoIGFsbW9zdCBhbGwgdXNl
cnMgbmV2ZXIgdXNlIHRoYXQgY3Vyc29yIGRpcmVjdGx5LiAgSXQgaXMKPj4ganVzdCBib2lsZXJw
bGF0ZSByZXF1aXJlZCBieSB0aGUgbWFjcm8gaW1wbGVtZW50YXRpb24uICBJIGZpbmQgdGhhdAo+
PiByZWR1bmRhbnQgYW5kIGF3a3dhcmQ6IHRoZSB0ZW1wb3JhcnkgY3Vyc29yIGlzIGFuIGludGVy
bmFsIGRldGFpbCBvZiB0aGUKPj4gaXRlcmF0aW9uLCBidXQgZXZlcnkgY2FsbGVyIGhhcyB0byBz
cGVsbCBpdCBvdXQuCj4gCj4gQWgsIEkgdGhpbmsgdGhlIGRpc3RpbmN0IG1hY3JvIGZhbWlsaWVz
IGlzIHRoYXQgd2hhdCB3ZSB3YW50Lgo+IEJ1dCB0aGUgaGlkaW5nIG9mIHRoZSBwYXJhbWV0ZXIg
Y2FuIGJlIGRvbmUgaW5zaWRlIGxpc3RfZm9yX2VhY2hfKl9zYWZlKCkuCj4gWW91IGNhbiBkbyBh
IHRyZWV3aWRlIGNoYW5nZSB3aXRoIGNvY2NpbmVsbGUuCj4gCj4gU29ycnkgaWYgSSBkaWRuJ3Qg
Z2V0IHRoZSB3aG9sZSBpZGVhIGZyb20geW91ciBwcmV2aW91cyBjb250cmlidXRpb25zLgo+IAo+
IE5vdGUsIGV2ZW4gY2FzZXMgdGhhdCB3b3VsZCBuZWVkIGEgdGVtcG9yYXJ5IGN1cnNvciBtYXkg
YmUgc3dpdGNoZWQgdG8KPiBuZXcgbGlzdF9mb3JfZWFjaF8qX3NhZmUoKSwgc2VlIGhvdyBQQ0kg
bWFjcm9zIGZvciBpdGVyYXRpbmcgb3ZlciByZXNvdXJjZXMKPiBhcmUgaW1wbGVtZW50ZWQgKGlu
Y2x1ZGUvbGludXgvcGNpLmgpLgoKVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb25zLiBJJ3ZlIHdy
aXR0ZW4gYSBkZW1vIGJhc2VkIG9uIHlvdXIgZmVlZGJhY2suCkNvdWxkIHlvdSBwbGVhc2UgcmV2
aWV3IGl0IGFuZCBzaGFyZSB5b3VyIHRob3VnaHRzIG9uIHRoaXMgYXBwcm9hY2g/CgoKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvbGlzdC5oIGIvaW5jbHVkZS9saW51eC9saXN0LmgKaW5kZXgg
OWRmODRhNTZhNzg5Li4zMDY1NTRhYjE4NDEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbGlz
dC5oCisrKyBiL2luY2x1ZGUvbGludXgvbGlzdC5oCkBAIC03LDYgKzcsNyBAQAogI2luY2x1ZGUg
PGxpbnV4L3N0ZGRlZi5oPgogI2luY2x1ZGUgPGxpbnV4L3BvaXNvbi5oPgogI2luY2x1ZGUgPGxp
bnV4L2NvbnN0Lmg+CisjaW5jbHVkZSA8bGludXgvYXJncy5oPgoKICNpbmNsdWRlIDxhc20vYmFy
cmllci5oPgoKQEAgLTkxMSwyMCArOTEyLDM0IEBAIHN0YXRpYyBpbmxpbmUgc2l6ZV90IGxpc3Rf
Y291bnRfbm9kZXMoc3RydWN0IGxpc3RfaGVhZCAqaGVhZCkKICAgICAgICBmb3IgKDsgIWxpc3Rf
ZW50cnlfaXNfaGVhZChwb3MsIGhlYWQsIG1lbWJlcik7ICAgICAgICAgICAgICAgICAgXAogICAg
ICAgICAgICAgcG9zID0gbGlzdF9wcmV2X2VudHJ5KHBvcywgbWVtYmVyKSkKCisjZGVmaW5lIF9f
bGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlX2ludGVybmFsKHBvcywgbmV4dCwgaGVhZCwgbWVtYmVy
KSAgIFwKKyAgICAgICBmb3IgKHR5cGVvZihwb3MpIG5leHQgPSBsaXN0X25leHRfZW50cnkocG9z
ID0gICAgICAgICAgICAgICAgICAgXAorICAgICAgICAgICAgICAgbGlzdF9maXJzdF9lbnRyeSho
ZWFkLCB0eXBlb2YoKnBvcyksIG1lbWJlciksIG1lbWJlcik7ICBcCisgICAgICAgICAgICAhbGlz
dF9lbnRyeV9pc19oZWFkKHBvcywgaGVhZCwgbWVtYmVyKTsgICAgICAgICAgICAgICAgICAgIFwK
KyAgICAgICAgICAgIHBvcyA9IG5leHQsIG5leHQgPSBsaXN0X25leHRfZW50cnkobmV4dCwgbWVt
YmVyKSkKKworI2RlZmluZSBfX2xpc3RfZm9yX2VhY2hfZW50cnlfc2FmZTIocG9zLCBoZWFkLCBt
ZW1iZXIpICAgICAgICAgICAgICAgICBcCisgICAgICAgX19saXN0X2Zvcl9lYWNoX2VudHJ5X3Nh
ZmVfaW50ZXJuYWwocG9zLCBfX1VOSVFVRV9JRChuZXh0KSwgaGVhZCwgbWVtYmVyKQorCisjZGVm
aW5lIF9fbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlMyhwb3MsIG5leHQsIGhlYWQsIG1lbWJlcikg
ICAgICAgICAgIFwKKyAgICAgICBmb3IgKHBvcyA9IGxpc3RfZmlyc3RfZW50cnkoaGVhZCwgdHlw
ZW9mKCpwb3MpLCBtZW1iZXIpLCAgICAgICAgXAorICAgICAgICAgICAgICAgbmV4dCA9IGxpc3Rf
bmV4dF9lbnRyeShwb3MsIG1lbWJlcik7ICAgICAgICAgICAgICAgICAgICBcCisgICAgICAgICAg
ICAhbGlzdF9lbnRyeV9pc19oZWFkKHBvcywgaGVhZCwgbWVtYmVyKTsgICAgICAgICAgICAgICAg
ICAgIFwKKyAgICAgICAgICAgIHBvcyA9IG5leHQsIG5leHQgPSBsaXN0X25leHRfZW50cnkobmV4
dCwgbWVtYmVyKSkKKwogLyoqCiAgKiBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUgLSBpdGVyYXRl
IG92ZXIgbGlzdCBvZiBnaXZlbiB0eXBlIHNhZmUgYWdhaW5zdCByZW1vdmFsIG9mIGxpc3QgZW50
cnkKICAqIEBwb3M6ICAgICAgIHRoZSB0eXBlICogdG8gdXNlIGFzIGEgbG9vcCBjdXJzb3IuCi0g
KiBAbjogICAgICAgICBhbm90aGVyIHR5cGUgKiB0byB1c2UgYXMgdGVtcG9yYXJ5IHN0b3JhZ2UK
LSAqIEBoZWFkOiAgICAgIHRoZSBoZWFkIGZvciB5b3VyIGxpc3QuCi0gKiBAbWVtYmVyOiAgICB0
aGUgbmFtZSBvZiB0aGUgbGlzdF9oZWFkIHdpdGhpbiB0aGUgc3RydWN0LgorICogQC4uLjogICAg
ICAgZWl0aGVyIChoZWFkLCBtZW1iZXIpIG9yIChuZXh0LCBoZWFkLCBtZW1iZXIpCisgKiAgICAg
QG5leHQ6ICBhbm90aGVyIHR5cGUgKiB0byB1c2UgYXMgb3B0aW9uYWwgdGVtcG9yYXJ5IHN0b3Jh
Z2UuIFRoZSB0ZW1wb3JhcnkKKyAqICAgICAgICAgICAgIGN1cnNvciBpcyBpbnRlcm5hbCB1bmxl
c3MgZXhwbGljaXRseSBzdXBwbGllZCBieSB0aGUgY2FsbGVyLgorICogICAgIEBoZWFkOiAgdGhl
IGhlYWQgZm9yIHlvdXIgbGlzdC4KKyAqICAgICBAbWVtYmVyOnRoZSBuYW1lIG9mIHRoZSBsaXN0
X2hlYWQgd2l0aGluIHRoZSBzdHJ1Y3QuCiAgKgogICovCi0jZGVmaW5lIGxpc3RfZm9yX2VhY2hf
ZW50cnlfc2FmZShwb3MsIG4sIGhlYWQsIG1lbWJlcikgICAgICAgICAgICAgICAgIFwKLSAgICAg
ICBmb3IgKHBvcyA9IGxpc3RfZmlyc3RfZW50cnkoaGVhZCwgdHlwZW9mKCpwb3MpLCBtZW1iZXIp
LCAgICAgICAgXAotICAgICAgICAgICAgICAgbiA9IGxpc3RfbmV4dF9lbnRyeShwb3MsIG1lbWJl
cik7ICAgICAgICAgICAgICAgICAgICAgICBcCi0gICAgICAgICAgICAhbGlzdF9lbnRyeV9pc19o
ZWFkKHBvcywgaGVhZCwgbWVtYmVyKTsgICAgICAgICAgICAgICAgICAgIFwKLSAgICAgICAgICAg
IHBvcyA9IG4sIG4gPSBsaXN0X25leHRfZW50cnkobiwgbWVtYmVyKSkKKyNkZWZpbmUgbGlzdF9m
b3JfZWFjaF9lbnRyeV9zYWZlKHBvcywgLi4uKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAorICAgICAgIENPTkNBVEVOQVRFKF9fbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlLCBDT1VOVF9B
UkdTKF9fVkFfQVJHU19fKSlcCisgICAgICAgICAgICAgICAocG9zLCBfX1ZBX0FSR1NfXykKCiAv
KioKICAqIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZV9jb250aW51ZSAtIGNvbnRpbnVlIGxpc3Qg
aXRlcmF0aW9uIHNhZmUgYWdhaW5zdCByZW1vdmFsCgo+PiBXaXRoIHRoZSB1cGRhdGVkIGxpc3Rf
Zm9yX2VhY2hfZW50cnkoKSBpbXBsZW1lbnRhdGlvbiwgdGhhdCBleHRyYSBjdXJzb3IKPj4gY2Fu
IGJlIGtlcHQgaW5zaWRlIHRoZSBpdGVyYXRvciBpdHNlbGYuICBDYWxsZXJzIHRoYXQgb25seSB3
YW50IHRvIHdhbGsKPj4gdGhlIGxpc3QsIGluY2x1ZGluZyBjYWxsZXJzIHRoYXQgZGVsZXRlIG9y
IGNvbnN1bWUgdGhlIGN1cnJlbnQgZW50cnksIG5vCj4+IGxvbmdlciBuZWVkIHRvIGNhcnJ5IGFu
IG90aGVyd2lzZS11bnVzZWQgdGVtcG9yYXJ5IHZhcmlhYmxlIGp1c3QgdG8gbWFrZQo+PiB0aGUg
bWFjcm8gd29yay4KPj4KPj4+PiBUaGUgZmluYWwgcGF0Y2ggY2hhbmdlcyBpbmNsdWRlL2xpbnV4
L2xpc3QuaCB0byBrZWVwIGEgcHJpdmF0ZSBjdXJzb3IgaW4KPj4+PiB0aGUgY29tbW9uIGVudHJ5
IGl0ZXJhdG9ycyB3aGlsZSBwcmVzZXJ2aW5nIHRoZSBwdWJsaWMgbWFjcm8gaW50ZXJmYWNlLgo+
Pj4+IFRoZSBzYWZlIHZhcmlhbnRzIHJlbWFpbiBhdmFpbGFibGUgd2hlbiBjYWxsZXJzIG5lZWQg
dGhlIHRlbXBvcmFyeQo+Pj4+IGN1cnNvciBleHBsaWNpdGx5IG9yIGhhdmUgc3Ryb25nZXIgbXV0
YXRpb24gcmVxdWlyZW1lbnRzLgo+IAo+IAoKLS0gClRoYW5rcwpLYWl0YW8gQ2hlbmcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
