Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5tVtMq5lKmriogMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 09:37:18 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF1F66F6ED
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jun 2026 09:37:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linux.dev header.s=key1 header.b=b+1Jxg9v;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linux.dev (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACB15C8F282;
	Thu, 11 Jun 2026 07:37:17 +0000 (UTC)
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com
 [91.218.175.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4E2BC555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2026 07:37:15 +0000 (UTC)
Message-ID: <83ba73d8-27d3-4ee9-a143-7dfe4cb827be@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1781163433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tji7AgabbUATaghWjiZhwDG13hGWICfhuUb1cXJUTp0=;
 b=b+1Jxg9vc+lk8oLrl2ryGqge56LyQH0x4/uvTPLXuGWJDiCSo1AJ26eK71wWGJMLHgc5YA
 D2g9Os8SKNpzlPOeVTmKlEyQlBDJ6RLe9mhavwKS7JCSSpe+hqtIo/4pQdus2a3B30mWlp
 pk5eWE7R7j9MPWT1A6e1TVgUEm2OqoA=
Date: Thu, 11 Jun 2026 15:36:01 +0800
MIME-Version: 1.0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
 <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
 <ail4AvzqAOXNaU6N@ashevche-desk.local>
 <9b98e860-11df-44bf-9a95-3046d2c274a6@linux.dev>
 <aipbojSeMH-usARY@ashevche-desk.local>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <aipbojSeMH-usARY@ashevche-desk.local>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:from_mime,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FF1F66F6ED

5ZyoIDIwMjYvNi8xMSAxNDo1NCwgQW5keSBTaGV2Y2hlbmtvIOWGmemBkzoKPiBPbiBUaHUsIEp1
biAxMSwgMjAyNiBhdCAxMjo0MjowMlBNICswODAwLCBLYWl0YW8gQ2hlbmcgd3JvdGU6Cj4+IOWc
qCAyMDI2LzYvMTAgMjI6NDMsIEFuZHkgU2hldmNoZW5rbyDlhpnpgZM6Cj4+PiBPbiBXZWQsIEp1
biAxMCwgMjAyNiBhdCAwMjoxNDowNlBNICswODAwLCBLYWl0YW8gQ2hlbmcgd3JvdGU6Cj4+Pj4g
5ZyoIDIwMjYvNi85IDE4OjMzLCBDaHJpc3RpYW4gS8O2bmlnIOWGmemBkzoKPj4+Pj4gT24gNi85
LzI2IDA4OjEzLCBLYWl0YW8gQ2hlbmcgd3JvdGU6Cj4gCj4+Pj4+PiBUaGlzIHNlcmllcyBwcmVw
YXJlcyBmb3IsIGFuZCB0aGVuIHVwZGF0ZXMsIHRoZSBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkKPj4+
Pj4+IGZhbWlseSBzbyB0aGUgY29tbW9uIGVudHJ5IGl0ZXJhdG9ycyBjYWNoZSB0aGVpciBuZXh0
IG9yIHByZXZpb3VzIGN1cnNvcgo+Pj4+Pj4gYmVmb3JlIHRoZSBsb29wIGJvZHkgcnVucy4KPj4+
Pj4KPj4+Pj4gV2h5IGluIHRoZSB3b3JsZCB3b3VsZCB3ZSB3YW50IHRvIGRvIHRoYXQ/Cj4+Pj4+
Cj4+Pj4+IFRoZSBzYWZlIGFuZCBub24tc2FmZSB2YXJpYW50cyBoYXZlIHZlcnkgZGlzdGluY3Qg
dXNlIGNhc2VzIGFuZCB0aGF0IGlzIGNvbXBsZXRlbHkgaW50ZW50aW9uYWwuCj4+Pj4+Cj4+Pj4+
IFdoYXQgd2UgY291bGQgaW1wcm92ZSBtYXliZSBpcyB0aGUgZG9jdW1lbnRhdGlvbiwgZnJvbSBt
eSBleHBlcmllbmNlIGFuIGFzdG9uaXNoaW5nIGxhcmdlIGFtb3VudCBvZiBwZW9wbGUgaGF2ZSBt
aXNjb25jZXB0aW9ucyBhYm91dCB0aGUgc2FmZSB2YXJpYW50cy4KPj4+Pj4KPj4+Pj4+IFRoZSBm
aXJzdCAxMyBwYXRjaGVzIG9wZW4tY29kZSBsb29wcyB0aGF0IGludGVudGlvbmFsbHkgZGVwZW5k
IG9uIHRoZQo+Pj4+Pj4gb2xkICJkZXJpdmUgdGhlIG5leHQgZW50cnkgZnJvbSB0aGUgY3VycmVu
dCBjdXJzb3IgYXQgdGhlIGVuZCBvZiB0aGUKPj4+Pj4+IGl0ZXJhdGlvbiIgYmVoYXZpb3VyLiAg
VGhlc2UgbG9vcHMgYXBwZW5kIHdvcmsgdG8gdGhlIGxpc3QgYmVpbmcgd2Fsa2VkLAo+Pj4+Pj4g
cmVzdGFydCB0cmF2ZXJzYWwgYWZ0ZXIgZHJvcHBpbmcgYSBsb2NrLCBza2lwIGFuIGVudHJ5IGNv
bnN1bWVkIGJ5IHRoZQo+Pj4+Pj4gY3VycmVudCBpdGVyYXRpb24sIG9yIG90aGVyd2lzZSBhZGp1
c3QgdGhlIGN1cnNvciBpbiB0aGUgbG9vcCBib2R5Lgo+Pj4+Pgo+Pj4+PiBXZWxsIEkgaGF2ZSB0
byBjbGVhcmx5IHJlamVjdCB0aGUgY2hhbmdlcyBmb3Igc3Vic3lzdGVtcy9jb21wb25lbnRzIEkn
bSBtYWludGFpbmluZywgdGhhdCBqdXN0IGxvb2tzIGhvcnJpYmxlIHRvIG1lIGFuZCBJIGNsZWFy
bHkgZG9uJ3Qgc2VlIGEgZ29vZCByZWFzb24gZm9yIHRoYXQuCj4+Pj4KPj4+PiBIaSBDaHJpc3Rp
YW4gYW5kIEFuZHkgU2hldmNoZW5rbywKPj4+Pgo+Pj4+IFRoYW5rcyBmb3IgdGFraW5nIGEgbG9v
ay4gSSB3b3VsZCBsaWtlIHRvIGNsYXJpZnkgdGhlIHBvaW50IHlvdSByYWlzZWQuCj4+Pj4KPj4+
PiBUaGUgcmVhc29uIEkgc3RhcnRlZCBsb29raW5nIGF0IHRoaXMgaXMgdGhlIG9yaWdpbmFsIG1v
dGl2YXRpb24gYmVoaW5kCj4+Pj4gdGhlIF9zYWZlKCkgdmFyaWFudHMuICBUaGV5IGV4aXN0IGJl
Y2F1c2Ugc29tZSB1c2VycyBuZWVkIHRvIHJlbW92ZSwgbW92ZQo+Pj4+IG9yIG90aGVyd2lzZSBj
b25zdW1lIHRoZSBjdXJyZW50IGVudHJ5IHdoaWxlIHdhbGtpbmcgdGhlIGxpc3QuICBJbiB0aGF0
Cj4+Pj4gY2FzZSB0aGUgbmV4dCBjdXJzb3IgaGFzIHRvIGJlIHByZXNlcnZlZCBiZWZvcmUgdGhl
IGxvb3AgYm9keSBjYW4gbW9kaWZ5Cj4+Pj4gdGhlIGN1cnJlbnQgZW50cnkuCj4+Pj4KPj4+PiBU
aGUgdW5mb3J0dW5hdGUgcGFydCBpcyB0aGF0IHRoaXMgY291bGQgbm90IGJlIGV4cHJlc3NlZCB3
aXRoIHRoZQo+Pj4+IGV4aXN0aW5nIGxpc3RfZm9yX2VhY2hfZW50cnkoKSBpbnRlcmZhY2Ugd2l0
aG91dCBjaGFuZ2luZyBpdHMgY2FsbGluZwo+Pj4+IGNvbnZlbnRpb24uICBUaGUgX3NhZmUoKSB2
YXJpYW50cyBoYWQgdG8gZ3JvdyBhbiBleHRyYSBhcmd1bWVudCBmb3IgdGhlCj4+Pj4gdGVtcG9y
YXJ5IGN1cnNvciwgYW5kIHRoYXQgaXMgd2h5IHdlIGVuZGVkIHVwIHdpdGggYSBzZXBhcmF0ZSBm
YW1pbHkgb2YKPj4+PiBtYWNyb3MuCj4+Pj4KPj4+PiBCdXQgY29uY2VwdHVhbGx5LCB0aGUgZGlz
dGluY3Rpb24gZG9lcyBub3QgaGF2ZSB0byBiZSBleHBvc2VkIGFzIHR3bwo+Pj4+IGRpZmZlcmVu
dCBpdGVyYXRvciBmYW1pbGllcyBmb3JldmVyLiAgVGhlIGRpZmZlcmVuY2UgaXMgYW4gaW1wbGVt
ZW50YXRpb24KPj4+PiBkZXRhaWw6IHdoZXRoZXIgdGhlIGl0ZXJhdG9yIGtlZXBzIHRoZSBuZXh0
L3ByZXZpb3VzIGN1cnNvciBiZWZvcmUgdGhlCj4+Pj4gYm9keSBydW5zLiAgVGhpcyBzZXJpZXMg
bWFrZXMgdGhlIGNvbW1vbiBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkgaXRlcmF0b3JzCj4+Pj4gZG8g
dGhhdCBpbnRlcm5hbGx5LCBzbyB0aGUgc2FmZSBhbmQgbm9uLXNhZmUgZm9ybXMgY2FuIGVmZmVj
dGl2ZWx5IGJlCj4+Pj4gZm9sZGVkIHRvZ2V0aGVyLCBvciBhdCBsZWFzdCB0aGUgbmVlZCBmb3Ig
YSBzZXBhcmF0ZSBwdWJsaWMgX3NhZmUoKQo+Pj4+IGludGVyZmFjZSBiZWNvbWVzIG11Y2ggd2Vh
a2VyLgo+Pj4+Cj4+Pj4gVGhlcmUgaXMgYWxzbyBhIHVzYWJpbGl0eSBpc3N1ZSB3aXRoIHRoZSBj
dXJyZW50IF9zYWZlKCkgaW50ZXJmYWNlLiAgVGhlCj4+Pj4gY2FsbGVyIGlzIGZvcmNlZCB0byBk
ZWZpbmUgYSB0ZW1wb3JhcnkgY3Vyc29yIG91dHNpZGUgdGhlIG1hY3JvIGFuZCBwYXNzCj4+Pj4g
aXQgaW4sIGV2ZW4gdGhvdWdoIGFsbW9zdCBhbGwgdXNlcnMgbmV2ZXIgdXNlIHRoYXQgY3Vyc29y
IGRpcmVjdGx5LiAgSXQgaXMKPj4+PiBqdXN0IGJvaWxlcnBsYXRlIHJlcXVpcmVkIGJ5IHRoZSBt
YWNybyBpbXBsZW1lbnRhdGlvbi4gIEkgZmluZCB0aGF0Cj4+Pj4gcmVkdW5kYW50IGFuZCBhd2t3
YXJkOiB0aGUgdGVtcG9yYXJ5IGN1cnNvciBpcyBhbiBpbnRlcm5hbCBkZXRhaWwgb2YgdGhlCj4+
Pj4gaXRlcmF0aW9uLCBidXQgZXZlcnkgY2FsbGVyIGhhcyB0byBzcGVsbCBpdCBvdXQuCj4+Pgo+
Pj4gQWgsIEkgdGhpbmsgdGhlIGRpc3RpbmN0IG1hY3JvIGZhbWlsaWVzIGlzIHRoYXQgd2hhdCB3
ZSB3YW50Lgo+Pj4gQnV0IHRoZSBoaWRpbmcgb2YgdGhlIHBhcmFtZXRlciBjYW4gYmUgZG9uZSBp
bnNpZGUgbGlzdF9mb3JfZWFjaF8qX3NhZmUoKS4KPj4+IFlvdSBjYW4gZG8gYSB0cmVld2lkZSBj
aGFuZ2Ugd2l0aCBjb2NjaW5lbGxlLgo+Pj4KPj4+IFNvcnJ5IGlmIEkgZGlkbid0IGdldCB0aGUg
d2hvbGUgaWRlYSBmcm9tIHlvdXIgcHJldmlvdXMgY29udHJpYnV0aW9ucy4KPj4+Cj4+PiBOb3Rl
LCBldmVuIGNhc2VzIHRoYXQgd291bGQgbmVlZCBhIHRlbXBvcmFyeSBjdXJzb3IgbWF5IGJlIHN3
aXRjaGVkIHRvCj4+PiBuZXcgbGlzdF9mb3JfZWFjaF8qX3NhZmUoKSwgc2VlIGhvdyBQQ0kgbWFj
cm9zIGZvciBpdGVyYXRpbmcgb3ZlciByZXNvdXJjZXMKPj4+IGFyZSBpbXBsZW1lbnRlZCAoaW5j
bHVkZS9saW51eC9wY2kuaCkuCj4+Cj4+IFRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9ucy4gSSd2
ZSB3cml0dGVuIGEgZGVtbyBiYXNlZCBvbiB5b3VyIGZlZWRiYWNrLgo+PiBDb3VsZCB5b3UgcGxl
YXNlIHJldmlldyBpdCBhbmQgc2hhcmUgeW91ciB0aG91Z2h0cyBvbiB0aGlzIGFwcHJvYWNoPwo+
IAo+IEhhdmUgeW91IGNoZWNrZWQgaG93IG1hbnkgdXNlcnMgYWN0dWFsbHkgbmVlZCB0aGUgdGVt
cG9yYXJ5IHN0b3JhZ2U/CgpJbiBNdWNodW4ncyByZXBseSwgaGUgbWVudGlvbmVkIHRoZSBmb2xs
b3dpbmc6CgpUaGVyZSBhcmUgOSw5MjUgbGlzdF9mb3JfZWFjaF9lbnRyeSgpIGNhbGwgc2l0ZXMg
aW4gdG90YWwuIEFtb25nIHRoZW0sCjksOTE5IGRvIG5vdCByZXF1aXJlIGFueSBhZGFwdGF0aW9u
LCBhbmQgb25seSA2IG5lZWQgdG8gYmUgcmVmYWN0b3JlZDoKCkFzIGZvciBsaXN0X2Zvcl9lYWNo
X2VudHJ5X3NhZmUoKSwgdGhlcmUgYXJlIDQsNTcyIGNhbGxlcnMuIDQsNTUwIG9mIHRoZW0KY2Fu
IGJlIGRpcmVjdGx5IHJlcGxhY2VkIGJ5IHRoZSBuZXcgbGlzdF9mb3JfZWFjaF9lbnRyeSgpLCB3
aGlsZSAyMiBjYW5ub3QKYmUgcmVwbGFjZWQKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
QjNCRkExRS0wOEI4LTQyQUItODdENi1BMjhCRjE1RTVDNThAbGludXguZGV2LwoKCkkgb25seSB1
c2VkIENvY2NpbmVsbGUgdG8gc2NhbiBmb3IgbGlzdF9mb3JfZWFjaF9lbnRyeSgpIGNhbGwgc2l0
ZXMsIGFuZApmb3VuZCB0aGUgMTMgY2FsbCBzaXRlcyBzaG93biBpbiB0aGUgY3VycmVudCBwYXRj
aCBzZXJpZXMsIHdoaWNoIGNvdmVyCnRoZSA2IGNhc2VzIG1lbnRpb25lZCBpbiBNdWNodW4ncyBl
bWFpbC4gSSBoYXZlIG5vdCB5ZXQgcnVuIHRoZSBDb2NjaW5lbGxlCnNjYW4gZm9yIGxpc3RfZm9y
X2VhY2hfZW50cnlfc2FmZSgpLgoKSWYgd2UgbmVlZCB0byBoYW5kbGUgYWxsIDksOTI1IGxpc3Rf
Zm9yX2VhY2hfZW50cnkoKSBjYWxsIHNpdGVzIG9yIGFsbCA0LDU3MgpsaXN0X2Zvcl9lYWNoX2Vu
dHJ5X3NhZmUoKSBjYWxsIHNpdGVzIGluIG9uZSBnbywgd291bGQgc3VjaCBhIGNoYW5nZSBiZSB0
b28KbGFyZ2U/IEkgZXhwZWN0IGl0IHdvdWxkIGFmZmVjdCBhbG1vc3QgZXZlcnkga2VybmVsIHN1
YnN5c3RlbS4KCkkgd29uZGVyIHdoZXRoZXIgaXQgd291bGQgYmUgYmV0dGVyIHRvIGZpcnN0IHBy
b3ZpZGUgdGhlIG5lY2Vzc2FyeQpjb21wYXRpYmlsaXR5IEFQSXMsIGFuZCB0aGVuIGxldCBlYWNo
IHN1YnN5c3RlbSBvd25lciB1cGRhdGUgdGhlaXIgY29kZSBhcwphcHByb3ByaWF0ZS4gVGhhdCB3
b3VsZCBtYWtlIHRoZSBpbXBhY3QgbW9yZSBjb250cm9sbGVkLCBzaW1pbGFyIHRvIGhvdwp0aGUg
Y3VycmVudCBmb2xpbyByZXBsYWNlbWVudCBvZiBwYWdlIGlzIGJlaW5nIGhhbmRsZWQuCgo+Pj4+
IFdpdGggdGhlIHVwZGF0ZWQgbGlzdF9mb3JfZWFjaF9lbnRyeSgpIGltcGxlbWVudGF0aW9uLCB0
aGF0IGV4dHJhIGN1cnNvcgo+Pj4+IGNhbiBiZSBrZXB0IGluc2lkZSB0aGUgaXRlcmF0b3IgaXRz
ZWxmLiAgQ2FsbGVycyB0aGF0IG9ubHkgd2FudCB0byB3YWxrCj4+Pj4gdGhlIGxpc3QsIGluY2x1
ZGluZyBjYWxsZXJzIHRoYXQgZGVsZXRlIG9yIGNvbnN1bWUgdGhlIGN1cnJlbnQgZW50cnksIG5v
Cj4+Pj4gbG9uZ2VyIG5lZWQgdG8gY2FycnkgYW4gb3RoZXJ3aXNlLXVudXNlZCB0ZW1wb3Jhcnkg
dmFyaWFibGUganVzdCB0byBtYWtlCj4+Pj4gdGhlIG1hY3JvIHdvcmsuCj4+Pj4KPj4+Pj4+IFRo
ZSBmaW5hbCBwYXRjaCBjaGFuZ2VzIGluY2x1ZGUvbGludXgvbGlzdC5oIHRvIGtlZXAgYSBwcml2
YXRlIGN1cnNvciBpbgo+Pj4+Pj4gdGhlIGNvbW1vbiBlbnRyeSBpdGVyYXRvcnMgd2hpbGUgcHJl
c2VydmluZyB0aGUgcHVibGljIG1hY3JvIGludGVyZmFjZS4KPj4+Pj4+IFRoZSBzYWZlIHZhcmlh
bnRzIHJlbWFpbiBhdmFpbGFibGUgd2hlbiBjYWxsZXJzIG5lZWQgdGhlIHRlbXBvcmFyeQo+Pj4+
Pj4gY3Vyc29yIGV4cGxpY2l0bHkgb3IgaGF2ZSBzdHJvbmdlciBtdXRhdGlvbiByZXF1aXJlbWVu
dHMuCj4gCgotLSAKVGhhbmtzCkthaXRhbyBDaGVuZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
