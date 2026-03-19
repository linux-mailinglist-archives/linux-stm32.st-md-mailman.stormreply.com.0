Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCCzHzTXu2k4owIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 12:00:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 255362C9DC2
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 12:00:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9D8FC87ED3;
	Thu, 19 Mar 2026 11:00:03 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 046F3C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 11:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=KB81XvoxVzxPeO
 i/26wCRtiORDc5p8n0JHh4CTp/OTA=; b=PcDkGLK+SGUtnsfgW6hOFscnOGL+BT
 dKa1bQM2q3f+KMWLx51FbKecyKl3CTTGMdyGB6dqrwuL5JkEEudobAqxgeU6ZFMr
 Q/egIiyx6OHRYc21xA0Sg6RHS9duWIff1CFbEaPP2CfF36ozg9i4SuaRZ7MV6c5H
 eCWWVJZ5KtG2AIocqV87rCfe50t4kw5N3wmJEAYynvgH2nsxCmP0QR9PCNreuRFf
 mKmqzGl/3S3bTfYmXZSe0hhxeuBYswfqzt+swtd5l3aIkB5Df3owLfa84N3Fk1B2
 xEr2d5idm1V67Pg0LjLzpw4DgNEnINr8JKle2ffApkdPHx/l3cXj3/1g==
Received: (qmail 1099341 invoked from network); 19 Mar 2026 11:59:51 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 19 Mar 2026 11:59:51 +0100
X-UD-Smtp-Session: l3s3148p1@AI+1d15Nvt0gAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Date: Thu, 19 Mar 2026 11:59:22 +0100
Message-ID: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-iio@vger.kernel.org,
 Boqun Feng <boqun@kernel.org>, linux-remoteproc@vger.kernel.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Waiman Long <longman@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-omap@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Orson Zhai <orsonzhai@gmail.com>, Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 David Lechner <dlechner@baylibre.com>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH v5 00/15] hwspinlock: move device alloc into
	core and refactor includes
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
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[sang-engineering.com:s=k1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-iio@vger.kernel.org,m:boqun@kernel.org,m:linux-remoteproc@vger.kernel.org,m:nuno.sa@analog.com,m:wsa+renesas@sang-engineering.com,m:longman@redhat.com,m:dakr@kernel.org,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-omap@vger.kernel.org,m:corbet@lwn.net,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:jernej.skrabec@gmail.com,m:peterz@infradead.org,m:mingo@redhat.com,m:orsonzhai@gmail.com,m:wilken.gottwalt@posteo.net,m:dlechner@baylibre.com,m:konradybcio@kernel.org,m:linux-sunxi@lists.linux.dev,m:driver-core@lists.linux.dev,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:broonie@kernel.org,m:baolin.wang@linux.alibaba.com,m:skhan@linuxfoundation.org,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:samuel@sholland.org,m:linux-kernel@vger.kernel.org
 ,m:linux-spi@vger.kernel.org,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:rafael@kernel.org,m:linusw@kernel.org,m:jic23@kernel.org,m:wsa@sang-engineering.com,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[44];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.784];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,analog.com,sang-engineering.com,redhat.com,st-md-mailman.stormreply.com,lwn.net,gmail.com,infradead.org,posteo.net,baylibre.com,lists.linux.dev,arndb.de,linux.alibaba.com,linuxfoundation.org,lists.infradead.org,sholland.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 255362C9DC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes since v4:

* update Documentation, too, when ABI gets changed (Thanks Antonio!)
* rebased to 7.0-rc4
* added more tags (Thanks!)

My ultimate goal is to allow hwspinlock provider drivers outside of the
subsystem directory. It turned out that a simple split of the headers
files into a public provider and a public consumer header file is not
enough because core internal structures need to stay hidden. Even more,
their opaqueness could and should even be increased. That would also
allow the core to handle the de-/allocation of the hwspinlock device
itself.

This series does all that. Patches 1-2 remove the meanwhile unused
platform_data to ease further refactoring. Patches 3-9 abstract access
to internal structures away using helpers. Patch 10 then moves
hwspinlock device handling to the core, simplifying drivers. The
remaining patches refactor the headers until the internal one is gone
and the public ones are divided into provider and consumer parts. More
details are given in the patch descriptions.

One note about using a callback to initialize hwspinlock priv: I also
experimented with a dedicated 'set_priv' helper function. It felt a bit
clumsy to me. Drivers would need to save the 'bank' pointer again and
iterate over it. Because most drivers will only have a simple callback
anyhow, it looked leaner to me.

This series has been tested on a Renesas SparrowHawk board (R-Car V4H)
with a yet-to-be-upstreamed hwspinlock driver for the MFIS IP core. A
branch can be found here (without the MFIS driver currently):

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest

Build bots reported success.

Happy hacking,

   Wolfram

Wolfram Sang (15):
  hwspinlock: u8500: delete driver
  hwspinlock: remove now unused pdata from header file
  hwspinlock: add helpers to retrieve core data
  hwspinlock: add callback to fill private data of a hwspinlock
  hwspinlock: omap: use new callback to initialize hwspinlock priv
  hwspinlock: qcom: use new callback to initialize hwspinlock priv
  hwspinlock: sprd: use new callback to initialize hwspinlock priv
  hwspinlock: stm32: use new callback to initialize hwspinlock priv
  hwspinlock: sun6i: use new callback to initialize hwspinlock priv
  hwspinlock: handle hwspinlock device allocation in the core
  hwspinlock: move entries from internal to public header
  hwspinlock: remove internal header
  hwspinlock: sort include and update copyright
  hwspinlock: refactor provider.h from public header
  hwspinlock/treewide: refactor consumer.h from public header

 Documentation/locking/hwspinlock.rst          |   7 +-
 MAINTAINERS                                   |   3 +-
 drivers/base/regmap/regmap.c                  |   2 +-
 drivers/hwspinlock/Kconfig                    |  10 --
 drivers/hwspinlock/Makefile                   |   1 -
 drivers/hwspinlock/hwspinlock_core.c          | 129 +++++++++++----
 drivers/hwspinlock/hwspinlock_internal.h      |  72 --------
 drivers/hwspinlock/omap_hwspinlock.c          |  27 ++-
 drivers/hwspinlock/qcom_hwspinlock.c          |  69 ++++----
 drivers/hwspinlock/sprd_hwspinlock.c          |  39 ++---
 drivers/hwspinlock/stm32_hwspinlock.c         |  26 +--
 drivers/hwspinlock/sun6i_hwspinlock.c         |  36 ++--
 drivers/hwspinlock/u8500_hsem.c               | 155 ------------------
 drivers/iio/adc/sc27xx_adc.c                  |   2 +-
 drivers/irqchip/irq-stm32mp-exti.c            |   2 +-
 drivers/mfd/syscon.c                          |   2 +-
 drivers/nvmem/sc27xx-efuse.c                  |   2 +-
 drivers/nvmem/sprd-efuse.c                    |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32.c         |   2 +-
 drivers/soc/qcom/smem.c                       |   2 +-
 drivers/spi/spi-sprd-adi.c                    |   2 +-
 .../{hwspinlock.h => hwspinlock/consumer.h}   |  57 +------
 include/linux/hwspinlock/provider.h           |  60 +++++++
 23 files changed, 263 insertions(+), 446 deletions(-)
 delete mode 100644 drivers/hwspinlock/hwspinlock_internal.h
 delete mode 100644 drivers/hwspinlock/u8500_hsem.c
 rename include/linux/{hwspinlock.h => hwspinlock/consumer.h} (87%)
 create mode 100644 include/linux/hwspinlock/provider.h

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
