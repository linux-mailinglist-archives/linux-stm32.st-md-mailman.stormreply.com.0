Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U1NdK5f+J2p/6wIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 13:52:55 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4743165FAEA
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 13:52:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linux.dev header.s=key1 header.b=isl8KKJu;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linux.dev (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1593C9008D;
	Tue,  9 Jun 2026 11:52:54 +0000 (UTC)
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADD01C5F1F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2026 06:28:18 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1780986497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MR1hTzP95VNUKx7/pKpDVtm2601TjwJtZ4ASjUfdk1Y=;
 b=isl8KKJuAUNED6y7PqRYss/yrCZzRxABbNH7LLFjXBudV0mEVhbPjitoJS3k0/o1vcGfft
 s62so6ieDuNj/XVJ1vkk1Q7CcR4Ey2KkfWmakHlovNnr2LJm+7oGH2kB4IAdYCBbQxOFWn
 FuuaYym3pHtVPMmNAZdGoQnflBzoQlE=
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Muchun Song <muchun.song@linux.dev>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Jens Axboe <axboe@kernel.dk>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Eddie James <eajames@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 "Paul E . McKenney" <paulmck@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Date: Tue,  9 Jun 2026 14:25:20 +0800
Message-ID: <20260609062526.94907-6-kaitao.cheng@linux.dev>
In-Reply-To: <20260609062526.94907-1-kaitao.cheng@linux.dev>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
 <20260609062526.94907-1-kaitao.cheng@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 09 Jun 2026 11:52:48 +0000
Cc: dri-devel@lists.freedesktop.org, David Howells <dhowells@redhat.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com, drbd-dev@lists.linbit.com,
 Matthew Brost <matthew.brost@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kaitao Cheng <chengkaitao@kylinos.cn>, Matthew Auld <matthew.auld@intel.com>,
 Waiman Long <longman@redhat.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Kaitao Cheng <kaitao.cheng@linux.dev>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org, linux-sound@vger.kernel.org,
 linux-block@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Christian Brauner <brauner@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Subject: [Linux-stm32] [PATCH v2 08/14] spi: stm32-ospi: Open-code message
	transfer walk
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[linux.dev:s=key1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.dev : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:muchun.song@linux.dev,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:o-takashi@sakamocchi.jp,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:eajames@linux.ibm.com,m:broonie@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ldewangan@nvidia.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:dave@stgolabs.net,m:paulmck@kernel.org,m:josh@joshtriplett.org,m:peterz@infradead.org,m:mingo@redhat.com,m:will@kernel.org,m:boqun@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:dri-devel@lists.freedes
 ktop.org,m:dhowells@redhat.com,m:Laurent.pinchart@ideasonboard.com,m:linux1394-devel@lists.sourceforge.net,m:linux-stm32@st-md-mailman.stormreply.com,m:drbd-dev@lists.linbit.com,m:matthew.brost@intel.com,m:jernej.skrabec@gmail.com,m:chengkaitao@kylinos.cn,m:matthew.auld@intel.com,m:longman@redhat.com,m:luca.ceresoli@bootlin.com,m:kaitao.cheng@linux.dev,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:linux-sound@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:rdunlap@infradead.org,m:linux-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:akpm@linux-foundation.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,linux.dev,linbit.com,kernel.dk,sakamocchi.jp,intel.com,linaro.org,kernel.org,suse.de,gmail.com,ffwll.ch,ursulin.net,amd.com,linux.ibm.com,foss.st.com,nvidia.com,stgolabs.net,joshtriplett.org,infradead.org,redhat.com,perex.cz,suse.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,redhat.com,ideasonboard.com,lists.sourceforge.net,st-md-mailman.stormreply.com,lists.linbit.com,intel.com,gmail.com,kylinos.cn,bootlin.com,linux.dev,kwiboo.se,vger.kernel.org,lists.infradead.org,kernel.org,infradead.org,linux-foundation.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kaitao.cheng@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[kaitao.cheng@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,linux.dev:mid,linux.dev:from_mime,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4743165FAEA

From: Kaitao Cheng <chengkaitao@kylinos.cn>

A later change will make list_for_each_entry() cache the next element
before entering the loop body. stm32_ospi_transfer_one_message() can
consume the following transfer as part of the current operation and then
advance the loop cursor to that entry.

Keep the transfer walk open-coded so the loop step observes that cursor
update and skips the consumed transfer. This preserves the existing
message sequencing semantics and prepares the code for the list iterator
update.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 drivers/spi/spi-stm32-ospi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 4461c6e24b9e..4dc2b56b4c20 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -675,7 +675,9 @@ static int stm32_ospi_transfer_one_message(struct spi_controller *ctrl,
 
 	gpiod_set_value_cansleep(cs_gpiod, true);
 
-	list_for_each_entry(transfer, &msg->transfers, transfer_list) {
+	for (transfer = list_first_entry(&msg->transfers, typeof(*transfer), transfer_list);
+	     !list_entry_is_head(transfer, &msg->transfers, transfer_list);
+	     transfer = list_next_entry(transfer, transfer_list)) {
 		u8 dummy_bytes = 0;
 
 		memset(&op, 0, sizeof(op));
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
