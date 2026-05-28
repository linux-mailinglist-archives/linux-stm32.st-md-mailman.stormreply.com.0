Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFyTKKk+GGo1hggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2026 15:10:01 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 357185F27BC
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2026 15:10:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0314C8F28E;
	Thu, 28 May 2026 13:10:00 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF1EAC87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2026 13:09:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A0AAC446C6;
 Thu, 28 May 2026 13:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A771F000E9;
 Thu, 28 May 2026 13:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779973798;
 bh=r0QrpkQCV7e0TWVW6fG/E9wzE1TJ4SiymmotkEZ+8oA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=FScYaL+nQtn59lt3XFAAA9o4Yg6kEl4brpFw1LEWS7IHxDUz4mtHZtTtzkom60O/I
 CkE+aQiTiJHwB3PdgrJ3kjmvauHOSobrvqXYrhhhhXyK7BA+MkznIG/BU2DyQtkFKR
 Lr3Y8UgujM5kp9B11rrCi5LFCc+kWInO+/aNjtG5B2Aa7xo7HyNgXnEwbxFJn4SEnS
 x31KCBgSewijLLjX6s4w2feHYNefrNyuvrdKt1sntsxdpMpZYXUpgPDDrqVfW55S0B
 r6eF+hFt6UGOJqgXbtviEa1MkTylc8TVYTV+kTRSYpzYCirZM9pbLqd5MBhHhNC7g8
 qAonuPStPCxVA==
Date: Thu, 28 May 2026 14:09:47 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: kernel test robot <lkp@intel.com>
Message-ID: <20260528140947.12c73152@jic23-huawei>
In-Reply-To: <202605281432.a64fe4iY-lkp@intel.com>
References: <20260525014654.2399354-1-dlechner@baylibre.com>
 <202605281432.a64fe4iY-lkp@intel.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>, chrome-platform@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jyoti Bhayana <jbhayana@google.com>, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, linux-iio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Guenter Roeck <groeck@chromium.org>,
 David Lechner <dlechner@baylibre.com>, Benson Leung <bleung@chromium.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: pressure: cros_ec_baro: simplify
 timestamp channel definition
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
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lkp@intel.com,m:andy@kernel.org,m:chrome-platform@lists.linux.dev,m:alexandre.belloni@bootlin.com,m:jbhayana@google.com,m:linux-kernel@vger.kernel.org,m:oe-kbuild-all@lists.linux.dev,m:nicolas.ferre@microchip.com,m:nuno.sa@analog.com,m:linux-iio@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:claudiu.beznea@tuxon.dev,m:groeck@chromium.org,m:dlechner@baylibre.com,m:bleung@chromium.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,bootlin.com,google.com,vger.kernel.org,microchip.com,analog.com,gmail.com,tuxon.dev,chromium.org,baylibre.com,st-md-mailman.stormreply.com,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.962];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 357185F27BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 28 May 2026 14:40:51 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi David,
> 
> kernel test robot noticed the following build errors:
> 
For the record, this is a side effect of some email trouble David had.
It's meant to be in a series with the patch that makes that macro
a compound literal.

> [auto build test ERROR on jic23-iio/togreg]
> [also build test ERROR on linus/master v7.1-rc5 next-20260527]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/iio-pressure-cros_ec_baro-simplify-timestamp-channel-definition/20260525-134550
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
> patch link:    https://lore.kernel.org/r/20260525014654.2399354-1-dlechner%40baylibre.com
> patch subject: [PATCH] iio: pressure: cros_ec_baro: simplify timestamp channel definition
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260528/202605281432.a64fe4iY-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281432.a64fe4iY-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605281432.a64fe4iY-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/iio/buffer.h:10,
>                     from drivers/iio/pressure/cros_ec_baro.c:9:
>    drivers/iio/pressure/cros_ec_baro.c: In function 'cros_ec_baro_probe':
> >> include/linux/iio/iio.h:356:38: error: expected expression before '{' token  
>      356 | #define IIO_CHAN_SOFT_TIMESTAMP(_si) {                                  \
>          |                                      ^
>    drivers/iio/pressure/cros_ec_baro.c:174:20: note: in expansion of macro 'IIO_CHAN_SOFT_TIMESTAMP'
>      174 |         *channel = IIO_CHAN_SOFT_TIMESTAMP(1);
>          |                    ^~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +356 include/linux/iio/iio.h
> 
> 00c5f80c2fad53 include/linux/iio/iio.h   Peter Rosin      2016-11-08  355  
> 07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12 @356  #define IIO_CHAN_SOFT_TIMESTAMP(_si) {					\
> 07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  357  	.type = IIO_TIMESTAMP,						\
> 07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  358  	.channel = -1,							\
> 07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  359  	.scan_index = _si,						\
> 07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  360  	.scan_type = {							\
> 07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  361  		.sign = 's',						\
> 07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  362  		.realbits = 64,					\
> 07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  363  		.storagebits = 64,					\
> 07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  364  		},							\
> 07d4655b410a4d include/linux/iio/iio.h   Jonathan Cameron 2013-11-12  365  }
> 1d892719e70e47 drivers/staging/iio/iio.h Jonathan Cameron 2011-05-18  366  
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
