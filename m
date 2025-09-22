Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D600B90251
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 12:40:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01288C32E92;
	Mon, 22 Sep 2025 10:40:42 +0000 (UTC)
Received: from fra-out-009.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 (fra-out-009.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 [3.64.237.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D62CEC3087A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 10:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1758537640; x=1790073640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8djAgabF22BDsxfYcNFa72Q6mXnC3doUyHk+thXHzBc=;
 b=lQwXkvG1muZvBQ0rg6ITKPsAI5nFbNpPHnfoIi53q5TcOlpZqUswhXxf
 4j2maTyrbfyzc0KSTf9jmCcBHBwPERoMx5ranNUibtbAGEiTNsGApyQPm
 gbv59kVl9LowGXm7dr06qEIPzz8Hqe1zPwr35Aig3I1w3AGBby6/jvSXe
 Pl15u7AClfKrwN1K8WwSG4VpZIZVj86TlSEUV5fiFdE3KnEbRh7lBC6A8
 MzZx/9lbt2gi/lxRAiTWVAVXpcwjKG5SfqUifXPaD62LAP6yRWgV8FNbC
 qvIW2lVCbTtLm9om4QXCpDUrtmfdE/iHVm4wkdYVZdwcI00PO8Hp+2B/k g==;
X-CSE-ConnectionGUID: yPKUa6hNQIyWV81ZIlYO4w==
X-CSE-MsgGUID: Lb1CdkBpSKmBQFpgA4mZdw==
X-IronPort-AV: E=Sophos;i="6.18,284,1751241600"; 
   d="scan'208";a="2376821"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
 by internal-fra-out-009.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 10:40:40 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:3914]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.0.240:2525]
 with esmtp (Farcaster)
 id f9be43a7-3f48-4cdf-89db-ef1f9aebed8b; Mon, 22 Sep 2025 10:40:39 +0000 (UTC)
X-Farcaster-Flow-ID: f9be43a7-3f48-4cdf-89db-ef1f9aebed8b
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Mon, 22 Sep 2025 10:40:34 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D018EUA004.ant.amazon.com (10.252.50.85) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Mon, 22 Sep 2025
 10:40:08 +0000
From: Eliav Farber <farbere@amazon.com>
To: <richard@nod.at>, <anton.ivanov@cambridgegreys.com>,
 <johannes@sipsolutions.net>, <dave.hansen@linux.intel.com>,
 <luto@kernel.org>, <peterz@infradead.org>, <tglx@linutronix.de>,
 <mingo@redhat.com>, <bp@alien8.de>, <x86@kernel.org>, <hpa@zytor.com>,
 <tony.luck@intel.com>, <qiuxu.zhuo@intel.com>, <james.morse@arm.com>,
 <mchehab@kernel.org>, <rric@kernel.org>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <evan.quan@amd.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <jdelvare@suse.com>,
 <linux@roeck-us.net>, <linus.walleij@linaro.org>,
 <dmitry.torokhov@gmail.com>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
 <samuel@sholland.org>, <agk@redhat.com>, <snitzer@kernel.org>,
 <dm-devel@lists.linux.dev>, <mailhol.vincent@wanadoo.fr>,
 <wg@grandegger.com>, <mkl@pengutronix.de>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
 <mcoquelin.stm32@gmail.com>, <krzysztof.kozlowski@linaro.org>,
 <malattia@linux.it>, <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
 <markgross@kernel.org>, <artur.paszkiewicz@intel.com>, <jejb@linux.ibm.com>,
 <martin.petersen@oracle.com>, <sakari.ailus@linux.intel.com>,
 <gregkh@linuxfoundation.org>, <clm@fb.com>, <josef@toxicpanda.com>,
 <dsterba@suse.com>, <luc.vanoostenryck@gmail.com>, <rostedt@goodmis.org>,
 <mhiramat@kernel.org>, <pmladek@suse.com>,
 <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>,
 <senozhatsky@chromium.org>, <minchan@kernel.org>,
 <akpm@linux-foundation.org>, <dsahern@kernel.org>, <shuah@kernel.org>,
 <keescook@chromium.org>, <wad@chromium.org>, <farbere@amazon.com>,
 <David.Laight@ACULAB.COM>, <arnd@kernel.org>, <linux-um@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-hwmon@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-media@vger.kernel.org>, <linux-can@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-btrfs@vger.kernel.org>,
 <linux-sparse@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <bpf@vger.kernel.org>, <stable@vger.kernel.org>
Date: Mon, 22 Sep 2025 10:32:40 +0000
Message-ID: <20250922103241.16213-15-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922103241.16213-1-farbere@amazon.com>
References: <20250922103241.16213-1-farbere@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D040UWB004.ant.amazon.com (10.13.138.91) To
 EX19D018EUA004.ant.amazon.com (10.252.50.85)
Cc: Jens Axboe <axboe@kernel.dk>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Mateusz Guzik <mjguzik@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Pedro Falcato <pedro.falcato@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [Linux-stm32] [PATCH 14/15 6.6.y] minmax.h: simplify the variants
	of clamp()
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

From: David Laight <David.Laight@ACULAB.COM>

[ Upstream commit 495bba17cdf95e9703af1b8ef773c55ef0dfe703 ]

Always pass a 'type' through to __clamp_once(), pass '__auto_type' from
clamp() itself.

The expansion of __types_ok3() is reasonable so it isn't worth the added
complexity of avoiding it when a fixed type is used for all three values.

Link: https://lkml.kernel.org/r/8f69f4deac014f558bab186444bac2e8@AcuMS.aculab.com
Signed-off-by: David Laight <david.laight@aculab.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Pedro Falcato <pedro.falcato@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 include/linux/minmax.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index 75fb7a6ad4c6..2bbdd5b5e07e 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -183,29 +183,29 @@
 #define __clamp(val, lo, hi)	\
 	((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
 
-#define __clamp_once(val, lo, hi, uval, ulo, uhi) ({				\
-	__auto_type uval = (val);						\
-	__auto_type ulo = (lo);							\
-	__auto_type uhi = (hi);							\
+#define __clamp_once(type, val, lo, hi, uval, ulo, uhi) ({			\
+	type uval = (val);							\
+	type ulo = (lo);							\
+	type uhi = (hi);							\
 	BUILD_BUG_ON_MSG(statically_true(ulo > uhi),				\
 		"clamp() low limit " #lo " greater than high limit " #hi);	\
 	BUILD_BUG_ON_MSG(!__types_ok3(uval, ulo, uhi),				\
 		"clamp("#val", "#lo", "#hi") signedness error");		\
 	__clamp(uval, ulo, uhi); })
 
-#define __careful_clamp(val, lo, hi) \
-	__clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
+#define __careful_clamp(type, val, lo, hi) \
+	__clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
 
 /**
- * clamp - return a value clamped to a given range with strict typechecking
+ * clamp - return a value clamped to a given range with typechecking
  * @val: current value
  * @lo: lowest allowable value
  * @hi: highest allowable value
  *
- * This macro does strict typechecking of @lo/@hi to make sure they are of the
- * same type as @val.  See the unnecessary pointer comparisons.
+ * This macro checks @val/@lo/@hi to make sure they have compatible
+ * signedness.
  */
-#define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
+#define clamp(val, lo, hi) __careful_clamp(__auto_type, val, lo, hi)
 
 /**
  * clamp_t - return a value clamped to a given range using a given type
@@ -217,7 +217,7 @@
  * This macro does no typechecking and uses temporary variables of type
  * @type to make all the comparisons.
  */
-#define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
+#define clamp_t(type, val, lo, hi) __careful_clamp(type, val, lo, hi)
 
 /**
  * clamp_val - return a value clamped to a given range using val's type
@@ -230,7 +230,7 @@
  * type and @lo and @hi are literals that will otherwise be assigned a signed
  * integer type.
  */
-#define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
+#define clamp_val(val, lo, hi) __careful_clamp(typeof(val), val, lo, hi)
 
 /*
  * Do not check the array parameter using __must_be_array().
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
