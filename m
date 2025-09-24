Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E35B9BE64
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Sep 2025 22:26:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 208D5C3F942;
	Wed, 24 Sep 2025 20:26:44 +0000 (UTC)
Received: from fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 (fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 [3.74.81.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C074CC3F940
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Sep 2025 20:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
 t=1758745602; x=1790281602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4vb6NSqQR6ex3kWRbhDvcIC1XoiVTA7hMRv6Rl9gJRM=;
 b=m9085y1tqVAiYpK+Nof36aAx5vZroz9LSMQ1x1xEWzmrtu73IEeA1QkG
 9JYquPXlpm7dMGuWWTwssN5plKu7b1sOjQSJ25D1/GJlrMWbIoDw5NnQZ
 uYjBgiBMOHhSgTSHJrTj95y4kdBsteClTRvzrgAzHYi9H9+z6RqV83pId
 54Jqjn2r8qw+Yf7Wm3ngBUoOKxTlUxwzCkLW0uOuOREJbrR7bBYVKSCcN
 y3Rcml7nhlAnwhx9qqJj05A/IT8DMglY18rPpVRQPXzM9GZlmdygjYXuB
 /kbxaHhYWfgZ3cN+Cf7pQAEL49FM75KmH1pNeAl/8fYt3DjYKZC2C93kj A==;
X-CSE-ConnectionGUID: KSlroWQQSc+ihUiRUBJ+3g==
X-CSE-MsgGUID: gfCEb1glRTqGoP173mso+w==
X-IronPort-AV: E=Sophos;i="6.18,291,1751241600"; 
   d="scan'208";a="2630045"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO
 smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
 by internal-fra-out-004.esa.eu-central-1.outbound.mail-perimeter.amazon.com
 with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 20:26:42 +0000
Received: from EX19MTAEUC001.ant.amazon.com [54.240.197.225:14599]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.33.43:2525]
 with esmtp (Farcaster)
 id c9fcc3bd-0233-4b5f-b450-8b9bff97bf11; Wed, 24 Sep 2025 20:26:42 +0000 (UTC)
X-Farcaster-Flow-ID: c9fcc3bd-0233-4b5f-b450-8b9bff97bf11
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Wed, 24 Sep 2025 20:26:34 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D018EUA004.ant.amazon.com (10.252.50.85) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Wed, 24 Sep 2025
 20:25:59 +0000
From: Eliav Farber <farbere@amazon.com>
To: <linux@armlinux.org.uk>, <richard@nod.at>,
 <anton.ivanov@cambridgegreys.com>, <johannes@sipsolutions.net>,
 <dave.hansen@linux.intel.com>, <luto@kernel.org>, <peterz@infradead.org>,
 <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <x86@kernel.org>,
 <hpa@zytor.com>, <tony.luck@intel.com>, <qiuxu.zhuo@intel.com>,
 <mchehab@kernel.org>, <james.morse@arm.com>, <rric@kernel.org>,
 <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <evan.quan@amd.com>, <james.qian.wang@arm.com>, <liviu.dudau@arm.com>,
 <mihail.atanassov@arm.com>, <brian.starkey@arm.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>, <jdelvare@suse.com>,
 <linux@roeck-us.net>, <linus.walleij@linaro.org>,
 <dmitry.torokhov@gmail.com>, <maz@kernel.org>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <agk@redhat.com>,
 <snitzer@kernel.org>, <dm-devel@redhat.com>, <rajur@chelsio.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <peppe.cavallaro@st.com>,
 <alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
 <mcoquelin.stm32@gmail.com>, <krzysztof.kozlowski@linaro.org>,
 <malattia@linux.it>, <hdegoede@redhat.com>, <markgross@kernel.org>,
 <artur.paszkiewicz@intel.com>, <jejb@linux.ibm.com>,
 <martin.petersen@oracle.com>, <sakari.ailus@linux.intel.com>,
 <gregkh@linuxfoundation.org>, <fei1.li@intel.com>, <clm@fb.com>,
 <josef@toxicpanda.com>, <dsterba@suse.com>, <jack@suse.com>, <tytso@mit.edu>, 
 <adilger.kernel@dilger.ca>, <dushistov@mail.ru>,
 <luc.vanoostenryck@gmail.com>, <rostedt@goodmis.org>, <mhiramat@kernel.org>,
 <pmladek@suse.com>, <senozhatsky@chromium.org>,
 <andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>,
 <minchan@kernel.org>, <ngupta@vflare.org>, <akpm@linux-foundation.org>,
 <yoshfuji@linux-ipv6.org>, <dsahern@kernel.org>, <pablo@netfilter.org>,
 <kadlec@netfilter.org>, <fw@strlen.de>, <jmaloy@redhat.com>,
 <ying.xue@windriver.com>, <andrii@kernel.org>, <mykolal@fb.com>,
 <ast@kernel.org>, <daniel@iogearbox.net>, <martin.lau@linux.dev>,
 <song@kernel.org>, <yhs@fb.com>, <john.fastabend@gmail.com>,
 <kpsingh@kernel.org>, <sdf@google.com>, <haoluo@google.com>,
 <jolsa@kernel.org>, <shuah@kernel.org>, <keescook@chromium.org>,
 <wad@chromium.org>, <willy@infradead.org>, <farbere@amazon.com>,
 <sashal@kernel.org>, <ruanjinjie@huawei.com>, <quic_akhilpo@quicinc.com>,
 <David.Laight@ACULAB.COM>, <herve.codina@bootlin.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-um@lists.infradead.org>, <linux-edac@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-hwmon@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <linux-sunxi@lists.linux.dev>, <linux-media@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-btrfs@vger.kernel.org>,
 <linux-ext4@vger.kernel.org>, <linux-sparse@vger.kernel.org>,
 <linux-mm@kvack.org>, <netfilter-devel@vger.kernel.org>,
 <coreteam@netfilter.org>, <tipc-discussion@lists.sourceforge.net>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <stable@vger.kernel.org>
Date: Wed, 24 Sep 2025 20:23:05 +0000
Message-ID: <20250924202320.32333-5-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250924202320.32333-1-farbere@amazon.com>
References: <20250924202320.32333-1-farbere@amazon.com>
MIME-Version: 1.0
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D037UWB002.ant.amazon.com (10.13.138.121) To
 EX19D018EUA004.ant.amazon.com (10.252.50.85)
Cc: Christoph Hellwig <hch@infradead.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [Linux-stm32] [PATCH 04/19 v6.1.y] minmax: fix indentation of
	__cmp_once() and __clamp_once()
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

[ Upstream commit f4b84b2ff851f01d0fac619eadef47eb41648534 ]

Remove the extra indentation and align continuation markers.

Link: https://lkml.kernel.org/r/bed41317a05c498ea0209eafbcab45a5@AcuMS.aculab.com
Signed-off-by: David Laight <david.laight@aculab.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 include/linux/minmax.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index 62b0c0a3cf30..2ec559284a9f 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -46,11 +46,11 @@
 #define __cmp(op, x, y)	((x) __cmp_op_##op (y) ? (x) : (y))
 
 #define __cmp_once(op, x, y, unique_x, unique_y) ({	\
-		typeof(x) unique_x = (x);		\
-		typeof(y) unique_y = (y);		\
-		static_assert(__types_ok(x, y),		\
-			#op "(" #x ", " #y ") signedness error, fix types or consider u" #op "() before " #op "_t()"); \
-		__cmp(op, unique_x, unique_y); })
+	typeof(x) unique_x = (x);			\
+	typeof(y) unique_y = (y);			\
+	static_assert(__types_ok(x, y),			\
+		#op "(" #x ", " #y ") signedness error, fix types or consider u" #op "() before " #op "_t()"); \
+	__cmp(op, unique_x, unique_y); })
 
 #define __careful_cmp(op, x, y)					\
 	__builtin_choose_expr(__is_constexpr((x) - (y)),	\
@@ -60,16 +60,16 @@
 #define __clamp(val, lo, hi)	\
 	((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
 
-#define __clamp_once(val, lo, hi, unique_val, unique_lo, unique_hi) ({	\
-		typeof(val) unique_val = (val);				\
-		typeof(lo) unique_lo = (lo);				\
-		typeof(hi) unique_hi = (hi);				\
-		static_assert(__builtin_choose_expr(__is_constexpr((lo) > (hi)), 	\
-				(lo) <= (hi), true),					\
-			"clamp() low limit " #lo " greater than high limit " #hi);	\
-		static_assert(__types_ok(val, lo), "clamp() 'lo' signedness error");	\
-		static_assert(__types_ok(val, hi), "clamp() 'hi' signedness error");	\
-		__clamp(unique_val, unique_lo, unique_hi); })
+#define __clamp_once(val, lo, hi, unique_val, unique_lo, unique_hi) ({		\
+	typeof(val) unique_val = (val);						\
+	typeof(lo) unique_lo = (lo);						\
+	typeof(hi) unique_hi = (hi);						\
+	static_assert(__builtin_choose_expr(__is_constexpr((lo) > (hi)), 	\
+			(lo) <= (hi), true),					\
+		"clamp() low limit " #lo " greater than high limit " #hi);	\
+	static_assert(__types_ok(val, lo), "clamp() 'lo' signedness error");	\
+	static_assert(__types_ok(val, hi), "clamp() 'hi' signedness error");	\
+	__clamp(unique_val, unique_lo, unique_hi); })
 
 #define __careful_clamp(val, lo, hi) ({					\
 	__builtin_choose_expr(__is_constexpr((val) - (lo) + (hi)),	\
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
