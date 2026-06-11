Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6ClJE9ypKmqCugMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 14:28:12 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17163671D36
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 14:28:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linux.dev header.s=key1 header.b=rFXXpM7I;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linux.dev (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B825BC9AE3B;
	Thu, 11 Jun 2026 12:28:10 +0000 (UTC)
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA3FDC6C856
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 12:28:09 +0000 (UTC)
Message-ID: <27b726c2-9b72-4b44-9d85-9b1aa12851a2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1781180888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/UsUeGpou3lVapXWhjq32I6t+zBdHKuqjJl90iVDSiA=;
 b=rFXXpM7IJOrHQFdgRhKujVf5VdxV6jkKNFlDsX25IoXEP9KJZ8Dv8l5c0nKTafwKXUsRZ9
 3BPFb1LLg9n4GliYQt3h1fAcAsjSrL2AfeU8aUx/g3f9LERtMslSnnlcG3/NjMtCHL+fHf
 5Y0xERqt55aedIITIkiJCvpkmeFBkwg=
Date: Thu, 11 Jun 2026 20:27:05 +0800
MIME-Version: 1.0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
 <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
 <6b2efdee-95b0-4306-a682-0d0466497ddb@amd.com>
 <2399841f-d834-4652-8285-4a15c7d9a9b9@linux.dev>
 <d974a2ea-6102-45ff-bf36-3b25a2404e40@amd.com>
 <ail8iNvPrJnE7p58@ashevche-desk.local>
 <92683537-8404-47fe-a4ba-160e54870f0b@amd.com>
 <aipx1goKIsk40vrF@ashevche-desk.local>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <aipx1goKIsk40vrF@ashevche-desk.local>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.dev : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:christian.koenig@amd.com,m:muchun.song@linux.dev,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:ldewangan@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:andrzej.hajda@intel.com,m:tursulin@ursulin.net,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:drbd-dev@lists.linbit.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:airlied@gmail.com,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:matthew.auld@intel.com,m:longman@redhat.com,m:philipp.reisner@linbit.com,m:luca.ceresoli@bootlin.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:
 jani.nikula@linux.intel.com,m:linux-block@vger.kernel.org,m:broonie@kernel.org,m:mripard@kernel.org,m:rodrigo.vivi@intel.com,m:linux-tegra@vger.kernel.org,m:perex@perex.cz,m:linux1394-devel@lists.sourceforge.net,m:lars.ellenberg@linbit.com,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:linux-spi@vger.kernel.org,m:christoph.boehmwalder@linbit.com,m:ray.huang@amd.com,m:skomatineni@nvidia.com,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:o-takashi@sakamocchi.jp,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kaitao.cheng@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.dev,infradead.org,kernel.org,linux.intel.com,linux.ibm.com,lists.freedesktop.org,vger.kernel.org,redhat.com,nvidia.com,ideasonboard.com,intel.com,ursulin.net,st-md-mailman.stormreply.com,lists.linbit.com,ffwll.ch,stgolabs.net,gmail.com,suse.com,kylinos.cn,linbit.com,bootlin.com,suse.de,kwiboo.se,joshtriplett.org,perex.cz,lists.sourceforge.net,lists.infradead.org,kernel.dk,linaro.org,amd.com,linux-foundation.org,sakamocchi.jp];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:-];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
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
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17163671D36

CgrlnKggMjAyNi82LzExIDE2OjI5LCBBbmR5IFNoZXZjaGVua28g5YaZ6YGTOgo+IE9uIFRodSwg
SnVuIDExLCAyMDI2IGF0IDEwOjAxOjI1QU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
Cj4+IE9uIDYvMTAvMjYgMTc6MDIsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPj4+IE9uIFdlZCwg
SnVuIDEwLCAyMDI2IGF0IDExOjExOjM0QU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
Cj4+Pj4gT24gNi8xMC8yNiAxMDoxOCwgS2FpdGFvIENoZW5nIHdyb3RlOgo+Pj4+PiDlnKggMjAy
Ni82LzEwIDE2OjA3LCBDaHJpc3RpYW4gS8O2bmlnIOWGmemBkzoKPiAKPiAuLi4KPiAKPj4+Pj4g
U2hvdWxkIHdlIHJldmVydCB0byB2MSwgb3Iga2VlcCBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkgYW5k
Cj4+Pj4+IGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSgpIGFzIHRoZXkgYXJlLCBjbG9zZSB0aGlz
IHRocmVhZCwgYW5kIG1ha2Ugbm8KPj4+Pj4gY2hhbmdlcz8KPj4+Pj4KPj4+Pj4gTGluayB0byB2
MToKPj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNTI5MDgyMTQ5Ljc2NzY0
LTEta2FpdGFvLmNoZW5nQGxpbnV4LmRldi8KPj4+Pj4KPj4+Pj4gT3IgZG8geW91IGhhdmUgYW55
IGJldHRlciBzdWdnZXN0aW9ucz8KPj4+Pgo+Pj4+IHYxIGxvb2tzIHBlcmZlY3RseSByZWFzb25h
YmxlIHRvIG1lLgo+Pj4KPj4+IEJ1dCB3aHkgbm90IGp1c3QgaGlkaW5nIHRoYXQgb25jZSBmb3Ig
YWxsIChpbiBjYXNlIHRoZXkgZG9uJ3QgdXNlIHRoZSB0ZW1wb3JhcnkKPj4+IGl0ZXJhdG9yKT8g
RWFzeSB0byBhdXRvbWF0ZSwgcm9idXN0IOKAlCBldmVyeW9uZSBpcyBoYXBweT8KPj4KPj4gQXMg
ZmFyIGFzIEkgY2FuIHNlZSB0aGF0IGlzIGFuIGV4dHJlbWVseSBiYWQgaWRlYS4KPj4KPj4gVGhl
IGRpc3RpbmN0aW9uIGJldHdlZW4gdGhlIHVzZSBjYXNlcyBvZiAnaXRlcmF0aW5nIHRoZSBsaXN0
JyBhbmQgJ2l0ZXJhdGluZwo+PiB0aGUgbGlzdCB3aGlsZSB5b3UgbW9kaWZ5IGl0JyBpcyBjb21w
bGV0ZWx5IGludGVudGlvbmFsLgoKSSBhZ3JlZSB3aXRoIHRoaXMgcG9pbnQuIEl0IGlzIHZlcnkg
cmVhc29uYWJsZSBmb3IgbGlzdF9mb3JfZWFjaF9lbnRyeSgpCnRvIGJlIHVzZWQgb25seSBmb3Ig
J2l0ZXJhdGluZyB0aGUgbGlzdCcuIEluIHByYWN0aWNlLCBob3dldmVyLCB3ZSBkbyBub3QKaGF2
ZSBhbiBlZmZlY3RpdmUgd2F5IHRvIGVuZm9yY2UgdGhhdCBydWxlIGZvciB1c2Vycywgd2hlcmVh
cyB0aGUgZGlzdGluY3Rpb24KYmV0d2VlbiBib29sIGFuZCBpbnQgY2FuIGJlIGVuZm9yY2VkIGJ5
IHRoZSBjb21waWxlci4gVGhlIDEzIHBhdGNoZXMgaW4gdGhlCmN1cnJlbnQgc2VyaWVzIGFyZSBh
bGwgcmVhbCBleGFtcGxlcyB3aGVyZSB1c2VycyBtb2RpZnkgdGhlIGxpc3Qgd2hpbGUgdXNpbmcK
bGlzdF9mb3JfZWFjaF9lbnRyeSgpLiBJcyBhIHJ1bGUgdGhhdCBjYW5ub3QgYWN0dWFsbHkgYmUg
ZW5mb3JjZWQgcmVhc29uYWJsZT8KVGhpcyBpcyBqdXN0IG15IGh1bWJsZSBvcGluaW9uLCBhbmQg
SSBhbSByYWlzaW5nIGl0IGhlcmUgb25seSBmb3IgZGlzY3Vzc2lvbi4KCj4gV2hhdCBJIG1lYW50
IGlzIHRvIGtlZXAgdGhlIG5hbWUsIGp1c3QgZHJvcCB0aGUgcGFyYW1ldGVyIChtYWtlIGl0IGhp
ZGRlbiBhbmQKPiBiZWluZyBkZWZpbmVkIGluc2lkZSBsaXN0X2Zvcl9lYWNoXypfc2FmZSgpIGNh
c2VzKS4KCkkgYWdyZWUgd2l0aCB0aGlzIGFwcHJvYWNoLCBidXQgdGhlIHNwZWNpZmljIGRldGFp
bHMgc3RpbGwgbmVlZCB0byBiZSBzZXR0bGVkLAppbmNsdWRpbmcgdGhlIGlzc3VlIGRlc2NyaWJl
ZCBpbiB0aGUgbGluayBiZWxvdy4KCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8wYTMzM2Vi
OC1mYzI5LTRiODUtOTkzZS02YjcyNmY0YzdjZjBAbGludXguZGV2LwoKT2YgY291cnNlLCB0aGVy
ZSBpcyBhbHNvIHRoZSBzdWZmaXgtcmVuYW1pbmcgaXNzdWUgcmFpc2VkIGJ5IENocmlzdGlhbi4K
Cj4+IFNlZSB0aGUgYm9vbCB0eXBlIGNhbiBiZSBpbXBsZW1lbnRlZCBieSBpbnQgYXMgd2VsbCwg
YnV0IGl0IGlzIGp1c3QgYQo+PiBkaWZmZXJlbnQgdXNlIGNhc2UuCj4gCj4+Pj4gWW91IHNob3Vs
ZCBqdXN0IGluY2x1ZGUgc29tZSBwYXRjaGVzIGluIHRoZSBzYW1lIHBhdGNoIHNldCB0byBhY3R1
YWxseSB1c2UKPj4+PiB0aGUgbmV3IG1hY3Jvcy4KPj4+Pgo+Pj4+IElmIHlvdSBtb2RpZnkgdGhl
IGZpbGVzIHVuZGVyIGRyaXZlcnMvZG1hLWJ1ZiBvciBkcml2ZXJzL2dwdS9kcm0vYW1kIHRvIHVz
ZQo+Pj4+IHRoZSBuZXcgbWFjcm8gSSdtIGhhcHB5IHRvIHJldmlldyB0aGF0Lgo+Pj4KPj4KPiAK
Ci0tIApUaGFua3MKS2FpdGFvIENoZW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
