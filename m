Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEofFExmdmkmQQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Jan 2026 19:51:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AEA81CD3
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Jan 2026 19:51:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B143C87ED5;
	Sun, 25 Jan 2026 18:51:55 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E45DDC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Jan 2026 18:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=1cYkOR6p+28OeK
 pILTeDYy1YUmgndRIsJrSEImzjWWs=; b=GUb3b+DY+9mJpJ7B3Rk9AyWsPIlsID
 gYiUHWLfH4MhylfpJpW6wK1EEp4qmRvMXufRAsUMyjw3n6a7jZTjlMDlAiAJeytr
 PDYusfLDkbrdpScgSILsNpYpTv9wxWk3n8sIRRm98T1X5yszKvRP0oq5bX6qilP5
 LjHLu7d1lAZJzkgT7s2l3Qa9JZdRes785y0OH4j4PHwtTrndA/aCfpLOjcH1lb4z
 BtZ0JoJOhdKJB5uQXdN4teK3yDzq+Q8ww2MIjkXg7v93zhNt8uES1joQCXP5zbLl
 u9kPE+ySeVYAst58JG+Fjj7CLKQTVDUGyLh4C9GbhtN1nhxaNB2QPgsw==
Received: (qmail 2369426 invoked from network); 25 Jan 2026 19:51:47 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 25 Jan 2026 19:51:47 +0100
X-UD-Smtp-Session: l3s3148p1@Xefl4TpJKhBtKXAW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Date: Sun, 25 Jan 2026 19:46:51 +0100
Message-ID: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Waiman Long <longman@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-omap@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Orson Zhai <orsonzhai@gmail.com>, David Lechner <dlechner@baylibre.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-sunxi@lists.linux.dev,
 Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-spi@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [RFC PATCH 0/4] hwspinlock: refactor headers into
	public provider/consumer pair
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[sang-engineering.com:s=k1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:nuno.sa@analog.com,m:wsa+renesas@sang-engineering.com,m:longman@redhat.com,m:dakr@kernel.org,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-omap@vger.kernel.org,m:corbet@lwn.net,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:jernej.skrabec@gmail.com,m:peterz@infradead.org,m:mingo@redhat.com,m:orsonzhai@gmail.com,m:dlechner@baylibre.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:srini@kernel.org,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:boqun.feng@gmail.com,m:linux-gpio@vger.kernel.org,m:broonie@kernel.org,m:baolin.wang@linux.alibaba.com,m:skhan@linuxfoundation.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:wilken.gottwalt@posteo.net,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:samuel@sholland.org,m:linux-spi@vger.kernel.org,m:tglx@kernel.org,m:mcoqueli
 n.stm32@gmail.com,m:rafael@kernel.org,m:linusw@kernel.org,m:jic23@kernel.org,m:wsa@sang-engineering.com,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,m:boqunfeng@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:-];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,analog.com,sang-engineering.com,redhat.com,kernel.org,st-md-mailman.stormreply.com,lwn.net,gmail.com,infradead.org,baylibre.com,lists.linux.dev,arndb.de,linux.alibaba.com,linuxfoundation.org,lists.infradead.org,posteo.net,sholland.org];
	NEURAL_HAM(-0.00)[-0.980];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D0AEA81CD3
X-Rspamd-Action: no action

TLDR: I want to create a hwspinlock provider outside of the hwspinlock
directory. So, I refactored the headers into a provider/consumer pair.
Which seems to me like a reasonable seperation anyhow. No functional
changes. My build tests went fine and buildbots are happy, too.

Longer explanation:

There is a device (MFIS) in newer Renesas SoCs which combines various
things like hwspinlocks, mailboxes and other stuff. Sadly, these are not
strictly separated. Registers are kind of mixed and its register
unprotection scheme will need one of its own locks. I tried various
paths to handle this device (MFD, auxiliary bus) but I concluded that
the sub-device dependencies give enough reasons for a single driver in
drivers/soc/. So, this series will allow me to instantiate a hwspinlock
provider from the other directory.

Patches 1+2 do the actual refactoring with a fallback being in place. I
used '-B' with git-format-patch in this RFC, so the actual changes are
more visible when the headers are moved.

Patch 3 converts all the users. There are not many. We could try to get
all the acks for this single patch. Or I can break it into single
patches and send them to subsystems. I don't mind.

Patch 4 simply removes the fallback.

Looking forward to comments on this approach. If the hwspinlock
maintainers like it as is, I would kindly propose to apply patches 1+2
after 7.0-rc1 comes out. This might sound a bit hasty, but a) I want to
avoid chasing a moving target and b) this would remove one dependency of
the hwspinlock driver I originally intend to upstream, of course.

I would take care of patches 3+4 as needed.

A branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-includes

Patches are based on linux-next as of 2026-01-21.

Opinions?

Thanks and happy hacking,

   Wolfram


Wolfram Sang (4):
  hwspinlock: refactor existing headers into provider.h
  hwspinlock: refactor existing headers into consumer.h
  treewide: convert hwspinlock users to the new consumer header file
  hwspinlock: remove old header file

 Documentation/locking/hwspinlock.rst          |  2 +-
 MAINTAINERS                                   |  2 +-
 drivers/base/regmap/regmap.c                  |  2 +-
 drivers/hwspinlock/hwspinlock_core.c          |  5 +--
 drivers/hwspinlock/omap_hwspinlock.c          |  4 +-
 drivers/hwspinlock/qcom_hwspinlock.c          |  4 +-
 drivers/hwspinlock/sprd_hwspinlock.c          |  4 +-
 drivers/hwspinlock/stm32_hwspinlock.c         |  4 +-
 drivers/hwspinlock/sun6i_hwspinlock.c         |  4 +-
 drivers/hwspinlock/u8500_hsem.c               |  5 +--
 drivers/iio/adc/sc27xx_adc.c                  |  2 +-
 drivers/irqchip/irq-stm32mp-exti.c            |  2 +-
 drivers/mfd/syscon.c                          |  2 +-
 drivers/nvmem/sc27xx-efuse.c                  |  2 +-
 drivers/nvmem/sprd-efuse.c                    |  2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c         |  2 +-
 drivers/soc/qcom/smem.c                       |  2 +-
 drivers/spi/spi-sprd-adi.c                    |  2 +-
 .../{hwspinlock.h => hwspinlock/consumer.h}   | 22 ++--------
 .../linux/hwspinlock/provider.h               | 40 ++++++++++++-------
 20 files changed, 49 insertions(+), 65 deletions(-)
 rename include/linux/{hwspinlock.h => hwspinlock/consumer.h} (94%)
 rename drivers/hwspinlock/hwspinlock_internal.h => include/linux/hwspinlock/provider.h (78%)

-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
