Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DCEB90078
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 12:33:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51C97C32E92;
	Mon, 22 Sep 2025 10:33:50 +0000 (UTC)
Received: from fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 (fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 [63.176.194.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D1D3C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 10:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1758537228; x=1790073228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ripGF9rqnm7tHR7M3YpLJcXn9QY6D+OUp0N8RCNiC7M=;
 b=dQTXmu+z0lrEg3Bn43XStdFwBaVbobeKaL9/BxfHjUyL8S4Hxnaa4y9e
 +HIFvrDkcVYk6TI4nNXZJ/b0e6gsUYPISOnMw82QLvB1347MEP8hIfKBS
 u9pfXd2/Xpfasfx/aYduLql5gwZtNsco7661sPjoEIFNiE71XcBsfD3xP
 2I0Dv51qFxwRlnVB3edZTjHznF2wK8ImDhKKMrgEIWm/F/qwGVLa5VLfv
 E0SW4rRjxc7S+IQk6egWtejVoVx0EzQN6lH2u25DupviIkMn0IxY/kWOc
 L0qmAbKeGKjvFta9Hq4x9PR8d9ZOtSVUOuOPEzq156/tCape//zNcRZ7L A==;
X-CSE-ConnectionGUID: EfS0ySD4QuiodgYBvLgJ0Q==
X-CSE-MsgGUID: iJ0xXlIjTmGXhiqi3oxuFw==
X-IronPort-AV: E=Sophos;i="6.18,284,1751241600"; 
   d="scan'208";a="2475964"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
 by internal-fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 10:33:39 +0000
Received: from EX19MTAEUC002.ant.amazon.com [54.240.197.228:14817]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.23.64:2525]
 with esmtp (Farcaster)
 id 574fc1fc-5740-4523-a02e-399120b77f10; Mon, 22 Sep 2025 10:33:39 +0000 (UTC)
X-Farcaster-Flow-ID: 574fc1fc-5740-4523-a02e-399120b77f10
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Mon, 22 Sep 2025 10:33:39 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D018EUA004.ant.amazon.com (10.252.50.85) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Mon, 22 Sep 2025
 10:33:13 +0000
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
Date: Mon, 22 Sep 2025 10:32:27 +0000
Message-ID: <20250922103241.16213-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922103241.16213-1-farbere@amazon.com>
References: <20250922103241.16213-1-farbere@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D039UWB002.ant.amazon.com (10.13.138.79) To
 EX19D018EUA004.ant.amazon.com (10.252.50.85)
Cc: David Laight <David.Laight@aculab.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: [Linux-stm32] [PATCH 01/15 6.6.y] minmax: avoid overly complicated
	constant expressions in VM code
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

From: Linus Torvalds <torvalds@linux-foundation.org>

[ Upstream commit 3a7e02c040b130b5545e4b115aada7bacd80a2b6 ]

The minmax infrastructure is overkill for simple constants, and can
cause huge expansions because those simple constants are then used by
other things.

For example, 'pageblock_order' is a core VM constant, but because it was
implemented using 'min_t()' and all the type-checking that involves, it
actually expanded to something like 2.5kB of preprocessor noise.

And when that simple constant was then used inside other expansions:

  #define pageblock_nr_pages      (1UL << pageblock_order)
  #define pageblock_start_pfn(pfn)  ALIGN_DOWN((pfn), pageblock_nr_pages)

and we then use that inside a 'max()' macro:

	case ISOLATE_SUCCESS:
		update_cached = false;
		last_migrated_pfn = max(cc->zone->zone_start_pfn,
			pageblock_start_pfn(cc->migrate_pfn - 1));

the end result was that one statement expanding to 253kB in size.

There are probably other cases of this, but this one case certainly
stood out.

I've added 'MIN_T()' and 'MAX_T()' macros for this kind of "core simple
constant with specific type" use.  These macros skip the type checking,
and as such need to be very sparingly used only for obvious cases that
have active issues like this.

Reported-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Link: https://lore.kernel.org/all/36aa2cad-1db1-4abf-8dd2-fb20484aabc3@lucifer.local/
Cc: David Laight <David.Laight@aculab.com>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 include/linux/minmax.h          | 7 +++++++
 include/linux/pageblock-flags.h | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index 2ec559284a9f..a7ef65f78933 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -270,4 +270,11 @@ static inline bool in_range32(u32 val, u32 start, u32 len)
 #define swap(a, b) \
 	do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
 
+/*
+ * Use these carefully: no type checking, and uses the arguments
+ * multiple times. Use for obvious constants only.
+ */
+#define MIN_T(type,a,b) __cmp(min,(type)(a),(type)(b))
+#define MAX_T(type,a,b) __cmp(max,(type)(a),(type)(b))
+
 #endif	/* _LINUX_MINMAX_H */
diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
index e83c4c095041..a4bf7f0989b2 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -41,7 +41,7 @@ extern unsigned int pageblock_order;
  * Huge pages are a constant size, but don't exceed the maximum allocation
  * granularity.
  */
-#define pageblock_order		min_t(unsigned int, HUGETLB_PAGE_ORDER, MAX_ORDER)
+#define pageblock_order		MIN_T(unsigned int, HUGETLB_PAGE_ORDER, MAX_ORDER)
 
 #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
